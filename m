Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877F54508F7
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515148; cv=none; b=idCS4WmU9GK+K2eykogP47i8yuqBjH+1yNCqtydOdiIO2Dji8axpxT6D+taI63zHLaIWQfZ7VxxquRQL8kQipi3cbDGaN5qForMO9vv0t3c6a+tjHoSJtB5hXFa75vTdihk1/nb2MOScY7k2jGeGGLQMO6+R7EPua2n2xjZiv+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515148; c=relaxed/simple;
	bh=iujKk9bCIGuTcK8Ojd7Zm5ocecEi8z5wuDQtiqlX2xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ERoCKqWdw3s93UZEP+iZKjQYFiU/0urL9AJQf5/fEVTi8dWsGaBr66IdKTxSl7S8hLx4AUSFSiEmX4PGJE3+cHB0bygfcY8NoNU8AlZJyHK5qxmr1AjOOawGEDQxFUFt6u/0N/+gh59d0Ydzne0WKXREFyxn3fWvPBwkY8vljUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQy17AYs; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQy17AYs"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so813378a91.0
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515146; x=1784119946; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoNhNhzB0q9E8EMX37oWxySCZEPTsjo22vi8mip+Rjs=;
        b=OQy17AYsJrhGC+qNGd6piGfAmILF23rneSMW2hHLpzjScM5PMRPlSymM0ukC/lf/gc
         YC0G5vJFfDRXLKPNLEJMxuA9TLEgVAjClM2OAsRhuJzm20QuGI8Wve24y0FNrITGyf8P
         60br6XNaK7uajAuPXLwgmRURIy4cfKzD5t/uG3jL/0JBiNSMSZzNn9do+46ay0DCsNqh
         L6hgvBSVxaOm1hHiZJ/OXp8aDdq4lWb57Zk8lqr7Y7CF8EJsu4cKP6owa/IBUBwU880M
         JGO+1FCuADxnHw3kRBZbzw2+7+H40Kh+Owjrl8xRrx53WZD3q9q5Hk3Ch9RyfIWr8vle
         h+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515146; x=1784119946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yoNhNhzB0q9E8EMX37oWxySCZEPTsjo22vi8mip+Rjs=;
        b=pSXFWfgs1MhVeEll0256Q4DymRdVe4mBX1h1DdPCz8jnfzHCuRAu26OxyrnhQhfbi+
         1XBA/r698fJu/3KC+YFOqc0/W65lO5HybfxgNjv56o9Ds1QbVH1O2bv8d7DOHZ1nKtWw
         1ERtaDkNxiXmOrStekeOSQFyloc3A8C7e0TpOq5GxVILd00bfwoEk3krFtXXBMyuP8ld
         +o22JU8RYIc/Qdc+AayMEKYoxWXGZA9wI8qu4wyQH2lr2q9tTS7MLD0aAEU/qOYoLP65
         0NIDqWmuhqz8+cAbxmMrlAMWPvqCG3Xb291Aw7lp8v8PHErNrtksr4pONIQU9sW7+ZsG
         HJAw==
X-Forwarded-Encrypted: i=1; AHgh+RrYCzXqHQkPkXrBuPVk6CqOryzmqaMC4hIitcsX0Xk9/5HnT83R9mRnu8sXisDca86EsVSZ2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVcnKG1/NdxKPtFliN77yr1tgk0hXAAjKP0dE9mBUlzWe5fCah
	vOU4AAdevWHEmTH1HMqMbHt+W/vtRIzk3ZRXHTyyyW1hdlc6KwSPJ3Yu
X-Gm-Gg: AfdE7ckYCqpgdB7O1EXNGuTHJ98X/Tna2i3PRq5cIkO7nFXH7sdBqrd6pkpCVvcd6IL
	DlixjkTzo6HPQi0JJdIsShp+idhW1so6Qo7x4FfHUrw9+37RKBXb9QV8gKwz5009Iyj639NqMYn
	mQB9u4E+m6JXn6VnIPqIWPolcY22vzQybg2pda3idnKtb72UtdW0dcvej5TOB727lRgZWm+VTEX
	VPJ/JihYcxUnK8br+s1VycD+uLfZLoAWxoj6Zg6xergHDcPlHRskfFQX/DQG1/JeP4TPqK3Ybmh
	r70DEFIblY/WRGFt/MoADYYLGfjoQalMjutOh7ymLzI7qNwLGt5Y+NcEIU5N9ZmWVxu2IoVJvDW
	6NKnQ2LDpbwwidzwt1LDGF7m/3b/sAGGter8lsHuuk1MNiktq6leRh+hEex842n9wOsnyQq6WsE
	tpPA39chcEEzb5/P/XPVkINZFxVuHxDMqoTyJT2RfZt9VSKUg=
