Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847FD3E009D
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780963; cv=none; b=XQBO/slsynpgZnyEv6rnBmhKegE0eJpHtg4dGyNX7WqaEj3HBTgr6L0Jb5gW1DQJK6MMCP6n0l+3NoXEtoFCxVKf5detRn4xfy4M7AEWduUNvrSX+VIGRiv0CxGr9tAFtVPF5nZzJiKzOkGr+GiVMB0wFbPMOHqGXGL4Fj5SqsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780963; c=relaxed/simple;
	bh=9eLKKTv14da0IXCzpSeoChYsabAzS0BWIAzAJYA3gf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3U7ZwzDuXDYLlqE5rVfDWWkfnjI0mFK2esQTxsg2ce74UoStjGP5W2DOdwtzmBQ8XnUs2Wv4B2xbfmc29dGyy0mtfrW0NAwbSSrmDIdfKqgZJLBs/I9lF6dNYKmWx3dR/1pLenr2WYFQr/ITQioT0TwCxgMpKivU2Rv8axp0Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBdYJiUG; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBdYJiUG"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6bb8a5980so5691235ad.2
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780961; x=1782385761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iam6sOaw4t4SQ8HW45BuU6pnPmpQPvQwQp9j/RbUvJo=;
        b=OBdYJiUGmo6kmQf2PRX2KirTCGiYEqS6BbAPHAr30Zx8ERlMkXER1y3O/nqx+aEtE3
         Kiq7VGYdT6jH/UiTC7Mk5J4h3qOe5HJKFKj8G4pQrjvs3gJZFW8LSyQrHiErqctVCnE0
         2RnSgy8eWZGQb6qoCVt9sBBlQh4pG0bJHB6XZfzFVMRggrgh5DoIGg5kC75FeHTMS/Bq
         xEWWaDm/eQDbC05HDNfe1+nN8lVD18PRScWTODEzvsUyhc5yGyU9yOcoVv3Vqk8ys42X
         EDXSAX2WfLN27RNYxABydZVVrYmSqb2kWvN5Luz6Nv7qGFnHROMBlEeGGmD8kce0XZ6O
         +H9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780961; x=1782385761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iam6sOaw4t4SQ8HW45BuU6pnPmpQPvQwQp9j/RbUvJo=;
        b=OvMOAgSmP90PPbI5t/JmMbSBz++DFVDIZBjBfm8EpoVXkGZo3Z9XJ4XRsGtRFjOLAd
         B2mOyc+QZMyRFUjvBPH9HQJL6bgkbh3FUBsOEUbq5dBuomGaVx6yVMwKiXCtryLi2BqW
         V6296nFzMIZKu+zKM6izqx7K7rTGAVZxmu9BXVJW1MQoiOq1OB7+Zt0p718t1ncVKxoY
         pfzm067kSLKDvoaWzFiOQo3yrOycTHunQZzYLgCI6TxeXbFc/5sviI8jfDMpIJ7yg1tZ
         R0+Xi4C6ybTCz8SZnY+V9ONafaPalJ5aok4+jixdtcjEezDUDwbsH/CTjOoMEzRQ9RAl
         +TFg==
X-Forwarded-Encrypted: i=1; AFNElJ+kdQ6qI44UGrZAJByst7XtUeT0xX0UByao6SANF0rMR0EPgi2WHeRmxRUHAUvZXtyGyzp2eA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKAx9pb9JGgRC509qiDbajTGCm6MGZIu8ut1b6YycxxqWfV/9v
	yapAJG24POyUWktMtqNOqczO7qgFVFgKI+f4ldV5SmqLNcv0AiEAxChu
X-Gm-Gg: AfdE7ckdK8E29eoXoc9T3xHFLSKJ6sZK8NCbeCYbb7bkdmyr3m6tUrbAep8pKq/hCoW
	z9tqcVhbgzeI/Sjlc4CUAvPfT8yGptpYEVhRoW7OITcNROp0T4E2IMVMuIRn0/4LstbkUP+2XXU
	8KnDysHgT+x80Kd839G7vcq8E7A0+qppH29HzSzblTTfi3tgMWS7+3G1R8qwHkAo1ROeiHBSr9d
	P6XAWQKQR62/JngD07rO7pKY81OtdyhagQ8WA3xo5K8S5uHCc/wsrBpzIA1VNmQCSR7/au781md
	7SU6GtfBzOEBgXxj5bkKAeeIso00euYHHK6XXQQvACqH1/6iDijBlKsrqtj6AgeuhKgpOpOwfMN
	byGOSVDJqRiqFu9lTntrUnxDrKz/Du10J2gUHfYHkFyWyPkDUQUm31kEfo/AOtgS2yZBVdv9Z/0
	8X2elE2gVedzH+w02CT9ybVmT1AoyIJ7pGObRgl7PwzXkaG9M=
X-Received: by 2002:a17:902:f688:b0:2c6:c66b:4b03 with SMTP id d9443c01a7336-2c6e4746cb1mr34135155ad.10.1781780960796;
        Thu, 18 Jun 2026 04:09:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:20 -0700 (PDT)
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
Subject: [PATCH 60/78] ASoC: codecs: tscs42xx: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:09 +0700
Message-ID: <20260618110827.232983-4-phucduc.bui@gmail.com>
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

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tscs42xx.c | 44 ++++++++++++-------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index dba581857920..66810b992935 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -210,23 +210,21 @@ static int power_up_audio_plls(struct snd_soc_component *component)
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C, mask, val);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL on (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	if (!plls_locked(component)) {
 		dev_err(component->dev, "Failed to lock plls\n");
 		ret = -ENOMSG;
-		goto exit;
+		return ret;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
 
 	return ret;
 }
@@ -236,26 +234,24 @@ static int power_down_audio_plls(struct snd_soc_component *component)
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL1,
 			RV_PLLCTL1C_PDB_PLL1_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL2,
 			RV_PLLCTL1C_PDB_PLL2_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
 
 	return ret;
 }
@@ -269,13 +265,11 @@ static int coeff_ram_get(struct snd_kcontrol *kcontrol,
 		(struct coeff_ram_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	memcpy(ucontrol->value.bytes.data,
 		&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE], params->max);
 
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
 	return 0;
 }
 
@@ -290,14 +284,14 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 	unsigned int coeff_cnt = params->max / COEFF_SIZE;
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	tscs42xx->coeff_ram_synced = false;
 
 	memcpy(&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE],
 		ucontrol->value.bytes.data, params->max);
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	if (plls_locked(component)) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram,
@@ -305,16 +299,12 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 		if (ret < 0) {
 			dev_err(component->dev,
 				"Failed to flush coeff ram cache (%d)\n", ret);
-			goto exit;
+			return ret;
 		}
 		tscs42xx->coeff_ram_synced = true;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
 
 	return ret;
 }
@@ -385,19 +375,17 @@ static int dac_event(struct snd_soc_dapm_widget *w,
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	if (!tscs42xx->coeff_ram_synced) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram, 0x00,
 			COEFF_RAM_COEFF_COUNT);
 		if (ret < 0)
-			goto exit;
+			return ret;
 		tscs42xx->coeff_ram_synced = true;
 	}
 
 	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
 
 	return ret;
 }
@@ -926,12 +914,10 @@ static int setup_sample_rate(struct snd_soc_component *component,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->samplerate = rate;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
@@ -1253,12 +1239,10 @@ static int tscs42xx_set_dai_bclk_ratio(struct snd_soc_dai *codec_dai,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->bclk_ratio = ratio;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
-- 
2.43.0

