Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A183A4510
	for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782646995; cv=none; b=N6kvNJoG8rHAqB3XWmsqRkiFgLoT829O2WhmkJrcc7GzDVnPzMn5ZO0S8mxoYAVT2iB1U3DRilHgQ2u2nXI9QgkIrtWFd5mrymM2s/fDl4hurFmICFj0GSgJcUKYOMo4lE98GtmNZc03cf+8gOirSslRtYrLSONhPxmcYlDdqxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782646995; c=relaxed/simple;
	bh=t7aoUaJxfsVvQFJoK5hKCqJyMhJ/bDVM7YSVPvM0U1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ch6uYds2n8Dx9qli0zVpggmIsoOmCwGxMpCcpU/AfeKKbBE6aVZc+UtLXaNgG4ulOzh3+HxKdLH16etR7rB0FVo6ezX4CloVtXC15BzMHtou752qRSpqUyM+G/o2EMaLdBLLbJHqgk5ADhNbbOkWQ7xrWWBs0OFGtLgmpCoGQU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahjYzbie; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahjYzbie"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30ec1ddd510so413787eec.1
        for <asahi@lists.linux.dev>; Sun, 28 Jun 2026 04:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782646993; x=1783251793; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrEcIvpeWD1g+ER74NGZPVAod8E0xTvaR9IdiN+NeLg=;
        b=ahjYzbiew5rVTwvwciTawqXt4w7SMFu4exgnJXyISsEfmxYx6pyInThHCwyuq4XDZT
         VaKou66MvP5Bl0bPlndDx2LxtZ5DG/IkLxUdxVcDbyEQhwETKaBsgo//CXS2xVKHYaHT
         P8cScgWt9fGzahujGs156+qpo4TV+A4VmX5MIWO89K0BgHadi7YSaZqERnB22HZkGD9V
         bARQ6FCem9egcBnPT4/jq/N3zsIwFsMuoEssvaf+JGoqn436ZtbmZnEIfrmuJrea5C3Z
         e+XgeDcbkRhQXG8JQV5GWfCu+1rbKj7V4ZTtkv56wbd1cdMtTy/AnbEOo1DzumNE7qcN
         92iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782646993; x=1783251793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MrEcIvpeWD1g+ER74NGZPVAod8E0xTvaR9IdiN+NeLg=;
        b=rbX6aJWBFfm6Kw2vNQqbTVWYiFBvcsIUkFtaD4Q+wCIGRIC9FUdhDYVOIKzReXOFI1
         wzzeCLZpdvLx1eT2iMPd5nh28VbhWK1LVoDk9LbIsCAD1LvGx2de4h93xJboXYH3lVmk
         /iNDm82IeQKcCd5N+kC9OjqJ1009sPZ88qa5ZipMgngKuvZ+DxAbWCULF6Nq0fRPoXVK
         8pKSpk05OTQInaa4SfZHD/s5SfH04AMtab51EDWD4GCYCf/GQ/sBy0fpyH18BwWcSBBS
         ZdkJr+Ya391GCSlpihL/XDGp5i++NN4Apd+jsnfbRLWfHrXBYfv2/RE8htcUFLenTCtE
         0syw==
X-Gm-Message-State: AOJu0Yz/6zw8VjPWXjg9HZnjX55CaS2E7jCWtP6O6y07RAy+Tjb9dE23
	Sz27qro2BvVxRGGJPYWbpcZKW86omDPymZcMxEHuWqunisyFqgOUqCDX
