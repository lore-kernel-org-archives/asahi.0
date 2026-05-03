Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1953B2FD0
	for <asahi@lists.linux.dev>; Sun,  3 May 2026 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777811038; cv=none; b=c3jiIVopz37PGub0iVkm0tkz31dJN9pLwxkkDrvTEU5CgZQG7FBCho3bY/Bxpz84C6YlvWkT5cXlk0ClweyN21Mo0DoWOBXFfEFMx0AIS9xeD76GbvDB5syitbeA/SsyIvHE2pQg/HbBCbV7btbHqM39BkcOwoCNfpOrIosgDQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777811038; c=relaxed/simple;
	bh=0BxDQKg9U+Ox+mI7tseZohlkvmKXx+ARG+YotcC1/OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mc6afmR2aYWCnnMR6yar78BP6DoYcqTikMWXZXcxN544iDZ5Nl3OV7vgFxjEV4fzzowKzUc3/FGoyA5eWnhiXES/gUYjF2+J0Ld6+JfYJhDn3vN9JK1fStZcKGmE56pZyzQisVo8Z15YEcU/uog5bElelmD7nv6hkgxJyT9JyFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7903LfX; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7903LfX"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c795f441ff7so2129297a12.2
        for <asahi@lists.linux.dev>; Sun, 03 May 2026 05:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777811037; x=1778415837; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARXgZHWlxADKCu4jNBhWPeDkQ/ONx5QPdnTv+mQK58o=;
        b=C7903LfXi8epZgpWZE1eDVkITa/SIlZ4NSsYuXEqO32jYAGXod3Y1yWRKy0Athdz/P
         6eVuVUrCbKxCdgeNsCIquF34EC9Fhe3QTsH1SISI1Wch8nn51nbY2ATPkqqOEhXgZj8p
         wLjbo9dpLO6ewypddr/tHrD9WzMTVi/YI37C0DoYrwMnohH+g7yv1du8FiXGh0jYXR8I
         I0oH61O0bs2pqNL69bqD+/SM6zpysvP/8ugeKhcAIMpqeLsDnRTB3Q5pZEg1ddDur6Xe
         WNQeSbvRGUnIy09PP4bTg0sN9aDdRwtOIMYg2cpPe7HOMLdYUaf3IRej3Xh0FWWweAdv
         S6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777811037; x=1778415837;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ARXgZHWlxADKCu4jNBhWPeDkQ/ONx5QPdnTv+mQK58o=;
        b=JLpHO7LaGVjh/RziCv2uIfpEnyLwjYBV1XZ1a9IKGoKmlegQQso646YR+ZuAi8MUIS
         dHymvS7SjdAonDiRSCTxDe/r+tRGJYe9VogAF2PbF6xK/td+Zdwm24inisYDpWNyQ2oE
         6AY6Txj8X6Suo+nw/r9DsznAKaO11gKMyJ+B0t+EWZH48vbVR5BlZlySqMF2EVy2TUfv
         EGLP41Xg2pOYgtPNwdjsiWIKZtx53uzSBumZVb7FK60zNFpAKUvZ91IyB6fD0KZRJm2w
         dtI3tl7xdqR1q8RG1B+DRfyfs+2RTw1NphmG5bki87gseybSD3P96Ciz/nURmKs+HZ4w
         AwTg==
X-Forwarded-Encrypted: i=1; AFNElJ/lIj/HgFssOw/DpzRFH+cJHbbp0WN0l5dvdbXMCS6m7jh5lpUbdk8rkU4/fvOVBD9Ro8PElA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv/QjffBDgHpybgeRoyqpJ7CYw1NxFe0K0bWS/JLKcuFRUuN6I
	pLorFURblOlU/yU2CcgGe7fiYFLwS9BbYEUot0GG750gER8KygI6WYrY
