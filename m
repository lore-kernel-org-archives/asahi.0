Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CC0404BC4
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692834; cv=none; b=GdtKKhnzvnU0Ut7e9dJrn6IeC2uTl0CSG5QutTYPE62dei/W33/ul56pEcTgVgQs6DWP44jT0JsjoT7Xs52gqkFLXuKtDNW28OuV6pKr8nHYQ28g6H22T4Vmo6V4DfKcl5Qxsl5xfoSOM9pEkfBg7DmsR4+kIaK8dxSAt7sn5T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692834; c=relaxed/simple;
	bh=9K7Wn9sctZkVTwUAOOJQWTkfDpWZPvgaq5hF1ovj7YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9Z19nXCEJQ/WT5Brr1NJehdDwxtzP6/xdZ7oYYAA1Vwpp/Xrp7kTDu7ENlaTYPrE7oiUH3bmFpSArMLg3ITC2o+mxFmDqGw5WmNRvXF7xnWTWCjc+HYqaekAJYXz3UfYCYNltPMoj8w+MNnQ4wykNAKY8Laykg6d5tfVXblKiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZhp9l6r; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZhp9l6r"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30bcf74e617so1422096eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692832; x=1782297632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqjTEpvOFZF2j3RKEWHFL7cl6NP9aT2PlVk1AtH2OzM=;
        b=SZhp9l6rmAfVHd0AVp/4OhlupjbgjXX1nbfTOr/ONuHgS68KTlgu67YR+wdpQhJ5Dp
         UAzAadUkCsAOTWskOKaTTSGpENlZdg6TC643CX8x+I+FKRhIrVvKZnWjko92xY5DXXad
         98tcTXP6uNch47mM96hQuQAPpU6GpiW5EBux0dhhJBR6f2ojnib3yrcZ12NxbayndYBb
         UN0UEDn3C5I4AYthAyD15njcMmyRqxP/YKL0VEX7hsjZ134QtVfhr64TXjF0j/2Rwn/T
         0qe8l7qttxyiROjeOz8Pgx8YcXU4eqlVCBEV5DRlVRa13KW1Q7/5tbBeJEY5RxxWve+6
         vvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692832; x=1782297632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oqjTEpvOFZF2j3RKEWHFL7cl6NP9aT2PlVk1AtH2OzM=;
        b=ln1ifhGsX7RPpdV4EAiYMP6serY5jTX9MBfZ8l59RYYHsJIs0hcGCrqIpohjJPf7xa
         GoIm23ZsJl/cO9oad9oOV4dZpLaLhpZrpBghgEv2VPT639NXxsWaZ5Ay3+73vAv6Ls39
         FxSUQxn49v+JlYmMIiKCcTnKfW57/MUaRiuRp9JrAyf6pQS+kXWhggnM5O/4dWNh9d55
         Znmn3v6v8vnZT5ERP3xVh2ijYmvqMKd5At5UuOVe1YoYPI4P97/kA8Q2ME6ZhUx8guPB
         OtRyZVhMC/M5d3B4Q1EFQ7rlc3eIPQFLGa/6Q+NTVOiW4MQWEJDgfMWtwTp8pwOUBaYV
         sgWQ==
X-Forwarded-Encrypted: i=1; AFNElJ955sHI3Xo06k+a+f/4fVM0l9/9RJ1kAY8oEjDcd2Od2UMVvWOXgyPqRnpg2VJbNKDevZGjfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPVi5Q3jr3dGyGmaTbXJ9jOyOnNmq05Q0WA51MAc0jhxY5dNAL
	PHB/x0EHsbdKQy4p3qAxSSTadScH4je/5AdN3AmgOQDYWTkkfY5zNG+X
X-Gm-Gg: AfdE7cn87FEBagsZ55V+1AnO3sdrVwz6s9xKEPDi1ktendKgY76nkuEdW+m173sq0cm
	6SDRzkofl5kV90DFGQS5dRU7iqcf+ktkSF0f1UwKu2fnmOmnAquV3Y910+RvvCoa8JgoTlivfgC
	jO2Y8g9Gmgz6aJMffKKoTbOonqsnCmTu8sPowmO38x/wjoQPdu58HSaLH5Nb5++WP5r81wPa+mh
	ClI8wxPjIy1pyeGA3PgcaavpA1hNn6/SEBuJiPO1XoN2nAqTn6rSIjKEsr2DlhmI4+dtLJJJabP
	fRu7A7ALAw2rrgCvIcJwNm2I3+2N9ygysn8/dxzjLIy096f4Utj2J24NvaVIswaJ65/zWoTR5wv
	ybm5zVChDUsYl1/HEd2TmMdQLx8B2pNikyjM+cEkIHhjcVSEZxdMxp16uAmgakkhYOmydMRdQMD
	O2rYN+AdM6SSN02DskT60XMI9ayaBIsqKNwUdwVEAEAldFxmLbsOG4ngB0OA==
