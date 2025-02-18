Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1345022DF95
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867929; cv=none; b=Rq8eQ+KK28o4sJ8lyStRyeSwFh0fqoCmhVla0sStHlJU7ju555IyTe/Sm80kS9/4AZiNGxJd3Lkyw4t1ZAXTIhzSA6ZmB36vI3npLIqJulFgYjQ9py6GaKCzm19oNR3qT+3xs4D/8apMF39ZPrfX+a74x+jahx7Eq8qA+4xD5bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867929; c=relaxed/simple;
	bh=tc7+YebJokOjioegbqEEyvkD73m77q1TkPf5QJVCYzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BW8vhlYKN7hlzLjzqNRw3aFzVC63RGLVX823iVsgVbq7aDOZwSr3mhfombcw9pJWheibhcz8qO3uhnRBbH/m1IuHtWVXlPifpvyv8mX1zmvc1oGo2u/qKuOBy7buz0U9388I8qN2N2s93XOezp1B4yWB4OmyVjoUk2b0p2+n0MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHcrKjjc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHcrKjjc"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220d28c215eso73331945ad.1
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867927; x=1740472727; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiLOjjzQ00SZoyjfGDk34XDYKUpsi/uREEWpuvAfIUM=;
        b=bHcrKjjcE0++cOKEXdKfmJTMPMudp6hOLkPQi7//mFgvT0ECn8j4Uwn773sFgSLKZe
         4oaI0gAxplsFXMUFKV1k7LnAj/5UmiwR39tCjsaisVm13ifA4/8j1O9J3x0h3RiWV+ZA
         +mX0G+ngD6f4Ia27EReJ1MSS+647/I8xGm5ZKSuAquwWnVQ8nz/k3kW3+8zly09rAoGV
         rOFaG8LKdJUSy1r5WnMH+jYVZLZzy6XYRu9H1dI0/6bh/OlaGeOhp3GngKzLe5IomaoH
         AqC2MhaD7TkNx/QTUxzoRaHSc/OLvQTDEinuYyagHy+yGC1DruC84k05qHC8TDMBuirT
         cVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867927; x=1740472727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiLOjjzQ00SZoyjfGDk34XDYKUpsi/uREEWpuvAfIUM=;
        b=adqNtBioGzi4R5Wjs6IlJ3azoMJsWqyzpydMTX0znwz/emZxEIFw+klbvNyohZw9gS
         8IvqmfYPIvc9J7TP+21sOQpv6cxHbU8qiUioIMPJneQnP8vYIDnWDIvMhpPe8hPLyC4g
         y2mxLuAClGZt9qtzRTbXoQ5MY1NbTz9ka7sPzCjfF68i3LJ/wpoTcM7mpn2G7FO0c3nG
         EpNrd64Q6KLUglbtEHvy1J+C30GCHpUX55i6DvUXtlBYmBFw9dmBxEBd0D3Ng0Vi8WkU
         l8fnlKcYDbWRWms7HIpwHYKqZD87oQ2zOnxA41/zwsEmBaOj65fjQbVzK2KLCHC8Gj/9
         v6sA==
X-Forwarded-Encrypted: i=1; AJvYcCUXhI3DXeXpP/dm7zbCU6QzBij9izgyymWaJMUfJULLHjb3bIFvh1A8+DbOZPM6dHF8rsNpLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGUZ78Kgo3ncsy5Ow+xUP7syj+LEGv5xmzf740o4kNouogKeTq
	r+bKCQYjEdnYujhiljwGLLCWnuFiv/6O2fDN8F952iKiQfa4tWlb
X-Gm-Gg: ASbGncuffVe8E0wvi4f34wpzgjJGfQzx7e+AAT2Gr4m/LzlC5Dnw65VbKVhdRS6RGse
	7vwqfcgxY1AYuzAV2Ak7ra7KPKNhBron1Y6l9r13HoyOL6eG9Pi4WgYz0/54hqfQRUyjStCFFI+
	m5RsSj+bU9wehpHZKnb5lc28LMh7QnkddQIGA1dMag01i3CZr25xhDkTEAAIdxMGk8ONfasRASY
	2OP8nYhuuQNzQtvxzoU5c+kuX1QzRg4SV5U5dL8zFT8T1Rau360fXLwSA3zWjZ9enu1hMwAL6LW
	AdF64b6JQ7g9INKJeI5uHTRWFX+VpNTIeBk+ZHuoNLaio0J1kTC3JFBqFxjN6GnIPkrBp6cbgQN
	DiIPcSN1j6g==
X-Google-Smtp-Source: AGHT+IGn7aILehQqPamgsv5OD4CsnwPVWdUowtXQ4D2uJxQ6nLUSk3lLQaRP5n8bye+Ha7GQaWZmlA==
X-Received: by 2002:a05:6a00:1707:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-732618fff8fmr21627172b3a.20.1739867925781;
        Tue, 18 Feb 2025 00:38:45 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:38:45 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:56 +1000
Subject: [PATCH v2 22/29] ASoC: tas2764: Mark SW_RESET as volatile
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-22-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=815;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JfeFMAA2K8mo5v0Zj4GGq5hrsXO4W6rdqXHcDI+Alb0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3JJmaGmlZCwPvew3T7n94bzejCvs9e+OBjZMXv1l2
 mazSWaGHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEyk8hojw8KVuYsmrjruqich
 sKYj1+vItP3hInzSl9ZnLFvj/Ge1oSEjwwF3+4As+RUKqice3GsWXlyx53sPZ3TBzl7uUvZvm2Q
 e8AIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Since the bit is self-clearing.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index d316a369c43002e6a8a8160b85384b8824667bb1..3c21810358881b6935a50807cf7c745291dee3e6 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -873,6 +873,7 @@ static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 static bool tas2764_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case TAS2764_SW_RST:
 	case TAS2764_INT_LTCH0 ... TAS2764_INT_LTCH4:
 	case TAS2764_INT_CLK_CFG:
 		return true;

-- 
2.48.1

