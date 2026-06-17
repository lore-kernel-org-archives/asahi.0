Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23FC3F58FB
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692731; cv=none; b=GkNzuj+mezvt02927XJEdralG7AvhrzcMJEo9ilSE4Xrl5vcDZFX7uHIHiS6mqWWWDC1hhmW76yBDvJz05pagoVRiNc1OXN3nZvsqufl0y5la+I/rWmZaDJTtBm8243jjPmj6xiIBiP3GWw3C0qpilkkaPB5Z83JD07xtFdZiDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692731; c=relaxed/simple;
	bh=OOjMBd7CyBdHcAZuYiDu+E3s9djgXa4ysbiJU+FU92s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjSFou4PbFAUp4IHd9lODJWXSvesDTTwcly8pJ1HWSRO+H9cK0+6LJmKyTDFoAcKBusSIN4LDCMmBjOI0BnCUtVjK1Hd280Rbtc/8CBKnVdnjp/ZT0LxniJmZIehZF6afa8qissG9zA50y+9u/RIRGBpgzF6nuZJOTySms0LerU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USZ1WwUr; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USZ1WwUr"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so151929eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692729; x=1782297529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCUXvrbdh2cMObj7Yx72xMWUVLVGbJrlQPkt6NyxLyU=;
        b=USZ1WwUrx8f3nVZlnO45ahmZYpdygxi2JKQwKT1quTPu5ct8OdR9iaCkub/hWsuAvI
         oXQbfjr1Omo+dwIpYxTUHsDQcb+YoaoUZSLsIHzfJnZaHr9cYieA1ddPHgS8WKrPsRjm
         +HrqsnYtiEyp27J7gogigzOjfczENlOuash4h+0VWCeVmZB9JPG9RsRW7sWUZCu11Xy2
         iWg1En3vVJ+q6rNEpGt3UkxK+AKakn6hZdKcr4bzyEllVnnsH3j8C5203U8Pxpo6Y3ez
         1Q9XADHCRVCJE60Gx4iD49TSAxuMhZaesV2xDVIp/ecSvM3xKLkIHNpBujj5uUpp0J2T
         N/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692729; x=1782297529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oCUXvrbdh2cMObj7Yx72xMWUVLVGbJrlQPkt6NyxLyU=;
        b=fzvQ03eRxuPv/yCJE35uXIRga73/nE3H9Au6XhDKDjP6qjQoAUyFGuQJ+ARWwvQDab
         9enBwd8SGvgq/oZwt9CC3/37tN6N2CT7JEBZIWCgC29ENbTqhTG43QFHzrfEqQRk2LqS
         xHoa7Jbrhh2xHggQ7cxj5wPilKUxHSnfhywDQzpROJKMCTdVtYdoiO7+EQ+NTFbhudxx
         PdH0J6ahF1nxpiuKcUxkmH1K3eGhADJ24VM5qqkzd6qmY+KyUaYGnG33A6ronrGpZbPA
         eB04ELtYegYt7jUfDjwuiatzIywPuigFnMUJIjYDi84N8uJvN5gIIiLNmKMC1ymwWyKF
         CUYA==
X-Forwarded-Encrypted: i=1; AFNElJ/NSQf088Adl+2uh1sCDPiyffP3/UG+lzWmhaRs9rhKBY9QsTGkNi38DH3OlVGvVJYy+6fXUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh5+A8RqFX+DYNLysZVL0jfNKepenYAlUZejGCFJuB0kxOtBad
	P5lFeCa7bfjZHqR6FVCWtKdkXtWp+/dCiqdZGhRcal2++bF/FPNx7ScX
X-Gm-Gg: AfdE7clob7GjdZQrtigFGjrNTstTVR/3RA3QwSPpWhN5qmR/f8Lm1POBKm/23uwuK/z
	vKgfUFSTh2CQ4EtP6QWJORF2p6ZNjRWGLjIyGvfzqbY7v1P131ErdzqdmYDYz2WZUJySQqnx2Ja
	XpXg02b65Qh7U8hMUbefn0wRFmfTbyX2R2ZuofrKjmlXaKCKfTiXsaT75nU3ZaM+UoI9VLRbxIK
	8joiNDLxQ3899mcTPUsILxQgveQniNEXRYWLZa5kA99WXFSe182lV5yWLJMWjRVy84SsOGCix0f
	hd9DGfM5NxDZlO6+2xDBjBJ3v7fZC+q3NRHBMxE94LgWLDzN6YqdfAUKOQykqFlEmwm2garEZry
	Pl6tUHmvw8FZUWKabCXnZxf8cO08P7vUUnn+JTsQbnAOlBZQdzgL06qEOagCWjwZwOcnSw/b9vu
	eqYbEKtm7INIoVeq1oyviEuQ3+1W4bmquhtNJIjBvUzwto6mE=
X-Received: by 2002:a05:7300:3aa8:b0:30b:df3b:fe94 with SMTP id 5a478bee46e88-30bdf3c0705mr265671eec.3.1781692728927;
        Wed, 17 Jun 2026 03:38:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:48 -0700 (PDT)
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
Subject: [PATCH 37/78] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:54 +0700
Message-ID: <20260617103235.449609-38-phucduc.bui@gmail.com>
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
 sound/soc/codecs/mt6359-accdet.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e..5feefd0cad75 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -398,14 +398,13 @@ static void mt6359_accdet_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, accdet_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	priv->pre_accdet_status = priv->accdet_status;
 	check_jack_btn_type(priv);
 
 	if (priv->jack_plugged &&
 	    priv->pre_accdet_status != priv->accdet_status)
 		mt6359_accdet_jack_report(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static void mt6359_accdet_jd_work(struct work_struct *work)
@@ -416,7 +415,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, jd_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	if (priv->jd_sts == M_PLUG_IN) {
 		priv->jack_plugged = true;
 
@@ -450,7 +449,6 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 
 	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
 		recover_eint_setting(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static irqreturn_t mt6359_accdet_irq(int irq, void *data)
@@ -459,7 +457,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 	unsigned int irq_val = 0, val = 0, value = 0;
 	int ret;
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
 
 	if (irq_val & ACCDET_IRQ_MASK_SFT) {
@@ -474,7 +472,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 					       1000);
 		if (ret) {
 			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
-			mutex_unlock(&priv->res_lock);
 			return IRQ_NONE;
 		}
 		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -498,7 +495,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -521,7 +517,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -540,7 +535,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 		queue_work(priv->jd_workqueue, &priv->jd_work);
 	}
-	mutex_unlock(&priv->res_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

