Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5629E22CBC4
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867865; cv=none; b=G+6HXdXeGddPqolpmblsoXrBw/FxSaUzFkaGZJIIgITtPRWgxqYJKWkOk8ktQO85OLmndvyllBufBShtxy/6N4Fle5ZArFSUMJduLjO30sO7aq7yoQ+VSCW3qIEe8f9HYq6mY739rZXSli7yIYLpAQ25EiDx3ZP2mRgtsnQ+9CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867865; c=relaxed/simple;
	bh=C+X0x7uIf65/mbXTMCE86W3v0h9GaMeMdchW1VENrnc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+M/SiI/LFBypMkau3h4xYrOHW02YEkCD/EpXbuKUloO93lMmz4AesjZbQMBny7yy7cw5l3pqr/7P7ekxnUeEZjvXLHd9GKnsduKBMbS+KpQ9Wsm79VkXwNvuCdbXn9AklIghkjHKNraBzsZJc7oIjI/91AmoiPzJuxeoxIi9Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLbQMlDS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLbQMlDS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220d398bea9so71346665ad.3
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867864; x=1740472664; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZkZf98xzuFsPo9rZYpEWNft19Sn7WJ32Cdi1OtVNJs=;
        b=YLbQMlDSzjNqvEgIsZ+Gw501tOaXozfTOEtiHWMVqK/D63m14r5pmQnjpF4alvVTJn
         SPEf30ehSbm2pQZ+dUEAD57kMx7D1Be8b7mTHhNAFqMYWOH85Cd9lGRGVY+S/usM0/hm
         lu3WuvmUTOlOytOaBZwaXh1jwavQ2rp59IS8EYQxDOksZfb/MMBD+Cg2+Y9ICuahqOX7
         0aFLjpctQgn/SON5XCEwQxl5KQeHZbQDkQ5V/7/iB42cfe7Y3bh5JHzHi3QGleoNCQsv
         TjH77BIhTIdqRZx7XtqZyKq55BUKljcFO2Z4voaZhYunF08tcpYBMI2fumYx+hbBlNQx
         hSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867864; x=1740472664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZkZf98xzuFsPo9rZYpEWNft19Sn7WJ32Cdi1OtVNJs=;
        b=MxnfBO4fdRkV79QxDmglLLV7Ivruw+q8n9ryrdwBKzqFECdJ5JMl8SoFYm6yOr0+9S
         DtuCDiXMUqCa9B091qY2WgbFaCgDlFzMZ5oxRMupuUB9ibWpfQ676pReoMWc1F9PhYPy
         dKc1sCZh13ibfzM8VAGfldKAMs3Pv/9yyI+zlPx+ryo7th5eRWjJr0fqikzy1MqLnEmO
         t5go9fkK2OKVPVcfUd5m+8gNcb+OwYAUpyaif3JB6ydYEjyw0OvbZcovkl4guvTpfL/Y
         cDTS5QWPXIOJk0UPxpe3Qa2eHxbKl+PBi0Ve5WSdxaomW2P44VZAF6/oX9XqafRihv34
         D+DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx+uOsWS6/1O0P3wJjraYRgD7y61kEgIpl9Whrqfd56ci5g9SL0fBWeM+lsI+UrGBWjnbfSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLru3O3lpmkJTjLscggFzWp2yWlwfjyUje1KgZfudRsogo7zUr
	wXz3ZIsWDO0+HMEmCXlPwnJKw2PZXOQfpNiO1GHD4cA74vfY/8P+
X-Gm-Gg: ASbGnctts/MQn0XfQFQ7EMsSnMeUeKOLhiiPaUadig+9lMDq5o1AM9S+Or2v9CxEV/z
	uTjqeGFt8V5IPpd2M2JKCeeFjTzUqsUkssSgjBUtd7uIUUVw8b12mpXp20N0aemADHkVs2J1GIW
	2cANXNTbGKdZfvOl1quUG8TSCL3tdBa5gTDSIJng3okNlj0RNCTxHgxRkP525ZjY3EjbzJiW47c
	fzKV28WtpVEmHZ4DnKi2fchtbB1AgOwknXoSZTkoP3DnaVYQtiIriC/YfswfXbPZQbfgS69Bdgb
	83/4d3CqBi4sg3aP9I7/oZJIidSZ/PnPUQIY3DPZOvQ+3ZUZNhKRaM7P6n8lfcYroW45fBB7YGv
	JIPatZPmqiw==
X-Google-Smtp-Source: AGHT+IHnEmsdRs0QDQNqmFf6dAJT6iEkiGCVIADqflKn44jjikjLxu6ge9+xE6rbdfiUgc1uqiS8dg==
X-Received: by 2002:a05:6a21:3287:b0:1ee:66ce:16f4 with SMTP id adf61e73a8af0-1ee8cbfe3f6mr23976267637.36.1739867863817;
        Tue, 18 Feb 2025 00:37:43 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:37:43 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:48 +1000
Subject: [PATCH v2 14/29] ASoC: tas2770: expose die temp to hwmon
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-14-932760fd7e07@gmail.com>
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
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2665;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=C+X0x7uIf65/mbXTMCE86W3v0h9GaMeMdchW1VENrnc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3BLPuG0q9yy6/fZmd3+EAu+GtU/Dbj682L5v0QV31
 j+H4pfpdJSyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjARYTOG/x7tj36wGtt9vjnr
 6e8XtYfTOY4EnTacpTwnrt7+wgn/w7oMf+Xc35/MLVDkbjiW6Bx9z3pt3LuKlozZ57b71rBZvRK
 7xAIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Create and register a hwmon device to export the die temperature
to the hwmon interface

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 69 +++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 84066884d36be8d41d83bca5680e9f683c420d78..fee99db904a5885d740c1cfe8ce2645a963c6e1d 100644
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
@@ -537,6 +538,61 @@ static struct attribute *tas2770_sysfs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(tas2770_sysfs);
 
+#if defined(CONFIG_HWMON)
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
+	struct tas2770_priv *tas2770 = i2c_get_clientdata(to_i2c_client(dev));
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = tas2770_read_die_temp(tas2770, (int *)val);
+		if (!ret)
+			*val *= 1000;
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
+#endif
+
 static const struct regmap_config tas2770_i2c_regmap;
 
 static int tas2770_codec_probe(struct snd_soc_component *component)
@@ -768,6 +824,19 @@ static int tas2770_i2c_probe(struct i2c_client *client)
 	if (result)
 		dev_err(tas2770->dev, "Register codec failed.\n");
 
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
 	return result;
 }
 

-- 
2.48.1

