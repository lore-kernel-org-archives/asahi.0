Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C39122C35E
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867858; cv=none; b=LXmVu1oNCFo3VrK58+soMWe4FM4PmzmJc078/sRdyLAeu5UtADOCXmIqMMb5ukjnT/OTL4ynvAVI8J6appWqUDeqFuJHDD/adSgXrswxIv14fZZUyWb3l3YrCwDCa0IHYcJIXJ8nZl5IAzYTHzeAgSEGLK/S61e50zceAQWINhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867858; c=relaxed/simple;
	bh=R5CGUebK2zAj6O9/HHLGD450zIPtVaFw1f+T6NWzFVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkw6/VWH4Y6rlgNX6GvcXpcIxieD/ytJs+3qx/sDDci2ub2RjpFN9knvPwV3ULqJNHQYPRxfK6ERs48snZ/yccwPzRNf/UvAggK7CIdjrqKJD6N4hVO4OIsauJ0A5+sw9aGbhkxybrNQdCQkl2ZXypw3T+Mon0T1kSNSLnbHeOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6KKcVq0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6KKcVq0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220f048c038so63338525ad.2
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867856; x=1740472656; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSGUP3m54FlOrzw+5tfDV1Rd46XpJOc9r57P1WtoieI=;
        b=E6KKcVq0oa6JcAgtmYBlOgqUCtRNZ+fGULeAAIcWl7r2WnXBlrq2UMVU43mSen+yfX
         YPaGxfdqmYzyJSnoSuserI7D74S+HKv3TLA3/4SW46ixseypS6VMkkm1amvmFJmAav1u
         VNIRWAwzTF0PBhXSBogQOQci5bkiYFgBA+ZRw3t/pd5oYtk6yMSV7FLp2uwcXSKSGhdw
         P5KTUxvPT1D7ewIYeHTsgS55BkO/Ms7fby8X1ZHhZPGxA3vQ5GvU6aFi9Kz9ioZO5NQW
         bcxarpEJH2F4ajztBzPelVH9DO0pV3dvYa4PI0efK4G0xmHLV/+bbJ1tY3edaDLxYG/G
         DkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867856; x=1740472656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSGUP3m54FlOrzw+5tfDV1Rd46XpJOc9r57P1WtoieI=;
        b=V9q3Q/QU/h4moJlS4x5mUHbLA9yR2wuyOCkIBcpoxZzmr5IUfW1x3/2jaKrlyhTImm
         KwTTLV3gVpJ7Dqp15coJH8oZaXVrlUySyxp2YtQ4HmrDRk5ilI2EuXazwl7+R181U05j
         U6jH7H76N8j0gm1N/Mc1c2Tkl2l+bsG4BZy4MBMC4UrjDDd3AEpxPejvH25LLE8V7E17
         /lNGN3ncF0HhlC7kiX0VkOPcEhRoAw+KCHPRVdCq1jVBCeovrZFrrhb7vsPzq75W0aG1
         L4/Ek3Y4iwSj2ZDBNCw3Q9NdUYU+p1UhAOadcNWWd99+BfDE3RWXrAAddKkHx9li4x9B
         eQ2A==
X-Forwarded-Encrypted: i=1; AJvYcCVW1GKzMnetZT8t32VZzQMBGIu3ovVcRsPWVLax4y3VPRPk5gauQiJKQ/zLAE52q+mYmSQpgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQU2xlVBeeFN5eVCvUgvBsqX4CWH9QFUkPxdAWNnSL7/M5SkO+
	y0KMGkxD6uyXCa1bgd1Il6q+mWvt8h10H4481pGBm7bViVmJ080s
X-Gm-Gg: ASbGnctaWCIS0f4UAj3iDEm+7jyMEyMVIEyUU//HEGzTje+zsnY7W5YBclAGesl8CC+
	fKbjIlqR2ZOifdD83KpqUOFYb226RciAkfVjgvvXZXl++zinAo4/5OJrfJfPkYxfp+YS9UxS+Oq
	P83oBT0BVf6WbyKLySH4Pq+Jpp1mSCgDKGXHzsFBhGgjhZwpycrF5v7KFdhsDEY0m+C8vzaY0hJ
	XDHowxzRbN8m1wuqvoG/FTuzNboL+sWWWmUdtwIbfZSvR+UUmvC1sQ4jXqnXeUcUC7IzrqcIZYM
	KypgUIy6NQh4UarHIEkc/pDGEDGzAcpWW9N5+XX+AVeV81iJQ+NLsRuyGoQmtfHmJ7HRI3F5eDL
	t6COTVzEE5g==
