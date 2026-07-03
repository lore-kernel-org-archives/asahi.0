Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F635F5ED
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058196; cv=none; b=tdwUtPfxrlbflA1JfZLKIGbMtx3VfpRgL17zLPhsUdIgLiLtfMxGydWIzeCxZ5KWU2VnDTmt6OqO8bUGbzy5ZxW1/546fvRchrdo3xBtKoh97Rq+4rGcRItofHmYtPFzHglbj6x3oAwpcLjVIhVouwuadwWW7XzihQkUSGQcbtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058196; c=relaxed/simple;
	bh=ayaHX4mMdnxls4En1EwNkX3g8301f4JtBOFZVawpn0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxD6Osb/AgvRpvz7GDk2N0HEQvX8w5r5s2TAT+GkoRxUAZoWof3y+mtspJaZHAq7502fOIJBJABGNLSb3JqDpgkybToM3DboyapLDNh0zJ54uCEVoEM7EfUnLJW7l2PSr2KBXQfwU6k5xC/HKzPLPXATCnnmY1rlnpPjQCd14+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5GsJGox; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5GsJGox"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-847a483e344so168190b3a.0
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058194; x=1783662994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZxOc8ItyVRPfzczN4UVB02dx1NcDBwODm4rRtT7paI=;
        b=V5GsJGoxOrYkj/D2yeVljevPh+y9BspUsPis8Jv9atq3UBo1okZNUNR9gBUcLOTjBW
         RtZe7l7GEDyJwWLRfTf71EN4alhva+PAH4r6F/+JzXWykgfJ+/52cqyr6mE08HdRUeXm
         j83Ahih2j5mnGszxwRIfn7ndJHraEKfr+pl4BOEuwsTj6wiyWU4qF0pxcFAj+LU85vsD
         jAMTcathDycUsl4juqfqAdDfncll5Bl6vlhpE1D9WFW4PmHIWq+cmHAdTS7PKayi9LZy
         FkPOlIkUGEc0TNHlbVKrgoN4soichWMQ50Ux/veMwOxn5BVKeZasX2dhdIz7uQeXuUsw
         8afQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058194; x=1783662994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZxOc8ItyVRPfzczN4UVB02dx1NcDBwODm4rRtT7paI=;
        b=l9Ytkt1AkMXrsBYlV9Yce2Y3PoXwmCx6czfzmMtz2zM7ou6CzfvWf+l6xcLN6b1tRr
         3Fa4sUK4I3wBNVThLN8NrbINoiXfMg+vYoO4ZHAzYqJ8nw4zh4xaTF3g0E25WXUg4Rce
         kXBVrlHgwD/Fy9shHJwbpKQb32Wej1aW9lMQboi5mqC4XI6IqxAACQfYE4t73jcxysfE
         qJ5Ew5raIeqsK2VKGplipTJl/Cd92UmAwCZ3WHT/2o5yStfE0e8UhcX5CseI0TdUUWF8
         lZZCY4PmX6aM6b8QnXtcno4EbO1qVjcs1kmD1ACrrSPWMn39hOzz9gXHFmzPE1gzGrqt
         oI0g==
X-Forwarded-Encrypted: i=1; AHgh+RqbGauCTrXYNKptmj5wMEOAB0JFD19ts5S1vlLG3rGadV+3vkKa+lo43I97knzbLSIWmRj4UQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpp7a6QB/zP82yEpLm3oMxcoyj2MwylqtT/+cC0WiJZzw5Uyy1
	a9tP6EwBSqm0C+lygv0Mnl+yqpUFBYtF6Yl3uxdkGcC9BKy6A9Jgt0qe
X-Gm-Gg: AfdE7cn8f9GR5BRWSlwDZpcsLoUS2BCdiSf8s8KHuJIzDAowZ+eGrm2SmTca6jT+E4c
	N4o7YyYR42Y+t8X3Qa6mQBKhvQj14zgvxpq/TJMrYPv5hohApGuo3WYUFyBohXfW/6QRTR5Q5ID
	7FnjLBRrCyAXoyyEpjanV0NsOxT20ECTeIMSCiJZKjkO5/8bzhXzjjfJbrCrvfSRzUHz6EPfDK4
	0YbrbIEl7db3xEUKc+aBjdYFJ82GVRQLICLGE0psPv8KPLoZ4anSYMBtVR5qw5ZPLXKlg+jTKTP
	957aDIWguNBTmOIES/L6bkFwzpxcz9vb4flw4YYGlcJ3aGrauyxLndKGwH4uyHiTuaC9As2BY6U
	ZLBkuPtgaMzx8xs476vTKwwa6HyHUmidAxnbx0RSDoOHoHMeE7nm4+ylkj2UexPV6BB1Ge+oJSg
	1SjGgL/WFt7jve7sqyP8Re6SdjlEGc5oQQOzGk5VoA+3sg19M=
X-Received: by 2002:aa7:88ca:0:b0:847:97b2:2263 with SMTP id d2e1a72fcca58-847e1882eb3mr2694237b3a.22.1783058193968;
        Thu, 02 Jul 2026 22:56:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:56:33 -0700 (PDT)
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
Subject: [PATCH v2 14/24] ASoC: codecs: cs42l42: Use guard() cleanup helpers
Date: Fri,  3 Jul 2026 12:53:45 +0700
Message-ID: <20260703055355.244898-15-phucduc.bui@gmail.com>
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

Clean up the code using guard() helpers for mutex locking
and PM runtime management.
No functional change intended.

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

