Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825AE45107D
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692571; cv=none; b=YPLRTXmBFly6hEF81GcMAAaVY0M6Ncfto4K3qi6J+DiZrvCVtqPDIsTQpFEt0AR/OqCGjw38MajGjtMYbPbNIiCcwpWBrQozEV+NVZS/iAKZvInsQObwrEFSdflRFuRe3ngetOVRhTrrg7u2+LyEFW+TD4fBnBWoWlRPTzK+PcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692571; c=relaxed/simple;
	bh=1Ss+Jdqrla/9eoL2y7H5bMd8/rEKPHfX+5UCiREXhpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hra6/mBqBDztwxn3Ss9AB0SCiajGUGNzLRDJMY9n6lunfjRjL3Ea5sW8rxHPgyTsNpkA9qSWrI+59wVAfZV5xGwEv6pBUNnjinjmW4PMzGW5+Jiqvk5LcYzHMFxdiJLOnaCDRoX8+X5Tula67rNlP4JAbLLeSDDKgeoA+3AEko8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKuHO3RC; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKuHO3RC"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bbb1bc064so3544087eec.1
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692565; x=1782297365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=eKuHO3RCliNRJJa1Af8YosH8674FXdG6xkJmLMTEFeCM92hAJKU4KEXwnFyhnEj+5r
         cJG8NgGUpAmnBRRktUkBmKVtqUz+xpCaW8EizR36Au1+jgqwsXAL2gWeKTkPX9IEMBkN
         Rhc/2I3D9I4ardUXT+5L0A6cPetmNePpqWF8Un33gx+kDdbKICuOziBtiXufzI4QG2i8
         iIIPy9RYFtH0vlOLXtpBSQkkvp3txUdtKPHicDbettgTekfw6cQR0YGAR+Bhon7I+Bqh
         Q5gXDkTdxWClQyupFprS2j47NvfMZucCwvKkaq3fcZmWz/RXe9yz9iX8sIlHRDs029Db
         eLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692565; x=1782297365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=jDl8mWfPZxwpv3Yq+cbFiQ7X0wXHQ6FDY0r9UpdTotsvV+byKEBTzj50DoOAWfYHxA
         sn3zopoKbyEwXKN7U+A//ktaf2sDBT4lihLjnh2ZOnaFRTP4Of4t8IKCWAkakRId/ckL
         xbtGpVegC1Dgcu9wCyPPnrTpsfYnon4SRQMPHzcak5YKy7pntgr1G+8Wt2evoT4fQV/T
         vD0EAHTrVeYrCKoMImuQLAH5zkP120VFBs3ErMAOIvxJY6iTXWqYbOW9hxhh3wK3lPLB
         LOYSUAI0RJPikUt7l9t83fGHGRvn6oRnGGTk4huD3c8Xwps7TTni3+uymmXyNucQqzn9
         JljQ==
X-Forwarded-Encrypted: i=1; AFNElJ94blTlkgAJgEFzHQ4LsQpLoP1+nuuOn897MvYvnurkV0nVlPMc0GuCyE/Oi3Txt6Mx/9E1Zg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmtAXjk6oTmkxtRmJYbKrJ2LgZIKcMzv2PEtFTRze6y8ZZMr+E
	sadEHxeUXNfNtioo13u97T89pYUU+UQvuR69dk1Dgrfn5cdJafzGbBuE
X-Gm-Gg: AfdE7cmuYAoGB5i0vhm/2CyOdXeEiyyLrhMFWA/SzcbSckauKBIpkLN8WqJ4OF1itih
	B+DvTDIz9JrVBnbXCrOr1K/qi7CeDq5azRC50x1luQEbS2wfqGa28hoVp9hFV/78LdFVgZiCmN/
	lJjITr4QiKGAfE26MQUM05aCFN/yi5gNLpzbVHsDr5Qadem+wIFiJL90iNuGmB28heAiPQdy42F
	zWLyOE/tm9Prm63Jq9pi8QCMjt443xyGMWwckU0bIKZruPHuOeqccixXFUEJxiYuolk4Funa0qI
	lm3T4zqQ/JZRjeIFmIbR1SSKUE1u3a71bt9OuYDFLVFHhAc/pZQ0NrlubUVtMeeEKu4iMc8fHMg
	3U8mrg+mOyGdnrteSsABIztIvK+XGjMsWwHaoyMr/7yZZpAD0LzLSm/ZVK7goi+AWZq7dTR2e7h
	60s12pQEO/EUF/x+qJjb2a8EM5ivNf0mvITT7JXuBbh7x4WLtaTwzPU7yrlQ==
X-Received: by 2002:a05:7300:2211:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30bc9ab88femr1691948eec.11.1781692565454;
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
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
Subject: [PATCH 20/78] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:37 +0700
Message-ID: <20260617103235.449609-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l85.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9c0eaf24bd54 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2504,9 +2504,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2536,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0

