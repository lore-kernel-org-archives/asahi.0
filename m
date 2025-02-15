Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB7424B29
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577977; cv=none; b=ufBltkIph05kKyjBHR7K5pPpZ5BRTuaTf8OnoIfLfH6jdIRQjOao+dGxjpYto0uLRG+pqIdYW8sx/oPbLbwWXUbha7K4FsZSlo4D7yDq8/eNJWl9SrFypPJXNeQe+H3hCQBtx/kOo3iHWzngMUC6sZzLvCOD6dh+GMnbq+PGUcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577977; c=relaxed/simple;
	bh=eo0FgT54k97mDSR8rz6Pu8NwpXky/0riRsqEIavkVRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdRBSmIWf9sah2KhIuHsSqcWw3KOK1hTPRvR10SucalE/P7aYnPi8s6pwtLgOSiSEBKgr9AOpUixRlwRlgAlrbe63dBr2hQEKk//8lr96SJxa+ItIzpdLe5oxlpWV8NsxzlM/araI08QqHVidtuQSwacK+5NHge61HZK4I88JFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jA198Yi/; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jA198Yi/"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fc20e0f0ceso3039822a91.3
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577973; x=1740182773; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRen9lz0iA3eKqSin+5VNNTShffgRxZVjvG8oHS7fzY=;
        b=jA198Yi/EYDcsP/7qlfqNa+43sT9WDZQFEyn4ne2bkmMOf3kaqFbN3h61UZx/S7gcZ
         kBznNaYRJzIfdA7vpTWVx11wMHcLT2bBhRpCEYHkd4tU0cy62cqvk75rCsv6tgw0swg0
         pcek4VWuI985+MJ4LgfG1WYWjV9Xq9S1/oE5K9qYAGOdBqfcDQ2NxappJ1TAYLlp1pE/
         0ZCivDrHMfvwZ/WcKcHr0OdglnIof+8N+/ddpxRq0RJWBQYmQMONX4Tjmr+071CxNKbH
         rgQEzqB2LTDh+OoYE/gf4P+RbQZLcUFJU1h5L9WOSdP8t+6ej1qkL3/j/9A2tE7yQ31j
         /9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577973; x=1740182773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRen9lz0iA3eKqSin+5VNNTShffgRxZVjvG8oHS7fzY=;
        b=TAjxFkM6XlmR6yAix3oVrHYZRq9rMhYJrVo2b8seyUAj3LUy9XsGUhB+/Uu+VpQjWb
         rrSon63IlKtVHRdqO7nXALPbHfdF9L6gyFCt3PWnu/35Zceph87nmXvOlI7OQXGEOwPA
         fZ6cexDJJSYei6YSzU0jZdCUGSrGYTxeYZ8ULlrPqdVJdCpBPUaE3ujTvGNEhIDIbILy
         PobIdVZGtQ93ZvRxyyMDogiCQcQ6OqpKIoc7c0XaIE3wGopITc6rVyaItJ1Dy1wk/04x
         Jv2n3xaZgLe/GkInysdMjQmBBuJ2aWm92FVV3H/BlbgSNf9DI229hhyGL4soDQaeCm2W
         yKgg==
X-Forwarded-Encrypted: i=1; AJvYcCX8vCDhF0rUzmPZSrsQoRRn9AOk9NdUhNdSspqmrFcXXbcCGaI+zO3g15cDnRtT2VwYX3ZasQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8k+9MBCSAzCxJPqe1eURGkO2tHu51eg0Pa/HRFyYs9iSnzFb0
	F1MldMaOvylQEvSkcGtkqksrnbXaYq3wAHd+DqDD0DG9BvDpXJ8E
X-Gm-Gg: ASbGnctwFXO3xnBEtW7cSco26sorQT4tdocFN/6pE4BK7zhLFJGaQCvOes4XezU4l7D
	8BS5j2aqbJYl+EPDtwxrj45UeOHg4wGszRGo35W/Y4WAvvru6SNVugZbxM+ycfKctaQVL/E+vtW
	9v/krbBX1rApdSek4/Y9wUtOnom9HZMWRWFcLy+u8NPContGwbURzciy6kD17WwR5C+aAFZZKFv
	pggXVvFJrBnTB15m+jpAJ51bRlpwadPix5O6pwUzjqlLiGICcHL9LZLiZlkkaOG8vqaD7R20aDK
	IJk5j9XwFL5j8/hRshgAK1lLuelMbqrFmZl26aiuuRHJQK2aqkVRgzeUq/S3VbPGoTtHLoYwMLO
	wK/QEbzJQgw==
