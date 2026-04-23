Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEF23EE1F4
	for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 12:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949032; cv=none; b=IHpe9lx/a8a2x2cb0Pk9HrI/f3Q+IJKMGbtrYPh4JZtw8lcIJ4xxB9qbfYzYegT9fpyBE6stZg5ofiJcPMCU254IiaY2wWR5Pbb5J5T6qmb0YA4X6YuuENUNXIW8/Jpe2+9lH0j74+nE2JjFfxMsUgZofzkDlbSBL1PVbshMfYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949032; c=relaxed/simple;
	bh=IKHZ3q96hTXuMIiH9BNrB3LA3G5rq5jK3yc32SGuub4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lA/+yS6wyciYX5pqIdI+Zb1BcjNti0RdWBcC/agKe3maalZsRW/rtDMAz7DI3wxM276uXnpDdfdYSiIr7W8DP2n+mqQro7sHQG5vBBfdGciMQc4KUKt9mpIkOdR3lZtX0Xoz7dNdpdacbGDY7EFh48mEFEU1m0IaQJ6r8ZtGNCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J53s4oEF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J53s4oEF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2adff872068so32731115ad.1
        for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 05:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949031; x=1777553831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/+1WbMY5u1hix2GJGcVANS/NpesLEU0QcdbmptLbD0=;
        b=J53s4oEFCQuunhO0MTqgX1wE4mKkQXAOKbULjETf+nxLLlERyC+hmRfu2KtCj3UAaj
         kB6pHytNPcvHcXSBe35u3ltpx+tkqV/oZpmbjr9N5mGVbxhY76gyJcEQdxH3W1fan9zo
         YF6kR6Xocx7USNpKrlHO4SuOT45pGq4rTFwbtG6jD+qnI34zZRw5qGrc0SJm6+WeXKOc
         bUjVaGXqo0Dpuia2CHjDUsUywzRtxSwAl/iZ4prN/MLqptJbcKRHLM5zMwYeeCVJEOO2
         zx6/CvBBmGkA6+oOagv0TkwibDOxDzmS3UcKdzIYC3XKCHQxlUkGQ1srPyM0pu1a83HJ
         vfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949031; x=1777553831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M/+1WbMY5u1hix2GJGcVANS/NpesLEU0QcdbmptLbD0=;
        b=qTyye+L6hL/IeKw1G2KigUFVXcx/vTy04PBdpcu1TXh9EKr8LU0jWLST4n/3Jfk+8N
         YQ24wskR32XxFKhJEK37EPHrOzxU++LESHZPownShns0hyyJX0iZwhON8seajohMBAaP
         +oFAFFH9GmgBOvGSHoz6EERve0IB6lLtntnb6UrSah+gAqU4jb+tCHQw2J7rYeupp0Jx
         VJdpKkmzKcNZ6R0MGj0py4w/Cytmy8ME0LllPnmgLKNgder2ebKRcyLfByOfxL1y718N
         WJky1Ks+Xh611SjL2Jl1wZHtu86VuqBTWHoDINRtsMY0D+fDv32e7c2KYieIAYGgu6FU
         Ahdw==
X-Forwarded-Encrypted: i=1; AFNElJ8IWvh40hXJQHK4i8LEYOxI3EZ1zadu8wIdbvxFBeY9rMIytQ6/ciUhewJ580/Egt2DKIENAA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu4OVARvh1NNNwGtPygkXfBnxLGjB6+nrGSqcb3fdKAlmnAvhy
	vDrxb/7VULaRJIyEP3H4lmPulI/O8qqgqcXgjTYYwsoZLCM9fHB7pVdv
