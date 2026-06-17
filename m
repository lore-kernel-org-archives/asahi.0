Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F393F5BF0
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692401; cv=none; b=Yo3+PMCUJjhXt90hfOa/rpYx0Dq7LGofq2OAaDokQE2whhfAYQT9lCcGQ7xlDJW2q5oK29yAjA6v9IROvMUtCz+DRC8GB0UYC36yMz97WFazr/5igQ9MHtwHSAHoOXl37DXTKZYnn5yjV4So8j78pfV8FhcmSiWC7KIiH0XeH40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692401; c=relaxed/simple;
	bh=fUlQ+FnQe8ks2Bsyu9vc+jCVXkfhxC4s7oFtyOeVt8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOdTg3gj1k/N8aqFPEZ5WH877/vIZ2VVX/dRM90Z8/S4ojQRyGyV4mYFFSHU8xc+lo6VGklMNLU2pHBgBaFWVwOqMrwsfUZdP6fCqTkDm6JNTekTfXT7UtKIiXdGH+ZymudPZSsFvDhFX+YaGtZz18F+MoLbx8zNWZGFVDm9UJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hs6fe/JF; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hs6fe/JF"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bcc877b4cso1620241eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692399; x=1782297199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRug9eLPJsGmAP+VJnwvB7OkJ9sFAbmMJ4eYi6JABvc=;
        b=Hs6fe/JF+YLeQw+nyxBwH5I+DG/7uwZj5t3VbNCdDoM+EEliW4ciKjjNK6KoGzQ9zT
         cQBJX/sXUlG7909vyIQPd/GA4EDWxmrX7XFDq2PTfnrLTFRTYRFUk/8o1IogpgHY8UWc
         0o+R53xq7GzZS0cpUpcGs/EfswF/PJcNBRQhA+WfFNZgEg9mPonBwJRAYauP0ATsQfep
         hlCsUTYd9yRuvv6TtEck5Ktb+CZzorzf1fiJY5u1eMZqfBhkYaupj1CdiF0pfdbaq1pQ
         J9bf2PkznW6NehOToa/HXo09KhUZuSElgbaymOWM8+i2p1sRNDrxR6mqjPEdzpENFk8z
         VnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692399; x=1782297199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRug9eLPJsGmAP+VJnwvB7OkJ9sFAbmMJ4eYi6JABvc=;
        b=DJ2JxkbuQP+b3kh1KKhCFud9yujjCaudZ0TPudSqxrhsbPr0+Zpi4Kct66IifwBHek
         2vt0xCb1udDBflJptHA4kR+z8Boz9ANCeIK/iLCzxab5wIH88N1EnB/Ymt/Vp0O0N9gU
         T8r9/5DlaJEtBAW9252lmkKe8cuTcNerL++3+9/GwQkAnQPgk9Sn+CHp2H7t+qVnMhXz
         T71+iCh1HMTTrdt/4XvdG2RbOVRX6gxrVp2jCOyeTXjxv1r5tbeRvDOOop/cQxVGmTy8
         C0HbEBZWN1cHovZAJL0pOxCt9rUheFwfBSOjF8ySxSfNRVjZQExkSth9mZLYCdTPPXTU
         KY3w==
X-Forwarded-Encrypted: i=1; AFNElJ91tZ4b9lzPDB8RbHlt4PacmN6N4W4WrckOKefN8tJ7nzmaoePCA/vnUPp+pb4WBczMn8ufdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUKZt1HOg2cGhW/UcS0DPxzradYlu65EW7dNETdfOjnVrcQLfl
	WZRH5fBbdyLq6qLDygPVRHRCav2NgAKm28nS0PXcOsSak5yYwiBLfoBE
X-Gm-Gg: AfdE7cnmhcM2QdbAXX+A4heF2BEaxaY63uHqZMeDAdUt/APpPcjTUvIMAu8062tJ7bh
	BRmXZMOXj8OvldHaRgwLsV6kWrhzIlwzUS+b3vN/vQDly+I1uQL3P96Y51PLxUcV/lLABiNt3QS
	/fvvfL68Bp17+UqkVUhRaaLhLjcSUyiD8T5JyHxwxgEvN17sgSJgi2OYueT1b1ymKI41S1p0hcw
	YbxBHCi4pMDY7pcgEsD2UjskwiJZ3z65vgtA20IL6JDlyZ5NtEXyb0GqNoNWAoE7lFnQKQf8ruL
	DvO3FWE05X3+hLE2GyK/7nHURhG2TBBHo6GctCL7KWNEkcsLUgrqq9iXqpQh2Sf8+/1gootNc67
	gRbw3OknKNWcz07VcmGFe/6FYftjObU37A1PxinCtQhNmsBAxUO3TTBvUyP52OYG8tmuJJsTHGN
	54ERkGxyeIuVBiE7DzjiMJ2RF1sMy1gtjXbVNfPTyRhfQAvVM=
