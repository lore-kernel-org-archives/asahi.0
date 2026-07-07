Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2E637F8C1
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401077; cv=none; b=rR2ycyDtP1jVMnOkIOgoq39tMRH/lWIZ7vj1oFYAS8P4NKlxr+ZZjvEb5NNJQiOvPptpjr2Qgog/Afz7oFxflZBrGCAb0g25agi3DCthyEQgohc6pR1ojYJwPIQvfpT59hGu2LpoX9cqB+hq59B6d9Ql3y4gJl2jTPYY5le2JAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401077; c=relaxed/simple;
	bh=yfnMNacLdodpfRhW2bQZbE7pm8s0ri1caS058dgJKWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8mW0JoyNBhRmkPJ1YmFl5Szw2K0aubdiNnk7ugxxCEaJu3w0bSstqgus+MHCY0LFNEXLrEs4SymZf0FisqE+dOpZFJdAAhcLZ+k4n65+pb0n1xk/ODv5HK/jS6ptK9luILGsAr/8LSwT7TPPxu6evVrNei9nKCkMvkVkGnZRUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRS+6LKK; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRS+6LKK"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8481fb4324aso978861b3a.2
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401076; x=1784005876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq5Iddla3Hd0Zh5qEYq/9fp7CsXU6/7TUOr0ybGJuLs=;
        b=oRS+6LKK49vCAtN4gxkxbrDQ6S0lZBbArInNIe/t2EVV8xqLlELcKk9aXZwy8h+K2p
         taujJvKnFpUTs5tl4eXZe7ASwTYMHNaUxoesWxJBwhDWRm4LOdnxQ8qWVbgFA4JGyIaE
         u42t0EbZmQORlxBvBGjRzL7QKV+oALIoVbyIXmu0siTZIheCTialHBJNpZTITWa/WFf6
         wvXf6dWfwXRov5SWL19Ux4E6DHTVX0sGHObefMqx8s8NMmpjg1WXJQTQ0bZgG6nvev5s
         c2psK0Al0bwDrR48pFuvflo9b1O9pm/9xHBnfBY/cveO6Efcrr8pjZ3SWNazdz9tbyhD
         Gsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401076; x=1784005876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sq5Iddla3Hd0Zh5qEYq/9fp7CsXU6/7TUOr0ybGJuLs=;
        b=D+xDtiUEO/zGlfBqxm8/K8OKajAt+i0NHPV/FV3/NPU/PCz+JMndB6+du6WVjPujyj
         7gf5loesMQD5OYEBlFrs9ey1WYQCjPLBhajmtOvkSZXXvfWIR3kRdWHbcneECre4QaOU
         /AzaejdKAkXcJJ3bn8+gFS/huTHWJwxPN16sQ1GuVpBMDqQjrl0HPlSkACJXU4UCKpC2
         g8B8K1Rf7RO2MRIKuKzfuPatw/Lle3Wyy0adPS1MAXJxp7GVrvulixUngrMk/KHlKauV
         vD7NvhE3HuNx32qrgClJ/7SpIhZiBN1VAfZ9j+B/+f+zJzYIjfYVZcRrVAIqjOzcce2Z
         KTKg==
X-Forwarded-Encrypted: i=1; AHgh+RqMQoB/LltDq/IO005m6iwhbC5mBskPh4GjHTJoxPGJm4uPvDGiHAAcE5/zGSCCTZwpU1Mp0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRnb6Wpk1AJsdH5n2YCCodeUYoXFkpVs066BavIXbxbPCCO8j6
	KnZo7aNdmUxQkQIaFZlqwD1Zd94kTkq+QQ/cLwEfnxp2WlUMTNYzB9bs
X-Gm-Gg: AfdE7cmRWuKxe6IJJ08SWE7SgqpqpKJAvI3D9318TuhZ36TJ2U/F0M9o1Ex5br0C91S
	PJGtT4+4llmR0XlX2oDkSnS2sGYfu0ht7Z0JgnB1q6ADqKhxOUr6bT4ToujufA/BX6LS8hDi/Et
	gY6UquTqTiH77Vuzt4UI3YcnqssO+TE2rYmOGK62Fzyms714HP7962uO8EvtoySN/dZ9b6nHjvQ
	8z7SLnhOn+pK9RVrtAUhkZp3JANdHCSWplbtgQDW7nDjezk1k10e6tzKScLmTIXG9FDp7yOaPuL
	g/AtBQxlrMdT6V557UpZA81bAtkcvW6+m84HlDBJCRBernzx1Drf9VSmJRZn+5u9odEh2gaA46i
	6SIp7NH5vKXEiEtVEKY8DQ8ZpZMarHec2C2uc+W5GDwLYs05vD8PKCnfDeMKhcrFrZjzeYTPBJE
	OCA+TB2vcZS43NvO0heTdyh9xYtLaO3SgZThoyYZskHMM3kag=
X-Received: by 2002:a05:6a00:3a07:b0:847:9268:d73f with SMTP id d2e1a72fcca58-84826c1e243mr3462917b3a.9.1783401075794;
        Mon, 06 Jul 2026 22:11:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:11:15 -0700 (PDT)
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
Subject: [PATCH v3 05/24] ASoC: codecs: aw87390: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:47 +0700
Message-ID: <20260707051006.20058-6-phucduc.bui@gmail.com>
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
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw87390.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 020213e0ca4b..8150670fde2d 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -7,6 +7,7 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
@@ -225,11 +226,10 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw87390 *aw87390 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 	ret = aw87390_dev_set_profile_index(aw87390->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change\n");
-		mutex_unlock(&aw87390->lock);
 		return 0;
 	}
 
@@ -238,8 +238,6 @@ static int aw87390_profile_set(struct snd_kcontrol *kcontrol,
 		aw87390_power_on(aw87390->aw_pa);
 	}
 
-	mutex_unlock(&aw87390->lock);
-
 	return 1;
 }
 
@@ -280,14 +278,12 @@ static int aw87390_request_firmware_file(struct aw87390 *aw87390)
 		return ret;
 	}
 
-	mutex_lock(&aw87390->lock);
+	guard(mutex)(&aw87390->lock);
 
 	ret = aw88395_dev_cfg_load(aw87390->aw_pa, aw87390->aw_cfg);
 	if (ret)
 		dev_err(aw87390->aw_pa->dev, "aw_dev acf parse failed\n");
 
-	mutex_unlock(&aw87390->lock);
-
 	return ret;
 }
 
-- 
2.43.0

