Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37671406820
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692457; cv=none; b=YpadffHoZMcD4eNr8mZ7aDPPsl9tnAox8RxY/I4qp7/KCjFMi5OvKCyzvtV8QAPZ3cIvb0sPhGhMjfKyQoYPRoFhYYJNoGGY4bUVMzUts43f7JLL0Zz9lOa9rV+lrxVZDIFWJX3/XIJN+rVcQPIex5XK3oarDvh5kr0D795Aoac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692457; c=relaxed/simple;
	bh=HGOOU6fZkQohzFVizJkVWFZ0SqVU8bTfCS38p9GtywY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TeLt03opaPMy2hDI544ImXGsxNONWej7z7fsaHEoZKD3ZRO3kiN9gpJC7OPJoaRgq8YoX0UXkeMGI3yBle+987A3dSF/v6azdVi540LG9lrCcr//7mZ7Tgqv9xX+B0Vtbj1cJcwsLCAcdeRIIg/DiY6j/fqPDgQXkqaapKUVP8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RosJIyYx; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RosJIyYx"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30b6dad2382so6289309eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692454; x=1782297254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqNx2vKm7fxQWOh/072hFj9tMPndm73NkR+TwTW9QAs=;
        b=RosJIyYxhNhH1eJBBWpuIghMINe1/R6D595SvCjk6vBY5gTbt9NwDqX7LsE6Gui2Ja
         ZTPp7X6aYevi50hlhglzX9YGZ7mP2CcuUh2/Hk5kxUnMsSHPGFyx5NVUKpqkdTcC0a9/
         usUlDFG9lb/wFq+s7XbicmXLjUv712LUftLEbGoy24V1r+5AT9u6zkQhBS5Hd1qwcQkZ
         fG7h5tspf5jDT0kUVJhFal2KdbIPOWyQgqn56Eee5OQvAgEH3RGDTFlAcvUbnU9i/H5M
         3bOQnCX2JRTcYT9WhV4b/dm6X2HJw1QH6m90j0aQUHwlPc9N5DJGh/vx4I7J2pQ7upvl
         GSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692454; x=1782297254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GqNx2vKm7fxQWOh/072hFj9tMPndm73NkR+TwTW9QAs=;
        b=KSBPxrgAPLgNknQXe5aWVXs49NS8imlSbefmIQEzDzDdxerMxoqzv0G113HrMVC2oa
         9vcLYYtwe3Byh6hUxfUCVRWpByoFTus1QCU4UtzmrY67VKBli3cq4MrzogJFwQVh6HO+
         XmK6Yqng6KjB+mUtdqRdbsI34yfPxMeOLzSb1bJInyVXZP3f438dItqsBrzFGpaFHX2O
         XMeN3vYyEXlA5CpRHVWfDKG5DUINid8p5oYDJQ0qpvSwcqxNNrS17Tpvy0dcSeRMb+Yb
         1gKNsjaO3xRZ4cTA4pQ+SvepM03LfaDf32SWH8vNGJ4KerSmWloqKdWAv1Pk9dbFNGWI
         +unQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hgZFeaHShRg9upyutu5pDdWWj+abzhPfbO9VwRweC47jXS5PfcYZdzzRWC6+/L/P9kR08WA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxPHsoPCxHN8lqS5LVrL2bxyWbjeVE6JvTioHTKhigVbKncggLA
	6D49Ho8eyvt6v1lhhf4jBqPwJoTpiUBotXqN1ZY8y4ON+W64t4lrBdca
X-Gm-Gg: AfdE7ckehHjLWoOfOCWYgvBIr3Khb+6VIe/wTVmzMCI10FycQaCJxCmO54+Z7ecZEoT
	cF8fvWvs74Lz59tlxjzZddplbahpQ78rNYBUn+hUCIbYxIWd/MVUK4YnWi3cp0+w18CfPOSjvDw
	80zDHUhYJ8SJUfOjfzRWfFYvuNQ02Ed+DWu2iI20mV9O3CP73+h7TaJJ8i9GV/8EjQAKR0+SZeA
	S8lL80qKmNWkU/wVamJa5A1+Exft/QTvfUv50h/2Amte9DikOPUOXKW4XuvOk54edM2hCk6ga5p
	NmW5NX4uTolUx/rXMlXKvmY1KATCkyvWGhbHVivIYJ5HYzoX3M+YzvzKO0tnTt9Ap3gvqsyR4Qy
	x0GW3agByLYKePt4BtlLCe4Z1ChVsYFy2aBNGM6lOQgtesI/a3yyUlCS9x0Xly9TCeF/Pmak+Kc
	P0XinjgghlLLt6FnWERqpzXjhRK7oqlwCtWP9TLGrA/S2plYc=
X-Received: by 2002:a05:693c:3105:b0:2da:44ac:6d17 with SMTP id 5a478bee46e88-30bcae074bcmr1680486eec.17.1781692453941;
        Wed, 17 Jun 2026 03:34:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:13 -0700 (PDT)
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
Subject: [PATCH 08/78] ASoC: codecs: aw88261: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:25 +0700
Message-ID: <20260617103235.449609-9-phucduc.bui@gmail.com>
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
 sound/soc/codecs/aw88261.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 549783d3e75e..1bdcbbf5e3b9 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -960,11 +960,10 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 	int ret;
 
 	/* pa stop or stopping just set profile */
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	ret = aw88261_dev_set_profile_index(aw88261->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88261->lock);
 		return 0;
 	}
 
@@ -973,8 +972,6 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 		aw88261_start(aw88261);
 	}
 
-	mutex_unlock(&aw88261->lock);
-
 	return 1;
 }
 
@@ -1038,7 +1035,7 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88261->lock);
+	guard(mutex)(&aw88261->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88261_start(aw88261);
@@ -1049,7 +1046,6 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88261->lock);
 
 	return 0;
 }
@@ -1188,12 +1184,12 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 		return ret;
 	}
 
-	mutex_lock(&aw88261->lock);
-	/* aw device init */
-	ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
-	if (ret)
-		dev_err(aw88261->aw_pa->dev, "dev init failed");
-	mutex_unlock(&aw88261->lock);
+	scoped_guard(mutex, &aw88261->lock) {
+		/* aw device init */
+		ret = aw88261_dev_init(aw88261, aw88261->aw_cfg);
+		if (ret)
+			dev_err(aw88261->aw_pa->dev, "dev init failed");
+	}
 
 	return ret;
 }
-- 
2.43.0

