Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716863F58FB
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692412; cv=none; b=f5qi0qMbIPj1RSOCcbu6lppa+L1xIHptLMNoldNrhH3IunTJeyjv91ZR34CLomlLNWgQlJHoJesFaKvOHvX8CuiHDIMtCzg1nEmpo1wG8bIj2KUR9D5dTeVejqlxCoigDjcMDWqTlqvTyzDGoziXsHvc4wOhmtd4YNxeA8nkta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692412; c=relaxed/simple;
	bh=4HGyeH3q1nNn06K/SUZ+hB/bptaj2+qBs4d7eCvernQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hq8w8GJqDM3LwbYMHV+ms/P/STvpJ/HNoJr/a/WdiYpmRSAYU8UByxe067qiN5GIVIT7FaHYmqdVTN4MNcX5dHyZY6hhiI4bkeumFjbuwx0nye9D30FB2vGa0FKF/yrSWwdeCVSjSrT5Oh+iP4Fy7Z8ZBnpb9Dy+PnSP5esfoi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fD2/hQEM; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fD2/hQEM"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bcc877b4cso1620551eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692408; x=1782297208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPqL6V1iqK0+FGF4zW5M8iBT6jxKR4lxbeBDY9EaT9k=;
        b=fD2/hQEM+dVVVlc3hK3Wko1rPrpMwoBZPCG+iF8KhpbOC8p6tzW099wi0mySYwzVP2
         b8YMtO0aeebnHxqD4vbS3/5M9hgL4PMCU0jy+Q5M6mdg6Dsv0maSbCc8MTCVJ+1Ymumf
         wEQOZYBV42OhaTXKG0eckGeEcY4kFWB0LBV5GBp4IXO01SdXupOahEaaqDmSP9JmS0bq
         N4pgUNZVQRipH6v/THuAVx7iMeRa/smOb1L52/xH/xEQm8PrpLFv3TVY8/dE7pfsieGY
         Nzq8tIZanJI9D6iUcEHIm1WGdB4ColtzvoV7M4TV8fuTW7iMj22kIruUfcKmBYLbfY8P
         lfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692408; x=1782297208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VPqL6V1iqK0+FGF4zW5M8iBT6jxKR4lxbeBDY9EaT9k=;
        b=M2YHbyjK3u6BxD+8axp2G5Den6zdnvdvWiO7dZiVQbJCgtJX3Ulx6iXFO+LeAKi/4Y
         IGu3ZtBqiaBNN8zwbPTXmV94R4a5k4OE6TBAMbklSVZEd4QO9hzKgcHMc1O/PPN14snw
         3W57dbuacQCQ4Uwz9Zo0LgpvhKSeeTGhb1grUN92bTNWsuTICkBdWfjz122/BWgwhtcH
         y/Q+AuyYNj2wW1jtuLKqHGsq5rApWCmu5eutrnu8hs3B1tShk4bUx7LPWXr/QwrvWQZ4
         l0A1YI2sG/8A0uII/tMv9Jw/p/PS4iGyyNtTQrEW6l7zeyBOpVcEbSfkMQ3cZM0nrVum
         yFZw==
X-Forwarded-Encrypted: i=1; AFNElJ+QkzmJ+cFPh6vkyk2a1SEMdnW/2DCYtPvR1uvqSq+FVw+GTHpy1NvkJb5gL6vtDFtoPleu2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEgr0+HUURywg+yZYh07pi3g3SPigJPwdp9Ze6mXucGD4LCiv/
	1E2z8NgVWYm0Pad4sV7hMdQ4NSCxP2i4tnB/dph3vDNuWUwuBvjkUrJB
