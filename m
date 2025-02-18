Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B34022D7B8
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867873; cv=none; b=sZpzfj8DeoYUife4++aZMX1cWkPZseu4eIPlaXInLaqzJpevYXx7kjJfqjYAUJSR9odRQQ2YeGBh/G/kAExmE4wbRaSQLdaTCOYFtLImp2MGmt7eUlrzQZsGMT9tAdMsonGPLmvgQuljveSkuhmeFYMjwFCzi7d3w1II58JCW6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867873; c=relaxed/simple;
	bh=lb1XCvL1II9op8X3CDkVqh/LUj9amQa4WogbY3MJQqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nly3VKbmaiaEm4ncc2Tb+kpOCPEZQRKJYfLlOIZSMMrhe0fBQcGgJBbDLQIpULj3Qut8P6/qTeWNyER7/Xze/6ODro4T9qo+3KuzIxY2s/ENCCDiZqq7UT+XQLHKz5xBsv8tJJykq4dn/R0IjW7xptv6bOyu0X/rno5xiCGexso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ax59LW2s; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ax59LW2s"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2210d92292eso68955645ad.1
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867871; x=1740472671; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTcnqKYb+/KLLREgvZ6qbT0Qq5VXrrbYGMFKxj4BUWE=;
        b=Ax59LW2s3D3HKRrMeyx+7IKWtmUZrgRnszbOKBrW1mik4I82zB574j9QbGqhwy1ftD
         gmIFb6RYpay6YjR23ZoLJcccbqLDyZe9ISKjjdQVmdHF4WXfB425DqcLbYYUxA9MTY1V
         fbTG2kGePlkLOVvCaAWqeJvPIc8qeZG20J7KBRl6PPrEylMXTj8aUQwfQ0q0g9zkYgKC
         XCGxXE362r/pCdWp6qIegEWpo98DFUskNPvgNk5Ud1l+YXcRy+ShuNpMdlU3M2QHiuUz
         mv4o0+EGVFZgHMSrj7jhGDeX/KXelIPWjdF4s6NcFs/G2xC0cxfzlr7JYpwM3HyDfzjU
         /Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867871; x=1740472671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aTcnqKYb+/KLLREgvZ6qbT0Qq5VXrrbYGMFKxj4BUWE=;
        b=tpRCH4dO50YON55iPrwZW9TTXtw0EqWOMSKR8TPZabP/6M9X/fnE6nFBoBudB3cX+J
         blCcFx7wzYrtLP4cloy6G947ksNCZhrGGR5q3QzwjoYwjmjtuPfmUcnf3QBp0rmOjfWB
         +PpSS4yNa9OpNuVZ4m3qiszB8dJDb05OKbd39t5MHL3DQyi/ydlWNB6MNuEqrPuYYACa
         JbTbOvpNghCRQ1vTEg4V2nfHo187Jxt4VC2IutZyDh7QRTz6B4/YARgZqIPsOY3+v1Qx
         wfzH3b6g0lFpi/d1/m+WDTpUpKJGLFOnzei3ss2TtH4FJr+nGdBApxJWcu/eMQNDLgeK
         6JtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2wM1uLJO/dAMBTcjtkFLgjivXLYYviirzPdJy69vHNcFZA1EZB5FPa3L0Nd6pFHHqGARZQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNMsF9Z4XfL/NJI5165ryBEhe90Xi5YSHmD9OxL08QPhDPA8tw
	+n8Rg1sgbkc15Rd9VBcg4sww/yeqFMRQBx22cMPrZqZwyg8KZFvy
X-Gm-Gg: ASbGncvIQOyrv9+o1iUPuBvgP7ir6lh5atX7mBpVVYAdv+qsuOHAqzhx12TRnUEo+Tb
	vhyseyuCJVSlApVRch22T8P+LfIcE7iHqv/tSKw3sWH8LB+xGOzumJKQikBrAGB9uNz3Ay0Wnzt
	K0akUSVIXR3ELX0dUm/SkiIVHz4tq2R3oLQsiX1+gqOU0eh+HHS0CKuVHkKJ0OiKgrl2DibRbOw
	BhG+7oMxxgqfraJL9A+KErRDOUhL80gGFbWHeFLpwpeeBPDLuR1Fh5S2oZwL43EU1CscHn6q4Yu
	6asH0XGBwi498Oo6N6jyEXBK52qtZq9OH2hKbZvnWMnIqKMFCNSMUdpgsFL/N9zo4eot5MeOqeZ
	Fhs6NEiJimA==
