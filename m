Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56382E0910
	for <asahi@lists.linux.dev>; Tue,  9 Dec 2025 09:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272739; cv=none; b=Ia6f+8OJtyAIcOy9YcSMsyQiKyDUJ9PxLtbP22XYbqBHX+nFh4JjbmBFkrZDPYEJ96SleuTVA8fCn2iA8Gl7jetIGMcLI3mHkMwSNShad7zEi3AbJptNhRj4iiEYlIyjx8isVcIYBqthEoBTYqdFKHDb/qe6VM4B6C6ZclOLsak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272739; c=relaxed/simple;
	bh=+drHU6Kv5dx2gWI6Rb8MzRIPjOqO6lKIV5+rr02mpIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZk53Ldaa8IR5YNPGLeD31UCfYd+8+l5E26Xe0hEgGK3ccHVS769ewufVCLjL9CveJ0cW8CNzocBen0a8aS/mtyvF3ukYBacPXydyqRI0x8LVL+QRhkv+l9p1MLzE4M+avlDbLTzJOrebSe59t2EdAGJ5MeDZWn39e4wR2zdv5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byHFOVuu; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byHFOVuu"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-343f52d15efso5096086a91.3
        for <asahi@lists.linux.dev>; Tue, 09 Dec 2025 01:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272737; x=1765877537; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PN0Qd2/OSPDiP/SCt4m3b00gB3oBVDwfSgnMIlH8+4=;
        b=byHFOVuuAhAn4RYa3NRdHjzGAER8X5qrIvTc9qJzz4DPVEI9uknjggnWfhIUbHpDUI
         GCTztdpe5QKhaBVizDk9I0oT5A3U+AQDnHPnCHtNL+5AYgBTHzrpR7bpdasgFbn75oej
         AMe38XsFgm/i1dI/mQHYx5tbmp/NLAz5t0jDOzJbAitC0Jg8MfCM4VqjcdgM3+JJ22U+
         3iJQ+1sU/ao978qqvTHYUuBp77dbTQgZtX4RcCtsIoawq5Ujekp/E78QnANJ0Z9gAPGx
         XdjCS8GDGoIVy9T/L/8oxhNZTlhrvSYaCHqJD7Du+a6eQf1O2jB3GIX6TrwVW+7nO0Xb
         h8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272737; x=1765877537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+PN0Qd2/OSPDiP/SCt4m3b00gB3oBVDwfSgnMIlH8+4=;
        b=dGb/Q4XzIdGmuQ/t/VgjPOaSvlTpw9ToOr8KHCwYKuljQJubi9/oPiUm78Pb2aXFHl
         7tDbTeuGyTGyV0i0TCTB5qt5xqGfIUMRAWRAyCt5GBsTF2lylpiLyugxp2ABWTrydg2A
         TPtl2kxJee2aGz9DNygJvtX2JxQmHlemTb/h6dcXnEYYiBgiCxaT4LX3PRK1InPLx0/4
         KhiVWQqALLOxCtECyJlSX+7Al0eYzeqHlQ6P6yla17yleuVKCW7ngHXODonK3P7zBp2x
         IE4g3n3bUK30EXW7oZECtie6JyECythiUyueViuPtZSZH7m+rhUhUfDtbdXF7otBvF/c
         WbAg==
X-Forwarded-Encrypted: i=1; AJvYcCVdtSGRZTVkOCF0ZRw/zFxunHRjpBblCQg+/RwOPrJzHXnq316kxefPyIHEL+gzrqlgYb2tHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxP23txcaVIl2xPwJMlQduzUV3TpnWZ6Y2c0D6zEJxk2m6ALVlA
	VfMRSaGvlRJmvN5b7MFtG8r98CRsAKI9e56MlMx1+3VPOvyCgAOVCvgU
X-Gm-Gg: ASbGncum6Q6gy7QMAT4XLL9Jz7UO/l4CSUp8Y8/qB/GZeEksR6mSmFGl1CT6fmoDJ13
	TkILv5Arx9IdT8BIwmOJ7fX9R70tV22K1d2K5P6UFLHveec92E9YQxIfQ9SHjsaatNJnZ37cmnk
	hM9Cet/K70niFTfoPQwRe+MuWG44eSnVa8ZHLPZYZ365WCjZjB9lIL5rUpQEo8bAjPse+a/TGMp
	7YwQY+e+fDy2id2Ha4408PpekTNuZdPmPL3G9iSVOm5382PYBjl1gFbDBUGZwsXQVmrDm0Rsbns
	SIMwhUN6Obb03JgigP7/LBGlRWuMQKpxsApahxXH2mhL+qgH+vm9/91rrmPFztraOD8vFo55NGM
	5h2a7+jmDVOzYR6ZYoDRQFrHQ+KlZ+vNNdo13B1aLrcTYWMY3ulrazM78hx2SG7g9fhUlTrX1bC
	3Io0hVjwHo25n93X8OtJN9HH/+VFxr7BiOtMmTsQRcRsF5GWBwYnSzRsVnS8B3A32aZrJQbk/fz
	dRNxGJGgHPMIEfCCiBLJAsKxzz22TOGhPJPNSmMnONggJJcRlWqoyTpNtFPGFWHii22ODgN0IaJ
	BMrzD3dOQOm1FpBSvPxjibYk2cYmix4o3GBn2YgNpZtea48ZKOBfk2440CT2FQ==
X-Google-Smtp-Source: AGHT+IFotzk8vBpJPn3igE6lPKAddyobbStk24n2ejESg7hiOK8wrzqTNKlOE578VcVOs6JfDZz2qQ==
X-Received: by 2002:a17:90b:35cb:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-349a250ee48mr9384938a91.15.1765272736911;
        Tue, 09 Dec 2025 01:32:16 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:16 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:19 +1000
Subject: [PATCH 6/7] ASoC: tas2764: expose SDOUT bus keeper via
 set_tdm_idle operation
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-6-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4997;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+drHU6Kv5dx2gWI6Rb8MzRIPjOqO6lKIV5+rr02mpIU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7JfL7h9ab2x4v5VXfeDrtgleVdwvmWYk9b4w7zy2
 8sdd+yvdUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKb6xi6GP1y/mVemPYxX+hStFdmwwFavarPMj9QTcfuDGrtMjn48W8rwV+jP1Fa
 Wa6duhjKu/KD9X1tVgbXtvWZDDaN1WaBCvOcHFgA=
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
op that properly configures the bus keeper too.

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

