Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFF1264FBD
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515198; cv=none; b=UlpnPDWsEyHG2Yj643YpvXSx6hxnEis2wFm84GxQfMQ5vmr5mMa/M5XQHvjbNBULhipyzOJ7pDHyrdFygRsI+kXmlZtZ7nppJHek8uJaLsxl45jdAlb8JdAbOT4KXtj2u3G0O8A50jai8ese8QsjIpCO2MJB8QexhhKQIeeBcak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515198; c=relaxed/simple;
	bh=g5J6VJsuQEDSKj38JRXT3/2Sio6DcgOG5vApByn829c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DN/32gJ4Ora4Sw+Tf9rETogiUgtqxrEMSAB66agq3bvQzgax97PZRxmNdWprwX2rWrevLSUC0Frs7xNfjXrN6uxPmZzOqV6sorf/AZ/UthxEPv6DngPcLFRaCxMTOCiFN+E5l1JzANkBcj35Zyr3AakEDla2x688u/vCklvrhL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihW5uqug; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihW5uqug"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381ed661712so658188a91.2
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515197; x=1784119997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bqq5atvkGJrMFIYTW6TJTTxqCIFFL1aCQFiDrRVj0K0=;
        b=ihW5uqugLvCBV4kLcZ1sUJaVMioui+ITiICXX9VM3Kn6Jax7mxPOsSBiKgCFHTr8AZ
         38sn+H23rSCTrvcElOhovX07PGwWHZt+VClN7kyfVmkBdMIGLb6CqEhTcH4wHMDMQuUB
         PVtntKen40yaIYnTfLDRtWJaTdlXUxkskdrv7sSMeE3VMnHsQYybm3R/dbJ17sFQJpn9
         cwCrYieUpLt6ks/x/f9gTQBPdBo7vOoDVRGH4L9H/Q6mWNcJnd8jzRKzD07DrI8RaBlz
         ARr82RZmmG+ydHh1ObrBKsY+V7YRgFiGrzyING3gciqooMxIV6evF+LM1jVzTg2+P3TB
         VsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515197; x=1784119997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bqq5atvkGJrMFIYTW6TJTTxqCIFFL1aCQFiDrRVj0K0=;
        b=UmbRUR7iQHapk7DBMeslXc3YUxt7ecleNK1eUTseN186LAlNLFgTQI3sXkKc2oaQ9J
         2w6uLgGbqMY1wETy2xz3M0DH4sY5FtSmFfuJIV78myAzAZpED21yWAbgcF5IZP4fu2Kb
         wUyj8/Mjn6f1wdnw/FhBmroout1R11ye+9JJyhehdsLJcYYkxxQDpH6DJTpc/UNlW4lN
         Kq/w7OQkPHW+MpHCzbZbrTAGlMdw/bY1KWyopjOOpVA5AICa8IyzDcT4hkNRIdJGI/58
         eneKKl+rlZn+mGV4s1JO384jHkRAGmUu8EZ1FGc1Bl/kZ3OSUZv09ewazqhdI2Kivbu8
         7bIg==
X-Forwarded-Encrypted: i=1; AHgh+Rrd0e1/yXE5tGxq0cYK2Pxnd0jZzK5zpQj3A3OHftYvAIPX6cHzYz5vcJmwSUvULn6uCX9NrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzjX9xF/E1aRuqZcSrBRTaah19oByZ61t/j38RTSE6jX8L2pLK+
	qVw/1cE0JxBWhN7QIgqdwGN2ktmbWgd7Yese8aE9hmH6zuhFgtdyGkha
X-Gm-Gg: AfdE7ck5b3J8pYrym6NSLkmbQ39WKIV8ZIHxy8prSsdXLKJjXmqjDGCjJSeu1zKheOZ
	A0S3bzg2txAFjarw9fvThm7cf4J6i4LR3Z+DJqi4biaY6CA2GcKH49JCzjMSAlHQi65ERY68E9H
	dSnPxNUmlJl2Nd9Lge8w2pFxMXZH8Mt8Bw1ncxxKhmPiBtx6agOGit8U9TsO4rqwJXgQ3UJ4VGX
	YdrBZDYewCYu2Llqs5N4BsGDVTIQFH6E2WAhqkUTQoy2CBeZ8NjT1GTp9uscjFQn/C/488o2YEG
	Ca682igcjCdM9xttpFKpNic5z5/d1DCwn5HMA9hjM/EFgaDcISuDSaHpi7+KasTD57bbIz62E3m
	ulCXXFZHxpuksWKsvMafBLW0NbNW2F/bUk4vBsOKg3LS3IwltWytlJxc7z2UjF3SUsi2pdSuc14
	7EEXl9iUIAjWnODEVvFA2xp9XHk1mgc8A2bF515TqVysS1uRE=
X-Received: by 2002:a17:90b:3810:b0:387:e0bb:57f1 with SMTP id 98e67ed59e1d1-38941bcd911mr2524820a91.34.1783515197196;
        Wed, 08 Jul 2026 05:53:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:16 -0700 (PDT)
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
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:59 +0700
Message-ID: <20260708125002.202515-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l92.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..07bc303d9797 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1892,9 +1893,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1922,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
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

