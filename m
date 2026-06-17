Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82B13DD516
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692740; cv=none; b=jgi0dlJu3peR1cWmQYVxaQgluzk1j8ZwWfWW9QOtVkaSZ5svM1lNmVy/XlkD6W0MVJrBks+wyNbVYTYyZ5FT66qKnAuoR2KFAh0nhZiK2BH7XHRUYNENHt8EZR7OmqZCHs+jzDGR/q+KOEvdyPuOEo/nNlG1YN5LWI9SaPkIfIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692740; c=relaxed/simple;
	bh=NLE+EBpHa+LlzJ3PP970fGwtuk6PJS4PH4FnLXZPSYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frjAwzANhAhj1wKwcerzD90f/guXleUfUTl2yQJ4Uh4tKEfJc/AJ5TjGJmRPd6y8tEj8z6mFbUIlpjSHGkqMUxkmsNTLasPxMcSCk35zAmi1Yz+57rVu3gQBtNT4VE1fRPBl+5tx/Ez9cdElv6WdUZlCnVLVdh9cH3DpleGlZQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWx5YoGc; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWx5YoGc"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3042a388168so431257eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692738; x=1782297538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=;
        b=KWx5YoGc7l/QbG9I5wE6bPpa0BuIvuOebNsVRjVDDZttdi5s880Yuyq6EsJmCYOrX0
         NNLpacKALnboi0Rx0xqyz9hiZWbDMoFt5EffhcicMPPdlrB2v4pdEcuS9u3ER4lZtTuV
         ORb6/jGBwhlAbz2y97af3a8E7JkS/zLjURNlAWKh2q9kT+JqiU5WPZDibSf60Ncm9s3M
         20tMXHkOY8ewR7aD/ZYYdZDJ++StzTSwoW/FdAr7NvHmdUzArFXh8rNvPz6kDYbHnQgr
         sG8gGGHQN2LUaHJ/Q/lNDNhhLC9iekyMcVe9hdm/hYXlkskkxB8N2vy4XEjj4l6rNRx7
         sB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692738; x=1782297538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=;
        b=pvPZRA1EJfHRfoOgK/IzQ5XdrJ+4ReH9157neyed19ASUYILYHG4oQDSKknm3ZwaBW
         OM6xCFMJZIiaxfiArPXO178DkQNdWeox1kqpr1BnWosvu50EMX9Qz2cOq0Q+3e2s+uDP
         SU5E543VhmdxCCzDxxBIiCid6OPtOGDoUEa+o4H/r3tflG16nM5DUpykujxfdyKLQg4f
         CR6eGNSPZDAa7lwrhYQNkJwHjNGHJ09wdbdFulZF2rLdVl8vLmKIYl8rVNeQilZa+1gV
         4Nnpg8oW0DaDv8Jek8IUaxZ+ekmZ3QcxMYBlYxDLZS/3yVEDqup35IV/nRjZJ7kKQM8T
         PJPg==
X-Forwarded-Encrypted: i=1; AFNElJ8F/lZny71cPAINa6/0XDmrHgsaWsJDirxcZdshEys7Kh4JdZKFrfMjM+930TyrwKh8vO8KCA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+YPPBxRjsOzmsQtwM4ELr0qRG37SdCBWqqG8WQ+qd5nzCM6bU
	FYDQXOT6SwGFrsyEaW2FlxbKyhDtOD4yFvWoqolZL+V0GtCfX4/vLqQi
X-Gm-Gg: AfdE7cnXd5AhGvNdTz6NXCKaLLP4+xojIM885LkR5xwPjzWTDd8Qn68uYogKNND9jd3
	KTQoEOkWj3et95s/0RiN6yKtOX0Kmds6GVHBh8BFa2zGQDFu4VOln5PY5h6W0yS3wSX34CzR1CP
	ACEh06B4LP1InyZ8I1CAP2Tmz0qVcogm1MmQWDIjhEucq71mcYto+uJvXyX4B4sNf7x+wrqkO65
	UhzciALtNVu8Nr4slX05nNl7S14abMWU491iTYqesgptVC5z5GGKQ6Ykf0cQ1NnEehaVEGpvIwx
	guW6jtUpNWpBWb44lJ7Zj7J/VS0qOJJBGY0USjk7STaZwWWFiuA64s0gepzT6Yy7dhhPQUKVmok
	cmD0Z+mDYfhI0Mxc5H9X5xZpXZr+uw9DxggFHSiNRmnJCPErF6zEiRMrdId1aDshvV14lhFcMom
	SBFonCsDBOPsJBz6zBgYzBUQFHrR+F/ac1BNFS/K37aQNYesf0OgbwvdsoUw==
X-Received: by 2002:a05:7300:6420:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30bcf5ff5abmr1293252eec.9.1781692737916;
        Wed, 17 Jun 2026 03:38:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:57 -0700 (PDT)
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
Subject: [PATCH 38/78] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:55 +0700
Message-ID: <20260617103235.449609-39-phucduc.bui@gmail.com>
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
 sound/soc/codecs/pcm512x.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f1..f4206f49f5b6 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -399,10 +399,9 @@ static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 	ucontrol->value.integer.value[0] = !(pcm512x->mute & 0x4);
 	ucontrol->value.integer.value[1] = !(pcm512x->mute & 0x2);
-	mutex_unlock(&pcm512x->mutex);
 
 	return 0;
 }
@@ -414,7 +413,7 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int ret, changed = 0;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if ((pcm512x->mute & 0x4) == (ucontrol->value.integer.value[0] << 2)) {
 		pcm512x->mute ^= 0x4;
@@ -430,13 +429,10 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
 			return ret;
 		}
 	}
 
-	mutex_unlock(&pcm512x->mutex);
-
 	return changed;
 }
 
@@ -1465,7 +1461,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 	unsigned int mute_det;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
 		pcm512x->mute |= 0x1;
@@ -1475,7 +1471,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to set digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1488,7 +1484,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1499,9 +1495,6 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 					 200, 10000);
 	}
 
-unlock:
-	mutex_unlock(&pcm512x->mutex);
-
 	return ret;
 }
 
-- 
2.43.0

