Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2424C1E5B86
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 23:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894971; cv=none; b=FFWN68fKLQ9FtL3EaelrDAvlqg0JR296hpqIEAc9SHPgGDS80E6G6c3gWtZCQeyEkIRKCvR3nyO5/g9npEC4WTRZQQOy0FC3lf3hKl8pLMXtdxRNgEkUSmoOPiWRBpLetqHyd7uUmEWOAz+ZEwO+BVSnzhVtxJN3qSJAWZgA9XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894971; c=relaxed/simple;
	bh=G51hIuSMcs69fsP3kxPgPSB+sadxSZFQ9IDE7EICSys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IeBTV4lw5wMg0cTdm8E98AFSrt1J9or6P97z8dfDNc0Kv/7vPg4EzVIjvY0KBp4ibKDYrEa/eBccAWTbZ7m1gZRfACYb7oxj9h1CVdSUGWqYlRZFv4Z3IgRlXY1vlazZhrk9QdYE2s2vBLccroN7FLVc7qj6wRIuwge1bBdvsVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SATP/HQD; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SATP/HQD"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af51596da56so2628685a12.0
        for <asahi@lists.linux.dev>; Sat, 05 Apr 2025 16:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894969; x=1744499769; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXyMsWo9eIJUoUgRuYRDp4l/Hr3tALUSH8In3QapG74=;
        b=SATP/HQD4QvvH9s4E1zprjLEhO7o2iiMOxKbfFCjCPu+FjyTp2MJT4PLG2RprusCbh
         pQRcsFHYtGiILZolDe/b9YaLgVfRzGlL55gbfxYRt/kuWONQmh4SE85FeqPbtnsIIhH/
         6B1D6DyX84NRQ1gJ2nPGMb0+w/7bla0id1rqy1+EuMhb76YIhppWd3O+4yyssE3esCjj
         jeBJ9Bjlv1XgEBdu2pm9F6qBlNIDlEopcMRhGJEDTjjr7IrouNpKlWS4I2A6G39ibVgh
         Evf0+cVAWpVEGwvvEjqXeHUpfPqF47TFMMFdqPj5FABLLBrPXrqT4NcEAuJbFbfOM8kd
         r+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894969; x=1744499769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXyMsWo9eIJUoUgRuYRDp4l/Hr3tALUSH8In3QapG74=;
        b=FHZfgfKofPEks/1qwpv7KEozUcfUi/YnyjUeySxJs8RpjaFMSXuW9nwRbiBdw3UpOX
         BvhVE4FTiSbTXS0d+EbwaDqnwQ04FrfWAsxzN+/x9H1jTPVKU/GyFHXydCUvW6yMUGpU
         Znx79peHWLIN95sZtZeqOE85UzuoVCRZXmJCaSz6jAT9sNy24TG/qcvUpqUWt5TpByHk
         4U53snpqJGX1vU50haKw/m430fiVx83DaptiCan29AZnemtsHSzZRjMtzsBvRyaVvPBA
         Flk9nnr21iXM6TTAZO+p5ltjCDeR8Tq/UBl75JrRNylE5B76t6axUbmp330eR28/jS5J
         B+9g==
X-Forwarded-Encrypted: i=1; AJvYcCWDiRXcPIeATQ0f0by1TGHQkern8TwmiERYPNpeat1Edo785d5bvPBNYE3oT4GUQWucBYCpHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9nuQOPxvt09YvxI94/U1Wk65eiJDTOGVK6dwB+UHmU1ThJ5PN
	bG0YVWxYnwWv+sxHvOdrYhHfU4GA1VsewPwkwkAzNRnnJNoTImlWcrCZq45e
X-Gm-Gg: ASbGnct8tlCv13H34XVsprP8hdWxBgS4rvBxi8Fb0y3fwBfnmSrEdVO76CEML9UyI9w
	Z8adkS4HNyAG/wkba8l/+OTAOrMybRm0vowXmY7wET+aNY1Go51Z4iqcONOwf4pVyCwB4vKOV3t
	zRMVwvCB07/nBWfqIpN+YTWl1ss030A4bOAbXDR56eNuuNyHQZ5ICq2RH28B7SywH8DDaHGX655
	HC6vfKNUCwGK6b4Y9YkkI952rKU1rz70S2T1nSJi1NgZ8bpyFcq91zxO/12X5jO/55w/SyMQPdW
	E1XZnb1aZZUIkSr5hQzs9FpxcxP8rE4AYLAiQJ4Coy93JUloFM107kxvUdqsOjzRFOeeBeNZRrK
	zMm2avQwPIp5OFXUk38NILb42IWAUAhHY6OzfWD4=
X-Google-Smtp-Source: AGHT+IGbdDbLX7GMJybw19Iq4WA9iEwsbs7vDxezKzZjWqipK1/2AdnNvQpSyC83p7AGfjOjuLJpLg==
X-Received: by 2002:a17:902:f785:b0:220:e362:9b1a with SMTP id d9443c01a7336-22a8a8739d7mr119941375ad.25.1743894968944;
        Sat, 05 Apr 2025 16:16:08 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:16:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:09 +1000
Subject: [PATCH v5 5/8] ASoC: tas2764: Raise regmap range maximum
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250406-apple-codec-changes-v5-5-50a00ec850a3@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=C804f2ztTqLQ4FxnFPpz1XJ4BtyjpL3h2sURrICRQ10=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3bWd2jotr13VtjPycPyxXG7/ZQ2wY+hPL0HWlr4N
 xWJpP7sKGVhEONikBVTZNnQJOQx24jtZr9I5V6YOaxMIEMYuDgFYCJzDzD8FT2wN8RzCuNOFaEJ
 Hx5n3H+ySGLK7T2vtzXsYj3u/6yO15iR4ZDNhbi1MtcvxVqrmMXWdAcZ3axgNcq2nK+ycMHp03o
 l/AA=
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
index fbfe4d032df7b26b7db0f7c7dcb47661277006d0..718107fce3bcf6ef081f6fced7b89c708518b1a5 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -685,7 +685,7 @@ static const struct reg_default tas2764_reg_defaults[] = {
 static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 	{
 		.range_min = 0,
-		.range_max = 1 * 128,
+		.range_max = 0xffff,
 		.selector_reg = TAS2764_PAGE,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
@@ -715,7 +715,7 @@ static const struct regmap_config tas2764_i2c_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 	.ranges = tas2764_regmap_ranges,
 	.num_ranges = ARRAY_SIZE(tas2764_regmap_ranges),
-	.max_register = 1 * 128,
+	.max_register = 0xffff,
 };
 
 static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)

-- 
2.49.0

