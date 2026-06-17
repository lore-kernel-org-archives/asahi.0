Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1218B481235
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692711; cv=none; b=bcJgh4adIRvaPstI+kc1ah+jLFMqEZS+niH6wQK3qdm8HrrXP/IvVmVIy1QYorTDjFA3cTw8sGLJjlT84gy6WXjEZ+fJvSx1R5IjHurK9PoKjV+YT1dPTdKN1zk8D0Zc15HnAVNrg8FcjxQ5QjJ72Y7ehv9eOenVnqB1Y46P6XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692711; c=relaxed/simple;
	bh=0JhvFKNYeb49RLF6bYiTwSAs/DtlSFc2jfqE8DFfeig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUx1Wehr70bDNdRdJpqIfIUUFi124PhEnpnKK3seRHrW13RE2zpqOrqSdIr90z/LMzKGVD3nsBiTtFVPSEsS5Gc6E7svWtfprL5YH9IJTz5el0fOUUVEJGtzJAW7iN9GRkj4MWu+6gfrr/KCoMYu8gjEPx3bZIFhASSaBa3wzqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+iQg01k; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+iQg01k"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30b6dad2382so6294669eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692705; x=1782297505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkZBCMurUYtbXlyM1bHHJ4jat4Djw6dn8DDEDOcRodM=;
        b=L+iQg01k7X0W6Ei0WY2wjUNnvPvYuPmioUlkzGpVfRL8MEH8zgV9autgx1Zu6pO7li
         LbHpogB9G+SdUj0wpZ9K0nlkDQWeDZLKvoAgZm4EVrgH5MLwhwl6Y/MniIltRMsQvU2V
         o0apwUfB4ng3fGf5QJZ5ZR7SbKrtOPJD/NzVb0sTO7Da2Hsm3v0dLMTEEK0agAbkI/9e
         l1hGcQ2LIbUcgqjuJ2JiKtu1KicwXEzAW02X9+uMsAdGOM/zKnY7N8el3nJ2sHSmeDFz
         x/ntz34vnFdXGe9RwW5HL2oO7iLwgKnycoAFUslbRabs4oKt5VNSb/m2rcjhBSQgSWXE
         TOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692705; x=1782297505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MkZBCMurUYtbXlyM1bHHJ4jat4Djw6dn8DDEDOcRodM=;
        b=n+FtuUnJFEHqpASv0VpaLsyJjFwsoQn6+9xYLdlZvn5+XMGbGlTW5ilsczgPHIwvRN
         X42WR9WfeDOw6JDUbPaRTtqD8FLow1VhaQta76SjveabiCihpCtX+7BO2y53qaGZR1T2
         ysVj7LNKiHzsMxSVr9QAib/EoR5ovOgUN7bVfXjWqo3iejA2R+pDutrzK3qvLMnyXK44
         FVg8/gztY/rC7WQRynpOqmYG8mBf9Hkhl1azO5jG9F+6Qo663uV1DHMdXXSi5vHKgf1u
         jsZXj84gUkqDwy8PgK+xfQ5Dj7hX3f251rUSAxR9s9gd7ZRmhN7YSNXEqw27t7idUgmp
         uC8A==
X-Forwarded-Encrypted: i=1; AFNElJ+JwCTG/HHCtncKqT5hRF2E3v26O9nxjJZQfrIg1GIm37Y7RkC6+LDXW4lfroXz+9TQnjL8GQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjqa5OQX8b13HVAIixn+m2lEMooig6rzoDg8s6SAaSAjhxkwuq
	IfSE3CZ3SQZifbP/A0LWIkCPfyIYVcCMg7d483jpt16yLZgmjbjW5oDn
