Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ECE1B6D08
	for <asahi@lists.linux.dev>; Sat, 25 Apr 2026 00:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077889; cv=none; b=I98lwTkuJ189kT3n5ncsmTdGR1JMaJuH7pKVAK87+2mJBXmQ8arPsopFpNSZIOTNM1aiiACrA6nRAD5sFeQwcDHb5z7h1fdqcT16lBidkwrwmlVFWZB2CAvHsuQuj0J25l6LF6X7zwrjR2T91p5gmahuQDnmlrF+qtjQ6pQ9bPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077889; c=relaxed/simple;
	bh=F5yeh6pdK6Hs7beqeyQj/TVTdS2YepfCTkinI6k7d80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tcPBGmIku/locohLZOHcJyni0FbLY6q0y2smdjJN/mcsq2du4ZYQ+eU5/efrtQVp1oofRRbEE5hYnpPKRl42+Rt1ViWhXm5xXWsyJGSXjc+J2VmSrl9JPfVT1U7tCxPN/xvjSxSUHy+l7vML1KlFNn473+qnFBi1/qx4xbi254c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzB6SyYd; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzB6SyYd"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so3199820a12.0
        for <asahi@lists.linux.dev>; Fri, 24 Apr 2026 17:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777077887; x=1777682687; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hX2/JA8GK9hYTduQnxjY+1BP+OMuld9S7rTvEbat1fM=;
        b=EzB6SyYddaV0w3+ERkcNY928EzJxMA7yNzyzUapYFz/JgsS51UAY9t1aZeqLiR5s3u
         RrCvGIJjXo0GHBw6QCOpkmHg3o84cEbb9S8n8kd2QYydou49iIjJhOXc0MYzCtc9tWwf
         aD82m+qZwXX+KRxnFO3W3GwPuLD+zbcvfWbhiN8ZvtmzhcMP+QdEqi2hGDZArK/5XC5d
         tWSzMXQOYtgTvWQGPPrLwv9z0GC6LXIvjLo613mxtC/MRp29IXOeZXnI8BDsK4KDjMSF
         6Bop+K1TW12qBmfaozDnHjgGBjc0bSGMumKn6r8X4hyxKPljSGGsaPPXneQiV1M4s1eX
         bORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777077887; x=1777682687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hX2/JA8GK9hYTduQnxjY+1BP+OMuld9S7rTvEbat1fM=;
        b=Iwp4VfHtdedxF4zIVf3Hby1Q3/zWHbclSFMwV8cPE4XXTKcF+gXZXgx9JfV9G5WZlQ
         InK/h+LJtSGxSUr9WI3vWa0EFTGG/d+flLjOJBhfOWbNedBEW+IqImdHI1cI+Ts7rcJ5
         L5qWQMIHqzx9QVvARwJqCycVUU0usi5Lj7dceFHruaefeygvjH2S7SWzm8KO8skjFj6l
         kNLaQht8fP6P1Sb0H3QbrR/R7X11CKlD8tzTIVnzOt7Ki8/SA4P0IPTvogutqxUpWh6n
         coWIfES5bT8YxKsDAjChDdTlr9ZQRbBfp2gu+q2L2hiFxuGci1UasFDx4+aqrxSaKKF0
         hkzA==
X-Forwarded-Encrypted: i=1; AFNElJ/4FtT2hBX/rvUImMNS73BEWQ6obleHv7NosXygPrdFZvQsctMZnzOkaGhFpRknN1xAYqecaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFe+zcSBQSRVmJBeNcajsLkWkqBUe9j51nr1G6OG+p0NurIhI2
	q2otmmVJcCZTwkJd7J7ANcOTe5ahdi0upqUCerQp8My1aSKo+9Ig2nQu
X-Gm-Gg: AeBDiesuxUXdFA3vdIU3//pJnBeBb2+gnLGx0RgzpvmzicZQQ5EoU3gOwmET4/SVJHT
	J9moANBXTYtdcDXg8c9jLvQydaEIFBmf0rmqXM2QYyS3dMp+9dfyRtbGzPcEKt69YLG5juyF80D
	kbcDZ80e0sII45qG+8YMOtFr89zSl8DazPg0RuaJMOz32mnzFrz52pS+b4wnJoCzE6tKVi8vkKC
	6wYY4MIERsTzOPH/L2oQDL0jCyet03DcTpcINY1j37fHg0RAbfP008x1qVz1alVLf3oeOotlEmI
	0Ez4G1Iaq0gq9uc0cCu3Xa/xKBugt852WuI1NnlIBRMQjKHQdZgeM9Gs1FBEjXVhzp1JSJkQn/y
	dKZyuO+nraeSgvanAGD8x5xNRo+eHrGvHgvFWswj3znuCx84Lsc2YOsVJKSHZR4TnxBRpqv6HLZ
	7wPW2E2qFwY1YMZ7PpeOa8/yPhpl/7QmpbxfxX8hNg2IhRYOGJ4cdjjfmJfmzu9sEAFZWTHDnSb
	+1U1QpYZmcKFUczjntnt/i7/qO2OtkCMkszaH+eP6oOo1uGLW+/AaZQ66wXPZscAkhNLXsb2Z3S
	LMjq0mpwQA==
X-Received: by 2002:a05:6a21:3396:b0:3a3:21db:8ee8 with SMTP id adf61e73a8af0-3a321dbc8ccmr11418866637.1.1777077886621;
        Fri, 24 Apr 2026 17:44:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24948385b3a.57.2026.04.24.17.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 17:44:46 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Apr 2026 10:44:06 +1000
Subject: [PATCH 4/4] ASoC: tas2770: Deal with bogus initial temperature
 value
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-tas27xx-hwmon-fixes-v1-4-83c13b8e8f54@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=F5yeh6pdK6Hs7beqeyQj/TVTdS2YepfCTkinI6k7d80=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlv+FIixd5laq+Nc0jrstovZVGz3CkyJ7HG3KH5vorRO
 U37R9wdE1kYxLgYLMUUWTY0CXnMNmK72S9SuRdmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U21DM0
 0jHWMWLg4hSAqS7YyfA/88y+/OthEjcP5vC9NJAM95Iwz1/41cxrK6N2MOOipOg9jAy3FXhFk3i
 EzT9nz7/FX6S1zGDZxiCFvXVGbBH+6zknb2EFAA==
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
 sound/soc/codecs/tas2770.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 50501bcbe916..21e3daadefab 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -633,6 +633,9 @@ static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
 	 * value read back from its registers will be the last value sampled
 	 * before entering software shutdown.
 	 */
+	if (reading == 0)
+		return -ENODATA;
+
 	*result = (reading - (93 * 16)) * 1000 / 16;
 	return 0;
 }
@@ -646,6 +649,7 @@ static umode_t tas2770_hwmon_is_visible(const void *data,
 
 	switch (attr) {
 	case hwmon_temp_input:
+	case hwmon_temp_fault:
 		return 0444;
 	default:
 		break;
@@ -665,6 +669,9 @@ static int tas2770_hwmon_read(struct device *dev,
 	case hwmon_temp_input:
 		ret = tas2770_read_die_temp(tas2770, val);
 		break;
+	case hwmon_temp_fault:
+		*val = !!tas2770_read_die_temp(tas2770, val);
+		return 0;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
@@ -674,7 +681,7 @@ static int tas2770_hwmon_read(struct device *dev,
 }
 
 static const struct hwmon_channel_info *const tas2770_hwmon_info[] = {
-	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_FAULT),
 	NULL
 };
 

-- 
2.54.0

