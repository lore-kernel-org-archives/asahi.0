Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0756922F3B8
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867904; cv=none; b=L3zeOOy/3wuBvy6F2ZCNNHwk95HgH4gPuymfhgNkBEXMaJOupSa2P9GIOgc205ynOjzE9O38dYmMLDkvKpHYKVS7n+tOD0UBSbH4z+rtfEo3CVKumCwkwjcUKoVtH7GKZ5+lCWeCDYAF6cVu/5cs9TPwnsdA+4Fhhw9AWCQZIAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867904; c=relaxed/simple;
	bh=YMQbzuiyaL1Iaf8NDdQ1vVxMPoqlW0XTKmhgm4P53e4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dooud3av/WFAmsToCDkZ1gc0/FHG3uzXHCDgF8uRNfbhSjz84OQwpR8nivwNakI57VOpdoabKuX90Gd+m6luNOv1QVuo+E4n+tn0Sqg05q4xHITp1DB+/EqT5oFRpnPnLMODDM1oR9WZBrYGR/kXcI1m8HgTY83OJhb5Wrq2BB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbWZ1qcl; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbWZ1qcl"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-220c2a87378so71364335ad.1
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867902; x=1740472702; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hyqeyf27F6I7AKPqAgQeLe+BV+1ml+NgHZwH/Ryil30=;
        b=lbWZ1qclPWyIZ4ori9WrdYCnmt/2pz/ahuflSzAbovhi5bKaOvzT1evmIpyfSa6Bwo
         RTjjsfu4F1MIPJBFtNYRyhQ3fLMZj2gz06inzzH+YXYK0mcoDiSVH7kkejK9RL2zhbhY
         2mweDQ4MVbKCvcohPod6/6xSEi3B+L4IhnC1G8m6Zxu+nVP2H8Fbsg1ZI8+/9NvRENHF
         z4k4q88fJrnH9XCxnrK7g0YcYjklAcO9QcJ4lEnEHX3CIW1dBaMrGOSIrRG75wNeIs8o
         vSQKNoMZ6MnAmVsHnqW/kcY4NVj6uI87NW4RTnLao6KMVFQxvBBBZ2Z+6sIiWlNvPHAy
         1Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867902; x=1740472702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hyqeyf27F6I7AKPqAgQeLe+BV+1ml+NgHZwH/Ryil30=;
        b=CMlDRcescmtjThXdPyDsOSMi2lb2AhsZZONzqAMdlEysHDOctHvt7SnbHInK+e2cwo
         2qxbJ3jMHbIlXazFeZi1MDujeEk3lRO9ItIww00g84L1o534sGIA4zV1M+lZy1hmLG1s
         I46fL9GqD2bLV2q7f3QPY++dRUV0KnZ8grv/4TUstrSco5nYBBQhtNeLI6csYjLd7cGt
         aOdLgwv7p74b96g8laZlpYb6jeGBwDTmjqoJxgjfIaxIDaSoLnPgSjmTWJgMwTh4/oeg
         Vu46mXQsrhKtsj+V7yaN+sG0Cv5Q+2+Uox0a1YtiRQ7QQJ04ie+JaZBswwYorsL+s+Q1
         YNlw==
X-Forwarded-Encrypted: i=1; AJvYcCVV5jNzBTRrH8pKj24JEFJSDw6GpEUdYkQ+4zT9tPcOLXbBLt0etUwWsrMHYujyhD9aIp3VPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmp640W8/ihkfjmKA/TC/A+IF0YFUBvR80lQWIgeymYITnHdTb
	S/Jm5Mx+sy4DipJ46An2PuH158M8NVCbGhQgmBkXCXb9bDDsqne9
X-Gm-Gg: ASbGncusnA4+87sjDVj2jRFhFehyRLoZ0luk24f5CN+3MTsiHgZg7m6PKqHrmMRSqCi
	3/wakLu0cbsEXC7ndbtcEVGPGsaX4+6t2tVD90sVx6YPKlxSPQt0O+fnBj2C/Z/7p/3xLD8Y/Ht
	Vw4OULJdurGugdEi4ZpwlJv5k5vViwkt+ly1UQc/fQieO4gPWy/1VFA85TLQ8zrxiRP1uj3YU9M
	O5KVAy/TAAo6V/GFW7JXGjjkaTYIM/l4MuPmPmPruJWZ7UTm5wvRLLuoTHo3wS6ZQldsnHV0Jfw
	P9DCYyLmboqv9jBvZR3z4HxP4UhXc1nmG4ZURtY3YbJo2pwXbGN2l1l1pTrDqfZgs9WkdVqi5MJ
	KoGl06kWoIg==
