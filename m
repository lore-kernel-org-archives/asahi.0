Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567B6283FD8
	for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309843; cv=none; b=sBlLML5kg5DH8GQUNhUu7s+Sqrb0ZD7wZVkAA3Bee40nTCG7zFhRHYXWGi0rJQ6UFLB1GczbCr7MTa/FFup5xaku3YT4BJ+LYO00NsuUuKhjY+QxuoPXIOVUYB9EaJv/UBjgCYjhQVpbXST7iKPKZ0ORFOeK6T7cy6zePgNbpuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309843; c=relaxed/simple;
	bh=hQ3yIQ+LRbuFbg4idC7Bt8j/T1Iri2PmTgdBl9Lz8Vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3uenz+jQQgw5bYbPIrKT2JCf7ewCAId2hdund8ra5JZZhHYQpAiFs6CB9ElknGJtT9BsKTzrV7UXrtl7p/o1LVZtrKBMra2brR6l2tN5s67IxqQZHujcvcWV/5B9vmmANydErC7pArqMIqWDVKBJ1JMgSuYW/g0D8wU2DGZTzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6PhL0G3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6PhL0G3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0bb2f093aso31823335ad.3
        for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 01:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309840; x=1766914640; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=;
        b=W6PhL0G3B1QjQRILFCpvZPhgNPS0/F9BPtCNu1EHt4smLYyp2ak5NkttloOGmDlhEW
         ZwhUOORNlyp3dbzYWejLm9EWUmUCqmVJpMrq4kCD53ISflIBIr3U8qR6yJ2L3v2zxMIX
         q+TPpkXgIfq0ZmCfOBcGAiEzxAqG7qYspp3V3GU0nTvtbDMC15DTNSOQViV5MrrFVpBY
         kfaurHnLURPdilpKG3Y8wkuGCAfSQDkl2zde5LB0xZ9Z//Ay31wgOG1XILKJXc2eeHkL
         W+m7t7PFa4lz/+ZMOpdgOqFp2JTILy1WA9vXK8xLKPclfcSwCuyoJN0A1Ino68Qs5sb3
         eJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309840; x=1766914640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sytcPbDCFIWJAyTshVfbcn49iCD+Fu/IyW5F/eizSLg=;
        b=xCV2Lky4LYJ9QA5N30cWnuXkLTWRn0u5rcIldeeBPnkuC7BVIvfaHYFTLfRHitvUoV
         nRjKpD1QZdkO2J95Hyi5OcS6W+BLAoFXYbgLAS+wcz4Rt2SIO5flU2vsTExCtZeuh7Dh
         KpWmt7KVX+16AZc43wbrD0IhFBnwapOIqCpfa2It5eCfGn2pGVkFOm/KC5zszowgTBu7
         TIrNR59Kk0C0QpGS/IjTVM8SYIrfGKKgcM3YCIrZYRpphRQyDWYmKiLNawLxpUM18vF6
         yQCsAplHTMa8KNw1wxDea9P7+6XaZgiHm26tbEAPhvMeTFarlrugzEMixzeBNVaBlp3k
         HKMA==
X-Forwarded-Encrypted: i=1; AJvYcCWd/jdhn/jBPWh9aa6RuvjZ4Whm27asu9VjmbxWAMdwPSmpDxaSWU5V1Mbhah4eVIzJb68ZfA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6IGD8hXiXSzZ32vLGkpokJmsY+u23nYp41B+7cthqPV8/KAvo
	rU9wo9AnYwqyxiOfMJiUmSiCaAGAG7PGyEbY8E62AU5ntx46w23Kv7+E
X-Gm-Gg: AY/fxX5xCEP1LUNBbB/mi9VehqaJint9lgoZJsiX29enwkbF5xP0yOhxNge6KMACAQ8
	S4hLzq1Ei2G04a2s4G+fC1s1gBUsM9WOhV4u5Ih/gEP77XZeYzRN5VTePFRPd/Yo/Dyf1Cbk9EU
	E8JVn7Yu/qQxvavQ5eN6hIPNTukNokqjfe2b66/tuy8s7JlujcxdMWovprtq4cAxMkP3qaBTeZr
	hmYiVbjkQqDFCOEMCknKCiiWfS6Srg2JHP8UvXU2cbnwrKNGOwyiSUj481ytuOYRLW+HBeeFT+F
	Bl8ymwLZxCeWZUrFJ6zXDu5WkpNbTBqf3f18Vz+EkzZStUu7gQVZxSt3jv0ozmCkwLhyUFA6YS4
	cCg53YgH2l2K0++/ldPUf5SpVUVbV/2QgS9oCVZ9r9o0l3lf4nZt+PxjBc2UlADPh0BiTHq/POG
	1Hbs6TcD3hBszI97+uiMJ4+ztyJFZopzyOpQXv3Fsobm8JNsgxvLZi37fm7Bgfo7nuoNVf62ioa
	EzVi+UMKVrG2v331317NVFM/TLTgZBnlKMAhRBQ1dPktxgDNC4K+bE71w63tphKMfD+vSyg0i4I
	+9LHDubHQ3VM60a6y8GMKbEv69CQCbeNyrVJJsAnAEVA4R20EUo=