X-Gm-Gg: AfdE7cmUr3nCg7A1YYT9vjgAFm5plAlvdxZ0ZqDJgSwW66Xb+8Ju+zl0rbYQ+kOONFe
	N+Q69o3nyH+ZPtg0ttmS5wSuU6Y4t7ZNYVo5GOKmrAlwvwCqJ8J1GK82ksfuY7Ituea7jeMNbf9
	luzAMM/GyBI4MzJ6NWThzzRCboC+Og3gZVUdKf99BKyT6ULxIwLmOJHRfwNCYRsOsCr367rXXjC
	hYguU6vstfUt69m3cEbqr/+lisqWZSQbpDZDPc18YKKUcfx9kIW9vEuZKeDDjOfVNa8VY+zKMEu
	OC+eg2N+gUdOAuz5VuQ158GQO8J5O6iQB1TbgkDUZ8STArM+5DpDrk/HEboHRdu56q+aJrVmqin
	5dTzXvu9rujGLdRBhDfNBs1HMppp5F9ybvedIs25F7Tv/50bgyDKkVLU8FgZA8p2h2RQCT/fsNL
	/KgzcsGfd/TlbP3FCqgpmNvUotiwciKdwFTbAMUa9qGCIrYXQ=
X-Received: by 2002:a05:7300:2153:b0:30b:8860:94c1 with SMTP id 5a478bee46e88-30bcae21d20mr1491165eec.23.1781692705015;
        Wed, 17 Jun 2026 03:38:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:24 -0700 (PDT)
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
Subject: [PATCH 35/78] ASoC: codecs: madera: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:52 +0700
Message-ID: <20260617103235.449609-36-phucduc.bui@gmail.com>
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
 sound/soc/codecs/madera.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 98d72db599d8..03bb1ed70b29 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -513,7 +513,7 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 	 * We can't rely on the DAPM mutex for locking because we need a lock
 	 * that can safely be called in hw_params
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -532,8 +532,6 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 
 	madera_debug_dump_domain_groups(priv);
 
-	mutex_unlock(&priv->rate_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(madera_domain_clk_ev);
@@ -875,9 +873,8 @@ static int madera_adsp_rate_get(struct snd_kcontrol *kcontrol,
 	const int adsp_num = e->shift_l;
 	int item;
 
-	mutex_lock(&priv->rate_lock);
-	cached_rate = priv->adsp_rate_cache[adsp_num];
-	mutex_unlock(&priv->rate_lock);
+	scoped_guard(mutex, &priv->rate_lock)
+		cached_rate = priv->adsp_rate_cache[adsp_num];
 
 	item = snd_soc_enum_val_to_item(e, cached_rate);
 	ucontrol->value.enumerated.item[0] = item;
@@ -903,7 +900,7 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	 * maintain consistent behaviour that rate domains cannot be changed
 	 * while in use since this is a hardware requirement
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, priv->adsp[adsp_num].cs_dsp.base)) {
 		dev_warn(priv->madera->dev,
@@ -916,8 +913,6 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 		ret = 1;
 	}
 
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
@@ -1061,15 +1056,13 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 	 * Prevent the domain powering up while we're checking whether it's
 	 * safe to change rate domain
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	val = snd_soc_component_read(component, e->reg);
 	val >>= e->shift_l;
 	val &= e->mask;
-	if (snd_soc_enum_item_to_val(e, item) == val) {
-		ret = 0;
-		goto out;
-	}
+	if (snd_soc_enum_item_to_val(e, item) == val)
+		return 0;
 
 	if (!madera_can_change_grp_rate(priv, e->reg)) {
 		dev_warn(priv->madera->dev,
@@ -1082,8 +1075,6 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 		ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 		madera_spin_sysclk(priv);
 	}
-out:
-	mutex_unlock(&priv->rate_lock);
 
 	return ret;
 }
@@ -3041,12 +3032,11 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 	if ((cur & MADERA_AIF1_RATE_MASK) == (tar & MADERA_AIF1_RATE_MASK))
 		return 0;
 
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, base + MADERA_AIF_RATE_CTRL)) {
 		madera_aif_warn(dai, "Cannot change rate while active\n");
-		ret = -EBUSY;
-		goto out;
+		return -EBUSY;
 	}
 
 	/* Guard the rate change with SYSCLK cycles */
@@ -3055,9 +3045,6 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 				      MADERA_AIF1_RATE_MASK, tar);
 	madera_spin_sysclk(priv);
 
-out:
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
-- 
2.43.0

