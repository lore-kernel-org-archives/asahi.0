Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF043243964
	for <asahi@lists.linux.dev>; Sat, 11 Jul 2026 01:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732324; cv=none; b=WYWtoB2bPe7widJBOMFTmRPRUuBRjuQWYqDyYYRRcnjAeufQvIZvmkHuxFExE2ie/VtvHMRL1vcIcu5Swm3rducRGHNm1P9vA9Jw18ec2il5sMlxacdO5fFQf5OLZqZWWS9SJNoTQXLx3C2rAUmWE50rqxsSlJuyU5eOxv/42ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732324; c=relaxed/simple;
	bh=hsiZfdFeQ2D+g5v0NXSz07lWdCQawXUkZPcmZz11vVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkDCIU7iKgv31W9VogoFPQSiQ8DiTRgyMFDotfRFITfxkeytBxBEkN7eykkcnXJqFL5GcDKNfwI+ikHCbyyGy2jRbnmWy9/kYTJrR/57dv2tUd6eFeqlsY/6Bm+SqIqnDDN8+H2JSC6lkW6XO4ucMkGOp2vLec3wbUfuA+d7DDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUGOOFt5; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUGOOFt5"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-848643382fcso1498708b3a.1
        for <asahi@lists.linux.dev>; Fri, 10 Jul 2026 18:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732322; x=1784337122; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWXvW/d32rE+ZsswBcpmlmtcJ/j0K/HsxgukixLnv5k=;
        b=PUGOOFt5YLwIbkhu0MWM9gLB1ZB/YHd0K5jq0HpvsvnRvRYJ0LMhCbLLbiEGyUWFAy
         CHi+GWKYJu9r2nRFTOkLRRcymgr0CLOvIuWtY00D3g3w5t0sGNqqUaBlpFg+fs2o+apN
         8gpZzvzgzeUg+0n6Q1so/0h9Z9UbQIC+f7+9dLFgbWN3LeVrUQGAsXBGMQI22jRQztNn
         xSs9NmzzQSElEOcOHjOTaxLnD4JuMeZgwimpgIc6NNvFI1B2V4Hpk0anGWEE0LM5DIaa
         qFtjL8COOt4Gu+06JlsouKVdEMkfZtiIOqCYxF0byz6kVSd+t5jWfoRTfn2PNS+ND8AV
         Y/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732322; x=1784337122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWXvW/d32rE+ZsswBcpmlmtcJ/j0K/HsxgukixLnv5k=;
        b=POOoKpXlwzKXwneCDwcqkNd10s5uDWcGj+fYMwJV526OttrFGDJwKsEip21q/T2kyT
         6HPyIZc91upmj748cg0g9eQTV8spgbd5kgwv1dra3B/BWLJcI3REYoo2wOaBmKmBZMnQ
         ojejwVhc8BrA8euqdnnmYInrRaQhrvkXEYX28OT207AoZ1VsXGNBMZ32KeYPqF24UwuH
         RLoZkER/bHWElPCLxcRHddN4IeuEl6oFosn1xv6XRYU1S0nsAePMomsNTt7K7vZF9vaj
         cWEli6C1n6wD5rPK/Lnl5ExTIEF0CjWRxBMbirFZ2Rk6bDOYkQY0oaOg3XVtdDF4K0+E
         0lyw==
X-Gm-Message-State: AOJu0YxcyooTArBN9RzNkzTAdffxihFrnhE6t5qaDf2xq5pvTViehzwP
	Iu7OG4Yt8GvnrLAOZ8x2OR+peDxIXmlkShkLLeWaerJO+kN87q0pm3A+