X-Received: by 2002:a17:90b:2d05:b0:381:29f2:481b with SMTP id 98e67ed59e1d1-38940150106mr2633548a91.11.1783515145911;
        Wed, 08 Jul 2026 05:52:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:25 -0700 (PDT)
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
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime scope helpers
Date: Wed,  8 Jul 2026 19:49:52 +0700
Message-ID: <20260708125002.202515-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 Added Reviewed-by tags from  Charles.
Changes in v3: 
 Remove temporary variables and return directly.
Changes in v2:
 Switched to a helper function to avoid code duplication, 
 while keeping the guard() conversion since it eliminates 12 goto labels.

 sound/soc/codecs/cs42l43-jack.c | 138 ++++++++++++++------------------
 sound/soc/codecs/cs42l43.c      |  16 ++--
 2 files changed, 65 insertions(+), 89 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 934666295ee3..1f0a5c5cac8a 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
@@ -67,6 +68,21 @@ static int cs42l43_find_index(struct cs42l43_codec *priv, const char * const pro
 	return -EINVAL;
 }
 
+static void cs42l43_apply_accdet_config(struct cs42l43_codec *priv,
+					unsigned int autocontrol,
+					unsigned int pdncntl)
+{
+	struct cs42l43 *cs42l43 = priv->core;
+
+	regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+			   CS42L43_JACKDET_MODE_MASK | CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
+			   CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
+	regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
+			   CS42L43_RING_SENSE_EN_MASK, pdncntl);
+
+	dev_dbg(priv->dev, "Successfully configured accessory detect\n");
+}
+
 int cs42l43_set_jack(struct snd_soc_component *component,
 		     struct snd_soc_jack *jack, void *d)
 {
@@ -80,31 +96,34 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 
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
+		cs42l43_apply_accdet_config(priv, autocontrol, pdncntl);
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
@@ -112,7 +131,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 		if (ret < 0) {
 			dev_err(priv->dev, "Property cirrus,button-ohms malformed: %d\n",
 				ret);
-			goto error;
+			return ret;
 		}
 	} else {
 		priv->buttons[0] = 70;
@@ -124,7 +143,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 	ret = cs42l43_find_index(priv, "cirrus,detect-us", 50000, &priv->detect_us,
 				 cs42l43_accdet_us, ARRAY_SIZE(cs42l43_accdet_us));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	hs2 |= ret << CS42L43_AUTO_HSDET_TIME_SHIFT;
 
@@ -134,7 +153,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->bias_ramp_ms, cs42l43_accdet_ramp_ms,
 				 ARRAY_SIZE(cs42l43_accdet_ramp_ms));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	hs2 |= ret << CS42L43_HSBIAS_RAMP_SHIFT;
 
@@ -142,7 +161,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->bias_sense_ua, cs42l43_accdet_bias_sense,
 				 ARRAY_SIZE(cs42l43_accdet_bias_sense));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	if (priv->bias_sense_ua)
 		autocontrol |= ret << CS42L43_HSBIAS_SENSE_TRIP_SHIFT;
@@ -154,7 +173,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				       &priv->tip_debounce_ms);
 	if (ret < 0 && ret != -EINVAL) {
 		dev_err(priv->dev, "Property cirrus,tip-debounce-ms malformed: %d\n", ret);
-		goto error;
+		return ret;
 	}
 
 	/* This tip sense invert is set normally, as TIPSENSE_INV already inverted */
@@ -170,7 +189,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->tip_fall_db_ms, cs42l43_accdet_db_ms,
 				 ARRAY_SIZE(cs42l43_accdet_db_ms));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	tip_deb |= ret << CS42L43_TIPSENSE_FALLING_DB_TIME_SHIFT;
 
@@ -178,7 +197,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 				 &priv->tip_rise_db_ms, cs42l43_accdet_db_ms,
 				 ARRAY_SIZE(cs42l43_accdet_db_ms));
 	if (ret < 0)
-		goto error;
+		return ret;
 
 	tip_deb |= ret << CS42L43_TIPSENSE_RISING_DB_TIME_SHIFT;
 
@@ -199,7 +218,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 					 NULL, cs42l43_accdet_db_ms,
 					 ARRAY_SIZE(cs42l43_accdet_db_ms));
 		if (ret < 0)
-			goto error;
+			return ret;
 
 		ring_deb |= ret << CS42L43_RINGSENSE_FALLING_DB_TIME_SHIFT;
 
@@ -207,7 +226,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 					 NULL, cs42l43_accdet_db_ms,
 					 ARRAY_SIZE(cs42l43_accdet_db_ms));
 		if (ret < 0)
