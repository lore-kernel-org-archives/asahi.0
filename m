Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3377E3D47CE
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454546; cv=none; b=BcToVyqYg+ZmNBHRaidQGcz2iM/8fwI/hUMwvor5PRLJfHpdzrukdaTUMPzSAvAwJY6lK8Y2NTiXrGwqwWDibT1sV0q6IGp8PaVdgpXlZD/x6qoEzgKQxPRobWmzJl6rZLsJQdAdR1yg7vdatNXsSeaCo/z2Na7J95ubn8f1U7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454546; c=relaxed/simple;
	bh=u48uMwDFKdXBa0Xd8Kd7Nxxt4yBiURDnLcHAT3mlfUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZZjFqDSZQrmeh2oR57kvIaAIxUjkzHNgPQ8LqcmvpJYKtKVXbe59WGuH4htDlu3JZ11OJYUZ/iL/17YuUzWcxuaDXajSE1TQ0cCGBsXN/F7mH30QdjO08eecfjLtCb6zCHuKzlWpnwUB9RLQdG5IeD8k+DYuZe4vObFtnv1U/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAYg2N0b; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAYg2N0b"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so452126a91.1
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454544; x=1783059344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cu54GneC8TQEA7lo+/tdTlrM2qu5npnJrvxtZ2IpVVk=;
        b=tAYg2N0b9Dqvy2wvzPUja67SSrhJLaTBzovI2kCfy7qsbXijslfN+rjfDp8wHNTvTS
         iOtlAvZJWhUTXzK9ShsLdsdnHjnVjvW1dmkg4QQKtRDW9G08K8NCu0HZr42m8czS0sgk
         4aeOrzt7+drwakJ/Jn0jqMxXOgXpth/oU2UB8HHwlsmRcdHhsgVVR3OCpJai5WX1T/xE
         HcyEArKcnuUAtQUgWAKKy44vTqST8hn1RZFlIe5sLKmTBX+9rYHNQvBrkf4Nb1ALkZv/
         4TtPVjalpxCwcP2F4U/1AK/q1tbZ5v0ox76u9omiGhzgteRliMXbbqFL+U+X96D5ZUpx
         NWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454544; x=1783059344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cu54GneC8TQEA7lo+/tdTlrM2qu5npnJrvxtZ2IpVVk=;
        b=Io/KsWsBaXNpclDLcVstzZITLVPH9KYs9oqeJoIw5AtnKOipY60Egzddn5xLsqLwp2
         Yu2WzZLQZg9nfG6R6rIUwnrw90qOcWwT77cU3+D1iRVpNOiEVzvwFBqoErbSTxervapU
         18SKVWVhpIHfZ6UwBsU8RuHJavT0f+yrDiDpMWgUIhhCFJrvT7PVNC7v8sfcN2D2mBRL
         +9dRrS6uNbU6WxxoJzN512iUsXaS8gz4/o4w4qWbcC2G4klSnlny6wlodyHfMLn3vV6v
         90A08dc/XS9gPFYwlq7S/cb/o9l6/wVe77Jk9L0nXC1PhYvAcZRpsmWWgSoVF1O9baLT
         Zn+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrEx1NCvept7rl6R9Q3W3/A9GbkVNRMkl3Ipbz85181QNUC6L9ollqzcKeelTUuBZy7eUVcMg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5kHLoLWKqZ2lnou471KCNkgvEzeyEKlrPoPgS/0Duu9sJh1x0
	dLkwC0MFrpSKfvKakU38oK0x8EcGOe84mBTYTCjvI3TELof6MzxAbELv
X-Gm-Gg: AfdE7clF1g1j2vtpYVW2s9xl08dIPsq4gFKLSxC7aSxIRkV3vtMF9N7ROc3yF1Ipfsk
	7qmpNRKaIac5F9s75eU7qAXoj5RiDjsTt9Jf6w4YrfWYDtDr5AvOX/NJLflRb0tWQVtgvlPSCpn
	vSNcFet0wka0jaWnuGdy17knucU/ohc2yOKWCQd1vij/jxMNatML4IeYC3xzaWNkldg+0Q8jmYJ
	u1gy0UGT3Cqdh/37muY47jYIedHhpnQ/I9LFpl8RKwPdNBfyjYy+/LYvKEerrEvb04ORdJdtWwu
	knkPsaCEYwTnd9Iopmz5cb6HUvCcbvPKlW8pNSbbzpp4cj/YcTi4TdXHDfYmwuuryotHu+f21qX
	9aZF+7IZJ4cJmQO74KMW2dXImVQCeXSZK4BU9OpVMWCJHNJLOzZzJUtNXKEsQlWVnZt7DKYVw3X
	IlRHdn0Xp8s4zstVWcRoOY4sAG1jecGgWiFUgvJpybnfd4tCo=
