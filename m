Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BBF22CBF7
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867889; cv=none; b=tzKnZ7NvShIrAw0vJpaoivDF7cRR66kP1npD2GyGV8tOSbEGo9zoKQVpwS9/Vv7PhIGoIKxqFr/1WbeB5W43JoV0vvTXzD5RyO+3kTBKdbxHQfA8ociTfJqVOps9rqUM7YyibO6Fr7y+gdB0HWYRJiLuBEELas6fRQdOG8Hh1EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867889; c=relaxed/simple;
	bh=bXgdrj/lgzgHfGKjw+d3UblqoDc9qGQB/+FFAVBHcXI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNTW556Lv0nZUf64NwBSaV0copKW7B5TCPxBhCUW4b4espO5n55mk6xc8aOnOW/XPjSkuxTeW5QiSuAqw+53tsmqz6wAK50MGMKw8RsQencB1dZLxx5Uo9CQ615s/0xs5CIFt2/eGjoLFsFi0sG+mdnh0swfSBjEMhOPLuRVOjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxCvTcUr; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxCvTcUr"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so7369583a91.2
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867887; x=1740472687; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq/n56KCvsRvP7RYqZR5KNoKdAwdBSr5LyDPMrsCm94=;
        b=mxCvTcUrEhcl11XbuKXkpfa0EapSKu7eYezkpaqFLoButXm134baCE/f1SlspJfEZ7
         jKp4HMI6UGfhRudaTU9nSFB7Oa05qb678GQZQ8ik0xBQd0D8sW5Nf/qFCYf+wlnsSvvO
         LIbN9zb7M55xsgsUCFvllwWwpxk8THyNcOTFr24xLm4BnnsV7HkLy/+Jthg1+X2cK0Od
         6gZic15JvnQTbs8U7yxF8qPTeV/rFxynvty88qamEUmR+5679BgLWksHyyWHS/oaVNRS
         JJ9aotzRU3NJBzX8YtU8xuyb6vc2/Gptir4VKuw6ZbBr051Ghe76fjBcm+fCGVc4uCrh
         2L1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867887; x=1740472687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq/n56KCvsRvP7RYqZR5KNoKdAwdBSr5LyDPMrsCm94=;
        b=jkjkAS4c+MsnptharJ4HkLtXzqjNszdDQWfvndJL7hAjGIEuh5RfJV9aRfkHr8z1gI
         09RBQHtISQDFPDxbJjk0EzGRXJqtsKF6E+DlMKskLajeuEOaZBYUWfMd9V8byvNp9TQj
         6LnIVypZbQByYWO1JOmi2LShcCORqed9s8MvBFzVaNq2R335AYenzXb6qdHabDl4fX5u
         FBBC02vhu+yCEu9JXVJ8K2/tFPy0QWz1Y7OuUKsyOX8v+ge8liXC4FJb9bWThO9C8Rpx
         hsG3XeZ5wajhz89rJAvm9FpCr5D4Xo53Mc+8mXeHuCMmHg6OHMozXK3th58p0LnMKhyS
         LjEw==
X-Forwarded-Encrypted: i=1; AJvYcCXRP8HrYn7Bbk5j5Yy/wx+IpZFicdWqTXIAXLkq4IFCkOA30hPvqD7XC+6S5+VZ5oz241kWAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+fij4bfUKYPUCV2hhclIY9EYg/RX+WuE5tBdlP9r4J1hBTfST
	LiUIF1A+XlsSlMZyh+YBeoD3GT+RuHpGGVc0swzFNMB56C44TZzx
X-Gm-Gg: ASbGncvAjHZf+XscjSrG9Pk11i/0TNxD1hC0gf03AK3ptqyV0frMdmzSpEjBn8g8Dn1
	04eC6Eq8/vumsvukVpsrQ2irkWZ1z2ylz72sbvN/VByS435eO2iTMZ11ZOsBewhQX8KOt0ElyNv
	TGol/dqtqrhRUfT1jRBsAViBwmFJO2tlXxXoK/UOjRFYFim33r7Ud4FhuTC5R9e/Aq+aOr0+93t
	f6g1skIPkKxLPXw5bBMX/X4JySbOw+U2iJi5CNRBm1Pvt8NZDreglTgivzSyhDeBTxEw43icW7a
	3RActtQdrnxyGsBLwgYL1k+HENRhCvyBg0DRDDD7iNTgqY1m+rIzPfPyVSepGVt5IqCJw6FVDyZ
	NBowRMrMVXQ==
X-Google-Smtp-Source: AGHT+IHc+3+Y6pYMIhjesT1d2RpgN7fPqWm6UpDrcbTpkkzy2YO8Dtln+mC5fD/udDbNi12XN6/LOQ==
X-Received: by 2002:a05:6a00:1707:b0:732:288b:c049 with SMTP id d2e1a72fcca58-73261784015mr19657706b3a.1.1739867886809;
        Tue, 18 Feb 2025 00:38:06 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:38:06 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:51 +1000
Subject: [PATCH v2 17/29] ASoC: tas2764: Crop SDOUT zero-out mask based on
 BCLK ratio
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-apple-codec-changes-v2-17-932760fd7e07@gmail.com>
References: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
In-Reply-To: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2949;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Or2McYkdE4gYAmum1CTJeeAbVQsNrcCt+ghAbMXAHKo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3BJtmYJ3GsbebQ3zuHy06MvRpXsuHv52bd/799svi
 k5xKZOc0VHKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBE3vMx/A9u09ho+zg31Ls+
 t/TEiekHilNu+rlsrxPrTdscKbKW9xQjwyHRzo+/3Z1+v5hnET01LNxue/ZWBfWF2m8+ivS7vjn
 fxQsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 56 +++++++++++++++++--------
 1 file changed, 39 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 670c59e57997a7988af837bd58da695ad773ae14..39dc466bfbca35d50a5a93507260d59d30affab6 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -376,6 +376,44 @@ static int tas2764_hw_params(struct snd_pcm_substream *substream,
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
@@ -507,6 +545,7 @@ static int tas2764_set_dai_tdm_slot(struct snd_soc_dai *dai,
 static const struct snd_soc_dai_ops tas2764_dai_ops = {
 	.mute_stream = tas2764_mute,
 	.hw_params  = tas2764_hw_params,
+	.set_bclk_ratio = tas2764_set_bclk_ratio,
 	.set_fmt    = tas2764_set_fmt,
 	.set_tdm_slot = tas2764_set_dai_tdm_slot,
 	.no_capture_mute = 1,
@@ -714,23 +753,6 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
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

