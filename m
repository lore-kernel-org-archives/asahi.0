Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA78A3EF0AF
	for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949039; cv=none; b=dCkfbLjhagbLb9bmAKe53YdaQsr6YMjBAERfhD1w20I0Z1Jt3Y6hy2YL+NpRB1FrYeURUGivC7yLuB8FyMxpUOPKOUP7NFYqG4qxr9fbHIsV2dm4xMy3leBjlFyqrBhcD42R01gUV6D9UaTGvMKmsF4NE0Mq5tcii1omHjdeLD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949039; c=relaxed/simple;
	bh=CP1ghv01QCcyLHSfiPOnX65aYM4APtuzG8pM9zCfUgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nhNcIwlUjTxFVl6Hbd/8sNT/ujQhK2eZM/oQLb+UYXi2fZZgu/jhiZYCq6Q80uzHHGzuoE3lv/sdwcz6o9IomgLv6LpqlJCekIjy8YWznXmv9qeLwi2FqGcxJmQI5sY/ZnUw8RpR7q3dEWEdF64x1pM696/FtshC1Xtl+NH6ZFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOg9WSRO; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOg9WSRO"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so3814516a91.0
        for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949037; x=1777553837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujluhbOld/XQ/a08kQS62pX+2z7OtnQnN7cupiUIIOA=;
        b=NOg9WSROYyJJOnIHp+D3/23BJnyKWh+1eMrdCtiB86xDXv+BbYU6o7mT98mejFTPSB
         pybLZ0m70mkMGzQk1xN+yS3V0VcYMb5x2wWJ8oPNB6HVpX8h1+CiyE1/aHp3InrxNTyM
         0iI4rQpTwrSBzv9GEifdSdNkgVThwYK4wk1p2kHoeZc7qCOQFgsAjJOLu3asjzp88WiH
         u8fzLJKqHuzngSY9upEciwyYqDM+9Y31FIMKxgmF0INsbfrgKC5yT5o3zO3TUIi1ZY1q
         3BKoyI4sq2BBo0xEK2fOW5lA/PbW11tbOjEIx2h2JBW2/5QNmv2L1uHXd00WIw4Nkusl
         ZHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949037; x=1777553837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ujluhbOld/XQ/a08kQS62pX+2z7OtnQnN7cupiUIIOA=;
        b=CmPQxDpdY1LeOnc9UQ0A2gbUY5mvXNmmNS942fIrmlhApYMdYufcotMjhCYProw7Kq
         WVzZ3xhGl9t57z+JAl2oUENh0fXMihvJrLxFAzDD91bmfF3QRITkkwwXg1zw0T+C60X3
         ADqlFuQ4NMErw3RkbkRNVPkuDYBvJMufSmtkuHhGdvvS/tWcR3AA4NOe2/Y1EreBfL4b
         cfsDnfGLyYlNolyLoBc9jaRNGh3d9rJmPciQNYvtYAL+wu6zDSaRawF0Q6+DJPYdImve
         /MAnfkTIWReWOAFlhg6IcE1Q0gWoNrbyo4n2IbLeou+QXRYVRGmxm+m68PG5lB0Bkh+y
         2UUQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zCdaqbz/fBQXAxEg3XCyWgF1gLo2PXhwlny18dDt/nx0PXJm5i1hdqg5wLCYEeAV+89c96g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwltF6FX+4ffYp9YCGymFIa5NFOrqXoWa1Ix8zvKR3wC+UwhzIH
	rCFdG3v05ha+hcZNdoVLaRQxCklr0ZZyRzdM/XNiCuMLIs2/f7pHo8cwNdVMXQ==
