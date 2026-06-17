Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C233A542F
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692512; cv=none; b=YC7pY859EgAfSKtVik9FASBC3oLNvhWUDl4qW6naWlDABvEzWOml2siNJFJg63WYxvhdYEISKKXwW2pdTYxNmWAmhuVUX0AgERx082xBlhNcDn2SsnrcPReLuhTQXY1cTqvJshDW5kknAfiK4oLu7pFKJB/yt/zHOPrQtuOXdRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692512; c=relaxed/simple;
	bh=/BUiGZCaFF/I2ZqD3HFWMUHI08rbw50+h7/5RkVF/9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QaLzx7ZknODL12MwjHiO5TdKA4xua8pWu/pu9/Hu3OOWukw7xwdrLhTrXSwDibQOkPlf9rDEW8ClwwIgq/cqmfxGPfJ7F/0nv8uIBnd1dF+5EiHs91Y063cxeNKWJkAUPhIb+RUB4thiijfrSaZYPv9rNAH94z0Do7bnMQvxFBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+qShL90; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+qShL90"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30bcc877b4cso1623555eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692511; x=1782297311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdzEN4bZnmzSBjv8BhXg4StffmGXntUcdqfeQDcKmZ0=;
        b=R+qShL90tvtSAnCPge3lvojTRGXzD7JHuowXGRWiij69FLH7uNQHuq2VDWthpUdK70
         tE4p1/1evMABqRpVIJ0h6VMsfbdz3+QjB525YgoS4JEo8fsajiZP8B2VVaGeicgMG4ei
         AgvlaAMeYots+BEa0hZ4WElasbOr0nN6B9QqQIX57AJ1vEqgGtlyMnT4jB4kylZviJTy
         IPllmsIdrTGi/L+Cd7Qci/aL3kZpN26XM56Nl7NHQUjHa+ybajzdV2y6g9WXAG7Pe0ev
         BMee91Aod//idQ4BPAInXzY4II34RnS3JOPNvL1WQFuRKQDFZh5a/3+iHt19RsCZtOPz
         yFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692511; x=1782297311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RdzEN4bZnmzSBjv8BhXg4StffmGXntUcdqfeQDcKmZ0=;
        b=X2vtmTJXHoS2ZBQ2qZCroOX+wGQenaPz+nqHvQ2NnaE7Uk9r8wqvu85R74YMIYKVq9
         B3l1Cp6Zn/8WZpA40M8c9XxvsQaWK+FzazeTIOYnkeGTc3yetwO4FkhNskDU1J3Hw4+n
         zNacTVTgHMXrOyRJ8mAQwD3WFJOuG/OwMMtnDoG4ISxn1m198fFi2jzFQhX6TJ4LfW80
         gQ8RgVtcrzhjcwkHj4hrT3LVmoS01k/rcarASqJmRTYJS6X8M9C/6V5O75GEIHIEGYx1
         ovp8of5n4r3WS48EzUssanAdl+GpRxvO4mjvT9AzrgS5vSB7pnTyaEnOJhRc/I2w75Ze
         ZTEw==
X-Forwarded-Encrypted: i=1; AFNElJ+JQRKpHn0W8hDoKo+1jnLZvC1qrmiPZKsNG4NTilw0j9740F+r+qhePMxdb66ZBX1hdbQl5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAWKFs/rwaAKDesMNWD3Oh4d8NESkLPU57L7T5yunLfbHRbj/A
	5ktG32J20bHyzeN2E0dJzDZXyS4sogIa1ssd7eaSkZcZtFvBxNZvS6CJ
X-Gm-Gg: AfdE7cn8gfx/GVLccN56DQPQwJeT/2dLZmRkCYu3e1YFGJPYLcbQ0VO9phu4ObbegnY
	EEnFnl/54t4TFvWrUS71Upc3JeJuEQdHO/WkxKsqiv+2eZmEUgxUtrHs8qGSifjDETKXq8nPk42
	5v+SOV5CclYsrMMhMX0b+yjIKUMtXMa5bAa6jfWeLfoQdYK84Kb893JZvV2fOP1QBOYsd2F0pSn
	Vyk2qE4ldXGz6Rqwo575IIWEK/MBEfuxJ0VERLjEXI7lrerdEo+GyUph7M9g/Z5gh0BwxDGkDOj
	yCYiEAKWcze9P1cQ6n8Tf0n4wJ3k/zqqinIBgF7ocskPmrvdrC9js1u5+h25FAgbpdvE/JvQI0R
	GDcsqlTURr65ejq7OQtgTyV0Pzx4XdAwECKAowebLznlseRPdz2sS4JvgNRC4LmaFAms/tHCviw
	PVXPvfqRb7zTHA9VZhzzqZbS5Ovstrie9zVNGJImWhlAiDx9s=
