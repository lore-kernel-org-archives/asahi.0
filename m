Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD0F3B47FE
	for <asahi@lists.linux.dev>; Sun,  3 May 2026 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811034; cv=none; b=lnB0EFc5ixDImI0BVzrIiZPizfD96As7ta+ARrmjZ5VX3qauoULC1J1x7gFyZelq166FQ7aCGEvmARLD/EHOS7hEFThj5N7eYsG5ewQAUafnPyvjkfX2L7jG6vbs8Ih6Ypa2DQY0N85fg6ZZQdy0fEFnmoKhdkfkprGIJBVmz0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811034; c=relaxed/simple;
	bh=MKnHF5kGPsCR4N7ujUtM10eo1Pl10rQIAl+7znui3Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOemXfc+XL1i+zt3BGReGn9qSgPl5TgmMblVBQ68rD+2QLK+lDeML5qBXHuBx4wyHZwFTjAG18qQF6+6tsnbb9PMnan9u9x8yKC/NhPNObdOunIZI98pIlzKyEzYhiobJegwvXNvEIW/+YxnhSOH6IsymZVUT69rIDfP2h5vfpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXsT5YaF; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXsT5YaF"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3653cb9c6f8so121974a91.0
        for <asahi@lists.linux.dev>; Sun, 03 May 2026 05:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777811032; x=1778415832; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRIl6J1CxzKB9h9sfgFUzYhFZthyT2nAY7hrklEwHCo=;
        b=sXsT5YaFtXByaE0q1J3TdIEjmi2/jJwIXNmTMA7+6Enkr5o/l9d4b8x0SwJyrNGrwX
         oKTpW9ZQri9zNQxvvbM0luKqZmQ3fN3kfn/Tcq2GNZ35TeoLZ+KLfws6OvATf7V3nIxZ
         lzozoFDADWR/IXkNy5bi9/8AeZVbDH+aC2Pbs0KwtQ2jodkgasS1p+Z+2la3MVE637+x
         C9m2OWT0nOMJygiVZCyH58cw1RVK9k3+SXUyS0abunqF5Bj9Yf8q0ZWW1twH4Y33HJOp
         AXEuURb+BNBV2ErTAls4QqVCHpmgXpfNOugq2A35MJpg4jlrxQdfldc+vchyzXP6c5ye
         iEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777811032; x=1778415832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xRIl6J1CxzKB9h9sfgFUzYhFZthyT2nAY7hrklEwHCo=;
        b=EGsVtQ2jPjFMibxUwYZUEcLA9EPf+m/Tj5BSDt/EYKU/afBZN8dChS8k5xO7Fb0shk
         prDW75FCUY1cmkC8+s6oT1S818YZ1vW4Lxokp32MmvlAf3QXctEepy8l77cNc7mbRw+Z
         +OMoNRbA89bPJsA1zYOPu8GIu2ruitD/y0Wt6wOEX5FrBAT2dffdVmJRhEVVvUnAiyNH
         HfxL6fZHUJs4ykNVLK63LDBcLbPNnPWUpGFgqblc4OCo2TwvjebCszSqRsQRDs8vvJhm
         laEgAJ3UGHlnTAvZeBj4QhKrQKlLbw6zDeDeWgW5m4ZwlS6C2SBOKUtPw4D+QKEAHExg
         EKIA==
X-Forwarded-Encrypted: i=1; AFNElJ+ChLxQIDOxT5F+1ZTMZJA3CyvYYB9XlYR3BT7vCPlWrOL9g2j1e8V3TwmzeIoHDRhuLflBWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzACdFCnQ7vjE/G3ICJF1Ceqa2oV2a8lbZ/4dTtrPa+nAoX/Uop
	s99XqzuwB0BsNQmW9EzAhUuxfJPm1W3UzBJAYhLBkbBKFNxIJfG9GFJT
X-Gm-Gg: AeBDievI6CD2r3AlaUCqm9uOdbcQT6xfHBrbYuLdacd4LPKUDC62OIYGRgaSpqYCdF/
	UO8m8k1RvIz8pX+tFZlw22kQC1kBvk1lxRRvMWt1K/52YLCjrG5GNdexoz5yGGEp4g448yoUzm1
	eUgdePTa3lISuE6hAljUSB2KyKzA6owL8A617e0dNUDe8zh/uftrVfmyu9kUEnWV+FGdTIBTVFY
	zV47asWxYvBJWXlp0FloOVjZLopQWIOJTNJFzykopfKDqeeuPPu0b5sBKWob1pLyukDNqoCkqs3
	/+kyXjEUEjnVEYsdCk20Kp2UkUjWJ8fakQxzC4xGFsEIVHgAbN0BXLVh4j6H/qqYeSQkhYnFxNV
	I49SZ1Gl4kMZH/wi7UvJ4jLPf2PVlJMFecDCrZO0aFs1VjHq0Hk96MxTcptfnzVnLAffdSyJJaR
	AZp59BSdBwHjJXVbqpO4Orxb0chsOSG8mOOl5tzyyqLGZm0W3WE9kcHq4x47eB+PrKixDycYmnd
	V0jZzuAvsrW46ulNTt8jA5gDF5pX5otSftd3hjxH+sCNTaKVdJcyPXy81sj/yL7DZyp1HnbcNQz
	rWHytEBPgZo=
