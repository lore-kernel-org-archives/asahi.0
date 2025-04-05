Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F6F9479
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 00:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812030; cv=none; b=leNNX4UPnbgdCc/iRNeyKGTfU3/rIT67MT07yb7g9vVC7a/ekBrTfh2nGIGT5OXFU4mKkDKcMqtZj4CBvu4gosvFc5meVysm2yy2krpVO0DQYWt/j3OjmTRyaaoPfNDKmxTzQqJm5v4GYVuLlrqZtK75TjNKL8//UB/o+/KaRro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812030; c=relaxed/simple;
	bh=6UnJG1AvPDEmmk5tRo4+qNp8VLMd4iFaYjd8CWq1RX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EbRTfUMkg18BlUCCy9y46E/52gXEYm3CxczCSh68cJ6iaKl6GohBfCM+koDgigajhmGqXYIBRJjlSL2UOpgfNPs/gK79suhWijTGhXbNADhuYabfsFt3po8qPFSfLcxsaKPkRC2jAbTCt7T74pKBhDwC62Qxlecb8zN3lScR9hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9EpTcwS; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9EpTcwS"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af523f4511fso2068234a12.0
        for <asahi@lists.linux.dev>; Fri, 04 Apr 2025 17:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812028; x=1744416828; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fL3P1BWquDAW+NuEcw0ECyZ7Z9hisONSWat88Huzv4Y=;
        b=V9EpTcwSERMYnHSJkwXPaGf5AMPmmlCxEbIuECZpOgS+TMeEMchO45yvqUcuOHSih4
         wgpNCPSUBcfsowLrYbTxtvv9SonxkoPac7JnuL+pWsdpo5PevPw0JyIEApIib9UXmJiS
         sohg367l68MpLOdluFHpuz8QxioJcrCWsri2sJ6pz7K6B9VwBmG2NZobUqg5zjEktMA8
         TT2j4UTKjSpuuFcnfDkA76+sM+mII5+H7SP8MXUqYxvZ0PsBTK5qQmS7sBuFHZ2WvFH6
         3ITWE+qzzYpxwlBssvOgQhNUtGXwT4Bt50pK9INmUSqd5KmC8pBSSlKOA3mguukUcSF3
         PfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812028; x=1744416828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fL3P1BWquDAW+NuEcw0ECyZ7Z9hisONSWat88Huzv4Y=;
        b=U6pgGOYWOa4aZZY91j9AAUXG2qftddhDr8VEBD4oppeYLKN196pQy9DP7acp25mzgC
         AFVGIZQdohVZupo49/WPBr99AZ6l7Cb/2VqPGrepGboGYPNYeCUBIr6hbhBFYTJnDTJm
         sdVetICp88xx+k8F5HATN6rkcNpVrayBqdZPn5sGxjHCfRL5ZrdlmBaeOXqy4O+AfUqw
         JLC7z0g11zcRVH6FlEaJn6EreUyoOdqTS2kX34JDt8Rg467uOH/iWEYJ1n2xurwx9SFd
         nPQ30XmRZMN2vpuI3R8b+fV8Ovb5/Jg20CWTEaHs1ptlFY3eKAVs6RAVWLIHI21ZCw0Q
         jBxw==
X-Forwarded-Encrypted: i=1; AJvYcCU6BuGar0sTydHaXm0wwxb/9RIDTYSOe+ny0ljXYWP1fNC0RcU/uXHb+N+ZGoCuq0SoGzg/uQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFxIyRjmm+Zoi+IpvUtWaDR9GGnBhMQIbR6g7N73lSs0E0n8bl
	aCXwq2wnrE8Kc/sIpvuIRyp68DPpmWngYy/X0g2rohi7Rk0AOmbu
X-Gm-Gg: ASbGncuOrqF0WkeBtg0cmLxOSCHORn1QKFnIS9udGOraNF/Ce0lGvN7UJiVLzRgkUq7
	hYAh0yk1OOJC1/Zjq5i2KwYWgwigtsMwnunnFFVOCFlWXjPCeLckalI/FCa1WYt+qz0iZGQgbvJ
	PslUZ3DzCbjgNHtZTQnPHD5YpKQiHeglMTRrAGtoDtfs6c4PpS8PPKwxwKFBJHLYnNNQAgBe8E6
	THBEHZ/S5aWDvBzq4+cAm+PdV0/+5ZBlxhUalU8C7waijiGZZQAxZaMuncNKEcMJ1WFB3Zl/5+H
	HxlvdbM0rf04u6P4Fpt3QKlktKwze3GbAzuUVFJMxXhdSZEMVe/h8PRe7jmsXtBetD9OK9aXqUp
	+4GcNX1js9yp0fj3AXtLOe6Vhb4vDdA9DyBTcBKo=
X-Google-Smtp-Source: AGHT+IHkfxB1GT0mGtqFz7+RsHm/7YTJC41hwXazAtzx6CVSa1u5O7PgnVqJkyRif6Z+zdP+u52gdw==
X-Received: by 2002:a17:90a:c2d0:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-306a6120999mr5968395a91.7.1743812028515;
        Fri, 04 Apr 2025 17:13:48 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:48 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:43 +1000
Subject: [PATCH v4 06/10] ASoC: tas2764: Crop SDOUT zero-out mask based on
 BCLK ratio
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250405-apple-codec-changes-v4-6-d007e46ce4a2@gmail.com>
References: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
In-Reply-To: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2333;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=+6z+IFHagOAeKJHhgePAxflNx1m94p7Kaz6yE2bMnys=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfStvMEs8Jffv7t3KxmAvbx5lKazr8Zl08vXHjNHeG4
 /8W3hZq7ChlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAiKpEM/xQtN8yc921zJVeS
 tOwJ5Se/fhlM3X4kUmhtwoRQ1/lb9rYz/LN5smG7s8iPqTO3nVhruWcpcxwTw5llh5gs0jJv2x6
 OEuQBAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

As per the datasheet, SDOUT bits must be zeroed out if the
corresponding TDM slot is invalid for a given clock ratio.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index fbfe4d032df7b26b7db0f7c7dcb47661277006d0..e291ec0951d49ee902589df16c4db96e83614e66 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -367,6 +367,44 @@ static int tas2764_hw_params(struct snd_pcm_substream *substream,
 	return tas2764_set_samplerate(tas2764, params_rate(params));
 }
 
+static int tas2764_write_sdout_zero_mask(struct tas2764_priv *tas2764, int bclk_ratio)
+{
+	struct snd_soc_component *component = tas2764->component;
+	int nsense_slots = bclk_ratio / 8;
+	u32 cropped_mask;
+	int i, ret;
+
+	if (!tas2764->sdout_zero_mask)
+		return 0;
+
+	cropped_mask = tas2764->sdout_zero_mask & GENMASK(nsense_slots - 1, 0);
+
+	for (i = 0; i < 4; i++) {
+		ret = snd_soc_component_write(component, TAS2764_SDOUT_HIZ_1 + i,
+					      (cropped_mask >> (i * 8)) & 0xff);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2764_SDOUT_HIZ_9,
+					    TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
+					    TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int tas2764_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
+
+	return tas2764_write_sdout_zero_mask(tas2764, ratio);
+}
+
 static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
@@ -506,6 +544,7 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.mute_stream = tas2764_mute,
 	.hw_params  = tas2764_hw_params,
+	.set_bclk_ratio = tas2764_set_bclk_ratio,
 	.set_fmt    = tas2764_set_fmt,
 	.set_tdm_slot = tas2764_set_dai_tdm_slot,
 	.no_capture_mute = 1,

-- 
2.49.0

