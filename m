Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653F9438477
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515140; cv=none; b=NOGpCVY1icEEyDS59GxkpgicN9q4hkc4i/+GPaLBejpzR8/8iCz3919brXnt1IPV7o4xhvBIX9L7I6fog9+RLZRijaaBPEigJJCsd8Pot+qTwGoWNxI6i14HeSuiuSlIracaoLfg6Zf4hwpqVeZ3DDKCmN1jWb3j9wDthWYLOLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515140; c=relaxed/simple;
	bh=ViT4SAYQfWPE+1atmk7kb6K9XAwGWWkC6cl6Dp13LeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0SV8dZD4SXDFHh5SgxPasGRu+k0QvI3AeiCj8LqYpee6G5irqMijCA1qVAF1PUAMiEOsNBSnQW8AFzBar0+zopR0t57jEZ/cCV3G7Bd7ZQG35go4x8fuWVDqMWid88P2qSRUYVhrByZ2/iOJ56TeVr99ZZilrQs2O27oFYCp6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrxvzOEZ; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrxvzOEZ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3804e42ad5fso634024a91.2
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515139; x=1784119939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GELCOb8jCO0gF2MBINNZBC9gUyxB3/zkC4nOSWvZgw0=;
        b=YrxvzOEZr6LNOSrVntLMwRXkycaMF2+I1iAO3IfNKZmXOwFVjbh0nn83cJeXXfVkSF
         mrx8bKR+PupFuTPc/HzmFVhvPu/Afx8AQgyp7c6THC1ygw0Tpi395eeVS3QK2kud49Gx
         AOqSVAgBRpPzjMcj5sNco5GUgJBBVEi6o1ZZf1Jok5kPelE0oixA6daSxhGgVJk4e533
         XrPhwTfdNGe7LBnNYTvd7rT/b2YuA+V3BG0sk/n2dgoL7pMHqYzTwvRDu2lPBJkr97jJ
         /npU3jaJQQoN7QzU900hlXEbhwJ2aL+hl2XJNzbtAwIxbr6SNra3c8WKVVLVnbTou/8n
         mdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515139; x=1784119939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GELCOb8jCO0gF2MBINNZBC9gUyxB3/zkC4nOSWvZgw0=;
        b=Z1DIT7562JTwG+a8IpcQCXadWQRT3rc5GhAUm6Rkw5iusEAJV5mv9slMwG5eA/imwp
         CH0N5ssCmItA7/9psoRDJPDLzrLS1F3jP3uZRRWrIff8klZ3U2CDpm2Ysic2xqScDThR
         QMydROAB0xRYCMcmNnq/yiOh3yrXRAFmjvjlFiz2CNuN5rvfvM5e3hqqSPSyd2Z+0ODS
         lXSOk6VWrmukQfRpqLuEYnp8cR8xImF4OW2sjjRqF++JUskGqIo9xl4dlcCHKjOG3/ed
         Kct/KXntkiFxQRR7H5wMeSfVZc+Q+S+l4MZFhe5KBuWcgzJE8LShs/Rap1C/3dU3/gmr
         Bl1A==
X-Forwarded-Encrypted: i=1; AHgh+RpN+zS9PwPrtMOuhFG5CWN59hE/h511gpR/9Im7h3u9pOSo+iHzwFkHr/K/dDY27h4Sfx71uA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1RmGKJ1g9Bz6kLDKOjaKF/NJijoMLF9Rjp7tY9h0slqjNe6ts
	k1e+GCic0LGJxMrbXmi6eRmKGdBTXu9ZrHnzrD4Pw/f+SrMsOg1izU7+
X-Gm-Gg: AfdE7cmZ6CHyFD8nQQQXn43loJfUfiL6gtk1mX0yYR3BiGldpmd7glgANkrW4eofcyQ
	8XTcMY5olRg1AwrXasrRTlMnd2yUIFeLvR38rorhlC40gamWbbD5d+YrbWbhKBDBcU1gH7ykHCC
	4dxg/dqlXGUOfSXWd/6TZGIGcfOmKPnS56gia9Kn+O+cNoYGvtn5X455zEpESM7hjhzGvU5BM5C
	MpuA6xL/UDhUppXQWp3/BUL5YMI8WZ75QnA8Rko2/EmCNBKznmgXV2IiPWN9jtpOhxkPy+qNLpd
	vBwwhncVExtqtgO4G8ZQLL5CkAZgj2Zb2tDIVk1gwVcQtBfZlmoa3rySuFxvw9SG/eWkIHXZroU
	wDnwPlCYfxiC8RWZdSLWmbqnNShWqW9/GsuxRk1L4RicD1Ue/lPxwpkw9XTqZh8Q6EI3I+aG6Ek
	gDczQbnzseAtyukMjTKQ4b8b7Dd447eM3y4bT3+jTCvgd3grg=
