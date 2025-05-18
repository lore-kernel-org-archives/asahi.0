Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23862135B8
	for <asahi@lists.linux.dev>; Sun, 18 May 2025 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565482; cv=none; b=E6jiMau1KqAadF5QinuLAIHb4+rTBVHQqyKXpP4eQPAsBOVYfnHhRqt0Zw2a0JPvzNqiEuRKEjTEuDPB06dgCSB/OmBkSwE5geMwvZnStamDSr5HekuxVoxFfeRuQTEe5d7XWb8grpXNZWO8sjatyFErg3DNiQNxTmaCkwuPeT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565482; c=relaxed/simple;
	bh=gbENVBK1BFW0CzyBus2+j7Ha8BltCeIsW0M2RXAVOMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L0V0k67SgVE8phQhz9UgC4KdlMPsLMVvOuasj8AYeW94uBsqKde8kF8CsOeVdOvQyI8me3THtV3Gcagjp+qt6DWb+mIoKyrz4W2u7qt6c0bLnnXh1tXr7Uo0AHznspHnGsCunY+8MwHN1f1FGEGYrltkpz1nXxbIvHEZx25iV9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfngkm6q; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfngkm6q"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-231fd67a9aeso9276615ad.1
        for <asahi@lists.linux.dev>; Sun, 18 May 2025 03:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565480; x=1748170280; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=my6qC1AyKNURS4m2hwq9ZP5siboUqjBS4bBWhJCQoJA=;
        b=hfngkm6qX0ED9ZFvMYsJMPIMCsKCj0Cw/duHdwgKiOTtJoXAtas6O9+FFaMq/YOYkb
         t3GysxrlJBWpz9/2jefTCI0h64yvHUZ7mpvveJQro7jW4Q2w5tMds8tYsxx0wcdv78Nr
         jEoNBMgYk/lhjyv/m/EjxRKZdNQZLSJWmIoMKVXAb38i5TBpYkopSnPgb4x3T20AnEr6
         l9rIyV8E5uq6VLgr+t5BxmzCv/tBaINnMxZNsjlNTKvgJqUErOW8A4lFFXfDDb81T+MY
         xqrld3XHYzhvIQzv+mF4xTuLJz6+E44Kl+MyzeaLSRtKEK9SKEZMxT3DRHruaKG0vzP8
         Vquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565480; x=1748170280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=my6qC1AyKNURS4m2hwq9ZP5siboUqjBS4bBWhJCQoJA=;
        b=s5cXJLA2k1U0D8oVBHM0JT+7FUe6dNGCLavgcWiPGchlRcItiqlZfL90hGGWtoLmrP
         m+YbMljv3BJ9x4ASKU6iHCY/VY+k8GRdPDRHNJaVL4V2L6XOgw1b9eIC0Xy1lvEhnrg/
         okFTv2E1wfPFvUhu9320nAoF4zuOTatk3eKU9G4Yo4TKnnjNHE8+FutjANqobFBu/43T
         zhDI54mHWlU/KDWM8VX8qh01WAz6XOHPdC51BD826LSxYNz4hxClIDrh0qxqzTWTg+oe
         lCkMKPR3NN8FeaFMpTx1GC5CkEB3+NPMNfSgcmD4LmiXSTa75w0rKY0DILVliepjhY6n
         4SQw==
X-Gm-Message-State: AOJu0YygmWAFcsi4XNCzlS9mdSmV4m4/wuYCWkJGkZP0wlEcthss0z0p
	JUMtNQldioOHxFwq15EqDUu6SUHPks7QlA7BrwAkHxjLb4Mfgn4VQM+l
X-Gm-Gg: ASbGnct+1vZWXuoXopplGrEwH7J+Ee+axb5k7/BHFjt1pQSKPSuZfcqWba2K240uxDQ
	YTPm8MkUVliFSJrh8AdY3HHF5ngkqGTANtfG2TFlQIjfefR8OZLVeaBHesj5AT8ODHa7fBMnnha
	tGTlYSWrS9Yh03M+Ma1yiEfyvkivUSYg6CpEupz7ZCPGLa+k7bU3/5EG+CAOrLhaXBW+21qMgN+
	oq0wLIayW20pcyrfwoEqRTMEkYJTYLtFIMonRAJz4pptRAXxVGNYoQ4CFYQFgaRwcGYOmSyCdZ/
	wZ+4HSL1rxVYk1pSGeUeCy2NhyDva81BCjvro3uCoiQrTJiYiwxLezgWSpXtyVgNI8lNi6qD6s4
	p0SJ8X2xuCKuB07dfxtUZA0Wpx5WWPX0xnH3L5vl+Ctj3nA==
