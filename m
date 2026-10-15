Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA5F367B6D
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028889; cv=none; b=cctoAmNaMUrfVBHW4B5TxZeTGyQXqb7PMgB0thZavqLUzH6MO1B5D/KRuw5TkX1v+5BGxEbSvZXl2W6LAQgI0xZMiRE64eD4IRmSMMOol3X/Otffa+pDWkkpCUulPBtOG47mjta/Lg+0uDIPj/2+px+cdGkmUDyPJPn3XHi9NNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028889; c=relaxed/simple;
	bh=h+aUqaPj9vowNjoKv8XZBklyZfSSufgTE4gL6idJtRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y7/Yf2uPNV3TS2afDTITu2wIlybqciIfPBUgJpRkyS08xQ11en6LMkoCXAerhv/gImDzgf9NjDU7LEfw011UDfxXFKM6FBFPpa3p9Uw4egwGeM20+Nb7UDC2AXt8rQkhtM+GkAzqr/AAjB0J1HL91rKdsgIv9kfmqhNk0iPXUvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pWKtBiyQ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pWKtBiyQ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so25405475ad.1
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028887; x=1792633687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8bdFAa8/cOYz7HxAYkPZAcubK8qZlAfIypauJAM7ak=;
        b=pWKtBiyQ23YWDomGNL5PcGW9wdh4yclUPF+47vg0Noswwe3l7EWX6vcpE4Z4u7CCUt
         o+Cc9ULa5C8WQR9ECC/5JJW/FTFzXD7tqFLRdrZOJa/4TxwO7JBjRMs/x+2uOWvbhpu+
         22mtClJv+jy9DhbPrMsY2Jf+5V4EIT4bOC38cwW2Li5bpgQzhTLVE9vo/ZK+6mjWQnFu
         aO5BuDc/reIJSOeZEygi/QNhq/S3XdChoFfNEIstSeSYHOJWfWRpaQ22HlhGK524RVYs
         v7/4VGt25eXYAE6BS7TkkBlngYFPH9m0/ftxTbng/C+WkmpDcEJYzPFoLDX4llJ0xdth
         ysIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028887; x=1792633687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8bdFAa8/cOYz7HxAYkPZAcubK8qZlAfIypauJAM7ak=;
        b=lqw12FvxMUSb5oB0Yirv3286KNvncbijE8oZFg9uVAvZjiamLQLi310ciK69zKEVz6
         +LT7L835mVvi7aMa9/aCCE24dDPVkIAO95R1rJAlbsgmQ6f7jCBfOSr2mNL9nC+j99Z1
         cCZEZyU3El/Gxrvt0fCmRVTSl8cal8pmFkdrS+9wI7MZKuEUl/jOeFgrHwFqYE9lgTvb
         Tt6XKj2HqH+HuRfHxttMSYQuwqoFIFPVo2GtiEQyyt+02Utz3R03UmzZJpjhZrF4MtDC
         apHCnzv5bbhQA+W7PNWZtQUPAMh+5BrYzF5x0QXbFkHpGdFHzXcVW6a6Eu6Z9Nq4squg
         i91w==
X-Forwarded-Encrypted: i=1; AKwUvBySCbTdPSOLmZZZ0SEU3Pz+Qabagor4M6eyYBWSq2p0GSkd2nqxiGjD1ssDir/xj15uVe+SeQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLPf+Mk/YytbJyJvfrkkruIdam+KBtrscGaR5gPF9lCv2o5BRm7
	AseBmcG66se9MJxMVjNJ9CXNuKDtW1cD6ZsgCQJEA/k36ZQjOG+XF5he
X-Gm-Gg: AYBFou0qf1KPm/iW90Mg9z1UhDLXdRLQPb/oIB/Y2g9fZvj1T8surDuv0Geg4KYsMQh
	NiKPjqt+jdwgXgdRBz9JccptZJo3/xFXAZLuy6QBBtwp9mV573NUA55xfh23MMdpRK7R1hvVmlp
	Fedc35KnFZ5GnQwYSLi8yZsWnz6k7AogD+UvgqsC2VA0l6X6APNHBRwmbIO832TzSIPNLsFigsL
	No6tafxgiEBF/WD9pQ9sLN2BlD4QiuzDgYD1xkHg13JP0DBW5sqAOVndv5v8pIsVddivRDcP18I
	he7eadMBOs3ilF8KU/STDv3v6SMdeef37e9ZYfswQprVIoqouT5LH+25XIkk22gdWFGvTltPWFl
	TfmBlRin0gyFNChIdsNqPnOIRMK+vzUaenk3IE65wHgh9hCswQSFp6yg4QnBIVj41Law+R6W1dj
	9yUzr3cO6E4/+iQ0b1+LbgcCzaFL1MIpMyTBQ0t8oAepp+P+HcNzPuYWv+wXjpJNmJNAKacKcsu
	yInL2dx6ogxq1C9xDx5DeUCO0IX7E2Wzf4LVrRhsM+bulAhoponYXeHaQOr/BqwZmNp/IhDfwm7
	MLqqCtAywx1PgQ==
X-Received: by 2002:a17:903:15c7:b0:2e6:1a6c:abd4 with SMTP id d9443c01a7336-2e84280e026mr162256675ad.2.1792028887036;
        Wed, 14 Oct 2026 18:48:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:48:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 15/25] ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:14 +0700
Message-ID: <20261015014324.5569-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from nau8825_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8825_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8825.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 63d927f31409..af2a49c893d3 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1261,14 +1261,24 @@ static int nau8825_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
 	const struct nau8825_osr_attr *osr;
+	int ret;
 
 	osr = nau8825_get_osr(nau8825, substream->stream);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_DA_AD_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_DA_AD_MAX / osr->osr);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int nau8825_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

