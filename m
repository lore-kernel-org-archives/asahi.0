Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A2936A37F
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058221; cv=none; b=LqvJD+5VuE4P+rRM2u78zpRz7PnzlQPkJJGSsAJy0ZN9seOUBjwe2EQKaPZ4oXIiytldXc2+ROHPhnVEOcqIwECoxC4D1dRagEvwdydP29KB5s7B6HZEipy79c4+PINcKUpURH0YFCHaDJZkEZBPumLmiUMAATZwBmsVbsoMBPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058221; c=relaxed/simple;
	bh=em96/ZARght/3otyju63pfWEB2uPboKH1/9p2lcucSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BSw8xNfwrhu+SjFFfTpRJCE66ODjPlsnTyHgY27lpidsdYBrdmNZiWVtyaImg5Ub8UXBKRqKnQ4hyYWZmARh8MCtv69da4dhYDYQj7O+SssrpLr0aoPHV1kwZ5/jBBddJAxLG4i2MD5MezROKSHpi36f38IXWpXbjJ8TvG/WcjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5hTl4b9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5hTl4b9"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84780c95e2eso122174b3a.3
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058219; x=1783663019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpJFy3k7fzvXeipnHRzRqJbquUwprfOCJ0cYmFTrF80=;
        b=B5hTl4b9RcuzabhiFcEPgY7IvqBep43mhEcJW//4OQRtPm8gMH363qg7SKMG0r6tUd
         VcXWNXlvuGRHjHxSYZ27aLj7m+dYqr9b17beS1oCrkMetOci6HwWrT7G6Va4Id/+R+e+
         cunfvK8UkAAqRTNc35sNVHeaCemWbUABdn9f1NmIXcKY6z7KYjOySY1839EqBODJbiKX
         TyMgh/ykRa0KVRim3hdDiwMamVplLetFeThhWVYfGR3NDVLlFc3PM7+6B2VIHT2ASWgM
         MelVqIkzh9lu5Ft/6zR7p40ckDo1UEPC3SPaKd7NLwdLBh8pndzXNmJPhDsU32x/petv
         W7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058219; x=1783663019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpJFy3k7fzvXeipnHRzRqJbquUwprfOCJ0cYmFTrF80=;
        b=LcZVh+Z+yP90uNw5apo/9gr7wAH1+VJh1euPED06wMeXX0aAyRbj1JJkJRkam4tyxp
         c8n+qj9sx30kUL4qZwmbYxu0qGz4AyyLLWlkcw2e/jJs40LbfYmQ25DuPp1WMj1F1R3q
         aYfswTGyuEayTIqIR739Juf09OasuoNcRYX3FlT3XBu5FryHIx8UmONCv8wgOI39GaJz
         HNOYpbDpnS/aDAxxgPxjZGYDCgukBq4EXRXX0b1I8CVFLpyrc98tOboeHzBH2KTK17O+
         LYm23QIavnhrqHB09YqZUcVhoabVJzcwXOwibehqHbnr72ycS+2YsqBGjuQXh3rOPEub
         qLvg==
X-Forwarded-Encrypted: i=1; AFNElJ9tp6DMKDGdy2tJuq8rmpKYdJl5t78T2FKqO8cQE/uLoCzBRJ0JaehYyMeHoRGH3S0WH7Mubg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQP7/Y51NeCvLxSK4cwEk0NyWK0IAOzBKDQbhLhELSVIQIP7zl
	+MQMSqZOgdt7BOesy9W9T0Dk8RGuM4CXU9QYF8NORJseBTBvMLYf4JGr
X-Gm-Gg: AfdE7cnm9gbsI2tha/VoSG0UJZfEXkFY7h27LlJB7wN0HlZS6wSl0lK0VOXbiJhiJhD
	mSOnz6fsqSWkWu5IxShYgZyDJEMNsPpVFzuaQIAa4NvAbIqpig/LH9Mz60jL+mMsr85q6ulaSx7
	6+elAhoMOnVvf57UgI8v4Uw475Eav9XhlkorwKNf+Iu2jFMLq+gEh17aD3VmTMNaHqazWyhhA6p
	08cP638yZ3dac/611AIfH2z0bWq3CuzZaNhfIYFWgzLA6+g+fqgr94byTVtksKCM/WiGIf92MQA
	sPFitfO7fyJBEQzqlHNzdRq3z9uI1bvA+9G/tcydLLFa+X8kPQnuL3FIAOpPNHrpt99d5OZGlvL
	pN3wpxxy9lGewIcsrPef0fM2Ts1ueU6f4v+OFeGzVZcMs1pBJcKXtlVrj2WtamkDyZ9yrc3JeoA
	4JtCXr4j/+EtW4UxY9RYQg690htlji1/UcBOZjNmVcSNNJzaU=
X-Received: by 2002:a05:6a00:9286:b0:847:823c:bdf5 with SMTP id d2e1a72fcca58-847c5140069mr7767376b3a.37.1783058219463;
        Thu, 02 Jul 2026 22:56:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:56:59 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 17/24] ASoC: codecs: cs43130: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:48 +0700
Message-ID: <20260703055355.244898-18-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs43130.c | 72 +++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index e7b06f962790..48d88dad4ceb 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -6,6 +6,7 @@
  *
  * Authors: Li Xu <li.xu@cirrus.com>
  */
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -818,26 +819,26 @@ static int cs43130_dsd_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (params_rate(params)) {
 	case 176400:
 		dsd_speed = 0;
@@ -881,26 +882,26 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 	unsigned int required_clk;
 	u8 dsd_speed;
 
-	mutex_lock(&cs43130->clk_mutex);
-	if (!cs43130->clk_req) {
-		/* no DAI is currently using clk */
-		if (!(CS43130_MCLK_22M % params_rate(params)))
-			required_clk = CS43130_MCLK_22M;
-		else
-			required_clk = CS43130_MCLK_24M;
+	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (!cs43130->clk_req) {
+			/* no DAI is currently using clk */
+			if (!(CS43130_MCLK_22M % params_rate(params)))
+				required_clk = CS43130_MCLK_22M;
+			else
+				required_clk = CS43130_MCLK_24M;
+
+			cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
+			if (cs43130->pll_bypass)
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
+			else
+				cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		}
 
-		cs43130_set_pll(component, 0, 0, cs43130->mclk, required_clk);
-		if (cs43130->pll_bypass)
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_EXT);
-		else
-			cs43130_change_clksrc(component, CS43130_MCLK_SRC_PLL);
+		cs43130->clk_req++;
+		if (cs43130->clk_req == 2)
+			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
 
-	cs43130->clk_req++;
-	if (cs43130->clk_req == 2)
-		cs43130_pcm_dsd_mix(true, cs43130->regmap);
-	mutex_unlock(&cs43130->clk_mutex);
-
 	switch (dai->id) {
 	case CS43130_ASP_DOP_DAI:
 	case CS43130_XSP_DOP_DAI:
@@ -988,14 +989,13 @@ static int cs43130_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&cs43130->clk_mutex);
+	guard(mutex)(&cs43130->clk_mutex);
 	cs43130->clk_req--;
 	if (!cs43130->clk_req) {
 		/* no DAI is currently using clk */
 		cs43130_change_clksrc(component, CS43130_MCLK_SRC_RCO);
 		cs43130_pcm_dsd_mix(false, cs43130->regmap);
 	}
-	mutex_unlock(&cs43130->clk_mutex);
 
 	return 0;
 }
-- 
2.43.0