X-Received: by 2002:a17:90b:6cb:b0:380:fead:448d with SMTP id 98e67ed59e1d1-3894053cf94mr2762730a91.13.1783515138729;
        Wed, 08 Jul 2026 05:52:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:18 -0700 (PDT)
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
Subject: [PATCH v4 14/24] ASoC: codecs: cs42l42: Use guard() cleanup helpers
Date: Wed,  8 Jul 2026 19:49:51 +0700
Message-ID: <20260708125002.202515-15-phucduc.bui@gmail.com>
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

Clean up the code using guard() helpers for mutex locking
and PM runtime management.
No functional change intended.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 54 +++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2652a639a79a..fadf68860601 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -9,6 +9,7 @@
  * Author: Michael White <michael.white@cirrus.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/types.h>
@@ -565,7 +566,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l42->irq_lock);
+	guard(mutex)(&cs42l42->irq_lock);
 	cs42l42->jack = jk;
 
 	if (jk) {
@@ -581,7 +582,6 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 			break;
 		}
 	}
-	mutex_unlock(&cs42l42->irq_lock);
 
 	return 0;
 }
@@ -1668,13 +1668,10 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	unsigned int current_button_status;
 	unsigned int i;
 
-	pm_runtime_get_sync(cs42l42->dev);
-	mutex_lock(&cs42l42->irq_lock);
-	if (cs42l42->suspended || !cs42l42->init_done) {
-		mutex_unlock(&cs42l42->irq_lock);
-		pm_runtime_put_autosuspend(cs42l42->dev);
+	guard(pm_runtime_active_auto)(cs42l42->dev);
+	guard(mutex)(&cs42l42->irq_lock);
+	if (cs42l42->suspended || !cs42l42->init_done)
 		return IRQ_NONE;
-	}
 
 	/* Read sticky registers to clear interurpt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
@@ -1774,9 +1771,6 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l42->irq_lock);
-	pm_runtime_put_autosuspend(cs42l42->dev);
-
 	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_NS_GPL(cs42l42_irq_thread, "SND_SOC_CS42L42_CORE");
@@ -2163,22 +2157,22 @@ int cs42l42_suspend(struct device *dev)
 	 * future interrupts. This ensures a safe disable if the interrupt
 	 * is shared.
 	 */
-	mutex_lock(&cs42l42->irq_lock);
-	cs42l42->suspended = true;
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		cs42l42->suspended = true;
 
-	/* Save register values that will be overwritten by shutdown sequence */
-	for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
-		regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
-		save_regs[i] = (u8)reg;
-	}
+		/* Save register values that will be overwritten by shutdown sequence */
+		for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
+			regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
+			save_regs[i] = (u8)reg;
+		}
 
-	/* Shutdown codec */
-	regmap_multi_reg_write(cs42l42->regmap,
-			       cs42l42_shutdown_seq,
-			       ARRAY_SIZE(cs42l42_shutdown_seq));
+		/* Shutdown codec */
+		regmap_multi_reg_write(cs42l42->regmap,
+				       cs42l42_shutdown_seq,
+				       ARRAY_SIZE(cs42l42_shutdown_seq));
 
-	/* All interrupt sources are now disabled */
-	mutex_unlock(&cs42l42->irq_lock);
+		/* All interrupt sources are now disabled */
+	}
 
 	/* Wait for power-down complete */
 	msleep(CS42L42_PDN_DONE_TIME_MS);
@@ -2250,13 +2244,13 @@ void cs42l42_resume_restore(struct device *dev)
 	regcache_cache_only(cs42l42->regmap, false);
 	regcache_mark_dirty(cs42l42->regmap);
 
-	mutex_lock(&cs42l42->irq_lock);
-	/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
-	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
-	regcache_sync(cs42l42->regmap);
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
+		regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
+		regcache_sync(cs42l42->regmap);
 
-	cs42l42->suspended = false;
-	mutex_unlock(&cs42l42->irq_lock);
+		cs42l42->suspended = false;
+	}
 
 	dev_dbg(dev, "System resumed\n");
 }
-- 
2.43.0

