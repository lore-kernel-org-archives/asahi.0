Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528213D565D
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454568; cv=none; b=ta3vekCs5WSrwQhtG4txSCs2esKtWdV3MD3z7PJr9K+/9KeAEIvS6Il5TgUSxxlyPqxRl+aGTVB4NR8hgefHUPeGCfKA9ci43ucneK3ALC6P+ikwWdf2ArvZ3mcZjikRGLCymVC47HXvclMBIMuiRT4zo5qKFBH5k1qtfE2Bk08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454568; c=relaxed/simple;
	bh=4u5h0yVn9yjNIfqtU9rFyysttAZ5X//E9h3Qe2r+g+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXzEUPdnsEjhFLS8bfpkRiYbaQKu+E9MX+ebOfX0gfWv43/UJx9rFkA2fF5X2O1CpFr66e3WxRcyRD88ZB2zzkt/oQbi9axrog4FNAfc1OBkWjiht9icqupecXzZIxRW1hYIvBIjKhnCPa54i6XQzWkvDLcFXZAXdfFrLr2XLkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHztHame; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHztHame"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37e0d09be07so426717a91.3
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454566; x=1783059366; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m86tuCHiDSXFV1VRHqmj5im360M3DmbD2YS9wwBnIRI=;
        b=QHztHame0lD2k1SrK7H7FyPHyZM+SQ9Q7js9sr7mEmvNptxiNa5CMlG/H1bercpMCn
         CuxaqVxS07G0X3cLrU32O8T46rET5VUUj3bSkNmKcQcoyS3Kgkvvvc8mHLGtxZBg1+de
         3tVFArR5rMY3sctGsklEk/hlXSppDlRM6gpWBDcOXTD3zjqYYc8MsyH93TJyvUpKDVsu
         /mKdiWhceMIBPhF/h+9rN+0pKie5ZHa/u3zhE90L2pkrq7mwXi9Yn6LKy417MgJQUGqG
         v3WEQfHg/Z5sEUGygtWnx6fTOKUnr0TGCrvwvryvLu3LDw9wEWdHxH1/Ie2oZbVE4wCI
         s/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454566; x=1783059366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m86tuCHiDSXFV1VRHqmj5im360M3DmbD2YS9wwBnIRI=;
        b=gR900NmEjaOHSFYWkOYmObEVxIUAy6U3hCWkBy+IEUb0q7UuFa8PYopKDV+Hc9RHtv
         4pO7XlEAFJqBi95XVTArvR4Gnwa+eVLehE58G5/mY8oot+eyBMcYDufOtA4gLxWuKN5c
         qWibgeFpaSc1g32TteGh+/+vO184CZuTE1jShTDmOmr4LHrg+8ohtBzseGUkkBURHlHL
         Se5obp4WZKVbjRIMvOXdVQKRInADO5VrPQpAjjExUBjeZHtyR5V6Sye8+5z1hUrWrOgN
         XdR0rHX1bgRXP0/WHiczUmdVbLOIvcOxeA1hTE0+UAVbRGStej0000wHZTvaDBEFUElc
         /21w==
X-Forwarded-Encrypted: i=1; AHgh+RqeMTZi/B/f/zF1mnq4DvnPmF7cEFVTPhBDpaaICykHV1sGBXnmPjyoKCMqIAj+hPppO6dsIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvggiI4RriDxZeb7qY2H+OtH6YZNlJ/XL238L7SEWfyWhseJqg
	TWuGuGlRWVhj0iMoFuNsX+yI45xSFkYaHIY/PSeR9PSqXP0q7AnH2x0R
X-Gm-Gg: AfdE7cmjmthFicARkWTJPifeSkhxymQ6Ti2NmDJwXvBwkN6fLKIIZ+c0LPsG8zu/YXI
	xxUM7NhAMV2EIKSYx8JQo6+EXnsgAtmWm/Cin7XsWq7Xik7EuS07qsO5cEf0shJzQ31QLq2lI+B
	ecjuM12fxX9ED3WImlH203Zh1t7KU33TyDhyPTCpD8jtG8hDFUN6AX73QGfmoy7l4iEGsYpvTYP
	TcEKI+o4Up24zneM08PrBcZqYx5EDHZN7j05f6dHhCHm8MESqiwpwiZ8UBQl3NMtLOxPzHHifFy
	qwKBN1yv1gnCO8radQRB/N7AlmhVJddq07HQ2nGB37zCvKV0UHtx4QcL5JGAOKXxYW009l2lD34
	GXyWPUC2HQWFDngFvXhel4N5jWeEHSE9dV1L3sEcCUDhGnbagt1chmbZ/lZ6u0q88llSyhiptud
	B6fPxV4nIctBFPiOvmDK59gTdTQXTAQz/y9FRp7/1qSr7T0G0=
X-Received: by 2002:a17:90b:3a47:b0:37c:6505:e7c3 with SMTP id 98e67ed59e1d1-37dfa274673mr5403834a91.22.1782454565637;
        Thu, 25 Jun 2026 23:16:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:05 -0700 (PDT)
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
Subject: [PATCH 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:24 +0700
Message-ID: <20260626061329.23264-20-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l35.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a8fe5a99a8bb..e77ac7bc8466 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -1566,9 +1567,8 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1600,9 +1600,8 @@ static void cs47l35_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l35->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L35_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l35->core.adsp[i], component);
-- 
2.43.0

