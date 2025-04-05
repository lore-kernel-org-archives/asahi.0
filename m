Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DF6256D
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 00:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812061; cv=none; b=bVtmzsVyHpv3bHSy5zV4BT459zRvT2qsIea24Dbkj0YbtEYpAKUa1F71mL+5RA/vPR3wrdogJz0Ip4I43zN67XTrzAN8oyGcIJksNLzwgKmqblL+MPeP2qyQQOwMCK6y4WHCFqo4z/hYuqHp2cDE22F8TrnKPq52hjIsUWrC1m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812061; c=relaxed/simple;
	bh=ImA9e8Vws4XKPSu4pYoGIMJVwD0Z9+nohE4Whtn2W5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwxKodHniJV6k/2as2QWIXEMQSYq0JYCbx4qFvvgJZ0win5IcCRLNXwWKXUDy8Da+m4L7KrzQE5HrVINimEeFtXOn50QXcS3I4mXjbIX6jkuksyuN5fNgTUyrsU6T1em2A1S8lEOTR6PiwSUfkKKJXFYPKYAuEe7IxhyV0isuMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8GEAEqc; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8GEAEqc"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so2008705a12.3
        for <asahi@lists.linux.dev>; Fri, 04 Apr 2025 17:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812059; x=1744416859; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRCE2dnF02x0/kEyW0hycp8x5K9VlVZ2SMA4g24GomA=;
        b=j8GEAEqcbTNBvm5QBw9CAKS/ZUZmgmieY5OhoqZ2rmJnd/edC3u3t0/NXQklDDpRsQ
         f39B6Xa5p8GeAEVd8WUV/KqENEbudozNJzV1x/sU7VeFQK21MNLHNUw7uaZsOzZP+Hnt
         MzbmQ9wm13VXU8FII7xndKH983GV5+it6pvQKu1hhkEdFPEomm4kKqtY2kVUR0lCog4V
         8p5Cx2t+fx9eUK1iC/dKMM1NyEHYTG1pyT8jeYc2ZpURurvXYEII1LLK8Otw2HrgXs/m
         pqzSoHxpCnFm8e8GsmjsuCY4sg+jCTORt4Fd5GesL2w6oXztZOcrNPjC1LiGwT6jKB1I
         cA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812059; x=1744416859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRCE2dnF02x0/kEyW0hycp8x5K9VlVZ2SMA4g24GomA=;
        b=Gk0qmziej+JNuo5LduEbOevYnWf9w83tqutFUnAVcXzXybEXtPBvp5rZR88nkJaTB3
         9fzlNXcuqFTelI9ZxsjK2ySulmlP1rfkBas31Wd87sCZSqXvUGlqn/zAl6HqM2/rSMNz
         D6BT/sOwFf4oxmfPSiVXRXvHC2KEeM11ZoCSWoUh7ZhkaleCCWExbsocc9lWkAFbnI2h
         XD3PM+DqJ6QJj4p0JNdppt+gYu0bPS42H1ItTQqhzQD9Izxyatml+DxZmYYlj5SJDEIF
         b2wX9GEyb+VZx1JPRXrPz/PXNyO7cayC+ilRu4qH0nfFHHfZ9PY/m7tpXalvu+6WRVmX
         5sfw==
X-Forwarded-Encrypted: i=1; AJvYcCVUo547cFgr5Tv61VrNkyX6MXlA+lbwRBqFlV+culhBZm2ZOz5e+ni8wAf8u0USCb0xj5HmZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeJuoM7Kz/kX2u4aGoUFSoF6Y6zv+Ztjg5qI35kLHBGD9Bcfie
	VyXrfZkkYISzDJYP78lIPKe+Kkqv0HUErZepz4uEw0fjMBrtJmdr
X-Gm-Gg: ASbGncsaHARCtasnEnRn5ae35Z4Cb1z1pdIaxsmIfOGfnN5YmUnvNifJULtBM8Vy8Gn
	c1/vhivvec3B/WWJfkZ7u8CGQ4LvA7rrnj8kpsXUcOlvP/lv+vLsdEy0AtUPhxI9YUoSXvJe/C0
	4gHWg5X7QqqUb/qAt04uKpiuhTf6YXe0CJOgn7mdSZGhbY6h0Vd3ru56zCw2fXK+b+4tkOuj548
	vbWb847sBYP3UOtXbTtxu+xZR1I52Hwl/eEuhyhHf895BmVKe+HFCUOgTFyEIgDq8O2m5Q+yAgE
	ou3m9YGT7HSidlb1vBHIKwyXWrf1Jm8vaBxprDS34azwioDLN6zJFOSA9q7RUkbLiVpwGWS8OSR
	tvUGv5uwP5xHvrSvjY+/ECwlQReyO5ODZ7GrQ+Lk=
X-Google-Smtp-Source: AGHT+IGH5ZAq8VYyxXEWxigH8Q9NiVVkr4yfN0slCdqRIn+Rvtn+MXHj4ndcYsTaq2kbqgblUW3FdA==
X-Received: by 2002:a17:90b:534f:b0:2fa:1a23:c01d with SMTP id 98e67ed59e1d1-306a4899cb8mr7165481a91.21.1743812058739;
        Fri, 04 Apr 2025 17:14:18 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:14:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:47 +1000
