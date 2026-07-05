Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BED24A076
	for <asahi@lists.linux.dev>; Sun,  5 Jul 2026 03:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222719; cv=none; b=rQSD1FOOJOa463ugHY9zk9MLLqlkqXV1q4i7P9XsQJ+znUGkGi6DYZfhxGBRc4t5qLHFy12kcoRHYCH3cRgqBz4nCZkYJ8ynMLNZFaPRleShTCpkZjZue3ddb2dcAuVw9NxnkLV9h1uqv5azbtAsUYUJy5/K3Af6nRPEwYqOj1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222719; c=relaxed/simple;
	bh=ANceJ9b98BTOb7cjTXpEWeapQ0x5Y+oW6BrMwWfSbU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vmt1fh7dgzRNjTMzuo6Kz4R+qdPmt7E73H7coXETzc4ce3HC4za+0gxnnxXww+iBRbE7JW6kr7Rj8HOVwUE1HhkU8MZqKT4mWfLesf1Z6LKCoQNJErS9RPg14ObBidyFkNTYAJVnFCv5aMHJpQ9yo6XFl3zXu0BX373F8lcx24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5eH+fMq; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5eH+fMq"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cae1a3a744so12580145ad.3
        for <asahi@lists.linux.dev>; Sat, 04 Jul 2026 20:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222717; x=1783827517; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WH3fDa/mQ1wFJ8AJw76Ffp4EfrLnbmDhJB4OgmL9g5s=;
        b=b5eH+fMqQ/UCCRh0ybPogQASCyxh+dlK0TzUtbGDRCH0Ivh0QqJuVlRgbAoen7f8ln
         MSVJYNN47wVJUqWLOaOHbJ6JO6sy2WoX8hwNXUzi8nVRHBb6L3SIf3gDxvlhocBdSVJX
         JzofhSL930oE8nt8CKO8wGlsQQQxGOAWrhKOEOpfQZEHrs7fLF7RJlkda3+i3f94Gz7B
         QhKIWQ1KUJAIcJnSnZ3oO8+l4OBMNQErZtjmnXCA9cL1FesgyTWbD4BFnAEKv1QwE3fV
         oNh/BfF/AHiyi/TCwhoU1PtflsW/vTxidRbbXhu5vl4Acdt7VTrOgY+zqiMFxA3zJG6n
         bBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222717; x=1783827517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WH3fDa/mQ1wFJ8AJw76Ffp4EfrLnbmDhJB4OgmL9g5s=;
        b=Tntyv1yHWTCWxpXN/ehyB2qVt5UD6DsUj4CZjZfFGi28TbVc+JIg4wANTAiXubC7ll
         VA8cBlBf683YtWuemKNseyViyR80IVJHew4a4MXZ6xUnvtdd1O2VypIZ2xQCAIiboU5L
         YwC1EHdhahdGObKZKUgSGAfhahs4WVA7jj0mS+ASTql0RwA9X3FydzXBomAs0wyTABml
         Ogntaq3+k+kVIlNzs/Ygm0u7SoZJ0WmJRI7kfhweOVVxeTabhVRf+Myl4d8vOOxthdib
         t/QqR3QdAZSSxDUCf9Ser3ZucKStpUPnCWoOT48i1UMnKeuPmWvV5FNathf3mmNe9KHC
         u+4g==
X-Gm-Message-State: AOJu0YxOe8G+sCIPdrN90MJPhHmy/DpLXO2b4ByCCzFK3z/nMGX5b6LS
	sZ8SJtyl2ACFZOEwrf0M6PoyoKdI6wkgP/C5yb9pv6XKIWEdMQQ3U3ak
X-Gm-Gg: AfdE7clmF3oYhEZYo0uu9Zz8Hvvq2/JUwiNZDsBllvk9gKPJTt4cemnrbtJXGI9Epdm
	4wrPp4oIgP9eYR7Aa+0XUwuegWuStzu8FMEsOerlT7KvaR5bMYDZyRMN5UCw+dvn/Q9ApDnKfRJ
	qYNlYsgYHIdfc/3m8TcKgPvNUF1kaX2N3JuyokEIS/kP6oWrYNLyVDNFpT/9jznIUwAqycnKEMC
	sF1JVY9/TRTTqUZDvaD0VWcXcsoADKfag4+BDsIWXkN9CUxkLVEhDghht2jQ3Mzu075Gm0pQGtB
	b5eojZiAGq9rXSNMPVNcsWb4S5takn97byqOiFsPGF+NTXt8W4o9IKO/yJ03QCE8aIbOLAV51Kh
	5zMtG+/mNRegNo+AYbe1+WDrSLr/81yu+mmBWqgoWwk9v0uBKSpaE2+VTqBxqOdW/JvYqPbYwRL
	qF3VWg4A94gFxGrZBVBD0a86ckot33knVUUDZMLF42Z4N72s05/pUZIX4aj7TXxJDq5jM6l3U7Y
	xtk1j1rpw7gZHuhqyYfixRq8oYyk2Spc7vggfRge7sN8KrZfBAMMyr7Ha5X2COl
X-Received: by 2002:a17:902:e74b:b0:2ca:5d24:720b with SMTP id d9443c01a7336-2cbb9f0ec42mr56329435ad.39.1783222717268;
        Sat, 04 Jul 2026 20:38:37 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:38:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 05 Jul 2026 13:37:50 +1000
Subject: [PATCH v3 1/7] ASoC: apple: mca: increase SERDES reset delay
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-apple-audio-redux-v3-1-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ANceJ9b98BTOb7cjTXpEWeapQ0x5Y+oW6BrMwWfSbU0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7ckMoWf3eS8bHW2lbboROXpn88El2kvsQ6tjrIMX
 /2z7N3ajoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT3zWP4wzlhU6DomrqseapJ86qXvf12bd3j8F+uquWXZVauPpze8oWRYXrCIpM
 d9mvytZbe+8zbHK4aKP09Y+VKY+P/hjEaVgt6GAA=
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

