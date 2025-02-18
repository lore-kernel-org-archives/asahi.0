Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E640922D4E6
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867835; cv=none; b=MckXIoejfF9HuI8e+vVGbXMPOV5JDIDFSGHj9FCZMi7wfTF72LK819UpmXQ1cUJutcdzc7OnXbwrBcoWUuw3FrrxVyky76svW16dm92Lj6tZTbjUQ6cF5Ap1cg1+pCA9NHo9Fn6o+n2djUvZnt73JMX1WA8jBG64SXJilI7ZPmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867835; c=relaxed/simple;
	bh=b2j7CSiACw8SRnoO0dJf/ZnIOm1P9PRFDL2lbTQvzF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMRRd+GZJw+2Z54qYMQgW5pFwg6+qm3wCZhpTTMWhjGVh8U1lWucVvSffmmH4IpqXkWd5sVNqNbfNoH77bwTFRGdY5wox/yf38+yrDRr3IN0A8GoQPGPfACfAN/wfyPDIAukzlXQBjsT2tFZycUUNKrisY5XEix7xlUqR6tgYME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hw+Q5tma; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw+Q5tma"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-221206dbd7eso34659905ad.2
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867833; x=1740472633; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZXOZtJRNcMxbwvAxDPYaBnHs3AWQQ3XLqmgpymYN0k=;
        b=hw+Q5tmauRX0tT2XyYzwZi1NMASa01iij6UKB6C9eNaF+va/8YxDqwVGR67pnei2fY
         Khn9BjF+at13gzD7/ReZHGcW6qPmNZDcYuUujpg2NwIXPvVvlMN0yLew7p+TB7FC/7Jb
         64o3uitNvOa1FpHM6Etc5oy73gPxOzFeydeFrHzNYGnMaEjcUcd8rzHJ5iVJwPjDC7i+
         jVRMZ/xwj23vS/KpUKa/gk0mCoixqRvu8enaEwfAImtuaICp2OZEc8o5HXg2j6g8sd5b
         x1Xc74Fr9ojEsuPciHu4FgLF9g66i2FDBLZsRKQkrY1ZOciBAeZVLSDwWAoyKVA7yXff
         gXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867833; x=1740472633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZXOZtJRNcMxbwvAxDPYaBnHs3AWQQ3XLqmgpymYN0k=;
        b=Gcuap0Xeel28DsrG0pq3Ow9yqVpOdOh/KKwoXBV4Iaei9g2oCOs39V4cbAqhjkHE4i
         7oUJh7wKXg92IVRD8/Lr9aDD1zhLjcsifYQb+0OfC7tJOCKYcaCe+KxUXSCoiAm380G7
         i9sK/+pbOxRIBPM5iLtwUc0yKs7smsnygFHLUCPFIM6mtFbUFE+vPIV4LU6M2ar1eykt
         1//tHwV8CgRJYy7hOiYMAYDbZqzuCmRj2WnWZ03TdGp39XlrrpaeFRIrklNiDT6OSCDN
         2OV9sZPg/KI4Jw/37itAwNJvtN28foVnVA8bBrITPMdBm2F1NDDB5IhvBrDG8lOUcCl/
         FmCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3nRTvFGC/CqHD4vUFBUYe7R2FWnoeTLzx+iB5NFOOoHcUsEnL63BcNAYdJ5exZ50mSEYSog==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIaJ86QQuaWF3SFqcK134191hW0Nq631GpuDftj1JxNbekvKQJ
	XZQFbSl+2dLgjgFRBBNWh081rtx4AMC9fRj+KmPCghYkKKlwvZRR
X-Gm-Gg: ASbGnctD7QCoBt/HkxjwtuUzzTgP4vIYc+vc1cO/xk2c5hlEY95WdHLlhKlkshgASQj
	H4x9BekWaKO/vpLB9JtUxoWd4UHbsWRPX9yWuYeWg4kstmf1bj7bV/8POHja+7FU/5gSV7teI2D
	deXDqVbA5W4umbRWjPei9yAUGJRXBFprK6NUQdsSpolZ3TInVflQEpbCOL08mKc379AKZmg7GAq
	CshDwdgb5iAJbO6OgwZXTEReLYfQtX4iGTOwe5czAGcXVbbPQLbQRvkftegsqFlfk25g34uFzY/
	9sBSh8N7wqPce/pg30/pQx2obif4Blm/Tjygthua5M1M7gQB/2xtyzF/55zDCk+KeXtRujhy3ai
	b0EeSY+p7rg==
