Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420FD3F0770
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781022; cv=none; b=PxLzLqWh6xucQNdgkkqgPz3lfG0ri8bSoicSbUQSMQsV2Hbsdvd1idoDC9hXjsdRJ4yrd0IV/BZSEtZpC5n9dYcA5q1ouFrO/92KWg8hJ0PHXztFqlUqbgfurdcZdYrPFREDvtArMgedsXhnl3Bq58KqlLsxF0RRp3ce9cJ7tjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781022; c=relaxed/simple;
	bh=8buMC4ZD9JZFNnEFGS/4j6mdWskmC/d/IQI+0wOvt4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E427l7+N0ONrCcUTOcO+CoOVPwFxYuelllhzzPxquREQk49car0AOg2QSFnWWJgwnRXGNtgaeEJwrsowufSoo5OHzkfoH8dogQ0+ZlKHeVKDzjqvACZLEAppsfHsYpNCsGDjL6R/SZTB8oXtuPjgo5iifOK6VfRux7qj62KWQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVhSyv7C; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVhSyv7C"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c88973b6965so642233a12.1
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781021; x=1782385821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OY5fb/Dq+8t+PbF847YNuNR+1WYPM7PZhbf7meKQVc=;
        b=GVhSyv7CdUXADTfqY8tBr7JcrKcOPdwBuGA1sK5O2cxya10PL4qTT+fcFMk6Eo5I1w
         MaiG6+mSh+Dg0/8p+Gv9qS80knoIxb3wwLukOuXeQ/FUDEs7hPPDd9ZS8ZgznSMtPecE
         E6oku8xnLPC0OH3G03JmtL1mDDGj1Bk5TFJzeUMXeYKLZWqrl9Vy0MlVKUi1is0YMs5h
         M1wvQ/o1pG6GXKwWbSEOTJjsS5BDOuOCvzunWssgak9MaUws7dNVkAG3hSuoU/O5wBYo
         EPZ2DZcAdgoBjFTLXJfrnv2zeKzNXmWAeQLT/0xkVv1Cp64aL+YP016Oh7VT347YIXdw
         FUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781021; x=1782385821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4OY5fb/Dq+8t+PbF847YNuNR+1WYPM7PZhbf7meKQVc=;
        b=pbJfSQjYOxIn3kBQhO/Tb6UugVjMpQUvQzXmL38+vk8sLnC26VfOlED7jE/Be46lzR
         rwhJf9duf8rnQHFYk2t+f5qhhV5N0i+3IW9+hAbzGzfJdyjTpTnnKamSwyMnUVUKkTOh
         3O3edcd7MlzZuP/moWHL512wej2gJG2LHwXvNVSa2avsRZ16ktExOI2omrXJKEpiWUJB
         EfZeHmyNDSj2xKCA/ewK2kRJ0BEaq1oqUy2Q6WtNz2d4YFHl1vaMps/nacb/RBcn28Dg
         ZYHpmYJud+8j8EQDrDfJyiRh3+xrNcV8Qkh3ndXfYpx9TDM9V6hxPnpsxdIiVqmIvGi1
         +/bQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aYB6AyZgpCpkrB3rm0poWTeofXuy4Zh8ti7d7qi8iigoL/lWBHf1B/KPzLURwzzce5DzZ1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRJnct9oJobjHIkVh8liguyR6vtwyB70A414pr2iHYWAikKs0A
	jXUXVO2g2AzkewJmvARd55AZTQTFoIb3buIkqmAhvOFUC6gk3Tp3rlz+
X-Gm-Gg: AfdE7cnH2qbTqTD25Hpbx4DfZgrVMPwwK2d/XHGkOy0C4/J5mbb2GvYjO71xUwnojoG
	dI95hVr/w36YDUSF67IwRP2PHy47nVBdfqbnKbN4otXrP7M430sK2UajJfTZZotqyPghObA+CIp
	qzkPERPnnBvfQOEq4caBSpid2AYZ+JzOrNqs7F7BO5UEw3Kn9EUWqHbQ+HZGDNS8dNogFsj4Ksv
	uVobKjNUmLsZnowAhRy6TJtTlwhSCNiSdouhB2PwaNi8muzTgZ4PoR54JqJMmLxQ46/SpNo9zhe
	kjMROULxfnCnL4+otNTE0zmVH/AntcsSGhfTcAP49BTRCak/2GlN02BzhR+7VvZSRGSgC+bYMMX
	lcnQlXBhVsNV9t9kF53ZYLn9b5Cl2bQvkos3ovony5BgVcrTg5G8JNKGMP6TGGKqMJudumDrI+y
	Gk2pyYhP7R8M2b57J0VAxG2mFPnQCQm+6/MzzE7+jkZyptcu0=
X-Received: by 2002:a17:903:19ee:b0:2c6:c9e0:2c17 with SMTP id d9443c01a7336-2c6de3f353emr31079685ad.8.1781781020504;
        Thu, 18 Jun 2026 04:10:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:20 -0700 (PDT)
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
Subject: [PATCH 67/78] ASoC: codecs: wcd939x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:16 +0700
Message-ID: <20260618110827.232983-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd939x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 010d12466722..922b6a0423a6 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1923,7 +1923,6 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	unsigned int micb_reg, cur_vout_ctl, micb_en;
 	int req_vout_ctl;
-	int ret = 0;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1941,7 +1940,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd939x->micb_lock);
+	guard(mutex)(&wcd939x->micb_lock);
 
 	/*
 	 * If requested micbias voltage is same as current micbias
@@ -1957,15 +1956,11 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD939X_MICB_VOUT_CTL);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = req_vout_ctl;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return req_vout_ctl;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	dev_dbg(component->dev, "%s: micb_num: %d, cur_mv: %d, req_mv: %d, micb_en: %d\n",
 		__func__, micb_num, WCD_VOUT_CTL_TO_MICB(cur_vout_ctl),
@@ -1990,9 +1985,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		usleep_range(2000, 2100);
 	}
 
-exit:
-	mutex_unlock(&wcd939x->micb_lock);
-	return ret;
+	return 0;
 }
 
 static int wcd939x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

