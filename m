Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913F0EED8
	for <asahi@lists.linux.dev>; Sat, 11 Jul 2026 01:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732310; cv=none; b=j6yZq1hQJOTC197aDnhMSgxD2nxYJ9wRuHNcFQnZqTcmDbqjEJR1o3S3nbgKVYiYg8JfMXzhgNomZ8z/HzzCCvkWGPS3Y+svOsfb7TjyzA8zXQRLZc346kjl5zcVa7MtmuyKQ55QHBjov9/UWflBYnQcbsBeWD9n9dPYfyPT/VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732310; c=relaxed/simple;
	bh=ANceJ9b98BTOb7cjTXpEWeapQ0x5Y+oW6BrMwWfSbU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qyf3j9sQnIPGIzz69thXlRXRmvL3n+PUlhuMnTv+AW1KkP6fnXkUPfHGEcQZclDwRF7lRUQj6vDO527knEnL9rdg1qN95toEmknurZMxEx+drRHJ4q3a7DF7+NxPTv+6OeKdj/e3eWm/XkFFyhc/v8OtTQ9Gr3nHUrWA+VlAMBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/hu4NLg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/hu4NLg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-845c92bc464so1348510b3a.2
        for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 18:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732309; x=1784337109; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH3fDa/mQ1wFJ8AJw76Ffp4EfrLnbmDhJB4OgmL9g5s=;
        b=l/hu4NLg8SLY42uDKDc2nCIDoxNFNrGT8ZTn/yRDbe8isDt5p+EDC2/u600xwNkXpL
         wPFX21uhCQcNmoRzIzssh1wzb1XeGOxXvnE2QC7h5F+iTGu5kuNe7Sw/59rMFr9CNkNN
         0Li5KFgtSXVb+AqXQAQeMQxiBuOCJrFC1FUbfWZd8SbmGGXc24zhjq4GWBg+nsBp5TUr
         XcV4IXMiSMwheK3UDdFj5jo333C9KnIMAI2R13vk9AEzyz0PgBcztxt90kQ39/IaCqmu
         HzA6j3oJiWOS1jabTMEivCJvBnx06u7s5JTBLCrudpOA0fSiSQGzgLssSbtoZo+rDxhj
         Uh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732309; x=1784337109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WH3fDa/mQ1wFJ8AJw76Ffp4EfrLnbmDhJB4OgmL9g5s=;
        b=GAXnfby8gYfkm8jv8z8z8OLJQ8ICKHcvrZNxkUMcpEZbBLNt7T1E8IHSDoao5KtoFI
         AVfirVxX6DO6K6SEAZZt11FxUzvVmOMTLZxeXXBAmL4Ajo5g8xbuvTvfXDz3RlWwyEmK
         MOkDDDg7nH8DlKIEeapCkiISX22NiEk4Lco0pceAHo9HWCnPAf+OmkKS3XOOxPsaFxVO
         njCkfCWuGAhAN36pypEe6lY1+VRriRr0pBokgAJwc5ne93MYwLfCphGIIEZfJ+dVuFLR
         gw5RqegEh5wBvWaBQ06+U6dks3f4hXxDyc/Vdt30vVClMSahA6P+CpFY3oLh6+lRuC73
         3SDw==
X-Gm-Message-State: AOJu0Yz0N9PDwgdKbxhzSsqBiI5uWxO+wtE/LhCpGSG8Tu0f1EjjLjim
	HstdpBn35gYq7Khr8o4sDhhvmazRGDzM9Rw92ejQ9ZLkgbMn+7E1q5uO
X-Gm-Gg: AfdE7cnpnR1f7UhNuimupupwLtR70fW+dF487k28fR4+HMh86S5szPOzJTgjZK86FuN
	HWUnekEBVyZkjnjJ6LmS+Mv0RWnN2QzoA59G2VFF5I5G06FrVwHJrjn0BXK2X1kmDnZV+jbdTFA
	HwKeh+ds78yEOg0IVbP9Vje8lqyQpZEI1VFPDhDk8ERpu792JQDgSukkq3bCQYD1elaieIQAVMv
	YQC50fVpCdBYTzNayLhRoEqVCx2m77bkfzBCoR4VBQV0KkWwXtggCDp5GfortIwAJc7YqU/vdgC
	srRHo1v3rGq/7Xhtb65cDog8WXTzUPTPzkJKGvwlnTiIgVsXpcSKLPztlmW57VL2mPBg6BdeHE0
	T4k51nuKVhYGvognBt9n+JwTzPN9INZyOc/NrR0S+xjYJCKTQL/0yu3fXvnCcy89cJwRCDSJfII
	e1HSVUSpJQXMQeofZ1UlAPIWQkZRhTgO+lxBdB5ru5GL7uS1gd/a8cqnN27kC/14n0XekMihX88
	1ZYxRI9tsBeNQdt4H4j13IjmgBD6LH93oorNTJ47zTrRTbZzixCmqMotERr9u7LABSKncyrt1b7
X-Received: by 2002:a05:6a00:b47:b0:847:9c99:ea52 with SMTP id d2e1a72fcca58-848896084ebmr1269711b3a.24.1783732308877;
        Fri, 10 Jul 2026 18:11:48 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:11:48 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 11 Jul 2026 11:11:19 +1000
Subject: [PATCH v4 1/7] ASoC: apple: mca: increase SERDES reset delay
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-apple-audio-redux-v4-1-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ANceJ9b98BTOb7cjTXpEWeapQ0x5Y+oW6BrMwWfSbU0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM7zq3ZT/2GdU9L5IUT2esvjMqxq9k/Hu62YeM3vU6
 reZbVNgx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKq7DjH8s0i9L6e8ZVnNV4t5p13+lYk5ihg82Vs2g00u30Kt9OeEKYwMK103XJ6
 zIM6xZMYW8xovt+nr7UpYzqmJHEtjfJq9w5OJFwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The SERDES clusters in this peripheral take a long time to warm up.
We tried polling the reset bit until cleared, however this is not
a reliable signal of readiness to be configured. Only waiting
~25 us to give the cluster a chance to settle makes it work
reliably.

Increase the 2 us delay to 25 us and hope we never have to do this
again.

Fixes: d8b3e396088d ("ASoC: apple: mca: Fix SERDES reset sequence")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 492165c0e1ea..ebe116f32661 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -210,10 +210,10 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   SERDES_STATUS_EN | SERDES_STATUS_RST,
 			   SERDES_STATUS_RST);
 		/*
-		 * Experiments suggest that it takes at most ~1 us
-		 * for the bit to clear, so wait 2 us for good measure.
+		 * The SERDES cluster needs a bit of time to reset itself
+		 * and settle before we start poking it. This is... slow...
 		 */
-		udelay(2);
+		udelay(25);
 		WARN_ON(readl_relaxed(cl->base + serdes_unit + REG_SERDES_STATUS) &
 			SERDES_STATUS_RST);
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,

-- 
2.55.0

