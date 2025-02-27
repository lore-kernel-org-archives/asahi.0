Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D29622D7A7
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658251; cv=none; b=nJ0U39NbXMJEYjTsGCHq1L5H5UlA+KQoR5wmYkUAZbL+dQpoNtxjGEyLzRXRBUAQ4z1DjHt0p9Tfr2OBhfd0GWZnVSZnoSEm2xLD5dtQYxw4HjqXK4alIpw/ke+wVEit6BGBLZieXn0cAgUiXGNQmAKqQ2iK/NrLaHn7Iq35+sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658251; c=relaxed/simple;
	bh=Jn5R4wK+F5vTNEW4NRnrP+z7OqQNNC1+xuztTWGPtZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdOOoYGZ1mRjigSV+8qIatCT/7LbQgFSRUt2hVldwS+bSZPmfoa7pC4nImWDCkx9RuPOGoO66YvwxTB0yE7wvQnbCZ3ciFPxDRLkX9UJUAagTAgc1XGTmMMROlCun6cAkmw1DJuqu/mTxWRnCJuoQNP0KJvRWzV+CQzmN0OTHtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILjLRP++; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILjLRP++"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220f4dd756eso15517415ad.3
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658249; x=1741263049; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKXxnscjJywE284s2zzqhnlPvX8qOMFroJHl0KF7p7w=;
        b=ILjLRP++jag3meEtoDHv5VnT4dXYV0bxUbZgRxPoPEjuOD8qflVYgnCtmmRe/bJBQG
         ri97qCn+d7mqoCB94Prjt05MD3ej6szF1tn4oH6lDgS/zFJe/cXVjKWWGLsq6srCy5Dl
         PM+NOnG8xEzbYyH5kqSaRrBCEWt4y5vOy3YRQQQ3Wf1gtYgp4uulg750dYwleReN/s2k
         teQmXR1SG3gJ7RdERYfPwzdhbptl7Mk6x7kFpdK+NEIDcod52JB+8RplxIdCvNnmhhWs
         W5HQnDqFA177PWLXZBsk4Cj3hADqAOIxlhL1UlI4yek2+rSppIDMAB3LTDtrGfa3MS2C
         5ofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658249; x=1741263049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKXxnscjJywE284s2zzqhnlPvX8qOMFroJHl0KF7p7w=;
        b=kCZhyOqcBaSL0KAlksRzJRm0KZe7PWSnYHGe2Cp2MiMEabymA5wfR0GKgQQiyQwqkI
         +AAKn+MKwZiadVZakrhoWYuQ2iVHaAsiEY78DM8jLtS5kNsFOAePUBoPiALvpnUnW9Rs
         UEE9zJMN026UMvmKVLekjlyOmOY8gPW76un95D4RJvNxogZGqWDLd215YKNdAy5rEATZ
         66PbmgxNZ0/klWiz6DoaCzZv3P7MF0ORmnYdoeEHVAMLXlysU4OHUnFbznweytoaUhMM
         qrG5Q6hcoMN6NHQ5qielMBtHpaAZ/VQF0SPuw6fGUA+z4qa9Fr4/jMaQOLjaJmU4wbMG
         rNNA==
X-Forwarded-Encrypted: i=1; AJvYcCXddVC8NQOySKqKM+8NIxVM5P+KmObk3/9fRAPuogIO08b8RUa6DOxf367he7HCSJnj2c+AfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwndMZTL+yVvwrLpXc+3WeSqkH4QU/7mYYwY1D8pd02PDpf1BSF
	V8wFRkMp8Bhw8Q2W5FbQK++3B5DTBjq8++F74Mp6O/wvq7/IeDAwk66+RUdu
X-Gm-Gg: ASbGncvsYUWx+f7I4h8HKJ1eMpzGBt7F48wtSwSL2evedmX+3ypr23OEQfPDwDYK5CG
	QI91/Rca9k7SIC2kC3t90NjNUf/A+7o+iJ4RlfvkPjXnABN/QBhUaTzUJuLqdK5xsPE6GMtWgVm
	8D0CWmMx4sZd02AblbqYzebLqQr0L4O3yHs4TOCJ1jvYHxxItWOde6wf4lkM9f8bpiWKNmajCNJ
	tutU9T55aKCblyX+29RBRJL0i+tzvOThOC80Aopo46iaOwdOws2t50dgw244jn/8TfjoOI5Ntof
	NGg3rnAVnGgESPoDmrBFQTGPJmmud8WjfHA7Ax1quKh2ti4EmMCzNlLH8nJAYRfrZMWhWcfkNQX
	YoZwR17nxbeS2nWksVOWe
X-Google-Smtp-Source: AGHT+IECvK48B2XjM2PfdEU2bxSAhCxuahWqdNn1JQu7EMkKMyCFnXeFoQawqcQh0CvVJRZRbXvAfw==
X-Received: by 2002:a05:6a20:158b:b0:1ee:e17c:9665 with SMTP id adf61e73a8af0-1f0fc139ae4mr20557009637.15.1740658249009;
        Thu, 27 Feb 2025 04:10:49 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:10:48 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:42 +1000
Subject: [PATCH v3 15/20] ASoC: tas2764: Enable main IRQs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-apple-codec-changes-v3-15-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vSm2lXVQsvIt/wZW3rb/DSoIEzBC+koDnVUdHg4V6Mg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk83rJ0rGW32g3dpy6SdBo/Fb3Pv2dVaZmeuo/lVy
 1987cXSjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACbScZGRYd+rX6lz9za//VN0
 a+vS+t2yz0L3KyatPWkpdoqhV9fjbw7D/8IQnpMbK0QuSIlt8s46+fxkxcvFDtuF9v36/vye2oK
 GH5wA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

IRQ handling was added in commit dae191fb957f ("ASoC: tas2764: Add IRQ
handling") however that same commit masks all interrupts coming from
the chip. Unmask the "main" interrupts so that we can see and
deal with a number of errors including clock, voltage, and current.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 2a787baaff5342e09cdfbf7939b0d635433f27ac..c122c07e2483b9ed1e6011dd949f97f8b2d0897f 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -715,7 +715,7 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	regmap_reinit_cache(tas2764->regmap, &tas2764_i2c_regmap);
 
 	if (tas2764->irq) {
-		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0xff);
+		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0x00);
 		if (ret < 0)
 			return ret;
 

-- 
2.48.1

