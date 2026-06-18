Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64C53E5A19
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780954; cv=none; b=UmQZ/QhKo+DuSype6vXfpjw3LZKiVGoz4Ek9eeVG/tT2PvjYBKCMHmb7C6Gkg+Fzx98UIEYJYUJZt30ntOSoTT0tpmfRkd08xGAQQWi8QCycn3gU5PXTEOLfQ8DhfG7KweMrYvbox/1fY5ml7ZqWcviB5g6ExlBPyHW/blLYi3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780954; c=relaxed/simple;
	bh=3E0oYCEwlGoTHVLT2ndS2LLf2pmJkjil2wL3dcAKZpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQNU042/tG/cPhdURmSaVm4t02xfiWeoKZSEWacwBc96EcdmVZWlqolrzqzDnnMejoPAz1pOe+vMVtUyfQWm06SosR0EXDS3tT5vX2rzrG44TGc+56J9XcGPVn8qEGOYD3fkZsPjKIYutydSA2P9FFKNBB81W7+TBNYdDSa6Pl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WW/4f53B; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WW/4f53B"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf3781ca51so7464025ad.0
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780952; x=1782385752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axVuWSvQLU0sCWrcKjBIoE0DndlsBbYi/hIzfZoQwIU=;
        b=WW/4f53Bxba3hCWuFWvccu6q/i+KvPZE19cPpaPizL2BwzpTPlQx2JgyuYKIXDc5GF
         BeL/VtaqHAyyZmPDEPhRM47G8pwVVVvktZlNZImKxuCW+h1eAtwq/hOXSejBBYEkuZLd
         XtK2Y3fOS+ktbY1qCRv+LdLminBatjBPEyiQbdDwaxKOMj5R22ZoObcNzPQ9Ym5ShofJ
         O8jLsbc240lxrsUKzz1anW4NLNWJHReDsT1OepkeqdU1YfAlzFYc3R4LOIwWr5zx56mj
         l1/sG5GzYMboKgfqDIECGYMQzXoCREaojpLkfxTCqrirKaI80wkkYd3mu5bKUnri51jT
         kmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780952; x=1782385752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=axVuWSvQLU0sCWrcKjBIoE0DndlsBbYi/hIzfZoQwIU=;
        b=QjrjZY9X90ymC+U135l631b8ZiH+knftN3qL0YihLIRTJDETFEc50toGVDx65Gzntx
         xKhIAR/kzYV55G6/eAmAJ7JAhUk6KlknLHIm/gALLzk+taju2KQ/VG4abEQKjkU24z8H
         x599B+91gAaLSPRLmYMFitMJyzhZkLWfS/XVvDo5GZCIwqZNGO9yOPxDkanC6jcf39c3
         N9vV76PNMhfGFFeixmSV5en6KKH7Jjub8PRXZmwoNk1EQmPywLbW+GNHX9isk6rv01zm
         WmfDsYfhz0f0oh/3TRix+CWjPKcOdQjsqALAVYGOe1cl5jatFZVCRkUUuuJO3emsgA5H
         H+WA==
X-Forwarded-Encrypted: i=1; AFNElJ/1/R0J1huGFtJUL/81wtgE45h0rMon86czBQEXOx8ojew1ZaUJ6MfGCHEx/KuiiGO5CgkW/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb0MkRLQ0lKM7frXdZZByRw8b7X6E+XXEq5rYSlwJkIstbdwZ3
	lTf2gu2QSY05g+9dlr7iMQN6myeTOzxkgAIThdzpDOhsQ6Vwbfb9KzdX
