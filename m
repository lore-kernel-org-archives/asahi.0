Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6350521B9FD
	for <asahi@lists.linux.dev>; Sun, 18 May 2025 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565506; cv=none; b=daTdopTz+nZoLp+wsPvWQXkVr4TO1z7rRYI8uiw4RGfdH6aHJK7RarEKlW/FL650yv2YSSg8pJzQM1JZrLcMOWMk0fQa4MICnmQ/qvQxLcUgM300UAPcc52OJapsuBZQi/2+c4vhWCZrhWtdkAlmRLHmCRFpJUfCqo3HGzVH+8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565506; c=relaxed/simple;
	bh=4tneEjrLLbDxLH5yuVt5982xVp3BOh9Iew7CW9SasfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rzk9fYKrPHxY9tL9gzdy4KzrqFwz3f+e5UWX/I0p2JEAoc1RDvm9yqIg1u42ZuPmRoNOyEvOUWGMs86pSWx2TP4nM5bYTXAPrxPHJHH0zBPbdYbofVpNnp4560YpQgoaZNeBCNhJgS9sI0dGj6csddWImT4EPmWzV+2V0JaG+44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baYLqlBZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baYLqlBZ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e331215dbso33342745ad.1
        for <asahi@lists.linux.dev>; Sun, 18 May 2025 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565503; x=1748170303; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51qal+nEZuN8T7t3NgZ/LK0U2xqY70iM2If30xD70Os=;
        b=baYLqlBZtr5QqXs/dfPxFT/Wa4GOIOEcAkmM0edvgJ4WaNupiJfbYHgC38JuSRhxvP
         D4+6lIjCEC1I8T9xoj94t1Zxxck9ImqV8bjKremZ3q65A9S9CCGySrW1BmfuOF9dc409
         tQRe8NfJymk4JZvCzL0jJsaT6H4SlEofou/ZxtdmMG6+mDMk/QdZPej1TAfPQ+L+Kzdg
         qyxS/JEtkQuAqrmwAM071TJwTMTMFC//PnsBeioWDSh0G5opa4AOc+gZIm9Tcd4XmsU9
         YfKDRW3L44+kU1F/8KKrmRpRN4Jz4rPuM5hPS8eGBaqGVab43tQdkEQcxrC3TZswjL7O
         9YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565503; x=1748170303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51qal+nEZuN8T7t3NgZ/LK0U2xqY70iM2If30xD70Os=;
        b=RAmhiPSjoJb9Y5Pi3F+Emwz527RHWr7R+EkMgpc6y+Zr3AJK/2/2gKVcW4dotOw1sP
         xghVuZGGddfCHaAbHaJuPK/s6TyAruit5ZyT8+ichAEUZf15Uh3enRiA4AQPt1+2pTNn
         /x330JFbJrQ+9AuSuiZ99eD8VHIU13Zgc7GJQi8eubyseA0g0LFcG/N8rXiJ2cf7+EDh
         tdi8gfUS/AbRHqMecqbRB9cF6gFx2K7cY0fLcn1V1+RZmVClUC92kpE3DgBiW46apuCc
         UZNhUhHy/vx0w/SWPMN9O6fuPHiwHu++2SVBgH7XSDAuHMa5LGT+fFR4DpUyL2/fxRaR
         wmSA==
X-Gm-Message-State: AOJu0YxTOjQIjxOPH11xztLQlIEsScuAkPSYeqrFBrhiyfnnpDSisITf
	+DvQs3rZrr5CMBQReazRG1aVVMrcShZzRlJNBQXcXejpuWFZj3vyCpzy
X-Gm-Gg: ASbGncvwmJ4f2VPw6wxFikyycWqFwTZdD6YL0MPHWLt4XFqljzYQip91nnrUTzqSFD0
	gbHD99cVdY9JL4x/g1XebeZGXxw/cvHXfDH2ZNFEldv9PvWy6JpkACYnv73uqQB1nZXwS2a0NSA
	7DY0OqI79Kpr465eLov0AaFixSGeDez3+HQ3oLF6ggHcawoC3SfBQaERoILh5XsmIV47KqvdXYu
	ju7wfqDBbn4pt+cN3OwROC5vl6k8oL4CB0bHg/peF59TvLm+R6sWb8jyMkSCA23CG5H7sO6Q1f6
	BbmRmXKiISMzbpz6I6QLaRxHKdNbBQB3fvw5eJHzfU8PjY5CTvTRmq83+bbRczJfFqeII2YMkD0
	cGkbThRPLopp5+ydBleJsaaeXtHGSPVoA+h0NrVuv1ZaP2g==
X-Google-Smtp-Source: AGHT+IF+Y+vQADQsRgWRpYhwHELIYu7P2b0zFe6oPKNRetGepWzTVG+EAL/37OwVnj5EeXLmSUM1SA==
X-Received: by 2002:a17:903:1b48:b0:22e:4b74:5f68 with SMTP id d9443c01a7336-231b39acfbcmr214052775ad.19.1747565503634;
        Sun, 18 May 2025 03:51:43 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:42 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:54 +1000
Subject: [PATCH 9/9] ASoC: apple: mca: Add delay after configuring clock
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-mca-fixes-v1-9-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ekpJUrgwslgSSm//rnVrNbH1x1uOEDjoGU49rCtKwNc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau2dcNBfZyniLo7vUzoPHy1xpdcuznHhb69lLBLpuv
 vxX8jKmo5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgImU7WL4n6NfVFyh1Zrcv8H9
 2XSJGw4H/jy749UbaLyfJXrzBPGQFYwMHZr7Um2uGF5P9DrYfIOZxdJvxmwBg68eoqs+bd5s3Hi
 WBQA=
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
index 25d04b3d8a57a8551f2ac1c0cd2dbf2997d907e8..1c664c204504174df1d0af3cafbe25235c678687 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -231,6 +231,12 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
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
2.49.0

