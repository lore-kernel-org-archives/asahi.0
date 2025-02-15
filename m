Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468FD10F2
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577968; cv=none; b=bIvKXhtN+x1c9BQFQ72VdKsmmPmbD3TWBW+/Vn4hhjwSXjdK6EhrDE9ZaU1/pIWFUniTbXLXlHm6ISxdW/JCaDiQrnKIHoS9y/8HePSTEQ0gkS0LwM3HUoOkYoemlrMjd3kchAS1dfetjJOOJHQdEKsqgxi1ZCZoKzZqXVu8d1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577968; c=relaxed/simple;
	bh=exy/ez26Hxfwd1ehJydaC5MQznjyT2T6KkrUovtbO0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h5dk7DVKzdLxI+fCQXJYDHNzmsmEpHFJYFj0ttJTwu5JsJuhHVVz0bJq8c8hlPOP79LCTGXJbQlG58PxTsK7nqxgJ0kw+Otn2nQwQAiigTY+336ed4zLpsAgLBKgsvSAtfojtwT5NtQM1ny+zyenQabuoYMNTVGIc+/ACB/JNd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eooWEkll; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eooWEkll"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220c92c857aso42461145ad.0
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577965; x=1740182765; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMOl5DWfSarAr8NfczAc5bcb6e3mt57YM/YFQ8kMkDk=;
        b=eooWEkllIaFqiykLy4HTvu0OuCOkUij6Ps45SIVK7YwfXm2YT1pJZ3Am+Y2l1b9K4H
         X1C5zvt0e54bph0qlQ5kOdIKp5rwCpTNDiVWCuzqJeC/LGFylMT62EGwznAQHrUJguef
         VgR/FXZu9l38WfLwdqXm7xsTRQgmjswKUZNjHSqcPdYNZZ7e9tm/GSscTTGOD2lIrdFR
         saEdWFg+rzzHaCRNSoj/5n/HHFRPD9jwHLSU/2jUd7nAPKjo83YkU3WaHumuSY14uEbL
         7/nvzUfJDu99FwT9vrVkCqaa3ED9KY3Yo0Zh+DfhrV3cCT3Y5mcRKkFdTJ8j1hoAgH3L
         Jytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577965; x=1740182765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMOl5DWfSarAr8NfczAc5bcb6e3mt57YM/YFQ8kMkDk=;
        b=D9AwloQ9W0W4XgVOMUI63JhJ0gy2WiSRHapLEuQEKN7BCyVp91Q3mwDysmtcE3GeGk
         ekXSqsChYXnkcEdMPgQj0IrVhDu/A2ntxTmrBL+aqY6pfk9dC3oRoyEATsBCSWVv2DMC
         c+XwSTjmaOcKn2WI92wmI0nRdjyOWFg0O7PU0EKew+Hc/lEAgfLW1KokF0NycLQkjbi3
         UNTJK2LOMrcM7Zg4ucUfQ/IEbu0PIun24fhkLJkgHpYYeZLbznxe8iiCTp/HEj7FnVjH
         yqhZnJgou0cuf7KarfF1+tJ00CZ9roX8DjBn+KiUag8+yR98tXueEVyBKddFao2qPMLw
         sulA==
X-Forwarded-Encrypted: i=1; AJvYcCXRs3DD/NhbI9gtsozYW4pqjWhuR1WJwJ7Dva9NP3yliyVNeJAE7irCua1zvQjRvELNIuRuGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbS5Po2r7kUM2UntyB3W+gRP/5C3KU4OrAVyQTk+7uYIeiVK9u
	AKZ9uebvT1OFmiH8vrwChfdY1rdpK8PkhNkRbexAp9VnfvBC70q0
X-Gm-Gg: ASbGnct7wnCuxXGAfKw/MphhWIKd3mh+x33cfAoXy9O1SpXPeKc8EIF6hU9wgqbPRSO
	WW3PnAjTgqb+aCkJXYhtqsMp/pWEMpukVatB5jlKcXedtpl86UMYDqLZJRFWvW5zzeRVc4Tuo/x
	cn5dc26sKNZNSrYSM+EM310dHShTW0tzfPznMIV3yWQ7qaF+5fyYD1dnP9+LksQ+wtXyn7R8s7c
	S6RcvSQ0CKB0RGv+shhk7ZBA26HTTq2FF32fs8pcrspUxj1bbRNSLP3N8G/vkp8w0F5jo4ZcmuC
	35Xxs1LAwZM6JH7zhPwzLVR45lH2+gvqpEOcsR04EhlefnzAHW96tMYe+H3CdcO8IkJhZUqcJE3
	F/Ws5ciJCcQ==
X-Google-Smtp-Source: AGHT+IGAJaQEmpdeALEh/GyxIXOnz6R69HJuA5hOSl0OQ1WF8mnI0XnI3HlrKU2LHmfIXMS1gCOOuQ==
X-Received: by 2002:a17:902:ce89:b0:216:5db1:5dc1 with SMTP id d9443c01a7336-221043951fbmr18345175ad.1.1739577965620;
        Fri, 14 Feb 2025 16:06:05 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:06:04 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:58 +1000
Subject: [PATCH 25/27] ASoC: tas2770: Fix volume scale
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-25-723569b21b19@gmail.com>
References: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
In-Reply-To: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=934;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=XaNoLJU7DdmYL4jp3fbyo1TQkWbzJcJkaIm31NjsXmo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb+5Y/dPCvzHxiHDqWZYD0pO9fs9z2q4rpBCwS05So
 Lq/oOxTRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABOJ4mBk+Oi24ZzB+U9ZSSte
 qa1jkND8Vr9mRubCv4cl392puiPRNJ3hf+Duv7HchX/iTy6WcdwWWR4t6TX1lrWkyWFP7gn95xY
 Y8gMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

The scale starts at -100dB, not -128dB.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 555642d5c53533d9959314f0384c4dfe91ca799b..a9e65f95ec8600d905c45db4e013d3c2602fa8dc 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -653,7 +653,7 @@ static void tas2770_codec_remove(struct snd_soc_component *component)
 }
 
 static DECLARE_TLV_DB_SCALE(tas2770_digital_tlv, 1100, 50, 0);
-static DECLARE_TLV_DB_SCALE(tas2770_playback_volume, -12750, 50, 0);
+static DECLARE_TLV_DB_SCALE(tas2770_playback_volume, -10050, 50, 0);
 
 static const struct snd_kcontrol_new tas2770_snd_controls[] = {
 	SOC_SINGLE_TLV("Speaker Playback Volume", TAS2770_PLAY_CFG_REG2,

-- 
2.48.1

