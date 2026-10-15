Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B90E2F39B5
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028747; cv=none; b=qS5knO9/V2S/oRCgj2txpwwm8DDcwG3REbOKsDAcm7vFyB7TahqR2z5BFFkmkiaqXNXJxypHy7heuuD6ed5Ut/UOOvhJFuM/TBbWEEYBM1Qij1QGa/A28Ybz0CN3OCfG83lg+MXjB2dqLZXle06gNRpuaLuNlBY2D4YwPpAOTdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028747; c=relaxed/simple;
	bh=Qod46+lJKzs2otcbuUwfMMYT23zkjG47R07TZKGmCbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcbKcNN8EvK8jnJxaqy8NbW7DAfdUmCE0t4TveX0O4I8vXFAuJ5mC0QmB3VDEO+DAPNLiZG+N2qdoRWPLbRklnGHnde+vN0Y/ehJYZxm8+cmLBmW35Fgix6MgmXeA+wggjvjpno6xdSGAV6pQWTRLIcolECc8oOGryz/tDCfQUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c49tDD2G; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c49tDD2G"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e7e742a2c7so32165935ad.0
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028745; x=1792633545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/n4smlFZhMXZJQElrsN5vEKX5hOiO4PseO+WVYrBqMc=;
        b=c49tDD2GaPVGlaCCXe679ndhofhmNkRkONYFLdPOPsprzXN6qr1SZ3IUdMnowEQ76/
         S3KFuYrAJaS1lkguyLqlkaJUDz9xsYDHyLOwhSZgIHFSbufI5cfcV1KUSPQ/hS+i4EXn
         Qg0jOVZQML9QbeBFhuI8k7atkdEoFm/llJYfLM8UAdMaDE1BJdCdnIkv/tc8lW2If5d8
         mP61pA+Pqae6TYOAIEDwkSDc8QBX2xngyMfVrDrQSmut3JfhcQ7q80JE2J3J5wJeBs+V
         Xk+lW4qY0BE9LEoXDdOBVYhJsbxQXiS93oTdC36UDMIVze3Un9cBx8kHiONfcB2L13GS
         O1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028746; x=1792633546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/n4smlFZhMXZJQElrsN5vEKX5hOiO4PseO+WVYrBqMc=;
        b=MfIHfva2sPxm01fHH8Tf6pjeppMvdrt6r5zGFgVIHYck6d2xxDwxiUllxzRZce0YVE
         j4FYsXA2mzm8yobikCLGXu8qoz21eXWF0LTKIdbmqvD2E9FdRm7526eyJIOf7UQRl7MC
         5UbA3g3PllfpE8zNFpwtIQliwfSM5+VJLsIy4DClZwzXR8lQOjVOMNAveXKDqbRs2iuW
         3mpGn4W7mWr93fbh3KcgPCZaGIMvF0knzjzjiaTVMtihqB7rWOTeZ+zppbXWbhmRmq2N
         TV2sYYuJtc9YTzzPEMzOTHPPLUea8XMxs0vTrq8l7otf9ym4rbQd3YW1i5RYxI41A+v0
         VGqg==
X-Forwarded-Encrypted: i=1; AKwUvBxy34B4IsxKcvu8emtet8isAZT4LpNJQaDr0GHL8LX5o3/mMEZ+nW2pANDJt4v55Qb9d9h6Cw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKJK5Gxz4kWaIBmuYrb7CI+R3j2W5GGATHfUu9kE5TV+pk2p+yb
	b7QzVtTV24FoRrwZ6zunUYL0ZTHt1cNJ5arChlX+j+bgJ1cuua8J+dET
X-Gm-Gg: AYBFou0JkF9h4MbOIXR2a7bwJX/4ecCb1DsjMHcKt/V9ASq8YXyA+IBjpdSJ958drby
	gSJW2yyOSIO0ygo8eIJorgSEiIfc/LCExdnZ8R0iAIKmDMyH5NYvrhsW19jECIwWMBCe5MYjhif
	a/OnLZkOK2hb7Vb8+dSWgpeaqnRAgIfiR0OSMQB5bKebtYse3iJI1JU5EtziAMlOwh8wrGL5ifR
	0c0gdwaTS+OyYQ3890GctxG/L0O9Nd4Cw+XpkCn8z46ZNc/E2lpmY+kDeTQMfz957cA/PqspSr4
	XIDbVdyx16e4R5Bek1rbvrvdfndQxGDUUVVqR7YnxCl7e4huNs0zOApZJ8UmVb0QtxDmA02TbpD
	88ir0z4EBTZU9MnAigh7zrr1pHZDsVNwBg8vUF/JZNVAyD/hQcU49OU+TIWW1pE8ay0dKGIngJG
	wrVxy1TNsR8/2Wih/BC3QRQHC98YcR2eW3BmuPfNTRkFMJMp87Ge0e4RPUeyyjMLF4NIf42tG1B
	up8jKQEQH/w79EwpMIyP0tVTf+INdKrZGtnb85sR2JG3aBX1UY4qHcwiBqaJdS7lssnVH5FEiTt
	9IccWk7SE8Fr1g==
X-Received: by 2002:a17:903:1b70:b0:2e6:e9a:eb48 with SMTP id d9443c01a7336-2e842f2d257mr110492185ad.41.1792028745495;
        Wed, 14 Oct 2026 18:45:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:45 -0700 (PDT)
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
Subject: [PATCH v2 06/25] ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:05 +0700
Message-ID: <20261015014324.5569-7-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp5x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: cab396d8b22c ("ASoC: amd: add ACP5x pcm dma driver ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 831e30e9b042..72050fa2de80 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -231,7 +231,13 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	}
 	i2s_data->acp5x_base = adata->acp5x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp5x_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

