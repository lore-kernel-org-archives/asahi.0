Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476F12309A3
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658290; cv=none; b=BtJRDAPBT4ws6DsyUuUYgU/ps1il27uKuyzt+YRSP5ADh8RefjPTFO9hJ3ssLBYNItptWI3/LDIsleN5IGWGvaHAfssrKHDaVLEc9Y8gLDuyRrVoydP06EcV7DA4sdUUWo4WNhhxJ5S2g30FMeZyyXJjb8HqInY1nTHaE9Tcwbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658290; c=relaxed/simple;
	bh=Sd3QdDEgr83Fg6PxxgYQ9P4zyv6jCRBeVjY/d6AX3g8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hf9Mb1ZPE81pjpeUAtK2lUOx8JOki5HwoDJeiRLqGEhgQjfsIrcUFLEsTF5IanHgIR+M9RkXXxFm1omZO4FIWTsVkoP+QHvpHvSX1roW4LMfHMvL8EIK7FgGe6vY+OFl+QZ4Mm5YPYkrPQAIWdFic0hi3W8tbxbD51Nh/peYLWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Od1I84NF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Od1I84NF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220f4dd756eso15528645ad.3
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658288; x=1741263088; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEzzB9qVJ3Iw6yE+IGNZV4gwcPeMNS9a9nupNaDYjZA=;
        b=Od1I84NFjyS3oVOS5ImqGXjvXFHttEPmZ345nT6B0HSCg4J5+Ur67s3lSFpXiD9Li+
         xXBoZIZhLZPBD4dgccH1DytbyK47Cb49UcXl1hKNHZC687t2z6rifvwgU/N8EMM1WDne
         ClYp9Pu8wNOI1Z3lPjSGkAxlWCQxsdgQmwv5tdfoj+Km+mgeHIob+JHolXSf5fGPvxpx
         v8qACjQ/UWW5mmUEj1HluNYv6/YuxE0bHtc0MX80H0eKAbS0/izix4WDS58UyvV0mJWX
         44B6eNAqk9KWiipCRx8rzeV0gb3lmeJhhFnvvuJqw6rskNCgg9awLKatez9yvc5Os5mv
         x+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658288; x=1741263088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEzzB9qVJ3Iw6yE+IGNZV4gwcPeMNS9a9nupNaDYjZA=;
        b=uB/VcrdTHPjLBXkFtwbcjB5XKSB4kMRXUi2hYqSk2wxCCYK7814tRtbjtYHYoc/FV0
         PtGrAx1bQGkENqskRccPvae3a+CEPopAKf0PgcCR4iyRRctc/Yzx8+7Sd6MP8cLUYXEL
         zTvv1FlgPQqzkZNf2AZRLCGtnzDz2+82vmCXVaUmZ0jsxY1LBSBU4ElI/LgbYXhrNCHZ
         vCivVihEd4q6iDB08I/L3nG7S7C/1b28X7K4wvcAUhxojZI26pv6fBgsazZD/74bG/Xs
         uQNzWjrUNx+GmQAoRRn7/eETWMaui6HXRnTZyg1JQ/nwEcoU6LXIXwnAvOdfEnwJHsDu
         sk+g==
X-Forwarded-Encrypted: i=1; AJvYcCXz3Tug0qb7hxJnmPn4Jfesnh1gkS0Pyl0IIvk/c0Ibo+ytocMUBizYnl0kojVMWS8AMP+Qyg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yytfxmb2x59Xv5llA5Y9uUd/0G36M5v1R4whdKQ4PVUg192k00B
	wPMvG0EsYXOoD+pcNYcG55Tnagk5VppSLJq8bJMwy8Y0JcsqTGbvUoqDTtE4
X-Gm-Gg: ASbGnctzYM5ehuaol/sdKBby5n/bW8VstFndxGA8rFGZ3XT2WEhmGLn4WtYlCDi5nXj
	sQaOdeqBpxE3rF8hSCAVveS7OSAea1GF0EKTLQRkQ6RsP/uF+qGpr/KYVhsBgtVLEStlkIZvk/f
	PBBc9vzJ6Xrl5/waXzrkJjWLnMzKzs4foxVzu8YHE31KkAsIqRxvv3ni3ukzzIGdHogKs01D1nv
	7CXcaJyF7okHVf2XnfJR91va+DzrSFZ0FSBAUWv4gCs+Cl3rULszoBEto3GeDkxAyXThXi08NFs
	5MNj8Aab7E0o9HdZbvavFicLscKOQ5LB990uY/PAuZzaMOWqxd465O0Aig4Y5cE2TkL/tkexOFD
	1GD/vVjknWUztIljFMBnF
X-Google-Smtp-Source: AGHT+IHdFPiIjso+jHQ5pYM1l26QNU+l3tZa6s8ZU6RVChKuKqgbn5vVYB+/pxo5sqBJaVfMPpIGhQ==
X-Received: by 2002:a05:6a00:8c3:b0:730:9752:d034 with SMTP id d2e1a72fcca58-734790a07bemr16311476b3a.1.1740658288101;
        Thu, 27 Feb 2025 04:11:28 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:11:27 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:47 +1000
Subject: [PATCH v3 20/20] ASoC: tas2770: Set the SDOUT polarity correctly
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-apple-codec-changes-v3-20-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=IJKMt2MOzo4HqAlNbvJllezc8HVauxLaZQPm/TY6YwA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk8XTzVteJa9zyGteXNIKOu9izN3CS9kSJYwaitYF
 5tnsaKto5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIlESjAyNP66avXB65vk3+X/
 tyf5R1ur/1rWzGh3ZPl1gQXhTIKpSxkZWs9cP6RixZIod15C8rDMsqc3e3P8u3/dXGnXUcHfd2s
 1FwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

TX launch polarity needs to be the opposite of RX capture polarity, to
generate the right bit slot alignment.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 58f36cf471a6b7dd15c1b0600710396de4e2f61e..b68ae6236d69b43cfb1cf28cabf73b1f729191ab 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -352,7 +352,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct snd_soc_component *component = dai->component;
 	struct tas2770_priv *tas2770 =
 			snd_soc_component_get_drvdata(component);
-	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0;
+	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0, asi_cfg_4 = 0;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
@@ -369,6 +369,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		fallthrough;
 	case SND_SOC_DAIFMT_NB_NF:
 		asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_RSING;
+		asi_cfg_4 |= TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING;
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
 		invert_fpol = 1;
@@ -387,6 +388,12 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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

