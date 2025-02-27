Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2AD22B8D0
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658181; cv=none; b=kyfHFv/ms3FqdUlMgz4djn94URGHszhm9Q8k73iWLDu3DdChXrOW2Q/zc1FlHy84gv96kNKAsBCyd4WHmWV3hg4vf+29mafCoVPMhBeQVC3gEuei3w9XppqMm2XJLizqROUv+YREDU2/xapZgObtnLDBfQ/3WLY2eLXrhCn3giE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658181; c=relaxed/simple;
	bh=kXVqm3Bcan36F2GLj/Gjs15SCdXWtkLPAjRDAFl/lgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IhBdQ7wg/WHyiBiEZJ/NAFjA2fSjRj6OnS/kH2WQntdbSgXmdI33aXQLKNajDNGBtqbe1o+H4187sHsMKyyaG0p97TVhAVMQNz2pZj96ZZAQhOq3lueb0p2LzibDE3Cs4qjmz+poMIpr6qC16TnzuWrA3rhjVv62EPlLjVjjpSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fnd2GSpn; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fnd2GSpn"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2210d92292eso20212585ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658179; x=1741262979; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAEDHeJBFJU8F7o0MW5ekN1Mf8cimeNpcsWtMaG5SxA=;
        b=Fnd2GSpn9Ruq74wjVpugTYAQG4tEQqhzCwrq7uJTguSgBZ9+/smW+itHzTYQlm92dD
         qMb8s23GabhrFTvSIF/rAAjae4qC2HVmWnSZlFMtkUgx3j0S2dfLaEqTJXo2dT4MQOlS
         LyaMq+1jUQiUeUylp7RThAS+60nZnS1hKxWlc/JSYltuYdrKPFYiZR5Z4gJZLx/74+7F
         dVsHYfdczQ7LKu9q7YZ7p+bBn+91pEiDRmlUUBDmSK+LU02sfXI2tH8StTEG3mn0KiSa
         2L4Bjh9kS79thy5fH6knL2x5oUdD9L41XSuJBO/OH5fgaOgA1YV1iQ7/39quQ6VN0nql
         1L3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658179; x=1741262979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAEDHeJBFJU8F7o0MW5ekN1Mf8cimeNpcsWtMaG5SxA=;
        b=cPwg86AL8/8fN5ZMHVwQsoMdvxJrCDNLAIaiFGfnfyWwtgZ6niIX1ZxQkswqjToRHx
         Tqs430Qx2swK5QeB+WDqWFviZc2w5pPdhya15nqD2xCbeXNoLRgkHQYnyqrCThTtPTHL
         1M4PSWmOv4z58O2MQ2U2MtAMxD64d4aYFm094iJH3E1bdWE12hkoQTeLeu1+EDUp1FMw
         OXWgR6f58poZ2KVT7/SMSWx29m+VunzUWFCOSy/QzKiEW0F3927ky8MMoU9Kuxe9ah5s
         Gl7/kDL4MMBSCVGSqMfwM+h20VAlqsRNlgtNj9M/EC8HfkfJTJ7hX4swAb4U2+Sfi39q
         bmpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqA51aXh9vzk+2hvV8C0nWOOyM4Sh/pNbGReKyaSQqTL+0VNoaAcJrSEkIQ+w2BZGjh3BSfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxB0ILYuekXGpwZKO0VyyoUX/b2mzCaKckBO3Vv8THgmQIf8CN0
	1wybrSHadCzU9DwFHMOQlQ8+kYqyYmUb68L5J0fZnH+gZJS4dGNWkiQRBCWs
X-Gm-Gg: ASbGncsLuX+ffy38nZqGCIMVKfxDmWhG/pmYyjcALrLXvU4CoaY7EZPSqEfNA4vEhYx
	TdFeoD4XJwygnB1W1YhAf0ZafPRlGYEiP7zpyAkP2Aa4XdPixJktOyv7OZMkww8WhqVmlWoFG07
	fUO4vqsUi5PrkOYG/WaIHF7SvptkTnPeET3TM8lJkEJxKIqu6a4LixqQZYu5JU6sorCidnRmW2c
	cJGe+ODhxGVujx92kiMrbACR4gJswLA7iGEDs145bZcPjTAzNFOp8QN6ROAxJ3U62C3KeIeKo7a
	VT/ovooUT2QK25qv56j+SnDlcKWaTt7RroHMxz5ncVWzfB+LdL4o/9kIsCVUjvzFRsbtwUfIpby
	2vlCl1f6YcwlEqTtgwSFQ
X-Google-Smtp-Source: AGHT+IFM2zqHEqQGdZD7CbNcSfwL1TPV/fIjrKD3F2p8of5kiMnTk4BKW+CwUOw2ypL6ib1URem66w==
X-Received: by 2002:a05:6a21:e8e:b0:1ee:c89e:1db1 with SMTP id adf61e73a8af0-1f10ad7ed2emr12060212637.25.1740658179086;
        Thu, 27 Feb 2025 04:09:39 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:09:38 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:33 +1000
Subject: [PATCH v3 06/20] ASoC: tas2770: Fix and redo I/V sense TDM slot
 setting logic
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250227-apple-codec-changes-v3-6-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3887;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9oD673IPZ5uFrCCPftVCE6wRdPUQVoC5LK9O/3Xdq78=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk9uZXY99WTvjf2ejjEHfHtKjj6XMdx5T7PB48EzG
 c6LcZM2dpSyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCRB3wM/0uS+y9XP/v1/fy7
 be8dL8U2Cl7p5whouBG17NWB7uu1bd8Z/opE6f/a5Pb+evi8/knXb/96sj5r2jefxX6RYsE3jvQ
 dN2YHAA==
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

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 4a86fcec0c1ecab45b9ebcdfc90c78f3290c6fa6..7f219df8be7046912bf3ef452f75c17b5118bcf6 100644
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