X-Received: by 2002:a17:90b:35cf:b0:35f:b5df:456 with SMTP id 98e67ed59e1d1-3650ce7e5c9mr6377278a91.18.1777811031895;
        Sun, 03 May 2026 05:23:51 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8023e6eabesm2098464a12.5.2026.05.03.05.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:23:51 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 03 May 2026 22:23:23 +1000
Subject: [PATCH v2 1/2] ASoC: tas2764: Deal with bogus initial temperature
 register value
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-tas27xx-hwmon-fixes-v2-1-208e802be4ac@gmail.com>
References: <20260503-tas27xx-hwmon-fixes-v2-0-208e802be4ac@gmail.com>
In-Reply-To: <20260503-tas27xx-hwmon-fixes-v2-0-208e802be4ac@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Sen Wang <sen@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3388;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=MKnHF5kGPsCR4N7ujUtM10eo1Pl10rQIAl+7znui3Yw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnf7Xyvn3p16mylh1j2t59a2y3fGqgtVVeR4oneY2ZVH
 yAx5eejjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSf9GP4K3x+TtGrE9nK8YUL+A6HGq1c/PyYwLdK3Yx4/5LDyX0J6YwMm10f68Z
 +MUu4O02C58i1v7X/xOv3mTBVc24Uub5su8M8dgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The TAS2764 datasheet specifies that the chip initialises the
temperature register such that the temperature reading is 2.6 *C,
ostensibly to prevent tripping the chip's protection circuitry.
The chip is not capable of representing 2.6 *C however, and the
register is actually initialised to 0. The ADC does not start
sampling until the chip is powered up, and the last sampled
temperature persists in the register during software shutdown.
Therefore, any reading returning 0 is almost certain to be
from before the ADC has actually started sampling, meaning that
it is invalid.

Return -ENODATA early if the temperature has not yet been sampled
by the chip, and indicate a fault condition using HWMON_T_FAULT.

Fixes: 186dfc85f9a8 ("ASoC: tas2764: expose die temp to hwmon")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 35 +++++++++++++++++++------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 6aab6d2b7419..55211266927d 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -684,18 +684,33 @@ static int tas2764_read_die_temp(struct tas2764_priv *tas2764, long *result)
 	 * As per datasheet, subtract 93 from raw value to get degrees
 	 * Celsius. hwmon wants millidegrees.
 	 *
-	 * NOTE: The chip will initialise the TAS2764_TEMP register to
-	 * 2.6 *C to avoid triggering temperature protection. Since the
-	 * ADC is powered down during software shutdown, this value will
-	 * persist until the chip is fully powered up (e.g. the PCM it's
-	 * attached to is opened). The ADC will power down again when
-	 * the chip is put back into software shutdown, with the last
-	 * value sampled persisting in the ADC's register.
+	 * NOTE: The TAS2764 datasheet mentions initialising TAS2764_TEMP
+	 * such that the temperature is 2.6 *C, however the register
+	 * is actually initialised to 0. The ADC is also powered down during
+	 * software shutdown. The last sampled temperature will persist
+	 * in the register while the amp is in this power state.
 	 */
+	if (reg == 0)
+		return -ENODATA;
+
 	*result = (reg - 93) * 1000;
 	return 0;
 }
 
+static int tas2764_hwmon_is_fault(struct tas2764_priv *tas2764, long *result)
+{
+	int ret;
+	long temp;
+
+	ret = tas2764_read_die_temp(tas2764, &temp);
+	if (ret == -ENODATA) {
+		*result = true;
+		return 0;
+	}
+
+	return ret;
+}
+
 static umode_t tas2764_hwmon_is_visible(const void *data,
 					enum hwmon_sensor_types type, u32 attr,
 					int channel)
@@ -705,6 +720,7 @@ static umode_t tas2764_hwmon_is_visible(const void *data,
 
 	switch (attr) {
 	case hwmon_temp_input:
+	case hwmon_temp_fault:
 		return 0444;
 	default:
 		break;
@@ -724,6 +740,9 @@ static int tas2764_hwmon_read(struct device *dev,
 	case hwmon_temp_input:
 		ret = tas2764_read_die_temp(tas2764, val);
 		break;
+	case hwmon_temp_fault:
+		ret = tas2764_hwmon_is_fault(tas2764, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -733,7 +752,7 @@ static int tas2764_hwmon_read(struct device *dev,
 }
 
 static const struct hwmon_channel_info *const tas2764_hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_FAULT),
 	NULL
 };
 

-- 
2.54.0