X-Gm-Gg: AeBDieuNGsfUHcrqz3iJPWkRoO4hebggxoFeDOEQ3fip59Rrmf2k71X4YVi32JoXnJA
	W7B8EkJb6GEiZLtDkZ6KeWK8qnDBW1riYvSQNZA0IdctvK0MzeMVQE4l6hVejHMzAauP5+93/V9
	TnxGGGaylqj4LiTDRLf+QOwMlkNRk6E6+dTMxkF9u/QqBQPc6c4OEQU2vyHXGh1r6j4kTbT5tKN
	I2KqZMTBYQvsXMGdvqP2YRhzaULPzhMQcoOJuiKiwIBAuqUiw4DsT+/Xetl9nufME3sFobkYd8H
	Tq78o6rWBNjiemuh88VGIPUc4fPw2J+PuDP88EuzJWkk5Iw1IvR/gLBECJ2OGBCGcB+X+/h7AJH
	BEaLPN2fLAkbHmjBV8otX8YyNww+oEYuoszTsczhPzb6UXDrj1KIw3DEcNDVOGzDK+FnDVCVYga
	97b/DPkVqi6ouZM0LBOLK+MOfOOzkGfZnk+ZTjKsm4cjd+fynOLwiPAv0wYfaIrYZRySDo5hXQq
	SJNNEft56Y8t9Fg/SkXvoe/bttU1xotgaRf85OIIJ+wyxmecQuk7vnYu3jbwfIY0AUBAxA3+xa+
	7dgca/Piy3w=
X-Received: by 2002:a05:6a20:1592:b0:3a2:f2b1:1ac with SMTP id adf61e73a8af0-3a7f1fb6640mr6397695637.44.1777811037064;
        Sun, 03 May 2026 05:23:57 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8023e6eabesm2098464a12.5.2026.05.03.05.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:23:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 03 May 2026 22:23:24 +1000
Subject: [PATCH v2 2/2] ASoC: tas2770: Deal with bogus initial temperature
 value
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260503-tas27xx-hwmon-fixes-v2-2-208e802be4ac@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2271;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=0BxDQKg9U+Ox+mI7tseZohlkvmKXx+ARG+YotcC1/OY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnf7XybWJ6/zFyWH11c8ktp00q+UwwVs6bY+FntWO/Nu
 K/8Y+nLjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRvuc/wh/tFQU+ZZOTfvb+Vvi/hD/0vpn5p9tIqg3/dKYXuEj2LChn+WTxkujB
 nw7dza6TFn9lMNBV5YvMl9PVqL6anhvymXbtvMwMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2770 initialises the temperature readout registers to 0.
This value persists until the chip is fully powered up and
the ADC starts sampling. The ADC then persists the last sampled
temperature during software shutdown.

The ADC should therefore never return 0 in normal operating
conditions, so return -ENODATA and mark it as a fault condition
using HWMON_T_FAULT.

Fixes: ff73e2780169 ("ASoC: tas2770: expose die temp to hwmon")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 50501bcbe916..dbda9f327535 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -633,10 +633,27 @@ static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
 	 * value read back from its registers will be the last value sampled
 	 * before entering software shutdown.
 	 */
+	if (reading == 0)
+		return -ENODATA;
+
 	*result = (reading - (93 * 16)) * 1000 / 16;
 	return 0;
 }
 
+static int tas2770_hwmon_is_fault(struct tas2770_priv *tas2770, long *result)
+{
+	int ret;
+	long temp;
+
+	ret = tas2770_read_die_temp(tas2770, &temp);
+	if (ret == -ENODATA) {
+		*result = true;
+		return 0;
+	}
+
+	return ret;
+}
+
 static umode_t tas2770_hwmon_is_visible(const void *data,
 					enum hwmon_sensor_types type, u32 attr,
 					int channel)
@@ -646,6 +663,7 @@ static umode_t tas2770_hwmon_is_visible(const void *data,
 
 	switch (attr) {
 	case hwmon_temp_input:
+	case hwmon_temp_fault:
 		return 0444;
 	default:
 		break;
@@ -665,6 +683,9 @@ static int tas2770_hwmon_read(struct device *dev,
 	case hwmon_temp_input:
 		ret = tas2770_read_die_temp(tas2770, val);
 		break;
+	case hwmon_temp_fault:
+		ret = tas2770_hwmon_is_fault(tas2770, val);
+		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -674,7 +695,7 @@ static int tas2770_hwmon_read(struct device *dev,
 }
 
 static const struct hwmon_channel_info *const tas2770_hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_FAULT),
 	NULL
 };
 

-- 
2.54.0