X-Google-Smtp-Source: AGHT+IG3qoMi1pT3L1mx8WGusEqRkmhnU95IldSZ76zQsfA/ovZNAZJZT0w8l8bvTDKlgtAC1QBfZg==
X-Received: by 2002:a17:902:e541:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2a2f221ff92mr79985445ad.18.1766309840329;
        Sun, 21 Dec 2025 01:37:20 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:37:19 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:03 +1000
Subject: [PATCH v2 7/7] ASoC: tas2770: expose SDOUT bus keeper via
 set_tdm_idle
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-7-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4520;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=hQ3yIQ+LRbuFbg4idC7Bt8j/T1Iri2PmTgdBl9Lz8Vw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yfrR21YfWKb47yGtwc+xpW/9c6z/JkwvT6vOXraG
 cUJZmskOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFNt+oDhf9rmVdsiknuYdpu3fMtLPui2w+6rv+XNqN5K1Qs2BV2aSxgZNsq6aS5
 aNXflmtX5286cmq/g+1sz6eHq6U9fZc14/rAngRUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2770 includes a bus keeper which can be used to control the behaviour
of the SDOUT pin during specified TDM slots. The chip can either pull
the pin to ground, actively transmit zeroes, or keep the pin floating
(default/uninitialised behaviour).

Expose the bus keeper via the set_tdm_idle DAI op so that it can be
configured by consumers.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 75 +++++++++++++++++++++++++
 sound/soc/codecs/tas2770.h | 12 ++++
 2 files changed, 87 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 6f878b01716f..d4d7d056141b 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -492,11 +492,86 @@ static int tas2770_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
+				    unsigned int tx_mask,
+				    unsigned int rx_mask,
+				    int tx_mode, int rx_mode)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* We don't support setting anything for SDIN */
+	if (rx_mode)
+		return -EOPNOTSUPP;
+
+	if (tas2770->idle_tx_mode == tx_mode)
+		return 0;
+
+	switch (tx_mode) {
+	case SND_SOC_DAI_TDM_IDLE_PULLDOWN:
+		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
+						    TAS2770_DIN_PD_SDOUT,
+						    TAS2770_DIN_PD_SDOUT);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_ZERO:
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_FILL, 0);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_HIZ:
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_FILL,
+						    TAS2770_TDM_CFG_REG4_TX_FILL);
+		if (ret)
+			return ret;
+
+		break;
+	case SND_SOC_DAI_TDM_IDLE_OFF:
+		ret = snd_soc_component_update_bits(component, TAS2770_DIN_PD,
+						    TAS2770_DIN_PD_SDOUT, 0);
+		if (ret)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);
+		if (ret)
+			return ret;
+
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	tas2770->idle_tx_mode = tx_mode;
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops tas2770_dai_ops = {
 	.mute_stream = tas2770_mute,
 	.hw_params  = tas2770_hw_params,
 	.set_fmt    = tas2770_set_fmt,
 	.set_tdm_slot = tas2770_set_dai_tdm_slot,
+	.set_tdm_idle = tas2770_set_dai_tdm_idle,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index 3fd2e7003c50..102040b6bdf8 100644
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
@@ -115,6 +123,9 @@
 #define TAS2770_TEMP_LSB  TAS2770_REG(0X0, 0x2A)
     /* Interrupt Configuration */
 #define TAS2770_INT_CFG  TAS2770_REG(0X0, 0x30)
+    /* Data In Pull-Down */
+#define TAS2770_DIN_PD  TAS2770_REG(0X0, 0x31)
+#define TAS2770_DIN_PD_SDOUT BIT(7)
     /* Misc IRQ */
 #define TAS2770_MISC_IRQ  TAS2770_REG(0X0, 0x32)
     /* Clock Configuration */
@@ -146,6 +157,7 @@ struct tas2770_priv {
 	int pdm_slot;
 	bool dac_powered;
 	bool unmuted;
+	int idle_tx_mode;
 };
 
 #endif /* __TAS2770__ */

-- 
2.52.0

