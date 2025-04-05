Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C2A4A06
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 00:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743811992; cv=none; b=kOsuCevtqGm6degyi7dtQ8E2r2uEQ7egKGwDEFH/he7iDlL7ytOVWJ750ja9WPDmr2LmALrJ03o/2VfAYWXwlGFN+fRD4xmSN6Ejhw8JclDYk2ngdqAsxY50W5YzVXtMp3gQ2zp8OSnsJJMWcuaNftMSSkvuIN9BpkmuwugBm8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743811992; c=relaxed/simple;
	bh=HqJUvE3cm056/al8IELSKt4YG1QY6I7o2vDGy5tCaZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oaUB6P7JM67lISpNYesHsrDm4UE/gVrB7dnY6XSl/iMnoN5mntzLKsZ3nDi9CIFo0ecJUB8/6IyGO+YlMJ1dBdtZVQbgpf1s+53eymjL9iTOhVRJRzUv7PZrZU9MRbko8o2IQcXcFrJodsEH63ZQ8RnVbNfDp/SUvc8DEftqEfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZg18Nkm; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZg18Nkm"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3014678689aso2155228a91.0
        for <asahi@lists.linux.dev>; Fri, 04 Apr 2025 17:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743811990; x=1744416790; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zT7z/HktyzmUzeS1R/jDHnCVkQulwygo5o6mh5iuzs=;
        b=MZg18NkmINaZ99RaEwkQjIWwmizWkfHLih/tuIO6Yb288vtl8NTPlQ+eevgdiZagHW
         f+eJ8q/+e4va1bWcbtQ+KnIST58r2NT5fBcBkh3DwWAvxNVbCc3Zg5akxVvQRG7bKh4I
         4KTbJQVYpt7yYkd6doyXwhHd4BJ2o4h/VaQrj6L4zc4Oln2VatHLjsNd1ED6ouPhg1LK
         DNjCBUas08pwrhe8tD1poMKiQPkZfmYMZCdWy3wDGjROyK5z/rZFA3Yo/g5vdBHSLaeT
         eqdBBoc5qWPSGX9j6cmy9kb41p2pdZlPJ5Xvc9y0NR7zAv3CZtIR+7Ur7W1IOaZk6Gy6
         ecJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811990; x=1744416790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zT7z/HktyzmUzeS1R/jDHnCVkQulwygo5o6mh5iuzs=;
        b=t4prhMSwPAA1dv1ZhG4STUChuIxk7N/MzJ/dad4IW/mcmYisnjp8X+3bT7KB2LFP9F
         woMuB9ugMunrOCbj2+ytSxYUPD/cCf2bshLSaLwGoNKYb3+cIWy9v8ZUzxMOE/moc/bu
         6AyXPAjx1J0f/N+G2T4hUiCg5dnnl9wlj0LZCnaW5q+y6/Cd50/BUsOtbD1QsEI+Bjjm
         bkmOHPE8ZtxIMsRVfngb6ET5aI/KLcDfnJHrAK/9bNzzpQJltCSLSxzs99yD/mVDEY20
         vIsjRdos4RBEBjMisfvDfkfADzmA4A/4NeOQc6qiTMI8vDx4w8z88E4YEw7ovUG3zDTj
         hM6w==
X-Forwarded-Encrypted: i=1; AJvYcCVLPh+oCn23yN545WH8y+fQYHnLtWC4ZxYrAmTmgoCWxK1tpm/T9MSdUbCfa0AaFJDrXy/QAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjKCnQu6bHl1HnqL6DSs7Sb1VrnVTviSWRIR2ZE2BOqHaPkVF5
	UJ7oguGDITygGpyQRuQiZdHBADpFcQQOIg+1Gwwx7P4WZq8TyMRi
