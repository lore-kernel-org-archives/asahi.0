Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F336C321F
	for <asahi@lists.linux.dev>; Thu, 25 Aug 2022 14:02:53 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1661436171; bh=k4JY6gIRcC+FC13JFoBjpofoYgJ49CT9VL+rB5MoeWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WGTOf7S4c+SoeUUUcqErZTjpI0ULWQGgn7XDtYBYDqUOmswbmAhpPQxv3b7/v5B2L
	 l6cODorEj2q1wJ6UvpO2O1abdISoeV1yXguMNrw6Zie2FJyLc54nr5t5Z89jKiu8Xm
	 x3QfKElNGJkbgq75Fvor2eiyqK/lH8ntyIFTMzxo=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: navada@ti.com,
	shenghao-ding@ti.com,
	asyrus@ti.com,
	raphael-xu@ti.com,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Stephen Kitt <steve@sk2.org>,
	Dan Murphy <dmurphy@ti.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH 1/5] ASoC: tas2764: Allow mono streams
Date: Thu, 25 Aug 2022 16:02:37 +0200
Message-Id: <20220825140241.53963-2-povik+lin@cutebit.org>
In-Reply-To: <20220825140241.53963-1-povik+lin@cutebit.org>
References: <20220825140241.53963-1-povik+lin@cutebit.org>
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

(This mirrors commit bf54d97a835d ("ASoC: tas2770: Allow mono streams")
which was a fix to the tas2770 driver.)

Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 846d9d3ecc9d..0df5d975c3c9 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -485,7 +485,7 @@ static struct snd_soc_dai_driver tas2764_dai_driver[] = {
 		.id = 0,
 		.playback = {
 			.stream_name    = "ASI1 Playback",
-			.channels_min   = 2,
+			.channels_min   = 1,
 			.channels_max   = 2,
 			.rates      = TAS2764_RATES,
 			.formats    = TAS2764_FORMATS,
-- 
2.33.0

