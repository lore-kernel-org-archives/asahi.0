Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C4015539A
	for <asahi@lists.linux.dev>; Sun,  1 Mar 2026 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352409; cv=none; b=Y9lioa8P2Me+L8dBQa4ghrSLL7qrceO+5gakANvsavxAIMcXj9IRjSscXsYwTcxZHP8lICEhdhlaG9XVrH2wgSLeE2w8noadIGxt+x0ADx+gO7j1wDQMkA10rbOL4+1QFpMz6wBSw3iKN/TliuV/ybI0mJbLNqCoX0OK1mvJqQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352409; c=relaxed/simple;
	bh=rqHc/7eJJOJ6QC/+Z/HBxx57SV1pobAnEybE9GKRIxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WdpmS6SB3XeLyV94eDAxl0AEhDnrXUxxjNcs34IwNit+2C9JX5R3QqwYoWULUJYf5GhZheF+dati/UTNO+xCVQ3kSN6uV4ufObBAUlqNv9MuRRnTLvU6/otkPVbFa8SuV26yi5F2kHyW/ITPlR6gwIceqkAp9fU/DaynmCDJrMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gM1ZxhaN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gM1ZxhaN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2101169a91.3
        for <asahi@lists.linux.dev>; Sun, 01 Mar 2026 00:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352408; x=1772957208; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7FTeTejosz3HBWt4lvx3HRODQxLOqbKVT6yXP2mGuM=;
        b=gM1ZxhaNQAq3Oz0aBPwzbYM7QKQXgWiFg5Fp3KGwXCfLA3NSGeOIaGWyaAq1jUurj6
         9DGTzQnFdo5o7ks+zWQKjOuRNPJvw4e/OzPBpRYykebQVKox829py1ZM1212z28TVMRy
         +z3y5P9H2GUXtPKKzIPRbyLNYVWW8iYxXLBjWNL8/awq04ZXHCxMyfuq87jRqyku42qT
         t/hXmoSIHMQWoaHWctkhdQk7d5nR/jqgtNJjWLbnrFaqel9wrYrlBEPIUWdYdjWvSbxy
         3yK717voDvrUgIQy2tCzGvrzvNmKg0vIpmKBCIcLaJUoa+/orFvk/xkhOuiC3anX1NGO
         dqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352408; x=1772957208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A7FTeTejosz3HBWt4lvx3HRODQxLOqbKVT6yXP2mGuM=;
        b=XEZyTr/BxgyxnWF2DxMIjMfFMmUK+rMtHQL6janJouWqwHSmyqiXukWo2rxMSv6I8z
         3WtZtfGPQwGdFSPy+QBWlD+/iEpMdHa1LoAXcLPhRVR6gkjNX7KcxuSilTV2prF7i3Yo
         oF/8O4GvJ9wx7k06XsYh20Xbth4gSfr5QMUviG1OAq8C3nz/SjVlD/DjodfGecGgoqdG
         75z1OyMkvKF8y0z/zvlPbIt2tWXVAyxEMruDvbLaAYwcd12APhselKluPMWZBUg3A4KR
         G3AE1KzuoZOrBY1j9uSKTgjboIH7jHR0FQ2DO920X7Q2ntoED8XBO6VG2vOrK11MMdrq
         RMiA==
X-Forwarded-Encrypted: i=1; AJvYcCXFVjqq018IZ9thsuSd3OzYBwYrfIF+cUsyfmMOEUp52aJZzALOTBeNbkZoc6m8M/iSRwnApw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYDT27/zITSLj51SnOpR5u6s28KnQq148sR41STNJq6ZXShtrk
	JyjL/u+2dpgcY8ZiYpDcToLDAbP4mvx17vICYrQW6GoermG46JyBW8A3
X-Gm-Gg: ATEYQzw5wezq+Tl+fFBKJlOPHS/okdXGhxvW3cn11nEa9V16aN81Soa+NmbvE8FWtKy
	OEjA5I3NP3Nu6WYazxvnMjazVVlYxCDZtNSB3DAUl+CsWE1PN4UmZ1OEOS9hI7nRHM3/+JF6joY
	Dlo1mNHbzbE+y/0B5oTG/VLHukmtlQB1efZpAY2+LyYAbpLfzI8pLMEjsO0rBhB/sZuhb9YmRyA
	FxaejgGdf51QpYKhJesYu/whxzuEWbjFpu6SX2GVwkuFeqF7/4gRLqJ7T72IEG5CS5cUdKC0hFI
	zpeSqJq1/fACd6jiWxs85840IVQBcwB03wQwZovAeJE//T4HPJ4bKBnyMKL64pVPfTtlwgOhQGx
	9weIVX0+XLykGbb6CGnlAk7UGWvEQ2OtVmVVApPuYY62caTTA1PU2QNl0ldW7rLrumYhS/KJQ6/
	Zx+8rAyZ5uFMxwMXKl/5qP5EswglPzVBvp/CORgftNWwWo3LjvuxgjO6DsnoSpZ5UQTeL75nC7P
	GCjKFrWxwaVONxsA6PKqzHK81MXR2kiOz1Qfs3MsRN1ERw8C8hUB8Uxn2/XkWwtesX/qoICRnCP
