Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91A31C8625
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 23:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894940; cv=none; b=kilzLYDp5LqOrTBgQoSnPM6RaW2S7+TJRobYGbas5U+Swpzi3izGbsYROVRtW9abr+xiw7awQ32/CMg+uO2UTMCbsmHQCpcdUC53KvmNHf2qQkJwCjgp/1bLvRFziZu+yTAV27ovMvmkDaS0HVOstH6pDqxiWKk8HIBJZwiv21M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894940; c=relaxed/simple;
	bh=HqJUvE3cm056/al8IELSKt4YG1QY6I7o2vDGy5tCaZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhDkUukTZXqiPNrjFLG/kqOTx8rBymJp89tyCaIV193NsELXpBri/RlP3Kgu3rnt5cz1gy9UaY4BpkEVacAohC3oL2uCBIAHuQ1a3A6Yd3tvQ/xhEqwSc/VQgy83sNn7OqQ5xeWkYpeS2hxVk+difom3/ci0ECw3tmcgT7/C2aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KOw4TVBv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KOw4TVBv"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2260c91576aso25827045ad.3
        for <asahi@lists.linux.dev>; Sat, 05 Apr 2025 16:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743894938; x=1744499738; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zT7z/HktyzmUzeS1R/jDHnCVkQulwygo5o6mh5iuzs=;
        b=KOw4TVBvN5PRDLRoxMagz/NZUsex+BR5J5j92WLdhnAjzfcRslfK0PVE9DeG57AUUe
         MD1Upj57mzIvym71OHwagMTB2Zg3QyeWjkl2MIOTQgIPsmUgZxeaSGeFo/YwNbHh50aq
         Kajc2EuyTpaGGM1wHZfbAIgrrY1bfgUq4UggeNwciGFZDpBkJhCtH4H/cnr5IMMDJx8Q
         RORdQWd46AtMIY1mAYJcL+fcOwfnG4FWZ4//TgZe8M4dMWA6QOrRnSSUu6o+Y/685S5A
         ddfOJVlN2q7HVhmmIbzfUgm/sShNsCypgyW/OxpQTycAwdwc9wKEPhQK35edSaPCsWfp
         dyKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743894938; x=1744499738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zT7z/HktyzmUzeS1R/jDHnCVkQulwygo5o6mh5iuzs=;
        b=uvKhyYp0mQaRLGaYObsm6Jby0JdxdkKGHeeHgslPTDcEG1F+ey4FxCXpekQbtVkexW
         NQxPd7frwm1w5bejsCgyO/cfzl4Kj6O32fJ9pHkE+Odkfgfljyht5mF9aesXeQcVowYH
         hF7f1fNLrwEs+v2nACfqEhgw6W+RMw56eAJAm6gfQkc8/E0NVlgTFEJHKfc9zJ6q7Fmv
         VCGkLcyWIi4sY3A0iCh0/2F9UCxQ3lctLUb2168yui4G0Vmfta82eE5+KzRyI+3X5bDc
         rnJojbhl8OkIqZt+EYO1r/WkcsE92PUDlKE15EVGAcMsuT3SG7grtf7gaTrimpiPfEwc
         a8ew==
X-Forwarded-Encrypted: i=1; AJvYcCWeHWVamWQ7aRcJpzLkYVZgdxQ6h4iAcJAliPEV/k9OSFrwqekieSaRkn9W6pt6F6baYzET9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjzaljdSSEC8aJQ/V8pcS5Fis9HvT7PBMxjmUCfkZ3HLmq82Tg
	gqTCTWA09ADB3VG5/JR4bJE/YaQtel39AFaYvlaBZ0S7t34VHjOeWP26TS2Y
X-Gm-Gg: ASbGncuovtzKPDxdnvuVrwboBzHz+Swnpgbj1lr03GeQhIN9Tcn3yolT+fwmMI7mlvN
	O070hKmIfob1tlsaPcHnLCSFewd6jgCWHhFOYDvlIYHPoXx5yBAdGP5pKnT25GMvlaEPbsLuKhk
	lZAXZurss+3+w+n+jXqdzetwYyj0Fqed3AH+ieDMR0IZjOtzj0dFunNTnrCRS+6e6TlBHsCkOeG
	emR1lkQ7jNYO5zaFng5n8lsHdldAYC0Ch3irJjI8a/fo8ArQsLg8mOrKlIhzigOOqXR0nU/FJ0c
	irbY16xhcmsmA38pPbXFxNdr6e1TWUnBBhMub87PKUm0M4Oy9m7xTBRKZvlkMGFzeWhjH74RAgB
	2uGwKFbEdTQJPOje3q1HMj3pU0/NFCJLatnpwcrc=
X-Google-Smtp-Source: AGHT+IGRchoS/CucZE1tgNu5aAkMlUokbSk42txl/eCkLWISpt+NHELUlUL8kUdOf6jUGAiNHPSQzQ==
X-Received: by 2002:a17:902:d4c4:b0:226:4764:1963 with SMTP id d9443c01a7336-22a8a1d6f93mr108621555ad.51.1743894937944;
        Sat, 05 Apr 2025 16:15:37 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c994esm55048345ad.102.2025.04.05.16.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 16:15:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 06 Apr 2025 09:15:05 +1000
Subject: [PATCH v5 1/8] ASoC: tas2770: Power cycle amp on ISENSE/VSENSE
 change
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-apple-codec-changes-v5-1-50a00ec850a3@gmail.com>
References: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
In-Reply-To: <20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com>
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
 bh=PCUEqTWLJugE/p5yI6mH/FN1rmh28HR0YZQdpuB+rAk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfd3b2a/nYCfT0nL4YrvFb7HqT7zcR00neorqzFc8c+
 Si8neFwRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABNp4WBkuFtR9ji/W7hnX/7N
 4rzy4K4L/d/NHNgW5RjWfD4hZVVQxchwOMtVzKTE+DmbivP2w5NW21VeLf7y8/zmCSv2+L+Yzaf
 HDgA=
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
index 7f219df8be7046912bf3ef452f75c17b5118bcf6..8de7e94d4ba478aa9b705a81e7276bd005c8a18e 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -156,11 +156,37 @@ static const struct snd_kcontrol_new isense_switch =
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
2.49.0

