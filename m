Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8738624B
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577899; cv=none; b=NrKrjGcoWXd17sNl1S1HWD7Dx7OhoAhTesCgrCHGNnGZWQcrd4/l7ZxLQDVEUphPM3HF/0sgM8b6YbdfFPg8jiLdtCnz0RRhje8xUROQP5yCBxfDZhiwbV7HQaDTgKzCnqFIwUUXYaZFq725U4aRD18CUaHfhyiorHvZkiwCHeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577899; c=relaxed/simple;
	bh=IgH2xciWZKB7uuHZHmdSRmIt01jSMO/zP2Qto0UovNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PsB7RY6tC9BNoUtHWwW+k9g3hj+9mNy2ckZRg5/sqJhCk0MQfnbUcxITBLtmmn+Am3t5X3uWAsXgqRN4dXGd5Z77NxztZSadKTOPMomKoFUXhmg1vh/Ab8ztb1WGGIjFtFubEcC6Q8rxzgQ1AKE+KBCNAvyyKYjNtEKfmouRUu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mNMkG68S; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mNMkG68S"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fc291f7ddbso2392001a91.1
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577897; x=1740182697; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2wYfo1Mtqu24Y79iekxONgnP5d7J5U5KCGS7O65vnE=;
        b=mNMkG68Ss8aKRjrsxvjuZ/IuXskABX+icjg727Ymg+ZmFY8zqeHnLP+9/nnp+cfzjV
         7z7PC9YX//Z5ID5ZOkzg2z26Y5qsdO1II7XQt4N8wKuSPI9eEqYZPQi9lDjUMi/YYIWD
         DdyylqHJN3E8BGSW5sCzCutZX21y0FxqOLmWN+8Nvx/sxddGg0MZueNsuwf3CLI9LETy
         fhWdNvZ06Ty8GdRE4Pd+FF3nM1n0fF0UhVYpOH/iIFEHTkeYsHmFgQZDSWIe0Gsj80w9
         8ZKeFZm7ts8al71yE8YZDqWsrTLCZHb2Wt/uyIFkykMnDO0YUm/KwmK8N6886ktqVE6d
         003g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577897; x=1740182697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A2wYfo1Mtqu24Y79iekxONgnP5d7J5U5KCGS7O65vnE=;
        b=cGlk8OG1V15JwU3KjeCR6xAca8EYUT1GFNVN38tRBy9As7QrfZLl4nQa/yUS0PAY7t
         FXPcn2YKcQz78mcXb5JCZZjS8Q7J0aOWvENB0V6azaqCYz8ioIDpkcRgqBNEHAYsBspU
         1xSCwrYmAITnmKfCZCNGv3uEuh6YbYbTWl2bqbcu0G0u3urJ1A1roJTzRjmDPBGx4fvK
         mGMgh2g6JihrJViIF/0oD67Bnnzc5tDFNJUmzHaMDl0o7A39k53dM/pSgs1gDbz/zis8
         DsyRAk139mLf0De39R2l+PlM8DeMqPPJnOjUtpZQC5mV67s4yjSKQsZbwbanfq+E82Go
         QkCA==
X-Forwarded-Encrypted: i=1; AJvYcCWDAEHHZeJB8qeq5bSWh13Xsz6th1keHgRR8DCYzxA+tUJQjlYr/40yicsDpuUs4gsB49esng==@lists.linux.dev
X-Gm-Message-State: AOJu0YwNvFQ2J1XVSA4yfJtjnlWFwwGG9g5mvPsmT6sJ4SiWCghbdJ/8
	H7e52orRVsT9stTOsQ2eySyNG/xC2DEkBDkMlQH8tu+ylMNZCKW5
X-Gm-Gg: ASbGnctLa9hGEeYqpfHsUIzfHT0+bvW0lir/5uvmNAyZlklMBmTDhxkeC89zVLgsdxl
	JnoVu6b0MlJySghRVzQ5VAYD4g3ua8E+Tra9dZG5yNU5cm6QGWxEJEAULWPGqEH2/J4iGj8gzvw
	Hyy0b9RlV1IrYpLMS0S35fQPWxMpANYn3uyaDPdrS1DwlSRvRget67b/NRaa2zP5Fl342u4YHXF
	tpgEa0MFEDbf0w1n1dFUqihcmAwDqoArqZjGNepyZ46E7b25kLL4jxuQCIb+G9/tqm+RmTABG1g
	3W29Q0TglezTOnjxsrY0dXJbzv1V9GOkKKVAqVxG/z6CSEuL8O2XH4eozbrXE3I61N5tLnmDrPe
	M2/zdH2eP8g==
X-Google-Smtp-Source: AGHT+IGHKLIIACivpmlg0oNUyAsiJUK8vKEeoxPu4+S7wNX7g5x99bBs0VbS7loNNK94SJ5cXy8Qtg==
X-Received: by 2002:a17:90b:3842:b0:2fa:ba3:5455 with SMTP id 98e67ed59e1d1-2fc40d13e1dmr1806453a91.7.1739577896696;
        Fri, 14 Feb 2025 16:04:56 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:04:56 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:48 +1000
Subject: [PATCH 15/27] ASoC: tas2764: Power up/down amp on mute ops
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-15-723569b21b19@gmail.com>
References: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
In-Reply-To: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3190;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=RUoG4wMIIwA+IrEHWzmf6WOptdb8et5Kz7rzipJV6QI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb26b6scZ/oSVZVFSwONU9jzJL05L1tnaZHlnhgnxx
 zs8OsPXUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwESSWBkZHv92kldZum6lynWz
 pMC1jXx9a+UmPz10R3CpaXS8oo8FDyPD88a50UccZ4kZ6p56lLV4YdQhyVh2/fTjqQdFXDmfprt
 yAgA=
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

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 51 ++++++++++---------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 75e49c85861b1eb6b312e8a455dadbbc7f54c836..2baa7fbb5fdeaf50cfb76a7eddf752cae2511329 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -194,33 +194,6 @@ static SOC_ENUM_SINGLE_DECL(
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
@@ -233,8 +206,7 @@ static const struct snd_soc_dapm_widget tas2764_dapm_widgets[] = {
 			    1, &isense_switch),
 	SND_SOC_DAPM_SWITCH("VSENSE", TAS2764_PWR_CTRL, TAS2764_VSENSE_POWER_EN,
 			    1, &vsense_switch),
-	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2764_dac_event,
-			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_DAC("DAC", NULL, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_OUTPUT("OUT"),
 	SND_SOC_DAPM_SIGGEN("VMON"),
 	SND_SOC_DAPM_SIGGEN("IMON")
@@ -255,9 +227,28 @@ static int tas2764_mute(struct snd_soc_dai *dai, int mute, int direction)
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

