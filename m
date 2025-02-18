Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A821F22CBD9
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867881; cv=none; b=gB+e04oWY3lZVKBnFzyFKhFG+rP7D9mGCivKlVFzFR1i90OSP8RHcogI4Cg8vc8L/tzsCVNuNXSX+QCI8HJ8t3MykDIdFz8aMEC01qfTrr2c0jxXEQV6GJHvBtQkQFRC0q8dn0zruJpRGRTV9wCB1L8X2wGU0BiLs8aXbum+zXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867881; c=relaxed/simple;
	bh=ELHe9Gx9zBA1ZoHYutyVq2BXEWZuUYmtVmXx2v/ql6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VCGx3d/d8EoBcQaNRX2SftBhMJxDr7YmR5Ta4XVmPrIwkMSBDKQYyeySZ5NszOBURyEhUi4Qy4DrT1avDNglWgnQXOYZItfQveX23Cfg8rj7FnKt4+KY2+7h8qpqNsWcoy9sOZl5pkCcmWcuMyVXBGp3usQLOikHum7qitDC9qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vf9G5Gzp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vf9G5Gzp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2212a930001so47205865ad.0
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867879; x=1740472679; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsiNqfEcoONC0G46oo8Oc5GfM3qffuUL05c0mgTHX0Y=;
        b=Vf9G5GzpJHYLcWm/DXKQjqZOW2ILfCfhGxGAJxJAROn8NCRyT18TTBHc0JTrR7SW1N
         veLaQo+tsVTgqkoOE3R+RWg2BZ8pUxnL/4qYwH2mvAaj/7QNpfUjxOCDWlqznnMWgEaT
         G6wl9sFmbz6nLEpAmkAYZnSjwweml9caaiZZ/juom7yJDyH5ZiBlSaV2iqmfM8+TEgrm
         IOnt4Q5Bvmz2o6PFlfjeqe+/gKBP0Dvf72CXpK0wqfZi/w5aww5TWxKgxTAXIspTAGFA
         VNbMe46FWaklPda3dViazZ3LjxKIo3THzYyxqxmcD5vzfpkVFKasoor/m7ctGz5tZTR5
         y9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867879; x=1740472679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsiNqfEcoONC0G46oo8Oc5GfM3qffuUL05c0mgTHX0Y=;
        b=qP+hxWL81GZRZoZ6KS33mtcOIeSS83VznDjuW4+/OSLLVIBa58eqkYLMTKCUsQvd/z
         wUpYM8MgQxYrMYmjcRu26t3cYFhipgOoQZU38uChxBEsuRHIht4DJPnSv9Q12Rg8GYdO
         ltYMxJlv7LrYkvcHytG+VRwS+df++6Ldv5BkYRF/wr5bD/6JMJbo8ItEYvTez7EJ3cpP
         QMEnA8xfxkbTudww2buJoxeKRgdt2HbVlrtvVvX4J5viFarlc1OsRyhFozc/sPj5OYGl
         j5NJninRMV9Ox3+Bd2/qe8tykP0Kh3wr1LTdRjTR6DdZQHifdWWSK5vR38y6HfP6cKJO
         wanQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWasoySgZcVBRP71ODIxnk2BGZneg+y+ZIa7ofB/yHZDXQQx3P1lyAtHU45nr3h+EaIfvbgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQzUBaU09Uj4kZ2PefcTfAf9GS5R7dOnGuuABxhd1su+wbrRC4
	CYiPh8J4Dxxg8UWof5epu+ynmgQufZMCflv13yQXKSt0wlcJh7OS
X-Gm-Gg: ASbGncsTJoRHE4KhbcVY3L7uJvA48/2h4w0EkaG+5dkeh5bsbXLoCRyDRsN4AVtJBbV
	aP1yWm/izx5tLuUak2Levr4mdNVj+nJIdxlLT4MqGo92X/M4Hb5WPiJRixreS/HVyoXtPjzu97y
	tFRpgUuef2XcWC8beXkTy+5mRnJiPDS/qufzof3dDKvrCXyTHR1Kvtem+W4RrGtBzJ/F7n/iO2b
	qo5veUQKwBPAbme0hR/mWJAbKcm0Cl+ph241IvjcqCuTBMsXtOyD8oFBn9LxCBLyvU/g4LfTUF3
	1JAbXJNQXkTdOlhhz5IaHAmIs08Xcjn2jeJOtuZ0b5lAC2UU2TodVbExcrAdaOcy1ZD3gsRU4Ws
	9dX3tjYm0bA==
X-Google-Smtp-Source: AGHT+IEF+IZYeppWpFRiGDvRqgopdewlzuMHucHDa0g++fwr8JSYoodOUVLlL3ed58cPAPVhWKpGaw==
X-Received: by 2002:a05:6300:6308:b0:1ee:c1b2:76d4 with SMTP id adf61e73a8af0-1eec1b2788fmr4186768637.40.1739867879084;
        Tue, 18 Feb 2025 00:37:59 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:37:58 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:50 +1000
Subject: [PATCH v2 16/29] ASoC: tas2764: expose die temp to hwmon
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-16-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2705;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ELHe9Gx9zBA1ZoHYutyVq2BXEWZuUYmtVmXx2v/ql6o=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3BKrOA7EVb++Oa3vr/Ob7pau2ovsCzZrb83jUZmp2
 +jx+OPijlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACYiEsfwP6Nj//dVDSttff9F
 CZptM6xg2TC5/P5VqQNJ1//8L/539TbDf9+WDutNBTeKe7JfHRaaztz/x1RvX93KwiX6u87ELBW
 cyg4A
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Expose the codec die temperature to the hwmon interface

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 70 +++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index b0d016f85f7fd57bec36b33db5e8c2bd242b5b94..670c59e57997a7988af837bd58da695ad773ae14 100644
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
@@ -605,6 +606,61 @@ static struct attribute *tas2764_sysfs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(tas2764_sysfs);
 
+#if defined(CONFIG_HWMON)
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
+	struct tas2764_priv *tas2764 = i2c_get_clientdata(to_i2c_client(dev));
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = tas2764_read_die_temp(tas2764, (int *)val);
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
+#endif
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -882,6 +938,20 @@ static int tas2764_i2c_probe(struct i2c_client *client)
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

-- 
2.48.1