X-Received: by 2002:a17:90b:4c09:b0:35c:30a8:330 with SMTP id 98e67ed59e1d1-37df9e8ffecmr5096624a91.0.1782454544451;
        Thu, 25 Jun 2026 23:15:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime scope helpers
Date: Fri, 26 Jun 2026 13:13:20 +0700
Message-ID: <20260626061329.23264-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Convert mutex locking to guard(mutex) and replace explicit runtime
PM handling with runtime PM scope helpers.
This simplifies the control flow by removing explicit cleanup paths
and unnecessary 'goto' labels.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l43-jack.c | 104 ++++++++++++++------------------
 sound/soc/codecs/cs42l43.c      |  16 ++---
 2 files changed, 49 insertions(+), 71 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 934666295ee3..0ddd6879796b 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -80,31 +81,41 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 
 	dev_dbg(priv->dev, "Configure accessory detect\n");
 
-	ret = pm_runtime_resume_and_get(priv->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for jack config: %d\n", ret);
 		return ret;
 	}
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
 	priv->jack_hp = jack;
 
-	if (!jack)
-		goto done;
+	if (!jack) {
+		regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+				   CS42L43_JACKDET_MODE_MASK |
+				   CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
+				   CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
+		regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
+				   CS42L43_RING_SENSE_EN_MASK, pdncntl);
+		dev_dbg(priv->dev, "Successfully configured accessory detect\n");
+
+		return 0;
+	}
 
 	ret = device_property_count_u32(cs42l43->dev, "cirrus,buttons-ohms");
 	if (ret != -EINVAL) {
 		if (ret < 0) {
 			dev_err(priv->dev, "Property cirrus,buttons-ohms malformed: %d\n",
 				ret);
-			goto error;
+			return ret;
 		}
 
 		if (ret > CS42L43_N_BUTTONS) {
 			ret = -EINVAL;
 			dev_err(priv->dev, "Property cirrus,buttons-ohms too many entries\n");
-			goto error;
+			return ret;
 		}
 
 		ret = device_property_read_u32_array(cs42l43->dev, "cirrus,buttons-ohms",
@@ -112,7 +123,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 		if (ret < 0) {
 			dev_err(priv->dev, "Property cirrus,button-ohms malformed: %d\n",
 				ret);
-			goto error;
+			return ret;
 		}
 	} else {
 		priv->buttons[0] = 70;
@@ -124,7 +135,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 	ret = cs42l43_find_index(priv, "cirrus,detect-us", 50000, &priv->detect_us,
 				 cs42l43_accdet_us, ARRAY_SIZE(cs42l43_accdet_us));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	hs2 |= ret << CS42L43_AUTO_HSDET_TIME_SHIFT;
 
@@ -134,7 +145,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->bias_ramp_ms, cs42l43_accdet_ramp_ms,
 				 ARRAY_SIZE(cs42l43_accdet_ramp_ms));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	hs2 |= ret << CS42L43_HSBIAS_RAMP_SHIFT;
 
@@ -142,7 +153,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->bias_sense_ua, cs42l43_accdet_bias_sense,
 				 ARRAY_SIZE(cs42l43_accdet_bias_sense));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	if (priv->bias_sense_ua)
 		autocontrol |= ret << CS42L43_HSBIAS_SENSE_TRIP_SHIFT;
@@ -154,7 +165,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				       &priv->tip_debounce_ms);
 	if (ret < 0 && ret != -EINVAL) {
 		dev_err(priv->dev, "Property cirrus,tip-debounce-ms malformed: %d\n", ret);
-		goto error;
+		return ret;
 	}
 
 	/* This tip sense invert is set normally, as TIPSENSE_INV already inverted */
@@ -170,7 +181,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->tip_fall_db_ms, cs42l43_accdet_db_ms,
 				 ARRAY_SIZE(cs42l43_accdet_db_ms));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	tip_deb |= ret << CS42L43_TIPSENSE_FALLING_DB_TIME_SHIFT;
 
@@ -178,7 +189,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->tip_rise_db_ms, cs42l43_accdet_db_ms,
 				 ARRAY_SIZE(cs42l43_accdet_db_ms));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	tip_deb |= ret << CS42L43_TIPSENSE_RISING_DB_TIME_SHIFT;
 
@@ -199,7 +210,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 					 NULL, cs42l43_accdet_db_ms,
 					 ARRAY_SIZE(cs42l43_accdet_db_ms));
 		if (ret < 0)
-			goto error;
+			return ret;
 
 		ring_deb |= ret << CS42L43_RINGSENSE_FALLING_DB_TIME_SHIFT;
 
@@ -207,7 +218,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 					 NULL, cs42l43_accdet_db_ms,
 					 ARRAY_SIZE(cs42l43_accdet_db_ms));
 		if (ret < 0)
-			goto error;
+			return ret;
 
 		ring_deb |= ret << CS42L43_RINGSENSE_RISING_DB_TIME_SHIFT;
 		pdncntl |= CS42L43_RING_SENSE_EN_MASK;
