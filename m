Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB732356C8
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658220; cv=none; b=FaetMO/7pEhu8pvKZ2uqaU9ZrrngZuhF2wUM1fBSpBuxbfVG+H7kojxd7vLtJGFyoo3KHKu14V0UdVnFjxagCbbCpjZMitQZxz8smtPk5uOdwNDiUVJYvVxBtQhXiMJiCinrGb7XcYNEonJLfTBOd4+9R68TJMlaoKLj/ypaKy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658220; c=relaxed/simple;
	bh=7xShCpFQdJUb4D7S2QF+bNsOJUNFCjq4IHatgwNnvKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n6++9Y1GftfjaWwPQgyzIqMpUg9tds7y77hRLmBwViHoxVQCbzNwbakIFRmR9F+SPelCk/gmkFTT5zWXjvo3uflPjdEz1Yd9lUBa09r/U2qnA4mi0Re2Q4jDEg8oJw8LSzS24WDzEljOs4/yxVtbnkchAj1Eo2bp/nMklaIbqAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJ85lrIL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJ85lrIL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2234e4b079cso12596105ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658218; x=1741263018; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGdcVF1u/KwGvbpKlJDcqGwRXZF3lOCOPum24pRSoFs=;
        b=QJ85lrILvl1VAdjOy8epMLyg1ALVfXJMEfARm/wdINNqxXDVvqycq2Z5oBdUi4y1Jb
         +Np7Fcmpts98qf7NZ9+2BOCFx1kACm6ZEBwon0t6TdgBrw5wqpMDCplzNXOusFyBTUzO
         gPaoocKXfvISxSC5bAmthTpWT872j6rD6N/qVZf1GN/FKNmjxNvFRJILN9e+mhrDGvKR
         QPlORzEKFr7IcNoe2reBlBoSWCmV/K9FItPlOP87t/0kQSi1TFM9SqnOL+gSP0ntsxZc
         BgC5eI4w8x3ZNv0vME8ra6pqBO9z1e4658YxwtYfoAXcgbWx9cB0WEW6Lwmf0Zdojbra
         Autw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658218; x=1741263018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGdcVF1u/KwGvbpKlJDcqGwRXZF3lOCOPum24pRSoFs=;
        b=Cg/wEnIU3HpM3SgcMNtmK3yJlbOBCVhzRrndcyu0y04fN+1WZDPKYjj//AlJWsJefc
         +lhBQefQZn02rOuUvsj8Ixq0yNMIVJm+/Sl10ml39Td8JFl0GxSUtzDBpNg+jSgV7oE8
         OKp6r3BnC44+ji5TEOW2gqZWQAlcB29zEALZVRNBE1rxPTSrJho/bfaX7sGQ70NU5Y60
         fCE0oQN+Q0O+oqtxwm2u8zyr3tx+hlnekoYw641ldPxVFiZOaRu0jqpYJSWTxR2GNBtS
         bDHB3go2WiXDU+k8hUN6mvdX8n4cLwlYdWxBnOOgkqYa0WAWPM/ybvBxP1vnY4ZsFZze
         D1mg==
X-Forwarded-Encrypted: i=1; AJvYcCXlHRw8rbgprnmcmrqKmb/wWX+E0adaQ30gVNSbE0L1jBlZ+tC+RLXZRDOoYK4XoiFp6VzYKg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywur8bwB10okgQ/OLOataFcXv8BHUHLIbv0uMX1A9z/DCMx9eWE
	B3aLXYZZXADGDifOj09Ap7wd6rXTwTklNSRMQ5PTe/My5oXOFGbt6BnKaAHV
X-Gm-Gg: ASbGncuIHDKRtqFol1IkrLbNcgatAl5xfCkwZyn2uYmaOxY8TomEAr7VWkPIn1cux9L
	woGkIgImMefGwqOt1MHTAN/HcOQoPGIdiMNzpupYz0sv3hiFBR1/zEV7NHMIA7uedUyq8czRBfD
	q57yMHQ1/UVfC6AUIYqJcpWkPaFvjImk7sEUsxzw0I466qV5yL2+6+lMpEHouXo+MDtt1j6a3c1
	42suAW88fqze8Ors25Oe5vgN6MDxGinjnV+t82uo6oSXqvabAGpd9Jn1hjI5kYVgMXF7gVy4aXd
	w3D/8Ee3W4V+9Iyd5RGwIoVih8FuUWaa6uZOKhFeIhzpv6FlVCSkTvM9e7echkyA3NfAD/Jz3Qf
	cmI1KgsieSnoM5Lbmn13G
X-Google-Smtp-Source: AGHT+IGaBznkzCiy9+ZSp/fE8RNqDYHrZCwjqbYYIAhATUT6oQrn/URzvxi0fsxxWKWSl1lxT66lTg==
X-Received: by 2002:a05:6a20:6a0d:b0:1ee:e808:732c with SMTP id adf61e73a8af0-1f0fc1394c6mr17968725637.14.1740658218202;
        Thu, 27 Feb 2025 04:10:18 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:10:17 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:38 +1000
Subject: [PATCH v3 11/20] ASoC: tas2764: Raise regmap range maximum
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250227-apple-codec-changes-v3-11-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=xW12XaRnHT2CTg6ocY0zQAjiDxm2L8AJgzbe75kjokE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk8l7RVX/dEQfX/+Y9l8nU//U5k26mpeWejeWvv2x
 xQlN+8lHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzk+ypGhr6CfgPVD5t2V5ZI
 mk+ydfol7qlgK/HsDq/vVia1t4Zh6xn+2X05fjBSYeGf6qTsKSYTWXZIqu+taSr+WPeGUVbK4Lk
 MEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

TAS2764 has a number of undocumented registers between
page 0xf0 and 0xff. These are used to apply in-silicon
quirks and workarounds at runtime.

Raise the regmap max register to 0xffff to cover any
quirks registers.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index d21ad23f59ee1b393a27014d403dab1d99836012..0234a41deecd62e860c9d54a7a3206abc0bdac54 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -739,7 +739,7 @@ static const struct reg_default tas2764_reg_defaults[] = {
 static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 	{
 		.range_min = 0,
-		.range_max = 1 * 128,
+		.range_max = 0xffff,
 		.selector_reg = TAS2764_PAGE,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
@@ -772,7 +772,7 @@ static const struct regmap_config tas2764_i2c_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 	.ranges = tas2764_regmap_ranges,
 	.num_ranges = ARRAY_SIZE(tas2764_regmap_ranges),
-	.max_register = 1 * 128,
+	.max_register = 0xffff,
 };
 
 static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)

-- 
2.48.1

