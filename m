Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47803314B66
	for <asahi@lists.linux.dev>; Sun,  1 Mar 2026 08:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352427; cv=none; b=C6hKz9Vkm68rwUKlqFBEHhoURLW6coOFcIdu2OvMUyt8hAFFv9kRIOJ7pVoi9k5SscuOvLNBDlPDGnSonOmbNUBEoB4k90Ay0RCB/9ivGxCqAX9XJB0+AFJNFroF1UYZ672LhmoQd+BSsDLQZcjz0oLUZwT5EWBHZ7o0oCULNdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352427; c=relaxed/simple;
	bh=tgaTiLnqDVU09V+sOch0MS59MDRnaMGowpS7pQpkHvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pl/gWNjIIRxWm/H0ynVC0/sjT8wAS4E3a9W2cJtORC6K9UybNxsXYnvanggalZWWsomrX8wwZx9xgmHgOPmAE2VQNBzzdVtx/jZXOd4ci5RRnzWAVl6tJTorI2d2zWOeZYaefFAAfTKBjug1BmN4Mo9o+/Trxg8MGWiTFjIya7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nga5rf1P; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nga5rf1P"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-358eac0571aso2307010a91.2
        for <asahi@lists.linux.dev>; Sun, 01 Mar 2026 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352423; x=1772957223; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MUY9ZBmDZl+OfoG0SmjcuxGXm9iN1eBUEEJQwad6G5U=;
        b=Nga5rf1PHC4GlH8rfL37MtO2moolgsAEX03YrLA118nT0d0FRMq+Jzxv1n7iDMPlSO
         uLxW1wWk7OUFGcUkp2SRdnXkKxHM4loiO/NEfkdsW+jKOVvgI1wCmvJybny25BFn6nFj
         JwloX9arQgjbClFQCYHkq8lvTdAw6U11PI29IH5Jy/7qwkagy5OSVvdJEwOGvjT5D2HR
         Uea240OQ9r1pgg1pjXuq0y0L6JJLUu4Zu+RHnSJ/dHng4btYxLKuGcxYH50j4/wnZugI
         DnQYiKjWAe1RUOPZftE6r0aF2AOGKrdyFViwtgWUwDSwaWF8EcUMsAY9kZotef7cOnrB
         ZH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352423; x=1772957223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MUY9ZBmDZl+OfoG0SmjcuxGXm9iN1eBUEEJQwad6G5U=;
        b=kuHITILQj37AdssRe6DgTkaHEp1noJ9fZsZzfOFmvCz6uSbzf3fYnMg4fSFNbm6BbJ
         LRZwwLMEnfe3N51cTzjLht8/GM/cw85Eq/GA2ydh5KLODbIvnQAyLu8xPX5xmobJcgBO
         RtH1xPNC4TnlrVpYKhWLC5Hvf2Gwq9xukWJDwFy/n6dVbqXFYfWVIynCZc/n+XzupTRc
         rcoNlMDMIYuoXe+5SvQCICy7HU7P4i+VQBFFKjiQPiMHTbTx9Kls+2jPZX4GIfTTSZcH
         ClEwk6aa7b5edEhyBZCI29m0DDcIfxqgkrqkvhvZClipVgrwLIDvTXmaq8oAcjC56vxH
         sCMw==
X-Forwarded-Encrypted: i=1; AJvYcCW2lYyPstPZVNx5gcUaWr2PBvWb8OoP7urmchYQtYPqcXzHj5YMZWrOV95YTfgjOQeqx9DVhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1JYI+W5lGkhh+SSftDBdW1oR9DYORphHyYwfLS0FYI5tDy/RP
	Y9czr+o2b8cfovpxhTsSxtf6HUOf8rPHKM5bbGFj4s0Hd8AP9s5b/pD8
X-Gm-Gg: ATEYQzwt3CQzgt6HB3xVPoJZTD17Y7ZTf1EILx/AcVuDAG2GWBR1+/AVaW0eGg0j1JL
	6U4EHxl064++DPLu2JRNNdr5dZiZ8X0ycoOc2zveU1fjGMa2BuXtw018j7rdoQp7Hv3GncpzEJl
	3FIubfjEbLbSJcCgESmo4ZvHK6m4jyDa1PhoIy7sfsZlw4JObeV8tXtcFuF2+5sDX+UrKyWtysH
	Yy6RLO18k+sfDYTA/v3NVdQ4KkGM+vN/KDCaNCZDN6SE7bKZKewUissmZ/v2ftfsVqls7Mbv/mt
	NwF1MWs0iEzCejr/KdurMc/h5UPdIcebcdU3lhu69GX4CbZyhsZviVEJAfpk0gf37D4qd7dk6mH
	LTjWK+YEQWaPapzgk+kZtRlke0xIXuTFvhOMUFx6SwXhsJa7N8w3yQPKOpE0vRrUoiQOd88zOzu
	SdigOdXfqEHD/mUDKXTtO8RYu4ETlJRKa6QJOsa5NXP4Nwxa6E3QMAPegOW/D/pC+7tFCgqCU3P
	p5rKXgrjg4Nuq/dMp51vsDINZdUnXMj4/EHVhhUir2PGZAk3iltaigYVytKira4eEPBfx3pLW2e
X-Received: by 2002:a17:90a:e18f:b0:356:8719:f516 with SMTP id 98e67ed59e1d1-35965ceaf7dmr8142105a91.24.1772352423345;
        Sun, 01 Mar 2026 00:07:03 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:07:02 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:26 +1000
Subject: [PATCH v3 7/7] ASoC: tas2770: expose SDOUT bus keeper via
 set_tdm_idle
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-7-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4520;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=tgaTiLnqDVU09V+sOch0MS59MDRnaMGowpS7pQpkHvk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP2dcTLpzemWex/bfGxXUDX58YpGPWnFnj8yUCo28u
 2eU9EtmdExkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKbaUpCR4YJRr9JVri/nYzdXH/q9TWVPg7Cu/fqlz6NSj7Bqmj44Y8PwT00yTkn
 RuGpje8r1VntOyysFth9LO+97iO69NGWv9stOdgA=
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
2.53.0

