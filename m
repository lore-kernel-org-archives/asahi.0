Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87993D5656
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454578; cv=none; b=PJdT5ZG6FwSkV68Y73V48koR6MRgAPTK5UIbtLujImhSd9MHrDTtVGM3fZqUYgt337S/RXY+BQDorFhhXgs+V1LtkuFNeKNxCieYE/Y6ldw/bm8gE8dKR0Snf6oGlbP79f5YCKoaUh6Gi8Pei/PIYPJLDE+kizzr/maqtLWX3nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454578; c=relaxed/simple;
	bh=qdA4B3AKe8bxpcbruMbAhMcQrORASeDOpn/sYn+G5uM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RvgHUhUOU6CASBa8kWcyMwVsFndA35CvX/l8AwUlu2u591zAkYiLqkheb9ZzqOSQiQgVjwtwTqLSsBZfc9LGCyNKBJVVLUsZQo6xZ8WhvOAR+bnR/Sgu2OAXDpbAV0fmwQPHi/NCAKSn/Or07kxFjPG2O03Ekza0PTf6ztJ9l14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWipdQAz; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWipdQAz"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37d70036426so282566a91.3
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454576; x=1783059376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbPQ5ClieacCrQpT+0BcEXWXh5nAuhJ3UgaZWwx688k=;
        b=lWipdQAzWN51CLbRWCi8MpgvR4Ur75dtrMlnHBu3iw1UZRBYvXTomKI/kcHpLQuxmN
         l8EzyO50dy9MnYhCKjxD7qaAUJAbeIDV9yhc5PdG7v5rYBpHuL2VEeMDLPCqfLDa53jY
         vvFPl1o0tlTT3lSq0RD6WV4Oh+uTxDCUI9T/5rL3iuJSWjFie0auS7gC6bZEaXX7VtEM
         ihpg56oXUK8Movj5EwbbkPXnhbPmU7r7HRje+jmZH7W33dpRReTvJdHmuNCsm7vT/AGb
         xf8154Fw90mEnXY3nlUKAezrjP4R3VUXlcv/sHQA/1gBi9iXVf0jE/YVAJXAadKoB7at
         P2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454576; x=1783059376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AbPQ5ClieacCrQpT+0BcEXWXh5nAuhJ3UgaZWwx688k=;
        b=mYl3VUC97aGpbMoORneM+ZtmWZigfdMf59mdfBoMigTIwFCIF7eaUz6rXvzjPRJH3h
         qJdSIO/l1P3hJGkx8ZsJ57YNT9ga53uDKKjFne1S5oqK1amhwIzV5JdgZO0ZbuIa0Z1N
         05ghIjdfGuJIsk98CUNa85ySziVRdLBwQ46T87jvAIwzKBgtXgCWDRHx/Hlck0GEwTE/
         vteTyVCgUohlf9qFO2i8u58qDN0Iq2IWsehgugRGxMCRvUMvLLp4PjTnyzOKLX5L/v4K
         zoUDjq6TKF45cIAfeMSV00Q/fcIXEny2gVApQXmAcblJoYm65fBlYiu3vujm1A/g7Avf
         lsZw==
X-Forwarded-Encrypted: i=1; AHgh+RrBlaiab4qgfApoXFdPk0iVt2hVYssdQIudE8ChbRvWOJ0dMi7bMRrsGYp8pNPja4cnLRTFRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDOekaOTMg/V0Y3HQtc025xMhsG7o2xb/A9rTV7ml1w3ZPvQlR
	li5vRy2jrxYl9Nf7CfSBRZYGSgM8ORTdbiloiOxLBQSaOzMEPJZeSOBc
X-Gm-Gg: AfdE7cnbN8BfHXqhqJD8XAJYWWknZ8xErrh0a5rALLx7tu54IYPPTONzxEKuMB5LW66
	sI6qXA07siFm5brukkOPJhWsEylRFwctUBfZd0ANgZbPDhFPTtnioSWvr3xcKOO/P6A7KGQfvyd
	VYIS51wH1VlK5n1SbI/cRNU1TLns+AQssivs4o9BcFRrp4E6zP6l6N/L6fsgofzF4Dxng15cJX0
	nU78XHXakSPilPLewsI2XuHCO2X8iVKYPqLM9E0SiSh49L3uKRlrAChhyEytTBiGb45oT+GhIhl
	l7fb3Eg7gJm1nqLYFHx9lJ15ypVm19mDv8eeLJxiHkjbEFy6eIlzSXkXgyy5NvmFh62TSz0iBCu
	YxvscIqWj8oKPxCUu47XqZGIyho6lDjS/K++xcm3Y8HFil35gFIu33oGg615krcPxPqHbl+dY/m
	sfQDcBCsXoGeyRxLsqyfOJQ8NH3heQG4rQkfvaWUu9xdrw3gY=
X-Received: by 2002:a17:90b:5843:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-37dfa1ce3ebmr5512195a91.9.1782454576103;
        Thu, 25 Jun 2026 23:16:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:26 +0700
Message-ID: <20260626061329.23264-22-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l90.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 77e8aabb241a..6ce603bfd500 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2423,9 +2424,8 @@ static int cs47l90_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2456,9 +2456,8 @@ static void cs47l90_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l90->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L90_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l90->core.adsp[i], component);
-- 
2.43.0

