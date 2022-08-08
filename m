Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0A13C15
	for <asahi@lists.linux.dev>; Mon,  8 Aug 2022 14:21:19 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1659968029; bh=odD+Lb+pa0FPCQEPZICIcBt216AndpEzsCiglXQnk/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OGE7d3z2O8XJcQmoM5601IiE2Xiju0oxCBly/qlfwnFY8j5zXzb3CXklNCjrPsFyF
	 ZzCK3r0P7R4iCmu3IENMVP5V3BNaTAKV81/fXGQGMfXlgK9K4qVH+ByupYIBToJczY
	 o38yTQKeCAMJ6atW62jIifEl6412rVq7UzcIB6WM=
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
Subject: [PATCH 3/4] ASoC: tas2770: Drop conflicting set_bias_level power setting
Date: Mon,  8 Aug 2022 16:12:45 +0200
Message-Id: <20220808141246.5749-4-povik+lin@cutebit.org>
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

The driver is setting the PWR_CTRL field in both the set_bias_level
callback and on DAPM events of the DAC widget (and also in the
mute_stream method). Drop the set_bias_level callback altogether as the
power setting it does is in conflict with the other code paths.

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2770.c | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index db446db88df5..10a79f8139be 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -46,38 +46,6 @@ static void tas2770_reset(struct tas2770_priv *tas2770)
 	usleep_range(1000, 2000);
 }
 
-static int tas2770_set_bias_level(struct snd_soc_component *component,
-				 enum snd_soc_bias_level level)
-{
-	struct tas2770_priv *tas2770 =
-			snd_soc_component_get_drvdata(component);
-
-	switch (level) {
-	case SND_SOC_BIAS_ON:
-		snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-					      TAS2770_PWR_CTRL_MASK,
-					      TAS2770_PWR_CTRL_ACTIVE);
-		break;
-	case SND_SOC_BIAS_STANDBY:
-	case SND_SOC_BIAS_PREPARE:
-		snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-					      TAS2770_PWR_CTRL_MASK,
-					      TAS2770_PWR_CTRL_MUTE);
-		break;
-	case SND_SOC_BIAS_OFF:
-		snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-					      TAS2770_PWR_CTRL_MASK,
-					      TAS2770_PWR_CTRL_SHUTDOWN);
-		break;
-
-	default:
-		dev_err(tas2770->dev, "wrong power level setting %d\n", level);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 #ifdef CONFIG_PM
 static int tas2770_codec_suspend(struct snd_soc_component *component)
 {
@@ -555,7 +523,6 @@ static const struct snd_soc_component_driver soc_component_driver_tas2770 = {
 	.probe			= tas2770_codec_probe,
 	.suspend		= tas2770_codec_suspend,
 	.resume			= tas2770_codec_resume,
-	.set_bias_level = tas2770_set_bias_level,
 	.controls		= tas2770_snd_controls,
 	.num_controls		= ARRAY_SIZE(tas2770_snd_controls),
 	.dapm_widgets		= tas2770_dapm_widgets,
-- 
2.33.0

