Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56B447CA9D
	for <asahi@lists.linux.dev>; Fri,  2 Oct 2026 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934601; cv=none; b=Jvcg2Btt5YBGt7BPyoFkoAWHzJj9OtxzfNnPKcanBqFjqeGb3sIH1KvXWnKKqMViMhuDb12ASEKjZOeq1y+QAE953CMjVdkrTNK/A4+B0Oc7xw0hAiqUvq0tqU7BfHyKLDpw3Ka4ei6REIVnk+LGF5HndT2zR4Yu/upxnNdm2fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934601; c=relaxed/simple;
	bh=x1ZBqLFIaM0Z+IDRHbrg9+3Osva3FymaXC/7cGPEjTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3pAdRpXsVh5Dks4AdCRj8tggs4z1Udud9EKCyKQWRZmfcN3ulz170tBsQwDxh/2BsS4aC8ed5j6cLe9HNwSnu1PFZAwZAqpgY2KyQFgnehmIkBo2xICDZuCGVNyImMdHD6x56FJXS7WgXHVpR2MIGxGSInjRzFcNYmtXNSqGwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=NmW3FlA/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NmW3FlA/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so42756415e9.3
        for <asahi@lists.linux.dev>; Fri, 02 Oct 2026 02:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934591; x=1791539391; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kxyHe5+dBmZDe1DRKIR8ryWuA79UzUnyxbJbLGqT9E=;
        b=NmW3FlA/NTmSiPUz3cDP5i5Q1EfqACo7MP4d43SOOzO2q7p3FQUenCr6kgZMeV/h4Y
         2cAKvrP0wILCCRnX5Meq11/gicM8p258qeS5LnYGOBncYTDlMN7oKRJAY+3C261NS1lP
         hK+HFgEMVeiLvLW29VsiMYdZahYxZIieW2drk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934591; x=1791539391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kxyHe5+dBmZDe1DRKIR8ryWuA79UzUnyxbJbLGqT9E=;
        b=dfijttE7y9oaRqwf5CWTyAWHEjWwqHa6phqm608goyHyV0hhthcm8k5/TC6BCS6z6g
         fsUM/hoBP/M4w2vI0k6BLdMhLiy5dpenXyY8ZjQVItOpBHWaJNJhg4TMT2bRqK/ABpqF
         UosJvSy4SNBw0KcNqkCTEqZHa3ExY3X0zJjDCNo9dalBH6MFMTu2H5wImEpPprTJm1jC
         ipHsRPkAoi0Ebc/IUvTZ8uHmRPa/GdbdFN7kubbBcveGXAUwqkVOTSK3dtTjrfIecxzP
         WDax2hr54eNu0bcAG0pM32UuCwvTC4tNaWiPqJM4zHvj71weq89wMScOxRo/p/i4lb3Y
         ATXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpW6bdUBZqMG9wxVqCSMf/oFvKQgFdVmIE4MXjI4ntKNiK/5ShJRznNB4JnYo9ItombAijmA==@lists.linux.dev
X-Gm-Message-State: AFuF++lnh66ByTMJJGYawjxplaTXeDmYUmxDo/w45nSVa6O7VuvvMjHo
	zt4HFfmkjtXUmndFh5gzSWtg85MJFm8wnJxxf4Uh2zq1sErAHO2hSOSftwnapdYfu1o=
X-Gm-Gg: AYBFou1Jq3FUBL1shnQmJFjVGxJ4ZVD8fQzGbexv1ZABiQhJubbTRHcXZzoD4hWayoo
	8ikNS7U5VQpqz96/gE1eMZ4oRWA+0MHNn0R928z4S64AuGM/fBxthV3erEb9igw645Gqy8Pw7Hc
	NOLRfJfR07b4c0rTqoP2rovDZXKJecm1743WpfA9sTpM6txKPr/8U780FatWRHvn7z5yvQTtvXU
	35AIGILKnaTDcr2qiSaCRK0PGxk1OduQ8qbGCrKUlEXxKDyKoQm4sVE7psOYutCjh3Oqs6709Ti
	N9IxvL053x528VexgGoN84D2j/bRre6IBqRUedSqZrkH7W9OnW2iKZthbD8LXK47zXzOvrfKYYL
	ABMleORCYXfQzU/7B0iTH0FIKYeQvhJWm1iWkFvlIBBfUVrcL52r6jyeyE7MpPh9VmAI5dvpmHo
	J7FVtQj9ew0dtyY1QTNJUV8/p4N3zoxs5ksJKPNP3bfscJnSnVCH0GEBmTitaFXph59X4mrf/1o
	/M=
