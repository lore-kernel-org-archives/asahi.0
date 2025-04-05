Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A313C1E505
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 00:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812024; cv=none; b=XOTypIEKKTF2EW4dw9HVXqR4Fv0HoHLdnUOzTkkatnp8HFxnGTOK3y+lNFxFbZxLhyJoyoE0oPJCajST8WxLYzMupWO1awd5ww6eS03lReT8ggLLUovywU9IxYKxD10AbNW2CgZ2w88LTeQpouQngwKzPiiQqdhlRG5lcKDoivI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812024; c=relaxed/simple;
	bh=NKoEg61ykul7LJA/d5/4y5aypypGyjWZZdHNgsP/B1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KprKQkfLbHXxMigHfNbpOVmbW5sQLJCDcybBDDZDoLSslcRZmgMzYqc0a4Mz7vrLUXK3K1Dy6IMe29z9Z7vo4j3N1yQLL9cL7h/tzuaAZXWd5r/ocZuBy/OBlahFXQ1RVxxhP+uNp10Lc7KATow0xJ/Q77u3N4CMRO10igcGZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azDxQd7Y; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azDxQd7Y"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30362ee1312so2583512a91.0
        for <asahi@lists.linux.dev>; Fri, 04 Apr 2025 17:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812021; x=1744416821; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZwEITRysV/CTBC7Bt4CSH8RxtTe6q6jNA5tekEdNXE=;
        b=azDxQd7YNhkBkkt7otdBJ/OuCX0C89SvcLhKDgGe4EMVXjN6OUWXXis+u9A31sPZPl
         fgshDCwaN38B0owI3Ud7AUY52ie1yuBc50Id76nqagr7/pEdo24xU7CW0wQlwJ3uMtXz
         MRBcRtNHW8ufTmD4/oPjMtB0oexndOUoik1jH1xTQ7KWNzGHOfend362Ht5iHuUWdHVQ
         S9lC2SItQ1/dHh+E8RnxZBiiaLIrtC9JrQg2wRz72KdMjw6KI+oM9zLRo754bm1qLWFK
         lJ8oFPGrKIzkrnZcyLmeacuVqlaX9R/2t68esqYWDrUiuRwtzq7nI/6K47hZtgHJ/uts
         9h3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812021; x=1744416821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZwEITRysV/CTBC7Bt4CSH8RxtTe6q6jNA5tekEdNXE=;
        b=nBltY9buTyZJ7xgntzwJusUq6M5UWdy1iJTNfJOZD0lvyHw+RkzQA6czwWSwW+O4ur
         AjyhdGLC8kPUEUuS8e+Pf1nscNS0r0S4W/xYuamsyCCO2MMHaQZqarsgdJw7qtUI9Zgk
         hUqAMoeTenGti96M7+BLpyjDFF6g3aatys4yflLuX+u6P6djgmPLooaUjJF3jOa7m3uv
         0YZgCDreELqoB3yvB+GKJIPdbtaAK7VnzGuGgzk+2TZdmU3yqCqDhfGD9zYBpiiTka2V
         6XnN45N4pEl4tCoXJJvBW/Iii2OdxOStYyflpkSgCsJwCq5RLoo4MJacg5YtfrQ7n+6r
         HQGA==
X-Forwarded-Encrypted: i=1; AJvYcCUpYF7ItfEdAsoY+rpR4T2iFfLm2JidItMJ4ZK1Uvdr6gpr86R5TVA+CpGuanYvwTLoFEJA1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjWOrPJRH3MnmR/Ek1hL5+NwMZSfMPnI9fMu0SZE6YmR5FsEVG
	Dd9VX/R9Wd4HeQLN4qecxrdYswaEWieP8JiChC0PIhkL7uMymwXS
X-Gm-Gg: ASbGncuuTAG+n+Ksk426/2Q9v7+S2C1rixv5LPoP3xFCElmPR6H+im6F3nfN97QDzeG
	QkgAsd7yhzgTEjSL7jWxScGuReV8N9HnKqUJUtT9fvm0ObPZ2IOdv/PP1s96b44JV8SO07f6TL5
	n/VLp0Ti5LIiRKN+tppFqFmku3ArxLeJvttgmXiAHFmTHnPFA/yx/AxPrd97ZoACBuRU9r+feG5
	1aKcbHNYtWMMmGWrk1gPIwxV92R4ry4osjETxRkvdThnJcfX8UZUt9FsipHMMJuYxcow9fLvh3U
	IsM8FbliFNDXp0aepM4qSqld3yIg9hZqlUdBCHdDw/LjdvA4RQfu3lwPCOWH6HktYbBO46UYNyE
	CLn2yLC4/bNRcxYqjyYIji9Kku5HII/a7PVNVT7A=
X-Google-Smtp-Source: AGHT+IEIW169PzBh+7Jy+t5ubdiKuEPuLSHOaffUvTUeKRApK95r5a4DD1jok90FZKcKGQAUkN78/Q==
X-Received: by 2002:a17:90b:2dc3:b0:2fe:ba82:ca5 with SMTP id 98e67ed59e1d1-306af732df2mr1797848a91.11.1743812020851;
        Fri, 04 Apr 2025 17:13:40 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:42 +1000
Subject: [PATCH v4 05/10] ASoC: tas2764: Enable main IRQs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250405-apple-codec-changes-v4-5-d007e46ce4a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1198;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6OJDDX1zkNT36kN5P3XhHJr3KCVfmEmqMN+HbJKjHZM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfStuEFr2681rQdd0TnSlxjznfvd8q8MDwUY2W0Myby
 7qNbM7O6ihlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAixy4z/I/nfKyn9LR5SsnJ
 grQ1f7maPgpb73ywUN6ML37enHa1WgaGP9zTtlpo67Q7n9XUv9+x+O7/g1un6alMTnTSsalkbrd
 4xAIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

IRQ handling was added in commit dae191fb957f ("ASoC: tas2764: Add IRQ
handling") however that same commit masks all interrupts coming from
the chip. Unmask the "main" interrupts so that we can see and
deal with a number of errors including clock, voltage, and current.

Fixes: dae191fb957f ("ASoC: tas2764: Add IRQ handling")
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 49b73b74b2d9dd6d09747cabc2b00519c549775d..fbfe4d032df7b26b7db0f7c7dcb47661277006d0 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -564,7 +564,7 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	regmap_reinit_cache(tas2764->regmap, &tas2764_i2c_regmap);
 
 	if (tas2764->irq) {
-		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0xff);
+		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0x00);
 		if (ret < 0)
 			return ret;
 

-- 
2.49.0

