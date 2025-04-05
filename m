Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C0D3A1DB
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 00:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812053; cv=none; b=CrtMo8PGX5QfVLSSD0hkpuFU1wxW/PRHiGJcEdkP/XlzSjSdUZ6E4EP27shKNRgGl9ZPsDKffLeOFs1h+TmMVTFo11LjCI2UI5ILJnR9f/iM6RIuGaD8aUGR3+vQ/PW22lOU3SuPxH8HywlM5WXe8T8LrtsrJ1yA23cdZF2+oYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812053; c=relaxed/simple;
	bh=f9hqFNR5pFGPamyeTo2IoETw+s9xGL155lspcmj8+n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/k3VJDZVtbWPP7ZXt+YMee/utxGRULByApzYwbJjVLkr78bYYJ9FgqkSVe6ZieZVRfzArZmM3MZb59oyUvc0OV6/8CyW1C9mQHUZqZtGrOEr6vbe4wSZrYa/5lfFxb+nZjcTex9S9BJttBFgqX2C0bijfxt+ewixicFDvP7tyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C86ec26M; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C86ec26M"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3035858c687so1972782a91.2
        for <asahi@lists.linux.dev>; Fri, 04 Apr 2025 17:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812051; x=1744416851; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15OnMqFEK7r0tgJFKKKEOe7H/IHwlx+rTSEKVwVVHlw=;
        b=C86ec26MBedGFA+CPB95hNcb9ZmQeKbSLyHx8h2MTqNx+tvppWEjEXWQuy/CDXrYXa
         21LsbblXkyn87vx/NdW1AobRzffCMgkVF5v59CbXTGdfJT3eUsIUQZgDOukF7VuD15IO
         ezJ5vybFsxzuQLEzM7uVvZUe5LCTAOMpJgryv+fbTd98eLWxbbixXVoxhH/SrrjWa+oW
         higUrsyj/zGHavburija5SDZXGUPbA7MA61o0Ezedgsk3t0/czjneu8N8G5mdvwdy8YS
         cDKO5kLoZJh/HYd/wlEjcPAobuVXZFc/+4cBRCO5vQnUPriLI+BCqzrZA3y1COoMEIsO
         JkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812051; x=1744416851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15OnMqFEK7r0tgJFKKKEOe7H/IHwlx+rTSEKVwVVHlw=;
        b=aUaV7ALPYCp9TP0hCVxI+GB5hPvfAGwV3XHtFROxxFSuCZkDKNl3ClDhbt+PaZkAfh
         rb3laxhnsAu5mcB86ap8ww7rpMmCghQPZHxkaT2DOfEy+4bS4/gmV5z7YM2MPjDdQ1OB
         fI8EeGc+akWNT2BRru1NeQgIKMvww1m+/rggQz6Xc2eYCIfAC+V4MXG/EhkrsiZvCEnn
         t0yYuGf+O4TJKoE0BzCXZ7zmPsWDshAyMaNZXHg3OItdF40vn4Gn4mHlxKiyYduthDx/
         iQr1TIR4EEVybG+dvr7/HtU5KGCjekENmxdfxkR2bCk4bWVNhHuw5R0TDXrE2/hHXfeO
         MblQ==
X-Forwarded-Encrypted: i=1; AJvYcCVii1DEdpeBpKXsC/cq/Ra7zKqM7vC6yKKhahA1IZTjp/SAp1oABB+Rby62GuRvuelQRF/rtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ+ZZscpc6YEVGSmlD0Bim8oC81wlU9gPZh9d/cxUFe6GtRy+I
	t75FJ5WGbRqVyLICgZ4C9IdNyJy3GNhnkaIi36yCOomveDHNG9PW
X-Gm-Gg: ASbGncsp+D+gTtQlTM8Wogs6fSGK6IlUt1inNrYxR9H6TZNiis9c+K3fYYEJVy/0rqW
	pJ2G/gqiezHIUa8zh+vk9uLgLu5hr4MtpT8toYWHtsf45fhT35wd6QWFx2I1DD2shpYAv5QDj8x
	CgBqPJepHOTytMeVx3hTp9EYqCAo0FiDEdUC/Ku67XilbCMZNlcJGWjybfTXs6hPRLTm4TSFDpt
	Y8FP1o209hrEgWLfNmXYaK7H0LkLGrnYqMtdkbqi1WpKdSyosfSC7RAiPN9NBlwPnWYGMrtKe8k
	5zbNED8Hui86RcntQDE6kuWuOUIw1gWmXJVAr8H+6ji88y49qI+SzngU2j0BryTAFjuhLiWpE/P
	cEgaSC8WAfJl0lMYEb7ct5bVJRnSSTrBY80XvV6Q=
X-Google-Smtp-Source: AGHT+IH45CcEeTgpz0kCju0+B3dJDnuONtXDSTAAhyrqcoS/2e0GDkBgVL0QT7GSnREBJ4X9Ci6KkQ==
X-Received: by 2002:a17:90b:2d4c:b0:2fa:228d:5b03 with SMTP id 98e67ed59e1d1-306a615be9fmr5314642a91.19.1743812051316;
        Fri, 04 Apr 2025 17:14:11 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:14:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:46 +1000
Subject: [PATCH v4 09/10] ASoC: tas2770: expose die temp to hwmon
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250405-apple-codec-changes-v4-9-d007e46ce4a2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4412;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=f9hqFNR5pFGPamyeTo2IoETw+s9xGL155lspcmj8+n0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfStvUbgvwJvvtU/yUfvjI5cY/+xaxb5HLcOacuklsX
 91FgYhNHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEykdw/DP6uwesMMHkOb2GvO
 WjdfBMSFH5gfyPHpb3pB+dv1khtu7Wf4Z95oc0is/pNBb9XZ7I/rQ7Z6RGmeefqj78TPVz2Wipr
 WnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2770 includes an ADC which reports the chip's die temperature.
As per the datasheet, the temperature in degrees Celsius is derived
by taking the raw value stored in the ADC's registers, dividing by 16,
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
 sound/soc/codecs/tas2770.c | 96 +++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 806ad36397977c3fd350ba437b70f6bfcd814d29..8a286f96f8edaa3148c5b4d66575c7b7350f609f 100644
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
@@ -537,6 +538,88 @@ static struct snd_soc_dai_driver tas2770_dai_driver[] = {
 	},
 };
 
+static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
+{
+	int ret = 0;
+	int reading, msb, lsb;
+
+	ret = regmap_read(tas2770->regmap, TAS2770_TEMP_MSB, &msb);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(tas2770->regmap, TAS2770_TEMP_LSB, &lsb);
+	if (ret)
+		return ret;
+
+	reading = (msb << 4) | (lsb >> 4);
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
@@ -765,6 +848,19 @@ static int tas2770_i2c_probe(struct i2c_client *client)
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
2.49.0