X-Gm-Gg: AfdE7cnfOGhXeggvff+CrmN+3m0kUMTjCz8wQ4Pf5p5m427hFwXJ0wzaoi2x0XuzBww
	NzE/JqG7nytCS7aYB2iEVNUkglta2jD0pESUaeiEnDzropIuy3aPIYpEbAY3410ptS7AGbKP6yH
	BcojIWB3+Rs7VaGouwBlp+rccFG+zZdYs7AWl90cJj54Jd46xMcY882EdzUdccQE6uF3qvKj7FP
	c9I7fEevUiOF2s5Ny1rmeNZMDa+Jy6niNg3V+9jQcKzmamlBFdEpw8jmm/hyWXID+l2XPFN4d2m
	FCueIJFNxEwKA01oZZpWQJ9+CoC553x87KhBWLGyiyiuxYBtoASOISvXMkSUIC2gHooiHHp1SmF
	M8x/EuiRSZg/JN23zH7Fj2PC9gNXHilYS8r4yEvTcCX+jRCdKjrbI6RYEXxVrqAO9DMSkdd3hmy
	uRz7tduRSZ/oeHf5NoOUEPaI50hd1m0gewyA/XzaDkMQ6dX87b2F27B9N2rlR7f8jCOqtJV9i0A
	s7UMvyx7ivPlhTnp43tnY7XNZMuxsvWFcnEPgcwkGrkHbBJ3q1ZtpLYd9366QVgPQ==
X-Received: by 2002:a05:6a00:9515:b0:848:79aa:5d37 with SMTP id d2e1a72fcca58-8488976f68dmr1100276b3a.55.1783732322210;
        Fri, 10 Jul 2026 18:12:02 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:12:01 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 11 Jul 2026 11:11:22 +1000
Subject: [PATCH v4 4/7] ASoC: apple: mca: Support FEs being clock consumers
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260711-apple-audio-redux-v4-4-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6641;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HGFc7Bs6efxQPRt87AL1RvM9nIpRzzqEdF6rtxgMhd0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM7ynHHDRPixw0uOYp4HGJd//MyfP5xGeaHHa8eqPu
 rd7m6andExkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb6y25Ghun+n6Kv6+qc9G0rsD+y6Ifpl5c34iJesUyMWXFGc8XzlVcZ/sfPj1/
 1+73mCk/+JotdT8zrmDY8UPvPLCM4fWWopu++VWwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Support FEs being I2S clock consumers. This does not mean we support
accepting clocks from outside the SoC (although it paves the way for
that support in the future), but it means multiple FEs can attach to one
BE, one being clock producer and the rest clock consumers.

