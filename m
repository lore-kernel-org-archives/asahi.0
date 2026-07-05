Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B0428852E
	for <asahi@lists.linux.dev>; Sun,  5 Jul 2026 03:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783222739; cv=none; b=Qrj0JID3GVwM1ceg8HOnAAQ4NNBdE0ycxl8wQj3tU9Fzfmdia7vGd6ILxt5Pp+gjIbU5m3sjHgHnGN3vAuo/wcBYL0T+wfTwPBS/Kq+/CmAWBvg6TIwfzTFnuP55rFEPQlyJB6utt1IJ04/2PDvfMNJ/AzI05sA5ptxXdK1qz7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783222739; c=relaxed/simple;
	bh=u3feU+XxbkxG//8hCT8B0WoV0SQtpDUBimXlIjrgWBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YFk4l8Q1yZ4NreqK1iDc4AWF9AXHrPfPHvyQzNF559QKa1pOjT9J1ZUWz5TO5uYse/V4uCYDp1C1b9g4hvcX1VxjqIWw85LnMCiPIo0lk7yLHu4HGhjrr74tyHjuW1rPVaXRlx3ynjxcQ1jQdB5fenE/Qaok754XYZihDsBbLEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AQTS2ipP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AQTS2ipP"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8479f1a86ecso1075205b3a.1
        for <asahi@lists.linux.dev>; Sat, 04 Jul 2026 20:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783222737; x=1783827537; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mN+pJBIMoW7rE9Ren2+zTaJ8YB+31uYcQku98tORliE=;
        b=AQTS2ipP0Co6hp9TVsBJj+t5Yd1VYblAgwiTImBZd4uB1Za3O6ECIskkIm9Sy8nqox
         diobCRCjAKuD8+hoZZV2CtLGDnSWlhsY30BZtU9Tk7W+tCl5WbSbvzU3CMxOhXVKTjkF
         jeLq/cLBALOr8HiccmbJs8YyvMMsHhYQBNOMpfkySO4cXohsipwacoWeuGMV7hMzleqT
         9Mx/ANwuvJX3N9mzadUns8wRPsydTIOkubLfX/oJtx1LYfPqCXo4lXgNNR3c4y5DNmst
         r+gKsPP7+Z22qwZJ4ZFUvOAkADi4aYLbihhpkuvnCCo3YL0xQac+LoIumZboQCVsmsj5
         TLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783222737; x=1783827537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mN+pJBIMoW7rE9Ren2+zTaJ8YB+31uYcQku98tORliE=;
        b=H3o0OrotgL6FYOvs+S7UCYysgc474tIGHxG60xcEw7dRmDAYqr2BwUPJ1jHe52gxpr
         hsHHbk5yBRK1FKfSxdrwnwdvxO+wox+BuiqjRmLcwkFgZ/kdNyXoIPU/5g321HJ7QyBw
         aUGf3M1xcI1s/Iu4inUb9EimVZrMkes2ci2d2jwfKbuDr0jDX0ifdqzbYLI6HF5oyHri
         TO39cawfoGMEOPIO8czloO4oPVj4zfEEOnUdEMDKSZmsAf44CKNZeSbdpWSGXEY98mI5
         /ibni+HgRrCH2LHIbFPFFcTfVJn2wrO38cvaaWKgwuixn1JHPY8TxxDu9UkPXOClOMsD
         B2MA==
X-Gm-Message-State: AOJu0Yz3K6huI+D39TD3tRJB7PvdmRzPqtYyOzrDgTsPcvXZBAqtlW3J
	+U6TNnxVXgzf2LZHzmGt+Vpw8PdnQG+i20b1C1xtI2g3qcgjFGQ2Qlld
X-Gm-Gg: AfdE7clSWdPza8PhwnxG/lehAbkp8FnFqkgMGajTjvI7cnFHInZGCxzN816VVaz1DTg
	4k+ciAIL+ztIj1SOu7hn8t/UTSrqQavkQIDcyEtckqi57MOrn53q2ctyR/v8BGTQaLI2w24d+dS
	D0+UfBdUsdXTnoZMpAvHYr+ZMLHuji9MJIy95c+qbvrxVdMjGyM6CnwHOLKcRNspUzv6w98jBXh
	6SWyQOWWtCHu3Y6wnuloW6JNdm1qbm58yhmwS5bj2q81ZYQ4dxXOKt4rzNwwAewqvcgwFV8RHgU
	piH94JnS2jJdrk89YuGsuJb4cfNmT60Zymuhrwqbg0Y4O4VeoSU6KkFF4HBGoE+JlAlGfmIsst3
	+LHzD9bbUHXoa+kA3wJZoqQyxe6SOGh9P8CUMwBLJC+Ti0KwV7iCQm8pSH6Oe6wSSHt17ZwE4U4
	uTKzmLu4xYPpKICZqjpC9ISMRcng5QrOBHU820igj+zbIJP/HBayGfDhom7SN93cHAnkriPP/X2
	KOi7XJSI+WV5SNT28Km62GXYz03NjRtew4UppUXMhqV4Q5/BT6rAJi7rGMwuuSL