X-Received: by 2002:a05:600c:8b88:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a02757ebcdmr40187415e9.16.1790934590915;
        Fri, 02 Oct 2026 02:49:50 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff0c2fbsm35194105e9.3.2026.10.02.02.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:50 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:34 +0200
Subject: [PATCH 5/5] ASoC: pcm179x: Add support for pcm1975
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-5-f0e53bc7331f@amarulasolutions.com>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
In-Reply-To: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>
X-Mailer: b4 0.15.2

From: Michael Trimarchi <michael@amarulasolutions.com>

The PCM1795 is register compatible with the PCM1792A, but it encodes two
of the register 18 FMT[2:0] values differently: code 001 selects 32-bit
standard data instead of 20-bit, and code 100 selects 32-bit I2S instead
of 16-bit I2S. It has no 20-bit format at all. The PCM1796 shares the
PCM1792A encoding.

The model is read with device_get_match_data(), so each bus driver
carries the model in its own of_device_id table. The tables cannot move
to the common file: MODULE_DEVICE_TABLE() aliases a table that has to be
defined in the same translation unit.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x-i2c.c |  3 +-
 sound/soc/codecs/pcm179x-spi.c |  3 +-
 sound/soc/codecs/pcm179x.c     | 62 ++++++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/pcm179x.h     | 12 ++++++--
 4 files changed, 71 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2c.c
