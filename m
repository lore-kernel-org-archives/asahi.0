Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A33D8132
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692867; cv=none; b=tN6z5Ow8TXWox06Lp/OGe69cyRcckaOEdqPtj52aITlU6i0YoJxl2Mdlvfr4o1zANpMgoN5/fcJvvVeBHLpx383ZcFap86VoNRtTYn1QYSjgcF4bxGeS7aVzHWFoZ6bDpgdpzYvMoEj4LgFk8iWumWqPRGgTs0ZeNfQ6Iry5dMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692867; c=relaxed/simple;
	bh=T5inPM0/ZembfY2Nrx+5l3rT9jXABsUVzUit1sml7qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdZ4jTUapwwRVP4Is2dia+fiIOch39bW6T+O7rEmTvbWaY3fjgNpvq+hH2PzCGliVHr0jtuZaU0BFXgtfTrEv2p0FJkEA905uvo9lI40yxiysLbVOjDPlw/xdmvVZHTPJgRXmcW7grJ7t4WSfvgUv97TSLrCp5+ptFgwjTvUjJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQTCqZI3; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQTCqZI3"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5794275eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692865; x=1782297665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=;
        b=gQTCqZI37FngjWe9YuZT0kkp4Z/nqek2MkdwMp//WQ4TA5jXGu/3XsvXHW1gAN/k2x
         7Yo+hFB5dMFqwpvdZxuz9jyqtuFyePkEROXtm2YR6E92K7JoP1ycST13tGxVkD6A6Lrx
         BXlYc+g9X7dFTm6T0qBAsR4IIWdBEHAJFrMBXG2P27tj2D/icgHMKN7H+EqyJfur9ghE
         /JkF2xEIoE1cSItequM+CCrg87+3BxWQZz6GWcf4lsXIbs8QI60DtYQhnbT6BCo6b2xl
         c7u5A3bXkaxfwENHxxhwyEV6xIsMqQZ7Rn5xPUUx9ePOPcySq1Z3Ngo3FxyLU26mjE6L
         j60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692865; x=1782297665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=;
        b=AR5wF+K3UewUkWZ0iTUc8aQQEV9T93+ONTy6xXsta2tc4SDAGMxij0B7a8H1oV1hlP
         pc+H48tJEdbIGCkuRLaEHZmL8q10kQo9IlvNEyfYFM7vKPPGhUHuXyZ75JyyRRKymJ2I
         5i7tZRIhoXsJc7cIjQQ0Ku07FKTwmCZLumZUOxJot+nzF1YVqh+Mato2GgkJsB9lVVpb
         La1l+yXkGVjhx+i+pP8cDoFXxCvdsCtymM91PFxlBqWlIk9TLNLp2VbO6hdsI1PtGeEM
         ALYJ92Vp/uqE++bC2uoUX8j8d3hM+35Jt/ndttVhebuG+4Uhg7ZZ9kdOLclNTYL4klkZ
         81vw==
X-Forwarded-Encrypted: i=1; AFNElJ9P3gDFHqtO3Rzg1pQgrWakHavFEObR2V198BLemJCSyq5P4C9xbUBRsPsnayNEY1TBbZeyKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyekmwLvVbfz/K85kac/uRAK3M3pMbXHUvZz/G5hqEbqNb/+Saf
	x8ldhG1SgwYHiBaXPBjB/VREAUkoW9MWGkYugMcK2ddRc2eMVFezs0Hu
X-Gm-Gg: AfdE7cn7R77lkshE9no+DnJP+nmekzR7G2d1FO/yy7+KSdOL0t7pry3Dnx4qOYMsKVb
	Lg9SQpAR/Xwg51auH3c43Vr75PowE/ev/F4Yh32nHOZuKo8Uw8kj+kApxYiErvJgGD1Sy99Y7o8
	6jUWe4Ort0ND7tjcmLSO6uTQgk/sYuhFIhfpIe3+2jjaeBPGw6W/dnNcAvPdciMuDy2XG5m5bph
	zzjBcWG84OS7NSyK3WivrKx3fwyERmVvRpNiEY0oe38ppSCLXBOyG1FZxzOVaBqQVr/seSufDtY
	K3qQJSx4ky6sUrCHeZ6l9ggpIbq+th4heOABTMMpl0BONrElGFWqBT7UxpaAtgj0rSmpw1TXJ9T
	E/iMabkQBAnXGsWxXg6qL3BQqaFLai4cqgWCetVdaP1XwrwOyGU1hZu3IS4BRUU689GBB5N/evR
	kqWLCEzluTh2zZfunaZybBrqK+rYEdfMOkZKKa8/td2KeRyMPzCsQU3zpv0Q==
X-Received: by 2002:a05:7300:30c8:b0:30a:e52d:fb27 with SMTP id 5a478bee46e88-30bc9df5a44mr2016767eec.11.1781692865129;
        Wed, 17 Jun 2026 03:41:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:04 -0700 (PDT)
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
Subject: [PATCH 52/78] ASoC: codecs: sigmadsp: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:09 +0700
Message-ID: <20260617103235.449609-53-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sigmadsp.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 2e08fde3989c..592aba25de11 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -135,7 +135,7 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 	uint8_t *data;
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	data = ucontrol->value.bytes.data;
 
@@ -148,8 +148,6 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 			ctrl->cached = true;
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -160,7 +158,7 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 	struct sigmadsp *sigmadsp = snd_kcontrol_chip(kcontrol);
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	if (!ctrl->cached) {
 		ret = sigmadsp_read(sigmadsp, ctrl->addr, ctrl->cache,
@@ -174,8 +172,6 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 			ctrl->num_bytes);
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -677,10 +673,10 @@ static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
 		return;
 	changed = snd_ctl_activate_id(card, &ctrl->kcontrol->id, active);
 	if (active && changed > 0) {
-		mutex_lock(&sigmadsp->lock);
-		if (ctrl->cached)
-			sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
-		mutex_unlock(&sigmadsp->lock);
+		scoped_guard(mutex, &sigmadsp->lock) {
+			if (ctrl->cached)
+				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
+		}
 	}
 }
 
-- 
2.43.0

