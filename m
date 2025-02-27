Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6473F22DFB5
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658274; cv=none; b=L8z4Uij5VgqATX4M1E9BJT3aX3Mi/6v8VDPUswgNUtofku01TGUeOCWGPYS3517d8lWajY4ubwd+gHPyniLJnHz5fH/aKK8OvDQdoKcKk3+yaVjIO5PNbpSiuAGiAFmW+WiQgPe/hOI+pGm2+7wXOn8U9cJSlRPEnB07C58Lx4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658274; c=relaxed/simple;
	bh=yZydHPNdGIYsVnf3K1xg5E1giRrWR5AHZC+gJLTWWDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXOB7kwLV8yJo2DJB1fCrcAKvWmIaYeod7JTxYGgDt/JooW0CH2zFKacWgARXlTW1JbjYKxoQfdLQWYEACY1XfiaIB1YwRkbaJOf5hHDCTdaPZHOSOAnobu0wA+bx9i0F9p0K+fCY3cMN9Ec1lPaTQZ0MzHuyrkblmdReQwSH3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot93P7yb; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot93P7yb"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22114b800f7so15137665ad.2
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658272; x=1741263072; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MIMx3In11Gk8ks7z3N/b37m0dqaRTkRDgguGpWwk9w=;
        b=Ot93P7ybyPwdZkXJkH1/oe5TQlExo9FYOfDwY4vgViRSzKSEWUrMo9ETD6cqEoEzsl
         hmiGk1ePhZTJEjPRYGK00p6PHmF9JHo0OoxFC8veAzqp1UqNweI9+h+7IkLeKysuI8nH
         UaSoW1eakgioQTVeetQoPyX855YmMQdebAr8QD9sjS3dZjedA+gTcFSazpgZoM8/cKUL
         yPzlrU+tDCSPzEyJK1jUAfPp2Iur+piSFQ3qfZzmLsySGhYKMCCh+9XZElk0ZZjGSDSJ
         5akA5VJL69zScC29x+qH3gwrBGlX8rcjUmhMfZw6P5/ZxWP2OuNng4Em8XTDuE/PzTCF
         2GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658272; x=1741263072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MIMx3In11Gk8ks7z3N/b37m0dqaRTkRDgguGpWwk9w=;
        b=lEvA7IIxJRQcSxSOnZsCjYIxsZ3d9FfZBQgKJykxXTd4lv1uO613EPyckABWQESsqn
         My53NrQP3OZE2WSIN9Q1/tgBbtTbF19Vx58tL2qXia4vAtggUiZwzG6X48Zwghqj2jUC
         IgkioHIbOt7Cs0aRQb1IZV6L80xiIW4BmuvmVnfRAyu6aSwWH1gZrEKyKyD3Y0RgOG1T
         klSy3VAQP2e+LYQN93E3AcAk0BQtA53o4nZ7s2wV8FFGIICYPPWcSPUplqiz6EsFJ5co
         ZAT1EUtNWrbGBKjmTRTB2SdCCMBOoTpE4tJJSomPpSKjKf+Q+OrgwnHNuJaRxWJ0fUr+
         RSpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf+/I0FySSBdcJki5OzAOxalBsw/xp5pFpLf/zWrtYraEBbgIQf5KcjeKTkjCVGr3oZa1h3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzvf3S5Ev3wHK+GnWE7NtvKUR3tJY0L6PmdKBsv4xP7qQwfUznp
	CjgEV/5kFC3pkP5N3LBRIVoiPpAWHxBkOZLC2oIUqHbxcrBL2dgGxfctv1dH
X-Gm-Gg: ASbGncuxM8WBAAQkNia/Tlr50C910Jq9t8QZ3IUpPFwQl7NVm/CQiHGyRZAoZmgtNUV
	HDOSUvW1EFRIM3IGqAdVnYJPnJm1N4CV0X/5x7crTWUAulOwogHIDhIBdG6yc8kaKvCUdrx33DB
	AJEU5vTlmCXxXYMZ1IY8BlGlfDhrK6+FdLzlCjCWMIKMoUs8EJeg1qVopcClrRfFQsWpDm/bcl5
	/rhdxOtmYqdawqzwzUSg3QbVQz7ds+1PBdcKgL4fnkkIy5333G1CQ9vJwZZZIfJp0C8+yUZPZoy
	KRKs+68TcXXKmOMpZeaZxB3l+Ua4cahWcHVwxbSkly3EFE+ZLQ4eyT+BL/itKmHWc3c9UCNSibm
	R8zVyQ8HosRgXTLg7l31U