@@ -228,9 +239,6 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 			   CS42L43_HSBIAS_RAMP_MASK | CS42L43_HSDET_MODE_MASK |
 			   CS42L43_AUTO_HSDET_TIME_MASK, hs2);
 
-done:
-	ret = 0;
-
 	regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
 			   CS42L43_JACKDET_MODE_MASK | CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
 			   CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
@@ -239,12 +247,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 
 	dev_dbg(priv->dev, "Successfully configured accessory detect\n");
 
-error:
-	mutex_unlock(&priv->jack_lock);
-
-	pm_runtime_put_autosuspend(priv->dev);
-
-	return ret;
+	return 0;
 }
 
 static void cs42l43_start_hs_bias(struct cs42l43_codec *priv, bool type_detect)
@@ -374,17 +377,18 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
 	unsigned int val = 0;
 	int i, ret;
 
-	ret = pm_runtime_resume_and_get(priv->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for button press: %d\n", ret);
 		return iret;
 	}
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
 	if (!priv->button_detect_running) {
 		dev_dbg(priv->dev, "Spurious button press IRQ\n");
-		goto error;
+		return iret;
 	}
 
 	// Wait for 2 full cycles of comb filter to ensure good reading
@@ -395,12 +399,12 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
 	/* Bail if jack removed, the button is irrelevant and likely invalid */
 	if (!cs42l43_jack_present(priv)) {
 		dev_dbg(priv->dev, "Button ignored due to removal\n");
-		goto error;
+		return iret;
 	}
 
 	if (val & CS42L43_HSBIAS_CLAMP_STS_MASK) {
 		dev_dbg(priv->dev, "Button ignored due to bias sense\n");
-		goto error;
+		return iret;
 	}
 
 	val = (val & CS42L43_HSDET_DC_STS_MASK) >> CS42L43_HSDET_DC_STS_SHIFT;
@@ -423,14 +427,7 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
 
 	snd_soc_jack_report(priv->jack_hp, buttons, CS42L43_JACK_BUTTONS);
 
-	iret = IRQ_HANDLED;
-
-error:
-	mutex_unlock(&priv->jack_lock);
-
-	pm_runtime_put_autosuspend(priv->dev);
-
-	return iret;
+	return IRQ_HANDLED;
 }
 
 irqreturn_t cs42l43_button_release(int irq, void *data)
@@ -439,13 +436,14 @@ irqreturn_t cs42l43_button_release(int irq, void *data)
 	irqreturn_t iret = IRQ_NONE;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(priv->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for button release: %d\n", ret);
 		return iret;
 	}
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
 	if (priv->button_detect_running) {
 		dev_dbg(priv->dev, "Button release IRQ\n");
@@ -457,10 +455,6 @@ irqreturn_t cs42l43_button_release(int irq, void *data)
 		dev_dbg(priv->dev, "Spurious button release IRQ\n");
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
-	pm_runtime_put_autosuspend(priv->dev);
-
 	return iret;
 }
 
@@ -471,13 +465,14 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
 	struct cs42l43 *cs42l43 = priv->core;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(priv->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for bias sense: %d\n", ret);
 		return;
 	}
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
 	if (cs42l43_jack_present(priv) && priv->button_detect_running) {
 		dev_dbg(priv->dev, "Bias sense timeout out, restore bias\n");
@@ -490,10 +485,6 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
 				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
 				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
 	}
-
-	mutex_unlock(&priv->jack_lock);
-
-	pm_runtime_put_autosuspend(priv->dev);
 }
 
 static const struct reg_sequence cs42l43_3pole_patch[] = {
@@ -895,9 +886,8 @@ int cs42l43_jack_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 	ucontrol->value.integer.value[0] = priv->jack_override;
-	mutex_unlock(&priv->jack_lock);
 
 	return 0;
 }
@@ -913,17 +903,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
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
 
@@ -983,7 +969,5 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 				    cs42l43_jack_override_modes[override].report);
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	return 1;
 }
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f0d6ff0b2976..68ec56f18b60 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -8,6 +8,7 @@
 #include <linux/bitops.h>
 #include <linux/bits.h>
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -1208,14 +1209,12 @@ static void cs42l43_spk_vu_sync(struct cs42l43_codec *priv)
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
@@ -1602,7 +1601,7 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 	struct cs42l43 *cs42l43 = priv->core;
 	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
+	guard(mutex)(&cs42l43->pll_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1627,8 +1626,6 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&cs42l43->pll_lock);
-
 	return ret;
 }
 
@@ -2566,13 +2563,10 @@ static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,
 {
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
-	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
-	ret = cs42l43_set_pll(priv, src, freq);
-	mutex_unlock(&cs42l43->pll_lock);
+	guard(mutex)(&cs42l43->pll_lock);
 
-	return ret;
+	return cs42l43_set_pll(priv, src, freq);
 }
 
 static int cs42l43_component_probe(struct snd_soc_component *component)
-- 
2.43.0

