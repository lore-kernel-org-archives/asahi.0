Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C984D3D6E
	for <asahi@lists.linux.dev>; Thu, 15 Sep 2022 09:45:39 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1663235137; bh=RYvMqhdnzL8RPlR9TpcOtA7UqSXk+T+8HMSs+nwHUT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cFhRzEkoYwohnQsDEnr6aUWMfMKipUR8Feq3jxl40+gC6PjMguEAK/PFnqbft3/oI
	 mcqLjLhoX/Ls1umQzkw5gT9hVnfudMaW/qAmIBI0UZYz0EvpNjWP9MIOnJQbCkg3Bd
	 bbZ21Kxxj2ZGj/XdWbnvZRH1jQmdqWO2TVpOAggU=
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Matt Flax <flatmax@flatmax.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	- <patches@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH v2 10/11] ASoC: cs42l42: Implement 'set_bclk_ratio'
Date: Thu, 15 Sep 2022 11:44:43 +0200
Message-Id: <20220915094444.11434-11-povik+lin@cutebit.org>
In-Reply-To: <20220915094444.11434-1-povik+lin@cutebit.org>
References: <20220915094444.11434-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver wants to know the bit rate on the serial bus and takes that
to be the value set by 'set_sysclk'. The 'set_bclk_ratio' op is a better
fit for figuring out the clocking parameters of the serial bus, so
implement that and give it precedence over the prior methods.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/cs42l42.c | 17 ++++++++++++++++-
 sound/soc/codecs/cs42l42.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index c1d7eb12b0ba..05995ed1d3f5 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -898,7 +898,10 @@ static int cs42l42_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	cs42l42->srate = params_rate(params);
 
-	if (cs42l42->sclk) {
+	if (cs42l42->bclk_ratio) {
+		/* machine driver has set the BCLK/samp-rate ratio */
+		bclk = cs42l42->bclk_ratio * params_rate(params);
+	} else if (cs42l42->sclk) {
 		/* machine driver has set the SCLK */
 		bclk = cs42l42->sclk;
 	} else {
@@ -984,6 +987,17 @@ static int cs42l42_set_sysclk(struct snd_soc_dai *dai,
 	return -EINVAL;
 }
 
+static int cs42l42_set_bclk_ratio(struct snd_soc_dai *dai,
+				unsigned int bclk_ratio)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
+
+	cs42l42->bclk_ratio = bclk_ratio;
+
+	return 0;
+}
+
 static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	struct snd_soc_component *component = dai->component;
@@ -1087,6 +1101,7 @@ static const struct snd_soc_dai_ops cs42l42_ops = {
 	.hw_params	= cs42l42_pcm_hw_params,
 	.set_fmt	= cs42l42_set_dai_fmt,
 	.set_sysclk	= cs42l42_set_sysclk,
+	.set_bclk_ratio	= cs42l42_set_bclk_ratio,
 	.mute_stream	= cs42l42_mute_stream,
 };
 
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index bc51bb09da5c..a72136664112 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -35,6 +35,7 @@ struct  cs42l42_private {
 	int irq;
 	int pll_config;
 	u32 sclk;
+	u32 bclk_ratio;
 	u32 srate;
 	u8 plug_state;
 	u8 hs_type;
-- 
2.33.0

