Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7E822E3E6
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658157; cv=none; b=VQuI7Mev/0fpGzCNIM3+sOFjmCrkDRAUApZGDQ/jwn1MJwiSC5xE8o1BK39v2TMNTNTOZUHjIKCvV1sHIs4n31mRZjYpwqdT2bxcN7E2015BKrmi8N0owTySzCl6NmYwyk5OVr12I1Y8tvy/5IVm7Vej7ZgoXP+VYMVNGBLceuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658157; c=relaxed/simple;
	bh=F2DrIfGW2/9U4Q7MP0XR4JLpgNdMCG9EqZakypUdbbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4ClsHbDszfn1xVJyzmtcmB1aHg/14NvvuzvLIkNXYuOMDcLcwB9uONiqIjHUcC9qP8sUOtc8rk1y7r7xf1G6ieCN5FIEWWdiZhp4g/EOHdp3gVoW/sNsDBZ80eo+/RlZeBBqsOnVjBZtMRon05kM6pVn/coi5+QucCTkaoEbAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKgGFQcZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKgGFQcZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22114b800f7so15103015ad.2
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658155; x=1741262955; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++pOxyjV7NsBqQX8JUt+QgPYmuOaE7kjoGyFm9ECaww=;
        b=JKgGFQcZxJb6t3s3B29OdK6Ps/SkUgc5ScOrPz6pF2WrhWIEeoJG6SHPlVsqJHixRw
         DvBV6mS3tm2SIK44bBPS9aYZc+jkiYsZLK4vrn/laVthumyRdCykkpUtDlGfiiuohW0N
         +Ds0o6jLmuFqSsedk2yWG2sjCYIaqN+Ul0qguz5RbES6jF3RyxfH7fveyOxG+hM47yRt
         yEm0MJ4IkQYVXd/3WmsyU8WGzmMdyCN3ysOFy/4rRRE0SsVYulXwHBlZtQNnPOI3vzPh
         hXN40G7mD/O1vSVEr0AioM+8LSrdUGepdKt9akBPObQz3tWqM0bjezEntvc7ZRZWTpxB
         b7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658155; x=1741262955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++pOxyjV7NsBqQX8JUt+QgPYmuOaE7kjoGyFm9ECaww=;
        b=QbQ6qOz6xVkb/vrPS437Yir+bYe14jwoMErCfvo/e0ERl/g/osya1gwzI3B0Gc84jD
         RHfavu/GXwKlzxG3tcgxJu02c+xFl8juCXD0KQ++mKgy1zWObJMS9Ke7Dzmj8Bue+W4o
         +D2WW7tGCk19ech+T9ZLhRfZvSRCIG9LRgkVOaXb4xeUx26jsiLLy7CCyJqZ3heNIoK2
         ky7pFH+3Lz/qwzsmtZg14gRERio08emstu7zHZ8vLu/ZScsm4W8O2Otlltv/SHODCNDE
         EEclThoUQt8qtTk+A1EmD/xTOCKP3yUG4QwF0OB3KbL8Da9P4SxYtcxdw3MdPwhyDMkP
         39JA==
X-Forwarded-Encrypted: i=1; AJvYcCVW1mTp9XARKC7dYbW2kPPGuGO6SRm96P4Nh7VT5MZQtGTH8qtQ6t/ev6IxlpeAX4kPskPmUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxB+bgyk6XiXKWQdjoLP6ghaxo6A6l3iyG0TIQQxT6vDvlb5Q7m
	+M2PkMbwfZ15tS1xXHT2IWVvbK4GFH4cJnpbEMq8d1V1ICJ57xz7HkSyDphr
X-Gm-Gg: ASbGnctZbXJ2YXyGeC6Psyq/dW+riYvhNJZ69XlLbkUFlALZDpWcV1fXjDwsIDIGZj2
	rxuPsaIfvKEk92sDDQdc76cGjzOrTJFgd4NuGNlRv6iR6X/vjUx4UR8i6/XUhasp+zue2qYH1yO
	hIpd+IbWX7dzx7aOtzWQ/TS5AwKioXuzei71/GAGnAqA7MLfCPRQNSicgnDSt5N8DRuPqgUfL2a
	+pSlWSEDBckPHTpF2088Zl+KfoPndWmJSqsHd9rpD/XsS5Ydfd6+m4XkR7NIo40AY6TtNj8V7h9
	PNH9ntsLyEq9vYfC0iSASl+cowlalyo/3v6Mb+DDewZ0xU5QZM+4GK/m6z3qvk1Ywl35in9V0fV
	oYs1B1phgpeVDs1G9jaSL
X-Google-Smtp-Source: AGHT+IG8X0dhuBFQIzNUsv+4ZcqoLGmfAbMbOzcssF/1zKQwJNQCo9iVI1o5amOtj8awa3nUaRERBg==
X-Received: by 2002:a05:6a20:7488:b0:1e1:a75a:c452 with SMTP id adf61e73a8af0-1f10ad33597mr12264774637.19.1740658155233;
        Thu, 27 Feb 2025 04:09:15 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:09:14 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:30 +1000