X-Received: by 2002:a05:7300:30d2:b0:304:5bee:f59d with SMTP id 5a478bee46e88-30bca0ab339mr1950409eec.29.1781692399061;
        Wed, 17 Jun 2026 03:33:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:33:18 -0700 (PDT)
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
Subject: [PATCH 02/78] ASoC: codecs: ak4613: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:19 +0700
Message-ID: <20260617103235.449609-3-phucduc.bui@gmail.com>
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
 sound/soc/codecs/ak4613.c | 72 +++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 37 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 3e0696b5abf5..413ef55b918a 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -384,7 +384,7 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 	struct device *dev = component->dev;
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	priv->cnt--;
 	if (priv->cnt < 0) {
 		dev_err(dev, "unexpected counter error\n");
@@ -392,7 +392,6 @@ static void ak4613_dai_shutdown(struct snd_pcm_substream *substream,
 	}
 	if (!priv->cnt)
 		priv->ctrl1 = 0;
-	mutex_unlock(&priv->lock);
 }
 
 static void ak4613_hw_constraints(struct ak4613_priv *priv,
@@ -507,10 +506,9 @@ static int ak4613_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->lock);
+	guard(mutex)(&priv->lock);
 	ak4613_hw_constraints(priv, substream);
 	priv->cnt++;
-	mutex_unlock(&priv->lock);
 
 	return 0;
 }
@@ -599,42 +597,42 @@ static int ak4613_dai_hw_params(struct snd_pcm_substream *substream,
 	 */
 	ret = -EINVAL;
 
-	mutex_lock(&priv->lock);
-	if (priv->cnt > 1) {
-		/*
-		 * If it was already working, use current priv->ctrl1
-		 */
-		ret = 0;
-	} else {
-		/*
-		 * It is not yet working,
-		 */
-		unsigned int channel = params_channels(params);
-		u8 tdm;
-
-		/* STEREO or TDM */
-		if (channel == 2)
-			tdm = AK4613_CONFIG_MODE_STEREO;
-		else
-			tdm = AK4613_CONFIG_GET(priv, MODE);
-
-		for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
-			const struct ak4613_interface *iface = ak4613_iface + i;
-
-			if ((iface->fmt == fmt) && (iface->width == width)) {
-				/*
-				 * Ctrl1
-				 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
-				 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
-				 *  <  tdm  > < iface->dif >
-				 */
-				priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
-				ret = 0;
-				break;
+	scoped_guard(mutex, &priv->lock) {
+		if (priv->cnt > 1) {
+			/*
+			 * If it was already working, use current priv->ctrl1
+			 */
+			ret = 0;
+		} else {
+			/*
+			 * It is not yet working,
+			 */
+			unsigned int channel = params_channels(params);
+			u8 tdm;
+
+			/* STEREO or TDM */
+			if (channel == 2)
+				tdm = AK4613_CONFIG_MODE_STEREO;
+			else
+				tdm = AK4613_CONFIG_GET(priv, MODE);
+
+			for (i = ARRAY_SIZE(ak4613_iface) - 1; i >= 0; i--) {
+				const struct ak4613_interface *iface = ak4613_iface + i;
+
+				if ((iface->fmt == fmt) && (iface->width == width)) {
+					/*
+					 * Ctrl1
+					 * | D7 | D6 | D5 | D4 | D3 | D2 | D1 | D0  |
+					 * |TDM1|TDM0|DIF2|DIF1|DIF0|ATS1|ATS0|SMUTE|
+					 *  <  tdm  > < iface->dif >
+					 */
+					priv->ctrl1 = (tdm << 6) | (iface->dif << 3);
+					ret = 0;
+					break;
+				}
 			}
 		}
 	}
-	mutex_unlock(&priv->lock);
 
 	if (ret < 0)
 		goto hw_params_end;
-- 
2.43.0

