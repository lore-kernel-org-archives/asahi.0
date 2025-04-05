Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4657C1DDC3B
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 23:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894963; cv=none; b=fBW3mzh0f/r4ohqBvDwFbAZqicglW6VIT122oNvfyazrXrp8z+cZNPuhdONXi6LxWWhRn2hz+w6wnRZ0kECHbmDBzpvXLfq1Pixi6KIvoX/jSQ34Z4ux5f0+Vu50HamfWunriabG2HqJRluys5w4lB3PrMgd1grD/D7E15ok7yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894963; c=relaxed/simple;
	bh=NKoEg61ykul7LJA/d5/4y5aypypGyjWZZdHNgsP/B1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ArN87vdHIHq8LSEPzZL1GQChWVM/66cYXADQC5BmXLQcc/l6qysYMSjYPmI/OTLC9nTs7CLXOBLr0g/qds5Uskjy4OCqpWf8UoPBh4Cd4SRk72B72fZobW57D8Ba4w7bijW91MvkesBJMycIzF2+wpzorz02yE7OPXGYMrtSxd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuShrpam; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuShrpam"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22548a28d0cso43275695ad.3
        for <asahi@lists.linux.dev>; Sat, 05 Apr 2025 16:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894961; x=1744499761; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZwEITRysV/CTBC7Bt4CSH8RxtTe6q6jNA5tekEdNXE=;
        b=OuShrpamHKFDbidK1Pzwo/tJF8AsYSWctJBxH6s9PE5KsmtKXUg99+AoXTgU8ukyhN
         eXoC+baTIddDSysL017/qJ3V/K+d6KAN+Yv+nKGOl5dZbKZE7zO0C0c6C9LZfisqjyMq
         VZrtP9Gk0zluAYAYH18LI/n6y6guJw5SE0apaJ3rDn4Zhum8Czr24NVl63lbBAxPg7X6
         4DpqIWQrEo9hI8cInuhliNrc74J2C5D62rTgTQZi1WFq7cMkh6KoX3Yj4hhfEW3uLkPa
         WFcOy02Pv8fy5y7PI9Zxzl6uq8TsdoA6q2xBrzL3YLJCWhkPxzVb5/jAGGGbkpVPOF/9
         ZCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894961; x=1744499761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZwEITRysV/CTBC7Bt4CSH8RxtTe6q6jNA5tekEdNXE=;
        b=it551/QAHJ8Uqt+CUj6DbhZQYaYz4GS9xi3tBtj/Ri1WGJKFG9wtP5SjtepGu+WS1/
         Oot7MFCX+9TzHq/pbCeiPUmyWO5vHr53LeZTNsm8XKTyDdJjROFd+sWQsJpQlLSzA2Mm
         +ceNUWDDPYfQ7sS5+Wur/M8fP/iY9B8Jt2asc0+N270s09aUTTIm1G+QnMvg8gv1rlwk
         lEjiZBPd86EpbH6Wj/Co4Fe7AF0kbE8b/eLXZrNN0VpZ+p8sy2G499ERA96oertjxPfB
         yKpxKXuqQHfMyTdnVJ51k/aXr2ktqG1Boy8oH8Gqq/lx0w3uscERzsB6EtE+fmHmCzfO
         gdkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRY12TAIi/UVx+DrL1og5FuiXOLU6Z2cSJ3QFkEPOjULj2kYPLSA/xHy661p5pVfvit0tlbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+SFTGC+VyT5iAOdLcJlcs+w+7miEeDMDHGB2gdhytOsouoLIQ
	M/Wbog+Map3vqIHvXzUtXFI7VMZk3KVvlsNfkS8z1X5Ff5uGsYMLQBtq1vw1
X-Gm-Gg: ASbGnctHsnY2g0FhY90A6IOx97YpOb2hNJ21jznYaCIj0nXHcoQxJvcONqiMcLKsep/
	Rn72DyzoO3ATkBN+AfdyMgWBiSbaq/fBfha+6JqTuXM4qw6labZwn4TUrE9HPbO+KKhlCNeqfYj
	dz9SRW98U6m44XGQhLfOiJ21THW6x80OvM/zC+BPIUrrlDKF+Z++mSXTFyfQUG1xMlJvkHnxbon
	vabMJYZD45PD/OIWnnLJ76YQXdm7J+aOjJKLFqWKW5xhCiInXVEXCZ8gVfVi1fAKhwMfWkg9ZoT
	piY54esgaiF1kEUHkbcrQZVMtUVc4IGsNhFp8G8m3AVv7R0kRNzS+SpWNz59KHT9TaXD3c8yiKz
	7q6wMT9OdvgfbcOdzoZ4cITXrcLCOpmtxHhN2uSA=
X-Google-Smtp-Source: AGHT+IGG750Fc5A1dfFEEYjJ56maIziG5tfTLYOevsCGnu8/cR4+rqBu5vubN9qrUcKUfYucyYwy6A==
X-Received: by 2002:a17:902:e749:b0:224:13a4:d61e with SMTP id d9443c01a7336-22a8a8d31e9mr97517265ad.51.1743894961245;
        Sat, 05 Apr 2025 16:16:01 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:16:00 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:08 +1000
Subject: [PATCH v5 4/8] ASoC: tas2764: Enable main IRQs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-apple-codec-changes-v5-4-50a00ec850a3@gmail.com>
References: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
In-Reply-To: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
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
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3aKtaodXv3ySvGhU6ULUheHG07gmXKwZkW+i/WN8
 C+eK4QPdZSwMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCRK92MDD+jvfrfzDRcP+Gg
 0T75Ak+/Z6tfxOyY06+XsPUkl/4v/W8M32ubVzMtvhl5g72T6/GpqQ1C579M9eiUCZyoMc2i75c
 XIwA=
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

