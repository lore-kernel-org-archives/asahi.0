Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EDD3812D1
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401172; cv=none; b=hZ4TyJ7VYT5jxMS9tNiIhSKTxvG75Pr/RwOjnHMXEDUiLKBt2Vi739BBUfI6fo5+/HAVuR4aO+4mTArYXLOkpZ6yXZtUwZ/2IVA3d8k0JLezBpJNBQA//tPt6ta1FNt/jCXXYsDFtEy25MjxFUFOXR446Jgjcn60tLCl5Dz0tl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401172; c=relaxed/simple;
	bh=YYnwuzA32vCrBS5jxPe5g87ui5erA9BMb2LXDj2ivxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TM+fvY28HermrXtRXmLm14fsHTeEi1U4Rt6t0IYOZYGo8q+LWyyBsIymkYpRPRwSCKe5ArKgsWwvs86quncRI9U2UOx9AUOvQNUo7YJDvpXpUESq7eZzGuakICOteZBHuMsWac3SXzjqBWU3ZY0iaVDaQpr45SkSAo4NPzxUE/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8zgBk57; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8zgBk57"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8482074a000so1095583b3a.0
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401171; x=1784005971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OeTn14ndUmp4M0jbxxRhmn5UH5bvV8+qVb+FxPZ1/7c=;
        b=c8zgBk57M9pawwcRqoFrHZ+QHg37MzFFT2M0B0UXxJmPqG04g11SfbLpQpMniduleQ
         TLrh9KfgcumtBDfZoRXjxEANqYfaqB7FntUYA2fbr9LMpd4uw9uK+27tOsYFnN+mX68i
         +hm08Eo1cvIj3LJniSI5PJ24Pc+wZkRz85006D1jEb6OMyyT+SWTmMLs4BRs1QRbdN6i
         qOhOXGR1W2gdquAQOXJZZ71eFq5MTuQwAFXZmBNMMTTXS6PpEvOZJwGx5hpSvO6LFM9U
         pxFoGzjAo7Pa7nNRbZOYEAIdI/M+h1nE/B5eOtrS80aQuFloZZD8mEOyLgZz5+a2lc3g
         lMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401171; x=1784005971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OeTn14ndUmp4M0jbxxRhmn5UH5bvV8+qVb+FxPZ1/7c=;
        b=Tkd/2y2B5E/CaPtwnWEE5Irnug+Mc+YlBGb+atKpnGB9TSGCEZY8AJqxtWWF4iQeJ5
         BAJyT8r5SvcGXsg0jgELH1pVtvd5uvelcG9G8tRGl26JAnuZ8Hljb7XSuyh6v7Utyu63
         jYt53Vz4Qmj2QEphDtgYqLebRFEYmAUVrRtWSUiUur56icFg/UmQpbkvRwEpOEon6fDd
         +14Tl8Nn6t02WS2Mwp859HX801qN2JkXcccUU5Qlf6bnhb84ga4xAarOyaIrAMdNrPEW
         quMpk72MjoWkrvBs8BWZc5eIZLh8LLfRUIj8/SHPBgL+W6bwoxmOD421+XowpBK14nHW
         XZ4w==
X-Forwarded-Encrypted: i=1; AHgh+RqQxQRRXopY5g1YxcvUHOxHDOE2OwKv5iCIiS5betH4ZkOFWWwOpMHB8M9tynS88pFUZvDL7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxI0ffujFxSsLnZoeetU4Ud71+antdD/l8MJXSDIvgb9/5BckRH
	BDpCS2DlppT12xuVqs7gTfTXyRnQXiaafgHBBK81WMADaXPZ3oy0r1MD
X-Gm-Gg: AfdE7ckKL5r0R4hsDg1kQqr2T1Nxtwn57AthlC8xArOzmDmnflVP6EnPrje7tKTJJER
	pfnFCK4Z436IOj4fC6HvenymA5iKik0Y5zWQkIIIrb6OCVExgliq2elLuLWVzII4F7YfqMc3RpU
	rqEXH23yEakiGUdpEQfmdNWvijociC/cacK9tNvd3kfcdyBf3SbVY3EjAuOE3IGqIjvwWRwG2tC
	wbBknw2AyYy1PtmgjqISjQfVambjIg1hEJ12MX562/fT2IwbTNU9kHNWBQxve2WBVJ6rGi3yEEQ
	VQwU/aizi5CfaISS+JcRSq6gIkrFAJ7FA5iTj7l+i4asaPDOel4wzdLWGaIuDrjFafHGtpEF0Nw
	JRKXJhrkz2pi2Sqy3T0c18XhBlj8YrDAakfS1+qIq4kVBD9UgfkhWKI0Zn3OXiKa+GWdyQBK9kv
	3BJiFSGWN3qymZ5fERiuL9GKGeEi21ijy83q4EvOphRzo516ndXT5cUAVLIA==
X-Received: by 2002:a05:6a00:338e:b0:848:2f74:1d62 with SMTP id d2e1a72fcca58-8482f742067mr1273678b3a.72.1783401169864;
        Mon, 06 Jul 2026 22:12:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:49 -0700 (PDT)
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
Subject: [PATCH v3 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
Date: Tue,  7 Jul 2026 12:09:55 +0700
Message-ID: <20260707051006.20058-14-phucduc.bui@gmail.com>
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

Convert the interrupt handler to use guard(mutex) for automatic mutex
unlocking and PM_RUNTIME_ACQUIRE_IF_ENABLED() to manage the runtime PM
reference through scope-based cleanup.
This removes the explicit cleanup paths while preserving the existing
behavior.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3: 
 Remove unnecessary blank lines.
 Remove temporary variables and return directly.
 

 sound/soc/codecs/cs35l56-shared.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f14e2eaaa4ee..d5817e420847 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -640,23 +640,22 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	unsigned int val;
 	int rv;
 
-	irqreturn_t ret = IRQ_NONE;
-
 	if (!cs35l56_base->init_done)
 		return IRQ_NONE;
 
-	mutex_lock(&cs35l56_base->irq_lock);
+	guard(mutex)(&cs35l56_base->irq_lock);
 
-	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(cs35l56_base->dev, pm);
+	rv = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (rv < 0) {
 		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
-		goto err_unlock;
+		return IRQ_NONE;
 	}
 
 	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
 	if ((val & CS35L56_IRQ1_STS_MASK) == 0) {
 		dev_dbg(cs35l56_base->dev, "Spurious IRQ: no pending interrupt\n");
-		goto err;
+		return IRQ_NONE;
 	}
 
 	/* Ack interrupts */
@@ -680,7 +679,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 	/* Check to see if unmasked bits are active */
 	if (!status1 && !status8 && !status20)
-		goto err;
+		return IRQ_NONE;
 
 	if (status1 & CS35L56_AMP_SHORT_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Amp short error\n");
@@ -688,14 +687,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Overtemp error\n");
 
-	ret = IRQ_HANDLED;
-
-err:
-	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
-
-	return ret;
+	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
 
-- 
2.43.0

