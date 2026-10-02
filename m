Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA2D474263
	for <asahi@lists.linux.dev>; Fri,  2 Oct 2026 09:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934598; cv=none; b=UostceYWA0u0zDtkf1aPEJ7vgf0h39hk3u6Krih8Ud90Lu5lhU5MI9tG0g5s8Ps2moRYfXreqUgnx1YtXgtQQ0TwY0CCruthUFYMndEoMQVv9uIHNsscLMwlJz/dYrNLHVK29eOLO2XvGekZBtG2jYtSi6rU56SDhnbB8HCqJYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934598; c=relaxed/simple;
	bh=Nv8VQkbUiPG1aZzPVXB79Tte0iN24CS3tAzHXZLKcRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UEQo9uUDvNOTz02UZO9gHTfLUFEq69hdXJs1GuLZ3nLwURYYJp6kf9k2Gl37U5Xf2WBI8Qxng3kSwPPOTtN6KBu9km+1iDC6lkUC/o6e1QTh6TBEoE17P4USa9Yw+5sKhYOInw+h5FXDVWSzzQBogsbbmz+HqOA2ZfJCNKcfdcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=NogyyxEd; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NogyyxEd"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a00d8bec5aso24291435e9.2
        for <asahi@lists.linux.dev>; Fri, 02 Oct 2026 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934587; x=1791539387; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+lEaq8UIfWxZ/tIjV0SG6p5OStGVbQ7BX4PDBI90Lg=;
        b=NogyyxEdnwvOwUpSrNE/c8ve4bgH96fj9xI7mrq/Dm4VZ486EDdxEw9uW8QPL34SNx
         x9hmqQvdxRWLbxcidadgKrb8pNIhW+2p0+BKNYHSNExA7RWvAL3cCNYo8+RwxcS8vt05
         eYHJDWlPVY/5pYJWCLocVMamVk2m5miw3WB0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934587; x=1791539387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+lEaq8UIfWxZ/tIjV0SG6p5OStGVbQ7BX4PDBI90Lg=;
        b=BoIqx66KocR5Rnc8pPabDocnDco5qL1u9xEX+okUsRe1FqThQdmysBS9zEGW476cWu
         LALom3ln/DIhPR6x2p55tvtr8k/HqaQZyVWqTQi6PrxPSUhHlzVb1x1lH+IzO4QwvpZv
         W/Ewvw3rJ4t5JIjwQPzwl2ZAyzBSiX9qM/FvBsA1fxiWbhLlzVnMkTO8nkY4MLzHN0//
         Kd7YE13P46htJhHDJ7j1VpP2FhZq40mkHSez14AkCbFK/HFPtG6pgur71icEq8f4tKl2
         L8PAvKABX6xWGOF5uzVPtEaYefkH+5KS+ZXHq6cAOkfRx6jOmoNidV3ejFzuOE3MXML0
         kQAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxws4agoiPyjllssKGcy5A1wpH3rZvE00yLi1EyTnwPNVA01GznG7KOmbapkN1pVI1p9xYiHw==@lists.linux.dev
X-Gm-Message-State: AFuF++k7t9adiI1BkvhepyOzBXBBKq3/X4ndi80cVR8/MieO4b/VzQMV
	c49CZ7alGNlZ1GIGJ8+Ab6En5t4Ywc4vTA20x0vungZq8CY592z/0cHrbQdL+qWQlRM=
X-Gm-Gg: AYBFou0z5vte+FXX+D2ztHpT5ziAwSIKIuamlp6mnWEXO+TuY1dIFLV1sk0cE47jhO/
	ejs+6Z/acZip3Jhyxl0VkxRKth/HEJselpExcsumQanwDN6/O8Wh8Ps+o7shem4TBvdxZaQnFJr
	n/SFRJhb4MQpbevgqpFrGRVy7ll1s+Zw1kxwd+zZuxhofwC9tE3UdJquc9H7R/PIKuuwI6/ResF
	3X8bz5tVEiw5tvYSN1ecQmQmNhq90do9U2RU5vM+vJNk+jGeWuAcdlyuvTYfiooRb49rGipx3Tv
	ccbi0xtAkA5aITcYW4TykdjK1uqbd1oNpOAs/gvQCqKB+3F8MepFf7HO4YCj5n2J30vEZ5i3IIX
	YtGc/9Z9nw+9j5D4F9mj2QDakMFby9M7rTaNQZpnWojk8dD3rGf5vpFTrCULn/3DMgQe+4+3s6h
	Dd//C4ZrJqUVYhaoicD2bqFCSZnvftqE2oN2PPv1ddoXEs1IwwIPneyX5D4h3z9xOYM57PrGpMH
	CU=
