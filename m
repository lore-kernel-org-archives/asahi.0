Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CEB22CBF4
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658244; cv=none; b=qfLpszRIDE+UIlanJrh7pKAK7HtyoOZ7bnsCKS/wHHiDH6kov6qQgGXLGqMjECwwog96FHsKhdzonZzOBr0dww+A3nYTJlRB7OlyJV72BEM8oelDzbAB8EkOdMqnPCZivEAIac1ZuuUQojJNloETXNc6ujuGmN7KQ/hZypESeW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658244; c=relaxed/simple;
	bh=BFI0z9ztuM8NgUtm2zrZ0APxtSUaayFxbNwUmSkAGdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wm0LuTfHrhS3qAvF0RdGPmIuwOjJWQRqB6JZdO47SaOLyYN763pieaaWQlngoCEE4qrJBSSEmGhkcVGGCm7TIBuDKzhJdHQUH4u7jW8Ns/vBGWbecKicEK9GpAgANXFxT5o9dbgi92avtS+OAGbKdegpP/Yi6d3ikKYR5dw6DYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgW7MQRI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgW7MQRI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223378e2b0dso12454115ad.0
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658241; x=1741263041; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0QY69BHYfqhQl9VSrO9JG2JgXmRpNHQh/P+Lu952WQ=;
        b=fgW7MQRIw/Knctogb88luIzmPSipArUjHnoMFdXlaROxGwG6Fzhv/VIgCmYezVdOsN
         3sb8j+Y3XaUvKBiwJRTzPnvuUzDGbdsXtLXTHn8Gg826FNPH2w/S/ruXZzkeEMYr9Fsk
         ZOpAws9Qj6jcE62rjlWr+rWTtuJI9MvpEjDYqsv6utQKB/gAUH/d/iqbKu3rSn3gmsm7
         1jbpIPzWiWuO6t8hTFuT3w3NJPpoktJOlwSMoYx42ZGhYQSPa+1lM8QAMoccC/Ly+Urq
         ZsfuzRX/oVEjJjSvCSVVXKDE9gTudPO83oTyZ3KTf7cMTk8ptn6AbnplpkVjHaFEKmDy
         KiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658241; x=1741263041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0QY69BHYfqhQl9VSrO9JG2JgXmRpNHQh/P+Lu952WQ=;
        b=HwI/1lvw3nT4BRc/BMhCY8qKdu8JMeXaH5XMQ/FOYx0Leg7FicsMe1CBycqpXs8MJ+
         yUMRbCK9CEXztkkHWtgFgOU6qLG33/2Qt0+V0sfzZExPjramCP1K10mNT/+a5d82WHqD
         fAYRMvYcOCJQNLswVvhgxFHohv1WnrnaRgyuQ+y4l8EdV6XFGnLHcIQ6/xEmX+II2wpb
         5+MgIQJ8mlR2qP14b+xfgoyg2kdFW7VDHf/z7mS/PgnrWkdNpqxjwnTKjPUxsZB0d3z3
         ETSXR1k3kmjHM3g2ivNcU7jx3eNIs8kX4JglLG2MVLevGLU1J0y62LRHmIcfq193X2IR
         frDg==
X-Forwarded-Encrypted: i=1; AJvYcCUIq9mnFxDtOLc6timwCuPZHLCHFvwEEcTTL5Op+Me06CMQiz5jBpR+AT9yR9rgQpqM6+2q/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGvLtuLvZ2xzUQ3rVh34xUec8a6VIOZGinmmSys9IiKpYvh8uc
	gFol4hQPbQGM7i/4kCqC5e90aDKkcSgVVMDBbbbwVxHDJxxJl6WjzLqu9Ypn
X-Gm-Gg: ASbGncs92dkViXVgPdiE0kqhI9TS3YIrGnGB6X1Hib8Ih+9Wmx8PeGpzwAhwKPtbiKC
	rhrIoCxxjD9eFAoFIwfkcPRC8FvskXHdcJD3fvkWGf2DOh8qcXxToteZM4HNrxlnn/E8Vs3w7xQ
	EYgqzl3Gvht+M7twU+EneOcv24bG1wIb4ZcrczQAoA7wR17EFXPeQsD2S6TRVT/jv+Q1liytHGA
	NZsna3dQjzRnLUlv1XChA8AsW/QxNcXkVLnlzP9OOp7S4e3czLLkNXRBqjiBkLSRIOsbRs2T0Pd
	PK6JU5YeTx3w//+OWUlDsHI8FzeeiQcxhL58zmn9vKpfzier2gIw0U+DX+3ftkFGLvHwHoQfzNM
	IYSrapb95ZsrwwyfkVrJE
X-Google-Smtp-Source: AGHT+IGZTvBMjPdbxJa384Mb2cBWuad7YJyZy5010Lq0PTkXQwxsWk7/O8DSuEOsr5dODlA/SMx4cA==
X-Received: by 2002:a05:6a21:6daa:b0:1ee:c8e7:203a with SMTP id adf61e73a8af0-1f0fc99ca0cmr18970116637.40.1740658241174;
        Thu, 27 Feb 2025 04:10:41 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:10:40 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:41 +1000
Subject: [PATCH v3 14/20] ASoC: tas2764: Crop SDOUT zero-out mask based on
 BCLK ratio
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250227-apple-codec-changes-v3-14-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2333;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vGfDkW4Egl/oMYM5+yihBufFvY7DijByBLP6WRUag7M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk8ftGIt7J7RuFWzwDR8s/37IGvbprRv295dZhOKN
 jkt+XJbRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABOZvYjhf6HefcMnE7T5k7dN
 XOgnWXx9wvyaPZ5lHxcJ7+uLLNxjYs7IsPDBvrbMBVtssi3ebNv6+Irw0vl7TfSPctU9P/Pq59q
 jQlwA
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
index b42bd5a50ee566ee83755d4ed7e2071b60951457..2a787baaff5342e09cdfbf7939b0d635433f27ac 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -374,6 +374,44 @@ static int tas2764_hw_params(struct snd_pcm_substream *substream,
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
@@ -513,6 +551,7 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.mute_stream = tas2764_mute,
 	.hw_params  = tas2764_hw_params,
+	.set_bclk_ratio = tas2764_set_bclk_ratio,
 	.set_fmt    = tas2764_set_fmt,
 	.set_tdm_slot = tas2764_set_dai_tdm_slot,
 	.no_capture_mute = 1,

-- 
2.48.1

