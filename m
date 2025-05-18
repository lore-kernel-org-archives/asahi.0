Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4D91C84C0
	for <asahi@lists.linux.dev>; Sun, 18 May 2025 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565501; cv=none; b=a7dMgOIQWgXCWvmDa8JIXrkulSZzk+H78N2GEgt7/hGxwVN/H0O/i4UrdSZBbYAcf1iBM0vVH68H5jeskOKk0OvBvn4XI4lRimLooeXz4gEB5YVGolOj6xQ3v78ZnNU7/wRIM+Y32dq0GOn6wqxQMXB0B26MeyUz2AyGc9wuFtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565501; c=relaxed/simple;
	bh=kPw1Cx4vefSdvSAckl24nWDm+BechYSEdXFEpf/NZCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBvzJLc8/Bz1e8oGE2E7c/eZ6uZaoOZHvE7CRaKrf4kRLeBmPD4ZcaWBvxI2khyd0bh42WFNO5cOdVV6NPSt6vmbqZZOM3gJpKKIqcIr2WASupfv0Q8WBwC9H1BXx16Dc1gWnYMx6nXfSNNjqdbIP82I3d0d7+9Mi2VNZPATCi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDD8eYBq; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDD8eYBq"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-231f5a7baa2so11720975ad.0
        for <asahi@lists.linux.dev>; Sun, 18 May 2025 03:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565499; x=1748170299; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+TQOteH29Xvjl/lra8+ehLYQjcHKmaHUtvhiWXI55o=;
        b=aDD8eYBqO0rgmg8bM4taw0IzYasILtZWxAuN9QpFUFI0Jw/coiHl6xwxYljpSIaDMF
         kJ67K0zsp0o8CzSAhET19Nq0Eec1FF87ucwiBKnjfVtt/SVFEtABmDFdWMhc2V5i8DSl
         KAr6lt2Bm4cIeoyfKKzdvASpkhAQTnC1xCa69C5fSa/IcqW3P4pUW3EFFy0HzWM4bnyU
         bGD5S+aekEcClQBi92vkmMil80JFeDf/tWWDMCDEv2To92/245EuwipPtHXQ5Nm9GRfe
         3cnuHJb3gEZGrscXZ7Ntw8OJY40/IFUsClFsIVNr869YOQBkyaCa4ywRvseXLGZkukkx
         Y1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565499; x=1748170299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+TQOteH29Xvjl/lra8+ehLYQjcHKmaHUtvhiWXI55o=;
        b=OaHOCiEE7Iv5PodRURdCQH6DpO5YX9sRXChagQ++XfK18R9bDGowMasOuIbN1vb/rf
         d7hvaaKVnfO5kd3LlL6G3k61RHdnwUYmmXpTWcUVA/zVQ7SrYSEsR55q5LRGcI3LIpRI
         4lTsxJvoWin9x7Mc2yBqYjVT9p18ijX0FBCGPGA4+0WHG6TXTaGR40dHVMTcHamIfYyZ
         4Mb80/JsfeAze0mZ+em0j/x8sPzyIGkusMVixQQ2/tGFpMFpDTLTwyTmgjGq1LqoBW5I
         4gNkFtUfyb2z5wDCif6O1kZIX5Om30KXlnmGTkkAEnQkEA+Exjey7TGJVRWeTSxWQoyR
         Q6dw==
X-Gm-Message-State: AOJu0Yxu/708MEDJtcKQoubrLr3HlUsdLy02K0Faq2bDJ+FuBazQJDA7
	gmmTmXmv5CU8WFHs4xKp8BhyIzZc0MgB8WcdYcvO0Yb4pKJsdF0DHw3sqPMueg==
X-Gm-Gg: ASbGnct+ptacgqONo00sWQv3T0U8yjl6KsG+iXFeNDOG6YpO4YGSmiCDYYKTdBLzBXs
	yNhPZXhSl9I7ikbhwqN+UxsXGMyOBJ4Jik6U9CooJ41Db/1aSxByxjpKKssuigIH7dYC8jmHmxT
	wOlRb46AylWnyiePybYA4GQKqMYlh2V6ZFI2SY0VCPo6k+pnq5A7TYAZJPfcFk4Iqr7QFBNe5dF
	9vZ3M3YX/+xsPPKHQYFzZ99pFsqb8OK/khX4kMl+i2Z3eseYliY4oBNjBe2fvDGYrap9d8PqlA1
	0w22gIJeFyhgmDYfKfdVa3fB18kbcPuj7aav1giI8W94vUrUXBCxc1UhGKoXqBw4GsUf/D7zx9g
	5wO8vp9oqCGHwk9qA0cOAq/wtuCouiTFo0jyl2zqpePiSdw==
X-Google-Smtp-Source: AGHT+IHv47cIK5TFVX7LQsUp0mVKo/9GdI8UP4lmtixQTPlHmzUKc9osp6FDpEvOMkXvZ1T56jVRwg==
X-Received: by 2002:a17:902:d4c8:b0:220:eade:d77e with SMTP id d9443c01a7336-231d452da59mr140825685ad.40.1747565499176;
        Sun, 18 May 2025 03:51:39 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:38 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:53 +1000
Subject: [PATCH 8/9] ASoC: apple: mca: Do not mark clocks in use for
 non-providers
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-mca-fixes-v1-8-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3334;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JYVlVcyCFMtvwLmM3c16btYPlRB/A9G/oXVUQQNsX3w=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau2fo+J29vszrmZpWdmz/zDV7FRQ22DjPqOCYNWWbg
 v3zk13mHaUsDGJcDLJiiiwbmoQ8Zhux3ewXqdwLM4eVCWQIAxenAEzk7ktGhiMVpw+1lUjYnZ38
 J/t2WDHTDXnBAxPf90lLGq8oWLmlM4+RYf+uN+u6BG/8PPPZb4vfJY8/swQrORIP3KsyrLld2z/
 9Ih8A
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
index 441da5ef3de1c0be1dc607ff2490046206660e59..25d04b3d8a57a8551f2ac1c0cd2dbf2997d907e8 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -354,36 +354,6 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
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
 static int mca_fe_prepare(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
@@ -787,6 +757,43 @@ static struct snd_soc_pcm_runtime *mca_be_get_fe(struct snd_soc_pcm_runtime *be,
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
2.49.0

