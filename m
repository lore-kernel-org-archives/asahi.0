Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619D343E49A
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692521; cv=none; b=LdViGPZ4jHG7Zcfdt9JvvdbfjYJNxILmDGll79f5jT35nVipAel+L9w9VUNfMX4J379TgnUjoNDwlcFthgqTScYQdHfNLNDxFj9p1gSsauuWGERJACdxoCy87AdP/0KDDPmBzPjhTYj5EpgGJaVvj7BbG6UJdPYCdpbk/MNuEJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692521; c=relaxed/simple;
	bh=M1AXoaCuL8pjqNql9MYUGjojDAFzwdkOmfsJJ+5uCN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+/2oA0uU2/eYUH6g7OPZPp4DBzGkLKknN72hCI4GkKGrwPmnYDax0g/3t6MabFSbFANPf3ViU9dkZW00j1CSWdISaXzzC9ZO6cVz+DPzmBtb5QC5IdY0XxkzSVwUFePE8eSKPvIFnC+O04XCOWU2l02YoOm3WaRKT14Wf2tBKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIo6GH6Q; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIo6GH6Q"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bc806fcf8so1067079eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692520; x=1782297320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtDDrpvFiW9v2e0+BVdUVB419JMabOyntlf8qyBQjjg=;
        b=CIo6GH6QjOguYOpCRDWEXQn03Zdv6wRvQFzOdcgTSFhJjVP2Fu9lm7/5mz1cy4SygA
         UJS/LtYM5Xc6fDo4F3+D0VdZ75IimUCmkLaRfQGOMgjxGmKWDxnBKr8WUqFJogvh40vm
         kCH7hdNbFGx7Al6uz6CCjJT4KhkSurNrbJBqNLAX5nvUTNrGI3QF8BgnajLqBsXwJnrr
         DPP4qMDD5BnjPOo1tgr0KNvED2pVqAX4QCQA1kz97AtiNI/L7j3LUFDdUqO6DKypHbkq
         bsMAmciEM+iNuxgmgVOh5ril8VcTSVyEwyZXvoJ3EAUOHEWTlnxWB5ikVXwlrtsvyEJD
         zFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692520; x=1782297320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtDDrpvFiW9v2e0+BVdUVB419JMabOyntlf8qyBQjjg=;
        b=Hyd99JX3VCm8mI66JkKaZUpgybW8gTWbiWmOHWudjKKLdJSpIHPJMKLoHebSfNDKdz
         XEGxc6Wa7vHbWXcizVrFW2ZGTcrgPFvfALwe7yVCv90stUPyiF2TTGutAzqcdjOUjwaZ
         l+5VEUl+M118ehhL9cdfPhJy7CM9ijffwTa4V/zrrZ/4o1ZE4Li01Jx92jxsCTUQhTdI
         GIWDvzKuXt2XDZheOMiCdJzgXN4bOBw4CXcmOk282VcQGg4RP/QotO6hI1OoQp61JOWY
         ORUrXjGVzbKbSrZV+roOtOd/haScm4ZAZMtzDgXwGZYseFLbQbvmdkCjthAOWQYVGfTb
         hwvw==
X-Forwarded-Encrypted: i=1; AFNElJ91GZExeoD47T3qDFld0mCDdtYVRRle9dE9YqYNoyUgD/wp0YjNpC0lRWUy7mygKkscnhvpVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YynZ9/U2ds8qSPqNayiNXjeXV8ZoI8jBiimXWTK0bGplhcz0Rj+
	e4YghwE1Qg9EWFVAt4RayAQJN6ZgHlctgdRKAaiWbBV4p1Q/e0ZIz4+K
X-Gm-Gg: AfdE7cmQyx3KqtJ5DdpE65DoZwPecjB1XIzMwsrLEJsYtpjGcB6FU1U23wrXZ09QTWC
	4FKhd+3yX6Dl7AixdmVooflTtabYeCFhl6x6HPXo6CnIKp1eTSK0dkO+J0tapkxYBbwiaRIXFH+
	IDqZroXEtX9gKUqNReSMPwIiXlxUZps3yYdYYy6ir+D7mL6wjjcjlp+Z0Ilecv9/iUrRxF/HaIz
	oYZgIjMIes7/JcppSV0AL16Cj55UNsnAUMhbDgYTclRslDEOfuNvlB9IkUQuiTEO2WdRb2rJNIm
	1ljtMfjSGX8i4ZFyu0x+nDtDC7Nq/3ybazFoTlHXBf5dNpQS/JwTVdlTKp1LJ87M5h2wh4onVZK
	U8kr7hjfft7kz9YhhY1aEcf7EByFRQlKZjlJ5nqs7EX/St16AHLZqSreVUWsP83KhXs6DZ2P409
	dfMwe+m655pY4xDfZVPyVbgHDtIynkUR5q8noEAh6dQ9N6uwI=