This is useful for grabbing I/V sense data on some machines, since in
such a scenario the format of the sense data on the I2S bus differs
from that of the audio data (the two formats differing in slot width).
With two FEs attached to the bus, we can split the responsibilities and
command different slot widths to the two.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 124 ++++++++++++++++++++-----
 1 file changed, 103 insertions(+), 21 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 1e9a5c9cfc54..92c9f8df50d6 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -133,12 +133,17 @@ struct mca_cluster {
 	struct clk *clk_parent;
 	struct dma_chan *dma_chans[SNDRV_PCM_STREAM_LAST + 1];
 
+	bool clk_provider;
+
 	bool port_clk_started[SNDRV_PCM_STREAM_LAST + 1];
 	int port_clk_driver; /* The cluster driving this cluster's port */
 
 	bool clocks_in_use[SNDRV_PCM_STREAM_LAST + 1];
 	struct device_link *pd_link;
 
+	/* In case of clock consumer FE */
+	int syncgen_in_use;
+
 	unsigned int bclk_ratio;
 
 	/* Masks etc. picked up via the set_tdm_slot method */
@@ -256,11 +261,32 @@ static int mca_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static int mca_fe_get_port(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *be;
+	struct snd_soc_dpcm *dpcm;
+
+	be = NULL;
+	for_each_dpcm_be(fe, substream->stream, dpcm) {
+		be = dpcm->be;
+		break;
+	}
+
+	if (!be)
+		return -EINVAL;
+
+	return mca_dai_to_cluster(snd_soc_rtd_to_cpu(be, 0))->no;
+}
+
 static int mca_fe_enable_clocks(struct mca_cluster *cl)
 {
 	struct mca_data *mca = cl->host;
 	int ret;
 
+	if (!cl->clk_provider)
+		return -EINVAL;
+
 	ret = clk_prepare_enable(cl->clk_parent);
 	if (ret) {
 		dev_err(mca->dev,
@@ -332,7 +358,7 @@ static int mca_be_prepare(struct snd_pcm_substream *substream,
 	int ret;
 
 	if (cl->port_clk_driver < 0)
-		return -EINVAL;
+		return 0;
 
 	fe_cl = &mca->clusters[cl->port_clk_driver];
 
@@ -380,6 +406,56 @@ static int mca_be_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int mca_fe_prepare(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_data *mca = cl->host;
+
+	if (cl->clk_provider)
+		return 0;
+
+	/* Turn on the cluster power domain if not already in use */
+	if (!cl->syncgen_in_use) {
+		int port = mca_fe_get_port(substream);
+
+		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
+					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+		if (!cl->pd_link) {
+			dev_err(mca->dev,
+				"cluster %d: unable to prop-up power domain\n", cl->no);
+			return -EINVAL;
+		}
+
+		mca_modify(cl, REG_SYNCGEN_MCLK_SEL, SYNCGEN_MCLK_SEL, BIT(port));
+		mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN,
+			   SYNCGEN_STATUS_EN);
+	}
+	cl->syncgen_in_use |= 1 << substream->stream;
+
+	return 0;
+}
+
+static int mca_fe_hw_free(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+
+	if (cl->clk_provider)
+		return 0;
+
+	cl->syncgen_in_use &= ~(1 << substream->stream);
+	if (cl->syncgen_in_use)
+		return 0;
+
+	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN, 0);
+	if (cl->pd_link)
+		device_link_del(cl->pd_link);
+
+	return 0;
+}
+
 static unsigned int mca_crop_mask(unsigned int mask, int nchans)
 {
 	while (hweight32(mask) > nchans)
@@ -505,9 +581,18 @@ static int mca_fe_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	u32 serdes_conf = 0;
 	u32 bitstart;
 
-	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) !=
-	    SND_SOC_DAIFMT_BP_FP)
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
+		cl->clk_provider = true;
+		break;
+
+	case SND_SOC_DAIFMT_BC_FC:
+		cl->clk_provider = false;
+		break;
+
+	default:
 		goto err;
+	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -564,24 +649,6 @@ static int mca_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 	return 0;
 }
 
-static int mca_fe_get_port(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_pcm_runtime *be;
-	struct snd_soc_dpcm *dpcm;
-
-	be = NULL;
-	for_each_dpcm_be(fe, substream->stream, dpcm) {
-		be = dpcm->be;
-		break;
-	}
-
-	if (!be)
-		return -EINVAL;
-
-	return mca_dai_to_cluster(snd_soc_rtd_to_cpu(be, 0))->no;
-}
-
 static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
 			    struct snd_soc_dai *dai)
@@ -706,6 +773,8 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
 	.set_tdm_slot = mca_fe_set_tdm_slot,
 	.hw_params = mca_fe_hw_params,
 	.trigger = mca_fe_trigger,
+	.prepare = mca_fe_prepare,
+	.hw_free = mca_fe_hw_free,
 };
 
 /*
@@ -759,6 +828,9 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 			   PORT_ENABLES_TX_DATA);
 	}
 
+	if (!fe_cl->clk_provider)
+		return 0;
+
 	if (mca_be_clk_started(cl)) {
 		/*
 		 * Port is already started in the other direction.
@@ -791,14 +863,24 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 static void mca_be_shutdown(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = mca_be_get_fe(be, substream->stream);
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_cluster *fe_cl;
 	struct mca_data *mca = cl->host;
 
+	if (!fe)
+		return;
+	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		mca_modify(cl, REG_PORT_ENABLES, PORT_ENABLES_TX_DATA, 0);
 		writel_relaxed(0, cl->base + REG_PORT_DATA_SEL);
 	}
 
+	if (!fe_cl->clk_provider)
+		return;
+
 	cl->port_clk_started[substream->stream] = false;
 	if (!mca_be_clk_started(cl)) {
 		/*

-- 
2.55.0

