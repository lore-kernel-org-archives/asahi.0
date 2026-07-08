Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90364657F6
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515155; cv=none; b=dq5aEMaaMr3EzrujB3eg+EDNsKLDDA2LR7R7xNP2qevZNdG6YIXE1L4ADqylATFq5YWA8PXAxJSEIp0qArLcMrBqytI9qBJ7iKeVX8WZ5RQQujySuFks82xM0VS1g99idr7fVMjNvN2e6fB2yeMG1abM3q+nyzROSAox+axY94Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515155; c=relaxed/simple;
	bh=t0c54/72hct8lbrFEg8NJtCjqHP1Kp8F2lBkIgrtZPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PS9Dy5nbBUI1JQ22obyPmizjhMITruSy//oca5bOkYOColYlLA3b49q74/ZAjoLLxZPPbjCSM7CVILMfGJol3Gf7sG/BZShlvWZWquXj81l++z+xIlX9Eh5VZjAxABZDISqgOHZ85fG5MXODANPQaFwzfM33uCp4EiQYpFWFx40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My4sXujn; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My4sXujn"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37e0a189b0bso532757a91.1
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515153; x=1784119953; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=My4sXujnmMiA61YrfT7AJ4kWaRyh3riL8zFH8R31XSlmKuYHq9B5cewErFz/pGCJep
         mqasMOITjb/W7SdisfWTivTiPql/M1/OLdEeTtqwipP1WFpl3/rfUggD/EZu7ZVyFh4n
         CGdrWCH255PVDhXwcmt9lXfyIoBmZqTOg6VcAEMgNP8LJjSCTx084K8NPKkdBHm0afrs
         CyRks75JaCnBZqbdJZN8UjvbJ4VgBOUeEZfMZN3VJ15kPURnDtJ2zkDdi+lZzd3ayfeF
         eX9vdn1XTuYLpVb4mf0xxPXhiwL767/NOp9NrXe7AgdrshYwzVmO3XgWiOFO3MNDk1mP
         URQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515153; x=1784119953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMOhkYiBFQ4A6LLL8zx28PZmR8rjf52ku2Lvlz5rAJo=;
        b=MVIXMPjuMfF7qKycIJSndse11uNBGzlD4/JVTRB3WwM6OYqFG6q9kUXFOI9jx3w/eG
         ODqAxbjYbBMx/ocyeCxhoAsD4AAi6321xmovxG84Leo8dfd97VKvTu/VWKHcX8kirYUD
         orR6xLGhugqMzPZTKzV5zqq3FXYw3/ATWyTE8Ipvre2wk5pO+F8SjiZVlgWt4aw6KCw0
         lcZbCWHdZkJqaqiff9TjqUFV7MY/JOEasBSCgRsEIVUaZ5N3kTpwwj+oVySf8wZ94xPD
         yMkZaCHpAVinLPfwFdpVasEbUCWq1SdNT2Lkfp5O2f7pfO0lQNpUp2LdMWhfwlqXy4s/
         e1RA==
X-Forwarded-Encrypted: i=1; AHgh+RqPA+41xXuvqqsF3sfyxUJYA8nGDjliBW+0y0Y2h65Vd2hVuQPpX2wBxRbNoEmIm33cqdVP7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHGXcoXkkKd8zPIAULJy9Ta/Ap0mCFQfdG703gytTNunK4mJt2
	E6ROxX4gPZU501Cocy7Xx5c6WIyug3Y8vX5J2Pmcwg97v+cfdjaVv8YF
X-Gm-Gg: AfdE7clqw066DtDBpPo9TkzO9Bw3NOI7p/WHdsFQYhqkz5uLCZJ5OQFz0n0kc+eqz/u
	lagqJE6d3KsMVy2fNa7kjb+u3z809Ljoi2L53wLhtbqrWwP04aZ1t5pcBYplWySAIdBuD97Kp7C
	OMbt4G/KT/cTpewuCWQ8A51D0GuVjid1d/kplNak2uSssPjvKtEC81UPwf6AlGILcq14cmDs7NX
	dwrr4yTogQSe6jLJHZPcTQes1hKn+LWi0ebHFZOeu5/DworthxbOjPtLsUP5QYS8zUUTOhp8gWQ
	JBk2swjBMadPwU9YDZ9dHyIVgQCnJy/hAilzCmJ5XVxkn+naKMrJ/HG84G2DdReshCbCEceMJBR
	lJzJQsJRP/X8fZsmUDkzFYoGvxVJPSe0lH9Jvf5zghezEa0LghlQ94KianyYzz0LKJMW1D9N9b1
	hr2OXzxe9ZNVuvF93fJT0j2E3hFnJBx8AzucUktucpLmJ3f+4=
X-Received: by 2002:a17:90a:c2cb:b0:387:e0db:bc2c with SMTP id 98e67ed59e1d1-389420ac578mr2725220a91.34.1783515153137;
        Wed, 08 Jul 2026 05:52:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:52:32 -0700 (PDT)
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
Subject: [PATCH v4 16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 19:49:53 +0700
Message-ID: <20260708125002.202515-17-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs42l84.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..36533a13319d 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -281,10 +282,9 @@ static int cs42l84_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l84_private *cs42l84 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	cs42l84->jack = jk;
 	snd_soc_jack_report(jk, cs42l84->hs_type, SND_JACK_HEADSET);
-	mutex_unlock(&cs42l84->irq_lock);
 
 	return 0;
 }
@@ -831,7 +831,7 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 	u8 current_ring_state;
 	int i;
 
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l84->regmap, irq_params_table[i].status_addr,
@@ -902,8 +902,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				break;
 			}
 
-			mutex_unlock(&cs42l84->irq_lock);
-
 			return IRQ_HANDLED;
 		}
 
@@ -919,8 +917,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l84->irq_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0

