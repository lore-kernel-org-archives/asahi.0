Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AAB356757
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058189; cv=none; b=uXI6LptF72MbZ1AJIuR0HmeXfdM+0jmAs6boGCxZ/lokT+VsO113bVsEg0gV0BYbatz2yeEa/B03ofVQrdBBL34LsIJqo1H7/aSgrqaYlnxFUB2dhgLCd0++yg7zfYavpUD51hGpWCh4C//JhkOp3gWrJ/eznYMDNmVuEy6nw2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058189; c=relaxed/simple;
	bh=WYggS4ZnMt6fzQmOJcSRrkDc66AvTs7KIbRAtBpTltY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJAZBbu5VEDIaAc09WcO22AjmmPUkRnkS8QGkEXVGRtF4eQaU83oWWbjZkSduEwvCE63uGvZZQ4Sjksc3ZZZg8dYqjzGaoUilXH7EnNoKA2JKCxVDsNrIfdi+ILO5Rmm6UB80lpIS2AKLNoYhMXi3YmELJrSwL0mj9XnKRaO4Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOoKwO3v; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOoKwO3v"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84780c95e2eso121974b3a.3
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058187; x=1783662987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTbk3qG2turaWbnOrhzIgpcLjXYgFFUDaRvJ6ZSqU3g=;
        b=pOoKwO3vkhuxWvaaR1vKEpwBpahZG5whpLfa3w9deJ1iA9HmJXmWRYnkMy0BHigBJO
         Bss4AsRSEeb9DFq6IUOVOgqDt3tYHx+xOZ3uWT7wi0OJXNzulTSIE6pNprQqxnMM62wJ
         Mqc6OtTQdUKt3krMpyP30i2yLNugEBzc0TSMN6AejA8J/4ZqFFvrrvyHxzSkBk+Z1buQ
         tP6MNEJis1gDxxvpJPfh1lJ965MAiMIEvqVhBNLclxxPkBZX2vnKZ9IRrJMqau/NgfOg
         qQONRUdLBYxCkFqCm4FQiyVpBOtv/Fl+HsIVH4bey49VKL9tinUpG3oSw7vqYjWMPBoF
         wYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058187; x=1783662987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTbk3qG2turaWbnOrhzIgpcLjXYgFFUDaRvJ6ZSqU3g=;
        b=qHtiu+gjO6K2YoEIxiv6pZy4KcWLJN/0SzdD9BFLea97Wq0NEqj2kT/TfpJumF+zQ2
         osAGQyfdH4K3KPdVjnAmsYeEZjCyw5IvQyEO5ADuIL4RQ95HKQoyO2atXq8drAV83us9
         wPyi13tUQ2YmPo1uf8yry4iYLA57axGW5993++YMRnxEdz4NqKagxBeGf/f4sQ/K7UZK
         +VPdu7q/6zTRUKzZSjrAHk6bWShc8IqfRvk+OJMduzpZbAVE3k/zVp61ek6/W8tVQAnB
         2KbPJoYmtK0RH/q68D4Y3JBrRUD9R2F0pdWGlrnpFkw+WdC5lSSSq2whcsal1O+BHQQT
         W3Xg==
X-Forwarded-Encrypted: i=1; AHgh+RqIusyQoqUPkm9eouLhoLEfsOAQErjvYCuxNCiONlNuHyNZx8NgCp1pGep5Y/0AlD95V9VVCA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+h6G88GKbt50ON2NTi5FBswdnsTyqsweyvJSb5/xnDmk1PQdL
	eh7Zrc05P9fnn4FxypEFSSRExQVL2NXb4GqAmo3bXl8aug+NDgH3uEB8
X-Gm-Gg: AfdE7cl3GFtwB9fPdaNaNVv/c7GlZiLrTT33DSC/77nZUxdCtYMJn+TIea90KAtaoei
	q2dckF6KEhZYG+iW35mTSkFGCs+R0MtQ5ZK/ijfp9VXwpq+qWTecjKr+4brOVAkjPlF8/ZBnrjO
	+fIX0tU7qMbcwlSxJgT83pm5I0yUumbnN0rpuEVyD0qOEyq4TCjgOmWfa+XS+dM4Z708SMoEIae
	Q93XMnDoFYL46NhlyFh/nLmQUUhDRM2WdTfVOkjYwjW0W/r9bRqZboVGPf3iCm/zKlfdyr8TuJD
	YlDJcUoUV/aRmJWPzO01uDmFsXzMNAHbpVytqUUUu8JudmVYUQeVbkWnc8Paja9jdJDkYFEU6nz
	586mVs3uSDddv6LBhTMshVIMx3MXKYIz4LxGBVjxh2zl/me7lZRTuGBCy09oG63yWhv+fej+h7V
	OYSHE4/3Xyt1UbRY7fpFHgiaqffYq5KjAa2f92I3Hw9ugU31I=
X-Received: by 2002:a05:6a00:414f:b0:835:41f3:f440 with SMTP id d2e1a72fcca58-847c50428a1mr8169003b3a.14.1783058185595;
        Thu, 02 Jul 2026 22:56:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:56:25 -0700 (PDT)
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
Subject: [PATCH v2 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
Date: Fri,  3 Jul 2026 12:53:44 +0700
Message-ID: <20260703055355.244898-14-phucduc.bui@gmail.com>
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

Convert the interrupt handler to use guard(mutex) for automatic mutex
unlocking and PM_RUNTIME_ACQUIRE_IF_ENABLED() to manage the runtime PM
reference through scope-based cleanup.
This removes the explicit cleanup paths while preserving the existing
behavior.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs35l56-shared.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f14e2eaaa4ee..73fe1cba3f5b 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -645,18 +645,19 @@ irqreturn_t cs35l56_irq(int irq, void *data)
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
+		return ret;
 	}
 
 	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
 	if ((val & CS35L56_IRQ1_STS_MASK) == 0) {
 		dev_dbg(cs35l56_base->dev, "Spurious IRQ: no pending interrupt\n");
-		goto err;
+		return ret;
 	}
 
 	/* Ack interrupts */
@@ -680,7 +681,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 	/* Check to see if unmasked bits are active */
 	if (!status1 && !status8 && !status20)
-		goto err;
+		return ret;
 
 	if (status1 & CS35L56_AMP_SHORT_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Amp short error\n");
@@ -688,14 +689,8 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (status8 & CS35L56_TEMP_ERR_EINT1_MASK)
 		dev_crit(cs35l56_base->dev, "Overtemp error\n");
 
-	ret = IRQ_HANDLED;
+	return IRQ_HANDLED;
 
-err:
-	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
 
-- 
2.43.0