X-Received: by 2002:a05:7300:80d2:b0:2f1:496c:94bf with SMTP id 5a478bee46e88-30bca066cccmr1800405eec.16.1781692510527;
        Wed, 17 Jun 2026 03:35:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:10 -0700 (PDT)
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
Subject: [PATCH 14/78] ASoC: codecs: cs42l42: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:31 +0700
Message-ID: <20260617103235.449609-15-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs42l42.c | 222 ++++++++++++++++++-------------------
 1 file changed, 111 insertions(+), 111 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2652a639a79a..f9e02cc4e9f1 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -565,7 +565,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l42->irq_lock);
+	guard(mutex)(&cs42l42->irq_lock);
 	cs42l42->jack = jk;
 
 	if (jk) {
@@ -581,7 +581,6 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 			break;
 		}
 	}
-	mutex_unlock(&cs42l42->irq_lock);
 
 	return 0;
 }
@@ -1667,117 +1666,118 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	unsigned int current_plug_status;
 	unsigned int current_button_status;
 	unsigned int i;
+	irqreturn_t ret = IRQ_HANDLED;
 
 	pm_runtime_get_sync(cs42l42->dev);
-	mutex_lock(&cs42l42->irq_lock);
-	if (cs42l42->suspended || !cs42l42->init_done) {
-		mutex_unlock(&cs42l42->irq_lock);
-		pm_runtime_put_autosuspend(cs42l42->dev);
-		return IRQ_NONE;
-	}
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		if (cs42l42->suspended || !cs42l42->init_done) {
+			ret = IRQ_NONE;
+			break;
+		}
 
-	/* Read sticky registers to clear interurpt */
-	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
-		regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
-				&(stickies[i]));
-		regmap_read(cs42l42->regmap, irq_params_table[i].mask_addr,
-				&(masks[i]));
-		stickies[i] = stickies[i] & (~masks[i]) &
-				irq_params_table[i].mask;
-	}
+		/* Read sticky registers to clear interrupt */
+		for (i = 0; i < ARRAY_SIZE(stickies); i++) {
+			regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
+					&(stickies[i]));
+			regmap_read(cs42l42->regmap, irq_params_table[i].mask_addr,
+					&(masks[i]));
+			stickies[i] = stickies[i] & (~masks[i]) &
+					irq_params_table[i].mask;
+		}
 
-	/* Read tip sense status before handling type detect */
-	current_plug_status = (stickies[11] &
-		(CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK)) >>
-		CS42L42_TS_PLUG_SHIFT;
+		/* Read tip sense status before handling type detect */
+		current_plug_status = (stickies[11] &
+			(CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK)) >>
+			CS42L42_TS_PLUG_SHIFT;
 
-	/* Read button sense status */
-	current_button_status = stickies[7] &
-		(CS42L42_M_DETECT_TF_MASK |
-		CS42L42_M_DETECT_FT_MASK |
-		CS42L42_M_HSBIAS_HIZ_MASK);
+		/* Read button sense status */
+		current_button_status = stickies[7] &
+			(CS42L42_M_DETECT_TF_MASK |
+			CS42L42_M_DETECT_FT_MASK |
+			CS42L42_M_HSBIAS_HIZ_MASK);
 