X-Received: by 2002:a05:600c:1d09:b0:4a0:37d:9e21 with SMTP id 5b1f17b1804b1-4a0276ed19amr37928025e9.29.1790934587622;
        Fri, 02 Oct 2026 02:49:47 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a039505568sm52146605e9.3.2026.10.02.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:47 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Date: Fri, 02 Oct 2026 11:49:31 +0200
Subject: [PATCH 2/5] ASoC: pcm179x: Refactor regmap value lookup
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261002-work-v1-2-f0e53bc7331f@amarulasolutions.com>
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
 linux-amarula@amarulasolutions.com
X-Mailer: b4 0.15.2

Use a table lookup to find values for fmt register instead of switch
statements to prepare for additional codec variants of the same family.

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
 sound/soc/codecs/pcm179x.c | 60 +++++++++++++++++++++++-----------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/pcm179x.c b/sound/soc/codecs/pcm179x.c
index cb70927872aa..61b87dab3266 100644
--- a/sound/soc/codecs/pcm179x.c
+++ b/sound/soc/codecs/pcm179x.c
@@ -65,6 +65,31 @@ struct pcm179x_private {
 	unsigned int rate;
 };
 
+struct pcm179x_fmt_table {
+	unsigned int fmt;	/* SND_SOC_DAIFMT_* */
+	unsigned int width;	/* sample width in bits */
+	unsigned int value;	/* FMT[2:0] */
+};
+
+static const struct pcm179x_fmt_table pcm1792a_fmt[] = {
+	{ SND_SOC_DAIFMT_RIGHT_J, 16, 0 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 24, 2 },
+	{ SND_SOC_DAIFMT_RIGHT_J, 32, 2 },
+	{ SND_SOC_DAIFMT_I2S,     16, 4 },
+	{ SND_SOC_DAIFMT_I2S,     24, 5 },
+	{ SND_SOC_DAIFMT_I2S,     32, 5 },
+};
+
+static int pcm179x_fmt_value(struct pcm179x_private *priv, unsigned int fmt,
+			     unsigned int width)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(pcm1792a_fmt); i++)
+		if (pcm1792a_fmt[i].fmt == fmt && pcm1792a_fmt[i].width == width)
+			return pcm1792a_fmt[i].value;
+
+	return -EINVAL;
+}
+
 static int pcm179x_set_dai_fmt(struct snd_soc_dai *codec_dai,
                              unsigned int format)
 {
@@ -96,40 +121,15 @@ static int pcm179x_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct pcm179x_private *priv = snd_soc_component_get_drvdata(component);
-	int val = 0, ret;
+	int val, ret;
 
 	priv->rate = params_rate(params);
 
-	switch (priv->format & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_RIGHT_J:
-		switch (params_width(params)) {
-		case 24:
-		case 32:
-			val = 2;
-			break;
-		case 16:
-			val = 0;
-			break;
-		default:
-			return -EINVAL;
-		}
-		break;
-	case SND_SOC_DAIFMT_I2S:
-		switch (params_width(params)) {
-		case 24:
-		case 32:
-			val = 5;
-			break;
-		case 16:
-			val = 4;
-			break;
-		default:
-			return -EINVAL;
-		}
-		break;
-	default:
+	val = pcm179x_fmt_value(priv, priv->format & SND_SOC_DAIFMT_FORMAT_MASK,
+				params_width(params));
+	if (val < 0) {
 		dev_err(component->dev, "Invalid DAI format\n");
-		return -EINVAL;
+		return val;
 	}
 
 	val = val << PCM179X_FMT_SHIFT | PCM179X_ATLD_ENABLE;

-- 
2.55.0

