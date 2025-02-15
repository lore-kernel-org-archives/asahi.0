Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D881519B3
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577837; cv=none; b=RXp9sHqSPgrXQaC5GLoo/dHV1MDgf6tnLchcmE9ICIVaCqM3LDK9b2AP54F5JUHWIl9TuUcb+js81qNH5pYZhZvT3qk0/8045sGi4ai+FFGWOJ/tZ2TFiDe6JjkrlHEGuc4VAX4BN9vN/juHDUqI81ZAWZeWKdSTR4zRUQdCc88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577837; c=relaxed/simple;
	bh=fAf1KAgaeIrxwZbwk9BO115UKgXcSqW2DO+wbz9KRpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hC7hnE/yoUP11QYCqCpAT42SShITAEH2f1gbM1UFK1bUzbl+sK2tMNNy6TDtIjJ3HLCE+8+ecElkOwJ+kmmGvWk98P6dJr53Q6UgIntKfcdLf9SxvO1XgqmXkm4MJF2mwebLE1Mo+dzuRY6ZiyQyA5VB71w0ktqpwFrsRsZyeRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO+XdLN0; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO+XdLN0"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fc32756139so1530340a91.1
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577834; x=1740182634; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjN69dWvX0hG9h4EhLNZtQys+yGsXU0w3VyGLhW1vec=;
        b=iO+XdLN0QzwSpMXZEm4xmJVYWWpsBRS2KqMiNxOahlwH/MtKp14XVviKQB9QKZSCHj
         rCH5sk1l3OHG+Pn3I9JzVPhLsH+5keaTMLM/kJ9/uBe+OCgVRPybsee3lVqBHSpf3iRV
         Y84o+YaBcZEx6koXaNwMc0BkwLHBOLwVkMdMO0HLRFZO2/WdZKsrOlh2ADnNNNWIgq0h
         s2wS+V9W5zJZfR6KYoZOMyLrYsDx4/Kq3f0t1c66bn++ZUL6hNpMsRBJ4IQjK2uMXb6h
         Jikbtzj3ViIkZd1CnhkZVH54waGzrrnGY+c4uhv2pj/XdCp04KeixowwY6UXLuln3gP/
         Q0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577834; x=1740182634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjN69dWvX0hG9h4EhLNZtQys+yGsXU0w3VyGLhW1vec=;
        b=wd+dr1fwPTiWHu0qR+GwCBp9S5RqvSA+UzOGteOMBq/JNs4qZ23d/aUfHw3UvVV9l3
         T2JfaD9G8cymFERR341CfFJprsp9djrAJMMZ4dXXSK966pPtCA9Lr//5uvctiizeJHn2
         SfaBt/g5dvXs3pLSg6kO53DqTdTBdVSghbZN3KYOCgH6ahKu/JswPZtimul8raVEEjdr
         hEOA//t7IyNiFwNNVCL2nSkGTzA8aGoBSaIycHATMzzd55jrN0pHVp0SGsxk8zJU5ge8
         94rYHUk2RA8EWHmjPKHx+Jmac9Rg5GihD/ar+uDZgxZygqXC2olhnT7LvFyExp/0FTX6
         FtLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHaU6iTtu1vjKTxNEwUlJ8CAya5XcTH5ygHRrpHiN5BuIE8uXGwertw3kzTG+W6HWrgp7z5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyosDftm9l4w4JH8VCPn1jLX3kqDdGS+bxfm4hWUftt/P3rWnAJ
	tNznWCGUKjNdJU/ylgM8Cgqm+w/Tb6Kev4LduqAnlscYnDnJMTHT
X-Gm-Gg: ASbGncshXb01noDAr3+o7RIEQQSipNP+EjHKxBGQcBseybxsdQCQrhTQKgiyc4JosiZ
	oN5UKisxk9uYo1frkLy9Ya7x3dTpsGXuhK9uhmWI6BFJQKu/yYneaNk558zs+xwRIYmuCYQXaVg
	ztJT5JwEDwATC6wkPYKVliNEak/9N8i2DFI8YSk7CT/HVX0gmq0/7hCaVst9jpeMymzeoyH/ts3
	ruADxwvqQv9dM0w/gBATdl+X++sPnCzNV5M1QzCNSypycKE/fgn29xCRNZPL+NKeX3m5DZO+iAf
	OVohwbI19eJ3+J0gnT5KrhdsGnyiloGPZGilfjZXhi/CMa09s9QQxDcWw6qzptqNr4vZGVVHGLJ
	92MdcVkjWow==
