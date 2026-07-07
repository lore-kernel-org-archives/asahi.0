Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B2937F73E
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401069; cv=none; b=pzdwEWuhk59B/YGFwRq7SSEOsQ58GluuCwkbMn1Rtswl1Kq/UVqUH30eLUdet0noIvlNspSDX3pjf+HG6scVtTE5FT3JbLgtwIW3m5+eXraFfagBndwRwjpiKiG/SWoSt2QDEw9rNtdoJTbsic3Efrl9vKcdjpYbjCkpUrpWk60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401069; c=relaxed/simple;
	bh=6FLcpNOV0G/lngFmbaJv0KBbbNvewbSjUbmrmr4SBjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mk+LzwUbYKlq7aottTMQdFGQ2oXRzmTn7nPliUPtiZrbRtgjft8cvVAIlXXL0d3z+bmzBC2t1TbXWYdoz3DEiZU3Zw/F0y6/Z2gunHv/BfwFZp6cDYLuMA4HxsQbYSxk+XCe0YdHcs/yl1ZQ9FXoDkue4ZjTDznBF5wT1wbsuOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faPcR3/x; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faPcR3/x"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84832ec2615so97858b3a.1
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401067; x=1784005867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBAOGNDCN1PJ4euWIObvfkCj8NKOo6+NOGkAVEcmjRI=;
        b=faPcR3/xx6zC6y9FEFukWuVLE6QrPm8d6YYr5DzHUlZrY6hufm+8Je4DNHO2+gRzMt
         5LURjMD6QGFH++pZKIrtZKynPf1hJjx8yCDyYvkDsd2PlpqQ41AEgkuWE0hkAdZUJV1i
         POq47m6dZt/shYNiytUAnqZF738F7h1/tgHm6+F5RIH8LX6hVeVTpvuwkLJrphqMY5+a
         efMrwd7XohMM0daEvYzjQeMqRw4YJwc/aAptyHTYHaSC5DqbQBHrXlD4OYTx627otScJ
         wDWM1BVsUr5mhmz1NWw2peeUuuMuWl8RrDv9j7dHu9ao3OKvWqHPX0+BvZlxTMdNg1bk
         Ictg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401067; x=1784005867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBAOGNDCN1PJ4euWIObvfkCj8NKOo6+NOGkAVEcmjRI=;
        b=GTEgLR3i63oA1hJUom2iSZ+srugSIqAkwOozSVAExZuZWpM+y7/MS6sQ8dF6quOXDQ
         SLrjUQXYO9DUcA8rA1uvjaMEgeTcjZJ+FyA2earuYoyvcKaa9RChCEaOYxDao+DxuQ1d
         KvcnYnyy1MLQS15jPY+1z1B3v9Ec1IQBKjtq1yWGuFd0mSrupLJl6EuR8oVTWhXt3/Tb
         ItZplcea5tq6zvyltA6Bnn4isauWZRLcRowrqJmTAl+5D6VjXqK5igcd2FhM3MPK+xgF
         allV6Y4NNLBroktF8Mp+/mzJtk8uTDxhzwV9tRgq8PXOD+P/Ol2/roF79Jyc2tBux/S7
         AWWw==
X-Forwarded-Encrypted: i=1; AHgh+RrMOFH9CFinKSPa7LK1PrbSbUDCvVMpTeMCkJ0g1Tt3gyGXgY6ISTPYnoWAU0sRzOvRVP+qtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzH/3meHk75ZXy/6hmGQwTub3Aimtk+PjlSlPSNd5g5tTpjTjUt
	XQEaak0n2NC7fZEzKCUIDr/9bY8kgPMo1JztHvQtHrCv2D7Yl3HgSp26
X-Gm-Gg: AfdE7ckLGoOagaKG64SKV+jgHucFK0bxaMrs9PQQ400l6HlbYmbgQ/ozZg/1+bZwoWZ
	/kkS5Qk4ZEMamCBTZ/IuVm5hkPfgA7OVzJkF8DWIGaipK2tE9bs6hqWjPhrKgXPNLFLwpGby5Ut
	ml2BsRNUQ/tbw/ZRL+Q5zMFWWClWqUs38hO/YdqR80CnAoVFc9HO0NyRO33s9dgOYjEVce0Gjcj
	pa8hfjTM0O7Nfmrg3FZcnv72lytNPvnddyLc0R3xT3qrsGyMpgvsDeNksHGQ1Ki8xU+HypZBCz5
	wpKGYS3Bjd2Sq1QWleZvRLnB5ea8sH9uDvont5ZPp5NJ9DZZRnVLC83SL3WC1ttVxWLPS+dI4eX
	lPpUUVjYG5D6wt5ZfHXusUkyzK/WdfpsbWkG+5l4C/N0idoALX/t9IrZAhwbGr3eoc++So1MoWe
	0ZvoJJSzqTku7/VhzEp1hNWgL6DX+9l5lwzQJaicZpSksZnWY=
X-Received: by 2002:a05:6a00:1c90:b0:845:c0db:3924 with SMTP id d2e1a72fcca58-84826bbfdf7mr3074399b3a.24.1783401067431;
        Mon, 06 Jul 2026 22:11:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:11:07 -0700 (PDT)
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
Subject: [PATCH v3 04/24] ASoC: codecs: arizona: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:46 +0700
Message-ID: <20260707051006.20058-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/arizona.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 8c683b0bb74c..4411165c3734 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
@@ -1158,17 +1159,16 @@ int arizona_dvfs_up(struct snd_soc_component *component, unsigned int flags)
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	if (!priv->dvfs_cached && !priv->dvfs_reqs) {
 		ret = arizona_dvfs_enable(component);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	priv->dvfs_reqs |= flags;
-err:
-	mutex_unlock(&priv->dvfs_lock);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_up);
@@ -1179,7 +1179,7 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	unsigned int old_reqs;
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	old_reqs = priv->dvfs_reqs;
 	priv->dvfs_reqs &= ~flags;
@@ -1187,7 +1187,6 @@ int arizona_dvfs_down(struct snd_soc_component *component, unsigned int flags)
 	if (!priv->dvfs_cached && old_reqs && !priv->dvfs_reqs)
 		ret = arizona_dvfs_disable(component);
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_down);
@@ -1199,7 +1198,7 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 	struct arizona_priv *priv = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&priv->dvfs_lock);
+	guard(mutex)(&priv->dvfs_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -1222,7 +1221,6 @@ int arizona_dvfs_sysclk_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&priv->dvfs_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(arizona_dvfs_sysclk_ev);
@@ -1657,13 +1655,11 @@ static void arizona_wm5102_set_dac_comp(struct snd_soc_component *component,
 		{ 0x80, 0x0 },
 	};
 
-	mutex_lock(&arizona->dac_comp_lock);
-
-	dac_comp[1].def = arizona->dac_comp_coeff;
-	if (rate >= 176400)
-		dac_comp[2].def = arizona->dac_comp_enabled;
-
-	mutex_unlock(&arizona->dac_comp_lock);
+	scoped_guard(mutex, &arizona->dac_comp_lock) {
+		dac_comp[1].def = arizona->dac_comp_coeff;
+		if (rate >= 176400)
+			dac_comp[2].def = arizona->dac_comp_enabled;
+	}
 
 	regmap_multi_reg_write(arizona->regmap,
 			       dac_comp,
-- 
2.43.0