X-Gm-Gg: AfdE7cnQZkTH9rEFA5qg902S9ba66dtCLhyC5Y9g6dTXnmtg/Z/pLWgiUl1TqFc0kgZ
	7Kl0NlCR6147d6rGJp1GNJK9WsR+cHXrNHfeVm5dL07mDHlVWETib472EAs0u3u/KRMkkhns8RX
	5JFt5uN+wzoI0RpTwXthXq5Vb4ltYWUjO1ogWHfgAAKpuYff3nqoNA7R66GbiXSMS8Xic/Cgwgu
	YQM4j538swxwDwcrjP6c5NRP+Xm+WuTXRLDp6B3/Zk3OcGt2BVSuNS+wC+OCyDnEYe3hvM6Jh5q
	Xsmv0ZDp+c8j+fCal4/0rXABAXpfHJQ2QPZnfEqKoaZPEhyh9H6ACxD024hiK+Mh2Sn6TVpPXO3
	zSm3nQk+nBiICzp5YNPU1O+dZEkULxOlDmXolSd+DcAQPAnc0uippbw1wE2hTmSqEqYXRAMYxm5
	1qoLjTbcmv6y8QBN57IVftWFSQJ2edU5/YnGLtrOjhDOlwV7U=
X-Received: by 2002:a05:7301:100b:b0:2f1:6252:f8fe with SMTP id 5a478bee46e88-30bc9991ecbmr1870511eec.3.1781692408546;
        Wed, 17 Jun 2026 03:33:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:28 -0700 (PDT)
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
Subject: [PATCH 03/78] ASoC: codecs: arizona-jack: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:20 +0700
Message-ID: <20260617103235.449609-4-phucduc.bui@gmail.com>
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
 sound/soc/codecs/arizona-jack.c | 194 +++++++++++++++-----------------
 1 file changed, 92 insertions(+), 102 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index a9063bac2752..fc09b31943a6 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -528,12 +528,11 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 	int ret, reading, state, report;
 	bool mic = false;
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	/* If we got a spurious IRQ for some reason then ignore it */
 	if (!info->hpdet_active) {
 		dev_warn(arizona->dev, "Spurious HPDET IRQ\n");
-		mutex_unlock(&info->lock);
 		return IRQ_NONE;
 	}
 
@@ -546,7 +545,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 
 	ret = arizona_hpdet_read(info);
 	if (ret == -EAGAIN)
-		goto out;
+		return IRQ_HANDLED;
 	else if (ret < 0)
 		goto done;
 	reading = ret;
@@ -559,7 +558,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 
 	ret = arizona_hpdet_do_id(info, &reading, &mic);
 	if (ret == -EAGAIN)
-		goto out;
+		return IRQ_HANDLED;
 	else if (ret < 0)
 		goto done;
 
@@ -596,9 +595,6 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 	if (state)
 		info->hpdet_done = true;
 
-out:
-	mutex_unlock(&info->lock);
-
 	return IRQ_HANDLED;
 }
 
@@ -707,15 +703,13 @@ static void arizona_micd_timeout_work(struct work_struct *work)
 						struct arizona_priv,
 						micd_timeout_work.work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	dev_dbg(info->arizona->dev, "MICD timed out, reporting HP\n");
 
 	info->detecting = false;
 
 	arizona_identify_headphone(info);
-
-	mutex_unlock(&info->lock);
 }
 
 static int arizona_micd_adc_read(struct arizona_priv *info)
@@ -921,12 +915,11 @@ static void arizona_micd_detect(struct work_struct *work)
 
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 
 	/* If the cable was removed while measuring ignore the result */
 	if (!(info->jack->status & SND_JACK_MECHANICAL)) {
 		dev_dbg(arizona->dev, "Ignoring MICDET for removed cable\n");
-		mutex_unlock(&info->lock);
 		return;
 	}
 
@@ -936,7 +929,6 @@ static void arizona_micd_detect(struct work_struct *work)
 		arizona_button_reading(info);
 
 	pm_runtime_mark_last_busy(arizona->dev);
-	mutex_unlock(&info->lock);
 }
 
 static irqreturn_t arizona_micdet(int irq, void *data)
@@ -948,10 +940,10 @@ static irqreturn_t arizona_micdet(int irq, void *data)
 	cancel_delayed_work_sync(&info->micd_detect_work);
 	cancel_delayed_work_sync(&info->micd_timeout_work);
 
-	mutex_lock(&info->lock);
-	if (!info->detecting)
-		debounce = 0;
-	mutex_unlock(&info->lock);
+	scoped_guard(mutex, &info->lock) {
+		if (!info->detecting)
+			debounce = 0;
+	}
 
 	if (debounce)
 		queue_delayed_work(system_power_efficient_wq,
@@ -969,9 +961,8 @@ static void arizona_hpdet_work(struct work_struct *work)
 						struct arizona_priv,
 						hpdet_work.work);
 