X-Google-Smtp-Source: AGHT+IG8Y9dfFDg7fAsxSa/d9/xijgthnbv4dNrpx0e5/T2PydIYpo7CujjfmoaoePIUicpcVlYA3g==
X-Received: by 2002:a17:90b:17c1:b0:2f5:88bb:118 with SMTP id 98e67ed59e1d1-2fc41044ffemr1257114a91.22.1739577834169;
        Fri, 14 Feb 2025 16:03:54 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:03:53 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:39 +1000
Subject: [PATCH 06/27] ASoC: tas2770: Fix and redo I/V sense TDM slot
 setting logic
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250215-apple-codec-changes-v1-6-723569b21b19@gmail.com>
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
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3845;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Zkv+pd4IC2a5+XRrYg3ceXkPLMS+eYmm7VHJxks2gAY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb26N0Tec2n3GOWibmdL8lYv+X5dL1HTK/lBX7D11g
 q/IezWBjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACaicJ3hr+SiZRvdDolImi2c
 Nmdx5BKJN9d2MTcKuR1JVS0vZjdNbGL4nzXz407uk2VeP7mlGsveedtPjv7zjjN1lczHvrlqzXO
 82AA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The former code sets the V slot from inside set_bitwidth according to
the bitwidth of the PCM format. That's wrong, since:

 * It overrides the V slot parsed from DT binding.

 * The V slot is set shifted behind the I slot by the length of the PCM
   bitwidth, but the PCM bitwidth has no assured relation to the TDM
   slot width.

Replace the former logic by setting up the I/V sense transmission only
in case of both I/V slots being specified in devicetree, and never
override those values. In case the slots are left unspecified, disable
the transmission completely.

There's an improbable case someone is relying on the old behavior, but
if so, that's a setup that only works by accident, and cannot be sanely
supported going forward. There's no indication anyone is consuming the
I/V sense data up to today, so break the former behavior.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 0c8a02ac2c0db10c449a68d9365e79576e24abba..35a4d5a4a3e0cf4f71f81fd59f44f075c59cdbc1 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -224,19 +224,16 @@ static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG2,
 						    TAS2770_TDM_CFG_REG2_RXW_MASK,
 						    TAS2770_TDM_CFG_REG2_RXW_16BITS);
-		tas2770->v_sense_slot = tas2770->i_sense_slot + 2;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG2,
 						    TAS2770_TDM_CFG_REG2_RXW_MASK,
 						    TAS2770_TDM_CFG_REG2_RXW_24BITS);
-		tas2770->v_sense_slot = tas2770->i_sense_slot + 4;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG2,
 						    TAS2770_TDM_CFG_REG2_RXW_MASK,
 						    TAS2770_TDM_CFG_REG2_RXW_32BITS);
-		tas2770->v_sense_slot = tas2770->i_sense_slot + 4;
 		break;
 
 	default:
@@ -246,11 +243,6 @@ static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
 	if (ret < 0)
 		return ret;
 
-	ret = tas2770_set_ivsense_transmit(tas2770, tas2770->i_sense_slot,
-					   tas2770->v_sense_slot);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
@@ -505,6 +497,7 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2770_priv *tas2770 =
 			snd_soc_component_get_drvdata(component);
+	int ret;
 
 	tas2770->component = component;
 
@@ -516,6 +509,14 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 	tas2770_reset(tas2770);
 	regmap_reinit_cache(tas2770->regmap, &tas2770_i2c_regmap);
 
+	if (tas2770->i_sense_slot != -1 && tas2770->v_sense_slot != -1) {
+		ret = tas2770_set_ivsense_transmit(tas2770, tas2770->i_sense_slot,
+						   tas2770->v_sense_slot);
+
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -643,7 +644,7 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 		dev_info(tas2770->dev, "Property %s is missing setting default slot\n",
 			 "ti,imon-slot-no");
 
-		tas2770->i_sense_slot = 0;
+		tas2770->i_sense_slot = -1;
 	}
 
 	rc = fwnode_property_read_u32(dev->fwnode, "ti,vmon-slot-no",
@@ -652,7 +653,7 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 		dev_info(tas2770->dev, "Property %s is missing setting default slot\n",
 			 "ti,vmon-slot-no");
 
-		tas2770->v_sense_slot = 2;
+		tas2770->v_sense_slot = -1;
 	}
 
 	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);

-- 
2.48.1

