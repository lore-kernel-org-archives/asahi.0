Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2C3EA3
	for <asahi@lists.linux.dev>; Thu, 30 Jun 2022 08:01:40 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1656575507; bh=eEIoKEIH6CDyyJWt1u7O3b+HGPU69jp+HAw3cMUYB+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GjbiNUb2eN0ljLQxq9pGKvw32SB1tDL09fgVUE4Xl8vzlRiPlAf/Kvis4diocTtGE
	 FJFyAYiQe4kkCV+Oobi6II2+i2QVU3EIWnVfE7chjY/yLnbrSloVlLfmvR85K/bM+s
	 iGLxIuk++28FzYkeuZQWnHdIVtI4hxQK03ZFzgPs=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hector Martin <marcan@marcan.st>,
	Stephen Kitt <steve@sk2.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Dan Murphy <dmurphy@ti.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH 2/4] ASoC: tas2764: Fix and extend FSYNC polarity handling
Date: Thu, 30 Jun 2022 09:51:33 +0200
Message-Id: <20220630075135.2221-2-povik+lin@cutebit.org>
In-Reply-To: <20220630075135.2221-1-povik+lin@cutebit.org>
References: <20220630075135.2221-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix setting of FSYNC polarity in case of LEFT_J and DSP_A/B formats.
Do NOT set the SCFG field as was previously done, because that is not
correct and is also in conflict with the "ASI1 Source" control which
sets the same SCFG field!

Also add support for explicit polarity inversion.

Fixes: 827ed8a0fa50 ("ASoC: tas2764: Add the driver for the TAS2764")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2764.c | 30 +++++++++++++++++-------------
 sound/soc/codecs/tas2764.h |  6 ++----
 2 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 039bf1900880..0143a55cd33c 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -135,7 +135,8 @@ static const char * const tas2764_ASI1_src[] = {
 };
 
 static SOC_ENUM_SINGLE_DECL(
-	tas2764_ASI1_src_enum, TAS2764_TDM_CFG2, 4, tas2764_ASI1_src);
+	tas2764_ASI1_src_enum, TAS2764_TDM_CFG2, TAS2764_TDM_CFG2_SCFG_SHIFT,
+	tas2764_ASI1_src);
 
 static const struct snd_kcontrol_new tas2764_asi1_mux =
 	SOC_DAPM_ENUM("ASI1 Source", tas2764_ASI1_src_enum);
@@ -333,20 +334,22 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
-	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
-	int iface;
+	u8 tdm_rx_start_slot = 0, asi_cfg_0 = 0, asi_cfg_1 = 0;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_IF:
+		asi_cfg_0 ^= TAS2764_TDM_CFG0_FRAME_START;
+		fallthrough;
 	case SND_SOC_DAIFMT_NB_NF:
 		asi_cfg_1 = TAS2764_TDM_CFG1_RX_RISING;
 		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		asi_cfg_0 ^= TAS2764_TDM_CFG0_FRAME_START;
+		fallthrough;
 	case SND_SOC_DAIFMT_IB_NF:
 		asi_cfg_1 = TAS2764_TDM_CFG1_RX_FALLING;
 		break;
-	default:
-		dev_err(tas2764->dev, "ASI format Inverse is not found\n");
-		return -EINVAL;
 	}
 
 	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG1,
@@ -357,13 +360,13 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
+		asi_cfg_0 ^= TAS2764_TDM_CFG0_FRAME_START;
+		fallthrough;
 	case SND_SOC_DAIFMT_DSP_A:
-		iface = TAS2764_TDM_CFG2_SCFG_I2S;
 		tdm_rx_start_slot = 1;
 		break;
 	case SND_SOC_DAIFMT_DSP_B:
 	case SND_SOC_DAIFMT_LEFT_J:
-		iface = TAS2764_TDM_CFG2_SCFG_LEFT_J;
 		tdm_rx_start_slot = 0;
 		break;
 	default:
@@ -372,14 +375,15 @@ static int tas2764_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG1,
-					    TAS2764_TDM_CFG1_MASK,
-					    (tdm_rx_start_slot << TAS2764_TDM_CFG1_51_SHIFT));
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG0,
+					    TAS2764_TDM_CFG0_FRAME_START,
+					    asi_cfg_0);
 	if (ret < 0)
 		return ret;
 
-	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG2,
-					    TAS2764_TDM_CFG2_SCFG_MASK, iface);
+	ret = snd_soc_component_update_bits(component, TAS2764_TDM_CFG1,
+					    TAS2764_TDM_CFG1_MASK,
+					    (tdm_rx_start_slot << TAS2764_TDM_CFG1_51_SHIFT));
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index 67d6fd903c42..f015f22a083b 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -47,6 +47,7 @@
 #define TAS2764_TDM_CFG0_MASK		GENMASK(3, 1)
 #define TAS2764_TDM_CFG0_44_1_48KHZ	BIT(3)
 #define TAS2764_TDM_CFG0_88_2_96KHZ	(BIT(3) | BIT(1))
+#define TAS2764_TDM_CFG0_FRAME_START	BIT(0)
 
 /* TDM Configuration Reg1 */
 #define TAS2764_TDM_CFG1		TAS2764_REG(0X0, 0x09)
@@ -66,10 +67,7 @@
 #define TAS2764_TDM_CFG2_RXS_16BITS	0x0
 #define TAS2764_TDM_CFG2_RXS_24BITS	BIT(0)
 #define TAS2764_TDM_CFG2_RXS_32BITS	BIT(1)
-#define TAS2764_TDM_CFG2_SCFG_MASK	GENMASK(5, 4)
-#define TAS2764_TDM_CFG2_SCFG_I2S	0x0
-#define TAS2764_TDM_CFG2_SCFG_LEFT_J	BIT(4)
-#define TAS2764_TDM_CFG2_SCFG_RIGHT_J	BIT(5)
+#define TAS2764_TDM_CFG2_SCFG_SHIFT	4
 
 /* TDM Configuration Reg3 */
 #define TAS2764_TDM_CFG3		TAS2764_REG(0X0, 0x0c)
-- 
2.33.0