X-Gm-Gg: ASbGncuJe/c55Xgkxax4fArvNee+MH/xwxa0cOomyIBahTt5X9JjX5ISW1xhlZKH8RP
	wOXy9ML29QpxZdrrz9asjW4X3GOdkXYuk3/1S2oSOxnb8dpg/tXC8xPfR09fS5+J092EkFhQ+Ow
	J0nS3VzSg521s2vNw2K6MZRL2/4K4CFNAVeXqdMlbb7LQZPM1heLMjXpQcrY3cw8xgmbPT6JKvx
	l/x+RBo/LK4kdOrcG1SXVCTEXTnAGw29qr1vWwnTlNw3nDupJ0vrNhYNDN+sWtUXYS3C5bXDw/E
	sllZYF3lPSTzPo+6aGUdjXcnb5HDJf5b4mwrbj1QI/ef6hnyiMjZoFbdf1oFwVGbhHqFbh56s2P
	AVJG3rrtJab/WT4WnVeYNITUR0W669xyO5cDrc4U=
X-Google-Smtp-Source: AGHT+IEE6zMQfkLbaLC/4MKZv/t32LHEsVuSD90Q/qkTOICJcvUwFUepDytIfdM3lbOQRnFcDxo4gQ==
X-Received: by 2002:a17:90b:5483:b0:2ff:5714:6a with SMTP id 98e67ed59e1d1-306a48a55ebmr6682090a91.19.1743811990086;
        Fri, 04 Apr 2025 17:13:10 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:38 +1000
Subject: [PATCH v4 01/10] ASoC: tas2770: Power cycle amp on ISENSE/VSENSE
 change
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250405-apple-codec-changes-v4-1-d007e46ce4a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=PCUEqTWLJugE/p5yI6mH/FN1rmh28HR0YZQdpuB+rAk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfSltfxbhZdmd8el3MvnOKefLybdONJO+ud5bY0tfI6
 njk9ZHfHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEykVZ/hf0q/3+z3d8yU9dMZ
 bGZt6a2bcN7vY799wwWz2NjX8SHb0xn+VzOe7vigmBd6a/fdjyIThIvbeETfXZhz5XOtGhPzyd+
 SDAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

The ISENSE/VSENSE blocks are only powered up when the amplifier
transitions from shutdown to active. This means that if those controls
are flipped on while the amplifier is already playing back audio, they
will have no effect.

Fix this by forcing a power cycle around transitions in those controls.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 30 +++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 7f219df8be7046912bf3ef452f75c17b5118bcf6..8de7e94d4ba478aa9b705a81e7276bd005c8a18e 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -156,11 +156,37 @@ static const struct snd_kcontrol_new isense_switch =
 static const struct snd_kcontrol_new vsense_switch =
 	SOC_DAPM_SINGLE("Switch", TAS2770_PWR_CTRL, 2, 1, 1);
 
+static int sense_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
+
+	/*
+	 * Powering up ISENSE/VSENSE requires a trip through the shutdown state.
+	 * Do that here to ensure that our changes are applied properly, otherwise
+	 * we might end up with non-functional IVSENSE if playback started earlier,
+	 * which would break software speaker protection.
+	 */
+	switch (event) {
+	case SND_SOC_DAPM_PRE_REG:
+		return snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+						    TAS2770_PWR_CTRL_MASK,
+						    TAS2770_PWR_CTRL_SHUTDOWN);
+	case SND_SOC_DAPM_POST_REG:
+		return tas2770_update_pwr_ctrl(tas2770);
+	default:
+		return 0;
+	}
+}
+
 static const struct snd_soc_dapm_widget tas2770_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2770_asi1_mux),
-	SND_SOC_DAPM_SWITCH("ISENSE", TAS2770_PWR_CTRL, 3, 1, &isense_switch),
-	SND_SOC_DAPM_SWITCH("VSENSE", TAS2770_PWR_CTRL, 2, 1, &vsense_switch),
+	SND_SOC_DAPM_SWITCH_E("ISENSE", TAS2770_PWR_CTRL, 3, 1, &isense_switch,
+		sense_event, SND_SOC_DAPM_PRE_REG | SND_SOC_DAPM_POST_REG),
+	SND_SOC_DAPM_SWITCH_E("VSENSE", TAS2770_PWR_CTRL, 2, 1, &vsense_switch,
+		sense_event, SND_SOC_DAPM_PRE_REG | SND_SOC_DAPM_POST_REG),
 	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2770_dac_event,
 			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_OUTPUT("OUT"),

-- 
2.49.0

