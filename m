Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C362749ED
	for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309836; cv=none; b=MVWZeFjNGTgThgimGA5+nwmJX0cUzZggx3CXsjamDgLQKOkFe7tmPVF2+FKd/YbNQzKKbSd17dtAPPMmSnClg3h6O3QwnwToqD/j8e9RnrYE41BIIAZ1WOn8IgeJRt/bEbvtlzf2mHqVNm+EcgNzrRffv67I/tvVYvwC3MtPM3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309836; c=relaxed/simple;
	bh=BcCWaQDqk2hqFZcbljTe5TshvfrnYl4MYwks/r0wuug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDdvCwftXx3MpqJhcn5i9aLVFl54gk9kDkDgJ9Fs28uipHbcOirK7IRdyOxUX5KuWA17FkcHgdwovIuQMBC2hTx6oCogrfuZcA0wUaqL1qSUw7/o3u0097MidJbgiLV4DYPeP0Gp5UmJ8rfMamAGIEn2KCE04DkWhHlZspnZJqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E66Vc+AV; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E66Vc+AV"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0d5c365ceso38987895ad.3
        for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 01:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309833; x=1766914633; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5a5A+6f9bpZxYjLZ9S9FAbY+lPxNj4oyHeruadBhzY=;
        b=E66Vc+AVNZ+H2Odr0yyQJqNPdbBARfvSPeBPq4DkeLyObVC//LZmokQ5CiaHOPk8vN
         m1DCbG3j/tKw0tX/uYhCeEekyPgAEbxIK6iP1sD56zRFAVm+qMCpiKNZ/NPPEVUnWU9E
         OuWT04E2KdAlzLVNSduSoHvLHV4l1zVN5C8zPv+RGVqUWvN1e5Ya0qApj2rR7w9wTyYh
         FT7axySrSHtiaw09BIzyl66k40TNqX4NFWGelolnl+ndLiH2zvRmow72HI3V9+eaLrXe
         LOQE4Ibyzx8IL8IRtw/vDBABYu7UBJl9BK7Qmg111Veh6FXZkIV5U2vxvsvdMmIRUlhx
         EPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309833; x=1766914633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V5a5A+6f9bpZxYjLZ9S9FAbY+lPxNj4oyHeruadBhzY=;
        b=u84XnnIqmQPC+IxtOjPb4sbJBgUJtlDhcuHgE49Ta9tydNlEYtTVlEu/qwN2fTN74l
         NINDGRdjNx4Lq1uDnU3JCClP5rvLs352NEvex3yRzOlLcTYZbaUS2hWo5bcJuY8BS0Xo
         vHURZxSLxs1fJYuC1Z1I2Wof7Hguwumk31xIR2XwKf/8BL7zjKGN9kHnZ11qa2ERYw7y
         EXT1IHrRuLkz1kvKVGn7YTlG16PfSF6EBWasbuEVQjPXx/Q0c7zyvSqaC9xaX2JPgnyb
         b7rTVGYEvqHKReVjl3KN5/PkllCHVkR1LlllS1fYOmjVpDyO6H9V36Q3w4pfUZCZxn+O
         p1hA==
X-Forwarded-Encrypted: i=1; AJvYcCXDeWnM4/sVBfCwF2auC/3OgRNkef6Rk2hwkGFT51I2tOkZO24mBGIr4gThrTtmo9mDashk5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWDDBiFRTZT1Z49zwGU5ON7EMU8Gj9tylTy70eE55X2BLthGFO
	uw/qQVpezIX8xJUM6tfhWwMgXJfj3XDNiL5A1waH1KDU6xgvB9v5h4kF
X-Gm-Gg: AY/fxX52pdADKV8jQnHmBufAw+qHP5SJJeNDI/Z4LJNQKfmovo5xEFrjUzKukheHtfk
	EhfRONAiRfgYiIgsYAUeFi/hj9qnJEsWv3A/LRmWEnktZVgAeTZncnD4XY7NGkqtvOec4hMLA2w
	MFI9KBxRah1HMfHWV0h3YPQ1Dxir3XnqD43B38EmghZN3hP2C6sLzqK5lNd5CnWYTugiD6UQ5Nn
	Cka2BQZVpRQ40e9a8OU3Ond5o8E/vlXBJTAYOTDIWaD/D3NKtjBCbH9w+9Qfw8ZbPfdOzx2lP4E
	0JRP53tzpyqDVK5TI+BHSf/H0KWkXYJzcAzPP21RF+qggcuCkPzCrl45zMfyMUY3Bq4Snbzpo+V
	0HNxeKRq3Zv1SPTNfDziNh8hW7CB315cQn9SbUr8Kep7VZGB48U2T0Lic83WnS1gW8V1E/kdFZX
	KuXOl0xgc3/Qghw28qehNf2NiFYMqCFkUdH2P/BySkXkIH5a7RTkFdP8HXB/a/NEXj7GfDooIew
	q3jak9eefx0yn5aUGdtc1LwKJRFzpxPr7kGL51ighDJj0cQFhEluZtrM8jePZYVW04IEYXmJ53M
	/PNQoWMWl5s9MCV92llhsglM08pMwzkCgb4zXmBG0OZgljuBYLU=
X-Google-Smtp-Source: AGHT+IGMdyycbEEhzOfaP2Ty3g+HwuUlrykYJWMidFb++M717umnxFkAmzfzB53xMVODmVdckFRerQ==
X-Received: by 2002:a17:903:4b47:b0:2a0:e94e:5df6 with SMTP id d9443c01a7336-2a2f28335ffmr80140275ad.50.1766309832723;
        Sun, 21 Dec 2025 01:37:12 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:37:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:02 +1000