X-Gm-Gg: AfdE7cnuSSgXlRf3XFMxELUUP3/wyTIWyRxKovRZHnnIsGBnMXxSkDuV9Rd0cUADaG4
	NnUanJV17hMUDPFjAE2W5gxwlsS6Udel1LDUnp/I6zf2yOLc3wrKWk1VKthsCSbeg+foX3Y97wq
	iYxHR0vahk1cNPLfeWEl4l103KuIeoGpQRwSXnD/t3Vaqm7Zh2bBmlWGgAuVLHQUnHGCSHl6Onq
	XEjo4Ky/8mo39daSz5+zT7M3MlfCwpmOOfUGNEUmZohXrkae/5x5RJebFqkug1uUvdBmTKg2yxK
	+ib5+GrliaAbR1HH/CXz+KaY8FPYSo4+mfzcdil8CPME4ngnNDzmXxR2jssJm2Y8oKJ+dyAoOLE
	dP6J7ks6mBKY2Fift/ZSeUKLBeLqqt7xQOSQR8uFDvumCVBt6sr48TZgRuN8uKKYJhipq++d1PH
	LlCMCb673IV9nQoq1sK77KgNmSdCBidvAMjmX6JKNg14ha7/8=
X-Received: by 2002:a17:902:c945:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2c6e5155763mr34905555ad.19.1781780952097;
        Thu, 18 Jun 2026 04:09:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:11 -0700 (PDT)
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
Subject: [PATCH 59/78] ASoC: codecs: tlv320dac33: Use guard() for mutex & spin locks
Date: Thu, 18 Jun 2026 18:08:08 +0700
Message-ID: <20260618110827.232983-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tlv320dac33.c | 77 ++++++++++++++--------------------
 1 file changed, 31 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 223c49dfc450..85c42a4efbf7 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -236,13 +236,10 @@ static int dac33_write_locked(struct snd_soc_component *component, unsigned int
 			      unsigned int value)
 {
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&dac33->mutex);
-	ret = dac33_write(component, reg, value);
-	mutex_unlock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 
-	return ret;
+	return dac33_write(component, reg, value);
 }
 
 #define DAC33_I2C_ADDR_AUTOINC	0x80
@@ -365,13 +362,13 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 
 	/* Safety check */
 	if (unlikely(power == dac33->chip_power)) {
 		dev_dbg(component->dev, "Trying to set the same power state: %s\n",
 			power ? "ON" : "OFF");
-		goto exit;
+		return ret;
 	}
 
 	if (power) {
@@ -380,7 +377,7 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to enable supplies: %d\n", ret);
-			goto exit;
+			return ret;
 		}
 
 		if (dac33->reset_gpiod) {
@@ -388,7 +385,7 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 			if (ret < 0) {
 				dev_err(&dac33->i2c->dev,
 					"Failed to set reset GPIO: %d\n", ret);
-				goto exit;
+				return ret;
 			}
 		}
 
@@ -400,7 +397,7 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 			if (ret < 0) {
 				dev_err(&dac33->i2c->dev,
 					"Failed to set reset GPIO: %d\n", ret);
-				goto exit;
+				return ret;
 			}
 		}
 
@@ -409,14 +406,12 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to disable supplies: %d\n", ret);
-			goto exit;
+			return ret;
 		}
 
 		dac33->chip_power = 0;
 	}
 
-exit:
-	mutex_unlock(&dac33->mutex);
 	return ret;
 }
 
@@ -659,7 +654,6 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 {
 	struct snd_soc_component *component = dac33->component;
 	unsigned int delay;
-	unsigned long flags;
 
 	switch (dac33->fifo_mode) {
 	case DAC33_FIFO_MODE1:
@@ -667,10 +661,10 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 			DAC33_THRREG(dac33->nsample));
 
 		/* Take the timestamps */
-		spin_lock_irqsave(&dac33->lock, flags);
-		dac33->t_stamp2 = ktime_to_us(ktime_get());
-		dac33->t_stamp1 = dac33->t_stamp2;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			dac33->t_stamp2 = ktime_to_us(ktime_get());
+			dac33->t_stamp1 = dac33->t_stamp2;
+		}
 
 		dac33_write16(component, DAC33_PREFILL_MSB,
 				DAC33_THRREG(dac33->alarm_threshold));
@@ -682,11 +676,11 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 		break;
 	case DAC33_FIFO_MODE7:
 		/* Take the timestamp */
