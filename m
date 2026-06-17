Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA82481FA2
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692693; cv=none; b=Ph3hj6/rmsrToru5MFyqUQ7gOlA4hdJlbf+9jPN8GhPuGFlR0UulLKLBZkMcQiWnDcNCuF0Mq99se1w0Rn3Vr8DWvWfYkqHGEef2iMyF/PPhKWpLruuZQGU0I/N+3rygMkAzmGqRz2sjxJDBxKc4p2iSPCIScv4i5BYpZhJbJK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692693; c=relaxed/simple;
	bh=6N8CHPLKpnSbkP57OUq/iNhR348mTks+PMtxRGkLBHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uSUWd4Mdrk5AJ9SADneOGm6Fku8k7WFH1Eui6E9DME0DBNeGIeFyPJr37O0BKlaIEjehglvqWkI3X+3VBr4cUqQu+QXgXI++qlBRXrcTx0kJnlkjgsP+QHUc4yE6PIT35gFpKUKoQu7CGSk4BiJozvjkooVKKiTj8gp7uJvGSQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZz/EEZJ; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZz/EEZJ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5792296eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692684; x=1782297484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+q9qiVs5pZw4S56fNw35ZgMQ7ij+/Dm3jjC47iZDes=;
        b=jZz/EEZJaaPjnX2SpAXzynYiQj/7WY1RNd5d39RYmAP5F2wZwz88dvblsJZY9WrZcj
         CBpM2cq3fI7sOXTmEI20aSOEw+oZGIruhvbLoSVDKC8LRIKeFvCrgvORrTPzUDqvUjRT
         ooBFstO4d0wRPeNM15yhvMkx0R3wQs2sVasmQ6VXG6Cf/2SYEWXQJNHMfBoHm7NDJCJV
         xKKa2Bx5Jgull8WFlwm0e7F8/t/iDPCib2zXpskBk4Ey8CHabEKBY9UU/+0TT5I1DQ1z
         WHsGm/fufhjyHNe+9aDzYApcVhEgDaS6EKWqKZm1QyrXMLvMOdXr86ga+WYuW5xwp1HU
         lPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692684; x=1782297484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+q9qiVs5pZw4S56fNw35ZgMQ7ij+/Dm3jjC47iZDes=;
        b=WrrK5XwGam0ZScQ7roRgLMe4vJnz8C5EgXySSipk99FUOZMe+uyXznmeNFzkYNlIk+
         sYgWGHF1Ewegkx2D4gYOzvniq/jWqYn6WV8qzANNfWd43kq/v3WgkFk8XI8D3PhxwL/2
         jtEtDAs0vuFSfnGUbouTqkA8hp/xzZJ8aN5shZ7ZpOwI/FcU2qt0avkWOUzZFLEK0yVA
         tztnEqEGbo8oG3fTzeXzHqt6kMGu2q9IWAA6/2QQi8Q2TeDYI58bi1z+Cs1tWli7Ca/5
         qYa8gMyZh49uRYglJ2oW0OtCgUdq6R3PD6BzRBbXgBWZ8vM6LciA0EFNL7OOda2yHj5P
         KcxA==
X-Forwarded-Encrypted: i=1; AFNElJ/i+aGUeRccuj2TlwOxIbibO9VN1ZxgrPiBiGYIEweIB9KCza/VYQj1/eiq53y+0B7ltDNsEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDp5ono/TT4o+EA1mY3T+k5rUoTpG0MUDgM92SoWa5FblJpDwB
	k/FjJ7freJY5LGr7ch6vqc9UV79B2/eXZHOCuUJDi6ci+EwZogJOtP/PiIDjjA==
