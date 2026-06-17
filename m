Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6B744104F
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692842; cv=none; b=O0RH2iQAKLNysb3P3ztGI+Kx1UxqfEQZbK1CixBafadhngnyM4rEYC9QXTfKt4o5RPB8NIjLgtU43tXD7aN3i+6t8iLXFWAY/8MpZD5w38t+ldjklaa+8qHUsF7uT80SSJ9wPwKU9iB2gRDMzHjvcxUjUB4mLgbeWjBnh2M9a+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692842; c=relaxed/simple;
	bh=S6aLS5mgsSniYkFOaIn0mgYqQ7t9JX1w7TYL5UAjCLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IryDDUMlKwbDU3n1P9pN0MEHE39GKcAwi4Br6HSbuMF/TjUfcmWym+8iqzS9reDykvNm+NjDljt2G0J3PcMRXA8HW8rX5nWkwVGegu9r/SznQgZe6Ep+XzKL1fvGDmln6S3GYRD32p8ysbhnXU+hUbV+Y0RU7SU9/DXsrdbzd9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ncqd6pRy; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ncqd6pRy"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bbe98c3f0so2731688eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692840; x=1782297640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=;
        b=Ncqd6pRy1FsGtOpaoTf12COOfh+DLIDCyNlUCza4qg9ElB4sffucUYlSUhIX4B0E/i
         l+HUb9luUP6zsmdFKu7Qljb64YefQJUSvi7ux5UN1U4HhdilEpeloy32J/dUobCRIz3v
         esyxBqTNQLEE8gOuR3sRr0y9iM1oHBzSnhryHOT+UE2H7YkJmACr1FVvZCbAWHqNPo+X
         LyBJ5h+YpainumSRrAyS9E2rCz90tbJD9F57d3V6t1SDr6HgvAvgGeyLDuxGoBJc/ApN
         zClIgbODS1b9sQXVRS1olWuUlHPn7h+QgXP7imbb19XQv3SIxYzqww0ohpZkET63+iRz
         LZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692840; x=1782297640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmZWowZsE7bM9GZ+ZWjt4RBW+7kbsX1XtIvKLUOx1zA=;
        b=hbqx1Iv1UQqwPoIHKFv5ghox9NVdfuhQ+46DEsm0Uln+qyVEGdSvOO0L36GfSc3ieC
         rVqpD9gL6G1sx7yydsrmFKDwQntmbCiKEi7GbnJH8YBNREcyoeG4dLumFnzkecOuRDi4
         y26+F2C8zOSqds+jsqRLaiavMCXaGgbmdCDVfKG+fYm0upSjsKsJdMEGdkDMMLr7vWM/
         DjYrotgd6QbTsntN4OOs1Pr3mcsvq1HU36oIaW9E4ZN4qlgybN5tSNFE0nfXvP3wD0a8
         wQWeMtZwoRuqLvtJyH3nOoX335LA833MYGKx+bRx/WLnPSY83PfJERJNtsxD/Lo/4EDj
         5Y8g==
X-Forwarded-Encrypted: i=1; AFNElJ8Rqp8oNuVsbpHwB/RbLCpFPevkQopy6Nd6EKnurzZgPy2yTirASNdkjt+GryW5GZY9tbyVoA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv2VTow7UeOqqWBgtFvsh0HxRp1gGKHD8J1rs95S7KjFH7F5rd
	jF9iWI40sqvSsVxAiVpxRmhin+lZN5XgQJws5BfFeLwvOEuKVRO4uPEV
X-Gm-Gg: AfdE7cneR4Cw2/GcuJI+0E5AA/ZQ+dL6eUtdaFOihvzZakDPlUG1K7npKzZ9/bNbXyA
	o4beDR0Wfh83M03FfE9APUGQfUT3ZrnzjmFaBL8YNLK7jPJE1gM7CwUWV62d8oC2rj4C1/vNTS4
	PrkOkZ8Vbho9kG5TAxDtutNdBGlgo2M3KByKDZjwb1do14TrrFapVuy83tIYGZzPLngiQwo+q31
	Qc3ztzgw96PxE36AdH+ZaZiy/XHvCuLahiTLbCQPE+ba8zRuLkEz+nFaWXdKpFJaq3Z4Wi7biTy
	oVLGG0T5QY7iHCNKUpfiaSmkQcH4zFO8YUw/XpAKRIi1V2x9SfS5Zs1KFzbF1fHWgtrj67e8Yis
	muMAlAaBpd93eYEzqTrJywvbJPq49DbMfM09+caYpL/cmXKBtepOOYtG4AxCw0sbjYXegqhXc3q
	IGn5Edn3tj6UlxT0SBpnEoRH39CEGcNwIQEGvypaEhAV+TLdKofoUxbt0KJw==
X-Received: by 2002:a05:7300:a497:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-30bca0ed5a2mr1722160eec.29.1781692840150;
        Wed, 17 Jun 2026 03:40:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:39 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 49/78] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:06 +0700
Message-ID: <20260617103235.449609-50-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt712-sdca-sdw.c | 34 +++++++++++++++----------------
 sound/soc/codecs/rt712-sdca.c     |  7 ++-----
 2 files changed, 18 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 581732180473..066d15399bd9 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -277,7 +277,7 @@ static int rt712_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt712->disable_irq_lock);
+	guard(mutex)(&rt712->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt712->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -341,12 +341,9 @@ static int rt712_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt712->jack_detect_work, msecs_to_jiffies(30));
 
-	mutex_unlock(&rt712->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt712->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -428,13 +425,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt712_sdca->disable_irq_lock);
-	rt712_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt712_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt712_sdca->disable_irq_lock) {
+		rt712_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -456,14 +453,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt712->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt712->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 4796fce084ff..5db478633f17 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -79,7 +79,7 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	/* Set HP-JD source from JD1 */
@@ -126,7 +126,6 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_DIGITAL_MISC_CTRL4, 0x0010);
 
-	mutex_unlock(&rt712->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -403,7 +402,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +449,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