X-Google-Smtp-Source: AGHT+IHjmO3cHoD38sSMb/Vhv6aXpCCEr0G3zge1hxQzZrVOQcXvkl7aoPZ8wdeNZpvL8gkd2Yc9Jg==
X-Received: by 2002:a17:902:d483:b0:215:6e01:ad07 with SMTP id d9443c01a7336-22103efb5b1mr187971475ad.6.1739867871585;
        Tue, 18 Feb 2025 00:37:51 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:37:51 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:49 +1000
Subject: [PATCH v2 15/29] ASoC: tas2764: Export 'die_temp' to sysfs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-apple-codec-changes-v2-15-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3446;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=0a0HOe+ABXU9bHydNnLXso1NNutXczT0PDufOAOyGk0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3BKZ6i+4XXd6NP3wvjWxOwpXJwUt+aC/ar3yyptco
 psCDSTdO0pZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZgI3w5Ghm8e+xeuSdrCK2/m
 wtLw5VUKq2rAHRkv20XOvy8+4xE12cTwP8X914z2/zFHJzHeumMbsr21MrlG7LPMkZ4vU0Xmxmc
 zcwEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Export a file for the readout of die temperature measurements.
As per the datasheet, the temperature can be calculated by
subtracting the value in the register by 93.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 45 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h |  3 ++
 2 files changed, 48 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 13c7ab7ee1f7a9e1224804de034466ef8bc1bf06..b0d016f85f7fd57bec36b33db5e8c2bd242b5b94 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -571,6 +572,39 @@ static int tas2764_apply_init_quirks(struct tas2764_priv *tas2764)
 	return 0;
 }
 
+static int tas2764_read_die_temp(struct tas2764_priv *tas2764, int *result)
+{
+	int ret;
+
+	ret = snd_soc_component_read(tas2764->component, TAS2764_TEMP);
+	if (ret < 0)
+		return ret;
+	*result = ret - 93;
+	return 0;
+}
+
+static ssize_t die_temp_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct tas2764_priv *tas2764 = i2c_get_clientdata(to_i2c_client(dev));
+	int ret, temp;
+
+	ret = tas2764_read_die_temp(tas2764, &temp);
+
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d C\n", temp);
+}
+
+static DEVICE_ATTR_RO(die_temp);
+
+static struct attribute *tas2764_sysfs_attrs[] = {
+	&dev_attr_die_temp.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(tas2764_sysfs);
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -664,9 +698,19 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	ret = sysfs_create_groups(&component->dev->kobj, tas2764_sysfs_groups);
+
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
+static void tas2764_codec_remove(struct snd_soc_component *component)
+{
+	sysfs_remove_groups(&component->dev->kobj, tas2764_sysfs_groups);
+}
+
 static DECLARE_TLV_DB_SCALE(tas2764_digital_tlv, 1100, 50, 0);
 static DECLARE_TLV_DB_SCALE(tas2764_playback_volume, -10050, 50, 1);
 
@@ -698,6 +742,7 @@ static const struct snd_kcontrol_new tas2764_snd_controls[] = {
 
 static const struct snd_soc_component_driver soc_component_driver_tas2764 = {
 	.probe			= tas2764_codec_probe,
+	.remove			= tas2764_codec_remove,
 	.suspend		= tas2764_codec_suspend,
 	.resume			= tas2764_codec_resume,
 	.controls		= tas2764_snd_controls,
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 00296b8b1f7584e7520bd6ed749a09681f16ea09..786d81eb5b1e71bad094ef94e4b56e8f7c910285 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -111,6 +111,9 @@
 #define TAS2764_INT_LTCH3               TAS2764_REG(0x0, 0x50)
 #define TAS2764_INT_LTCH4               TAS2764_REG(0x0, 0x51)
 
+/* Readout Registers */
+#define TAS2764_TEMP                    TAS2764_REG(0x0, 0x56)
+
 /* Clock/IRQ Settings */
 #define TAS2764_INT_CLK_CFG             TAS2764_REG(0x0, 0x5c)
 #define TAS2764_INT_CLK_CFG_IRQZ_CLR    BIT(2)

-- 
2.48.1

