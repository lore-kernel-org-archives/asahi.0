Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF95D22E00E
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867952; cv=none; b=bLWWsADgbzlbQMD1kLwbje5yrgLx4XFWsSVirF67HRnufk+qZ1iHIMj8rc1aIhS+qeJleeqkZfUhA1O4ZXOfcabqUfFv9TpRFHN5v5nlVt7K1FPlOhCyW89HzyuspMWNPAUXmZyvl3nGzNzr6CciNTm7s/wmAFVLOHH+FehNpIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867952; c=relaxed/simple;
	bh=X2NC1nq9Jr2CWV2sHejLqmJzvcXpyv7PewGMJfaLDGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjOn9oARzE3U5IONnv2i9WA/Pt97M+nYgecxl+Q3ebEPqcVooMvaC27aS5R/Veis8GNrcpidlguuBZA2j8hUsA8ZiZG87eCw6oN8O0mZVX7VMpXnQn5SUtcQSssHOmlU/Xu9A9qQ9dejy4IMcgcZqz4eDoB9PJMZ/c0l90v2AOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0AflbmL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0AflbmL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220f048c038so63354675ad.2
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867950; x=1740472750; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3klWhPvV5GUbiPplkmf5p0VOnIAHNQHeW5yF0WhLQg=;
        b=D0AflbmLDND/XPhSPlMKMDPAcmGVKLcEdMWtryGPp69U2/T5M+fINOZPxoNSUMAOrW
         nkHWATR+JDz8M7MQbZrP3SlVh/g2WwrEVAujm4x5gYAXFEVcB9TvpjccoyfE5BMFLCUN
         RH+INu5hup5sFqiIvzeT8/DK46UbsThdDgxJdjL64GShNzHoWbI01+9+UDA/8NF/1iT1
         eBOHnUEka5BMPdbegTo/Zx6e3TFMhcPmIxVED+tt1ZTnxJ0NbBn81pz/yhYlAHfkEQlE
         Vu7dLn0mhojc1iY2RGx+6UMUPbGNOY03yoR/rttp5CcBQI9S4dfpF6SV/W8kBZiOp8+O
         NlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867950; x=1740472750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3klWhPvV5GUbiPplkmf5p0VOnIAHNQHeW5yF0WhLQg=;
        b=MU0dHpjICvVKhzMGkpT2zs6K23gwYKsmX5Z5jZcXHMSAhwE/eS810Ms3KvxaNC1Dh4
         RO0Dn7xO1NnIp5AXVLU6ZPoNcKK0CSz8VK/ohevohgtl9VhlFZPXM9xKe/RkG5nNerW9
         /W1gj7OheK9Pmip0OzRajXZ3K2mIKbPlLqq2PirkElHKb4MoaSwIg66XTlM+SXNg87IZ
         Fx5qeCXT8m5y1iniDwMwGVDzqPR+nJ4HmoU7IpfjY6tDpx7yCsuzyEeU/OwqQO+RYF2K
         BOO9VMR5qsmUbtTEuv+s+xQJmq5xe6wdYDTANrhs1b0AQsxz82+cwogkKULkiNxx3jyr
         wGPA==
X-Forwarded-Encrypted: i=1; AJvYcCXX4hWSwvLSDxCKVHAROm1D4CpNjAGJJ9kzkzw5wXWectbcZKsiaMjYhpFWuxpcoL1D6MH9uw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxPx+F7b5sXOuK+Ss8MI9bnidD7oCWijOMAEpQ1PMBZSeMeWZ/
	qrFON1i/YFBbZ56WFDYjXQdtmwP1S/dUHUcjBWjd1nMehu0SvDr6
