Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DC122CBDC
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658228; cv=none; b=E6DptHEqlbR3AIsMKMSbJ6+1Llvhrw7/HWwIq3tA+Sa6VZQ5qJOip+l2JvH97xni3gbVQffZhHCezPUnjCKj5cXiF2Rg+8MnzVI4DvQycorosdSt8gdfqE6MtGOne8pWEltOeC9nmYow3qEOd5lGnYlXGhvWwSkU4fzBP4iUAT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658228; c=relaxed/simple;
	bh=ls6nJr6c5xyRlqW0wE9UzbvVJV/9x1W6y7H0wIut1z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HcQ0t+vMviCOFb4wfpag/EXr9q8kqRqg/WCJahheZ09PnuUjYJMxHMQX+xLJXFfxaWSYlVsJZ/unNOUHrVCD0TUsaYxpTayeXzbrDBOm0ueQrpqnrouiolCpnJobHbLauCKnB3EBC7iugub+5cVHyfKypMnSEvSK159f8RYWAfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7Wst7S5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7Wst7S5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223480ea43aso19289545ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658226; x=1741263026; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2G8IntqVZ/p0yVip5R832K06lAhv6smk3QugjfMN1I=;
        b=T7Wst7S5gTiEqbgiNwiCepRrtba70rro93Xp1GxqitZ0TTn/oJWSX6bsb9YiHYA7ZS
         BmRO2EYn6HNxkITwzIy+IKuAjsPjGtKAh18EpPMoBNUT16HtjpyyFnZ1I4aExFNjW1zi
         vjBAkQwwjIK3H3Zcy4MG7IZYqLSxdFxk7idbc4E3vjCCr4YNBUbOq2A5TZwxZQTk/Zp4
         ViyxCoaP2sTfCXcVwjmJfGBtkl4C8DASxTdMcPd70MQDb79MjQDhPXzlQNxrNXFvFDwr
         j9voutzH8kj7VZCgowMZZOdIO9BT0RZox2dGO+8meyHyLhzxZF2vCBErOhTn8OmhmGAb
         LkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658226; x=1741263026;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2G8IntqVZ/p0yVip5R832K06lAhv6smk3QugjfMN1I=;
        b=J/pWUdwxQPn4BjBNyWZpPlj7ES+Qe+y2T9w/kX9QPF/BIeF+kH0i2iMfa4uztxpD0+
         QXNXDiAcKP6FxX4qN+jwKEKW7XFQn2wnXxmRHpUg5vtig37UBfhojr85KRGJi3SmI/dA
         5P/hfzRRn4czJwH7XxoaBbGbXR72wYbn0A/5lzlEVSp7kAdxN7r+8ttiPPEnkpOpCy9a
         PFa/jnQDbkD9w66s4uha7bvJlNsHjzt0tDz5JJyWrH6HhvKuZPogBJdGbvUzxIQcwcrr
         EptyKwX7yngVsBMhamp4JN7sDh5LEagNFJbI54DiG6QgRfFEfw+DKG5PXVV0OZwJuMY0
         HIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOWXLPAI/UBU0tjcZPN/CBUNGkwVyIIeQBrSwgigw31bAhMLzCrczeUWaPbWwnmJ5Z78mv+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+wXv4bM+rtiPOGaRRfP8enFTRUyfx4rKLRcnkCGFBC2+js4Ij
	r8KDSyiWuJ/JAjLcFebuD2dl0ng78Ve26EsbuT4VVTfMcfsDZcO8EuDb+Gu5
X-Gm-Gg: ASbGncsUGuno7a5MpJTZ6RerNqga6FJ38zZiNrzIu1rS9RKJD3zJkRGesIJJI5jpely
	klTT0eBO2ulmgEjZLELCYg0XZAOPIK2cITETF6Qsc2vDEUZOhPnVGGI3vsQ34TbcrIuKPzTN3Gc
	0nm5xQbCCuWinZHMBuuNRg0UoEHcgDwfCPk4oodmM/4+ru0Acr1tsJSBLFk2UV84U0qLFKiyS6z
	UcVW/lD/TJGZsukQ5ad3PM6gKZBWjyzm+MleDDD0VKs7Te71FieMj0Y5cZCcKHKrH1NMerhQgKx
	fT7AGe/+msQygofL/U9oqV7bZO+obg/zufI7yhMZj+de0dvn8UeEZ8nl9Db8zXBsll/NsUpnNVU
	CGLzcP2ol004g8em3nOfT
X-Google-Smtp-Source: AGHT+IHSehyHYral5B9z7Uch5+OLoMeAHPJP+5CJ8NgoDW0Kj3SM8FYMoiHIT0RPXZr/7cRUWgoEeg==
X-Received: by 2002:a05:6a21:3d82:b0:1ee:ced0:f093 with SMTP id adf61e73a8af0-1eef55b57b0mr40384076637.36.1740658225781;
        Thu, 27 Feb 2025 04:10:25 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:10:25 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:39 +1000