index e81e20fadadf..751f4b74647a 100644
--- a/sound/soc/codecs/pcm179x-i2c.c
+++ b/sound/soc/codecs/pcm179x-i2c.c
@@ -32,7 +32,8 @@ static int pcm179x_i2c_probe(struct i2c_client *client)
 #ifdef CONFIG_OF
 static const struct of_device_id pcm179x_of_match[] = {
 	{ .compatible = "ti,pcm1792a", },
-	{ .compatible = "ti,pcm1796", },
+	{ .compatible = "ti,pcm1795", .data = (void *)PCM1795, },
+	{ .compatible = "ti,pcm1796", .data = (void *)PCM1796, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
diff --git a/sound/soc/codecs/pcm179x-spi.c b/sound/soc/codecs/pcm179x-spi.c
index e5e4b942acfc..2b487a4d7c82 100644
--- a/sound/soc/codecs/pcm179x-spi.c
+++ b/sound/soc/codecs/pcm179x-spi.c
@@ -31,7 +31,8 @@ static int pcm179x_spi_probe(struct spi_device *spi)
 
 static const struct of_device_id pcm179x_of_match[] __maybe_unused = {
 	{ .compatible = "ti,pcm1792a", },
-	{ .compatible = "ti,pcm1796" },
+	{ .compatible = "ti,pcm1795", .data = (void *)PCM1795, },
+	{ .compatible = "ti,pcm1796", .data = (void *)PCM1796, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcm179x_of_match);
diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index c059e410cbbe..3ee781ff54f8 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -19,6 +19,7 @@
 #include <sound/soc.h>
 #include <sound/tlv.h>
 #include <linux/of.h>
+#include <linux/property.h>
 
 #include "pcm179x.h"
 
@@ -63,6 +64,7 @@ struct pcm179x_private {
 	struct regmap *regmap;
 	unsigned int format;
 	unsigned int rate;
+	enum pcm179x_type codec_model;
 };
 
 struct pcm179x_fmt_table {
@@ -71,7 +73,17 @@ struct pcm179x_fmt_table {
 	unsigned int value;	/* FMT[2:0] */
 };
 
-static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
+/*
+ * Register 18 FMT[2:0] is not encoded the same way by every model: value 001
+ * and value 100 are 20-bit and 16-bit I2S on the PCM1792A/PCM1796 but 32-bit
+ * and 32-bit I2S on the PCM1795, and neither model has a 32-bit
+ * left-justified mode.
+ *
+ * The PCM1792A/PCM1796 have no 32-bit format at all, so a 32-bit container
+ * keeps the 24-bit value and is clocked out as 24-bit data, as this driver has
+ * always done. Only the PCM1795 has real 32-bit formats.
+ */
+static const struct pcm179x_fmt_table pcm179x_fmt[] = {
 	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
 	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
@@ -82,16 +94,53 @@ static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
 	{ SND_SOC_DAIFMT_I2S,     32, 5 },
 };
 
+static const struct pcm179x_fmt_table pcm1795_fmt[] = {
+	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 32, 1 },
+	{ SND_SOC_DAIFMT_LEFT_J,  24, 3 },
+	{ SND_SOC_DAIFMT_I2S,     24, 5 },
+	{ SND_SOC_DAIFMT_I2S,     32, 4 },
+};
+
+struct pcm179x_model {
+	u64 formats;
+	const struct pcm179x_fmt_table *fmt;
+	unsigned int num_fmt;
+};
+
+static const struct pcm179x_model pcm179x_models[] = {
+	[PCM1792A] = { PCM179X_FORMATS, pcm179x_fmt, ARRAY_SIZE(pcm179x_fmt) },
+	[PCM1795] = { PCM1795_FORMATS, pcm1795_fmt, ARRAY_SIZE(pcm1795_fmt) },
+	[PCM1796] = { PCM179X_FORMATS, pcm179x_fmt, ARRAY_SIZE(pcm179x_fmt) },
+};
+
 static int pcm179x_fmt_value(struct pcm179x_private *priv, unsigned int fmt,
 			     unsigned int width)
 {
-	for (unsigned int i = 0; i < ARRAY_SIZE(pcm1792a_fmt); i++)
-		if (pcm1792a_fmt[i].fmt == fmt && pcm1792a_fmt[i].width == width)
-			return pcm1792a_fmt[i].value;
+	const struct pcm179x_model *model = &pcm179x_models[priv->codec_model];
+	const struct pcm179x_fmt_table *fmt_tbl = model->fmt;
+
+	for (unsigned int i = 0; i < model->num_fmt; i++)
+		if (fmt_tbl[i].fmt == fmt && fmt_tbl[i].width == width)
+			return fmt_tbl[i].value;
 
 	return -EINVAL;
 }
 
+static int pcm179x_startup(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct pcm179x_private *priv = snd_soc_component_get_drvdata(component);
+	u64 formats = pcm179x_models[priv->codec_model].formats;
+
+	snd_pcm_hw_constraint_mask64(substream->runtime,
+				     SNDRV_PCM_HW_PARAM_FORMAT, formats);
+
+	return 0;
+}
+
 static int pcm179x_set_dai_fmt(struct snd_soc_dai *codec_dai,
                              unsigned int format)
 {
@@ -149,6 +198,7 @@ static const u64 pcm179x_selectable_formats =
 	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J;
 
 static const struct snd_soc_dai_ops pcm179x_dai_ops = {
+	.startup	= pcm179x_startup,
 	.set_fmt	= pcm179x_set_dai_fmt,
 	.hw_params	= pcm179x_hw_params,
 	.mute_stream	= pcm179x_mute,
@@ -190,7 +240,7 @@ static struct snd_soc_dai_driver pcm179x_dai = {
 		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.rate_min = 10000,
 		.rate_max = 200000,
-		.formats = PCM1792A_FORMATS, },
+		.formats = PCM179X_FORMATS, },
 	.ops = &pcm179x_dai_ops,
 };
 
@@ -226,6 +276,8 @@ int pcm179x_common_init(struct device *dev, struct regmap *regmap)
 	if (!pcm179x)
 		return -ENOMEM;
 
+	pcm179x->codec_model =
+		(enum pcm179x_type)(uintptr_t)device_get_match_data(dev);
 	pcm179x->regmap = regmap;
 	dev_set_drvdata(dev, pcm179x);
 
diff --git a/sound/soc/codecs/pcm179x.h b/sound/soc/codecs/pcm179x.h
index 0039ca8ee742..33971fa93546 100644
--- a/sound/soc/codecs/pcm179x.h
+++ b/sound/soc/codecs/pcm179x.h
@@ -8,8 +8,16 @@
 #ifndef __PCM179X_H__
 #define __PCM179X_H__
 
-#define PCM1792A_FORMATS (SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S24_LE | \
-			  SNDRV_PCM_FMTBIT_S16_LE)
+enum pcm179x_type {
+	PCM1792A,
+	PCM1795,
+	PCM1796,
+};
+
+#define PCM179X_FORMATS (SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+			 SNDRV_PCM_FMTBIT_S16_LE)
+
+#define PCM1795_FORMATS (SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
 extern const struct regmap_config pcm179x_regmap_config;
 

-- 
2.55.0

