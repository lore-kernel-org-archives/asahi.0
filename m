Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BECB3EF0C3
	for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949045; cv=none; b=pIIe+FFD3ahYh/7ztgBuRmldJ/SBjMqKWjvPGnB7c2a1PxQ2J2LngiriqPTNR4ewGF+QCX45SX1exCaYE3XPigMjuKG2L1XcFc9oS9LA6OKbmrqyaXta3GijkMRttvkPNECbTldu5Icxbld+lrem44c3qhXMibpTNxSiXhhmuC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949045; c=relaxed/simple;
	bh=bTDWzZVmDIEzzIR2e9kQP08/l7bognv4SdRbWpJltEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f6Ern6pSXGgEv1ejemx7ppOoIXp1Mhr+qLaNnVHcxZqwKNUtWYzF4GAmNKMrFk7HhF3f9Lh4NBbjC6TmVAbNvqyi9BrJCaKp8KDQL4D9y6LJzKosR11IGqljCByXRzJr3tg37ZcymnH6uaii30QjjT7CfWf0Qp3lIRr1/3/JYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET0adwm4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET0adwm4"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b24fdac394so63979115ad.3
        for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 05:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949040; x=1777553840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDI1B8x0qzvt78g6hp6pJdTAzcHsH/waiJ0wXVZHtXE=;
        b=ET0adwm4Vsxv1NIVxAeiHf/MmOifyumGzn5qKmz/9938jtFggZP0x/O42fOYf3ZYj/
         vX6REpbCv7KwgipMwg9RDZvrab6cNJGKrm4AAXB/lVGPzo5xcV161DOq2mxLaE5LXJ0w
         5fqOPQymynYSmpVtDKE4j+l/2RBwsYq6Ewt1NPGxgZR2enSQyd3oZHFMgNPuuv0jqDMh
         AgVqp1bGk7ZuQWh+1JQ4jZLTsaMdZ5KaO5nc+eSjlhSVxlXNnl4gquwFFg2aiAmAOpbM
         0oSULpMHzq1MJoHKwmnXXNZOroxCTcCPK3zQGpBa9vpkjagH0SIBXMs2SjSQBtsjUVQ4
         23Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949040; x=1777553840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDI1B8x0qzvt78g6hp6pJdTAzcHsH/waiJ0wXVZHtXE=;
        b=H6Tw8fjVspJhLOCkWKXG8udNzQ8AXPf971L7dgtbnFFbVKu1HPVzkmrsL5w2KCu6jM
         S6MY0aAiBJSA1REkfwKlPZoVgmp9ItTgBnA9kkaPUGCEpI5Tjwx0AqQf435VKI3QniAL
         OkdgHj2uDIj1onVIZqFk9IOvyp7Ai71BzsnZriXe/6/kgbRLQS1XsqxX0vpBOuLOr2c2
         Y58lurpdXDLn9HmPbGCM61jPps/j8KXMmwas05VOlKaMWMr+iAzOrM/D152cvKxYhVK+
         53rzzmLgXki27nDwF0HbBUeJ1aeICBLhadCsEytO7yCTHV1wTwFE/uql0xGPErCGDipC
         SomQ==
X-Forwarded-Encrypted: i=1; AFNElJ8f6sThDNV1GflpYbOwzj2MnqArUq11Fqa8Eubo/X8V3jCgDiiQLo/6DocOCelOiojT5+RBJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxrIG/FJ6ZCQXQgPmAuovSyRUaDqJdgqpGHUPoeeiYSbGZG3Vz8
	cCTYcUxTFj0XNY72gUzyD7AsHHKS7lFAx1z5bUQsIm70EeEptUF6BayF
