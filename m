Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6012D8767
	for <asahi@lists.linux.dev>; Sun,  5 Jul 2026 03:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222744; cv=none; b=hf3qelzsZ4b//APu5MOrMetgJmN9ez9VvIhkgk0Pw74SJhs6X11A2CZqWCLXy0hO9K1IPzgFR9UpeONQklo25tuP6iLpvhcjCbA1XnXAJTUUOFmUdRntfADfMZlr2bSPd0H8I/n3n8e995iEEZ81tA9bhEVhGQjI26ITpQE7XeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222744; c=relaxed/simple;
	bh=5F6Wpn2wEPSmmQLDtQuHy5iGCnuqtiFIo0tJtr1nPuA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PKV24ZaZTd5+TkYnkk9DIeMCxfw0pDy8T0K1vcjD37cmXKbs3tbV4VPHNuOWTVm9tYVH6mLo5eqCJBw6rpXi0D2hYfhtZvmbGgEiq/k6OF7JJ54VEi5Jy8xvC6CtvoXjPHC0JXZIfz2kLK9GsR/u2tIm35XNREjebexfFxE84ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njNduTI5; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njNduTI5"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c88973b6965so1974842a12.1
        for <asahi@lists.linux.dev>; Sat, 04 Jul 2026 20:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222741; x=1783827541; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmMcSTCtgId6XKkksH0TURh3OjzppyxEGWxNMVEqaKU=;
        b=njNduTI56PdqcyY6vP3a+CBvCv1rTevoEofVopihPtbiyIPthO3QpIhvpHQUGR4sV8
         vu0l3mtsdfC9qBSJDWzEim4Pw6Pvtm1Ieky43z0N1NPYyvf3D20x8B59dDyz3mAZ/xhX
         TQx3kFvt5QjT0FaI3bgfHx681E0rUxwZMMZ/JHVapYZuRem9yQ34L/Dk6TPs3v1+/Xrx
         7FHKTB2F1cBaq8ShIKc6uOd3IziR7WqCnOZb8iWxdud/yNPmHvvyCUjHgD3SILZAk+zi
         3ToTTl4+bK0efZLwTw7AO4IGbdk3Wl5/VVzOcD+nNyIYa80jeLQ4wgSK6+oLe7ODrQDQ
         CTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222741; x=1783827541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BmMcSTCtgId6XKkksH0TURh3OjzppyxEGWxNMVEqaKU=;
        b=HiOVT4Ou6lYLRmnwrEAis/WE/WdQEiX6SnugtaBoqT5gPyP2G+fAO+RStFrxiWyk5T
         GvY+aaIaCsQGZCMrS9BJjIbgpcZsH3vaVa3Bc1+DYGZr2qeE/cr2xRezGv/NjykEtcX9
         DhwswS1aUldDwFEcEvfH2dJdtmENK4gfSrc3nqLboJq9MeBLD4RA5Rb0rcdAN9Ny6sCB
         fBcMnwmO+gmRGXlcliSouW396ycD3lOfKqRLhZdHDKQDLe7cD8JctEgJNzsb+CGVWtv1
         ojvY9axy6E/zUCp3V3LgB6QyfiseYsWlJNjH8xwpc5N7Xb+yzcbchde9e09cnOp2HrmD
         nuLg==
X-Gm-Message-State: AOJu0Yxsjxapw1Rpxmpc0MLuracdwHuTQYYiV8/j0kVARjy0NXfmI4EY
	YYDkmoVZLZNP/vOdunTIeLQvbtcClnVNXhhFg6NN9J8nsYj46hhF8gaP
X-Gm-Gg: AfdE7cmMxMcbUNvOK8tBsQ1aIp5QQEhX1fvZbNHR7VkYUaQeCkPrDGkbUL0w7EljBkM
	YsVJiHEEK+3o3Y16IwtvX0gIs0muVbqvWdqc+dRrXdCmMFVEWbL4QM+Y3aMCP5hCCauCJkFLRg6
	6sMdXd2Km0S6dGbaofNZkT8OztoKiJwlal7Kj3605A+GuxG9ao/fW8tdPq5kw7CzGEQL1RGtOxA
	LxW4bZ4iikbLqiUx4VIm7DbCcY8Zap5UHbUuF3mdHX1GcPH7rlYb7D9Wm7HW2NqTpU7GB5z5fku
	QulQKCGOf/sy5CI/k1hQBd0v7lvC/w5hSbBZ5S1mdJj4GQAM2iB7CGrnvZ1Dvdr1edDqe8Qpwvy
	JtVqPi+rEJnf3Ad3iQPwT8V+CPBGPG5L6XzUpkKdFCijMn+UGdxmvWAwoXPcJBOlva2nFgeOwlu
	npPrK36pRU1bm05Unb/O321BWQDoZUAHj0IQrBosF/NkqgW+O9TIewuyZnT9FMrJFhFQPO5QS5M
	X2L75oFzmjS+xVjLKRiOgkaozfb0Z3OR3BOLs8FwYbunu3XzvG0z8Tvxvqngk/ebbWpddhKIH8=
X-Received: by 2002:a05:6a21:3a85:b0:3b4:7459:85a0 with SMTP id adf61e73a8af0-3c01caacc85mr10346447637.18.1783222741265;
        Sat, 04 Jul 2026 20:39:01 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:39:01 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 05 Jul 2026 13:37:56 +1000
Subject: [PATCH v3 7/7] ASoC: apple: mca: Add delay after configuring clock
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-apple-audio-redux-v3-7-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1040;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YuGvJxGd7rMKWAmYwBfPtKfCWVffFa0TGyJifMJaBa0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7cmsAi+1Be+4rOvcFP8HNFbIS/PrGHW+d5/13634
 qn57w7Wd0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKZar4ORYSebRTdrhZFLRvykXzYH//otf7lwwf0Mv4NXD9gsSPorE8zwVz5X9/J
 dMwb/1/2mlfZ+O/1Pv7S+9vP7t9I3lSc7878lcAIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Right after the early FE setup, ADMAC gets told to start the DMA. This
can end up in a weird "slip" state with the channels transposed. Waiting
a bit fixes this; presumably this allows the clock to stabilize.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 322dd8771111..afb3754a8883 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -225,6 +225,12 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, cl->no + 1));
+		/*
+		 * ADMAC gets started right after this. This delay seems
+		 * to be needed for that to be reliable, e.g. ensure the
+		 * clock is stable?
+		 */
+		udelay(100);
 		break;
 	default:
 		break;

-- 
2.55.0