X-Google-Smtp-Source: AGHT+IHH7Q0q1k2r8EQN7M/10MYOXWvJ9RooDtnb4q22ZpNK1DQFpTMs3CFKGH/+4OBP/2z+0MphJg==
X-Received: by 2002:a17:903:2acc:b0:21f:6ce8:29df with SMTP id d9443c01a7336-231b3938027mr180930095ad.3.1747565480287;
        Sun, 18 May 2025 03:51:20 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:20 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:48 +1000
Subject: [PATCH 3/9] ASoC: apple: mca: Move clock shutdown to backend
 shutdown
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-mca-fixes-v1-3-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2767;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9Jn21G78Usgsal/23fmc4fU3vpff2g8Y2ySE4kB/1w8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau6e/Dt8avaGyyE724eafTifz+duklaaXGmslpdlt6
 bvGOHFjRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABPhm8DwT2vbrOkKl5/LNEk+
 ++WQyit/6YinpcBbT84+h6un2m4s/srIcCMlR1Cdi89vlvSPW+o8vUrRe9NT9rz8vbhvNUeFdWM
 CFwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Codecs are set to mute after hw_free, so yanking the clock out from
under them in hw_free leads to breakage. Move the clock shutdown to the
shutdown op, which is late enough.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 48 +++++++++++--------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 7113da4bdea7b687c0d44d2bbf3a511b8299056f..69f2e852d4aeb2d53eea5d7fee400b2337a09065 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -361,33 +361,6 @@ static int mca_be_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int mca_be_hw_free(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
-{
-	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	struct mca_data *mca = cl->host;
-	struct mca_cluster *fe_cl;
-
-	if (cl->port_driver < 0)
-		return -EINVAL;
-
-	/*
-	 * We are operating on a foreign cluster here, but since we
-	 * belong to the same PCM, accesses should have been
-	 * synchronized at ASoC level.
-	 */
-	fe_cl = &mca->clusters[cl->port_driver];
-	if (!mca_fe_clocks_in_use(fe_cl))
-		return 0; /* Nothing to do */
-
-	cl->clocks_in_use[substream->stream] = false;
-
-	if (!mca_fe_clocks_in_use(fe_cl))
-		mca_fe_disable_clocks(fe_cl);
-
-	return 0;
-}
-
 static unsigned int mca_crop_mask(unsigned int mask, int nchans)
 {
 	while (hweight32(mask) > nchans)
@@ -785,6 +758,26 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	struct mca_data *mca = cl->host;
 
+	if (cl->clocks_in_use[substream->stream] &&
+		!WARN_ON(cl->port_driver < 0)) {
+		struct mca_cluster *fe_cl = &mca->clusters[cl->port_driver];
+
+		/*
+		 * Typically the CODECs we are paired with will require clocks
+		 * to be present at time of mute with the 'mute_stream' op.
+		 * We need to disable the clocks here at the earliest (hw_free
+		 * would be too early).
+		 *
+		 * We are operating on a foreign cluster here, but since we
+		 * belong to the same PCM, accesses should have been
+		 * synchronized at ASoC level.
+		 */
+		cl->clocks_in_use[substream->stream] = false;
+
+		if (!mca_fe_clocks_in_use(fe_cl))
+			mca_fe_disable_clocks(fe_cl);
+	}
+
 	cl->port_started[substream->stream] = false;
 
 	if (!mca_be_started(cl)) {
@@ -802,7 +795,6 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 
 static const struct snd_soc_dai_ops mca_be_ops = {
 	.prepare = mca_be_prepare,
-	.hw_free = mca_be_hw_free,
 	.startup = mca_be_startup,
 	.shutdown = mca_be_shutdown,
 };

-- 
2.49.0

