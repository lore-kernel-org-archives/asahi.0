Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8291CD0C
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577886; cv=none; b=pR1f4Rge/MCwMe7ZmjrHP6Mfnb14yaSuhmmD+/V/BB6lswW8KFmq8ww6LFkqsd+4+JSgsGUzrvePvvW1MO/I9ONI2tcmT5x+6yg4hS2WKhOGiDCgtrUmdeyHv/c9uMM3A9/sWWRdK3Wq/8q89ba2Fx348diEdcrPcXeFJxMJ6nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577886; c=relaxed/simple;
	bh=avQn/VhlgQeahgG8tI1AA4uleObwB3TDgNlHt81617Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9T9qA4XZVYgIVIrSopuy7q26Vd4PbdCa3Yph15JAas+swR7vNJ0pbzWXTNsBFE5h3ZxPRiq3fe++7J8CYTcoeTqAl3kHdgAm4rABMYZ1Otd+HtkElOMRXelZ9oCdjCO8kiojGfhfHvBTxjde8cl4kUK+hTv8QB8U/xhl2z+Qj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFxjLVoC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFxjLVoC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220bff984a0so46100195ad.3
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577883; x=1740182683; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+dZdn5+oQsOB5+cSz2r2GMKgGUJjwVauG7gsEGMQik=;
        b=iFxjLVoCPMa5EjYGm756n7khtj8OJEZApL0oKVlE+EJ0adqR0rtqggJlSqCGpXv50u
         Ny2lkdgbHMxujERJHsfKU3/VlB8BTukerS/s9B1aKVWLDD8X0JCGCVlT7+anEVAuA9m2
         TjBm8G1JhymiUp8JLx7NlOZcKsQKak6Exqdd9EBwyUh/dFDcyC8XVGvtVvA2w5CUzOBM
         gyRV8k1Mwo6nYdgteIFMST+QQG9s55KMMs1TfgnRJZ/1ZXAwbVZGdE71ge9XwaXyqWFM
         ZraIwyNbRYxh+oJHx+UMMtzEfj8+6iZBCfZzYMJiFyepstxDdwYqsOPZS9j+Qt40HfqH
         uDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577883; x=1740182683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+dZdn5+oQsOB5+cSz2r2GMKgGUJjwVauG7gsEGMQik=;
        b=kbOhnN3zDKHAKT4GjXfAEOtXzqbYqnS7/1AIp+4BF2tWmLIZF5sjcrR70/iOJrHC9Q
         owpqn3lwAQ+dhkCXbZgz+bNaJ/OYF9f7ZBLIqezsxGixTuicRLTiluYnujO8Pk+2rC27
         ACAgCzMMDdNp7SB85PGMadd4UG3oOjEsEcdEmi26x2JwGTQlZY92pm+vf0fhjECtMnQO
         kxhWgt1dhDC7xkDoPApV328Oi5d5pyQ6I/1PEkq49AscH8Uq7MQGqhnGtTAYd9+bK5J4
         b+MJTgajw3JJDmqK53UPwVuAWdQ870f+qWbQ3DrqwnVOarTQGpLSuquqgqRzcFoKVZcw
         qraw==
X-Forwarded-Encrypted: i=1; AJvYcCW6tYJIE5yxugZ3ev8DxCGaozVz2Lc87fbnl4u03TFBUukH/xryAUmicHAxma9cDFJU7v72pQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyzUUdzfUgGOz9rI21NbLE6Pk6LFcUjJGZ/CDap/RUPbWCqGX4
	+rmmDVn4tOneiRyMyhMabufpH/RxylxAfpe36jS0U84OkOmwtjhd
X-Gm-Gg: ASbGncvUkXMrf5tSQJl0gvNW6eP7eB0fsy9MesU149pk0eqI9TFw/5udcR6wW0g67GM
	TOGesE8OqnQDX3YtHDY0D8dFtCJWVEkek9Mz+AyBei9NUNsYvs6GuvcHldlYTfQ3P9h8F7aODal
	MXuR7BhuiOMJp8+L+/QK9G5RJwDu3a+UL7nU93vAB5CvOZq2IoxbaTMusmsnBFOQXzjaTjuLLKE
	QV7PTuTM9HmYxWPm1lxntVxDtCab/5COyBR8zMmevto+QVTRgqjbC8nXnSyFkvV0VNySBi/1qjj
	2j1IUVtk7FXwQy+vwSE8EiRBUE2Z2t0ohT/iDMvCXw01+O0+qWlxDtqIa215zYGVFVrVv3SOP0i
	DZdXAFwnzAQ==
X-Google-Smtp-Source: AGHT+IF0A/O3P2fni+IwGOThsKRu0xADtqt5QnMWSAbBMMUtl0QHjLZWjq0YyFA1Fr4p+LAcC80Rag==
X-Received: by 2002:a17:902:e803:b0:216:1543:196c with SMTP id d9443c01a7336-221040620b2mr18492975ad.27.1739577883025;
        Fri, 14 Feb 2025 16:04:43 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:04:42 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:46 +1000
Subject: [PATCH 13/27] ASoC: tas2764: Crop SDOUT zero-out mask based on
 BCLK ratio
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250215-apple-codec-changes-v1-13-723569b21b19@gmail.com>
References: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
In-Reply-To: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2907;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=crv8gDizT2HlKiCBN8WV4dDNDnFJ9336ZzKsSQapktU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb24rTr8gdvthP0NvMDdj9ukdFzSjei9pp93kKtkhv
 tG9Qa2xo5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIncsWdkOPu/rHDBfesYn+WP
 mWLf7+Li/T/h4IoK3Yuvps9YV7p90n2Gf9YKm6+sWnc8KuJoQ3RrbYm+UAbbr/zVt5stzJPfn/Z
 uYQMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 56 +++++++++++++++++--------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 25238d3721a21d5af8434490acfdb7ba53de9ce0..439e5bbd372cd467966ac9cac1c92e3e300fed54 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -375,6 +375,44 @@ static int tas2764_hw_params(struct snd_pcm_substream *substream,
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
@@ -658,23 +697,6 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
-	if (tas2764->sdout_zero_mask) {
-		for (i = 0; i < 4; i++) {
-			ret = snd_soc_component_write(component, TAS2764_SDOUT_HIZ_1 + i,
-						      (tas2764->sdout_zero_mask >> (i * 8)) & 0xff);
-
-			if (ret < 0)
-				return ret;
-		}
-
-		ret = snd_soc_component_update_bits(component, TAS2764_SDOUT_HIZ_9,
-						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
-						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
-
-		if (ret < 0)
-			return ret;
-	}
-
 	if (tas2764->devid == DEVID_SN012776) {
 		ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
 					TAS2764_PWR_CTRL_BOP_SRC,

-- 
2.48.1

