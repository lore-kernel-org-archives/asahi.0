Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB87217F26
	for <asahi@lists.linux.dev>; Sun, 18 May 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565490; cv=none; b=W6Jmb6cGm+XL6/XqY55E8ZCI9lDuS2CDQ1BAnDQue//lp8K+DHdh2FfliMorRdvGVih7zXoxfc/R4VVWXWy2QhHBIxpLR5ZIBYWrdOBX/5Yk29iA/tBwjQ6Dvt9wXWzzWpOgSM0KwZM5SN2g3RzNey+Fix2TYOFrVnqEkfRaiUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565490; c=relaxed/simple;
	bh=F82kQo5jF8NNEa6QNxcYjn5L6vQFnbATljVK6E6zfSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YD6Ww6sJl85GEUQku2vunhNKeX/yDkwmWyZ/0eQyuOm1tZ6rALD0CoUPbR5yIkMnR6mYw5q5Kao5iWcMs7ECsa3C98dJy7YJhYV6QmSe03AIqTLIRUx8JmZHGTVdl1cAyxQX9eKVu6bhESyfd/VZ9SHeyBchPJPeagvfKYTxvaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZSbndKR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZSbndKR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e033a3a07so34592445ad.0
        for <asahi@lists.linux.dev>; Sun, 18 May 2025 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565488; x=1748170288; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+n3AQ8sePKLocQfLg1pUdFDlZnS0WtD0qj/lH0MVs4=;
        b=kZSbndKRslqlZA1wVWa7cjDA8Am66OPoLZW3BVutwyGk/04mSo8dGyCGXnj+kgo0ix
         2bUq5vsuFFJEEPqKgJhNYYu6BvD+LovUlgBDT8jqySOSLegYR82F0pwcXyQApa/WGrgQ
         r9U1aamc/rMrgEnNoLlyMRY2UhWOD0B04PuRt5Ju6nAAXarHQwIdO5vvBYvFLebsSgKA
         HPZ89SNzXwU/ycndPViE5/ndQLmBcYxvq3krC7LSS8BUOaE2CF1YJFRztULtSVPO3MSq
         EYIHhy91Cl0eWfu8+ByQ5d+yuTB+r3/BWDJMtnbB9OEnvNV7P+sHXKG+tkE8gzfAB+x4
         0Q5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565488; x=1748170288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+n3AQ8sePKLocQfLg1pUdFDlZnS0WtD0qj/lH0MVs4=;
        b=tqGVG0/lmbVsuR0rHhulasp+Q5FCwPOxV1g0Xptf+AJ4Outf7/BWTtLo7NHbLGXkHE
         dN5RvJNnbT4a+/cT4nBoLjAWupdMMMXzJyt4BPBQ4kNbBVoFdVJGHzwcVCd1zrFKbwPU
         Or8H4KJTMSSsNe8q/7y09cIglvF+ssq2ldd7Gc02xS2N1KCKgTwmaw36sx5xrkpZaoPy
         +Y55TwNDfp1zeyyAxvICyyRnnn/8yPd7LbxsUEE3Yh/FJYjSgAr4mt33N0Zf81g9BBLZ
         SAG/cddy87e4tkZ/46b9Kml7uPgVO5IXhnKS4WG7gOqY+4hmEs3rC6G+XAOh5rld1c6K
         N5Ag==
X-Gm-Message-State: AOJu0YzR3VOoYnRcpyoFFK015M7T6GE+2UKPsAs/5Rbd0z+HuXMkK2XZ
	dJ3M3+iGAqnWRNaNHkT3L/E+6xFkoVSW0CwGkxeR0yM+dw3T+6kZsdBw
X-Gm-Gg: ASbGncvziK6t5+W3e3aqBFcKc2BtMk3cmyDXG6Bb9trYl5hxHN5OLIHZbt2UZ3QLfGh
	J0xuYwUjF8vXAH8873i1NXQeRPCCUbm5lVFGGqbYhS4L2OVSAVo3//bcS+sMoWF0hcLcRVn4cg2
	hqL4gLGRpR9N5i+EB8gk74qT0zg6shCxP57aIvtdnthJxKnpcGfIdT7oGys509p2Ced7nysPvZy
	7iK6TWbjezWIk6bA6hqYN+pY4dEtTbmJ4yn7Q3QKorstRWZ7EmFkE+xHw571givQ8rl96o1Rz74
	/wWip0BMsfGpS4jMP47qq8w2zJmzbIF6i43wxLsyVIGLXa4z8wuvwKonEy3qNsAJ8THMK51+AW3
	Qvcfd2YhccJw/MN8zyP4/EobyLjpOkgMJyM2zAUrwEba/lg==
X-Google-Smtp-Source: AGHT+IHz1CUXiqVS3egmECCEkJqx3r31A55/yZ+UXHJFRte0jXT7/LwmZSh1hlx8ZcidOHq3veEF7A==
X-Received: by 2002:a17:903:94f:b0:220:ea90:191e with SMTP id d9443c01a7336-231d43d9ca1mr139134145ad.4.1747565487726;
        Sun, 18 May 2025 03:51:27 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:50 +1000
Subject: [PATCH 5/9] ASoC: apple: mca: Factor out mca_be_get_fe
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250518-mca-fixes-v1-5-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=H3hg2zGOBIXuTqTCzYB8ehtSLQVdcKQ7HsDaPyG6XSw=;
 b=kA0DAAoW1DYy0VH3eWAByyZiAGgpu5ihWW9iOjqZV8eX/aFNeavdo2h8sCgH0vLg0aycMfjZM
 4h1BAAWCgAdFiEEsIISSJsyBtmPFHm91DYy0VH3eWAFAmgpu5gACgkQ1DYy0VH3eWDZfQEAnb5c
 k0M8EQp9jlrrt+p4DEiwvYbFn8rvjKC7uxU4UPQBALLzPInhnXhWlgdLBFrcSDZYTO4276mjxYB
 ElNVvBzwC
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

This is a function that we also want to use from within mca_be_shutdown,
so factor it out.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 31 ++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 39713c378ba10910b0a3ac3d804844b25dfa2c94..7c3e1eae8b963ff593fdcf54e4a1f2e5f64a63c1 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -702,30 +702,35 @@ static bool mca_be_clk_started(struct mca_cluster *cl)
 	return false;
 }
 
-static int mca_be_startup(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
+static struct snd_soc_pcm_runtime *mca_be_get_fe(struct snd_soc_pcm_runtime *be,
+						 int stream)
 {
-	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_pcm_runtime *fe;
-	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	struct mca_cluster *fe_cl;
-	struct mca_data *mca = cl->host;
+	struct snd_soc_pcm_runtime *fe = NULL;
 	struct snd_soc_dpcm *dpcm;
 
-	fe = NULL;
-
-	for_each_dpcm_fe(be, substream->stream, dpcm) {
+	for_each_dpcm_fe(be, stream, dpcm) {
 		if (fe && dpcm->fe != fe) {
-			dev_err(mca->dev, "many FE per one BE unsupported\n");
-			return -EINVAL;
+			dev_err(be->dev, "many FE per one BE unsupported\n");
+			return NULL;
 		}
 
 		fe = dpcm->fe;
 	}
 
+	return fe;
+}
+
+static int mca_be_startup(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = mca_be_get_fe(be, substream->stream);
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_cluster *fe_cl;
+	struct mca_data *mca = cl->host;
+
 	if (!fe)
 		return -EINVAL;
-
 	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {

-- 
2.49.0