X-Received: by 2002:a17:90a:f950:b0:356:22ef:57ba with SMTP id 98e67ed59e1d1-35965c17f28mr6826445a91.7.1772352407658;
        Sun, 01 Mar 2026 00:06:47 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:47 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:24 +1000
Subject: [PATCH v3 5/7] ASoC: soc-dai: add common operation to set TDM idle
 mode
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-5-c6ac5351489a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3972;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=rqHc/7eJJOJ6QC/+Z/HBxx57SV1pobAnEybE9GKRIxI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fHbmx7kXl96WTxidGSMsWbznFOqazZpjSdxWp3p
 OgcsdayjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQHlTIy7H+vPHeZsVjRqpyjTIlX6t/3GuyeUMb6iHdldILNd5V78xj++y1kKM/
 kX1mzJXNuWVb416nGnxV5G11PqHusm5xx8qY2FwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, like certain Texas Instruments codecs, integrate
configurable bus keepers that dictate the codec's behaviour during
idle TDM slots. Now that we have definitions for various idle modes,
add a snd_soc_dai_set_tdm_idle() operation to control this in a
standardised way.

This is useful on Apple Silicon laptops, where a single I2S bus is
comprised of two physical lines which are ORed just before the
receiving port. When a codec on one line is transmitting, we must
guarantee that the other line is low. We can achieve this by
configuring one codec on each line to use its bus keeper to fill
its line with zeroes during the active slots of the other line.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h |  7 +++++
 sound/soc/soc-dai.c     | 40 +++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 44dd06add52e..6a42812bba8c 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -196,6 +196,10 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width);
 
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode);
+
 int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 	unsigned int tx_num, const unsigned int *tx_slot,
 	unsigned int rx_num, const unsigned int *rx_slot);
@@ -312,6 +316,9 @@ struct snd_soc_dai_ops {
 	int (*set_tdm_slot)(struct snd_soc_dai *dai,
 		unsigned int tx_mask, unsigned int rx_mask,
 		int slots, int slot_width);
+	int (*set_tdm_idle)(struct snd_soc_dai *dai,
+			    unsigned int tx_mask, unsigned int rx_mask,
+			    int tx_mode, int rx_mode);
 	int (*set_channel_map)(struct snd_soc_dai *dai,
 		unsigned int tx_num, const unsigned int *tx_slot,
 		unsigned int rx_num, const unsigned int *rx_slot);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index a1e05307067d..2f370fda1266 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -282,6 +282,46 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_slot);
 
+/**
+ * snd_soc_dai_set_tdm_idle() - Configure a DAI's TDM idle mode
+ * @dai: The DAI to configure
+ * @tx_mask: bitmask representing idle TX slots.
+ * @rx_mask: bitmask representing idle RX slots.
+ * @tx_mode: idle mode to set for TX slots.
+ * @rx_mode: idle mode to set for RX slots.
+ *
+ * This function configures the DAI to handle idle TDM slots in the
+ * specified manner. @tx_mode and @rx_mode can be one of
+ * SND_SOC_DAI_TDM_IDLE_NONE, SND_SOC_DAI_TDM_IDLE_ZERO,
+ * SND_SOC_DAI_TDM_IDLE_PULLDOWN, or SND_SOC_DAI_TDM_IDLE_HIZ.
+ * SND_SOC_TDM_IDLE_NONE represents the DAI's default/unset idle slot
+ * handling state and could be any of the other modes depending on the
+ * hardware behind the DAI. It is therefore undefined behaviour when set
+ * explicitly.
+ *
+ * Mode and mask can be set independently for both the TX and RX direction.
+ * Some hardware may ignore both TX and RX masks depending on its
+ * capabilities.
+ */
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode)
+{
+	int ret = -EOPNOTSUPP;
+
+	/* You can't write to the RX line */
+	if (rx_mode == SND_SOC_DAI_TDM_IDLE_ZERO)
+		return soc_dai_ret(dai, -EINVAL);
+
+	if (dai->driver->ops &&
+	    dai->driver->ops->set_tdm_idle)
+		ret = dai->driver->ops->set_tdm_idle(dai, tx_mask, rx_mask,
+						     tx_mode, rx_mode);
+
+	return soc_dai_ret(dai, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_idle);
+
 /**
  * snd_soc_dai_set_channel_map - configure DAI audio channel map
  * @dai: DAI

-- 
2.53.0

