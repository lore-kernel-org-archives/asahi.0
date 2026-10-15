Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C772C325C
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028842; cv=none; b=G0o9PfvNth4MV8N3oD8HqUzusBRHM5f6RvWFyk/8eR9lZkChui3aNcVj7IKhwYQUWX0otRqxJB+dzZPzXKGcFZZDXqxaKZeCfenVP/HKuriHu+vjeTNxGycMOBHACbYdnylcqCNRqFF++qSWfQ04m10ADchMFd+1patFiDB73kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028842; c=relaxed/simple;
	bh=HfPat1LNwNEOWJNqkwPd57O97NdzuN6vi5OJFTBpI7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RleURfE5GfwaYq1uaHzcKfaNfwU/PM24UbdKddXQkDDoTpMplHjYsNSJXWN/V16Q5GbVZHMys9btpBwt1usbkDg3ATkq3UOR8WqW+aSL4mRHY2lyyT1HyP7XXYZBwqOfSxm3ZxIU4NPm0T8/0UIsajs3ceTgnAyX+T9NCS99wCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjudPQsH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjudPQsH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so25403125ad.1
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028841; x=1792633641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sl+xZe1w/+ufceVKXDka/4tzEgH/pdjCTIAX9h5M0vo=;
        b=CjudPQsH8+6vXfeCKm0Um5XsJdIZFqngAh3iTYGnyZLgGRhuJVC5/D1s4M4uh5kzh1
         ntAocGND4AO7hVYi0lpyFir5Re3iAItY9/jgD5OjU/grCbohuylktrLlKlEMAHNdMBbK
         kDSUp6lMO9QDRpL8gsael6v1QMJW2YMgHgn8w2sK1rj0qOlwnzN4KRjC1dVwIRbPuuGV
         BIbThtdwSnygD0LJPoaWE5zS0WS8lcTk/btMVAQ+IWe/n4j1UIPvlR0SV77wEeiuLMzl
         +cCwaTyXhJNXEVNuGKB0Fw86gB8NM5zwDkC8BHduEeFKPmcqVhWNDDr+6kMsSoFVR6Dk
         l0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028841; x=1792633641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sl+xZe1w/+ufceVKXDka/4tzEgH/pdjCTIAX9h5M0vo=;
        b=lIBsCvRAGS36uOY1M8B7RUfebctmf749b+DVLXoxFJK1AhxlGxZMXpfUyZTkDRbBAH
         1v0rdyBvDr83XKwV9hVDufnM8/pnUnq4zw/0iEtPQppJ4FnTLEGGZ7FUxrl/RwXQU1ez
         VqDla2hnakMBh1JY9XrdjX9GTJSAfjF65RlbXbY9C3o/i24xXXTyq1//lP8q6mdCCDbj
         2tKtj3/eYxmJH5fjdxmD5DRkiYVUY7R6kPXxJYepQo6O/UnhCseNMwAKWMT3D+NbZ6p8
         ZT97ggBwX53HCvlo2OQURyGF3Kw3zZLAgvxXHIBJTUU49ONkKYuD0GvmqrGa5KVIC/Sz
         +A7A==
X-Forwarded-Encrypted: i=1; AKwUvBxLVSO2mHW4eHyLKgiCgva1zXkRVUFd+ZAyHANnMmUmuRcMLKDloUc6VeslAcD8ODvXt19PLQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJbv+ZwBoBhckqbMqf+/NmGqSfWSaQR5LGXnm96ImiG0UONur+/
	sPBKpg8Pbr/gT5iMVe54UvlHqb1iquL/5cneZHQcISGRAMVWzdeprhwc
X-Gm-Gg: AYBFou2R/UMxB2xzTx5zFJzvmWNwBQQvnERmArJRuR0T6Lq+G8/M1Ng5Wme0qY0lGJX
	FmQcUE4LwduAnKmhLz2SPkVn51IVOWxfNqrsusjUBrlFhXII2NaazwaqGTCZ7enPiFgzqkIXclJ
	Nn51oWDNDN8kJDAdUI28QrLmgtzeUWHJmQHi++ZIEO3JdEfT3UNj/Eo5UdU+/4Pet46xROfOz4k
	3sxiwHDqWqqv+vimbNhTz0wFgrEqdL6FbF6zPovTi/j65Zn8RWRQu04FiUY5QLMgtrtgTNnzjCA
	U5S/coLYp0B29aE/U5Sh0UD0skb5guLpH5HwPa54t/kUhYj5tfXorIEHtZ+dQl9Ysj7hY+d2Vgc
	J/LtdwvqTN3R+MEbeu/yK5We1v3vLexdhsW1fr2rSq300N7+ves2Yki0UNzv89dc+lR62DTbscg
	ae/vNJNoIIhSU6x94W37KhRsCOnJSSqW2QC4cWKFQ6jLfKcFabsTtCaMW8KLXNjy23RskfOAP7e
	yFmdJXG9LfWZwlf5CeNra21UnDdCEl6o+jhr7wjaHOfE3wVaEe2cBjyfx8qZJmPf/CnQ+h4om2h
	GTSpvYIKtqgT5w==
X-Received: by 2002:a17:902:f54a:b0:2e9:628d:e9c1 with SMTP id d9443c01a7336-2e9628df363mr1150385ad.26.1792028840848;
        Wed, 14 Oct 2026 18:47:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:47:19 -0700 (PDT)
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
Subject: [PATCH v2 12/25] ASoC: codecs: nau8540: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:11 +0700
Message-ID: <20261015014324.5569-13-phucduc.bui@gmail.com>
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
from nau8540_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8540_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8540.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index d4211a76b096..09e7f31a904d 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -419,14 +419,24 @@ static int nau8540_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8540 *nau8540 = snd_soc_component_get_drvdata(component);
 	const struct nau8540_osr_attr *osr;
+	int ret;
 
 	osr = nau8540_get_osr(nau8540);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_ADC_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_ADC_MAX / osr->osr);
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
 
 static int nau8540_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

