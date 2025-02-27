Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4560022D4D3
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658235; cv=none; b=WdVUyImoBfoOGgM3h7KcfbI0HCPquyrJf+14MtSxQPyvlOx7pY1U3A8he/sm2Z6GGIKisEpWKU2Rf4eM+kpf59/qOtfL/rjAfZlSdgDJ4DNWKomoHtkzG9EGdRawGMYyT5s/DlVUNBri74F7i1UkQ0sz4r0dA7qg72syEfq4hVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658235; c=relaxed/simple;
	bh=qHvfUmN1R+D3X/0kel7hIGI1UTjzGT/2lxJjDvieRlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NsrBGSRL7zgwNYlOPNRB8xJzorTyhBMX+9QeI5Wc8ebpYR4dqYadAv2W8BFKe67QNr54ZG9LfWPD0mxRcixtZF1/li+VqYS4W65nZ8mObXkCf4AjGSQmNKbAkznvRem0OmsHtg6LlrsohheeDLeiw0bwwArxPwfswpoC998LXa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEi4HK3R; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEi4HK3R"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22334203781so26126015ad.0
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658233; x=1741263033; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XvdRl0ozFXSTGZyxyJz3ob8mwey7ewvJ2oCOTD5KBw=;
        b=OEi4HK3RLfDnOPbAZ43NC9UTUKMAIePUjbgNeg2YdzHXSWL6yJqcUAIlOn9SiC2rwL
         USoQBHXfq357rXxdQPmHVBLOePEarmmj8MrVBfZIxQ9x5YyHL34cCR3gGCYZDCyw43nD
         FSH98NGqrKDZZoi2Z/VwxZ5Rxj6yCbvPqNyy40dceJhcR0VkdpOFvj6UVZWx3mBjdd6D
         UJMSs43tdu1CfjMoLg89BZolhkhEhfflvI4RWqll/cMG04WG6xr2qLbTXbWIrxE7an/S
         TsKjPO5EA3qOYZyQ0ABQzYs8/zRRJPykoyPcZgErrrrB8/JWbTCKyXJ9tNgx5Wto1lIU
         MR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658233; x=1741263033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XvdRl0ozFXSTGZyxyJz3ob8mwey7ewvJ2oCOTD5KBw=;
        b=TvrHyRxHBIyvy1Q14vfxIHD5cF3SxOOqfC+Xacoe6PtJxKyYhkQbxj6rQBSWJXDJz7
         9JF/1cgswib2dkIwDDusJe/0RAW60FNLs5i4s7JMkIRFb+sYkPoBP02JYo7qrNp+p28S
         91xMd7RVC/NZW8V6hoOZcGmvyFG014xb6vAs0Tcpf034ksScSQocic3Ifu8nyC4NSGgG
         pJYb3Tit2ckNjz+MKkY9mMLf6H+pl4ouNbjULTHlLj3Tzn9znPbDOtqy53VHHTFBLKKv
         nan5k6gw6pcQpYYP1biEJHC2Zgtb8/Z5lZO5JHdsqCtlGl0g3E7WQRixnLmQ8U7i2Tzk
         /njg==
X-Forwarded-Encrypted: i=1; AJvYcCXlMGMJV5jVc0LT5P76FwdJlKpD2E78XB8Zu4JJZsA8PZGTVGslhy3NxXwi4Q9gej+8x2xmyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFWoCjnAUWjOBhDhCOMGKgya3StFQ4iF29eKrJWtqUr/8hNBc2
	TYS8sX05mn0ZvCdwqGgkCl0ONIHWNTkxJrLqJrOP9lUnoGB+ibU5gQ8YAr8+
X-Gm-Gg: ASbGncubkSPOLKcUU9UxRxn93TFJaABKUrfGGZD7Nngp+/YpQSMcXr2VfmMmbZLwVWu
	3YYfZDy+Sa5KHTsUmyyxtueL6/BodkNju8fgahPiu97eAnPj37HI+/DlQV4GY9HE4Gt5600vT6H
	UTg/Ec1eFzp3wvsDux09LzdDkn72gI8S6b8HSfh/dpXUSqDxZq9256JgvtvxvUs6nY9R5OT9RSs
	OLe1fF+rFxH5sjlXswSVQzGCJfU72yfX/oqlGTpH5VSJU4XFgHZh7zxgxkkhjLMSZEdN45hvRXn
	G94DJNrTyRZp5UkzUXxgJaPg11CaQ9q9NdPoxx4MhQ677UQ8MtnrGZ0Qux15Wm2q3qBl83csuPV
	8lgnDR9npyScD7Xy0rmQu
X-Google-Smtp-Source: AGHT+IG1A7+2aRVuHKZ/d1JszoVfWOrdXpScsWQdnCG4oF1+hO3YTpEnAhE8uXpIffsTcWF0ln1teQ==
X-Received: by 2002:a05:6a20:8402:b0:1ee:b5f4:b1d7 with SMTP id adf61e73a8af0-1f2e387ef46mr4577116637.7.1740658233356;
        Thu, 27 Feb 2025 04:10:33 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:10:33 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:40 +1000
Subject: [PATCH v3 13/20] ASoC: tas2764: expose die temp to hwmon
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250227-apple-codec-changes-v3-13-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4898;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=qHvfUmN1R+D3X/0kel7hIGI1UTjzGT/2lxJjDvieRlA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk8t2cbyPE5qxrTuhu0bDHv+flROcNqiGCwtyXVX8
 vcpg6VOHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzE2YWR4VPsljXee0+eOSMz
 7dC+hZt2O62QK9H/d5ZlTe6KmRLrONcx/OEQcu2cw3HA8UKfckT5vej5oT6TEyMZ7nlsXPXnasu
 yci4A
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
 sound/soc/codecs/tas2764.c | 96 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.h |  3 +
 2 files changed, 99 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 0234a41deecd62e860c9d54a7a3206abc0bdac54..b42bd5a50ee566ee83755d4ed7e2071b60951457 100644
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
@@ -578,6 +579,87 @@ static int tas2764_apply_init_quirks(struct tas2764_priv *tas2764)
 	return 0;
 }
 
+static int tas2764_read_die_temp(struct tas2764_priv *tas2764, long *result)
+{
+	int ret;
+
+	/*
+	 * component could be uninitialised if the codec is not
+	 * attached to a machine driver
+	 */
+	if (!tas2764->component)
+		return -EINVAL;
+
+	ret = snd_soc_component_read(tas2764->component, TAS2764_TEMP);
+	if (ret < 0)
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
+	*result = (ret - 93) * 1000;
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
@@ -848,6 +930,20 @@ static int tas2764_i2c_probe(struct i2c_client *client)
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
index 4cf0f7f112d6c3002203fa32e900efd640ef3f22..4a419c11d4b08eebb915762db00af5c06ff3dd42 100644
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
2.48.1

