Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93FC17C79
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577947; cv=none; b=rjw0eVYL/4YD+2MUbs7Fy3lVBm0QX+aAffqQ8ozY/evjG+wLUnAOlSv1tIs3AcR/H3JFOQScdhXA0EwEb0qvRfecVzI13v2FuU4xmJnY4QEC0FXlxZIH5LL8fxkafJtJS0/gcNm8VTjsXPaVVsDZiD670KINAhWrn9Oel6xxOvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577947; c=relaxed/simple;
	bh=h3JxMDwKaAS4Ilp8m+BiV4LRBVi3038MrI86Ypea7zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJA/33EUmv1a4FFe504xjqLK7Pm+pgnohbV+++mnizfMRCV3AznGB5UMaMs9VLf0zlQWLtNllgxfAdK6NUCzNc8RbQAtoBU/qHK5MqazI2l4SVTYWFP8oebJ83tS78gvDLaTt8bVuLLEjkaFqGQfSQKmgzPyVrad94C2ZnTUPGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BT/snB36; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BT/snB36"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-220ca204d04so35684155ad.0
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577945; x=1740182745; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPkSjeZOPc9/OJBNbtlEa91pxyRki+1Mxp+ipEW3Y64=;
        b=BT/snB36hUsl+Do3KCRrrybhLbCXHd76Tpag6MnyPb4pZTHxEAFMmPtZ1f3BSyo67U
         TQJaiZ9e7c/6wXq/3ypMnK8+BxOVhpFeaRMW9IN4aeyqzTVYa7R4MvD6KxRL5pS/Vs6v
         zrpqLG9BQ6NXylIIFHqG8Nkv+VBoDenbi6r8ZmO5ZbpHQgAIrYWdTTX10PH8IgcRbLyZ
         xFH82PCcTuOi5b8JwQAY1S5wV8p9W2OVHKfaK9micoN5npIvLHzzvF9jH5kWz1ch1wOB
         FL76DX0bOshbx27yM+CvZg4idy/kxR/CzQWlw4h9BOfQh3AtG+NPjICvJwUCogvdjXBd
         6B7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577945; x=1740182745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPkSjeZOPc9/OJBNbtlEa91pxyRki+1Mxp+ipEW3Y64=;
        b=d8JdGRkMyrw+qnh0DE2zzwWlnhjHfOca9bPW5MrbihFWx1dB4h1szwmDPlWonfFfyw
         I/KGSoikPSDa2CtKRMWDpKjWCCHFSlcrs5CoRWj3DcTv/7BzBrNylq52EMs5m1h37Lok
         dUbAYik+DDS9vDNrXutlry8IhG8Rs/bgOepAjncgWpFlNZ19PI4Cr9cWmTX6RTGNvMX8
         TdxPJThCgLhMGBzS1OpCbWsMxFp6QST21AMGXM0WrWeEfiK1ohX9JC25gHPpFT/AQAGp
         H3DPkviCaNjqrSEH7byzcu90UuWEGNumoa8k+cvUra33G7gtH80DIUgS4a78aVpf+jvO
         N9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAfkGhBfzK546pXpRFjzMzohLyv5OTgyudWcOMrfy8RtgBZiqid4RYIt5EZUeRYUt1v341Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yykkytue2y29ArpSZNmsUD3LywzzTjtp842ZJN4/FqprmWST/9i
	cUXKKOiPS0LnR2k9FVigOASKl0r6gj4RxTYLDPLrOdli8ESeRkzb
X-Gm-Gg: ASbGnct7o0+oZcJmQJ+4qX4Am74X4MjYAopk6yN9t6idU9e5fmxozY0Pi9sReocu01k
	w/z1r9ufJzDtdpn1gY5axm+aVYST5mycvN7rng9TKbUVoyNAqQl6bBtUsZbTfV4a38UUNg6QgDM
	9Xhx990R4SwhoXgxbeXsqPDYSLwdw7RUPkH1y7hHrL7x1IDQYoBEDKMoAv3BFuAFNeUmhffGIMD
	enoytHJNuNGY4FuWjiscRXoxKPyfaZx5R16Ki7vkFE0Ae9bdBIBrNXT2OTaGq7EBSw7W9w8b7k9
	0saaG3T5JEe846pameBox5J7Wg3MFeEHeFxsqyGJxeHv6MuZMosPqHh9Ou/v8mqdz3MyDOoml6d
	Io9trX7s0oA==
X-Google-Smtp-Source: AGHT+IG6+3nLmsHdx1RmFdm91Qjq9AU8nruLrezbvXoGg+uGvb2vJNqsgjTQtxQnEV74jVfqHyDnEA==
X-Received: by 2002:a17:903:1d1:b0:216:760c:3879 with SMTP id d9443c01a7336-22104099423mr15221945ad.46.1739577944909;
        Fri, 14 Feb 2025 16:05:44 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:05:44 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:55 +1000
Subject: [PATCH 22/27] ASoC: tas2770: Power cycle amp on ISENSE/VSENSE
 change
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-22-723569b21b19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2645;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=tUylZZQOHhwL6PpQLa/BzEAlJvmGxPEni0WVBgk7TPA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb25/vOKWxd/zZp+mdkt/aohS+pETnb7rfsopdeN9o
 V3/JuYe7yhlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAiGhKMDOvX5uzT1zIqEFA5
 651kJlJqtStuU0Q0058qsdgQi4Z/PQz/jGsfHnQ0mLKLUd5qyt1vFznD3ztxTtm5S9HkM/uL6bX
 neAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

The ISENSE/VSENSE blocks are only powered up when the amplifier
transitions from shutdown to active. This means that if those controls
are flipped on while the amplifier is already playing back audio, they
will have no effect.

Fix this by forcing a power cycle around transitions in those controls.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 30 +++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index bac34e1237ce2a5e25face47e0597617308f1343..d74bbe12dea49da376fc577dd144912468fe163a 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -163,11 +163,37 @@ static const struct snd_kcontrol_new isense_switch =
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

