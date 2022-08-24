Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD29D1870
	for <asahi@lists.linux.dev>; Wed, 24 Aug 2022 16:07:28 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1661357240; bh=aO38GJDIP/5aJG6S0vIu2Re6vO0yDujEU8aBKTpUOoc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bxm61ZEynvpzn8cGD8yFgOWSblB7WYZYp8swzU6lksYgeFKL2Psl7tZMrQrQOgrEo
	 o3qi86pna0Z+tnErdiyTmXsRMS6yaSjPN4brbS0SN8OLPzluwbGpU2uGRLSkfoeim0
	 6HGwKNyD5af9aDowtXFhKbnpOaCQnNKr6itIwkgM=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] ASoC: apple: mca: Add locking
Date: Wed, 24 Aug 2022 18:07:15 +0200
Message-Id: <20220824160715.95779-5-povik+lin@cutebit.org>
In-Reply-To: <20220824160715.95779-1-povik+lin@cutebit.org>
References: <20220824160715.95779-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In DAI ops, accesses to the native cluster (of the DAI), and to data of
clusters related to it by a DPCM frontend-backend link, should have
been synchronized by the 'pcm_mutex' lock at ASoC level.

What is not covered are the 'port_driver' accesses on foreign clusters
to which the current cluster has no a priori relation, so fill in
locking for that. (This should only matter in bizarre configurations of
sharing one MCA peripheral between ASoC cards.)

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/mca.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 807b85469408..aa67d57c9a9b 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -158,6 +158,9 @@ struct mca_data {
 	struct reset_control *rstc;
 	struct device_link *pd_link;
 
+	/* Mutex for accessing port_driver of foreign clusters */
+	struct mutex port_mutex;
+
 	int nclusters;
 	struct mca_cluster clusters[];
 };
@@ -296,16 +299,21 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 	struct mca_cluster *be_cl;
 	int stream, i;
 
+	mutex_lock(&mca->port_mutex);
 	for (i = 0; i < mca->nclusters; i++) {
 		be_cl = &mca->clusters[i];
 
 		if (be_cl->port_driver != cl->no)
 			continue;
 
-		for_each_pcm_streams(stream)
-			if (be_cl->clocks_in_use[stream])
+		for_each_pcm_streams(stream) {
+			if (be_cl->clocks_in_use[stream]) {
+				mutex_unlock(&mca->port_mutex);
 				return true;
+			}
+		}
 	}
+	mutex_unlock(&mca->port_mutex);
 	return false;
 }
 
@@ -349,6 +357,11 @@ static int mca_be_hw_free(struct snd_pcm_substream *substream,
 	if (cl->port_driver < 0)
 		return -EINVAL;
 
+	/*
+	 * We are operating on a foreign cluster here, but since we
+	 * belong to the same PCM, accesses should have been
+	 * synchronized at ASoC level.
+	 */
 	fe_cl = &mca->clusters[cl->port_driver];
 	if (!mca_fe_clocks_in_use(fe_cl))
 		return 0; /* Nothing to do */
@@ -721,7 +734,9 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 		       cl->base + REG_PORT_CLOCK_SEL);
 	writel_relaxed(PORT_DATA_SEL_TXA(fe_cl->no),
 		       cl->base + REG_PORT_DATA_SEL);
+	mutex_lock(&mca->port_mutex);
 	cl->port_driver = fe_cl->no;
+	mutex_unlock(&mca->port_mutex);
 	cl->port_started[substream->stream] = true;
 
 	return 0;
@@ -731,6 +746,7 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_data *mca = cl->host;
 
 	cl->port_started[substream->stream] = false;
 
@@ -741,7 +757,9 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 		 */
 		writel_relaxed(0, cl->base + REG_PORT_ENABLES);
 		writel_relaxed(0, cl->base + REG_PORT_DATA_SEL);
+		mutex_lock(&mca->port_mutex);
 		cl->port_driver = -1;
+		mutex_unlock(&mca->port_mutex);
 	}
 }
 
@@ -962,6 +980,7 @@ static int apple_mca_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	mca->dev = &pdev->dev;
 	mca->nclusters = nclusters;
+	mutex_init(&mca->port_mutex);
 	platform_set_drvdata(pdev, mca);
 	clusters = mca->clusters;
 
-- 
2.33.0