X-Gm-Gg: AeBDietlErvyPkCvV1cdn4z/CRa3bv+D4AlEZ36P/7tmQEzL6FVNlls7h15oPiLMKBZ
	pAGOhbN1WjnR4cosl8mn5OrGppbHjo14L3GHkzJ3e9J+u4mFrdh3K5G1dJ/xk7HzRtXpNzPv8Z4
	oqBKXpC8ovnabefHPYG8p0Ho4lDmUtd8FrmsjpoueAkIC+Zv9/L5udmztjO5C+irz+WSJgAajnh
	oH8cZOr9Rfe3E1XsURbUZaVUzxOmZH80dZK6CqbtG9jKwlAMUulyTRCM7lNJpJ/9szJAyCWOyJQ
	fIIcQcVkb1qMHWX1O/bXa+btkvGyjlJHePdfLWEMW6j5OMNigwoQEP879gMdi064YS2ORVki9uI
	f3yGw1nj1rOWo5XkuhDRuHSbvkRkoYnaGMfaxa4aBcx8wYcwH+OgnQ6f4G+RsSV+yJ9XpSN08Wn
	i0M2eZpKaZRJXDeC3aCW9hc3LP8q6kwDHof+w8Ldpq4LC7jEPObb88kFyESwKYWwI2QGX0RXe7k
	9s7p9s=
X-Received: by 2002:a17:902:b195:b0:2b2:4bbc:14b0 with SMTP id d9443c01a7336-2b5f9eb272fmr163793265ad.20.1776949037203;
        Thu, 23 Apr 2026 05:57:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm192106545ad.9.2026.04.23.05.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:57:16 -0700 (PDT)
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
Subject: [PATCH 4/5] ASoC: samsung: pcm: Use guard() for spin locks
Date: Thu, 23 Apr 2026 19:56:45 +0700
Message-ID: <20260423125646.156599-5-phucduc.bui@gmail.com>
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
 sound/soc/samsung/pcm.c | 99 +++++++++++++++++------------------------
 1 file changed, 40 insertions(+), 59 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index a03ba9374c2e..309f024bf2a4 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -218,7 +218,6 @@ static int s3c_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
-	unsigned long flags;
 
 	dev_dbg(pcm->dev, "Entered %s\n", __func__);
 
@@ -226,27 +225,23 @@ static int s3c_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		spin_lock_irqsave(&pcm->lock, flags);
-
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-			s3c_pcm_snd_rxctrl(pcm, 1);
-		else
-			s3c_pcm_snd_txctrl(pcm, 1);
-
-		spin_unlock_irqrestore(&pcm->lock, flags);
+		scoped_guard(spinlock_irqsave, &pcm->lock) {
+			if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+				s3c_pcm_snd_rxctrl(pcm, 1);
+			else
+				s3c_pcm_snd_txctrl(pcm, 1);
+		}
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		spin_lock_irqsave(&pcm->lock, flags);
-
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-			s3c_pcm_snd_rxctrl(pcm, 0);
-		else
-			s3c_pcm_snd_txctrl(pcm, 0);
-
-		spin_unlock_irqrestore(&pcm->lock, flags);
+		scoped_guard(spinlock_irqsave, &pcm->lock) {
+			if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+				s3c_pcm_snd_rxctrl(pcm, 0);
+			else
+				s3c_pcm_snd_txctrl(pcm, 0);
+		}
 		break;
 
 	default:
