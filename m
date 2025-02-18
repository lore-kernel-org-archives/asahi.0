Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21AC23026F
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867944; cv=none; b=JFiliEaqBS/QIM4L/WbeST7yDLW1tEIgXMuEaouTv/kluoRMWIh+cSBVBZUHRzjntLeCT7inGwiMG6tOuBd8E63c2vI3WWFmAxBz5MzkwmYr+YdwuimZ9MMIukuSMus9gKtoXz8ZHGUM8TTsrrYkLHjh3c9hokeI3hHuK7+YeVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867944; c=relaxed/simple;
	bh=rfSKe5mZ28D4d/wpG3708ppy30x1Dk7ewBzxd+E8h08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hE5z327UZOWSCeeSzx56ZAgUVjCgztHyGnFZxrtBfS6N5Rh4/zpRZvA72t3g45aEEerlaym7E7f2pYR/cnj+olpMKtb/wh9UDroMkXM3oTmd/wvglvpjj0qLVqBR2j2vbHjbLAIVtiGPpjiejZs2cLcjFsH/gb40pWHDDRgZybM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dX7lPm9f; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dX7lPm9f"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220c4159f87so67793195ad.0
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867942; x=1740472742; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ogdzAXtsfl3vLsucowF8jbn32dNSIkJRvbsQxdRncfg=;
        b=dX7lPm9flyT3V18t7duDqKtPOU4lOjZKmzz4gBG4DKt6KuYri/x+L0O9rXLE7dZgxK
         fpawWWHK4E0ggT3BDaKUr/1OYj/HPHZWjjd/uPKUerTjGilqeousUblsHqD4FmsTU63C
         Q1XM8cZeVwdFXAXGr+o6nZp4CtG+GAcGKHfwVVdOC9OPNuJOHnKhKZ1kRMODKMPtv8Uv
         H3UyjgbjA2xTTbpWrTepNa/ocagpnaPneEBUzbbMzjE36nSNqmTVDVS/V9i5+xenq5xv
         hPJflbOzIijdHOpa7Qc+ERo6aujCOuiXgua/zCGSs/oGmFxlZprBUWcbxfv+EhhTa+nY
         nmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867942; x=1740472742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogdzAXtsfl3vLsucowF8jbn32dNSIkJRvbsQxdRncfg=;
        b=piI4kg+4NTynlCyCdzO5UoEKoD+dfz+ouet5qkUEkzOlpTGgZcsB3scJIWdJDVah1U
         ZPiLIqYs48iIduCQN/nBivKJOgYOfEYyNicQDUuensJGNvtiq+W9hgN/vTpGJhLXUeZV
         U9GjJx7GkwAjxbHhcmXxj0au++agoOz0/6ehhKhOPBgzwclbduG98WD9kxb4bR778NH+
         LWA7xpI6CCV1e64VUoKx6F88OZ/vQDzgj0OyXY9LTy8e4XG3IfEqfxtwS2qUODLXal1h
         VYS3D6/4r97MUwvyAF+v3G5+BuzgxccJH0J86INuRUZ5+POnIlbJcq3uKGvfnBainqfn
         gvwg==
X-Forwarded-Encrypted: i=1; AJvYcCWu/oF/ikiXKjaCJd+iPf2IgLwMRO95qIhSJrNGjGwLcm6Jc13bM7Vop5B32nFfFj2WVVAjmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxr3dHlQtXBeKVCmwN62qRS1iyNr/XGMZ+vRev2xYskUerI0452
	rLn7G9H1F69Xdn0vanxS9IZvCmpYUaGlJgJEjPPDIiopjARIJJLo
X-Gm-Gg: ASbGnct5nxaC8CbCtoRZbyNjWR7vfy4/9KSRzIGRkNmULk7G7/sF27AZuUuF+HbtrmB
	i2FkY37eHXzLq2XIGhy6cN8JnCMjYbNgce/xkD2VKf8uCT5z0eDsHJdS7EhZwX3itgK9l66HlBG
	sixSSONEygYfe5zH31pjsiYqBBUWwa70Z4hvHGi/Ef41WzOJzcoszFqY8QUDWZFOHmNKQLyRWaK
	gv28o7t9gFQ61DOTvgiRuiNYzprUievRTxKk4aJoGWL9Yqs/sH8UnB1uCCAmGhkS4SPSGBqEfZ4
	JtST/toZIKnw3lESeBusbtYAZw26/pDfdVYX35oMs4CdrjVaVl9TVCRhBmCDUdmfw62M9TmhpIi
	UYrfnKzgGPg==
X-Google-Smtp-Source: AGHT+IHanfwIgxnK+GSgc9xAFapLO97DcmqVFwllMpPjle8zRchZcy+lMRf9zQdA+z6x8TwzFrX7Yw==
X-Received: by 2002:a05:6a20:2591:b0:1ee:69db:b0b7 with SMTP id adf61e73a8af0-1ee8cbf9ce8mr26104509637.32.1739867942036;
        Tue, 18 Feb 2025 00:39:02 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:39:01 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:58 +1000