X-Received: by 2002:a05:6a21:e58d:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3c03e4aa5c8mr5520256637.35.1783222737181;
        Sat, 04 Jul 2026 20:38:57 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm35463845c88.14.2026.07.04.20.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 20:38:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 05 Jul 2026 13:37:55 +1000
Subject: [PATCH v3 6/7] ASoC: apple: mca: Do not mark clocks in use for
 non-providers
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-apple-audio-redux-v3-6-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3278;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=oPUxYsS4dAnn3g0MJvrYuVUHiPTpgN/zgb3R1tQjvLc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmeF7eaF73WU3vsxbJ5q/Z6pSdF7sxMpWlpFb82+/87t
 ZOzintSx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKo1DRj+Z53We/RA6fCMyMUOGRzf12QUS09dkJYn4XRvYeNhh7reSwx/hfPe+M3
 vPpa85d6ULzym7yal786u3pFSq5TH/VpQcTsLKwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

On the speakers PCM, this sequence:

1. Open playback
2. Open sense
3. Close playback
4. Close sense

would result in the sense FE being marked as clocks in use at (2), since
there is a clock provider (playback FE). Then at (4) this would WARN since
there is no driver any more when closing the in use clocks.

If (1) and (2) are reversed this does not happen, since the sense PCM is
not marked as using the clocks when there is no provider yet. So, check
explicitly whether the substream FE is a clock provider in be_prepare,
and skip everything if it isn't.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 67 ++++++++++++++-----------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index d8973e5611dd..322dd8771111 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -346,36 +346,6 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 	return false;
 }
 
-static int mca_be_prepare(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
-{
-	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	struct mca_data *mca = cl->host;
-	struct mca_cluster *fe_cl;
-	int ret;
-
-	if (cl->port_clk_driver < 0)
-		return 0;
-
-	fe_cl = &mca->clusters[cl->port_clk_driver];
-
-	/*
-	 * Typically the CODECs we are paired with will require clocks
-	 * to be present at time of unmute with the 'mute_stream' op
-	 * or at time of DAPM widget power-up. We need to enable clocks
-	 * here at the latest (frontend prepare would be too late).
-	 */
-	if (!mca_fe_clocks_in_use(fe_cl)) {
-		ret = mca_fe_enable_clocks(fe_cl);
-		if (ret < 0)
-			return ret;
-	}
-
-	cl->clocks_in_use[substream->stream] = true;
-
-	return 0;
-}
-
 static int mca_be_hw_free(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
@@ -805,6 +775,43 @@ static struct snd_soc_pcm_runtime *mca_be_get_fe(struct snd_soc_pcm_runtime *be,
 	return fe;
 }
 
+static int mca_be_prepare(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = mca_be_get_fe(be, substream->stream);
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_data *mca = cl->host;
+	struct mca_cluster *fe_cl, *fe_clk_cl;
+	int ret;
+
+	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
+
+	if (!fe_cl->clk_provider)
+		return 0;
+
+	if (cl->port_clk_driver < 0)
+		return 0;
+
+	fe_clk_cl = &mca->clusters[cl->port_clk_driver];
+
+	/*
+	 * Typically the CODECs we are paired with will require clocks
+	 * to be present at time of unmute with the 'mute_stream' op
+	 * or at time of DAPM widget power-up. We need to enable clocks
+	 * here at the latest (frontend prepare would be too late).
+	 */
+	if (!mca_fe_clocks_in_use(fe_clk_cl)) {
+		ret = mca_fe_enable_clocks(fe_clk_cl);
+		if (ret < 0)
+			return ret;
+	}
+
+	cl->clocks_in_use[substream->stream] = true;
+
+	return 0;
+}
+
 static int mca_be_startup(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {

-- 
2.55.0

