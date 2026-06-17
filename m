Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC134418F0
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692883; cv=none; b=bg/4fuHN5Kh818KkSMH3vqDlLNzWafFY7pUco1RNzMtlV4u9XW5HLAWIn8ts+ehU9Q6YNnfDGEL6aC0BYujh+MySqS11uudFE8Z6WqdIoUKbMfnTYh0EcQrWH0Iwq+wK1DGEsvVIC1uY3JtSidKiW0o7ZdCb5Y4FdE4axPawaSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692883; c=relaxed/simple;
	bh=9xbV3n1tUxWEoIS+358Ym1B2iqW853YzQpFC5yt90Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FNvpNuGEMeeBldSHstzRoAsBaMU8Yk78I30jXYTl0FaYjCsW4j+jfTPOq/ebKGtu3a+b9OX48wT3IOvlHX1PqYMHKDmzxMqELfRrfPBbggLvuPec30eXscnHnoRDJDlnnBvSylLXkPvhbqe/4R7AarDihvPneLzdI4vVQrgTT30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvvGE1P0; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvvGE1P0"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304f590dd91so6364040eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692882; x=1782297682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=;
        b=FvvGE1P0qg6SKXUXylTjk7OYW39iQ1kIYSSbn8YAEpH/Ui9tStXYy1eIIlOdxqBnye
         A7QLAhv36IG/inM+9cHc20YjXHRmFUYFBuFZY/pyKctGzH59X273qrMmW2c2jHZRk66p
         5UO/0jtdJR9yUb5tcbH8X5TuigcUvTEAzRvS8GMXnvoiXvzSI2icGYGCXVbEK1CB2VE9
         npsvZXMLmGY9TPB+GB4poGRyE0O3w44yIThG21up9Vn9EAF2Ons/w2X6+065/+rMQL8s
         z66E/Kyzj9EEmICWkAJtaNmSaQTYjWvKHAiQfb2dvKSG2Fm0Pnp8CewgDsV3I7vKeK+5
         ocEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692882; x=1782297682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=;
        b=Nv7qIWmnZiJpNqAv0EXDG5K/GCEgqA5fuRYFSTSwuCdKrf8Fgs4dpkhJTychQBOQuY
         zURVhBJaVRDEEugZLQtBFdtD6Bf8NR5LMCysIbFUDsMFoqR2EXkgdj4Qv8WPQ5JmHa5N
         Uve+JLqXWe7OhGgfJv5qdUTEIz9TTXAzrJ2cs9EvFv0dty94+GfYX/XxQIqZYZDrrjvn
         9BjI4slC4VwX4cFuxkm6iVH8J8NgIRhj8nnZ9292Vx7eEENKemuPHHJD/tyMcTbrchLS
         bBD+y43UzJde/JJcduOagS1pK2RqQwWhPOpPD3HucL8LgCCuowsIBbUdjcVaCAGXFCvJ
         tQjg==
X-Forwarded-Encrypted: i=1; AFNElJ9Z6/pNJLJZNcfjUPHMm+9MhaXQqhOJMall9Hq+tL+tgGmRA8Jd/6qTMobJvfUOPsxWnPE3nQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4qJcezpx+deyAUjaHelHp12tWFe5OW6J9I5eAWEWvVgwgdJim
	5j3pj8bpFajKN17joAfxQjDMj5gyKTa+Bc2Xd3y1DNVOOBQoSzVPvy1v
X-Gm-Gg: AfdE7ck+IizsPXJk00tsVnU77PVf90Al7dAStL/zatYplwzRb8FcJYs7ccRr/yhg+7C
	R+TxgHVamal1JM9IOA10DDqxMIb60R0DQoRtpRFOlbnJYNx8os8EiMHvEV0M/FAWEp9vVFyBtqO
	Xbm6aECuJaDYe7Rg0mJK8O5fSL6LPmrAYsNQlKVmDJ9gWlfmQ9j6JQQs9sdQeEoOhuvash1q0XP
	pJKRN5CWogQKv7wXsNV9GNV46Bt3yfzI/T+3ZrwMxfLAO84RhVh4//aNS3/amyse/ktFNGWoD1Y
	f9u6eZIx9Ogh1Rh8yziu9TRk7Rsh6pKM+m2kvreJLzQwv4LzET3FzlhkD9pvaMNZSiAAYnqXUw3
	88hO20spZVSmTc9IOiqz3A+DYy82nBa9iaiaeH/H1d3VgxkAvoTGunmdS6SJVpn4SkBnDwwi17P
	sn7zW6aWU8PBMxM022rFJEnp26J6EhgBVnI4vAtNdPxVxeYw8=
X-Received: by 2002:a05:693c:2d88:b0:2da:1874:f3bd with SMTP id 5a478bee46e88-30bc9f57d3amr1910340eec.16.1781692881708;
        Wed, 17 Jun 2026 03:41:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:21 -0700 (PDT)
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
Subject: [PATCH 54/78] ASoC: codecs: sta32x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:11 +0700
Message-ID: <20260617103235.449609-55-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sta32x.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 652c6e3a9e63..61703e6e0586 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -271,7 +271,7 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 	unsigned int cfud, val;
 	int i, ret = 0;
 
-	mutex_lock(&sta32x->coeff_lock);
+	guard(mutex)(&sta32x->coeff_lock);
 
 	/* preserve reserved bits in STA32X_CFUD */
 	regmap_read(sta32x->regmap, STA32X_CFUD, &cfud);
@@ -287,19 +287,15 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x04);
 	} else if (numcoef == 5) {
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x08);
-	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
-	}
+	} else
+		return -EINVAL;
+
 
 	for (i = 0; i < 3 * numcoef; i++) {
 		regmap_read(sta32x->regmap, STA32X_B1CF1 + i, &val);
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta32x->coeff_lock);
-
 	return ret;
 }
 
-- 
2.43.0