Subject: [PATCH v3 03/20] ASoC: tas2764: Extend driver to SN012776
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250227-apple-codec-changes-v3-3-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3988;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nDjwUi7dJ2EmO3q2jQ+Aw3u//e8xOzpHKb8CsrpivsM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk+GykqUSsgy7/2rP724+/zm2/7nsrQ6zN5Mu/JP9
 +PcQFnWjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACay2IeR4dfMPc2/r/JeXHdX
 9bddpApb7qSTixm71yV/fJEtlR720J6R4f352BtnGY6/tXKryrrX94JJNFl/u5nLteTtQemmvdr
 f2QE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

SN012776 is a speaker amp chip found in Apple's 2021 laptops. It appears
similar and more-or-less compatible to TAS2764. Extend the TAS2764
driver with some SN012776 specifics and configure the chip assuming
it's in one of the Apple machines.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 43 +++++++++++++++++++++++--
 sound/soc/codecs/tas2764.h |  3 ++
 2 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index c0a1d0c2a93890105a169717a7fb75ec05f93146..d9b4f898789fa9b59c94c97e3b130950b88c3a76 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
@@ -23,6 +24,11 @@
 
 #include "tas2764.h"
 
+enum tas2764_devid {
+	DEVID_TAS2764  = 0,
+	DEVID_SN012776 = 1
+};
+
 struct tas2764_priv {
 	struct snd_soc_component *component;
 	struct gpio_desc *reset_gpio;
@@ -30,7 +36,8 @@ struct tas2764_priv {
 	struct regmap *regmap;
 	struct device *dev;
 	int irq;
-	
+	enum tas2764_devid devid;
+
 	int v_sense_slot;
 	int i_sense_slot;
 
@@ -533,10 +540,16 @@ static struct snd_soc_dai_driver tas2764_dai_driver[] = {
 	},
 };
 
+static uint8_t sn012776_bop_presets[] = {
+	0x01, 0x32, 0x02, 0x22, 0x83, 0x2d, 0x80, 0x02, 0x06,
+	0x32, 0x46, 0x30, 0x02, 0x06, 0x38, 0x40, 0x30, 0x02,
+	0x06, 0x3e, 0x37, 0x30, 0xff, 0xe6
+};
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
+	int ret, i;
 
 	tas2764->component = component;
 
@@ -585,6 +598,27 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
+	switch (tas2764->devid) {
+	case DEVID_SN012776:
+		ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
+					TAS2764_PWR_CTRL_BOP_SRC,
+					TAS2764_PWR_CTRL_BOP_SRC);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < ARRAY_SIZE(sn012776_bop_presets); i++) {
+			ret = snd_soc_component_write(component,
+						TAS2764_BOP_CFG0 + i,
+						sn012776_bop_presets[i]);
+
+			if (ret < 0)
+				return ret;
+		}
+		break;
+	default:
+		break;
+	}
+
 	return 0;
 }
 
@@ -716,6 +750,8 @@ static int tas2764_i2c_probe(struct i2c_client *client)
 	if (!tas2764)
 		return -ENOMEM;
 
+	tas2764->devid = (enum tas2764_devid)of_device_get_match_data(&client->dev);
+
 	tas2764->dev = &client->dev;
 	tas2764->irq = client->irq;
 	i2c_set_clientdata(client, tas2764);
@@ -752,7 +788,8 @@ MODULE_DEVICE_TABLE(i2c, tas2764_i2c_id);
 
 #if defined(CONFIG_OF)
 static const struct of_device_id tas2764_of_match[] = {
-	{ .compatible = "ti,tas2764" },
+	{ .compatible = "ti,tas2764",  .data = (void *)DEVID_TAS2764 },
+	{ .compatible = "ti,sn012776", .data = (void *)DEVID_SN012776 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2764_of_match);
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 9490f2686e38919a726e649884d9b6ad761493a2..69c0f91cb423986f7f0ded0b2160927f024d957d 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -29,6 +29,7 @@
 #define TAS2764_PWR_CTRL_ACTIVE		0x0
 #define TAS2764_PWR_CTRL_MUTE		BIT(0)
 #define TAS2764_PWR_CTRL_SHUTDOWN	BIT(1)
+#define TAS2764_PWR_CTRL_BOP_SRC	BIT(7)
 
 #define TAS2764_VSENSE_POWER_EN		3
 #define TAS2764_ISENSE_POWER_EN		4
@@ -116,4 +117,6 @@
 #define TAS2764_INT_CLK_CFG             TAS2764_REG(0x0, 0x5c)
 #define TAS2764_INT_CLK_CFG_IRQZ_CLR    BIT(2)
 
+#define TAS2764_BOP_CFG0                TAS2764_REG(0X0, 0x1d)
+
 #endif /* __TAS2764__ */

-- 
2.48.1