X-Received: by 2002:a05:7300:f694:b0:304:8366:7456 with SMTP id 5a478bee46e88-30bc9cbd62dmr1978749eec.3.1781692831869;
        Wed, 17 Jun 2026 03:40:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:31 -0700 (PDT)
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
Subject: [PATCH 48/78] ASoC: codecs: rt711: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:05 +0700
Message-ID: <20260617103235.449609-49-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt711-sdca-sdw.c | 33 +++++++++++++++----------------
 sound/soc/codecs/rt711-sdca.c     |  7 ++-----
 sound/soc/codecs/rt711-sdw.c      | 23 +++++++++++----------
 sound/soc/codecs/rt711.c          | 19 ++++++++----------
 4 files changed, 37 insertions(+), 45 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index a8164fc3979a..3eb0b622a8ee 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -268,7 +268,7 @@ static int rt711_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt711->disable_irq_lock);
+	guard(mutex)(&rt711->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt711->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -332,12 +332,9 @@ static int rt711_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt711->jack_detect_work, msecs_to_jiffies(30));
 
-	mutex_unlock(&rt711->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt711->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -416,13 +413,13 @@ static int rt711_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt711_sdca->disable_irq_lock);
-	rt711_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt711_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt711_sdca->disable_irq_lock) {
+		rt711_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -444,13 +441,15 @@ static int rt711_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt711->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt711->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 3a26c782d800..906746a5fe69 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -107,7 +107,7 @@ static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	regmap_read(rt711->regmap, RT711_RC_CAL_STATUS, &val);
@@ -178,7 +178,6 @@ static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 	rt711_sdca_index_write(rt711, RT711_VENDOR_REG,
 		RT711_DIGITAL_MISC_CTRL4, 0x201b);
 
-	mutex_unlock(&rt711->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -450,7 +449,7 @@ static void rt711_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 {
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	if (rt711->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -515,8 +514,6 @@ static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 
 		dev_dbg(&rt711->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt711->calibrate_mutex);
 }
 
 static int rt711_sdca_set_jack_detect(struct snd_soc_component *component,
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index df3c43f2ab6b..9d5dff34de25 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -423,12 +423,11 @@ static int rt711_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt711->disable_irq_lock);
+	guard(mutex)(&rt711->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt711->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt711->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt711->disable_irq_lock);
 
 	return 0;
 }
@@ -510,11 +509,11 @@ static int rt711_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt711->disable_irq_lock);
-	rt711->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt711->disable_irq_lock);
+	scoped_guard(mutex, &rt711->disable_irq_lock) {
+		rt711->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
@@ -536,12 +535,12 @@ static int rt711_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+				rt711->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt711->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 5dbe9b67703e..5bc25663be09 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -89,7 +89,7 @@ static int rt711_calibration(struct rt711_priv *rt711)
 	struct regmap *regmap = rt711->regmap;
 	int ret = 0;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	regmap_write(rt711->regmap,
 		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
@@ -128,7 +128,6 @@ static int rt711_calibration(struct rt711_priv *rt711)
 
 	regmap_write(rt711->regmap,
 		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
 
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
@@ -362,7 +361,7 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt711->component);
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	/* power on */
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
@@ -450,7 +449,6 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
 			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
 }
 
 static int rt711_set_jack_detect(struct snd_soc_component *component,
@@ -511,7 +509,7 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	unsigned int read_ll, read_rl;
 	int i;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	/* Can't use update bit function, so read the original value first */
 	addr_h = mc->reg;
@@ -599,7 +597,6 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		regmap_write(rt711->regmap,
 				RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
-	mutex_unlock(&rt711->calibrate_mutex);
 	return 0;
 }
 
@@ -908,11 +905,11 @@ static int rt711_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		mutex_lock(&rt711->calibrate_mutex);
-		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE,
-			AC_PWRST_D3);
-		mutex_unlock(&rt711->calibrate_mutex);
+		scoped_guard(mutex, &rt711->calibrate_mutex) {
+			regmap_write(rt711->regmap,
+				RT711_SET_AUDIO_POWER_STATE,
+				AC_PWRST_D3);
+		}
 		break;
 
 	default:
-- 
2.43.0