-		spin_lock_irqsave(&dac33->lock, flags);
-		dac33->t_stamp1 = ktime_to_us(ktime_get());
-		/* Move back the timestamp with drain time */
-		dac33->t_stamp1 -= dac33->mode7_us_to_lthr;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			dac33->t_stamp1 = ktime_to_us(ktime_get());
+			/* Move back the timestamp with drain time */
+			dac33->t_stamp1 -= dac33->mode7_us_to_lthr;
+		}
 
 		dac33_write16(component, DAC33_PREFILL_MSB,
 				DAC33_THRREG(DAC33_MODE7_MARGIN));
@@ -704,14 +698,12 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 static inline void dac33_playback_handler(struct tlv320dac33_priv *dac33)
 {
 	struct snd_soc_component *component = dac33->component;
-	unsigned long flags;
 
 	switch (dac33->fifo_mode) {
 	case DAC33_FIFO_MODE1:
 		/* Take the timestamp */
-		spin_lock_irqsave(&dac33->lock, flags);
-		dac33->t_stamp2 = ktime_to_us(ktime_get());
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock)
+			dac33->t_stamp2 = ktime_to_us(ktime_get());
 
 		dac33_write16(component, DAC33_NSAMPLE_MSB,
 				DAC33_THRREG(dac33->nsample));
@@ -735,7 +727,7 @@ static void dac33_work(struct work_struct *work)
 	dac33 = container_of(work, struct tlv320dac33_priv, work);
 	component = dac33->component;
 
-	mutex_lock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 	switch (dac33->state) {
 	case DAC33_PREFILL:
 		dac33->state = DAC33_PLAYBACK;
@@ -757,18 +749,15 @@ static void dac33_work(struct work_struct *work)
 		dac33_write(component, DAC33_FIFO_CTRL_A, reg);
 		break;
 	}
-	mutex_unlock(&dac33->mutex);
 }
 
 static irqreturn_t dac33_interrupt_handler(int irq, void *dev)
 {
 	struct snd_soc_component *component = dev;
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 
-	spin_lock_irqsave(&dac33->lock, flags);
-	dac33->t_stamp1 = ktime_to_us(ktime_get());
-	spin_unlock_irqrestore(&dac33->lock, flags);
+	scoped_guard(spinlock_irqsave, &dac33->lock)
+		dac33->t_stamp1 = ktime_to_us(ktime_get());
 
 	/* Do not schedule the workqueue in Mode7 */
 	if (dac33->fifo_mode != DAC33_FIFO_MODE7)
@@ -902,14 +891,13 @@ static int dac33_prepare_chip(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	mutex_lock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 
 	if (!dac33->chip_power) {
 		/*
 		 * Chip is not powered yet.
 		 * Do the init in the dac33_set_bias_level later.
 		 */
-		mutex_unlock(&dac33->mutex);
 		return 0;
 	}
 
@@ -1053,8 +1041,6 @@ static int dac33_prepare_chip(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	mutex_unlock(&dac33->mutex);
-
 	return 0;
 }
 
@@ -1156,16 +1142,15 @@ static snd_pcm_sframes_t dac33_dai_delay(
 	unsigned int time_delta, uthr;
 	int samples_out, samples_in, samples;
 	snd_pcm_sframes_t delay = 0;
-	unsigned long flags;
 
 	switch (dac33->fifo_mode) {
 	case DAC33_FIFO_BYPASS:
 		break;
 	case DAC33_FIFO_MODE1:
-		spin_lock_irqsave(&dac33->lock, flags);
-		t0 = dac33->t_stamp1;
-		t1 = dac33->t_stamp2;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			t0 = dac33->t_stamp1;
+			t1 = dac33->t_stamp2;
+		}
 		t_now = ktime_to_us(ktime_get());
 
 		/* We have not started to fill the FIFO yet, delay is 0 */
@@ -1230,10 +1215,10 @@ static snd_pcm_sframes_t dac33_dai_delay(
 		}
 		break;
 	case DAC33_FIFO_MODE7:
-		spin_lock_irqsave(&dac33->lock, flags);
-		t0 = dac33->t_stamp1;
-		uthr = dac33->uthr;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			t0 = dac33->t_stamp1;
+			uthr = dac33->uthr;
+		}
 		t_now = ktime_to_us(ktime_get());
 
 		/* We have not started to fill the FIFO yet, delay is 0 */
-- 
2.43.0

