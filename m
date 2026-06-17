Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7806147277C
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692599; cv=none; b=d0KqcblQGdKcUts7h+9OX/h+QFSW35pJOIhEIMROC/T+GT8b2H0QrG4pKhzYyHNNKQQ9tyddWoRjjDe6zeyYeS3Ib/3U3/SqpPf0/Oq9h1prM/IWn4RbHdl8rY6Unsl+2DRHLhA10R1RpUgIOV8S2llxA++alYzjFqcJZwm47og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692599; c=relaxed/simple;
	bh=f1BYheWpgYmqvxFP+LuNBK9MoGzL9oHfU4zeAFfLjtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=db0yPPn/jjfCGr8oD95WHh+++7GuBpl2gyprGJt7J6Unz5Akgck7NmoNYPRWu2OLg31FgL0+a1ZoWjowtvnMjhQ7jJszzKu9CJl3yNr7ln+4dNa087Q0ymgiDMLF4auPqGaJnG29MlpUvmDXOe/6FTejrqlVlQlDkKCXpz1G/5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMY3TfuY; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMY3TfuY"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137335bc3caso6885379c88.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692592; x=1782297392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLoxnhSs+1o+EbkqMlV4TtbB/c6QxxOb6So3gGVF6YM=;
        b=MMY3TfuYcAJhN07L6ynbheizELeL+643adsvfEsk+yqQPPCg9KDDjl1rMANAMjXU8F
         cWvkQ2LL1t/7YkIs4EsFJZINLzOS7tyJY/TV5wHQhAtKPUkFn/9FFKv14XaPJyi1dtAJ
         jsZxYjvDkhINZf2pMqbsgmViK4Sl4kkFCQKJHZMY9fKNfp1JLwov6lGIwroKqZM5kL77
         pDWXffMEQVJ6qYZhV6vCKvkzFUVxuCaLb6N3a3Jbdyjy2ZphozUSDptx2WAvV1rY147o
         vU0oNwyb0nWltTEffgpgn8LhdTLnyB8Atu1LhWbNVINp6gyFu5h+5q2K75In2YUao6dz
         O57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692592; x=1782297392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZLoxnhSs+1o+EbkqMlV4TtbB/c6QxxOb6So3gGVF6YM=;
        b=qNO7oKGlmedvXDBNepeQe1zwSlU/cVnLj09z1ppqv7CRAtP0FOO2bOZqlJynM31cUj
         mlDJz8jw2JLILBz93lRjOUnoO8PbJZcDJ5bFz705xPCrB2B20Fwip6rAWOvBdRx9oHo1
         Z/IxMvx11ZopOiGRDT0BjFk3yX5IbmPw/Q47eGmSHCKP81PVg7cCD2PQgGUj1rLjY1hZ
         pxJS6YbMWY4zI4XeadfJlXnR9D7R9KHfq48JdYUAPQcuY7Rx6IXJtGtySxNoVyPd2xc2
         fPqGDp5KMNfiEenbtalpNZdC0/8lnFoqy0sdZ4x9mVEIYvGkgRLn2SVoYrQ4SKeqSRkl
         dQhg==
X-Forwarded-Encrypted: i=1; AFNElJ9LswUwjruFE57JnYmP/pztPbpyk8UN5oyqlaYZ14Mjovdh3f2ATWfzPolIfN22XqaSPN+d1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ9FYVbCcEzugq5fqY/idmN8IoXPnfqGRMR55Y+T/vMnA32ql1
	M0GKbt+e6a3Te9/ZnBvgcQEIdxs4m2zEmBZBSkbVwNpO/ANJ3qOtc+KK
X-Gm-Gg: Acq92OHn/O8Ar88ifUn4qbAhQ40uB/yAD3YMpwrqX6fdjG+e8E69vK7j9GLab/tWtoS
	jw7o6HxVpC+qWi3T0IPJdeSIMhlEFHc8Pzwy/F/nPQDzSgjvegzSpIrWhWYB37vu+At1Y4ylsFL
	4VC2H876vS2Gg7tb+1QgDPyctssAlnEMk6VhH87GavWeYScLGqvl3Nh+ManqmMHRO71ljtKCrfW
	sw4sUktm1OqNMtLqHN3zDrG9x43ORmgZvPgaSzV/oZaw6pvBFGB2zSl9iaAHR9WLTRK5uaokLCl
	ZaYPv859bl3dA3qH6b+wZ1ZKKNp7tWkAEDM6+GMOXJnz+/IxgEa4Xlwcyx/9CK2B7sYA3bl/xuk
	BqNJz6f9tTmyWiS9X/NvMuQS4bi8fhrJanvFfEIrM8ulf26z04Mh/MoxzM1zz88Rwvq6/jHdw1p
	Ku9aTrYFGXJ92rxigHY2s+wP6nSEV+9QLsHLpDCaPcEa0jYKs=
X-Received: by 2002:a05:7022:fd08:b0:137:f532:e360 with SMTP id a92af1059eb24-1398f62354dmr1205523c88.3.1781692592243;
        Wed, 17 Jun 2026 03:36:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:31 -0700 (PDT)
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
Subject: [PATCH 23/78] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:40 +0700
Message-ID: <20260617103235.449609-24-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs48l32.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 086ed0f57a85..d45e339f76a7 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -236,15 +236,13 @@ static int cs48l32_rate_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	int ret;
 
 	/* Prevent any mixer mux changes while we do this */
-	mutex_lock(&cs48l32_codec->rate_lock);
+	guard(mutex)(&cs48l32_codec->rate_lock);
 
 	/* The write must be guarded by a number of SYSCLK cycles */
 	cs48l32_spin_sysclk(cs48l32_codec);
 	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 	cs48l32_spin_sysclk(cs48l32_codec);
 
-	mutex_unlock(&cs48l32_codec->rate_lock);
-
 	return ret;
 }
 
@@ -2242,7 +2240,6 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 	struct cs48l32_dai_priv *dai_priv = &cs48l32_codec->dai[dai->id - 1];
 	unsigned int base = dai->driver->base;
 	unsigned int current_asp_rate, target_asp_rate;
-	bool change_rate_domain = false;
 	int ret;
 
 	if (clk_id == dai_priv->clk)
@@ -2284,19 +2281,18 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 
 		if ((current_asp_rate & CS48L32_ASP_RATE_MASK) !=
 		    (target_asp_rate & CS48L32_ASP_RATE_MASK)) {
-			change_rate_domain = true;
-
-			mutex_lock(&cs48l32_codec->rate_lock);
 			/* Guard the rate change with SYSCLK cycles */
-			cs48l32_spin_sysclk(cs48l32_codec);
-		}
-
-		snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
-					      CS48L32_ASP_RATE_MASK, target_asp_rate);
-
-		if (change_rate_domain) {
-			cs48l32_spin_sysclk(cs48l32_codec);
-			mutex_unlock(&cs48l32_codec->rate_lock);
+			scoped_guard(mutex, &cs48l32_codec->rate_lock) {
+				cs48l32_spin_sysclk(cs48l32_codec);
+				snd_soc_component_update_bits(component,
+							      base + CS48L32_ASP_CONTROL1,
+							      CS48L32_ASP_RATE_MASK,
+							      target_asp_rate);
+				cs48l32_spin_sysclk(cs48l32_codec);
+			}
+		} else {
+			snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
+						      CS48L32_ASP_RATE_MASK, target_asp_rate);
 		}
 	}
 
-- 
2.43.0