X-Gm-Gg: ASbGncsYe8IRxrsLlmDg75Pz7CZ0Mdgw35Ep6ZGZAyqiVGqsvVbKm52XY2guQsNkIls
	TGP695Y1h9ZQvTyprTaambtDkIjLdIa1dwW/cyv6mcR0XxYtglZjuc69gMmRbmGjS4hxRP1fo8f
	1e5mob1yhxoumnWl3IgW1HjPgcAvz2iUBYKNRF6GNHpbYmQhSzg5mq4pIt619YHaZ2RAVXCXZLQ
	Z91mHEzeaAyRf1RJs6tCGLH/Em1ClFCzRM0fgkHcu4RtTKhZpw3si1ZAP9bU3snl46E5nITcyXw
	psYnjyw1aNhhuqpJ7+4R5Fj3aa0CtvoLaxhIaXLBDUJ8GC2qj2jTOU+B8ptDMR5Lf+Tmge/h3dE
	Tw4oHJgc0yQ==
X-Google-Smtp-Source: AGHT+IFGVhxYw93mip/VYB42/aQk71fmFVbzVmISkib3+MSZgbWbsjSbcqRc1ID658YZQTeUw9eENg==
X-Received: by 2002:a05:6a20:9148:b0:1ee:ceb7:2b54 with SMTP id adf61e73a8af0-1eeceb72d97mr352523637.5.1739867949793;
        Tue, 18 Feb 2025 00:39:09 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:39:09 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:59 +1000
Subject: [PATCH v2 25/29] ASoC: tas2770: Power cycle amp on ISENSE/VSENSE
 change
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-25-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5FscgszU7aN109tj/tiH9/gQFD8FoCu58ZEIeFBUt+s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3JImyZ/O2FuqYWVtp3bLpUH8lsjbErWA4+f+vc3Pn
 a+mbZHSUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwETWOzL8FbvbPkNtcu9f8dv5
 T6p/ODoHfgjY4BqRav/+oM5Ms3Ps8xgZJu1c/LOy3CH7n5zD9loXWw7Pk59+P1pqmWSivJw991E
 iHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

The ISENSE/VSENSE blocks are only powered up when the amplifier
transitions from shutdown to active. This means that if those controls
are flipped on while the amplifier is already playing back audio, they
will have no effect.

Fix this by forcing a power cycle around transitions in those controls.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 30 +++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 6f9e56f02f7ca95d7878c68465d7016213ae417a..cf038f55453737b2173b986d90fd57d4cc14acfb 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -164,11 +164,37 @@ static const struct snd_kcontrol_new isense_switch =
 static const struct snd_kcontrol_new vsense_switch =
 	SOC_DAPM_SINGLE("Switch", TAS2770_PWR_CTRL, 2, 1, 1);
 
+static int sense_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct tas2770_priv *tas2770 = snd_soc_component_get_drvdata(component);
+
+	/*
+	 * Powering up ISENSE/VSENSE requires a trip through the shutdown state.
+	 * Do that here to ensure that our changes are applied properly, otherwise
+	 * we might end up with non-functional IVSENSE if playback started earlier,
+	 * which would break software speaker protection.
+	 */
+	switch (event) {
+	case SND_SOC_DAPM_PRE_REG:
+		return snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+						    TAS2770_PWR_CTRL_MASK,
+						    TAS2770_PWR_CTRL_SHUTDOWN);
+	case SND_SOC_DAPM_POST_REG:
+		return tas2770_update_pwr_ctrl(tas2770);
+	default:
+		return 0;
+	}
+}
+
 static const struct snd_soc_dapm_widget tas2770_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2770_asi1_mux),
-	SND_SOC_DAPM_SWITCH("ISENSE", TAS2770_PWR_CTRL, 3, 1, &isense_switch),
-	SND_SOC_DAPM_SWITCH("VSENSE", TAS2770_PWR_CTRL, 2, 1, &vsense_switch),
+	SND_SOC_DAPM_SWITCH_E("ISENSE", TAS2770_PWR_CTRL, 3, 1, &isense_switch,
+		sense_event, SND_SOC_DAPM_PRE_REG | SND_SOC_DAPM_POST_REG),
+	SND_SOC_DAPM_SWITCH_E("VSENSE", TAS2770_PWR_CTRL, 2, 1, &vsense_switch,
+		sense_event, SND_SOC_DAPM_PRE_REG | SND_SOC_DAPM_POST_REG),
 	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2770_dac_event,
 			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_OUTPUT("OUT"),

-- 
2.48.1

