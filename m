Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F1F43E49F
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692627; cv=none; b=jgTyUCHRyo21wtsn5BF+LVXvK8gPuq21AdBvcT3z/8XZSVTNq/+9bMSejk4UY8drInLDzaefsjrSTQPMRy9wL72CiCbKr43ild43JkXt4EP2QN/zqOGzay6Hqu8G4QyZEf6Bc2R7sMzKC1hMdOB59x1u4KN1Pz9IwqqfYG05ZP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692627; c=relaxed/simple;
	bh=DOt3EGUqpXHD2f19fHf8exVet1GktAa+R4mDT7U7BeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eA0qs42NW85K7bJKcQ8B62whZin9ra6QLmx8POEuSNdEcmfUTTemuSmuhotISuv0AF2e4fM3ElxjF8jOat71i6j683fJksbQINYWN11bOd3W0R3rtJ1M4OnSxY58FUxml3vSdsvSB53iCqnrX4Tuy8Q16ZAkkLb/22R6ye5Pwao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmw6HPFf; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmw6HPFf"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-307d0405e07so8458860eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692619; x=1782297419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYw5REkKxp624MWyS0jRryzwnCCP8XOG37PLDOHEuTk=;
        b=Tmw6HPFfhHd33L05Vvee2zrEm3wNPHSk3Yb7aanUYTHcNbf27/x5cBUHms5/0/Qs91
         tGHMoz4UZwpLlMtAqFyswu6rJMBGa7soy3EYF7Q/P2P0nxmD3TVhDg2++VsU50BkUB71
         SjBWtjFYr3oa+kY1JUMKmvRXc1Abg3wKJzIHgDqLRNMUJ1opExqHM0GwfNYeJM5EHock
         abEzE1L7DD8cMuji06Wl26j18WzVsjXOusFnxFToXhpOASb6O6tB31gbF/4FczEBcoyj
         1gABgDQhd+UhdTqd8a/8FTEwk2wXmmdgOokR+T5x73glMxdzHIWfSvfnrtHb5rmgyg8I
         rstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692619; x=1782297419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dYw5REkKxp624MWyS0jRryzwnCCP8XOG37PLDOHEuTk=;
        b=O29ohqnI9BxSewGTHAbRERlnaZqtDZXyCNG/qeZWuuNEzFNYTLtrwc/R7eZ7TocBeD
         MGa2v5TAu+iByZXkCH6gsBnZ2Ecj0riyVC5pkBnzysXbF4pybTgGVNwyIvQUR+JgYxTt
         0ViO4uoTl4z5oO9LR0NCvLCLcieZCyUVl5YzuKzDrKpqU48pda31gyw43h+1bobUpDNa
         UCAWYjhcWJPJb9q+hbfHA0Fo2j9+8cFOPv2Ih7+SNXHtL6isvQzJ/PjBZwK2rKoGnO17
         27f6E9DAcvKBoCSA/vZb8FNo/U27eVZCXykl96v2/wVU1W7tGb7WGvbi1nZbRey5djhA
         4z6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8jPnUXivvX29msu4YnY8E8LSJ7WEXwzD9Bv6epxcl/Vc1hY5vKI9ot/kJbFPU6+wmVStaQXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzU3tJ2ZnFmLk7oc8jQ3Eo7bedAujJIGPADlg0hFqOL2KkOCupW
	LdiIDgXaE+EioFMmHqHEBWSs5h+77ZuDirPuQXiVaVc2BsD6YmzARTXv
X-Gm-Gg: AfdE7claH4NoCd6oXuVQR2aToJu5j5zh31cQxhVEGCtyeLdQNIBgLiYdfuUgBpsUIRS
	/qPEmi2eYYIa0uyr7G76vD5ATlNigE9/cL7CUk72lFB1AKlfGyqEiqQl1QEizN9HabOa1EgrjML
	UwnJ6fxfQWiS0qSMZ/afb+8Z5LDb+emwM9LYpbUFSDXXIjDAw+NvatLZmIBCJYoTJr/nUmApJ5q
	J7gMsziKgX+Wius0HB5AbtEsjz7RM8DHaK+x8LmkWcKXn96+R5am+xeXbQiKuipJCyR10PRe0UQ
	zIqydlEUG5ypubUy332AquzvqDmpu0VRx1h15xGjQPmfkbgGF4H89ikfJtXAHmsxUACuMzLfrej
	3hM+XF/0tolwk6FqENaG+wwGMh7R5rWTWjFmnfwjcBGMXi93GBCTdgvV0hkkl/+wYbv2C890f6m
	L6QKqh7eoi2H0tuRQv350jfNcfNLUwG28Ks1mHbf+M10q+4jg=
X-Received: by 2002:a05:7300:1481:b0:2ed:e14:42e9 with SMTP id 5a478bee46e88-30bca21d5d8mr1702825eec.34.1781692619223;
        Wed, 17 Jun 2026 03:36:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:58 -0700 (PDT)
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
Subject: [PATCH 26/78] ASoC: codecs: da7219: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:43 +0700
Message-ID: <20260617103235.449609-27-phucduc.bui@gmail.com>
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
 sound/soc/codecs/da7219.c | 59 +++++++++++++--------------------------
 1 file changed, 19 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f0874d891e12..171ee6346b2e 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -256,13 +256,10 @@ static int da7219_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -270,13 +267,10 @@ static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -284,13 +278,10 @@ static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -298,13 +289,10 @@ static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -422,9 +410,8 @@ static int da7219_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7219->ctrl_lock);
+	scoped_guard(mutex, &da7219->ctrl_lock)
+		ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -456,12 +443,12 @@ static int da7219_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
-	if (ret == 0 && (val_old != val_new))
-		ret = regmap_raw_write(da7219->regmap, reg,
-				&val_new, sizeof(val_new));
-	mutex_unlock(&da7219->ctrl_lock);
+	scoped_guard(mutex, &da7219->ctrl_lock) {
+		ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
+		if (ret == 0 && (val_old != val_new))
+			ret = regmap_raw_write(da7219->regmap, reg,
+					&val_new, sizeof(val_new));
+	}
 
 	if (ret < 0)
 		return ret;
@@ -1167,15 +1154,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	if ((da7219->clk_src == clk_id) && (da7219->mclk_rate == freq)) {
-		mutex_unlock(&da7219->pll_lock);
+	if ((da7219->clk_src == clk_id) && (da7219->mclk_rate == freq))
 		return 0;
-	}
 
 	if ((freq < 2000000) || (freq > 54000000)) {
-		mutex_unlock(&da7219->pll_lock);
 		dev_err(codec_dai->dev, "Unsupported MCLK value %d\n",
 			freq);
 		return -EINVAL;
@@ -1193,7 +1177,6 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		break;
 	default:
 		dev_err(codec_dai->dev, "Unknown clock source %d\n", clk_id);
-		mutex_unlock(&da7219->pll_lock);
 		return -EINVAL;
 	}
 
@@ -1205,15 +1188,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		if (ret) {
 			dev_err(codec_dai->dev, "Failed to set clock rate %d\n",
 				freq);
-			mutex_unlock(&da7219->pll_lock);
 			return ret;
 		}
 	}
 
 	da7219->mclk_rate = freq;
 
-	mutex_unlock(&da7219->pll_lock);
-
 	return 0;
 }
 
@@ -1298,9 +1278,8 @@ static int da7219_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 	ret = da7219_set_pll(component, source, fout);
-	mutex_unlock(&da7219->pll_lock);
 
 	return ret;
 }
-- 
2.43.0

