Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C221B22CBC0
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867975; cv=none; b=eFX82x3t+G9E3spWDhv2sb9Y2UY0bDHCydYFRhNaR4JBJbWGRRxklpzaGwRuCXzyvzyiHi1VQqmq7Oild9ntiFAQHcvcypgRJBg99JgQL+RzSJUDQ+5EYG44JPttgnIiz3jQubEHtNaj0DecOuWNN3VuPPeJaeoJNqNPQ6F8Eg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867975; c=relaxed/simple;
	bh=xL4Wq1MztELkfR32srCSOzemACum2SwmdSt0xzOdiwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnLx0lbPqsIGglTqhlp47gjYLJrAKN8mFEC8sLkz12p0UmEGcjHOEbgln56Lo1zHtKDR26ZEm6MmOPTL8C3Bhtk/Yl7EFjJwsa2+HVMeyoZ8E5R42HeV5hD6QOTbtsRb+TT0zIXZ2QEIAS8d9C9osYDai1wdfrk2GnjETKbiDPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oi0Ph/cL; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oi0Ph/cL"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220dc3831e3so74485775ad.0
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867973; x=1740472773; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q97oAOdthGO/p0Zom664cpZtrfzDgfle1urqDzqfUqc=;
        b=Oi0Ph/cLDl4rjFRzoJXBJN0skhvdqoM7/PzoMVmAY8LaWgg2FhYR/nldvqU7g3MDwF
         KCVRvYPCMJcg5Q6/db4IkSxSnb6Xdqj3Nz0Ic7+1+Ehke+ZcYFJF+0u/vrSCrze5x7bF
         YVid31X5P/LVUNlNTQi8H2FGSGXWw2BHOcAVX2Za1yw521aEyX3+z5vBOfKIAyZdI9Y4
         XUldDMVfjHh5KqJj8PcqttCnOta5knHlV6dA+MylkMmuByuIqSb+6y+1pKuBov34TezE
         tc5X21obNwckG9it6rVGxp/ejYUUeJOXOVfbJwITKkUPJpb9tK59Yub5Jub2KSjwafAz
         hntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867973; x=1740472773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q97oAOdthGO/p0Zom664cpZtrfzDgfle1urqDzqfUqc=;
        b=mLzuPASvhPGErzV5fyf1KigvRXn63pXldDFXfjlGKrkUNvyTf1dEVPAM0e9VooStgF
         P8RPr4sVk1XWvDDQJE38ns7AppPD9KOzvBvmgEbNHryRQQk5AcAKbiACUDzmq3I5ZxdP
         zTBZBT3MdByO6TLHCmXuA5/ofL2VYhjHrScKyahdrDklFXYZ7ZCpP2dyj4DyILqY+KQs
         rd3id4yNO+cncM5HRzpWS4k5ci4YBjx5YbwmZ2kFoUO5bnm9ESamapl0EnGrSPD9OSGM
         JfCsq39EHGV6MqULeNKJ11r31Tk4BOtnD7NqLxEvM84kR9pIthq0r57azw5tJ3Q1cwg6
         ouGA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Ry0uhsdbpi0FOpoJWWwPG/I3NI7dYcfy6PC34K4OHLv/2Ab3YpgrD5H1paaM4QJEOJKYPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFfTf1diUaY1nAn5dlVTFft7fuQN3c7sN25ZScE14+a/xvpDnQ
	v41g0W4LG6gJtiav6sj1opJveufGBwD7st1W0qpLRaeypCRwDJ4f
X-Gm-Gg: ASbGncuJ+/qo+lM4LXJ8yhH2AFJVlXwXWtRU2ijDvXs7iRDV98+DwRokwEKutYY71XR
	wX+lkf74cTFXF0b5GILv1AIqDEK+l/1GftNQp2tgyGXqbSklVZYT5b1DzwHwweYAR2RJjKBS7SE
	0e227XzJareLLJw7HZOthN3JDukHX2HiyLS9M0xRTQbNy6jSRt+feXz8iRXBsy0hrWAot4FP7Op
	BDUY1HpKvYNsjkYaJPUren0TAKDiOhNR03g51J9mg1KJNUHtnJhUs9GDwAUJdHDKonO9DgHIny0
	ixx7iyVirFPIirTwjr74vrYa+I+taRTpp3kYxhIss5cq1ryqAI1wJ2J+qJ+2FKlas9QoEXD/fwI
	9Bw76SI2x0w==
X-Google-Smtp-Source: AGHT+IHnISboFrM7dhx6z6/HdMGgdO43ZJyjRqDtP0gC2IfA0XVKBKQpFUuOgCSuA4rTU2RzRpg0Kw==
X-Received: by 2002:a05:6a21:3288:b0:1ee:395c:18b4 with SMTP id adf61e73a8af0-1ee6c639006mr30555104637.10.1739867972988;
        Tue, 18 Feb 2025 00:39:32 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:39:32 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:36:02 +1000
Subject: [PATCH v2 28/29] ASoC: tas2764: Set the SDOUT polarity correctly
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-28-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2647;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nP8CBSYu6p+IA9UVl0Kv9ceqcGVIhoP8fVpl5EAKgJ4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3JJ1P51XMJ4ZuyP8xZmHik9UPoduFJsV0CWwK7DpV
 +cNO4HwjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACZSPIfhf73qF8YExlTv6Qv9
 ju7dJxwq8Gj+4fl7Gn+4L3qXP4F7ihDDXynWE8vqbyxIaL2oysL069jDEMuDPz7cUN78MP7dovU
 S7YwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

TX launch polarity needs to be the opposite of RX capture polarity, to
generate the right bit slot alignment.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 10 +++++++++-
 sound/soc/codecs/tas2764.h |  6 ++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 7d6cb29a749e234b325e253985eb0feac6f44934..e559724c84a34c5ee2eb08f60ada4f8acd131226 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -427,7 +427,7 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	u8 tdm_rx_start_slot = 0, asi_cfg_0 = 0, asi_cfg_1 = 0;
+	u8 tdm_rx_start_slot = 0, asi_cfg_0 = 0, asi_cfg_1 = 0, asi_cfg_4 = 0;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -436,12 +436,14 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
 
@@ -451,6 +453,12 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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

