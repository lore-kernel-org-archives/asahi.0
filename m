Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07E8610E
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 15:33:17 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1677252795; bh=+kyfNHJb1YUWgssduOtt+KjIRL6xvmqOGLr82KEtgl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GWnPLTv6eKrOX4bcSNlgD9Mb7givR36pFAi7Gfi9KoVsZN70u7rXMBFrRzGOPVMwr
	 jiceOeT+ToeMqjK1nGqWPppC36U+e9WjwjaoqY+A34rKdKjgkQcdU6/IrG25pJy6yr
	 4C8AjVoSeljoGitTwMFFiwThJXThpbDnVlzjZfW4=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: apple: mca: Fix SERDES reset sequence
Date: Fri, 24 Feb 2023 16:33:01 +0100
Message-Id: <20230224153302.45365-2-povik+lin@cutebit.org>
In-Reply-To: <20230224153302.45365-1-povik+lin@cutebit.org>
References: <20230224153302.45365-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the reset sequence of reads and writes that we invoke from within
the early trigger. It looks like there never was a SERDES_CONF_SOME_RST
bit that should be involved in the reset sequence, and its presence in
the driver code is a mistake from earlier.

Instead, the reset sequence should go as follows: We should switch the
the SERDES unit's SYNC_SEL mux to the value of 7 (so outside the range
of 1...6 representing cluster's SYNCGEN units), then raise the RST bit
in SERDES_STATUS and wait for it to clear.

Properly resetting the SERDES unit fixes frame desynchronization hazard
in case of long frames (longer than 4 used slots). The desynchronization
manifests itself by rotating the PCM channels.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/apple/mca.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 9cceeb259952..aea08c7b2ee8 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -101,7 +101,6 @@
 #define SERDES_CONF_UNK3	BIT(14)
 #define SERDES_CONF_NO_DATA_FEEDBACK	BIT(15)
 #define SERDES_CONF_SYNC_SEL	GENMASK(18, 16)
-#define SERDES_CONF_SOME_RST	BIT(19)
 #define REG_TX_SERDES_BITSTART	0x08
 #define REG_RX_SERDES_BITSTART	0x0c
 #define REG_TX_SERDES_SLOTMASK	0x0c
@@ -203,15 +202,24 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
+			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
+		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
+			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 7));
 		mca_modify(cl, serdes_unit + REG_SERDES_STATUS,
 			   SERDES_STATUS_EN | SERDES_STATUS_RST,
 			   SERDES_STATUS_RST);
-		mca_modify(cl, serdes_conf, SERDES_CONF_SOME_RST,
-			   SERDES_CONF_SOME_RST);
-		readl_relaxed(cl->base + serdes_conf);
-		mca_modify(cl, serdes_conf, SERDES_STATUS_RST, 0);
+		/*
+		 * Experiments suggest that it takes at most ~1 us
+		 * for the bit to clear, so wait 2 us for good measure.
+		 */
+		udelay(2);
 		WARN_ON(readl_relaxed(cl->base + serdes_unit + REG_SERDES_STATUS) &
 			SERDES_STATUS_RST);
+		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
+			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
+		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
+			   FIELD_PREP(SERDES_CONF_SYNC_SEL, cl->no + 1));
 		break;
 	default:
 		break;
-- 
2.33.0