Subject: [PATCH v2 6/7] ASoC: tas2764: expose SDOUT bus keeper via
 set_tdm_idle operation
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-6-ed4d96413aec@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4983;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=BcCWaQDqk2hqFZcbljTe5TshvfrnYl4MYwks/r0wuug=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yeXTb3J8Yz9vVX1g5YygxSGhRIJQhKv88V+6ynkl
 dry++d1TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApprhFMNvVq/fM9f3TeT60aaX+KHjVf/r6Qtvvb8j2Dvd+sMcxi2z4hgZ2o7JaDE
 r9c45+PQi8yW9U247y1WTJbRnm0ebf3E7s+IJGwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2764, and the Apple-exclusive variant SN012776, include bus keepers
on the SDOUT pin that can be configured to alter the behaviour of the
SDOUT pin during specified TDM slots. The chip can either leave the
bus floating (default/uninitialised behaviour) or fill the specified
slots with zeroes.

Expose the SDOUT bus keeper and allow it to be configured using the
set_tdm_idle DAI op. The mask must be cropped to only cover slots
valid for the configured BCLK ratio, so introduce a set_bclk_ratio
op that properly configures this.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 95 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h | 11 +++
 2 files changed, 106 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 36e25e48b354..423b7073b302 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -44,6 +44,11 @@ struct tas2764_priv {
 
 	bool dac_powered;
 	bool unmuted;
+
+	struct {
+		int tx_mode;
+		unsigned int tx_mask;
+	} idle_slot_config;
 };
 
 #include "tas2764-quirks.h"
@@ -509,11 +514,101 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int tas2764_write_sdout_idle_mask(struct tas2764_priv *tas2764, u32 mask)
+{
+	struct snd_soc_component *component = tas2764->component;
+	int i, ret;
+
+	/* Hardware supports up to 64 slots, but we don't */
+	for (i = 0; i < 4; i++) {
+		ret = snd_soc_component_write(component,
+					      TAS2764_SDOUT_HIZ_1 + i,
+					      (mask >> (i * 8)) & 0xff);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int tas2764_set_dai_tdm_idle(struct snd_soc_dai *dai,
+				    unsigned int tx_mask, unsigned int rx_mask,
+				    int tx_mode, int rx_mode)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	/* We don't support setting anything on SDIN */
+	if (rx_mode)
+		return -EOPNOTSUPP;
+
+	if (tas2764->idle_slot_config.tx_mask == tx_mask &&
+	    tas2764->idle_slot_config.tx_mode == tx_mode)
+		return 0;
+
+	switch (tx_mode) {
+	case SND_SOC_DAI_TDM_IDLE_ZERO:
+		if (!tx_mask)
+			return -EINVAL;
+
+		ret = tas2764_write_sdout_idle_mask(tas2764, tx_mask);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component,
+						    TAS2764_SDOUT_HIZ_9,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
+		if (ret < 0)
+			return ret;
+
+		tas2764->idle_slot_config.tx_mask = tx_mask;
+		tas2764->idle_slot_config.tx_mode = tx_mode;
+		break;
+	case SND_SOC_DAI_TDM_IDLE_HIZ:
+	case SND_SOC_DAI_TDM_IDLE_OFF:
+		/* HiZ mode does not support a slot mask */
+		ret = tas2764_write_sdout_idle_mask(tas2764, 0);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component,
+						    TAS2764_SDOUT_HIZ_9,
+						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN, 0);
+		if (ret < 0)
+			return ret;
+
+		tas2764->idle_slot_config.tx_mask = 0;
+		tas2764->idle_slot_config.tx_mode = tx_mode;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+/* The SDOUT idle slot mask must be cropped based on the BCLK ratio */
+static int tas2764_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+{
+	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(dai->component);
+
+	if (!tas2764->idle_slot_config.tx_mask)
+		return 0;
+
+	tas2764->idle_slot_config.tx_mask &= GENMASK((ratio / 8) - 1, 0);
+
+	return tas2764_write_sdout_idle_mask(tas2764, tas2764->idle_slot_config.tx_mask);
+}
+
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.mute_stream = tas2764_mute,
 	.hw_params  = tas2764_hw_params,
 	.set_fmt    = tas2764_set_fmt,
+	.set_bclk_ratio = tas2764_set_bclk_ratio,
 	.set_tdm_slot = tas2764_set_dai_tdm_slot,
+	.set_tdm_idle = tas2764_set_dai_tdm_idle,
 	.no_capture_mute = 1,
 };
 
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 538290ed3d92..4494bc4889dc 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -126,4 +126,15 @@
 
 #define TAS2764_BOP_CFG0                TAS2764_REG(0X0, 0x1d)
 
+#define TAS2764_SDOUT_HIZ_1            TAS2764_REG(0x1, 0x3d)
+#define TAS2764_SDOUT_HIZ_2            TAS2764_REG(0x1, 0x3e)
+#define TAS2764_SDOUT_HIZ_3            TAS2764_REG(0x1, 0x3f)
+#define TAS2764_SDOUT_HIZ_4            TAS2764_REG(0x1, 0x40)
+#define TAS2764_SDOUT_HIZ_5            TAS2764_REG(0x1, 0x41)
+#define TAS2764_SDOUT_HIZ_6            TAS2764_REG(0x1, 0x42)
+#define TAS2764_SDOUT_HIZ_7            TAS2764_REG(0x1, 0x43)
+#define TAS2764_SDOUT_HIZ_8            TAS2764_REG(0x1, 0x44)
+#define TAS2764_SDOUT_HIZ_9            TAS2764_REG(0x1, 0x45)
+#define TAS2764_SDOUT_HIZ_9_FORCE_0_EN BIT(7)
+
 #endif /* __TAS2764__ */

-- 
2.52.0

