Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E873A452E
	for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 11:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782646990; cv=none; b=eWpBA7OAnikkaCTLq7bhA03jIk5lXWkjXfkVSdfqiVJknAGDDCy5+6BQkuDf7F0DXxOMJGvHFDo76qQRD8Fpc91/Z7JBEARYdaWBA4/FASQf3+1oZDCSj3/7zw96RetNoetiSks+oGpaC7T1HEj8AHM2rCsTTESDeP8m/pCT5Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782646990; c=relaxed/simple;
	bh=GiSsKExbKqxd7eWz0dslj1vSQHyylK6xqmdzWWMlFIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HvjJR4tSJzfYEmWaUYa5/YmyyQWGMbYjmG1nVsOe7ix5cSVIAc0ZD4sqbGR7KPjzX5iLtZ8Bmq5wlhSSqIIV68i1RA6ZOMct2DaiJx0D+HUtcZ9tdcCThTYzWL1GGtlp8HeBNTUNZ7Bc/19lKUwdPlyEPp/JPsSqiXV4IjMgPXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUaYC3j5; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUaYC3j5"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3736932eec.1
        for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 04:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782646989; x=1783251789; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WA10xwBE0JDkkE7byDijzRVTDLYQ5oi64bJJmTshQIA=;
        b=fUaYC3j5AzVXKI2gtJUpWXzM58W/oObyWgJA4Pa2OmB8GZmZWgeSpL2gh1Vp50561w
         W/7NIN9IXPHkJNxILnTXCi6bhEa0z3XW4QSF6+XInJTFLmZZXSUyMhIdD+R38IaIicQQ
         1DhiT45eTaWXqYu+gC+yN2MnMbEuZxvVkSEuW2kVzVMKXRoA9HOXrgHaCUq2oMwDdxYT
         iLqdUony0byazrJ27t3KJAPCrfRhasMiodgzGjVYfGVhzUqtrIPudWxOreheR3YLDKam
         RjzmzFRbJXVS2IElN9/1mJrXrRULJ7h5azLm37ZJinq16HGVoI2OH+3qOyg3g/E4uJz6
         /tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782646989; x=1783251789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WA10xwBE0JDkkE7byDijzRVTDLYQ5oi64bJJmTshQIA=;
        b=jjtDN5Fz8RotctYZqPKrGiyvdmSz+2W8R/2RH75VmWCGczggW0LWotYL7D5UR9PBLe
         NbW6e+0NpTRfVPbYgLxJ9hmZ1KB5P33Kfxdx1FC4J/EMxKBv2qQlp3WdB00rFGUNFDBx
         1BXG/5hVoGx8qgOq0VWVMtEqhlx5myIeGq7hQwAOuMW+WdmeTBzreyFesXLJLrtyTKVK
         h5/2f4/xj30PZwRQNVOlCE5axG09kDSAa+ECWH2G1DpV+VxFXOaz1JsA/XvxakOaTf8V
         Ici2RqtSthJSs+CjzHd0YO2iEvXn1VCwpG1sgWJK8t+1XkEpWJzpGq44prIIUKGg6c87
         +z8g==
X-Gm-Message-State: AOJu0Yyy7O/HWwHhdE9tLmmjyRLTRstKe5fPh3sT2XWI2grkrJTM9pzC
	CnsIUoe3HzzxzeT7tJrfnhpMoA/AV9s/Vyunn3jtGVcoygqgImRz1mS7
X-Gm-Gg: AfdE7cnKiwvQ2Kxg9PThQRfbAf3laT4sczr/3Ty1GQuCR8fnzxvRZUApK7lOLaBjKKJ
	0ava0AJ/CfA0Fn9LEw+nQN2r4nh7aaLI/E4SRjMcsOsNQTzwMbfCIv5K651NgSWJgJaCiEcTHx+
	MWT5pE0J7kjG/J8iQDD7iz54lv3sRYE5eY+hCNXnl9COfUE64JBl/MrtOILVXgsv/PWhygjBmhp
	0SFDFl7qR929Z3knqHLwnFMLYedBhMX+vRlrEZOrO2xe4QwqxAWcfscGqGN+LxhuRFjVb3U+iuN
	znRNyvxKlfb+YxJuQ+ILl58nOLYU5/AaIC97eT4yC0Jvul10HSntjjZTix1GWOatmOPo1agkv3B
	qI45oh742fH8sCVWxL9iBXTN1ZbBrtPKF7dgvwvIHw7oqo6/bUWxJVQe+aNre6yZRF+EJCJup5c
	yZtR/wqwWPY9t0W8tLzkmddXUf5BukgD0QoLTZZJAYE7Pr/CdZQNVJAVaEwtnvzHWnmFRwaLFzR
	MMzzxUUtrK/QGNOkpz9K41hQcNOdNZkhur1zsSs5iCvB+1NFeujazTKtlkC6eaJXw==
X-Received: by 2002:a05:7300:4312:b0:304:df8b:71ee with SMTP id 5a478bee46e88-30c84b1dbbcmr12292872eec.7.1782646988746;
        Sun, 28 Jun 2026 04:43:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:43:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 28 Jun 2026 21:42:01 +1000
Subject: [PATCH v2 3/7] ASoC: apple: mca: Factor out mca_be_get_fe
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-apple-audio-redux-v2-3-6328269c9652@gmail.com>
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=REpmn+M8Rvg8rCc/PyDy1GQ+HmZDWk2NZCuZF0g/gWU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHLu3iM1S3lZr7xHo42+pUz716bXMPUuecYs08d9mm
 DFFZuPfjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFS/nMXw34/1OM+S6kXzI44nrH1wzS5Wv3+NVF9WSFMEAzcnU8aBBwz/s+P/pJb
 t/Rv30+DV9sWT51f8CH34Mu7wXz7D+AcusSdTGQE=
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
index feaf60a4912f..730ffe0805e1 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -721,30 +721,35 @@ static bool mca_be_clk_started(struct mca_cluster *cl)
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
2.54.0

