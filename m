Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B564F43CECB
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515192; cv=none; b=dEpEEAD7sU9EcXYJ2QZIBB0UOWBTycHHO5YSjP+zShsbnK31hZVRSOhrE5x7aE5MKgKneRGDmSBchd+ctplBbr7mXU9kl1ZBh8p4E4tQ8Ce1pmb91ozCpL/xiZmVl6uM6n2CcEVLmog7sNrsa/ZaSS3BpcoTFlxKUrXLlO4v2rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515192; c=relaxed/simple;
	bh=Le/mCnMQIax2AIs03vo6Mt8p3Vs/8n/EDxeqb34NEkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIzmzM8/zs81NjTk2fjEfeMYohdKZiRR0/xmCdDKgLQlRnnWaOBg7yaMQfSXoCLPHaO7ssUH+5aG7PltXJ6INgTk1DMOFvQUFKQXXzk+3iAdFPYZ0X7M2aP3W0I44vgn3Ku1vWzj03Hk06Gh4ursxWJymLYaONXB0MTWCAOOAsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr5ZDCOz; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr5ZDCOz"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37df72c9984so752360a91.3
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515190; x=1784119990; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCksePGNWGl91KCBVw+zp9IPALzIPsi0R5pb9fP1JRU=;
        b=Pr5ZDCOzDjzGy/mpTwlgMLYkzD1FQJAPv8+zaebinrMXT9jQ7YByjfc9qGR/qvFvR8
         AmDP/gozN0ZDCUqcwuiO2x02gcbkf0pDWIUM1o+kt6SiLB+6M7TmRZ340T4iaa+z6j+G
         rd/ZAoqoCwR2n5Hs5pgz8XaOe9qQRHKjZS6khFFgZJ9GktXCErw/GnGOTXX9C911SrHE
         DvJdS468pCCVZ/Yn2+MEtETVYoPxSioq9o5jt4lWg1/CW0NxKd+J9VgbObxGyhG7a+cy
         /YHY0pNtDur0924UWQv8FlpB3i7QeHXiQU54hXBnB+mS/tgp0DOfEeDvkexEjPDMtDmU
         d4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515190; x=1784119990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCksePGNWGl91KCBVw+zp9IPALzIPsi0R5pb9fP1JRU=;
        b=YzlcIJ60hUekNWzHfi+vMrsXVcwXdYNv5sWeyzAkzVFySddzVZO1jsN+Y3Iw3yH9xH
         m959v6kGgF/+lmbc8rUI1SEkz6DUOAC/sJRlnAxTKT4xHRfbYqM0oZ1cl32tCmdeWVFp
         gT+ycCgwCIe7eOvP6gQCR5h2OS+HDodlsKgz2LvfpvhHcJakvEZH4FeRsMZVcPfybcaj
         q4T4NjKFYjGO1bP7Crc+B14eILXMopWTjV79KpprlLMDV7B1JFqp9kR6Q+KNuMEzfVTO
         qExIM0fIRh9UWiiy3bLY52sP7PFcbIJRG28eC08n0ew+etYbasT4FYu+nS+4H9lJ6qif
         JlsA==
X-Forwarded-Encrypted: i=1; AHgh+RrwIzl35SZga/Nyu7TmgGRyqABne0tmtYWFYOQ0YwfY3L23MaQb0qUZ6bPWdu6GpI2eqLaZDg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+cejPPBWgL01FplvQU3SpyYuBHbidgk/XcwDHXb5vg+Z5SVGb
	o8/LlZzAxFkOt41mTmP0BoXgoz6MDllE+T9Y05fP9IMpllqMWQO0yK9q
X-Gm-Gg: AfdE7ckPEV9yqC/FDP9EecyFc1mky05rogYvLVWELsCV+29y/Rg/2vcxEGJcFFLUTvh
	QXkFUrLkAOeM05jxd6DAZdNBWNIY3K/Z1V+UM2HkXLc0AgsPz27UKhVIRI8PU/6DEjXlJn30Pkp
	AE3PxtKtaG52P33EyPHLIaEbaHnbcEbg+T1PktBa5iuA8Jm2Xq0kTOs569C/A7X15Jn1t6v90qp
	NyuCojXBT4Gc6iQ3oEqebmatnG7b5cOoLYoQU/gAkK4eS+cQgDQaDOQxPGKGzrGp7oFPob+ZL0y
	qpqlDQFlS9oHxTQX8av/ucYXgE+ofsKRnqSbja+ceF9P9M67bV1TTHMlcMHBFccM93ybu3CDEF2
	GW4omgoJFlxXLNS6Dv5zrH7LaYTWdzk45H/c8sUPSXTgNs8hQDSOlYyHXzU5SCeRSxrJt29/Grs
	JlJzrlyisKxsGY4Op/ZTJr8A5Ldm3Pi6BO9hNBPEvuN2vVK1E=
X-Received: by 2002:a17:90b:2583:b0:388:cfc4:7e6a with SMTP id 98e67ed59e1d1-38940638ab4mr2388245a91.13.1783515189986;
        Wed, 08 Jul 2026 05:53:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:53:09 -0700 (PDT)
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
Subject: [PATCH v4 21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:58 +0700
Message-ID: <20260708125002.202515-22-phucduc.bui@gmail.com>
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

