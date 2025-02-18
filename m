Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7549322E405
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867982; cv=none; b=FqoIFGatox2k8wCMwXRwkS7XZdLcC/Q5rbCfWc3ujV3zuDq/kb3NeLhWTZMlxYTSZeY1Yabd2linb4xQyvPhG0Xjap6XY0OITm3B80mKGvpvgwRl7WWaq/ritVYKZk23R3YfMhc3n1iiHxASZlE00lDTkENbBX+toUKTfobxTPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867982; c=relaxed/simple;
	bh=cnRZPokli+PfTbq6PV97MiDRn1Pju3ic7oVd9IoPL0g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cAZCZ6nXPDsh6NxtK/CVY8QTnTqqqrP/R2VGU8VNqbydbOTd8IsQkkH5Q/JJgUXmKlytYenyEhjNbKiA911V5SlONUaGnZ3Pdusk2Rv4iJRP9obv/NfEO2Dk3P55GVD3ofbOHiJ9BCAcE0SwmTW8j7LiJDzyt4YGafwewO2d8X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9IWmquB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9IWmquB"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22101839807so62811995ad.3
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867981; x=1740472781; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgDiTLXgcA1eRcm2kMK/ECehpkZvEq1aeeBEe2lQUg0=;
        b=e9IWmquBQrdP/QpHALMJEb+2pwlnS24S3Z2yiNjaWvx0q0qMrq2QsmqJRbbbZ3PNpX
         gxHEjI4w69VU3BoFECHXOT9+UITaT7xaZ7q2YA5NQEZkbvcv2zQ6pfG9An62tJKzOowd
         7zD3nIl696vUKZMl2r+UcZHdmWVTPRuN+EDPWhOpVTrRFhGEHArOhMeLXXV0GSWAF9kU
         Mdbkg6VBCR/jBZy5MAhUa24ko3srxNZR8IFvsfjWAsJQR84eRWMwg+w3FTLsoL2W4O3L
         p0zGHAAEUlWPz/l3LkwaZv37cjhq0oG8yKpalx9uUkpnFLqciCQ+eWhD8QS3I2KjUrz9
         VbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867981; x=1740472781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgDiTLXgcA1eRcm2kMK/ECehpkZvEq1aeeBEe2lQUg0=;
        b=vaa80kWd+q6xklU4FSinbSC6k/sCgkXQB4HaOjfvU6ZhWEd/+zBB7RH39fGoVXJJnB
         dQEasG9+IUfHUUmeDDV5h/p62drHalTArztZaY6sp672B5JzzYaTeUkkLVF5LETuv0y5
         ExBwJKUfhCckQa4ry+1mWh+myZojGPbqO2jYegS+vKN10FMZV3FH0c6jQCiyTBKjHifS
         e/PrXEhTlV07/+Q25AZhxZybMcfPz2bP2c481TfxIlo3DP5k2aXuRgkHnUTPlF7v3e2a
         TVdpf427FXiHjbK7FaydL6NqnvW0edEOlYdN1OTmTsjuHzHhZLsHhEzkPedBXXBdbbf0
         whXA==
X-Forwarded-Encrypted: i=1; AJvYcCXaUAauesNYnCRXk++C+z49XcCbeRh+dxDhQjDOioeshLCt2yYElYQOZzYGgVuvrCy2U4UMcg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyacB5h7u5YN4sUhD6MvA8ng4Hvj6NIe/vxDDJHRAtEksi8JzOA
	O4UC1QaupPQk951drxh/fij1nR8P8LdWuCR78nyXLMiin8UmFhyH
X-Gm-Gg: ASbGncvRAa18m7bcVPPfMPvJtXW/TOkWQ33kAWJULRjIa0ss9hAQQf7hEC5CXJSvhT/
	9SDz/T8oRq5CUEQISM7CGtVwoQ2IsC33wSEx1QsN7NOzN7onvvNKlVQp2XQSOCLfA7e6FVb96Aq
	HEPFT7pYVOC9pNLBYv99dnn3XjSg9VrEwcEAPpul2IUgzwQF7atvZMPcPQyBTBkGPxQeu752TKk
	UUF1qjSa+bDLIMti83x8U5shpcWrFallgszKkImM19qV59WOSbfaFEm6UldCcAihpecK02sL3U7
	bfVovhWkD4iK+OWGVsejSMCiw3/w1RTvw5ncUqvDlyUqLa02S5mU+pAyxzEu4zhfk1iewdVUPZ0
	yY+I7ccGvvQ==
X-Google-Smtp-Source: AGHT+IH88g4GyXoeH30GTgM2lLwIX651E60KGhXaM8FdRzJc/IPiDl+2MnrPc+ajkNhWejLD6XKKcQ==
X-Received: by 2002:a05:6a20:4323:b0:1ee:66bc:9138 with SMTP id adf61e73a8af0-1ee8cb1b450mr24059373637.24.1739867980777;
        Tue, 18 Feb 2025 00:39:40 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:39:40 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:36:03 +1000
Subject: [PATCH v2 29/29] ASoC: tas2770: Set the SDOUT polarity correctly
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-29-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6r055cv5h6bTewX3So8WzRWOgNxg0HoosgfY3TM6nG0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3JLN59Z1FAtLLExNURauyt7+fUo7O5dxoEbjVL5fq
 sePmT/tKGVhEONikBVTZNnQJOQx24jtZr9I5V6YOaxMIEMYuDgFYCJmmxj+B1/SPbNs4bGixENP
 Pv31EMpe9vrtxG93JA3O/3tWzFfs+YCR4foUW/PZ+7rUks+vnWH2Pe2xlyiDO8NCn8x7VlEB9Sd
 6mQE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

TX launch polarity needs to be the opposite of RX capture polarity, to
generate the right bit slot alignment.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index c4a5f4d1ce09a8e68759dd75d532d06d2a7f2d39..98b53557c0937c150d6c21ece8ede8f94afcd9f9 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -359,7 +359,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct snd_soc_component *component = dai->component;
 	struct tas2770_priv *tas2770 =
 			snd_soc_component_get_drvdata(component);
-	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0;
+	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0, asi_cfg_4 = 0;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
@@ -376,6 +376,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		fallthrough;
 	case SND_SOC_DAIFMT_NB_NF:
 		asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_RSING;
+		asi_cfg_4 |= TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING;
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
 		invert_fpol = 1;
@@ -394,6 +395,12 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	if (ret < 0)
 		return ret;
 
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+					    TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING,
+					    asi_cfg_4);
+	if (ret < 0)
+		return ret;
+
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		tdm_rx_start_slot = 1;

-- 
2.48.1

