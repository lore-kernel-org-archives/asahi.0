Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967BB43DA25
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692589; cv=none; b=eTaqK62GNy6d0NTGF8NaUM2n4Ov62DJ0yhESoWhDXk0IR54d6zvEQVvSLxO+UoJxYpWLdaia5sK+RbY9LeJ2HnxI18MYzzncywJU9keSzpBvzEy934zPDRNWiv+L+AfsVk4aHQbqyvuiZV6pEXt1y5mHA9ELamt4e6osxZBcJME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692589; c=relaxed/simple;
	bh=PK1w8ixg4eqPxCHAGSl2zZcTbcNUnnrCgmRQCcVJPCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jH8aE/Y4JOlE+AsZgmxC4Mj6HqP/kCHhjNgxk6OoQPSdOwBoYzZ4QuxPPcTq0LMHF1nYlWjF6m47h6jH/TnME+UYBpxq1/Rhff97q2VR2aFu4jc0ma/jklGtkHmYiwOujhBoE4xvcXndByhlIuAuAbybtaGHNLqHvrxZ+WCmPPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=si8qqW+2; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="si8qqW+2"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bd59b6eb9so788443eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692583; x=1782297383; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=si8qqW+2buLx7/bZuV1u2FBQkF7fp/rLBGl/sKU9DEQfL6Gs5ZJuNHQJWeJ3om6SjG
         sD+rhCUDhtcBRQWrF6flzCVZeP7vSbJzvZ1grjjJVqGS0wv8w23VZKQA9UuHVcVrZJOC
         LY3FXFlPAc4daDOo3gkJgDw4jII0pGFYs23A/W9ljIt/JcaXb0bh3lNUNM6/9DuULP7m
         IlwSDKa2qXS0J31ZiQPwulOBiZFC1t/zh4uDl/Evw98wahAbv+vZ71vJznnJRP3IWi0B
         Y3w5ewDmgJsAks6uHf4anJNWdj1oQCuZUlMB4T4BOahZvSlRWZc7L4yIqlYSYYcuefW2
         WLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692583; x=1782297383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=bBoiklLjp7lt+P9Lth1ULUbgyhC2HvyUlN4nHE8W3vDjCtvUP/XmWM6Qij4y37H1WS
         qHwaZLLIQed3pF0GBkDvmUNtamuLLC5UnkJPLZ8OMtHk1Tr3KuG6tdOskZrCHsmOIAWi
         RQmApzpDnla3uL3lXa+kzh4cDVtl3XiI9BowqJ145zA2HYDfFd9ao8bZuWW1EQMcUnp2
         OkHRpUbIHIHo9XxZ4qjX1sfRgp5M/U5nUwtRsWZrG0uPvPrWuwTd2pY/dmvaSm0KOs/D
         3edOnAqPFqRVZ2llVuxWSa7JYzywEt9nbUJEz1/oLpSKNkT9UY6Keq8HeWdnDfFbGI2+
         H6yw==
X-Forwarded-Encrypted: i=1; AFNElJ89uj7cTeu2mbguWfY47hKin6fJd49xFjXVpIHulu6VhwEyuBEWmgqjAmveaCh2TQCjACvxuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzM/ftCNqcD4vCjImCM3yuHkm4QHIntVnlalRd6NO3HvCtNXcba
	jt+3FpkN4TtSCeYM8r6XHAF7UbGe7Dy2QaM2NVH/6iFdpKXxG2h9v0TS
X-Gm-Gg: AfdE7clVab9h0daByLUq3MpqOhlwUGDpM0bUOh0fovqkv1TSzhT/JaEg5GVqMQt2zjI
	i8xt3B75soutmZsqdxGFkHLLenm/Wjue1buPXEChxdGYTCWcgfsBcwayYgK/o9U3582VsS0kU1V
	wZWaCiNZYmTPjqp7bVMBnu/Thie+A+So+EIyk2m9nEC0LgDhXAgDLhQPvZ+pCrLekmiEBQGwvoz
	i4MoXJk8sPSscNaIbEZEFedLgTAerBuDEPFrUmRLvz6M+DDkKEXqIt58G4VKoFVn+VB7gxkbnPx
	J6Nm9Q5Dut1M91EEInMoR5FZMDByB83Ffr6sBPu885G87FKHxu4qxvtCYe9l7+4HoDU2lWAZAKJ
	+dhg5+IpCfh1VvZzEmhwzkmo1i87TKj5jmz+Pf5Iq8vt0nev8t+C61qnr7Jrm0R1+BVB38A8SGg
	sYMRqepFUny20QbhmIupSrh2n0qMIquQ2CFKhLYjXq7fD63fM=
X-Received: by 2002:a05:7300:430e:b0:304:188d:d0b0 with SMTP id 5a478bee46e88-30bca0b8c3bmr1984423eec.20.1781692583469;
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
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
Subject: [PATCH 22/78] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:39 +0700
Message-ID: <20260617103235.449609-23-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l92.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..4abc896caab3 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1892,9 +1892,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1921,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0