X-Google-Smtp-Source: AGHT+IGkUu7BmztVJnNnLd9/2arCGoguxbm/707mGBgU7NigUyCi+pzQzWsh6RXWD/XRKiCh/p9pUg==
X-Received: by 2002:a05:6a21:4014:b0:1ee:833a:39a6 with SMTP id adf61e73a8af0-1ee8cac1610mr23081603637.4.1739867902350;
        Tue, 18 Feb 2025 00:38:22 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:38:22 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:53 +1000
Subject: [PATCH v2 19/29] ASoC: tas2764: Power up/down amp on mute ops
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-19-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3232;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=I5n7Dz3MYeIHjWigjiDeLt+4w349RXEkojMNn8Ex6EY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3BJLdupmyrdKd3WzVj8UMrk4Ncv5wYadS6fMe/Iwb
 c7tjub0jlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACayIYiRYbvlfuVX333nb13w
 y0hJrvhLe27cpyPMUprzj4mwM89bl8LwP67+9DHxxtWl7Fd5hGw8YouZT2odXu9/nf2FjV1Ymu5
 5LgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

The ASoC convention is that clocks are removed after codec mute, and
power up/down is more about top level power management. For these chips,
the "mute" state still expects a TDM clock, and yanking the clock in
this state will trigger clock errors. So, do the full
shutdown<->mute<->active transition on the mute operation, so the amp is
in software shutdown by the time the clocks are removed.

This fixes TDM clock errors when streams are stopped.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 51 ++++++++++---------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 16df453190961b8ea6809cf4e6a9c588f41b5a82..7b69ab94c4bbd5f074d57a42f71b32f5fd63d560 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -195,33 +195,6 @@ static SOC_ENUM_SINGLE_DECL(
 static const struct snd_kcontrol_new tas2764_asi1_mux =
 	SOC_DAPM_ENUM("ASI1 Source", tas2764_ASI1_src_enum);
 
-static int tas2764_dac_event(struct snd_soc_dapm_widget *w,
-			     struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		tas2764->dac_powered = true;
-		ret = tas2764_update_pwr_ctrl(tas2764);
-		break;
-	case SND_SOC_DAPM_PRE_PMD:
-		tas2764->dac_powered = false;
-		ret = tas2764_update_pwr_ctrl(tas2764);
-		break;
-	default:
-		dev_err(tas2764->dev, "Unsupported event\n");
-		return -EINVAL;
-	}
-
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static const struct snd_kcontrol_new isense_switch =
 	SOC_DAPM_SINGLE("Switch", TAS2764_PWR_CTRL, TAS2764_ISENSE_POWER_EN, 1, 1);
 static const struct snd_kcontrol_new vsense_switch =
@@ -234,8 +207,7 @@ static const struct snd_soc_dapm_widget tas2764_dapm_widgets[] = {
 			    1, &isense_switch),
 	SND_SOC_DAPM_SWITCH("VSENSE", TAS2764_PWR_CTRL, TAS2764_VSENSE_POWER_EN,
 			    1, &vsense_switch),
-	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2764_dac_event,
-			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_DAC("DAC", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_OUTPUT("OUT"),
 	SND_SOC_DAPM_SIGGEN("VMON"),
 	SND_SOC_DAPM_SIGGEN("IMON")
@@ -256,9 +228,28 @@ static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
 	struct tas2764_priv *tas2764 =
 			snd_soc_component_get_drvdata(dai->component);
+	int ret;
+
+	if (!mute) {
+		tas2764->dac_powered = true;
+		ret = tas2764_update_pwr_ctrl(tas2764);
+		if (ret)
+			return ret;
+	}
 
 	tas2764->unmuted = !mute;
-	return tas2764_update_pwr_ctrl(tas2764);
+	ret = tas2764_update_pwr_ctrl(tas2764);
+	if (ret)
+		return ret;
+
+	if (mute) {
+		tas2764->dac_powered = false;
+		ret = tas2764_update_pwr_ctrl(tas2764);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static int tas2764_set_bitwidth(struct tas2764_priv *tas2764, int bitwidth)

-- 
2.48.1

