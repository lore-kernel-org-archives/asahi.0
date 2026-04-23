Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1643EE1F1
	for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949035; cv=none; b=KxCgE+Ym4d1qtk+May42N9f6GnhFoYS1hsRSILUhaZy+3qIiYFnXHWTQl/ymWThKDYx7NEDCTHl2f3+QcWYfFnyBolMp4VVx263OQBKN+vWkNxk/2VqPIVqLf9ebD4e0K2IQhQrXGrF5iD1OLq4UhgOHRmLXvuKyaVZ4nRfqo90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949035; c=relaxed/simple;
	bh=wJ1fnWoxhvcVhNdLurZk+0yLTlJ2ErlrLLn7Bs9eHgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/0qqVJ5ayLkrh7Cvr1mAMJYSHxMCTAnsmyrtSIw7YvYjlWNA1PFPmSuOwli9LbUlizt3eGVVh8431M0q9dSWZE12bkzyxMXG8eWxFZTHSyGYlt1mphznGZ3JOzRI47d1kilLBaB7QiibWCwgePIA8IH5IQ1/sxeZ8FOdtHwo80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtQ1Pzuo; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtQ1Pzuo"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b458ca2296so42786715ad.0
        for <asahi@lists.linux.dev>; Thu, 23 Apr 2026 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949034; x=1777553834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXv666WW+MgLa9bKzh/4dSM0XA2OxTrkc0diZZReIyQ=;
        b=BtQ1Pzuow6yWisHHjCK0jxkK4VqYrm84RRD6WRO9GK1/Ec0SSWVK7JkB4XRBn0HPTm
         Ej01vIcrNtTpaY9/ZcoR3u6FCdpogsBsac3TAzbhY3mr9nU8exEQPZqrAG6bJu8zY2qB
         Tij3oVMPm2Z18rqbEdApJqkLCxxDDnQm9wPPcUUvbrmFyhFILBhosKCDr1DP9K+L+n+X
         LCedl15R8Hldw6my8fqYlIJB5cYan2BaYeR1aqcC16LUPcVQbnjKgdawzznU1vBeK5Jn
         qzxzwFzwMV6ybwIHB7lLroACDePqwZd2ZOrR2KgpG7JPGulGOl6h1WSNzcxPmIXiAOEW
         m4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949034; x=1777553834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YXv666WW+MgLa9bKzh/4dSM0XA2OxTrkc0diZZReIyQ=;
        b=lgZs39oN0RpxiJeI7jtGFXQT1R8jitd188PmxjPrQddoHELiYjDlCDOhIynKODCPxf
         dJ7eau8kiDA83mimcSCUik19JhVH4GHLAHTQgtVDyFIYfu93DUNTpRwkzUPoTZEKQZXY
         f5Z0SAIBUA1QPUK5EWcB64ylHWF0C53K2zlFyKZtvjP6nyMsLfGxSQLvKxHBJuHJIraL
         9+VmgYULTz808VW+8jU6o+ichOtsoNnQGOl7tn0BblVoVyISU9hraIIpFkjhvXI1v0cu
         mZRsw9jynFQw25sr1iALnw32VnwXo7DkjJFrYZkKFa3Tu0u2NfPKRoY8Mv8COWWIFfvu
         9z9w==
X-Forwarded-Encrypted: i=1; AFNElJ83m2PxWPnu6xgsclDg0TxkEXN3IoGAgmmCuq8W/oAcqYMF9xZY3MfgY941MOILG0GmVb9FAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbnfZLo3Gptv0mnUtuI78Ef28vA8D7amGf2RoEpN9HRLil4oAR
	5hHJQWHaGSB6SGcJLIKzWEZOXKi90hYkyzFNGer7mXSO0kEJBIq01TJ4
X-Gm-Gg: AeBDiesdu1g6CMmRXyX/E4JSt8+Sk+OKxPKzzVmrWqReyC6wjhtfpmMA8NxrMGr9dVy
	I5D3E3CcCem7oAk0JgAYI/SWu9RzBh+3qXK9p2tOHaxzKCtQbAM3rW15puaveUMObtFOrWPyfGb
	vjfEIWkffyr+aROs1l7qSmW9BqA15ekxdw63NA4/gzEqk+7Y2bo5Ty9VKmcbkMRNvafptnHq05l
	ArPcU+PjpGaZstaw3SWKU7+FFTEIYn+sQOC1QDuu2p8IwQFDnW/DI4bjczuOzjxiHRTzsIGbbtU
	/dWTz9MTECRPjzk6ODr64BkI90cGt6zb93kebxFg0uJ2G9Em/gDJPFz5vh39wqylN1edLui1Uev
	+puaT3OXQpt0maF5SH/OfIA1ZKrdeNXMuHvWQC7XIpr8Mz5DGnH9RtSDxd0nvpsoGJybQjaHdTU
	VS2NQMwLFAtHQ4cr0+bTnbt/13A9uBV9EIUnBkQRXt4bTMT9rREyaITK2crTqtrw0tWycO
X-Received: by 2002:a17:902:7087:b0:2b4:6367:7b86 with SMTP id d9443c01a7336-2b5f9fc435dmr191850815ad.37.1776949033981;
        Thu, 23 Apr 2026 05:57:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm192106545ad.9.2026.04.23.05.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:57:13 -0700 (PDT)
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
Subject: [PATCH 3/5] ASoC: samsung: odroid: Use guard() for spin locks
Date: Thu, 23 Apr 2026 19:56:44 +0700
Message-ID: <20260423125646.156599-4-phucduc.bui@gmail.com>
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
 sound/soc/samsung/odroid.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index ab3398f39f4a..5c5ecbea5331 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -36,15 +36,12 @@ static int odroid_card_fe_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	unsigned long flags;
-	int ret = 0;
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 	if (priv->be_active && priv->be_sample_rate != params_rate(params))
-		ret = -EINVAL;
-	spin_unlock_irqrestore(&priv->lock, flags);
+		return -EINVAL;
 
-	return ret;
+	return 0;
 }
 
 static const struct snd_soc_ops odroid_card_fe_ops = {
@@ -58,7 +55,6 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	unsigned int pll_freq, rclk_freq, rfs;
-	unsigned long flags;
 	int ret;
 
 	switch (params_rate(params)) {
@@ -105,10 +101,8 @@ static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	spin_lock_irqsave(&priv->lock, flags);
-	priv->be_sample_rate = params_rate(params);
-	spin_unlock_irqrestore(&priv->lock, flags);
-
+	scoped_guard(spinlock_irqsave, &priv->lock)
+		priv->be_sample_rate = params_rate(params);
 	return 0;
 }
 
@@ -116,9 +110,8 @@ static int odroid_card_be_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct odroid_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	unsigned long flags;
 
-	spin_lock_irqsave(&priv->lock, flags);
+	guard(spinlock_irqsave)(&priv->lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -134,8 +127,6 @@ static int odroid_card_be_trigger(struct snd_pcm_substream *substream, int cmd)
 		break;
 	}
 
-	spin_unlock_irqrestore(&priv->lock, flags);
-
 	return 0;
 }
 
-- 
2.43.0