X-Gm-Gg: AeBDieuf1yrAAUN0AkWlsWdfq759EbCIYfH9ivOFhfChIxUyHNWvkB6u5xdCllxLHDC
	+I2tckq4qYoG8lak7hwpoIIkvHVte2jeHQUCcHVUg8nmI20Xn3N9/ZRcmIrZs0aBgkAaCCChOuZ
	RVKYhScTlHkHIy0SXmfuNfpoT3YcxdZTSri9DxvEWp5Jz1SxtV2S2+5MFtr/W69yMv2VbCfBPOY
	Fspve1dyymP2to0tSrGaa3Yi6mKGp8weUtzJIkIkjXmusr2lkOLEF46Z9KQX6l/LhNdRLmGVszg
	DE1EJQVYhqUv9YmeJoiSabB6Z3Ra8/RzfY3tMQQYqQa9uqHDj2nbrlEaQzlY50Q4Xmx2cEUHl9g
	GLgHI8IC/y3hefcvH8poNBExu2ps8h+HTCazo1lUMAfZOPfq8QTsqURKAofZNGK5d7mGC9pMTUT
	fdP2BLDT6zwnbNur/TDj7O7dYJp9HWFbalAt1mfRqYYrzZ72EgzDtWaye3LLknn7WFGkhn
X-Received: by 2002:a17:903:98b:b0:2b0:7026:24bf with SMTP id d9443c01a7336-2b5f9eff280mr280220285ad.14.1776949030721;
        Thu, 23 Apr 2026 05:57:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm192106545ad.9.2026.04.23.05.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:57:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/5] ASoC: samsung: idma: Use guard() for spin locks
Date: Thu, 23 Apr 2026 19:56:43 +0700
Message-ID: <20260423125646.156599-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423125646.156599-1-phucduc.bui@gmail.com>
References: <20260423125646.156599-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/samsung/idma.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/sound/soc/samsung/idma.c b/sound/soc/samsung/idma.c
index cb455ddce253..d362136e1069 100644
--- a/sound/soc/samsung/idma.c
+++ b/sound/soc/samsung/idma.c
@@ -67,9 +67,8 @@ static int idma_enqueue(struct snd_pcm_substream *substream)
 	struct idma_ctrl *prtd = substream->runtime->private_data;
 	u32 val;
 
-	spin_lock(&prtd->lock);
-	prtd->token = (void *) substream;
-	spin_unlock(&prtd->lock);
+	scoped_guard(spinlock, &prtd->lock)
+		prtd->token = (void *) substream;
 
 	/* Internal DMA Level0 Interrupt Address */
 	val = idma.lp_tx_addr + prtd->periodsz;
@@ -101,16 +100,15 @@ static void idma_setcallbk(struct snd_pcm_substream *substream,
 {
 	struct idma_ctrl *prtd = substream->runtime->private_data;
 
-	spin_lock(&prtd->lock);
+	guard(spinlock)(&prtd->lock);
 	prtd->cb = cb;
-	spin_unlock(&prtd->lock);
 }
 
 static void idma_control(int op)
 {
 	u32 val = readl(idma.regs + I2SAHB);
 
-	spin_lock(&idma.lock);
+	guard(spinlock)(&idma.lock);
 
 	switch (op) {
 	case LPAM_DMA_START:
@@ -120,12 +118,10 @@ static void idma_control(int op)
 		val &= ~(AHB_INTENLVL0 | AHB_DMAEN);
 		break;
 	default:
-		spin_unlock(&idma.lock);
 		return;
 	}
 
 	writel(val, idma.regs + I2SAHB);
-	spin_unlock(&idma.lock);
 }
 
 static void idma_done(void *id, int bytes_xfer)
@@ -192,7 +188,7 @@ static int idma_trigger(struct snd_soc_component *component,
 	struct idma_ctrl *prtd = substream->runtime->private_data;
 	int ret = 0;
 
-	spin_lock(&prtd->lock);
+	guard(spinlock)(&prtd->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -214,8 +210,6 @@ static int idma_trigger(struct snd_soc_component *component,
 		break;
 	}
 
-	spin_unlock(&prtd->lock);
-
 	return ret;
 }
 
@@ -228,12 +222,10 @@ idma_pointer(struct snd_soc_component *component,
 	dma_addr_t src;
 	unsigned long res;
 
-	spin_lock(&prtd->lock);
-
-	idma_getpos(&src);
-	res = src - prtd->start;
-
-	spin_unlock(&prtd->lock);
+	scoped_guard(spinlock, &prtd->lock) {
+		idma_getpos(&src);
+		res = src - prtd->start;
+	}
 
 	return bytes_to_frames(substream->runtime, res);
 }
-- 
2.43.0

