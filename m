Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773A53C20
	for <asahi@lists.linux.dev>; Mon,  8 Aug 2022 14:21:19 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1659968029; bh=Fm6Vba/6+QU/ozbeHX3SBdqTd1u/vXS5xt2ra8/hbQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i9JupiQV2QeN9T4EKz8VtX70/98gICqnMnKLpeKAgrbZX41+oFiF15k+2I+keXcwp
	 0qvNxH5gkC1WByC6ghMhR9U+d7FhzocQnl7u07xBz0pepFYu/9xuf2p1nLd696073/
	 MPrvpBye7PmZYdCJuZqxTYKDEtvRxgn6aHCu/bqU=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Stephen Kitt <steve@sk2.org>,
	Frank Shi <shifu0704@thundersoft.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH 2/4] ASoC: tas2770: Allow mono streams
Date: Mon,  8 Aug 2022 16:12:44 +0200
Message-Id: <20220808141246.5749-3-povik+lin@cutebit.org>
In-Reply-To: <20220808141246.5749-1-povik+lin@cutebit.org>
References: <20220808141246.5749-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The part is a mono speaker amp, but it can do downmix and switch between
left and right channel, so the right channel range is 1 to 2.

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 10b64d5ba756..db446db88df5 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -507,7 +507,7 @@ static struct snd_soc_dai_driver tas2770_dai_driver[] = {
 		.id = 0,
 		.playback = {
 			.stream_name    = "ASI1 Playback",
-			.channels_min   = 2,
+			.channels_min   = 1,
 			.channels_max   = 2,
 			.rates      = TAS2770_RATES,
 			.formats    = TAS2770_FORMATS,
-- 
2.33.0

