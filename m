Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37BF3F0A95
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781031; cv=none; b=LSCG6dqafarwsA6kAW1SeKnk0ZZE36nFpyP/HAvhYFX7Ql7lWwLCzdGd0vBpIBB4W+nCvxAAMsaJyjbRI9Dshuf0QaKkyWjrP96Yu4YFHzZQ1KpldHewXMv2zpOV9xMH7rqYhRrgStC5rRD2lI3sNhC8uothhuS7cL4ydaB17P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781031; c=relaxed/simple;
	bh=VepUQOH9I2YScBtyygKkYYIP3OnVwMB6+G3b8wmbhVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gv8zXb9lVFQkUcS/0qWGZX1vpVy5WowVFirrWtdw7DG5BPKtkEYV+EqYyIde/m50WjJFchpsHPlZ4cdL5cyIGFDUzZ1L3xqkkqh35AIgBLNPVXfe/DSXgm1eMMlno2mcWCwCIPwy0ZAcGKnXXD0BC4DrqEniM0SalwDwCJdGA5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cH3fm3nw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cH3fm3nw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c132ac5ec2so8954705ad.1
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781029; x=1782385829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUydxf/ZwzEU3byhG6kKewQSumkNnr4b0Y4idMeiddo=;
        b=cH3fm3nwF2p8B/UXWleYu7rVphjhaYAg8BBQ4ySq/apsD8tTzfkcDAF/kjj9I0wZNB
         McBszp8j3J821E1B9vo/Tj/U6XsXvKyuPK3SzZdtAkaJG5O+zwXLNhFNWfDcsWmCh8eK
         sTYSsBb3B/+uPh/bfPwfzzm1HbqyFjIlvw5ig06vD7OzyxWvrEO5e/UoJyDGGqlJfKYt
         lqAhVSb9U47nmAz/3qvh8sfgiabmWqLyZqwPTIBwjsb5lT5NphDqOCxWOueNVHWXt0MY
         FucqY914bSKPyfRfC2T7mXgGRCm4e/3N0zCVygR3rWzN+jM1aw9fG55FuOlWlWVXbsli
         3aHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781029; x=1782385829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RUydxf/ZwzEU3byhG6kKewQSumkNnr4b0Y4idMeiddo=;
        b=roPzidL91nC9BZ2HYFTHspwmRgtUjx9NjvYCz7ZwLeYmeHeeFVs6t3AvrJ8vsxRaPU
         HvOkERM0xA3oJwjJNiHk/m0GHH7ZI+IICN8zCJ7d1azh7reJXa7OxoClk+DosXiMPuKn
         mVQ/lLnBo7hHBZ8w1qVaZpLlqttzQNu4H2tQ58iUGGpKUzrXBFaFkII7Z3Ud5oeKXcGZ
         yunoAc/j2kcnaiR1yIFRfv9aaqFasOYWbCAmZYaA52RLLuLp6Dv7SSo3a2VQu0BxjFwy
         uWAHuBCp1puYdgs4BlgK6O9DZPq/ZXWTNgM4BH4j2SIL9y8boLT2lRI28t8ss3bmmHgU
         CVxg==
X-Forwarded-Encrypted: i=1; AFNElJ+3REOfwjhvfnxLR075e9G/8BLDdFGD7J80Zj24qNUz7+APrCxD0PbLy7uHaZ7ldwgshChCBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8LYZCTzTsA7MB1y03/6hCB1wshfT+YGhNXXAsEJtUtLxKaQ2J
	tDvEZSQuvJeB8wPJEX6R+ckXQBjs6OPoQ+0fzdQYHZPyX5k1Ofz9pvX0
X-Gm-Gg: AfdE7ckhws6TgcFZqzd4gg1DKTucXDzccM5+i54c/KMix3o4qsipico9xDvsDfgZGom
	Jg46bR76jqCXCiDNWTqts5wOrYCxIsPZB7aBdtMGz3D90ijUFmpEKBUSnenWhnfvJZELTZshXqS
	alPMlPBg39DtJgMUUnmhErvCHQX6Q7TX+62UnFoqQVJZQJa7bx1u8tlEDPonSOEgSSykoJcA/L4
	Eso/G6OizftqNXHHPWZiZrkDTN2bh70jP2nrC9aFeixWkzi7jVjHrschZ/CUbZ8HAXjTEz4Hq4B
	9d1XdQPj0G6uTK8kC/vhHZlggQo8i2tPbGKRx1bzKXwtlZ11fK4/h5mhvhxym02hBOH7noUFViy
	ezRr9Vmj6pL8GjzG4Zzv9eWzZ2Ud5grUqa72MWOIrIlTo/ba6cDaxOdgOJy6jbWeCDvJzKAvrC8
	S92HqkagY2nknNvfcIvhmoqwGwv1g7UsBppsN133/BbNxik1eIRvM9NHUlAw==