X-Received: by 2002:a05:693c:639b:20b0:30b:e4a3:44d2 with SMTP id 5a478bee46e88-30be4a363f6mr103693eec.8.1781692519548;
        Wed, 17 Jun 2026 03:35:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:19 -0700 (PDT)
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
Subject: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:32 +0700
Message-ID: <20260617103235.449609-16-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs42l43-jack.c | 57 +++++++++++++--------------------
 sound/soc/codecs/cs42l43.c      | 16 +++------
 2 files changed, 27 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 934666295ee3..d6c0f5139792 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -445,20 +445,18 @@ irqreturn_t cs42l43_button_release(int irq, void *data)
 		return iret;
 	}
 
-	mutex_lock(&priv->jack_lock);
-
-	if (priv->button_detect_running) {
-		dev_dbg(priv->dev, "Button release IRQ\n");
+	scoped_guard(mutex, &priv->jack_lock) {
+		if (priv->button_detect_running) {
+			dev_dbg(priv->dev, "Button release IRQ\n");
 
-		snd_soc_jack_report(priv->jack_hp, 0, CS42L43_JACK_BUTTONS);
+			snd_soc_jack_report(priv->jack_hp, 0, CS42L43_JACK_BUTTONS);
 
-		iret = IRQ_HANDLED;
-	} else {
-		dev_dbg(priv->dev, "Spurious button release IRQ\n");
+			iret = IRQ_HANDLED;
+		} else {
+			dev_dbg(priv->dev, "Spurious button release IRQ\n");
+		}
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return iret;
@@ -477,22 +475,20 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&priv->jack_lock);
-
-	if (cs42l43_jack_present(priv) && priv->button_detect_running) {
-		dev_dbg(priv->dev, "Bias sense timeout out, restore bias\n");
+	scoped_guard(mutex, &priv->jack_lock) {
+		if (cs42l43_jack_present(priv) && priv->button_detect_running) {
+			dev_dbg(priv->dev, "Bias sense timeout out, restore bias\n");
 
-		regmap_update_bits(cs42l43->regmap,
-				   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK, 0);
-		regmap_update_bits(cs42l43->regmap,
-				   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
+			regmap_update_bits(cs42l43->regmap,
+					   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK, 0);
+			regmap_update_bits(cs42l43->regmap,
+					   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
+		}
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	pm_runtime_put_autosuspend(priv->dev);
 }
 
@@ -895,9 +891,8 @@ int cs42l43_jack_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 	ucontrol->value.integer.value[0] = priv->jack_override;
-	mutex_unlock(&priv->jack_lock);
 
 	return 0;
 }
@@ -913,17 +908,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	if (override >= e->items)
 		return -EINVAL;
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
-	if (!cs42l43_jack_present(priv)) {
-		mutex_unlock(&priv->jack_lock);
+	if (!cs42l43_jack_present(priv))
 		return -EBUSY;
-	}
 
-	if (override == priv->jack_override) {
-		mutex_unlock(&priv->jack_lock);
+	if (override == priv->jack_override)
 		return 0;
-	}
 
 	priv->jack_override = override;
 
@@ -983,7 +974,5 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 				    cs42l43_jack_override_modes[override].report);
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	return 1;
 }
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f0d6ff0b2976..72c5c0340c48 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1208,14 +1208,12 @@ static void cs42l43_spk_vu_sync(struct cs42l43_codec *priv)
 {
 	struct cs42l43 *cs42l43 = priv->core;
 
-	mutex_lock(&priv->spk_vu_lock);
+	guard(mutex)(&priv->spk_vu_lock);
 
 	regmap_update_bits(cs42l43->regmap, CS42L43_INTP_VOLUME_CTRL1,
 			   CS42L43_AMP1_2_VU_MASK, CS42L43_AMP1_2_VU_MASK);
 	regmap_update_bits(cs42l43->regmap, CS42L43_INTP_VOLUME_CTRL1,
 			   CS42L43_AMP1_2_VU_MASK, 0);
-
-	mutex_unlock(&priv->spk_vu_lock);
 }
 
 static int cs42l43_shutter_get(struct cs42l43_codec *priv, unsigned int shift)
@@ -1602,7 +1600,7 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 	struct cs42l43 *cs42l43 = priv->core;
 	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
+	guard(mutex)(&cs42l43->pll_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1627,8 +1625,6 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&cs42l43->pll_lock);
-
 	return ret;
 }
 
@@ -2566,13 +2562,9 @@ static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,
 {
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
-	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
-	ret = cs42l43_set_pll(priv, src, freq);
-	mutex_unlock(&cs42l43->pll_lock);
-
-	return ret;
+	guard(mutex)(&cs42l43->pll_lock);
+	return cs42l43_set_pll(priv, src, freq);
 }
 
 static int cs42l43_component_probe(struct snd_soc_component *component)
-- 
2.43.0

