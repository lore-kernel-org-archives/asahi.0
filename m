Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B676123
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 15:33:17 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1677252795; bh=FNC6kTd6Z6n+zN6leJIOos4elgBgrZXAAOuIqFvhYUs=;
	h=From:To:Cc:Subject:Date;
	b=kH/TERxBETkz5SQRy/I6aJG4HrBNKpNvVhyYy2/SApa1r7qVGO8CKPOi0NtrKdgdK
	 qVcyGffZTorEc3HsQWZnLIZDqdFj8fluDyIPvtHzD+pK8ZtIxw45SPqFmKyuJEM5pn
	 R/chzDUc7u81R+uFsei6GAZT4kAD214iYUwJ8eRU=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: apple: mca: Fix final status read on SERDES reset
Date: Fri, 24 Feb 2023 16:33:00 +0100
Message-Id: <20230224153302.45365-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From within the early trigger we are doing a reset of the SERDES unit,
but the final status read is on a bad address. Add the missing SERDES
unit offset in calculation of the address.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/mca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 24381c42eb54..9cceeb259952 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -210,7 +210,7 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   SERDES_CONF_SOME_RST);
 		readl_relaxed(cl->base + serdes_conf);
 		mca_modify(cl, serdes_conf, SERDES_STATUS_RST, 0);
-		WARN_ON(readl_relaxed(cl->base + REG_SERDES_STATUS) &
+		WARN_ON(readl_relaxed(cl->base + serdes_unit + REG_SERDES_STATUS) &
 			SERDES_STATUS_RST);
 		break;
 	default:
-- 
2.33.0