X-Gm-Gg: AeBDies8IbzKxxCoEr+8XOf9dQYdDa+ROglctjmmswI/ksGaI7uvLvcDo3bGVKxNS7u
	15Ym/FjnZgvrd/4jaOdWLbCdejBfGL3kytqchkow9SPp40q/f43sTdx7kT/WDH93TucecsTKf2T
	ENue72FOhuDQKNAz7gTkqpkz6s5wHhdllSoe84MpPfGOZJT9bdNQGdQ6RqGD90kBpg15Q6JsmVj
	iMXLi1vnJpeNodHBoyrdTa7/bXar5ifrVCxRS4sJWr3qW0p9vHxc+w0V7WSVA0/nxPPBi/3yJmL
	ujif6q1XcmryfvrT4fZMspyCQ5MIccRQ9hCqtVaZ9G1dsLsmBQRpyd3Ea5o7t/GL5lV9obPh4s6
	Yy82xBO5tj4PZHJXq3ZGeO/i8lD/gE8Q5S3F1ZaLzo+HlOkMBla5iOwQTMC7KLIthHr1V7iOKEy
	iXkZKEwQqEfdsE1tjoAKdQUtyO3lElFqMDKNhDuJoah0ZK7KK2TxX5xe6MHyhqaExEo+WJ
X-Received: by 2002:a17:903:2ac6:b0:2b2:549f:7d2b with SMTP id d9443c01a7336-2b5f9ee2f21mr281621055ad.11.1776949040431;
        Thu, 23 Apr 2026 05:57:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm192106545ad.9.2026.04.23.05.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:57:20 -0700 (PDT)
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
Subject: [PATCH 5/5] ASoC: samsung: spdif: Use guard() for spin locks
Date: Thu, 23 Apr 2026 19:56:46 +0700
Message-ID: <20260423125646.156599-6-phucduc.bui@gmail.com>
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
 sound/soc/samsung/spdif.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index fb30f6b637a0..7fc46d55c522 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -143,7 +143,6 @@ static int spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct samsung_spdif_info *spdif = to_info(snd_soc_rtd_to_cpu(rtd, 0));
-	unsigned long flags;
 
 	dev_dbg(spdif->dev, "Entered %s\n", __func__);
 
@@ -151,16 +150,14 @@ static int spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&spdif->lock, flags);
-		spdif_snd_txctrl(spdif, 1);
-		spin_unlock_irqrestore(&spdif->lock, flags);
+		scoped_guard(spinlock_irqsave, &spdif->lock)
+			spdif_snd_txctrl(spdif, 1);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&spdif->lock, flags);
-		spdif_snd_txctrl(spdif, 0);
-		spin_unlock_irqrestore(&spdif->lock, flags);
+		scoped_guard(spinlock_irqsave, &spdif->lock)
+			spdif_snd_txctrl(spdif, 0);
 		break;
 	default:
 		return -EINVAL;
@@ -182,7 +179,6 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 	void __iomem *regs = spdif->regs;
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	u32 con, clkcon, cstas;
-	unsigned long flags;
 	int i, ratio;
 
 	dev_dbg(spdif->dev, "Entered %s\n", __func__);
@@ -196,7 +192,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 
 	snd_soc_dai_set_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream, dma_data);
 
-	spin_lock_irqsave(&spdif->lock, flags);
+	guard(spinlock_irqsave)(&spdif->lock);
 
 	con = readl(regs + CON) & CON_MASK;
 	cstas = readl(regs + CSTAS) & CSTAS_MASK;
@@ -214,7 +210,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 		break;
 	default:
 		dev_err(spdif->dev, "Unsupported data size.\n");
-		goto err;
+		return -EINVAL;
 	}
 
 	ratio = spdif->clk_rate / params_rate(params);
@@ -224,7 +220,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 	if (i == ARRAY_SIZE(spdif_sysclk_ratios)) {
 		dev_err(spdif->dev, "Invalid clock ratio %ld/%d\n",
 				spdif->clk_rate, params_rate(params));
-		goto err;
+		return -EINVAL;
 	}
 
 	con &= ~CON_MCLKDIV_MASK;
@@ -257,7 +253,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 	default:
 		dev_err(spdif->dev, "Invalid sampling rate %d\n",
 				params_rate(params));
-		goto err;
+		return -EINVAL;
 	}
 
 	cstas &= ~CSTAS_CATEGORY_MASK;
@@ -268,12 +264,7 @@ static int spdif_hw_params(struct snd_pcm_substream *substream,
 	writel(cstas, regs + CSTAS);
 	writel(clkcon, regs + CLKCON);
 
-	spin_unlock_irqrestore(&spdif->lock, flags);
-
 	return 0;
-err:
-	spin_unlock_irqrestore(&spdif->lock, flags);
-	return -EINVAL;
 }
 
 static void spdif_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

