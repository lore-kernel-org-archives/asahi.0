Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CB344E049
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692557; cv=none; b=Mi6ZSo1YJQGkDYg6DTTSCagXMiQGfu7+p+EdDR0Hrfl4cgfX1TwdZ0rQSYtnZW62d7ilhGMV4h1M6ZhJ0GedbNrzqnHW1rZMcErhXLgES/8Wl+i09n27QV9q4L9U/ZaZMtyXMaEZyMhd/Rrb+fW0KXh1WW9CzPieUxiI5cP7Zws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692557; c=relaxed/simple;
	bh=HwBnP5jMPzDPf7Fr6DP+mqDNQGTymWfg0eGYV92iBBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l74sX7N2fQLUJfMDHrehjxQP7Zv6QDj4wz6aYcrfKXbY0pfmxdiwvnfsUh2DF1QTj9KqrcP7dob52H4oHzaX6YEapLgEjORyk3FTOvACPmWvsWqATib6uhGqB2oOcxVopOlRsqOpWqe4fxZCLZ99onj4aOOqULJUbYr+IwARfIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnONDQ9y; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnONDQ9y"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304d8362a58so601498eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692547; x=1782297347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3pG1tEFOJl9HudGSqGDOqn89cYK/BAFq0QnLsL5JtM=;
        b=NnONDQ9yKOG61dmDCMsOwpGrkbK5kioVegYJ9zmbMJ7O3MJFmbXhIuYZFZiey+wSjr
         5PBxlmZzKvJRYsqtXJJAG/jrbaoL9W67OjhxIN+XudCO7M82g4zLeZLULWNkj3EXOO8L
         rhVJDBPYTZ9VE6Nnw6gOnmsaUZARsW8jBitCGo+5jKETdlr9EoWBIgXe1y2b/lNEKNX2
         coJA4gx4Gef9Bmq+eiq8CdDtyrnUrY5OGeAqRNtCJaRoKV6vj+kk3zBv/7EqgrHIF/6p
         bD/dDgtT2bgEhAmPh8/HKRadZQvclkjgNGLqTR1N4YaNskrk90KiMm41xD/XvpsPHyPM
         uETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692547; x=1782297347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3pG1tEFOJl9HudGSqGDOqn89cYK/BAFq0QnLsL5JtM=;
        b=JNBwDdUaF5I5YhfpkBvd1U/rDcgRs7207F7tWcwqxQ80qYVhNbuXw1oQKKsiWEXGwc
         k4gjoE3EA6vGAH0pyGuvaImpnkFiRJJaRajkYVTJDd4qjMAUZ7P/DiKvtyudg7nn5z5d
         1T8RHOUbn1psyxMWrinNeM0NkzqzFuOlSefNF/tm4Lk6Edt0zv3PGFr6Bi5vM5s0QiVE
         lf1pHlbBQ4DGZwOgfAiPpM1SSZ2GdJm8Vj0hNwO7KUFTJH/4y5OQ8PUIAFQv5RB+y3jg
         Jm9o4IaCcTo7t2AKiuoEPauJwbYa1fAu9L8+o2rhWqXgIqbanV+g5cTEz61cdcTYFfkZ
         tB4g==
X-Forwarded-Encrypted: i=1; AFNElJ8UYOz7cSkCHwfx5wMO4lGuJmg90Npmk7xJira9/B1freoMsaPjPfV9j2tZGmDEf8u0XqMLqA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwG4UT/VUZ7waB1rtzJc1O5A69RfXl9AWE+tPtkiDv/fiNER2fC
	qQQPD+jZdPB1fZ4NL4SQXaidGSvryEFmkrscLDkY3V5okefL9nye4/cp
X-Gm-Gg: AfdE7cmfWvCuFN5+3PIlRKDPtqERs9PQOQMCAI7iuk5JQ/OGw7Ym+7YTimhYDJDCmui
	iDw6tlYIkaMnKUcUllTxxnCGm/b1IlYnXdUfZW/sI1/DOiL8md6BNSEsZbtQOAlsPX14VHg7EjG
	aN2R6dnneFpcBnaS5OA3mkQUobikH9Eq7oKDId08Xddu7dO56FBz1RoBelKjHM6eytzW3rPNz97
	4gCm46vFpel0afYjHiZ7Piq7odbjoZ8ixBbLkjLebeGMJCeasaiJznTDBrl1OY8loWh4yMv1UUE
	00PKHc3wSI8ZKkNPHHQ2WergPKpt1k8sjcasSbv/aBy7dSQ/jqeUmhWqjd3INrZV2Affdbo0pT7
	JJo2LHxGFFp7zXfxDqdoufJ4kI8DqYHl4UTbLDBxiwqjvtXE25NB+qxf5UR7CktXvGlCYsRYcHn
	sfVro0x2Wt9dlF5qPRLDOxpIfXJhT1O4xmN8HHk6bhbzGFnwI=
X-Received: by 2002:a05:7301:6402:b0:30b:d209:dc18 with SMTP id 5a478bee46e88-30bd209ff68mr689839eec.10.1781692547532;
        Wed, 17 Jun 2026 03:35:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:47 -0700 (PDT)
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
Subject: [PATCH 18/78] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:35 +0700
Message-ID: <20260617103235.449609-19-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l15.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..7a69f79fe496 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1285,9 +1285,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1316,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

