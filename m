Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB1B46AB
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 13:54:48 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1662731679; bh=wQ6gFpgaheXkQG5O+w8BcmO70ntpKXeJcMOFxz0cQhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=clWEAI06jkFStRcuwd8cUXB9hBJ7JLu6dKwoGCyN9xn4ljLQwCBQIPJszq4VSdXvf
	 Pv1jdYCc5AlRQVfoCOqBetcZH++1mNhDehxXf+0bN8MqcAvA/rqSD1w+VGoh5yU6w7
	 DpVpVCigQyN/9S512LZszclhRgyY/4BfnALrCISc=
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Matt Flax <flatmax@flatmax.com>,
	- <patches@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH 06/10] ASoC: cs42l42: Pass component and dai defs into common probe
Date: Fri,  9 Sep 2022 15:53:30 +0200
Message-Id: <20220909135334.98220-7-povik+lin@cutebit.org>
In-Reply-To: <20220909135334.98220-1-povik+lin@cutebit.org>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Richard Fitzgerald <rf@opensource.cirrus.com>

Pass pointers to snd_soc_component_driver and snd_soc_dai_driver
objects into cs42l42_common_probe().

This is in preparation for adding SoundWire support.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/cs42l42.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2efec8cce089..bffe0347bec0 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -579,7 +579,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 	return 0;
 }
 
-static const struct snd_soc_component_driver soc_component_dev_cs42l42 = {
+static const struct snd_soc_component_driver cs42l42_soc_component = {
 	.set_jack		= cs42l42_set_jack,
 	.dapm_widgets		= cs42l42_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(cs42l42_dapm_widgets),
@@ -2219,7 +2219,9 @@ static int __maybe_unused cs42l42_i2c_resume(struct device *dev)
 	return 0;
 }
 
-static int cs42l42_common_probe(struct cs42l42_private *cs42l42)
+static int cs42l42_common_probe(struct cs42l42_private *cs42l42,
+				const struct snd_soc_component_driver *component_drv,
+				struct snd_soc_dai_driver *dai)
 {
 	int ret, i;
 
@@ -2277,9 +2279,7 @@ static int cs42l42_common_probe(struct cs42l42_private *cs42l42)
 	}
 
 	/* Register codec now so it can EPROBE_DEFER */
-	ret = devm_snd_soc_register_component(cs42l42->dev,
-					      &soc_component_dev_cs42l42,
-					      &cs42l42_dai, 1);
+	ret = devm_snd_soc_register_component(cs42l42->dev, component_drv, dai, 1);
 	if (ret < 0)
 		goto err;
 
@@ -2415,7 +2415,7 @@ static int cs42l42_i2c_probe(struct i2c_client *i2c_client)
 	cs42l42->regmap = regmap;
 	cs42l42->irq = i2c_client->irq;
 
-	ret = cs42l42_common_probe(cs42l42);
+	ret = cs42l42_common_probe(cs42l42, &cs42l42_soc_component, &cs42l42_dai);
 	if (ret)
 		return ret;
 
-- 
2.33.0