X-Google-Smtp-Source: AGHT+IHjc8Lzg5/Ok3MfsQ+QSDaYu/Z/31zh5KduSVebpMli7UVfvUjcknrjjiFtN5LTobyfTkKrww==
X-Received: by 2002:a05:6a20:43a0:b0:1ee:7c7d:e66a with SMTP id adf61e73a8af0-1ee8cb7d7c6mr23485293637.23.1739867833047;
        Tue, 18 Feb 2025 00:37:13 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:37:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:44 +1000
Subject: [PATCH v2 10/29] ASoC: tas2764: Configure zeroing of SDOUT slots
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-apple-codec-changes-v2-10-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2906;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=PzSwXh+q2KiuxDXck4Zpp204WMC77HTyEOvTgAp6ZAQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3BIKOmbxRy58W+SSu6LwWrB+9NaDO16LSe9VfCQ8n
 WH6Kca3HaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzk7hpGhtaezGnV7Uw23N9a
 P2scj79Zv2Wdy1+GU73796z9No3vqB4jw5JYp+W/+yzkFVIqfPhEDk1WOKPyMOircc9s/7bNDvk
 z2AE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The codec has an option to zero out certain TDM slots on its SDOUT
output according to a preconfigured mask (otherwise the output is, for
the duration of unused slots, in a Hi-Z state). Configure this feature
based on a mask read from the devicetree.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 23 +++++++++++++++++++++++
 sound/soc/codecs/tas2764.h | 11 +++++++++++
 2 files changed, 34 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index e4003a724c8c09303882ee36fc11133cf5c78b57..a2b7d0352d4f636c2bf7185715c0f1143ba8150e 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -40,6 +40,7 @@ struct tas2764_priv {
 
 	int v_sense_slot;
 	int i_sense_slot;
+	u32 sdout_zero_mask;
 
 	bool dac_powered;
 	bool unmuted;
@@ -594,6 +595,23 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
+	if (tas2764->sdout_zero_mask) {
+		for (i = 0; i < 4; i++) {
+			ret = snd_soc_component_write(component, TAS2764_SDOUT_HIZ_1 + i,
+						      (tas2764->sdout_zero_mask >> (i * 8)) & 0xff);
+
+			if (ret < 0)
+				return ret;
+		}
+
+		ret = snd_soc_component_update_bits(component, TAS2764_SDOUT_HIZ_9,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
+
+		if (ret < 0)
+			return ret;
+	}
+
 	if (tas2764->devid == DEVID_SN012776) {
 		ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
 					TAS2764_PWR_CTRL_BOP_SRC,
@@ -736,6 +754,11 @@ static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)
 	if (ret)
 		tas2764->v_sense_slot = 2;
 
+	ret = fwnode_property_read_u32(dev->fwnode, "ti,sdout-force-zero-mask",
+				       &tas2764->sdout_zero_mask);
+	if (ret)
+		tas2764->sdout_zero_mask = 0;
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index b814715b41ff6e9a714c30ae204e7792351428b6..00296b8b1f7584e7520bd6ed749a09681f16ea09 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -117,4 +117,15 @@
 
 #define TAS2764_BOP_CFG0                TAS2764_REG(0X0, 0x1d)
 
+#define TAS2764_SDOUT_HIZ_1		TAS2764_REG(0x1, 0x3d)
+#define TAS2764_SDOUT_HIZ_2		TAS2764_REG(0x1, 0x3e)
+#define TAS2764_SDOUT_HIZ_3		TAS2764_REG(0x1, 0x3f)
+#define TAS2764_SDOUT_HIZ_4		TAS2764_REG(0x1, 0x40)
+#define TAS2764_SDOUT_HIZ_5		TAS2764_REG(0x1, 0x41)
+#define TAS2764_SDOUT_HIZ_6		TAS2764_REG(0x1, 0x42)
+#define TAS2764_SDOUT_HIZ_7		TAS2764_REG(0x1, 0x43)
+#define TAS2764_SDOUT_HIZ_8		TAS2764_REG(0x1, 0x44)
+#define TAS2764_SDOUT_HIZ_9		TAS2764_REG(0x1, 0x45)
+#define TAS2764_SDOUT_HIZ_9_FORCE_0_EN	BIT(7)
+
 #endif /* __TAS2764__ */

-- 
2.48.1

