Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F1125771
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 00:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812038; cv=none; b=DmOIhVMy3gUqLpNm3K3+gyvg2dT2WFiT/P8SVlL5rhNSxquqpZOBJj5/yWxPpuCWN/lJVw9zV7Bog7imLxnaFWkofEAWsIXuA/IyvvdPpe0UWP9xTDr/e4FZTXxuQb98OE/YGW1Mpc1HVHj7tgnFv6NlPYoqly11Ui1S5vRWpjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812038; c=relaxed/simple;
	bh=zOIPSUJDjpXEV2XASe4hz9XCB1lPli1Xme9M9iX6Pt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V6T+bQrHE4OXG+Z7tGoe4UgGROrdWYpnU4uwd4l3NHsA3zP7QMWCZlzYzj47cRnxejn31KtHkjH1o0/pXdq9le0JBhveLFQ2sjAf00pkX8PUUctf0zSE0/r2J/TNYET5AO/OjiOyKQ5iB1CRxNKLfCShINxNjITdeCNmhRXGf2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsYI12Cf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsYI12Cf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227d6b530d8so23525575ad.3
        for <asahi@lists.linux.dev>; Fri, 04 Apr 2025 17:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812036; x=1744416836; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yW9hXSkJ4Waf+74SDd8gksPgJuAu7c7UXkVtQ2I/xOQ=;
        b=nsYI12CftEOSkoCOE8EWJ9Y12uqsULmYkQac9c4lOLgl21lCjFBIoRjnsaZiq+tvmV
         eGceGmwhgeoL6DV6yIGZ1auyqHdSTXDV6zSmjSdxiBrXbMybRHYItO4UaP+nQFpevuV9
         K7cutoOSRmWMN4Rofphdh/TpiyiMqKZziwwSehG1WYjimU87Z1OUDyzK9wk/yfV+Y9fa
         F+Xwb2U99x/gb6bKpwHwxo3diw656qMAX9Gt93mkneh5RL3p3Gr/oVxZuj4HQBhvUbzb
         RoRKQC2S2d4xR/aenzh6GbklaPuSY/fLKb98rL/w/oakxFK2oMMeScEGo3aDiJIdn7DN
         Fc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812036; x=1744416836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yW9hXSkJ4Waf+74SDd8gksPgJuAu7c7UXkVtQ2I/xOQ=;
        b=MqtZVevc04ygvgBFIvj8ch8waBNtbxUqtEd3OWF7Qz9hU5tx0ke6T5bZNMNKORNudV
         HoTBNA+r8uKTR4ENSoeErMV+C9dYnxW7CfOMH74J2v/Xo2t71YNe9VPBq/IYsSTE7jJ3
         hgWc4b51kW6kbaEVX7uLiEcsg+/ADWyVHhdjhCr4b8LTmYzOOFyrRHdRAcrXdfygKgSx
         mHiIDYOJGGUc7ECBuQUTWYnft0uQ7uDVUFBsyIHRtnwvLU4mlAWfN5BL69PQ+6+q0EeG
         a6680MmbGDtVvLIpBH3dT3SSadyJBJbic+JzducctkMHRWlTW2lEk8aHGd2QnjepOyOy
         dRqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJhfO6WsrRXToQ4z8aQjLajIAMGPKEuTJytoZvTdzKE78rxH/IaW6OgWIl2plvObB7qdFYDg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1Z51DuZ2T2evtfd6llNQG+GUqhpk6YYES9qJhrHXLiTRf6R5a
	8lxiqdS4IHMT8gH5A8TA92qApIUKF/1R63WxB36k/slVisOywqlB
X-Gm-Gg: ASbGncvRkDgtrQLvUN7e4mMvShyqShgoNxXb8860lPlLZDL4ZzzXxTytz4zku0CLy3t
	fzHuC+OQEybRkr/EbULuecDDmFJyuLE5zNYEjyV7sqWR+9nzU5r2U/u1HwQwN/OtotFmfUakTt0
	1NpC5QsUULnRvUXH4Xkmit4CL2puDi2OHx/caskeW7o6eoZ1VXYNEyihHmWoxd7rg6Wo4HzIXu6
	Chmt///PvCZ0OM1SBnIauqjF9S8sB0SwNkLdjAH4V4/6ASnh2S2i+zl/7Qk1Njxavytb9xBkbY1
	HREXfV8ZiDjQFTmdDtZyqUoZLYQXkEm+wCMaxEXy5bo6IbVx/KNUZCYus2eBac+5B2hSpQrHGXy
	ehwtILLHo6wv3jbvEIns3BiC8CMyVGJ8XZSz3OmU=
X-Google-Smtp-Source: AGHT+IGa7e36UcDvxDMrQQfz/mat62V0LnpWU7YvqHeKSh9vf46sMIbVPfmaI2qyNOvWUDVuKcMj0w==
X-Received: by 2002:a17:903:1245:b0:224:721:cc with SMTP id d9443c01a7336-22a8a05b5b7mr55301085ad.13.1743812036182;
        Fri, 04 Apr 2025 17:13:56 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:55 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:44 +1000
Subject: [PATCH v4 07/10] ASoC: tas2764: Raise regmap range maximum
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250405-apple-codec-changes-v4-7-d007e46ce4a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=BkIMz4eJxcgeuEtuRc/ufySB7IywdlsAKS/PxKZmonw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfStvkThXohen5PT0oPyc6XJybTzJltof8G6XV6V1Mr
 nrWm+o7SlkYxLgYZMUUWTY0CXnMNmK72S9SuRdmDisTyBAGLk4BmIhsKMP/8OU9Pxeyf39cLb5P
 Y9Ejy/kNl/9t4lmgeKxTxuZ9uK0hK8M/hZWZjo7b1j05qrTJxmY5S+mR7N+5jJ2HfBSMzoaeTUn
 jBwA=
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
index e291ec0951d49ee902589df16c4db96e83614e66..c55c6e4ea1e2ce0051e43120a71e229238204fd5 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -724,7 +724,7 @@ static const struct reg_default tas2764_reg_defaults[] = {
 static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 	{
 		.range_min = 0,
-		.range_max = 1 * 128,
+		.range_max = 0xffff,
 		.selector_reg = TAS2764_PAGE,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
@@ -754,7 +754,7 @@ static const struct regmap_config tas2764_i2c_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 	.ranges = tas2764_regmap_ranges,
 	.num_ranges = ARRAY_SIZE(tas2764_regmap_ranges),
-	.max_register = 1 * 128,
+	.max_register = 0xffff,
 };
 
 static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)

-- 
2.49.0

