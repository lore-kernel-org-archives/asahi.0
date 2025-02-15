Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675A61A83EB
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577981; cv=none; b=IGG7CAEdt7QomRaxXZy8HSJuj4z1FZnBXH4AprClkGPEvzkMyMIxo8SmrwhaTMRSbnQLcGYqiLGZ5KxKHxivHrDexvA2py0q8hJrkEo4OQCdQyV8CsRCaF8TKK2s2tIHd7Id/y/B6mEkcD486TKj5O4o2J3dAxIL6xdii2skeaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577981; c=relaxed/simple;
	bh=YGx9PSaUXVNDPo2cH+rNjw2DIvjtU+dlXI+O382Ewmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JaPgwfGpJRNoULIQvybuRvXas0v4hfwsCCQXSnprNR1jyhmvXHigpHFnCyyXTBv6ZgvnIJHLMjKJAtxM0pQDNliI+8gARgxcRKDuRuxR/SzVlCwvHu07ppcCD9HycN8Zh/BOwjpLqLBW8VImR7bnZ+QcGfw/JSjL+ywYZXsE528=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J65XEDSh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J65XEDSh"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f6a47d617so46147475ad.2
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577979; x=1740182779; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZ84+yPdbVuhz7ak3Hw1Cb8Gf7TrNSS/4QEXDz4j3UI=;
        b=J65XEDShQRJVIzU5CCoRX1wv1Z9EScFoodkYqqbnrWscO6ouiCL2m3N1PEs7xvxt6g
         2tr3DnMXmHA7mCNzkj/SdggBrqK0LUYuiFaQy57Rv3KM0w3BFy92BnvfnCTZinNptGbV
         2FgI45UaBbd1beh3T8y4hqz50Kwq6oPZHP2zOa7sOT0PULCUm1OyxxnrodmkpyCqOHFV
         +y4PWAZ0qUPP0x8b3NvyX6CcyaaQA0gETMzpQaZCQ5IJuTS41xioAFXRqIuKZGjWqIBf
         EZcugYqsR3h9SQtgC+gUwhXIyArr+aNqHuvCVnP1iXxJeeXc9Mqgz51xGt6b9aBScwb8
         +E8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577979; x=1740182779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZ84+yPdbVuhz7ak3Hw1Cb8Gf7TrNSS/4QEXDz4j3UI=;
        b=a+YPyoNLB0O2l82ANwzgtqpScbBN1Ifvq8gXnZ5WVJgSyY8TJ7LouTBzGGfqv1d4vZ
         ojEBYcrhy9DHmMBykiwz2Jz0bpLkwB27d4qqqOsnL/y2zy1aB7E1or6Nn9dxAjv5OAn5
         En4e1CasE5l7exoWWD6iJPm5adGAQdRzWKu9zb+XOeArSwz6X0HVJMNl6q8G3f+AxGRZ
         1u+hfSGCn6egIpcrxJEp04k3dmFrBUQiYOLfKLp58YyqErfjep/O8FxJwOJPKw+SFoZZ
         Ja7Lcf2HhAm5I5bm86mHMXXmSAzsnyeCPVAtTYN0xMfFbxOg/L8XazyxRfRY8hWRFdEt
         7Tqw==
X-Forwarded-Encrypted: i=1; AJvYcCVM9zOADoA3Rv5+nExK/Pwf+J4qPCU02TPJvkSVWoJWGyRbQzRQQElo8sW93ikv957cbkXr4w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWcrWXdLafuBTkIgGEEMLO1BkHl75boEHfrr4/vELXuAT039kA
	2STd2pMpTlbyXhFWtH2lMAJg1HBnMjsPzx+0XbnrYOcwjhFeWunb
X-Gm-Gg: ASbGncsGlBpleuLw0HT5WruqviwXUbxT5WNsciZqbgoW7HuspLWfe++r/MsSzM+IXfb
	jucQzWiYhsUKLjR/UpPA1tid2uK5ZmnMUno/G3BwRr5LXKeL/86NPx7TVEvo5cR1/+3jJ1PuTJ9
	Vo1cTaGFdMQUJATX6Ql10OxQhOSUoci51/w9yLhhAmycd9Wax4921WJ/hRn17VmPAadVK6b8Bvs
	MmUMIpCiwasCJ1925iiAQn9mzr5AiiiiG9itMk+RU7NF4GXt9vjpPgsTRz5uo6WMPxNcJPGyXtN
	AXxkrHH/6zdENtVo3/m1Uo3/E5pbKK+OITvA3tyGRTYx0agl3BJ6N+7Q7/jqrjDPvzUsyB3qvEe
	RaNTsuvsE2g==
X-Google-Smtp-Source: AGHT+IG6Hm9pNI6VvtCGvN8M2e0uv4buL4nr2DpT31d3QO2bC+lTvrwW2S2SN9aTyfVa/+xOt06boA==
X-Received: by 2002:a17:902:d50d:b0:220:f91a:4650 with SMTP id d9443c01a7336-2210402bfb5mr20473085ad.19.1739577979635;
        Fri, 14 Feb 2025 16:06:19 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:06:19 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:03:00 +1000
Subject: [PATCH 27/27] ASoC: tas2770: Set the SDOUT polarity correctly
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-27-723569b21b19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1752;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=t7b1dvsnhFRkTomOlVk7jphWt6a+ItGg7B4nOBgPrGs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb+54zPRzi9h80w331v155OGz4v3mBdahNcVm3Z9Vw
 nbL5W/Y31HKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBEdhgx/NPaa8J6NsC2Y9aK
 RV63t9iuXGixfo+cxJW+Sb9K/liqnN/GyHDBZFPP34qt1uL7bsUVZEorrp7E3SrLs+apoRZvc8G
 Kn4wA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

TX launch polarity needs to be the opposite of RX capture polarity, to
generate the right bit slot alignment.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index a9e65f95ec8600d905c45db4e013d3c2602fa8dc..793a0df499a631d8e4670d4a452572b2dae0c477 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -358,7 +358,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct snd_soc_component *component = dai->component;
 	struct tas2770_priv *tas2770 =
 			snd_soc_component_get_drvdata(component);
-	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0;
+	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0, asi_cfg_4 = 0;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
@@ -375,6 +375,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		fallthrough;
 	case SND_SOC_DAIFMT_NB_NF:
 		asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_RSING;
+		asi_cfg_4 |= TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING;
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
 		invert_fpol = 1;
@@ -393,6 +394,12 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	if (ret < 0)
 		return ret;
 
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+					    TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING,
+					    asi_cfg_4);
+	if (ret < 0)
+		return ret;
+
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		tdm_rx_start_slot = 1;

-- 
2.48.1