X-Received: by 2002:a17:902:c945:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2c6e5155763mr34980605ad.19.1781781029264;
        Thu, 18 Jun 2026 04:10:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:28 -0700 (PDT)
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
Subject: [PATCH 68/78] ASoC: codecs: wm0010: Use guard() for mutex & spin locks
Date: Thu, 18 Jun 2026 18:08:17 +0700
Message-ID: <20260618110827.232983-12-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm0010.c | 63 ++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 2a8c61a72c17..aeca42e4caba 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -148,13 +148,11 @@ static const char *wm0010_state_to_str(enum wm0010_state state)
 static void wm0010_halt(struct snd_soc_component *component)
 {
 	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 	enum wm0010_state state;
 
 	/* Fetch the wm0010 state */
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	state = wm0010->state;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		state = wm0010->state;
 
 	switch (state) {
 	case WM0010_POWER_OFF:
@@ -173,9 +171,8 @@ static void wm0010_halt(struct snd_soc_component *component)
 		break;
 	}
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_POWER_OFF;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_POWER_OFF;
 }
 
 struct wm0010_boot_xfer {
@@ -190,11 +187,9 @@ struct wm0010_boot_xfer {
 static void wm0010_mark_boot_failure(struct wm0010_priv *wm0010)
 {
 	enum wm0010_state state;
-	unsigned long flags;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	state = wm0010->state;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		state = wm0010->state;
 
 	dev_err(wm0010->dev, "Failed to transition from `%s' state to `%s' state\n",
 		wm0010_state_to_str(state), wm0010_state_to_str(state + 1));
@@ -558,7 +553,6 @@ static int wm0010_boot(struct snd_soc_component *component)
 {
 	struct spi_device *spi = to_spi_device(component->dev);
 	struct wm0010_priv *wm0010 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 	int ret;
 	struct spi_message m;
 	struct spi_transfer t;
@@ -568,10 +562,10 @@ static int wm0010_boot(struct snd_soc_component *component)
 	u8 *out;
 	int i;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	if (wm0010->state != WM0010_POWER_OFF)
-		dev_warn(wm0010->dev, "DSP already powered up!\n");
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock) {
+		if (wm0010->state != WM0010_POWER_OFF)
+			dev_warn(wm0010->dev, "DSP already powered up!\n");
+	}
 
 	if (wm0010->sysclk > 26000000) {
 		dev_err(component->dev, "Max DSP clock frequency is 26MHz\n");
@@ -579,7 +573,7 @@ static int wm0010_boot(struct snd_soc_component *component)
 		goto err;
 	}
 
-	mutex_lock(&wm0010->lock);
+	guard(mutex)(&wm0010->lock);
 	wm0010->pll_running = false;
 
 	dev_dbg(component->dev, "max_spi_freq: %d\n", wm0010->max_spi_freq);
@@ -589,7 +583,6 @@ static int wm0010_boot(struct snd_soc_component *component)
 	if (ret != 0) {
 		dev_err(&spi->dev, "Failed to enable core supplies: %d\n",
 			ret);
-		mutex_unlock(&wm0010->lock);
 		goto err;
 	}
 
@@ -601,17 +594,15 @@ static int wm0010_boot(struct snd_soc_component *component)
 
 	/* Release reset */
 	gpiod_set_value_cansleep(wm0010->reset, 0);
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_OUT_OF_RESET;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_OUT_OF_RESET;
 
 	if (!wait_for_completion_timeout(&wm0010->boot_completion,
 					 msecs_to_jiffies(20)))
 		dev_err(component->dev, "Failed to get interrupt from DSP\n");
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_BOOTROM;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_BOOTROM;
 
 	ret = wm0010_stage2_load(component);
 	if (ret)
@@ -621,9 +612,8 @@ static int wm0010_boot(struct snd_soc_component *component)
 					 msecs_to_jiffies(20)))
 		dev_err(component->dev, "Failed to get interrupt from DSP loader.\n");
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_STAGE2;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_STAGE2;
 
 	/* Only initialise PLL if max_spi_freq initialised */
 	if (wm0010->max_spi_freq) {
@@ -693,11 +683,8 @@ static int wm0010_boot(struct snd_soc_component *component)
 	if (ret != 0)
 		goto abort;
 
-	spin_lock_irqsave(&wm0010->irq_lock, flags);
-	wm0010->state = WM0010_FIRMWARE;
-	spin_unlock_irqrestore(&wm0010->irq_lock, flags);
-
-	mutex_unlock(&wm0010->lock);
+	scoped_guard(spinlock_irqsave, &wm0010->irq_lock)
+		wm0010->state = WM0010_FIRMWARE;
 
 	return 0;
 
@@ -708,11 +695,9 @@ static int wm0010_boot(struct snd_soc_component *component)
 abort:
 	/* Put the chip back into reset */
 	wm0010_halt(component);
-	mutex_unlock(&wm0010->lock);
 	return ret;
 
 err_core:
-	mutex_unlock(&wm0010->lock);
 	regulator_bulk_disable(ARRAY_SIZE(wm0010->core_supplies),
 			       wm0010->core_supplies);
 err:
@@ -734,9 +719,8 @@ static int wm0010_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_PREPARE) {
-			mutex_lock(&wm0010->lock);
-			wm0010_halt(component);
-			mutex_unlock(&wm0010->lock);
+			scoped_guard(mutex, &wm0010->lock)
+				wm0010_halt(component);
 		}
 		break;
 	case SND_SOC_BIAS_OFF:
@@ -832,9 +816,8 @@ static irqreturn_t wm0010_irq(int irq, void *data)
 	case WM0010_OUT_OF_RESET:
 	case WM0010_BOOTROM:
 	case WM0010_STAGE2:
-		spin_lock(&wm0010->irq_lock);
-		complete(&wm0010->boot_completion);
-		spin_unlock(&wm0010->irq_lock);
+		scoped_guard(spinlock, &wm0010->irq_lock)
+			complete(&wm0010->boot_completion);
 		return IRQ_HANDLED;
 	default:
 		return IRQ_NONE;
-- 
2.43.0

