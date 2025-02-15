Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570821519A5
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577954; cv=none; b=Z+xWg5nYbf9paQY6xgDz4pDhVn0I0PbY9RrRe8kEdPkPpgiQzynqa9hLdmpmkzMJnU0MsWHPwEcOhLa4dtF/+JVIGkJYnGa8IXiQ8rDeir0gcw65tTkAGU36uHAxvjImqTeClfqbsg5B3/JqLa5aXP9y5p4pSJP27PcDSOu1X7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577954; c=relaxed/simple;
	bh=RDix+/+TMA7k1w8c7iWmcESPa40MeUHuuJ6OGsToqP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOI/BuKbPWKCKIam+imZszjHJs+ctFx5S18yyI//LzM7D44rI5X9589nAcj75LNF717gVkSecfO7RpoTYQWeDvkBLp/7LKY4wH2ff/xxyeb9E9yHRywppAsQ2YEfhSAhQZwlrD6pnZXbxrQsRzp+wsXvmQcy4Z2Dh3xpjOvMXsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2BeuuiD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2BeuuiD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220d28c215eso37357135ad.1
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577951; x=1740182751; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnuXwhPKY7wDxI4Vb0cLFSGpo9M4uNmayGUNt+K5nXQ=;
        b=S2BeuuiDhWEtKQOYsXWsg9PLsRnja9bSFUXq9c72YDvHpQX3r+vVXJPkxEa8FXTKCL
         /SZon7ByX5mOliSjeSoIHwkfcOZuRHdti7CvPqGSSZiLNzW6vy7kKfyAg5ScwcLa0Tmo
         Z/wUweTNsHMbwkJT8Q5/T5gnevOlOYUGVkkAZWfTsW2y+bppRwfkoUENN7gYRWaVyYWY
         2c0DPVBSwu0l9NOyrD3u2Z8IdWPEsDcek2lsFODGlVDFgPbcSf7nERUV3KWMeLHU4SJx
         +Hg+rHPoXk39nys30/81MQtaPx+xCSxit2gdPoLhBbW4MR/v4sXZGSuxrgIThezY/45X
         SY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577951; x=1740182751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnuXwhPKY7wDxI4Vb0cLFSGpo9M4uNmayGUNt+K5nXQ=;
        b=FeDVMuH6doPLWaqKDRBCZmu8Fbgfbj6RkqLHrJzojZyzHLUKOp9Mza4XETRDzlpfck
         fVDhEo1517zLIcGygp3ZQbVWp7Vc7BIerxLQICc7AnhhVcNn/IQCUyzzuYN3i6pSX8QQ
         1G354ProGZbLQ3zUjTUg74f0Wyyme9o+zZK00Gc8dUTtxHKjk8brhoKnSHuXaV8uVyZ2
         WaufRMwLyVTMjZRZ7UaB/VZH4W7529f881rQdt0LtdoGl/DPzK4BO/TV7FYjKUPfM2Ff
         82Vxfz/ksAM/WkzZulic6GW0F9eH0GmplGTp0wl1hlgkApYGCp1hy7QmMzr+sKztTZcj
         Otwg==
X-Forwarded-Encrypted: i=1; AJvYcCWFtzjG3v6SRzp71G0HLXDo1CDqFSYXfHx6DBJaS95JpoJO5eVFScGXvEJlMqV1w40lFLkv9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHaFk+Czqgb75dAMGpUZH5I4OWRpp5WcJeOjjCAPl84OXyTlHW
	4P7jPGeWTHzPA3J0ZJLRUAnn0GKszY/QVK/A+SY2iVEUzSCnM9a0NRCIwQjc
X-Gm-Gg: ASbGncuJLXkeMtia8shI7rYR6lKBYKD4LrzPYog1H+spVhmg8xsjW9liuaWdyerzVcW
	tcBaoyArcrX6HGBksMlQ2vBG9ht3lIsANUi3VHIrt7YfOcXMKM2xIu3Z/2HRGJoHoCvDCsAvIAW
	SzpR15+RY59MTHa6gMWujfpablMVdsrIDNGlvSnc/DPac24R/TGWbNyYD3LeWGeJ2I4/lxZigN8
	PiTeBQnt0crlxO3UyGuN0N9wPDE78cfwy2xsy0bTGfFlYCsqNpB9T9r7Vn87L/nuP5LqmKUdx43
	zNWlrRagEMcCZpzGKbQLOXEbO22H9uEzzcJNGcivwt8hRhT/RBQVdUt3XJqqWNcGcdCSfebVnEK
	JT8tUuRNWlw==
X-Google-Smtp-Source: AGHT+IGgY/dXJYnyF1dgWE0cS4WNHAlQm+hrMjO3hWUb5GNVVYJFHljlLirn42zG8WRNXX+yoHYx0g==
X-Received: by 2002:a17:903:32c8:b0:215:8809:b3b7 with SMTP id d9443c01a7336-221040135c0mr15618835ad.7.1739577951530;
        Fri, 14 Feb 2025 16:05:51 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:05:51 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:56 +1000
Subject: [PATCH 23/27] ASoC: tas2770: Add zero-fill and pull-down controls
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-23-723569b21b19@gmail.com>
References: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
In-Reply-To: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3507;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+sGEqJnDHCIhxzVYE3pEiGOszPBCfBGomCpq/eBBdGo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb+4w0NpSw3tm4vbQVjmPZyfkrlv1fmT8YdmyO/xKZ
 faq87XnO0pZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZgIszUjw0wGozkTXE/uq9O/
 sOf+2WNf3kjyb04/NqNB10FV/xF7/0xGhp98H2XqhaaH981LYEpvTTr03GpKL/cEHuF1Mdvy5xi
 V8AAA
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

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 sound/soc/codecs/tas2770.c | 17 +++++++++++++++++
 sound/soc/codecs/tas2770.h | 13 +++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index d74bbe12dea49da376fc577dd144912468fe163a..7ac7ccb32b4db2050a8543b950a9872b7551845b 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -602,6 +602,20 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
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
@@ -755,6 +769,9 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
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