X-Google-Smtp-Source: AGHT+IFHQB6Hi75lq+IHVc2EFRmqZFJg6IszUCPchCSlNMP6cT4k1DouRGvCzCmAtaa7EuyBYHLM8g==
X-Received: by 2002:a17:90a:df11:b0:2ee:d63f:d8f with SMTP id 98e67ed59e1d1-2fc40f105e6mr1703877a91.13.1739577972631;
        Fri, 14 Feb 2025 16:06:12 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:06:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:59 +1000
Subject: [PATCH 26/27] ASoC: tas2764: Set the SDOUT polarity correctly
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-26-723569b21b19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2605;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JUEJyKGKi/edxIy+wXLBYHgRqMQ6HGn+xp2GKuXciig=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb+7g7a02Zrw3+W/E9bv1iwQVhabuv82/LEf/8nLuJ
 H+zCG6ujlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACYy+Tcjw6opz99Hf7+24N17
 22kGAfXf1X34v9VOjZhgfVbqGMPGqU4M/4MUPrvNlFz/t3VWzivNpS63vnzXaS5zzzgZXCi1y2B
 mMTcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

TX launch polarity needs to be the opposite of RX capture polarity, to
generate the right bit slot alignment.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 10 +++++++++-
 sound/soc/codecs/tas2764.h |  6 ++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index bdbc210ea8306ecebf704fe33fbe41083867e1ca..0cae0e8819d890f0818b531a40094f22e4e18fcb 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -426,7 +426,7 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	u8 tdm_rx_start_slot = 0, asi_cfg_0 = 0, asi_cfg_1 = 0;
+	u8 tdm_rx_start_slot = 0, asi_cfg_0 = 0, asi_cfg_1 = 0, asi_cfg_4 = 0;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -435,12 +435,14 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		fallthrough;
 	case SND_SOC_DAIFMT_NB_NF:
 		asi_cfg_1 = TAS2764_TDM_CFG1_RX_RISING;
+		asi_cfg_4 = TAS2764_TDM_CFG4_TX_FALLING;
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
 		asi_cfg_0 ^= TAS2764_TDM_CFG0_FRAME_START;
 		fallthrough;
 	case SND_SOC_DAIFMT_IB_NF:
 		asi_cfg_1 = TAS2764_TDM_CFG1_RX_FALLING;
+		asi_cfg_4 = TAS2764_TDM_CFG4_TX_RISING;
 		break;
 	}
 
@@ -450,6 +452,12 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	if (ret < 0)
 		return ret;
 
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG4,
+					    TAS2764_TDM_CFG4_TX_MASK,
+					    asi_cfg_4);
+	if (ret < 0)
+		return ret;
+
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		asi_cfg_0 ^= TAS2764_TDM_CFG0_FRAME_START;
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 786d81eb5b1e71bad094ef94e4b56e8f7c910285..4a419c11d4b08eebb915762db00af5c06ff3dd42 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -84,6 +84,12 @@
 #define TAS2764_TDM_CFG3_RXS_SHIFT	0x4
 #define TAS2764_TDM_CFG3_MASK		GENMASK(3, 0)
 
+/* TDM Configuration Reg4 */
+#define TAS2764_TDM_CFG4		TAS2764_REG(0X0, 0x0d)
+#define TAS2764_TDM_CFG4_TX_MASK	BIT(0)
+#define TAS2764_TDM_CFG4_TX_RISING	0x0
+#define TAS2764_TDM_CFG4_TX_FALLING	BIT(0)
+
 /* TDM Configuration Reg5 */
 #define TAS2764_TDM_CFG5		TAS2764_REG(0X0, 0x0e)
 #define TAS2764_TDM_CFG5_VSNS_MASK	BIT(6)

-- 
2.48.1