X-Google-Smtp-Source: AGHT+IHinlUcJdepADETZgWdF6xVxTtPe3RJzl3iDPZR0TLKLeGYJs4/jm5yYrUcmNhdKp0WMMDrJQ==
X-Received: by 2002:a05:6a20:72a6:b0:1e1:9ba5:80d8 with SMTP id adf61e73a8af0-1ee8cc162e9mr20405530637.33.1739867856345;
        Tue, 18 Feb 2025 00:37:36 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:37:36 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:47 +1000
Subject: [PATCH v2 13/29] ASoC: tas2770: Export 'die_temp' to sysfs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-apple-codec-changes-v2-13-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3106;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=lkuBo6XHksMD5HcdiK6pdh1/+6wNjBzUXd1OHHJ/WQM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3BLn7Z+4VtPB4N2MnK1OF0NPLuWc+UvU9ssedktF5
 9ZLWY49HaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAExk7g1Ghve2jpuUrMUa408u
 Dp+ns168O37VVnkxv4eaWQnte5M0bBkZHn3e3WO+V+gM59xMkZfJD1qr57+P287hljx36Zsrd9g
 beAE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Export a file for the readout of die temperature measurements.
As per the datasheet, the temperature can be calculated by
dividing the register value by 16 and then subtracting 93.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 57 +++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 7f219df8be7046912bf3ef452f75c17b5118bcf6..84066884d36be8d41d83bca5680e9f683c420d78 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -20,6 +20,7 @@
 #include <linux/regmap.h>
 #include <linux/of.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -491,6 +492,51 @@ static struct snd_soc_dai_driver tas2770_dai_driver[] = {
 	},
 };
 
+static int tas2770_read_die_temp(struct tas2770_priv *tas2770, int *result)
+{
+	int ret, reading;
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
+	 * As per datasheet: divide register by 16 and subtract 93. We don't
+	 * want to divide just yet though.
+	 */
+	*result = reading - (93 * 16);
+	return 0;
+}
+
+static ssize_t die_temp_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
+{
+	struct tas2770_priv *tas2770 = i2c_get_clientdata(to_i2c_client(dev));
+	int ret, temp;
+
+	ret = tas2770_read_die_temp(tas2770, &temp);
+
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d.%03d C\n", temp / 16,
+			  (temp * 1000 / 16) % 1000);
+}
+
+static DEVICE_ATTR_RO(die_temp);
+
+static struct attribute *tas2770_sysfs_attrs[] = {
+	&dev_attr_die_temp.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(tas2770_sysfs);
+
 static const struct regmap_config tas2770_i2c_regmap;
 
 static int tas2770_codec_probe(struct snd_soc_component *component)
@@ -517,9 +563,19 @@ static int tas2770_codec_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	ret = sysfs_create_groups(&component->dev->kobj, tas2770_sysfs_groups);
+
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
+static void tas2770_codec_remove(struct snd_soc_component *component)
+{
+	sysfs_remove_groups(&component->dev->kobj, tas2770_sysfs_groups);
+}
+
 static DECLARE_TLV_DB_SCALE(tas2770_digital_tlv, 1100, 50, 0);
 static DECLARE_TLV_DB_SCALE(tas2770_playback_volume, -10050, 50, 0);
 
@@ -532,6 +588,7 @@ static const struct snd_kcontrol_new tas2770_snd_controls[] = {
 
 static const struct snd_soc_component_driver soc_component_driver_tas2770 = {
 	.probe			= tas2770_codec_probe,
+	.remove			= tas2770_codec_remove,
 	.suspend		= tas2770_codec_suspend,
 	.resume			= tas2770_codec_resume,
 	.controls		= tas2770_snd_controls,

-- 
2.48.1