@@ -265,7 +260,6 @@ static int s3c_pcm_hw_params(struct snd_pcm_substream *substream,
 	void __iomem *regs = pcm->regs;
 	struct clk *clk;
 	int sclk_div, sync_div;
-	unsigned long flags;
 	u32 clkctl;
 
 	dev_dbg(pcm->dev, "Entered %s\n", __func__);
@@ -278,36 +272,33 @@ static int s3c_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	spin_lock_irqsave(&pcm->lock, flags);
-
-	/* Get hold of the PCMSOURCE_CLK */
-	clkctl = readl(regs + S3C_PCM_CLKCTL);
-	if (clkctl & S3C_PCM_CLKCTL_SERCLKSEL_PCLK)
-		clk = pcm->pclk;
-	else
-		clk = pcm->cclk;
-
-	/* Set the SCLK divider */
-	sclk_div = clk_get_rate(clk) / pcm->sclk_per_fs /
-					params_rate(params) / 2 - 1;
-
-	clkctl &= ~(S3C_PCM_CLKCTL_SCLKDIV_MASK
-			<< S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
-	clkctl |= ((sclk_div & S3C_PCM_CLKCTL_SCLKDIV_MASK)
-			<< S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
+	scoped_guard(spinlock_irqsave, &pcm->lock) {
+		/* Get hold of the PCMSOURCE_CLK */
+		clkctl = readl(regs + S3C_PCM_CLKCTL);
+		if (clkctl & S3C_PCM_CLKCTL_SERCLKSEL_PCLK)
+			clk = pcm->pclk;
+		else
+			clk = pcm->cclk;
 
-	/* Set the SYNC divider */
-	sync_div = pcm->sclk_per_fs - 1;
+		/* Set the SCLK divider */
+		sclk_div = clk_get_rate(clk) / pcm->sclk_per_fs /
+						params_rate(params) / 2 - 1;
 
-	clkctl &= ~(S3C_PCM_CLKCTL_SYNCDIV_MASK
-				<< S3C_PCM_CLKCTL_SYNCDIV_SHIFT);
-	clkctl |= ((sync_div & S3C_PCM_CLKCTL_SYNCDIV_MASK)
-				<< S3C_PCM_CLKCTL_SYNCDIV_SHIFT);
+		clkctl &= ~(S3C_PCM_CLKCTL_SCLKDIV_MASK
+				<< S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
+		clkctl |= ((sclk_div & S3C_PCM_CLKCTL_SCLKDIV_MASK)
+				<< S3C_PCM_CLKCTL_SCLKDIV_SHIFT);
 
-	writel(clkctl, regs + S3C_PCM_CLKCTL);
+		/* Set the SYNC divider */
+		sync_div = pcm->sclk_per_fs - 1;
 
-	spin_unlock_irqrestore(&pcm->lock, flags);
+		clkctl &= ~(S3C_PCM_CLKCTL_SYNCDIV_MASK
+					<< S3C_PCM_CLKCTL_SYNCDIV_SHIFT);
+		clkctl |= ((sync_div & S3C_PCM_CLKCTL_SYNCDIV_MASK)
+					<< S3C_PCM_CLKCTL_SYNCDIV_SHIFT);
 
+		writel(clkctl, regs + S3C_PCM_CLKCTL);
+	}
 	dev_dbg(pcm->dev, "PCMSOURCE_CLK-%lu SCLK=%ufs SCLK_DIV=%d SYNC_DIV=%d\n",
 				clk_get_rate(clk), pcm->sclk_per_fs,
 				sclk_div, sync_div);
@@ -320,13 +311,11 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 {
 	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(cpu_dai);
 	void __iomem *regs = pcm->regs;
-	unsigned long flags;
-	int ret = 0;
 	u32 ctl;
 
 	dev_dbg(pcm->dev, "Entered %s\n", __func__);
 
-	spin_lock_irqsave(&pcm->lock, flags);
+	guard(spinlock_irqsave)(&pcm->lock);
 
 	ctl = readl(regs + S3C_PCM_CTL);
 
@@ -336,8 +325,7 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 		break;
 	default:
 		dev_err(pcm->dev, "Unsupported clock inversion!\n");
-		ret = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
@@ -346,8 +334,7 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 		break;
 	default:
 		dev_err(pcm->dev, "Unsupported master/slave format!\n");
-		ret = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
@@ -359,8 +346,7 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 		break;
 	default:
 		dev_err(pcm->dev, "Invalid Clock gating request!\n");
-		ret = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -374,16 +360,11 @@ static int s3c_pcm_set_fmt(struct snd_soc_dai *cpu_dai,
 		break;
 	default:
 		dev_err(pcm->dev, "Unsupported data format!\n");
-		ret = -EINVAL;
-		goto exit;
+		return -EINVAL;
 	}
 
 	writel(ctl, regs + S3C_PCM_CTL);
-
-exit:
-	spin_unlock_irqrestore(&pcm->lock, flags);
-
-	return ret;
+	return 0;
 }
 
 static int s3c_pcm_set_clkdiv(struct snd_soc_dai *cpu_dai,
-- 
2.43.0

