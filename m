Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D88F801
	for <asahi@lists.linux.dev>; Tue, 27 Sep 2022 11:35:07 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1664278499; bh=E6uzsBYVZvDKj1HzGMPEUTFj/LsUV+qoai7hTKUpGS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TdnRyzkTL3T68jSbosljBlber57jYv7P01BI8UvAXOC/timh4FZIMdsfcRwDjUkoW
	 uiLpHwrOe5hrIhtZD0QT2MtkDQl0eSgop2twqhkwRi1Chq3aYOcwpmY2Jp1BQ26N08
	 aeHZf/OjIVEdY9CBrfyJX2ZSatY6bPwumdHRtAX8=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH 2/3] ASoC: apple: mca: Remove stale release of DMA channels
Date: Tue, 27 Sep 2022 13:34:25 +0200
Message-Id: <20220927113426.49724-2-povik+lin@cutebit.org>
In-Reply-To: <20220927113426.49724-1-povik+lin@cutebit.org>
References: <20220927113426.49724-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The commit 4ec8179c212f ("ASoC: apple: mca: Postpone requesting of DMA
channels") shuffled around with the requesting and releasing of DMA
channels. It left behind stale release calls from within
apple_mca_release, remove those now.

Fixes: 4ec8179c212f ("ASoC: apple: mca: Postpone requesting of DMA channels")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/mca.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 75925bfcf754..7ca653987b78 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -970,18 +970,11 @@ static const struct snd_soc_component_driver mca_component = {
 
 static void apple_mca_release(struct mca_data *mca)
 {
-	int i, stream;
+	int i;
 
 	for (i = 0; i < mca->nclusters; i++) {
 		struct mca_cluster *cl = &mca->clusters[i];
 
-		for_each_pcm_streams(stream) {
-			if (IS_ERR_OR_NULL(cl->dma_chans[stream]))
-				continue;
-
-			dma_release_channel(cl->dma_chans[stream]);
-		}
-
 		if (!IS_ERR_OR_NULL(cl->clk_parent))
 			clk_put(cl->clk_parent);
 
-- 
2.33.0

