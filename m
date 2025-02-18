Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D9E22E3E2
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867850; cv=none; b=nzOHHgYNKQwly2dzZ8jqrTySWBL8bheTIAK43hbtlHd3CwsIxZmPY41WXTAigmSFK9zfKM2dTqx4X+MYT7l4WgpAfZ3A+WocUEPHEX4e96apMNzQWgNmRPv23lk3w2IKG8HqFfqB9Ksii39/2UJJ8LEggKx+rUquBkizuId6334=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867850; c=relaxed/simple;
	bh=rdgpo4XKxysxQco2x0SFtuaRS11Q5R7MQdDhUx4X5V4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGjFW6Ovn2p5qPzqx4CAM1ebBlPo9M5gMEyHlR8+Ge6JVjDXe2EImxi4Vm9NUzpS3/hu92cN9omaAu58Yndfl5nA9JPKfKVkgoQoMMnNCGkaqxCwsk7L5qBmyEKVuKMZnhgZHzgi6jeDWE2zfviKPfO/mkmJajx/uvylr9wQyo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHEIKO8r; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHEIKO8r"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-220c8eb195aso106180345ad.0
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867848; x=1740472648; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4W1nmesNsVd9HtjqY1pKAoaSwbEZBLcLQfWZxRu3Wo=;
        b=jHEIKO8rfzPALQkjPynPElHousSWRy6MGmXnzZVnbVAJU79S7mpqWI1ezT0kiug/LJ
         pDX3W130JY4vamBDrTsiw4Ym8OIO+wQcjJ0xWN8LDtqodNaX40WK5X3QuSiAXe5157PZ
         DIPKlWUbTIAhPNJZJm9F0EjCYAjo5csyqY7SSo18WHTMNZ7YFw9XxrDLM5G2Q1GFZVqk
         CCHBlI1NtzIP7qQizIdtCMGUU5cmLfNy7zwo5eI0VoTtR1cplyGJc35Pi7+ijTYFq3lt
         0JjYNXQ2LDCs08VtL3bmoErpv55sUPIT0J0/2zaJ0mapABOmSBt/Jietdy++AgJ9qS5f
         sJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867848; x=1740472648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4W1nmesNsVd9HtjqY1pKAoaSwbEZBLcLQfWZxRu3Wo=;
        b=Bo1ZKMSQr5Y89N5mWdQUdX24qZUF9ZyvdplR0B5XLHIGM09+g2Vrs31yMeBzHGnYJK
         IeU5KT1o26zSHcj6hqK+3016jNQLnN2OD28egWOR296/36Hr3PmijPYhbHX1qwlhjkpp
         3GAG6PqcKQhe5Gos28epUka4OHFGjJKp4H4lLOeYlNOeW7jNvkmKOcYcHYS9NeimpxFv
         FlVdRDqkcVGrrCvHWsw8BZxRn3g14sk9+6bEuwE5Gf7adVe++gzYHnvVWp1o8UsO/E3R
         siybLrf/WijB62pwE9oWnsnam3yQS4/l/nX0AmuLi5VLSEf6r0H+i04nq5G86srm+oJs
         QHkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs5s3ZQzpSyUMkC/YP5TiFa8wKufl9AKv/kkACuAIHhV4JU+/RUTbkADd0TBShiDz8R4+ydg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj2Y87ZS2gG/Jy+i5VsIBNAEkWzxt7QTbyGTB/4bW59VWGNdq3
	KmSuxZrDm3+WtoAkmpB3p0zEhN03gDdeUDJ8sIal96IAJD7jsRRZ
X-Gm-Gg: ASbGncs4TjS9FSVxSd6yWJObgqlMe1U4r6PEhuxNC9rHw6xmbsYmqiLyWXYNyewOBcO
	4TRxKaspkyblC7JkAif1KFzb+2Z/8k7SjjmAYpNTuI/v4MGJODoKnie6bgJT6V2yfDV/K0r5dMk
	dJl35M519oNBeU/I9SwfvQJtaXTaknG22wWoQgt3/DIWi6BkCCHMNoCNtR3cZyBuPweUrq1u2Q5
	1RyD+5iERskb+TSLJrYzyUimIWXzcok2OSsn4M53eA9+6AwtJZsmLI3mo3OyMuTiB6kDT93KJY5
	ZaWiJJYNmnwdRmRs2usZXGIR68sFdMVG+jSBJekNkV+golApPvAxObJmtwB0m064rVqokDnkYC3
	7xANfIMyJ2Q==
X-Google-Smtp-Source: AGHT+IGxGIIJPewHLSEPggPPN3s8vsAiXTlTsakBOHSx/c9wnfXAS+iDlEn1PMfPO7KvvnaAb3yReg==
X-Received: by 2002:a17:902:dac9:b0:216:48f4:4f3d with SMTP id d9443c01a7336-2210401a706mr166713985ad.13.1739867848565;
        Tue, 18 Feb 2025 00:37:28 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:37:28 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:46 +1000
Subject: [PATCH v2 12/29] ASoC: tas2764: Raise regmap range maximum
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-apple-codec-changes-v2-12-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=E3fgZXeyxHCmx5TkNj8oGEVwOZCR+iEFAFUx25XBj1E=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3BIkJHkvlWya/UReSkDm5PuHz9TKtm2b3G+yYcGc1
 CO9u1UmdJSyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCR2V8Y/jupMuUuq7VWu5Tb
 ty/HT372HyFTDrv66NUN+ZNCT2zdnMLIsI494rNGNedruyz1nbdEpsisqu+6/zA3VuXYtvWfxKu
 L+AE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 898a53f7e033c73b949cc2f6be188f4e32b4f19e..13c7ab7ee1f7a9e1224804de034466ef8bc1bf06 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -726,7 +726,7 @@ static const struct reg_default tas2764_reg_defaults[] = {
 static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 	{
 		.range_min = 0,
-		.range_max = 1 * 128,
+		.range_max = 0xffff,
 		.selector_reg = TAS2764_PAGE,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
@@ -758,7 +758,7 @@ static const struct regmap_config tas2764_i2c_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 	.ranges = tas2764_regmap_ranges,
 	.num_ranges = ARRAY_SIZE(tas2764_regmap_ranges),
-	.max_register = 1 * 128,
+	.max_register = 0xffff,
 };
 
 static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)

-- 
2.48.1