X-Gm-Gg: AfdE7cm1IQhI6mR7LmIYlSLj7xGxG0m9ea08Tqh6BG0x+dih3Dq4t44ZNotm7aRYJ9+
	r4rshqnAM4hsC5/suO/RHKqomejpHE6f5YLC5Kbhvsini1LryTx2CcneQv2uf3VlR30m/UlCAon
	sy3hV/61l1vaNW6XARb8dp+a4UatjOhOIzYHpwcyW9Y62m1LAzZiBQZgDdz/L7nl4ZdWT6A28y1
	O1AjzSR8d136qaecJQBvZXta6DQGPC+orkK5JVqwDHj0CwWRnSGA8IzkqgTQjdGgMDBaWlRabwK
	plFp+GzlHOczD3teEpMh+rZhZ9AVpi4A7kDqigN8O7rkZLi6ikLLed99hcSWVECpxnQ6CPAo8s6
	RDRdOZke4xk+xg2lIGjU7W7sJMmjDWPK4YM/TAukb30CgtPK3k/NQzVmaPiD80GxlYeYgeR8/jt
	mYUfeHhWxYWfep/WYcz/tJITO26PxiOX4aLqkyIVJu23m5E5w=
X-Received: by 2002:a05:7300:30c8:b0:30a:e52d:fb27 with SMTP id 5a478bee46e88-30bc9df5a44mr2012909eec.11.1781692683672;
        Wed, 17 Jun 2026 03:38:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 33/78] ASoC: codecs: idt821034: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:50 +0700
Message-ID: <20260617103235.449609-34-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/idt821034.c | 120 +++++++++++++++--------------------
 1 file changed, 50 insertions(+), 70 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index 084090ccef77..f42e9a2493f1 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -413,12 +413,12 @@ static int idt821034_kctrl_gain_get(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(mc->reg);
 
-	mutex_lock(&idt821034->mutex);
-	if (IDT821034_ID_IS_OUT(mc->reg))
-		val = idt821034->amps.ch[ch].amp_out.gain;
-	else
-		val = idt821034->amps.ch[ch].amp_in.gain;
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex) {
+		if (IDT821034_ID_IS_OUT(mc->reg))
+			val = idt821034->amps.ch[ch].amp_out.gain;
+		else
+			val = idt821034->amps.ch[ch].amp_in.gain;
+	}
 
 	ucontrol->value.integer.value[0] = val & mask;
 	if (invert)
@@ -456,7 +456,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(mc->reg);
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	if (IDT821034_ID_IS_OUT(mc->reg)) {
 		amp = &idt821034->amps.ch[ch].amp_out;
@@ -466,21 +466,18 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 		gain_type = IDT821034_GAIN_TX;
 	}
 
-	if (amp->gain == val) {
-		ret = 0;
-		goto end;
-	}
+	if (amp->gain == val)
+		return 0;
 
 	if (!amp->is_muted) {
 		ret = idt821034_set_gain_channel(idt821034, ch, gain_type, val);
 		if (ret)
-			goto end;
+			return ret;
 	}
 
 	amp->gain = val;
 	ret = 1; /* The value changed */
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
@@ -495,11 +492,11 @@ static int idt821034_kctrl_mute_get(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(id);
 
-	mutex_lock(&idt821034->mutex);
-	is_muted = IDT821034_ID_IS_OUT(id) ?
-			idt821034->amps.ch[ch].amp_out.is_muted :
-			idt821034->amps.ch[ch].amp_in.is_muted;
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex) {
+		is_muted = IDT821034_ID_IS_OUT(id) ?
+				idt821034->amps.ch[ch].amp_out.is_muted :
+				idt821034->amps.ch[ch].amp_in.is_muted;
+	}
 
 	ucontrol->value.integer.value[0] = !is_muted;
 
@@ -521,7 +518,7 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
 	ch = IDT821034_ID_GET_CHAN(id);
 	is_mute = !ucontrol->value.integer.value[0];
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	if (IDT821034_ID_IS_OUT(id)) {
 		amp = &idt821034->amps.ch[ch].amp_out;
@@ -531,20 +528,17 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
 		gain_type = IDT821034_GAIN_TX;
 	}
 