-	mutex_lock(&info->lock);
+	guard(mutex)(&info->lock);
 	arizona_start_hpdet_acc_id(info);
-	mutex_unlock(&info->lock);
 }
 
 static int arizona_hpdet_wait(struct arizona_priv *info)
@@ -1013,6 +1004,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	struct arizona *arizona = info->arizona;
 	unsigned int val, present, mask;
 	bool cancelled_hp, cancelled_mic;
+	irqreturn_t ret_irq = IRQ_HANDLED;
 	int ret, i;
 
 	cancelled_hp = cancel_delayed_work_sync(&info->hpdet_work);
@@ -1020,110 +1012,108 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 
 	pm_runtime_get_sync(arizona->dev);
 
-	mutex_lock(&info->lock);
-
-	if (info->micd_clamp) {
-		mask = ARIZONA_MICD_CLAMP_STS;
-		present = 0;
-	} else {
-		mask = ARIZONA_JD1_STS;
-		if (arizona->pdata.jd_invert)
+	scoped_guard(mutex, &info->lock) {
+		if (info->micd_clamp) {
+			mask = ARIZONA_MICD_CLAMP_STS;
 			present = 0;
-		else
-			present = ARIZONA_JD1_STS;
-	}
+		} else {
+			mask = ARIZONA_JD1_STS;
+			if (arizona->pdata.jd_invert)
+				present = 0;
+			else
+				present = ARIZONA_JD1_STS;
+		}
 
-	ret = regmap_read(arizona->regmap, ARIZONA_AOD_IRQ_RAW_STATUS, &val);
-	if (ret) {
-		dev_err(arizona->dev, "Failed to read jackdet status: %d\n", ret);
-		mutex_unlock(&info->lock);
-		pm_runtime_put_autosuspend(arizona->dev);
-		return IRQ_NONE;
-	}
+		ret = regmap_read(arizona->regmap, ARIZONA_AOD_IRQ_RAW_STATUS, &val);
+		if (ret) {
+			dev_err(arizona->dev, "Failed to read jackdet status: %d\n", ret);
+			ret_irq = IRQ_NONE;
+			break;
+		}
 
-	val &= mask;
-	if (val == info->last_jackdet) {
-		dev_dbg(arizona->dev, "Suppressing duplicate JACKDET\n");
-		if (cancelled_hp)
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->hpdet_work,
-					   msecs_to_jiffies(HPDET_DEBOUNCE));
+		val &= mask;
+		if (val == info->last_jackdet) {
+			dev_dbg(arizona->dev, "Suppressing duplicate JACKDET\n");
+			if (cancelled_hp)
+				queue_delayed_work(system_power_efficient_wq,
+						   &info->hpdet_work,
+						   msecs_to_jiffies(HPDET_DEBOUNCE));
 
-		if (cancelled_mic) {
-			int micd_timeout = arizona->pdata.micd_timeout;
+			if (cancelled_mic) {
+				int micd_timeout = arizona->pdata.micd_timeout;
 
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->micd_timeout_work,
-					   msecs_to_jiffies(micd_timeout));
+				queue_delayed_work(system_power_efficient_wq,
+						   &info->micd_timeout_work,
+						   msecs_to_jiffies(micd_timeout));
+			}
+
+			goto out;
 		}
+		info->last_jackdet = val;
 
-		goto out;
-	}
-	info->last_jackdet = val;
+		if (info->last_jackdet == present) {
+			dev_dbg(arizona->dev, "Detected jack\n");
+			snd_soc_jack_report(info->jack, SND_JACK_MECHANICAL, SND_JACK_MECHANICAL);
 
-	if (info->last_jackdet == present) {
-		dev_dbg(arizona->dev, "Detected jack\n");
-		snd_soc_jack_report(info->jack, SND_JACK_MECHANICAL, SND_JACK_MECHANICAL);
+			info->detecting = true;
+			info->mic = false;
+			info->jack_flips = 0;
 
-		info->detecting = true;
-		info->mic = false;
-		info->jack_flips = 0;
+			if (!arizona->pdata.hpdet_acc_id) {
+				arizona_start_mic(info);
+			} else {
+				queue_delayed_work(system_power_efficient_wq,
+						   &info->hpdet_work,
+						   msecs_to_jiffies(HPDET_DEBOUNCE));
+			}
 
-		if (!arizona->pdata.hpdet_acc_id) {
-			arizona_start_mic(info);
+			if (info->micd_clamp || !arizona->pdata.jd_invert)
+				regmap_update_bits(arizona->regmap,
+						   ARIZONA_JACK_DETECT_DEBOUNCE,
+						   ARIZONA_MICD_CLAMP_DB |
+						   ARIZONA_JD1_DB, 0);
 		} else {
-			queue_delayed_work(system_power_efficient_wq,
-					   &info->hpdet_work,
-					   msecs_to_jiffies(HPDET_DEBOUNCE));
-		}
+			dev_dbg(arizona->dev, "Detected jack removal\n");
 
-		if (info->micd_clamp || !arizona->pdata.jd_invert)
-			regmap_update_bits(arizona->regmap,
-					   ARIZONA_JACK_DETECT_DEBOUNCE,
-					   ARIZONA_MICD_CLAMP_DB |
-					   ARIZONA_JD1_DB, 0);
-	} else {
-		dev_dbg(arizona->dev, "Detected jack removal\n");
+			arizona_stop_mic(info);
 
-		arizona_stop_mic(info);
+			info->num_hpdet_res = 0;
+			for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
+				info->hpdet_res[i] = 0;
+			info->mic = false;
+			info->hpdet_done = false;
+			info->hpdet_retried = false;
 
-		info->num_hpdet_res = 0;
-		for (i = 0; i < ARRAY_SIZE(info->hpdet_res); i++)
-			info->hpdet_res[i] = 0;
-		info->mic = false;
-		info->hpdet_done = false;
-		info->hpdet_retried = false;
-
-		snd_soc_jack_report(info->jack, 0, ARIZONA_JACK_MASK | info->micd_button_mask);
+			snd_soc_jack_report(info->jack, 0,
+					    ARIZONA_JACK_MASK | info->micd_button_mask);
 
-		/*
-		 * If the jack was removed during a headphone detection we
-		 * need to wait for the headphone detection to finish, as
-		 * it can not be aborted. We don't want to be able to start
-		 * a new headphone detection from a fresh insert until this
-		 * one is finished.
-		 */
-		arizona_hpdet_wait(info);
+			/*
+			 * If the jack was removed during a headphone detection we
+			 * need to wait for the headphone detection to finish, as
+			 * it can not be aborted. We don't want to be able to start
+			 * a new headphone detection from a fresh insert until this
+			 * one is finished.
+			 */
+			arizona_hpdet_wait(info);
 
-		regmap_update_bits(arizona->regmap,
-				   ARIZONA_JACK_DETECT_DEBOUNCE,
-				   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB,
-				   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB);
-	}
+			regmap_update_bits(arizona->regmap,
+					   ARIZONA_JACK_DETECT_DEBOUNCE,
+					   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB,
+					   ARIZONA_MICD_CLAMP_DB | ARIZONA_JD1_DB);
+		}
 
 out:
-	/* Clear trig_sts to make sure DCVDD is not forced up */
-	regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
-		     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
-		     ARIZONA_MICD_CLAMP_RISE_TRIG_STS |
-		     ARIZONA_JD1_FALL_TRIG_STS |
-		     ARIZONA_JD1_RISE_TRIG_STS);
-
-	mutex_unlock(&info->lock);
+		/* Clear trig_sts to make sure DCVDD is not forced up */
+		regmap_write(arizona->regmap, ARIZONA_AOD_WKUP_AND_TRIG,
+			     ARIZONA_MICD_CLAMP_FALL_TRIG_STS |
+			     ARIZONA_MICD_CLAMP_RISE_TRIG_STS |
+			     ARIZONA_JD1_FALL_TRIG_STS |
+			     ARIZONA_JD1_RISE_TRIG_STS);
+	}
 
 	pm_runtime_put_autosuspend(arizona->dev);
 
-	return IRQ_HANDLED;
+	return ret_irq;
 }
 
 /* Map a level onto a slot in the register bank */
-- 
2.43.0

