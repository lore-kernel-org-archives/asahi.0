Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868283D2FFC
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454536; cv=none; b=DnIZVERW31drztGEezUdhkZdgSAQTULs0sIf5iWbh7iwq+rYmz/gBMAr6y1aAjF/AHW6qhHL7i14psYZjpn+4GTeHZ9lAlMKTq5Mr4ZyVHKVzRfPdd7qnpyJuNh02V1a+i+Ii6S3HC2AA7wh79dYBS5zOibZZ/VK/+FgxJMrXYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454536; c=relaxed/simple;
	bh=WYggS4ZnMt6fzQmOJcSRrkDc66AvTs7KIbRAtBpTltY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7mZrUQSBYdQrhwlbxZoVyfJV0l8OTlhprD3ytPraYlwNQOSiVRSHFq/yBgztoY/nk28RGW8qVdClkfsiAa/Ex/MO5D7qLd0CenRXhzZpHBFjs6UmfhF+mCedBe9cyFlzafOXD2vwzfBCB6S625b6YwHUxEGmgbRVl1O6e0TB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceilmuzY; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceilmuzY"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37c6cd1ac98so477843a91.0
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454534; x=1783059334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTbk3qG2turaWbnOrhzIgpcLjXYgFFUDaRvJ6ZSqU3g=;
        b=ceilmuzY9WCKxwzGT2XXeTgIL2qDPcoqC0Y6OZKplQR/OZbPBTXsojuuC0gVQQfjzy
         0JCwH225WX3fb4uSb1rXjIaKwPRtj5JU4Yox/NNfhXFH6847HpFREzry9Va75TliPFFS
         lMn8CN4h2IqelST85mfpBB8mQSPqoxTnLKz4ujQujBstidB2ejkfh6xJc/RAuXQvVQRJ
         tbzDh5AbrBBwolHfGuh/O/sjftmVjQjZX3orNagvFnLLSy9x1uTz3ClpRKLDx7jMjV5D
         qzxLHECAps0TmFF53sgiNDO1WxJaEYrGdM4jjFon9pXWIyMq9Fwi8JIBgHDvQfbGIPAq
         qiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454534; x=1783059334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YTbk3qG2turaWbnOrhzIgpcLjXYgFFUDaRvJ6ZSqU3g=;
        b=Rj2w7A1Dg47qn0DgoLMFcYPnWVY+P9C7F79PrmHJ/mEhCv9Gph48wKxyQIcz3nn3fY
         vtZOL8b2vCDQQconGmkMhQuJL8y3yGWTh4ZZ7h1DJ2K1ceHJk6w4PvPpGj0Qk6xVjpV8
         LTqEvMP43ZpEa71G0bxv+rEyfkZGF7PK2ok0okOsSo961v0+MU866C+9PlCUZVeN6+ai
         DlBFVyNoGt9nCd7sjJ3WxF9WWAKFj5504tYIIMMCLStOAJ0aCYZL+3W8P9eH/3WITbL6
         gBnytJmnUBd4uDKJPbkqTvI1Mgs1v/PGBPWpJlf1uAkTqGsQ0N5POQIUliA8ics7V81y
         KfLA==
X-Forwarded-Encrypted: i=1; AHgh+Rrvcn0EXO5UAdmKFNOjra407DCQ6iGdtQGTomZbgpxH7SBxrUH8nU/OLnw2/8A61Vjr6n6EUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxTFMdvWMmFlKrsV88IW/q+yYVKpZgENcbMUSnMOOZTAJiQYVC
	YrcVbYm4oSUpMhNmlIeCEd92Y7JJBZd3XLc9XZTb/EpIQ0iy1YMrX6Vx
X-Gm-Gg: AfdE7clp3uvPCDO1/qx+6bYjF5U6yzNf2rOx1BwaLCGYIumM2YGZT30x72LcSn51Qsg
	OspS+nVcelXpNDe28h2YcLFMh344NsG0j7u4NuaS9QYV6L2bipoTm5Jznql9AGLwDiCODk1sUrz
	Tbsb+1P7KKHlRcp4mtEV6ZHdc3wkcrq0XQgNO2drz/X8X2XDmE3zlbkS0g8ZsCdnOA15jvY06Ut
	9gsE+kVF6kdVIajBN0xbHU5QRB2rOL16FMQUq71pXubKpBdkdWbo2DkMvrzoENGv3P9SIjTjPBJ
	iCw6TTU7jUW7fTp2QCn61ro+8p8mhguN2StmUvnPcVxokWKHkOlKsyXtp7MsnqqffkGXsEiWPed
	MhkZ+EEdIyaAPjwVc+rLcFIQaDG+IlpEI4r8YL7RD5Sx4KDe2N2utnRJSOpiF2GRnOd2El8kG4H
	O8EGGujch/Y41YA9+83q3uuby9is5HRH9sXxZwsGauit9sbJs=
X-Received: by 2002:a17:90b:384e:b0:36e:2106:ded8 with SMTP id 98e67ed59e1d1-37dfa28bb98mr5727342a91.25.1782454533622;
        Thu, 25 Jun 2026 23:15:33 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:15:33 -0700 (PDT)
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
Subject: [PATCH 13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
Date: Fri, 26 Jun 2026 13:13:18 +0700
Message-ID: <20260626061329.23264-14-phucduc.bui@gmail.com>
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