-	/*
-	 * Check auto-detect status. Don't assume a previous unplug event has
-	 * cleared the flags. If the jack is unplugged and plugged during
-	 * system suspend there won't have been an unplug event.
-	 */
-	if ((~masks[5]) & irq_params_table[5].mask) {
-		if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
-			cs42l42_process_hs_type_detect(cs42l42);
-			switch (cs42l42->hs_type) {
-			case CS42L42_PLUG_CTIA:
-			case CS42L42_PLUG_OMTP:
-				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-				break;
-			case CS42L42_PLUG_HEADPHONE:
-				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-				break;
-			default:
-				break;
+		/*
+		 * Check auto-detect status. Don't assume a previous unplug event has
+		 * cleared the flags. If the jack is unplugged and plugged during
+		 * system suspend there won't have been an unplug event.
+		 */
+		if ((~masks[5]) & irq_params_table[5].mask) {
+			if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
+				cs42l42_process_hs_type_detect(cs42l42);
+				switch (cs42l42->hs_type) {
+				case CS42L42_PLUG_CTIA:
+				case CS42L42_PLUG_OMTP:
+					snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					break;
+				case CS42L42_PLUG_HEADPHONE:
+					snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					break;
+				default:
+					break;
+				}
+				dev_dbg(cs42l42->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
 			}
-			dev_dbg(cs42l42->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
 		}
-	}
 
-	/* Check tip sense status */
-	if ((~masks[11]) & irq_params_table[11].mask) {
-		switch (current_plug_status) {
-		case CS42L42_TS_PLUG:
-			if (cs42l42->plug_state != CS42L42_TS_PLUG) {
-				cs42l42->plug_state = CS42L42_TS_PLUG;
-				cs42l42_init_hs_type_detect(cs42l42);
-			}
-			break;
+		/* Check tip sense status */
+		if ((~masks[11]) & irq_params_table[11].mask) {
+			switch (current_plug_status) {
+			case CS42L42_TS_PLUG:
+				if (cs42l42->plug_state != CS42L42_TS_PLUG) {
+					cs42l42->plug_state = CS42L42_TS_PLUG;
+					cs42l42_init_hs_type_detect(cs42l42);
+				}
+				break;
 
-		case CS42L42_TS_UNPLUG:
-			if (cs42l42->plug_state != CS42L42_TS_UNPLUG) {
-				cs42l42->plug_state = CS42L42_TS_UNPLUG;
-				cs42l42_cancel_hs_type_detect(cs42l42);
+			case CS42L42_TS_UNPLUG:
+				if (cs42l42->plug_state != CS42L42_TS_UNPLUG) {
+					cs42l42->plug_state = CS42L42_TS_UNPLUG;
+					cs42l42_cancel_hs_type_detect(cs42l42);
 
-				snd_soc_jack_report(cs42l42->jack, 0,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					snd_soc_jack_report(cs42l42->jack, 0,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 
-				dev_dbg(cs42l42->dev, "Unplug event\n");
-			}
-			break;
+					dev_dbg(cs42l42->dev, "Unplug event\n");
+				}
+				break;
 
-		default:
-			cs42l42->plug_state = CS42L42_TS_TRANS;
+			default:
+				cs42l42->plug_state = CS42L42_TS_TRANS;
+			}
 		}
-	}
 
-	/* Check button detect status */
-	if (cs42l42->plug_state == CS42L42_TS_PLUG && ((~masks[7]) & irq_params_table[7].mask)) {
-		if (!(current_button_status &
-			CS42L42_M_HSBIAS_HIZ_MASK)) {
-
-			if (current_button_status & CS42L42_M_DETECT_TF_MASK) {
-				dev_dbg(cs42l42->dev, "Button released\n");
-				snd_soc_jack_report(cs42l42->jack, 0,
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-			} else if (current_button_status & CS42L42_M_DETECT_FT_MASK) {
-				snd_soc_jack_report(cs42l42->jack,
-						    cs42l42_handle_button_press(cs42l42),
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+		/* Check button detect status */
+		if (cs42l42->plug_state == CS42L42_TS_PLUG &&
+			((~masks[7]) & irq_params_table[7].mask)) {
+			if (!(current_button_status &
+				CS42L42_M_HSBIAS_HIZ_MASK)) {
+
+				if (current_button_status & CS42L42_M_DETECT_TF_MASK) {
+					dev_dbg(cs42l42->dev, "Button released\n");
+					snd_soc_jack_report(cs42l42->jack, 0,
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+				} else if (current_button_status & CS42L42_M_DETECT_FT_MASK) {
+					snd_soc_jack_report(cs42l42->jack,
+							    cs42l42_handle_button_press(cs42l42),
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+				}
 			}
 		}
 	}
 
-	mutex_unlock(&cs42l42->irq_lock);
 	pm_runtime_put_autosuspend(cs42l42->dev);
 
-	return IRQ_HANDLED;
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs42l42_irq_thread, "SND_SOC_CS42L42_CORE");
 
@@ -2163,22 +2163,22 @@ int cs42l42_suspend(struct device *dev)
 	 * future interrupts. This ensures a safe disable if the interrupt
 	 * is shared.
 	 */
-	mutex_lock(&cs42l42->irq_lock);
-	cs42l42->suspended = true;
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		cs42l42->suspended = true;
 
-	/* Save register values that will be overwritten by shutdown sequence */
-	for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
-		regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
-		save_regs[i] = (u8)reg;
-	}
+		/* Save register values that will be overwritten by shutdown sequence */
+		for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
+			regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
+			save_regs[i] = (u8)reg;
+		}
 
-	/* Shutdown codec */
-	regmap_multi_reg_write(cs42l42->regmap,
-			       cs42l42_shutdown_seq,
-			       ARRAY_SIZE(cs42l42_shutdown_seq));
+		/* Shutdown codec */
+		regmap_multi_reg_write(cs42l42->regmap,
+				       cs42l42_shutdown_seq,
+				       ARRAY_SIZE(cs42l42_shutdown_seq));
 
-	/* All interrupt sources are now disabled */
-	mutex_unlock(&cs42l42->irq_lock);
+		/* All interrupt sources are now disabled */
+	}
 
 	/* Wait for power-down complete */
 	msleep(CS42L42_PDN_DONE_TIME_MS);
@@ -2250,13 +2250,13 @@ void cs42l42_resume_restore(struct device *dev)
 	regcache_cache_only(cs42l42->regmap, false);
 	regcache_mark_dirty(cs42l42->regmap);
 
-	mutex_lock(&cs42l42->irq_lock);
-	/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
-	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
-	regcache_sync(cs42l42->regmap);
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
+		regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
+		regcache_sync(cs42l42->regmap);
 
-	cs42l42->suspended = false;
-	mutex_unlock(&cs42l42->irq_lock);
+		cs42l42->suspended = false;
+	}
 
 	dev_dbg(dev, "System resumed\n");
 }
-- 
2.43.0

