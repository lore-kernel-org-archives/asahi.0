Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0BB1A0BE0
	for <asahi@lists.linux.dev>; Sat, 25 Apr 2026 00:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077878; cv=none; b=exvrwPsuPRMXctMQIMYBPji5bparXL4ePL90+LVmgOCSS/5A4mjxzeo7fOqXrKj4/oOqAzPkauL/GmxYs1MHAn20dZh0OZH0qxmQ++t+f2J2HNzh1X7yQBbkjXGfjXQgqkfxRk2s9UOw5pzWEiYO3yUx6vEEaVbfCJtM3ceKzTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077878; c=relaxed/simple;
	bh=e4tOpu0LbNNGF9iKe0Fx6Ayli0jihvKbR4O8mx1wFnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fp/tmAH7fCPooDrsTGhPu9pMKTjLXNfn9vWopYaE90LpjS7QZFdkUdEhnlgxptEbt1+JnPsHRW0M1s3B7xmHlDmRzUEseSTJN1L/HOXfh3Inp/3q7wGIZ96w0Ojw6r9PC9nmlQJfnQY6ieNOysDIpAt+zjtC68dSY2ECkJHpRvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huA0iIP6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huA0iIP6"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82f0884bcfaso5783295b3a.1
        for <asahi@lists.linux.dev>; Fri, 24 Apr 2026 17:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777077876; x=1777682676; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeLK2D28kWbvQeOXcDdKQJ3UJRWDE+NdXZ6b+JbOcrQ=;
        b=huA0iIP6YlIDR7Wnx0HDVXMZd8L6vC1I8SM+k6mS3huiG4FPSg377DIVAlRJ3d0Zvy
         IQOM04WG66FVscU1Mbn8FaCX8JoMA3cJqmFOCBomaTqQkW1DJ2vdD9SwInKYUP+GxxQh
         JFFDWv782GnEytgVH3nRBiU22tuaLMNeC/WkDIsetlYG+nsUQNNkhSXC0QbPqPPwE77I
         LxnHRSeZXtIJTUntkWTJGBN6xTijY8MHvrIJSL1y71Fe5dv7pQTKMHJIwPT3PjUlMxi5
         7rgzZzLyiLZw0sE15fLa3euqTilLbluEEfxZVG8wLwA1Czp2vVc34dVfyvQd3uXSi9pz
         rBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777077876; x=1777682676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OeLK2D28kWbvQeOXcDdKQJ3UJRWDE+NdXZ6b+JbOcrQ=;
        b=iep2ce8k6NydFQCy8gM/7+gnYK1tW35lsPVJxuN6iUUiCTrwp2K5AT7Lm8sWZN1QAu
         rZLst3Fj4IjwEg5kyfW7n4qV0BoQ+tkfYUdsj6Us7xGNKv4Q9UPQKprC1NttBI9UV6Q1
         x/cO5Nj8RWr9YESdeGH1+Ovcwx7ndi1yKyTL3y73JVURsdLo0/an5j/3QRQKnpd5mAzH
         3HnYzFHrfWDXG23kLIKi+rAKcxaLGg3MowvOmkgFFoOc0eN5/R58hhFReXQfel3ZOvi5
         i3Qly4TJqxBsc8OObq8K805DpW+3/JJA/Fe1r9LHqvC05yC8B4XULgpRfSrH+HwMuXjh
         W8Mw==
X-Forwarded-Encrypted: i=1; AFNElJ+MxqPpgDDLV0C9d6etY0tJMf1RYcPH+EElOPhXJPR1WlwSEYjBLNIWHb9KLznk9XhlgszQ/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YysldFijU0AtEYfNZMjSLycj+RgL727MEA82IMCDPZe6fTAPs+u
	oFKZSa5Od6oKFHpahrrPx8iumMyR/UgTGePNEOz5H0Q6sJ9i13/2z4GG
X-Gm-Gg: AeBDies8oe9w3SgSAx92FD3G+Wcgd9AR+kDLnuQUIrw9Sd86uU8iRW++J+fBNIX8UT0
	qnoAJjAwrY2zBpSeBZzbMNAmaEKzm8V3dgjeDwcYNtJd+zayc6MtyugKZXM0tuEjuWbBZP4pNVd
	U1O8oZkYVmRP3QKxrKP8XxFZ4Prnzpei/x0tXqJwJOpz9g3o051xELUXiZ7llxnuv/ZOtZjHgFF
	j8CUYSPkMe1SybaMpKNM+u+RykliEyPjOte7UlwjcIoTJiccta8Bi8L45J1n5sKP2aubKy6ZcRW
	gNWg9bgvImkt4ByXT6ra4zUvsmzByVhigEtDtJ4W5U/LD+v7PaHl5c7ZSsjZISgxCcIL/+IOKAs
	w74cABn3pYobSYgpKlY4AGrEXb1vhhx0wkN1bVFHzwLzaAxM0HIfbd5hLl4JzlMyueOvMUU2oG6
	ljixXTWeRPn8/ILkM7QkJFnKnrbOx+Oj0PXCpTndzy29HCJO0UQ+8N9Pp4HjJhIXEOeXu8D5jEn
	veuDDRDTCiJSiHAT8nEBAuMQ3H1/UjglAS3i7tw+7mmPiIEIb8qVD8+mSv1Ma2pUMAD+B6qFMlc
	FkT08aMDUg==
X-Received: by 2002:a05:6a00:2d19:b0:82f:425b:4c27 with SMTP id d2e1a72fcca58-82f8c8250a2mr37208949b3a.14.1777077876149;
        Fri, 24 Apr 2026 17:44:36 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24948385b3a.57.2026.04.24.17.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 17:44:35 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Apr 2026 10:44:04 +1000
Subject: [PATCH 2/4] ASoC: tas2764: Deal with bogus initial temperature
 register value
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-tas27xx-hwmon-fixes-v1-2-83c13b8e8f54@gmail.com>
References: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
In-Reply-To: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3008;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=e4tOpu0LbNNGF9iKe0Fx6Ayli0jihvKbR4O8mx1wFnM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlv+FKqNbfcPK/2YM5fxbj6rjeBjbomUkcUhFKE1Dn2+
 hksf+PcMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOoXzxkZDh/usk3RZH/00ejuixtLAiMslK3v75M/fcRx6rylKha3DjL8r/WPe/t
 v3fXqU4UCjq83CCkmaD2s4c24fv+UXPb0eKEeLgA=
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
 sound/soc/codecs/tas2764.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 6aab6d2b7419..df21d98ee274 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -684,14 +684,15 @@ static int tas2764_read_die_temp(struct tas2764_priv *tas2764, long *result)
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
@@ -705,6 +706,7 @@ static umode_t tas2764_hwmon_is_visible(const void *data,
 
 	switch (attr) {
 	case hwmon_temp_input:
+	case hwmon_temp_fault:
 		return 0444;
 	default:
 		break;
@@ -724,6 +726,9 @@ static int tas2764_hwmon_read(struct device *dev,
 	case hwmon_temp_input:
 		ret = tas2764_read_die_temp(tas2764, val);
 		break;
+	case hwmon_temp_fault:
+		*val = !!tas2764_read_die_temp(tas2764, val);
+		return 0;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -733,7 +738,7 @@ static int tas2764_hwmon_read(struct device *dev,
 }
 
 static const struct hwmon_channel_info *const tas2764_hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_FAULT),
 	NULL
 };
 

-- 
2.54.0

