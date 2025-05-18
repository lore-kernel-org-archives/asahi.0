Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6DE218596
	for <asahi@lists.linux.dev>; Sun, 18 May 2025 10:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565474; cv=none; b=SCCF0sQJtpExruILSQnmoJo9Z87IxcJd+tCVT7XRXeHKSh7O1TYZNyaXZgAooEZIma1ayloRA03w5xBpL+A1zxZi6PBPT+ST2t+X34bMscsdao4L5bgxZLh3rYCDtHCRPh5NYD0agm/weB4Wu8jAP+j559ryKZwC7ZS1Ie1kUjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565474; c=relaxed/simple;
	bh=bloo4GYc4JNZLyBh0ddLz0+AExIZk3IijzAUg1B6IzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LiMPDBX6jd0DxoEEb1uf4FRsG8PDRIFAsjYjXp8y/m2B/vNcklI9eqRyJpjwVVzxkYj/0v7udf6BdpoktKdoJ6OE2RvExtx4FA8URu5CxrzfPqYkb5112WSRKQLs2SvqJW8VhX9VVT9m8vQX1h6EqlsIx326YIw3s5i9NryHJyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVzUE+QO; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVzUE+QO"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b27015122c4so451674a12.3
        for <asahi@lists.linux.dev>; Sun, 18 May 2025 03:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565472; x=1748170272; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHrWXETLPmMWvh88Pu4z3EEmfTBTODVAwS8fcOeK584=;
        b=nVzUE+QOomqRKWz2TPX+YS2/6g9jbwF+/l4SgDjUXvwhSilpYiADJRO4i+eD5LcgJN
         maQcaV7PFrGyDV/Mm4PRIq9YEembbSCv0zAHR6MVZ2tqQbuzgHi/MLrtjAK9ZXYZoOjI
         mxLPq98kdtH+vvgr13Tmye48htysgZlQrVKWmdwe7AYYB9HXAAgSColFirnAGMlhuqDM
         0uElGe92qc8Mhx4Jl1uIpRiGqoegCaLys0v36eVy9amys3drAnOcLAB5qVQc6jPUnvEJ
         tsMf4YIHRMoDHUktuUQn2EiObie28NdazZJQ4wLuhWn9DvhuQ+R6fcAhf1WW1Ox59S0b
         kSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565472; x=1748170272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHrWXETLPmMWvh88Pu4z3EEmfTBTODVAwS8fcOeK584=;
        b=vzDrzDHLiCjpukm8+/89XzBRYfCKJ8ugsdnbhMrPe9kMqtHHLbZUsj2O+UxtZ1jNDN
         NkN7kasdiCP1Uc78Ni8vRWmR5lC6cgQkTXPncOfrGPYlbbGA3xEqn45tD18WmYgdXiFN
         zBkaLU7FEae5LMDmDShDoXPIBh98zuTLCQlctNQ8vJ+FLHk7e96UXjfOCSRy221yWf0D
         iRByhc/OGnSr7egRzwHDKVdNktPwGd07RKMNw1Bqc6uX92zIUSvT7GaVysqTM8J51wcZ
         XSD3g+LN9MnNy4pFSBBlgPrYyw6tN3mS8mQ9JNC6PUXq5BIR50AhDqV/uy9PUM/N3uwn
         1e3w==
X-Gm-Message-State: AOJu0YyGQhHfSCXaQk5tix+8t1pNsHz6l2010HvFKdvCv3XKYseTw4yJ
	b7RIz5vRixQyYGB8SNbqlmUXByKg7bBvVGUYc/R6L3wGUvWmPge22vKc
X-Gm-Gg: ASbGncs9nv1ATaTBcEuyws/ajhsQzz49FbG9UfkLPz52UcqPb9bcfXdd6V99lrkeSar
	pThHyLWv/AEWWYAMm7PxZN0gqowKwCsqYVwnEkUd0dWWMkJJbLQQj6uyUGYFlpSXWeEb6/VZ6NE
	wFKIYpRgmo4tN9Zez7lD/jPtRoWmsvwBZFq/XpYzBAi5wJ+md0vsK5K3xx3h9vNIl9wHT4pEGv2
	L5X8f3qzD8GlYTgPx6VqXk5nroklt4/L5AGgGGqx3BEr1KDn8r7wHUPxS63TTSrrwxwgaG3PD5e
	rWgKyadMwDZ1Q2eOusycKClqbPy67WN33aBjmVHWVCtFx1kxXutB41QcwGKddozvL5cB5r0aDEE
	NJM+uB8Maj7CZbd7waAcfGj4l24BIDh2Mqv4QtZuS+LnHHA==
X-Google-Smtp-Source: AGHT+IHQKeN5K6oLu/Pr7bN73HTuOuOG1l8fm1K7G9wHj5VgQXjEmL3454BUhL6fVUoAR/0qXNb7SQ==
X-Received: by 2002:a17:903:24e:b0:22e:4a6c:fef2 with SMTP id d9443c01a7336-231d45ae355mr145745125ad.53.1747565472550;
        Sun, 18 May 2025 03:51:12 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:12 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:46 +1000
Subject: [PATCH 1/9] ASoC: apple: mca: Constrain channels according to TDM
 mask
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250518-mca-fixes-v1-1-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ReyxWz52DKUtyFgDtnGw7HLoQFBnONuJgIIlcj1/Fzc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau6eL+D4tPLR0DrPSmfM3g5R/VZkpl0v0t/5forBWa
 HUjp554RykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABORS2T4n/HnUUKcdvWb5F1X
 tk3Mci5/zzxt3/Q+qY8LHzw93P5AayUjw3b9LGOfiX9dJe84/dAUa/8nkLSw4dmXvaHdUiZCl1K
 e8QAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

We don't (and can't) configure the hardware correctly if the number of
channels exceeds the weight of the TDM mask. Report that constraint in
startup of FE.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index b4f4696809dd231a64229114c5550bb5f237607f..5dd24ab90d0f052bb48f451cf009dc2e9128014d 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -464,6 +464,28 @@ static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 	return -EINVAL;
 }
 
+static int mca_fe_startup(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	unsigned int mask, nchannels;
+
+	if (cl->tdm_slots) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			mask = cl->tdm_tx_mask;
+		else
+			mask = cl->tdm_rx_mask;
+
+		nchannels = hweight32(mask);
+	} else {
+		nchannels = 2;
+	}
+
+	return snd_pcm_hw_constraint_minmax(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_CHANNELS,
+					    1, nchannels);
+}
+
 static int mca_fe_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 			       unsigned int rx_mask, int slots, int slot_width)
 {
@@ -680,6 +702,7 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops mca_fe_ops = {
+	.startup = mca_fe_startup,
 	.set_fmt = mca_fe_set_fmt,
 	.set_bclk_ratio = mca_set_bclk_ratio,
 	.set_tdm_slot = mca_fe_set_tdm_slot,

-- 
2.49.0

