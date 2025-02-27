Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120B22FDE2
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658189; cv=none; b=nbpM3xxCbionkaQQBZb2TVwHGx5eKtiuf6XHFtL/T+xrwz7BYA6/mh5BwPhN4gba+r3hdF1hfZ9XiI2g8d5WbA5ws4TAoWEzVTJJitt6de3V8kIOhGMZqeWJPkPhZNu44UBkalDT3JyOaCnFio+m6YdR0ZJPfpDM8MiBBEXFQ1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658189; c=relaxed/simple;
	bh=C3fMl/nUTH2R9yPVtlYR97ew00Bt5b1HFMDjMdULqBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PS6fcx6EBmXy93ROMuFOPoxqhBDYZagv0GnMbXDLMZwj1/tSx3c+8DU3o/A/je3lu4dmO4gL8FKRKcowSyOrMJclcSyyqg27e4PKy1Cb3As9WS1L/TUPv31QDyZZTDiDYTLr0BnOUps5UFV0vnoefRHzWxuotlClVMX01Mrfbmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwvI1lvp; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwvI1lvp"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22185cddbffso33990245ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658187; x=1741262987; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLr65VWy9RLy1Sl5qrWRNMygIqDSaNHv3m0GyUnsMQE=;
        b=cwvI1lvpVvcSZPPenr+HOe/lDDD+oUWJNgLnsKyROFalMYKM7VcEfkRwP/lG/R4ND+
         0a7bUyawuKKuYSvO9Hk3psffH6PSbBA2kFDF+2gIiuhfVMyxQrMGjIjZkR/ELx1MG6Ea
         HcVQY+/8Vq/NBSRkaOD7nndWnQrcuXWFKTgq7OhTgWoGTnbpvhA3LvLwh11LCSIRP69s
         Es2vXLp2FfmQlEDED0pypeazmhQHpdBO0XpY0Eq3rj1mFxR/o60m/qJLqb3SIdQ9LLnn
         sJTKMr1BhPDtwl0RYir48jHe4zphK+mp88pqqZlfZ94NuGYuhvg5VpHxcg7N/ZTZqODs
         j47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658187; x=1741262987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLr65VWy9RLy1Sl5qrWRNMygIqDSaNHv3m0GyUnsMQE=;
        b=WVsUuD+tP4zLaS4OK0YD3FWENNLiMksf5C6eU78BG9TlBzXTqZ5GOfG9X1/94gfJFe
         4e+rvDg4SdlGidW+HIQJePFm6PI0OEnACUL2Tt0je5c5wpRmMGSA9fzfVUnH9OcK6jfM
         tA5t4wslUadaEZp7QMk7Xc3wJl3GplJIz8jwrvy25JCUHOKYivqdTMW16Xa7A9Dsan7Q
         SflXO52tlHPCube4ciJbQgLGNd+/Up496ALgPJyaPQ5fHXNUDMh4/AKk17PvT9/LWj3d
         YwLJ3c2n3S9E0SCZN93yQj9BvCDyoq2pKLt8ul22LjldPISsLGq1JgOqqBqL44Wej5Qd
         ZqJA==
X-Forwarded-Encrypted: i=1; AJvYcCVKmr7UlmAoYJDU1b0g2IgScbET6LR+iXLn0wyz7BAa3khuKPVpapkl/mfWF2Wi8LLfZt0RTw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3P6xci3859ZMYP9K3TXUQPXWdgOrfJd+bC1Ikrs3sVlY7BCjk
	iGQb6iHDrhoK+kbQ2bt+P2mccQ/EJHHi0aVGOGS2hhqEukkhG7RVeA6gHIaW
X-Gm-Gg: ASbGnctoTyNTmqYKLw6NihMDSqMTEi5EjvmgGfsGUgR0rKZ8HSzoZVSOzY3uLjk0RyV
	HkjNQIuq94NKS0fkrM+pwMNO7sNe7Es0O13s6IcxgnEspnhSziPM4kpff/C2JrLImxV2HthSEdc
	Q8/FmCZH2banqFwxjnDJDi3fxCqBAYIxQFC1huySZwVtTBIGZI4Pd74DCnaY1Vrdacn6Qzx93eA
	kdQk8rBlbmp42rAKh+2jUnjZ2Mts+SRyQEUolGY2feN2XFLM2Q+Zb7nfRj3A9fNoPrB4T8q2kGX
	HrId5ZTfFaUnUSQUiuA+9ndXGtrHODEnInEaUEawQG+CoHCNDzsyvDNoa7b3T4hV1qeUGLU9GbA
	2XMzmHzhHoReffhyQ4+BF
X-Google-Smtp-Source: AGHT+IFmC+LEvCK0DwNMDPIsYIpYRsaLbfyC+/trnMSlEmS0nxupiwJxRNOdosgj8DYEi0BBxHaIZQ==
X-Received: by 2002:a05:6a20:914f:b0:1f0:e2d0:fb65 with SMTP id adf61e73a8af0-1f2e384f548mr5422538637.2.1740658186937;
        Thu, 27 Feb 2025 04:09:46 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:09:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:34 +1000
Subject: [PATCH v3 07/20] ASoC: tas2764: Reinit cache on part reset
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250227-apple-codec-changes-v3-7-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1447;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=1qRmdyEVykh3CldMGQqX5bd/Ea4U2G0jI3+vaQLHohk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk+yS0S/WvaH8+BjfTeJCfkCNdwTm3TWz9qk2vO08
 rOtg/+rjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACbC+5Thf9zHj4/fC5TM5/C4
 HOHh/OGq7UWzWwlHVumvfvT6w6GrUu8Y/ocYHZhx7rRB/NS3XbcnLO5ffCZzfi1Ll3XAPyvzX1V
 /3TkB
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

When the part is reset in component_probe, do not forget to reinit the
regcache, otherwise the cache can get out of sync with the part's
actual state. This fix is similar to commit 0a0342ede303
("ASoC: tas2770: Reinit regcache on reset") which concerned the
tas2770 driver.

Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 08aa7ee34256896915f3ed6438b8b8827ce240c7..49b73b74b2d9dd6d09747cabc2b00519c549775d 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -546,6 +546,8 @@ static uint8_t sn012776_bop_presets[] = {
 	0x06, 0x3e, 0x37, 0x30, 0xff, 0xe6
 };
 
+static const struct regmap_config tas2764_i2c_regmap;
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -559,6 +561,7 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	}
 
 	tas2764_reset(tas2764);
+	regmap_reinit_cache(tas2764->regmap, &tas2764_i2c_regmap);
 
 	if (tas2764->irq) {
 		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0xff);

-- 
2.48.1