Subject: [PATCH v4 10/10] ASoC: tas2764: expose die temp to hwmon
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250405-apple-codec-changes-v4-10-d007e46ce4a2@gmail.com>
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
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4733;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ImA9e8Vws4XKPSu4pYoGIMJVwD0Z9+nohE4Whtn2W5c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfStvUfPuPsT7xyzbbcGlSVa/X9cT/mu9SDGZv+vTCx
 k+5wlK9o5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIkY6zMyTJ2ovn/2N5YMjzeJ
 M71dhQ4szTlZbqUplbB+bcT3zQ1TTjH8lbqw3fPEtV0HvhldrVnjq/w8K9yQcdlH79I/DJwcy/s
 uMAEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2764 contains an ADC that reports the chip's die temperature.
The temperature in degrees Celsius is yielded by subtracting 93
from the raw value reported by the ADC.

Expose the codec die temperature to the hwmon interface.

The chip will initialise the temperature register to 2.6 *C
to avoid triggering over temp protection. As the ADC is powered
down during software shutdown, this value will persist until the
chip is fully powered up (e.g. when the PCM it's attached to is
opened). When the chip is powered back down, the last value sampled
will persist in the register.

Co-developed-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 89 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h |  3 +
 2 files changed, 92 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index e45b34fe4ffd4ffb902e33783e9655e858ce5bb1..45c692db7da5a79f725c3b25c3b523aa5f4e4f44 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/hwmon.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/gpio/consumer.h>
@@ -616,6 +617,80 @@ static int tas2764_apply_init_quirks(struct tas2764_priv *tas2764)
 	return 0;
 }
 
+static int tas2764_read_die_temp(struct tas2764_priv *tas2764, long *result)
+{
+	int ret, reg;
+
+	ret = regmap_read(tas2764->regmap, TAS2764_TEMP, &reg);
+	if (ret)
+		return ret;
+	/*
+	 * As per datasheet, subtract 93 from raw value to get degrees
+	 * Celsius. hwmon wants millidegrees.
+	 *
+	 * NOTE: The chip will initialise the TAS2764_TEMP register to
+	 * 2.6 *C to avoid triggering temperature protection. Since the
+	 * ADC is powered down during software shutdown, this value will
+	 * persist until the chip is fully powered up (e.g. the PCM it's
+	 * attached to is opened). The ADC will power down again when
+	 * the chip is put back into software shutdown, with the last
+	 * value sampled persisting in the ADC's register.
+	 */
+	*result = (reg - 93) * 1000;
+	return 0;
+}
+
+static umode_t tas2764_hwmon_is_visible(const void *data,
+					enum hwmon_sensor_types type, u32 attr,
+					int channel)
+{
+	if (type != hwmon_temp)
+		return 0;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		return 0444;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int tas2764_hwmon_read(struct device *dev,
+			      enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct tas2764_priv *tas2764 = dev_get_drvdata(dev);
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = tas2764_read_die_temp(tas2764, val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct hwmon_channel_info *const tas2764_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops tas2764_hwmon_ops = {
+	.is_visible	= tas2764_hwmon_is_visible,
+	.read		= tas2764_hwmon_read,
+};
+
+static const struct hwmon_chip_info tas2764_hwmon_chip_info = {
+	.ops	= &tas2764_hwmon_ops,
+	.info	= tas2764_hwmon_info,
+};
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -864,6 +939,20 @@ static int tas2764_i2c_probe(struct i2c_client *client)
 		}
 	}
 
+	if (IS_REACHABLE(CONFIG_HWMON)) {
+		struct device *hwmon;
+
+		hwmon = devm_hwmon_device_register_with_info(&client->dev, "tas2764",
+							tas2764,
+							&tas2764_hwmon_chip_info,
+							NULL);
+		if (IS_ERR(hwmon)) {
+			return dev_err_probe(&client->dev, PTR_ERR(hwmon),
+					     "Failed to register temp sensor\n");
+		}
+	}
+
+
 	return devm_snd_soc_register_component(tas2764->dev,
 					       &soc_component_driver_tas2764,
 					       tas2764_dai_driver,
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 3251dc0106e07862dd69efd69fa0e40c3858ecb7..538290ed3d92acea3322240a3bd09edd63694e50 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -117,6 +117,9 @@
 #define TAS2764_INT_LTCH3               TAS2764_REG(0x0, 0x50)
 #define TAS2764_INT_LTCH4               TAS2764_REG(0x0, 0x51)
 
+/* Readout Registers */
+#define TAS2764_TEMP                    TAS2764_REG(0x0, 0x56)
+
 /* Clock/IRQ Settings */
 #define TAS2764_INT_CLK_CFG             TAS2764_REG(0x0, 0x5c)
 #define TAS2764_INT_CLK_CFG_IRQZ_CLR    BIT(2)

-- 
2.49.0