X-Gm-Gg: AfdE7ck0ILYvEKKN/FOLDtNuov5siAEuvklIXjEwQzR12Tt/3jkBQfZduaAvayXgpT3
	jl/HiVYHm4De8MTSMuQ8ptJoC3VpNHa3CiAImx1kbpFKc1m/In2B/McIYW0ltxzxDDNcGHyVZuO
	yXa1Qk+943XSKEFliMLvzFV6Q8xONYKyoqy8uqQpaZxjw5Oty5ppJFfxbeiEWK+sut8VHkmsOZ8
	k/JcXNCJIkTE/+NiFTinQMbiY0mPUsIYkuavDAp2UP8ovhWTOPl8ATvMYYcaDpWkgpfTcdt4tQO
	KENKgyTIted8agxgtARmSL/WUQ1qJfog3UhLN3Vvjm9aUI0oUUbVZsRDxyRlqFfWmfGIUYc1dcr
	VmzeapNfiAe244B8dGx7yt9LIVrwhN6yKxo8tKg9Vy+njVfgjdRwZmMK5y4jX0+AgS2KxiDXA/J
	Rl7ca4YjT/HkfvsZiIQb6n8KG8VnbkANvp71EdV7H91YzxkMOlyJXsNuiLpYtLnkb4qT+XKdpLz
	a/TJw72TZeKeoiYC01NpHlFCOVP177aPAlW6aFYBjC5Me6miNh9RxWtvqcQqMs/7g==
X-Received: by 2002:a05:693c:3105:b0:30c:ab4f:46a9 with SMTP id 5a478bee46e88-30cab4f4865mr7052976eec.45.1782646992755;
        Sun, 28 Jun 2026 04:43:12 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a80sm34520756eec.18.2026.06.28.04.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 04:43:12 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 28 Jun 2026 21:42:02 +1000
Subject: [PATCH v2 4/7] ASoC: apple: mca: Support FEs being clock consumers
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-apple-audio-redux-v2-4-6328269c9652@gmail.com>
References: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
In-Reply-To: <20260628-apple-audio-redux-v2-0-6328269c9652@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7238;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QMNhG3UKUqvsnSrZgtmMZtDR7Plr31Uf39KarryXXHU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmOHLsNlp19IPf5gsx3z9l6ydOnTiiwLeyo/GRu4s2ea
 n/bf2Zwx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKo1bjP8U2z1mvFSpzFKpyYloX3Csh3tGXGMiRu11JtbV2ptXaYYzPCL6fHXuRs
 UhWyfn5/66/0B1sqKQ+81Rdilil5u9P5udcCNEwA=
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
 sound/soc/apple/mca.c | 129 ++++++++++++++++++++-----
 1 file changed, 106 insertions(+), 23 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 730ffe0805e1..0c1fc8242907 100644
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
 
@@ -360,7 +386,7 @@ static int mca_be_hw_free(struct snd_pcm_substream *substream,
 	struct mca_data *mca = cl->host;
 	struct mca_cluster *fe_cl;
 
-	if (cl->port_driver < 0)
+	if (cl->port_clk_driver < 0)
 		return -EINVAL;
 
 	/*
@@ -368,7 +394,7 @@ static int mca_be_hw_free(struct snd_pcm_substream *substream,
 	 * belong to the same PCM, accesses should have been
 	 * synchronized at ASoC level.
 	 */
-	fe_cl = &mca->clusters[cl->port_driver];
+	fe_cl = &mca->clusters[cl->port_clk_driver];
 	if (!mca_fe_clocks_in_use(fe_cl))
 		return 0; /* Nothing to do */
 
@@ -380,6 +406,57 @@ static int mca_be_hw_free(struct snd_pcm_substream *substream,
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
+		writel_relaxed(port + 6 + 1,
+			       cl->base + REG_SYNCGEN_MCLK_SEL);
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
@@ -505,9 +582,18 @@ static int mca_fe_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
@@ -564,24 +650,6 @@ static int mca_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
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
@@ -706,6 +774,8 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
 	.set_tdm_slot = mca_fe_set_tdm_slot,
 	.hw_params = mca_fe_hw_params,
 	.trigger = mca_fe_trigger,
+	.prepare = mca_fe_prepare,
+	.hw_free = mca_fe_hw_free,
 };
 
 /*
@@ -759,6 +829,9 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 			   PORT_ENABLES_TX_DATA);
 	}
 
+	if (!fe_cl->clk_provider)
+		return 0;
+
 	if (mca_be_clk_started(cl)) {
 		/*
 		 * Port is already started in the other direction.
@@ -791,14 +864,24 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
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
2.54.0