X-Google-Smtp-Source: AGHT+IF8lzuWjspI3rZZ0uV71kzeqQ26k28SoHirl/vgYdWn55Xm/H8mpRaOkg0dIY3LwKc5KspWVQ==
X-Received: by 2002:a05:6a21:6d8a:b0:1ee:afa2:4e59 with SMTP id adf61e73a8af0-1f10ae73256mr14523491637.36.1740658272425;
        Thu, 27 Feb 2025 04:11:12 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:11:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:45 +1000
Subject: [PATCH v3 18/20] ASoC: tas2770: Add zero-fill and pull-down
 controls
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-apple-codec-changes-v3-18-cbb130030acf@gmail.com>
References: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
In-Reply-To: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3560;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=4TvbG9xciteBIsrWMUMKaDHyIsLMWBeBIr/XFRJjgig=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk/v4eC12p1fJPXYbPYBnmZ3a76vRyZ+bFN65L29a
 u6rwHfMHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzkEQMjQ4dGQsCuPqZPbAvl
 bne9lptaPk9sb3NxOdsVE4fJG0wWfGJkOND2a4uuvM/RtVwHLAo/v2plbm27Ke4aLvtQrXfblw2
 mvAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Expose the bits that control the behavior of the SDOUT pin when not
actively transmitting slot data. Zero-fill is useful when there is a
single amp on the SDOUT bus (e.g. Apple machines with mono speakers or a
single stereo pair, where L/R are on separate buses).

Pull-down is useful, though not perfect, when multiple amps share a
bus. It typically takes around 2 bits for the line to transition from
high to low after going Hi-Z, with the pull-down.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 17 +++++++++++++++++
 sound/soc/codecs/tas2770.h | 13 +++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 787356a4f4256627a55e35c851a9e78a1cf29771..252c65ae839a28fdaf7aaa39faf49891905741a0 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -632,6 +632,20 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+					    TAS2770_TDM_CFG_REG4_TX_FILL,
+					    tas2770->sdout_zfill ? 0 :
+					    TAS2770_TDM_CFG_REG4_TX_FILL);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
+					    TAS2770_DIN_PD_SDOUT,
+					    tas2770->sdout_pd ?
+					    TAS2770_DIN_PD_SDOUT : 0);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -771,6 +785,9 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 		tas2770->v_sense_slot = -1;
 	}
 
+	tas2770->sdout_pd = fwnode_property_read_bool(dev->fwnode, "ti,sdout-pull-down");
+	tas2770->sdout_zfill = fwnode_property_read_bool(dev->fwnode, "ti,sdout-zero-fill");
+
 	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(tas2770->sdz_gpio)) {
 		if (PTR_ERR(tas2770->sdz_gpio) == -EPROBE_DEFER)
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index f75f40781ab136cccbe1c272f7129ddd3e4a22a3..7da60d2746e8b03faa9d17319c4c41cad7f8cdbd 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -67,6 +67,14 @@
 #define TAS2770_TDM_CFG_REG3_RXS_SHIFT 0x4
 #define TAS2770_TDM_CFG_REG3_30_MASK  GENMASK(3, 0)
 #define TAS2770_TDM_CFG_REG3_30_SHIFT 0
+    /* TDM Configuration Reg4 */
+#define TAS2770_TDM_CFG_REG4  TAS2770_REG(0X0, 0x0E)
+#define TAS2770_TDM_CFG_REG4_TX_LSB_CFG BIT(7)
+#define TAS2770_TDM_CFG_REG4_TX_KEEPER_CFG BIT(6)
+#define TAS2770_TDM_CFG_REG4_TX_KEEPER BIT(5)
+#define TAS2770_TDM_CFG_REG4_TX_FILL BIT(4)
+#define TAS2770_TDM_CFG_REG4_TX_OFFSET_MASK GENMASK(3, 1)
+#define TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING BIT(0)
     /* TDM Configuration Reg5 */
 #define TAS2770_TDM_CFG_REG5  TAS2770_REG(0X0, 0x0F)
 #define TAS2770_TDM_CFG_REG5_VSNS_MASK  BIT(6)
@@ -110,6 +118,9 @@
 #define TAS2770_TEMP_LSB  TAS2770_REG(0X0, 0x2A)
     /* Interrupt Configuration */
 #define TAS2770_INT_CFG  TAS2770_REG(0X0, 0x30)
+    /* Data In Pull-Down */
+#define TAS2770_DIN_PD  TAS2770_REG(0X0, 0x31)
+#define TAS2770_DIN_PD_SDOUT BIT(7)
     /* Misc IRQ */
 #define TAS2770_MISC_IRQ  TAS2770_REG(0X0, 0x32)
     /* Clock Configuration */
@@ -138,6 +149,8 @@ struct tas2770_priv {
 	struct device *dev;
 	int v_sense_slot;
 	int i_sense_slot;
+	bool sdout_pd;
+	bool sdout_zfill;
 	bool dac_powered;
 	bool unmuted;
 };

-- 
2.48.1