-			goto error;
+			return ret;
 
 		ring_deb |= ret << CS42L43_RINGSENSE_RISING_DB_TIME_SHIFT;
 		pdncntl |= CS42L43_RING_SENSE_EN_MASK;
@@ -228,23 +247,9 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 			   CS42L43_HSBIAS_RAMP_MASK | CS42L43_HSDET_MODE_MASK |
 			   CS42L43_AUTO_HSDET_TIME_MASK, hs2);
 
-done:
-	ret = 0;
-
-	regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
-			   CS42L43_JACKDET_MODE_MASK | CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
-			   CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
-	regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
-			   CS42L43_RING_SENSE_EN_MASK, pdncntl);
-
-	dev_dbg(priv->dev, "Successfully configured accessory detect\n");
-
-error:
-	mutex_unlock(&priv->jack_lock);
-
-	pm_runtime_put_autosuspend(priv->dev);
+	cs42l43_apply_accdet_config(priv, autocontrol, pdncntl);
 
-	return ret;
+	return 0;
 }
 
 static void cs42l43_start_hs_bias(struct cs42l43_codec *priv, bool type_detect)
@@ -369,22 +374,22 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
 {
 	struct cs42l43_codec *priv = data;
 	struct cs42l43 *cs42l43 = priv->core;
-	irqreturn_t iret = IRQ_NONE;
 	unsigned int buttons = 0;
 	unsigned int val = 0;
 	int i, ret;
 
-	ret = pm_runtime_resume_and_get(priv->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for button press: %d\n", ret);
-		return iret;
+		return IRQ_NONE;
 	}
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
 	if (!priv->button_detect_running) {
 		dev_dbg(priv->dev, "Spurious button press IRQ\n");
-		goto error;
+		return IRQ_NONE;
 	}
 
 	// Wait for 2 full cycles of comb filter to ensure good reading
@@ -395,12 +400,12 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
 	/* Bail if jack removed, the button is irrelevant and likely invalid */
 	if (!cs42l43_jack_present(priv)) {
 		dev_dbg(priv->dev, "Button ignored due to removal\n");
-		goto error;
+		return IRQ_NONE;
 	}
 
 	if (val & CS42L43_HSBIAS_CLAMP_STS_MASK) {
 		dev_dbg(priv->dev, "Button ignored due to bias sense\n");
-		goto error;
+		return IRQ_NONE;
 	}
 
 	val = (val & CS42L43_HSDET_DC_STS_MASK) >> CS42L43_HSDET_DC_STS_SHIFT;
@@ -423,45 +428,32 @@ irqreturn_t cs42l43_button_press(int irq, void *data)
 
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
 {
 	struct cs42l43_codec *priv = data;
-	irqreturn_t iret = IRQ_NONE;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(priv->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(priv->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret) {
 		dev_err(priv->dev, "Failed to resume for button release: %d\n", ret);
-		return iret;
+		return IRQ_NONE;
 	}
 
-	mutex_lock(&priv->jack_lock);
-
-	if (priv->button_detect_running) {
-		dev_dbg(priv->dev, "Button release IRQ\n");
-
-		snd_soc_jack_report(priv->jack_hp, 0, CS42L43_JACK_BUTTONS);
+	guard(mutex)(&priv->jack_lock);
 
-		iret = IRQ_HANDLED;
-	} else {
+	if (!priv->button_detect_running) {
 		dev_dbg(priv->dev, "Spurious button release IRQ\n");
+		return IRQ_NONE;
 	}
 
-	mutex_unlock(&priv->jack_lock);
+	dev_dbg(priv->dev, "Button release IRQ\n");
+	snd_soc_jack_report(priv->jack_hp, 0, CS42L43_JACK_BUTTONS);
 
-	pm_runtime_put_autosuspend(priv->dev);
-
-	return iret;
+	return IRQ_HANDLED;
 }
 
 void cs42l43_bias_sense_timeout(struct work_struct *work)
@@ -471,13 +463,14 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
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
@@ -490,10 +483,6 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
 				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
 				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
 	}
-
-	mutex_unlock(&priv->jack_lock);
-
-	pm_runtime_put_autosuspend(priv->dev);
 }
 
 static const struct reg_sequence cs42l43_3pole_patch[] = {
@@ -895,9 +884,8 @@ int cs42l43_jack_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 	ucontrol->value.integer.value[0] = priv->jack_override;
-	mutex_unlock(&priv->jack_lock);
 
 	return 0;
 }
@@ -913,17 +901,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
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
 
@@ -983,7 +967,5 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
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