-	if (amp->is_muted == is_mute) {
-		ret = 0;
-		goto end;
-	}
+	if (amp->is_muted == is_mute)
+		return 0;
 
 	ret = idt821034_set_gain_channel(idt821034, ch, gain_type,
 					 is_mute ? 0 : amp->gain);
 	if (ret)
-		goto end;
+		return ret;
 
 	amp->is_muted = is_mute;
 	ret = 1; /* The value changed */
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
@@ -629,7 +623,7 @@ static int idt821034_power_event(struct snd_soc_dapm_widget *w,
 	ch = IDT821034_ID_GET_CHAN(id);
 	mask = IDT821034_ID_IS_OUT(id) ? IDT821034_CONF_PWRUP_RX : IDT821034_CONF_PWRUP_TX;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	power = idt821034_get_channel_power(idt821034, ch);
 	if (SND_SOC_DAPM_EVENT_ON(event))
@@ -638,8 +632,6 @@ static int idt821034_power_event(struct snd_soc_dapm_widget *w,
 		power &= ~mask;
 	ret = idt821034_set_channel_power(idt821034, ch, power);
 
-	mutex_unlock(&idt821034->mutex);
-
 	return ret;
 }
 
@@ -717,9 +709,9 @@ static int idt821034_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	ch = 0;
 	while (mask && ch < IDT821034_NB_CHANNEL) {
 		if (mask & 0x1) {
-			mutex_lock(&idt821034->mutex);
-			ret = idt821034_set_channel_ts(idt821034, ch, IDT821034_CH_RX, slot);
-			mutex_unlock(&idt821034->mutex);
+			scoped_guard(mutex, &idt821034->mutex)
+				ret = idt821034_set_channel_ts(idt821034, ch,
+							       IDT821034_CH_RX, slot);
 			if (ret) {
 				dev_err(dai->dev, "ch%u set tx tdm slot failed (%d)\n",
 					ch, ret);
@@ -742,9 +734,9 @@ static int idt821034_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	ch = 0;
 	while (mask && ch < IDT821034_NB_CHANNEL) {
 		if (mask & 0x1) {
-			mutex_lock(&idt821034->mutex);
-			ret = idt821034_set_channel_ts(idt821034, ch, IDT821034_CH_TX, slot);
-			mutex_unlock(&idt821034->mutex);
+			scoped_guard(mutex, &idt821034->mutex)
+				ret = idt821034_set_channel_ts(idt821034, ch,
+							       IDT821034_CH_TX, slot);
 			if (ret) {
 				dev_err(dai->dev, "ch%u set rx tdm slot failed (%d)\n",
 					ch, ret);
@@ -771,7 +763,7 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	u8 conf;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	conf = idt821034_get_codec_conf(idt821034);
 
@@ -785,12 +777,10 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	default:
 		dev_err(dai->dev, "Unsupported DAI format 0x%x\n",
 			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
-		ret = -EINVAL;
-		goto end;
+		return -EINVAL;
 	}
 	ret = idt821034_set_codec_conf(idt821034, conf);
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
@@ -802,7 +792,7 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
 	u8 conf;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	conf = idt821034_get_codec_conf(idt821034);
 
@@ -816,12 +806,10 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
 	default:
 		dev_err(dai->dev, "Unsupported PCM format 0x%x\n",
 			params_format(params));
-		ret = -EINVAL;
-		goto end;
+		return -EINVAL;
 	}
 	ret = idt821034_set_codec_conf(idt821034, conf);
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
@@ -897,11 +885,11 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
 	int ret;
 	u8 i;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	ret = idt821034_set_codec_conf(idt821034, 0);
 	if (ret)
-		goto end;
+		return ret;
 
 	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
 		idt821034->amps.ch[i].amp_out.gain = IDT821034_GAIN_OUT_INIT_RAW;
@@ -909,23 +897,22 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
 		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_RX,
 						 idt821034->amps.ch[i].amp_out.gain);
 		if (ret)
-			goto end;
+			return ret;
 
 		idt821034->amps.ch[i].amp_in.gain = IDT821034_GAIN_IN_INIT_RAW;
 		idt821034->amps.ch[i].amp_in.is_muted = false;
 		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_TX,
 						 idt821034->amps.ch[i].amp_in.gain);
 		if (ret)
-			goto end;
+			return ret;
 
 		ret = idt821034_set_channel_power(idt821034, i, 0);
 		if (ret)
-			goto end;
+			return ret;
 	}
 
 	ret = 0;
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
@@ -965,7 +952,7 @@ static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
 	u8 slic_raw;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_raw = idt821034_get_written_slic_raw(idt821034, ch);
 	if (val)
@@ -974,8 +961,6 @@ static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
 		slic_raw &= ~mask;
 	ret = idt821034_write_slic_raw(idt821034, ch, slic_raw);
 
-	mutex_unlock(&idt821034->mutex);
-
 	if (ret)
 		dev_err(&idt821034->spi->dev, "set gpio %d (%u, 0x%x) failed (%d)\n",
 			offset, ch, mask, ret);
@@ -991,9 +976,8 @@ static int idt821034_chip_gpio_get(struct gpio_chip *c, unsigned int offset)
 	u8 slic_raw;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
-	ret = idt821034_read_slic_raw(idt821034, ch, &slic_raw);
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex)
+		ret = idt821034_read_slic_raw(idt821034, ch, &slic_raw);
 	if (ret) {
 		dev_err(&idt821034->spi->dev, "get gpio %d (%u, 0x%x) failed (%d)\n",
 			offset, ch, mask, ret);
@@ -1015,9 +999,8 @@ static int idt821034_chip_get_direction(struct gpio_chip *c, unsigned int offset
 	struct idt821034 *idt821034 = gpiochip_get_data(c);
 	u8 slic_dir;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 	slic_dir = idt821034_get_slic_conf(idt821034, ch);
-	mutex_unlock(&idt821034->mutex);
 
 	return slic_dir & mask ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
@@ -1034,7 +1017,7 @@ static int idt821034_chip_direction_input(struct gpio_chip *c, unsigned int offs
 	if (mask & ~(IDT821034_SLIC_IO1_IN | IDT821034_SLIC_IO0_IN))
 		return -EPERM;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_conf = idt821034_get_slic_conf(idt821034, ch) | mask;
 
@@ -1044,7 +1027,6 @@ static int idt821034_chip_direction_input(struct gpio_chip *c, unsigned int offs
 			offset, ch, mask, ret);
 	}
 
-	mutex_unlock(&idt821034->mutex);
 	return ret;
 }
 
@@ -1060,7 +1042,7 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 	if (ret)
 		return ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_conf = idt821034_get_slic_conf(idt821034, ch) & ~mask;
 
@@ -1070,7 +1052,6 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 			offset, ch, mask, ret);
 	}
 
-	mutex_unlock(&idt821034->mutex);
 	return ret;
 }
 
@@ -1079,23 +1060,22 @@ static int idt821034_reset_gpio(struct idt821034 *idt821034)
 	int ret;
 	u8 i;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	/* IO0 and IO1 as input for all channels and output IO set to 0 */
 	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
 		ret = idt821034_set_slic_conf(idt821034, i,
 					      IDT821034_SLIC_IO1_IN | IDT821034_SLIC_IO0_IN);
 		if (ret)
-			goto end;
+			return ret;
 
 		ret = idt821034_write_slic_raw(idt821034, i, 0);
 		if (ret)
-			goto end;
+			return ret;
 
 	}
 	ret = 0;
-end:
-	mutex_unlock(&idt821034->mutex);
+
 	return ret;
 }
 
-- 
2.43.0