Subject: [PATCH v2 24/29] ASoC: tas2770: Add SDZ regulator
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-24-932760fd7e07@gmail.com>
References: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
In-Reply-To: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4983;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=31ZxtlNvaMyuUtkGM3THLQ+tO/J0r+H3zZSixDq9Hh4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3JKkpP6pnemN/XBnZoi34AEN12eJp/f084b7d2X/3
 M+Re/lPRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABPZacPwz8jdcMEsjpWLwh5E
 bFacM2/P7hP9wVvqd8y88eV9+8z03V0M/7Pmz8h3WFz58OdD1zkTRZ03606d4W/19K/cdff17h4
 NQmwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Multiple amps can be connected to the same SDZ GPIO. Using raw GPIOs for
this breaks, as there is no concept of refcounting/sharing. In order to
model these platforms, introduce support for an SDZ "regulator". This
allows us to represent the SDZ GPIO as a simple regulator-fixed, and
then the regulator core takes care of refcounting so that all codecs are
only powered down once all the driver instances are in the suspend
state.

This also reworks the sleep/resume logic to copy what tas2764 does,
which makes more sense.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 67 ++++++++++++++++---------
 sound/soc/codecs/tas2770.h |  1 +
 2 files changed, 45 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index fee99db904a5885d740c1cfe8ce2645a963c6e1d..6f9e56f02f7ca95d7878c68465d7016213ae417a 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -72,23 +72,21 @@ static int tas2770_codec_suspend(struct snd_soc_component *component)
 	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	regcache_cache_only(tas2770->regmap, true);
-	regcache_mark_dirty(tas2770->regmap);
+	ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+					    TAS2770_PWR_CTRL_MASK,
+					    TAS2770_PWR_CTRL_SHUTDOWN);
+	if (ret < 0)
+		return ret;
 
-	if (tas2770->sdz_gpio) {
+	if (tas2770->sdz_gpio)
 		gpiod_set_value_cansleep(tas2770->sdz_gpio, 0);
-	} else {
-		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-						    TAS2770_PWR_CTRL_MASK,
-						    TAS2770_PWR_CTRL_SHUTDOWN);
-		if (ret < 0) {
-			regcache_cache_only(tas2770->regmap, false);
-			regcache_sync(tas2770->regmap);
-			return ret;
-		}
 
-		ret = 0;
-	}
+	regulator_disable(tas2770->sdz_reg);
+
+	regcache_cache_only(tas2770->regmap, true);
+	regcache_mark_dirty(tas2770->regmap);
+
+	usleep_range(6000, 7000);
 
 	return ret;
 }
@@ -98,18 +96,26 @@ static int tas2770_codec_resume(struct snd_soc_component *component)
 	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	if (tas2770->sdz_gpio) {
-		gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
-		usleep_range(1000, 2000);
-	} else {
-		ret = tas2770_update_pwr_ctrl(tas2770);
-		if (ret < 0)
-			return ret;
+	ret = regulator_enable(tas2770->sdz_reg);
+
+	if (ret) {
+		dev_err(tas2770->dev, "Failed to enable regulator\n");
+		return ret;
 	}
 
+	if (tas2770->sdz_gpio)
+		gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
+
+
+	usleep_range(1000, 2000);
+
 	regcache_cache_only(tas2770->regmap, false);
 
-	return regcache_sync(tas2770->regmap);
+	ret = regcache_sync(tas2770->regmap);
+	if (ret < 0)
+		return ret;
+
+	return tas2770_update_pwr_ctrl(tas2770);
 }
 #else
 #define tas2770_codec_suspend NULL
@@ -603,11 +609,18 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 
 	tas2770->component = component;
 
+	ret = regulator_enable(tas2770->sdz_reg);
+	if (ret != 0) {
+		dev_err(tas2770->dev, "Failed to enable regulator: %d\n", ret);
+		return ret;
+	}
+
 	if (tas2770->sdz_gpio) {
 		gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
-		usleep_range(1000, 2000);
 	}
 
+	usleep_range(1000, 2000);
+
 	tas2770_reset(tas2770);
 	regmap_reinit_cache(tas2770->regmap, &tas2770_i2c_regmap);
 
@@ -629,7 +642,10 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 
 static void tas2770_codec_remove(struct snd_soc_component *component)
 {
+	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
+
 	sysfs_remove_groups(&component->dev->kobj, tas2770_sysfs_groups);
+	regulator_disable(tas2770->sdz_reg);
 }
 
 static DECLARE_TLV_DB_SCALE(tas2770_digital_tlv, 1100, 50, 0);
@@ -769,6 +785,11 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 		tas2770->v_sense_slot = -1;
 	}
 
+	tas2770->sdz_reg = devm_regulator_get(dev, "SDZ");
+	if (IS_ERR(tas2770->sdz_reg))
+		return dev_err_probe(dev, PTR_ERR(tas2770->sdz_reg),
+				     "Failed to get SDZ supply\n");
+
 	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(tas2770->sdz_gpio)) {
 		if (PTR_ERR(tas2770->sdz_gpio) == -EPROBE_DEFER)
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index f75f40781ab136cccbe1c272f7129ddd3e4a22a3..f75baf23caf3a194a040474a7484a3d44f673435 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -134,6 +134,7 @@ struct tas2770_priv {
 	struct snd_soc_component *component;
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *sdz_gpio;
+	struct regulator *sdz_reg;
 	struct regmap *regmap;
 	struct device *dev;
 	int v_sense_slot;

-- 
2.48.1

