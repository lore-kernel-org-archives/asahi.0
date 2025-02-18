Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F4222C35E
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867959; cv=none; b=hbj/T1wVI5wzuwxw3+aIqehP47vxN5vg3DV7mczrP6HPJLPXHgTeXK6HTWeEKE4KXz3kmidBrBsbBuOhcatLOGI3VQhPJr8wVHesM9xvZuQplMnDmrabFmh1X8O6+2bkSjvZ/Dh2sLlL267lR3XOBLTa58yMLZyskKbgxnSZeYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867959; c=relaxed/simple;
	bh=FRmqZgxJ5fAc3Cm+w+LnIyLQL7cEbyhXHFskiXDwZyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Js46jyh55lwM63DcL9l8lPE26oZS55gdA1HTgBoRTRiQHzK7F0HRbK0R9fE8+Pk0iSgbAFtE3aFlybU83XWhCJAJjXC34WCGxI0cKD1dgRXZ6tOmJhz2ovMAc6Na8ZBOKQVGwtTvW7KduLekuKUSzATdDDAf0CPNhjaDFT+bJNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6k5/JBd; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6k5/JBd"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-221057b6ac4so43980615ad.2
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867957; x=1740472757; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnhHBqDYfM29DR4A9Y36olzUaVFoyVCJoh1FrWQKz+A=;
        b=V6k5/JBdl15rO9/OpTwNJ2HGW0Eki6F2juuf+Knk6/5z0wY3WlWlke5OWFqXlCq2i8
         qvFlTHHbntKxtgAu28cvqPnOzCqg69PpYfaEkPKE+aY/srptXRIO1XxXIV2iBEo/Gp7w
         IRx6FmsvQaAo4Ipu2jS4urIpNBmMCkS2oUu5x4FwU01cFlnjhGVmNR2kvsK3ALfQJW8d
         W/XMgw10gd0kOATOkCnUkBbg99LUR5Ltoi8rFrxbnXPnjE0qlHF99OedcjN6L+7SJQ6Q
         KZM6stVdRgg8jualK4GEIAJyPSS0KSPwWqgQDyVuD1+bAOx7JgPd8n4mUHSrPyXRWxby
         z2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867957; x=1740472757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnhHBqDYfM29DR4A9Y36olzUaVFoyVCJoh1FrWQKz+A=;
        b=KROC2+EbR+dz+tWfHTGjnB5BaeX7a3ePHYdeNbMwH40WQ8znX5W//0UxQPiLOmjkn+
         kaIpCJJBg4yn1lqxwFhZ5PFV5np+NjiPBh4zN02EcRK3IannOaq5GZ3Ix0ZODecBHpzU
         QeBue8w1w6WIIQE2MlqVkq1E6TIgYKSnsCn6lBsB50uyd8ajNmfK83yhqXnf+XYSuDej
         W/7BXDGrIyuEeiKWRt6iU3j+LHEjYLzW06/1rjmNC4uy8SnwTrqnJjdaS9OiarN77TjR
         psO67rnEslaXB21ug0+XwXl2YZ/oE2uo2J+EpylEaOGxNL2+m88AFx1zZi0DtpkLvmsi
         dV3g==
X-Forwarded-Encrypted: i=1; AJvYcCUvC2QNZyvWVOJYlByRIKOuMchf9mpemrenRB1aLP6aT5U+R1pbL96s6LjDjH0MJ8PsQplghg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNaSzzt8nkfcjlQ1naOUbGdEvW1XHcxUCDPtpuimWAqPqkkWX6
	dQdS2Yb9h0V9kln4CfXWfwXzS1WeSFEWBVGJdZHZJRKDKDcyxhDn
X-Gm-Gg: ASbGncsoM4QCVPMAlawrnYAyjK9L0qksHQJUJhHy/E3CSK+09metv693psHELpNWSXs
	HnW2pbQIKiELQR0kdxKjqrVnScM4qKkweeTfC+6aIF/7ws+tFrgSdFtNQjdq5YZXuzGaO736Lxa
	y1iqpg6tSWBpXhMPO9in0UrpenW9oocjXmTsHR/5NFrd8bTjaM7sWwxERYgbq9nnLbkVDM7ZWdI
	BhdYO0Fb7hjsRC4/1o9t4deK3/3m09juNd4sKLUAcLWN8XzKwvDU8bJKl+ioUIPD6jAbhDm34AO
	rdYReEM7UlLVVTQ4bl0wVIpHqBNR4F102cvPfNWCsPYKwF2Jd7YF6X2kJQY1MrCDkZGDfUNTKI1
	pnB80Yv2nTQ==
X-Google-Smtp-Source: AGHT+IELYTLd2skSlDsq/uOPlRk4gwUbTWIP2xtKNcTTkHgMU1k9D3jX3InT5jzcVokA0Tqon4JbEQ==
X-Received: by 2002:a05:6a21:33a5:b0:1ee:83b6:ead7 with SMTP id adf61e73a8af0-1ee8cbff1c7mr22488538637.37.1739867957327;
        Tue, 18 Feb 2025 00:39:17 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:39:17 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:36:00 +1000
Subject: [PATCH v2 26/29] ASoC: tas2770: Add zero-fill and pull-down
 controls
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-26-932760fd7e07@gmail.com>
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
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3549;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6aMXEmnAcNUnXD8SSdAOx+V4XbDKiAfeaQsAiw9WWGk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3JKYNJU0THcriP9wbdf7Mj1YYl7BnhzXubLXgjXqC
 9eGX2zuKGVhEONikBVTZNnQJOQx24jtZr9I5V6YOaxMIEMYuDgFYCJfOhh+s97wL5fzVL9dwvD1
 gb9Z+lczCfe+f2fUf9/UVH3b/o5XhuF/7kKufSX113av7bepun/g7lXuhTV1phl8Ntf3B/2aIW/
 DAAA=
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
---
 sound/soc/codecs/tas2770.c | 17 +++++++++++++++++
 sound/soc/codecs/tas2770.h | 13 +++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index cf038f55453737b2173b986d90fd57d4cc14acfb..8adb558f9e89988e0decc344502da8226f8ff517 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -658,6 +658,20 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
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
 	ret = sysfs_create_groups(&component->dev->kobj, tas2770_sysfs_groups);
 
 	if (ret < 0)
@@ -811,6 +825,9 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 		tas2770->v_sense_slot = -1;
 	}
 
+	tas2770->sdout_pd = fwnode_property_read_bool(dev->fwnode, "ti,sdout-pull-down");
+	tas2770->sdout_zfill = fwnode_property_read_bool(dev->fwnode, "ti,sdout-zero-fill");
+
 	tas2770->sdz_reg = devm_regulator_get(dev, "SDZ");
 	if (IS_ERR(tas2770->sdz_reg))
 		return dev_err_probe(dev, PTR_ERR(tas2770->sdz_reg),
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index f75baf23caf3a194a040474a7484a3d44f673435..2c2cd777f4bcba8ca91f79ccdfd9f159df5d3a97 100644
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
@@ -139,6 +150,8 @@ struct tas2770_priv {
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