Subject: [PATCH v3 12/20] ASoC: tas2770: expose die temp to hwmon
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250227-apple-codec-changes-v3-12-cbb130030acf@gmail.com>
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
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4581;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ls6nJr6c5xyRlqW0wE9UzbvVJV/9x1W6y7H0wIut1z0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk+17PVqvTWXM3RNyNUaG7/jnrsye/94Pm/puZnU2
 X67d0twRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABPxWc/IsCBAyeaT1ZXDBmL5
 SbOMJy8JiO43SDn+Rts4unNLlHjeZ0aGT3f3z9h+9+HnJR6bL242fV10ZEdn0/XXE83f75/2x2r
 DezYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2770 includes an ADC which reports the chip's die temperature.
As per the datasheet, the temperature in degrees Celsius is derived
ny taking the raw value stored in the ADC's registers, dividing by 16,
then subtracting 93.

Create and register a hwmon device to expose the chip's die temperature
to the hwmon interface.

The ADC is shut down during software shutdown mode, and its registers
are initialised to 0 on reset. This means that the die temperature will
read -93 *C until the chip has been fully powered up at least once (e.g.
the PCM its attached to is opened). Once the chip is put into software
shutdown again, the ADC will also shut down. The last value sampled
before this happens will persist in the ADC's registers.

Co-developed-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 102 +++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 7f219df8be7046912bf3ef452f75c17b5118bcf6..9cdd3470e9a04d5a5f801c3690d40f8fd131cd94 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -12,6 +12,7 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/delay.h>
+#include <linux/hwmon.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/gpio/consumer.h>
@@ -491,6 +492,94 @@ static struct snd_soc_dai_driver tas2770_dai_driver[] = {
 	},
 };
 
+static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
+{
+	int ret, reading;
+
+	/*
+	 * component could be uninitialised if the codec is not
+	 * attached to a machine driver
+	 */
+	if (!tas2770->component)
+		return -EINVAL;
+
+	ret = snd_soc_component_read(tas2770->component, TAS2770_TEMP_MSB);
+	if (ret < 0)
+		return ret;
+	reading = ret << 4;
+
+	ret = snd_soc_component_read(tas2770->component, TAS2770_TEMP_LSB);
+	if (ret < 0)
+		return ret;
+	reading |= ret >> 4;
+
+	/*
+	 * As per datasheet: divide register by 16 and subtract 93 to get
+	 * degrees Celsius. hwmon requires millidegrees. Let's avoid rounding
+	 * errors by subtracting 93 * 16 then multiplying by 1000 / 16.
+	 *
+	 * NOTE: The ADC registers are initialised to 0 on reset. This means
+	 * that the temperature will read -93 *C until the chip is brought out
+	 * of software shutdown (e.g. the PCM it's attached to is opened). The
+	 * ADC is also shut down in software shutdown/low-power mode, so the
+	 * value read back from its registers will be the last value sampled
+	 * before entering software shutdown.
+	 */
+	*result = (reading - (93 * 16)) * (1000 / 16);
+	return 0;
+}
+
+static umode_t tas2770_hwmon_is_visible(const void *data,
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
+static int tas2770_hwmon_read(struct device *dev,
+			      enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct tas2770_priv *tas2770 = dev_get_drvdata(dev);
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = tas2770_read_die_temp(tas2770, val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct hwmon_channel_info *const tas2770_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops tas2770_hwmon_ops = {
+	.is_visible	= tas2770_hwmon_is_visible,
+	.read		= tas2770_hwmon_read,
+};
+
+static const struct hwmon_chip_info tas2770_hwmon_chip_info = {
+	.ops	= &tas2770_hwmon_ops,
+	.info	= tas2770_hwmon_info,
+};
+
 static const struct regmap_config tas2770_i2c_regmap;
 
 static int tas2770_codec_probe(struct snd_soc_component *component)
@@ -707,6 +796,19 @@ static int tas2770_i2c_probe(struct i2c_client *client)
 		}
 	}
 
+	if (IS_REACHABLE(CONFIG_HWMON)) {
+		struct device *hwmon;
+
+		hwmon = devm_hwmon_device_register_with_info(&client->dev, "tas2770",
+							tas2770,
+							&tas2770_hwmon_chip_info,
+							NULL);
+		if (IS_ERR(hwmon)) {
+			return dev_err_probe(&client->dev, PTR_ERR(hwmon),
+					     "Failed to register temp sensor\n");
+		}
+	}
+
 	result = tas2770_register_codec(tas2770);
 	if (result)
 		dev_err(tas2770->dev, "Register codec failed.\n");

-- 
2.48.1

