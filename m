Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F532D97BA
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028693; cv=none; b=VHB4wpysWwJQG+y6Bswqbi1l0G/xNoViy5ZEkgBR2H2SSjp2CrPVwszkvKutyN34c66ciEm1zVZ/0kqGKkjnjrghoGZd7DRraZpLWlCzUH9S5fjvP+UZh+gOJYzzS0Gexc2TN3ZhhtzhXslecWmCMrHMngnytGlm/ZNc1xdzCKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028693; c=relaxed/simple;
	bh=Km52EVNDvQaSKwDMYVVG/cG2sOqJGio6RIBlU/DT6nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icaYINKemUhANHUS+A9yidhNZHUud9LyeKUqhWRRhDkCrHf0U5eCOiJKjIkBWyqOS9VTOh+p+vKj7xDRH9qCnmXREg8SJlVJX1DrHKmc15x7kGb53hcKPUEAA2jbHBrYW4zGH9Szm6n/Bqd/vy/DIOFvdpQ1w8LRaFxVslblpKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fg1NLXca; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fg1NLXca"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so25006005ad.1
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028690; x=1792633490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmTMAPFx5up6qhPC8f6eIWZ+fqRc0pF4DtGB7TtfWew=;
        b=Fg1NLXca0VxVEBzRgyhLVWlNQgTIaJWJfzSiJoYSzmdYLo/7kgJKOGhw4gPgJ1RaRl
         86lzomUwX9fOhSyGw5Q/qlP0YMfKt/USHT5WRByY3+KNNG1G/EAZI6Zzy+OJ+/hjBw6h
         75HRlPuuDfcuJnMg6Tl2HK5xw8/vHygeIaQMMpcS7T/Qrz57bL/H3Xgl+NvCFjGhRxU1
         9BuIJ/oVZWcQwkzJqpMJWigXDL00Qq/LMh/Y924+/vs/FK66IH57pyRtKcWElOCA/PSP
         RlMM+KZTtNXfGtTWfQaB3YEIGGbuh8i/eBNXuyInnlKsIgGKuEPj7/ZVkXhO+wJGs26b
         hvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028690; x=1792633490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmTMAPFx5up6qhPC8f6eIWZ+fqRc0pF4DtGB7TtfWew=;
        b=HB4E4UHvdhfc35Whyq5Z9zBwCxoDRahWQ6q+sYQgMvbsQ/16tyiMu5fqLbB0AvINnm
         Qc4E3S/NZZGcowpIwnMUh0umCEUjnQZrTymBw8q1ReU6/Sl5AuMt3iK4mG/mWOZFxv5q
         pP+Ih3cwimpk67/HtB73ZXB10LGNT+19Zu0b6oFMbj1N934e0dfywVYc8BP7A61yeyxs
         a1O0sFKqe+qmaULfjiGMjXSBeySrZ3I3yQqp3slorkDqwvMu8OOCLH9+rVTy9ZdCf9I5
         bou7KyG8h9Etx7WzIzqQESm9qPvk+1qBvMGFIeXBe2aMBHZPro1VsRyjVj4pdBUHrufJ
         3YKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwViSccz28mQYW0IUFzTlwXV36zRutY3j0AXz2C6VcmZZcIDzKaiVzK1GE9/0T/pbAQNX8xOw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIoHOlvWzzKPPqf3DPK74rwBc7r5DRS2MWvavugFDBTW5fRswZx
	zpwy9XW+1y0OZ9L5LWnu6MxIp8QhzeE3F9/VTN6FWmqfXcE8APqq1j4L
X-Gm-Gg: AYBFou0N07YCAAVSGwHwlPSSEwSa4lrFQQFTWVAnk92KloVuzG27mypKekKBB19tmDp
	3OQe0XjTRf0VMDrO/R93DUwUtm8p/CVDHvyJKPZR9tzWLc2yTAn9UntqNzF7Rqmb0p4zbyZ0Bhp
	QDi52u+L8vZX2vP77S4/v1DDP+7XP1cqjddqcGHyWQF9pB7fqHkIiuY0RTimIvBnvJsG0HoQzvh
	8Q72BQ+uvKkp1hM9krPi+4HzvMq75gvb2vSlCIKL9U7aRluz7JsVT98/q+NulcuYAxUWFICG0JN
	TZMduw54Kv9dqTJAXVfNZ7D8T+Q8ocpltf5vo61r5AexdDOk4lO5ZFiCzbz3uMqm7NOqY0WQg2q
	m3LukgH5PR7y0lm2JfAmYDeIBZOOHQmHoSxTZuSYB+lFpmrWtHNTebHqejYEW2waHr8bRB/SYiV
	EyjN7jDBdd4e+VCeLnYws7NdO9E3Kg8qlaeXi9HWqyvs9PnIARj4y+B7ctIevTlueAK+ainGbSg
	3sDxjxVuVGsyjB/fFZvm6W8iPqV1cU+e/cHh5xvvOjyMDpJ3eNHtV9HAix2bGF8hN6Vg34sgQSV
	lbgjkf75OuuwkA==
X-Received: by 2002:a17:903:3295:b0:2e8:dd9c:99e0 with SMTP id d9443c01a7336-2e8dd9ca60cmr47644535ad.40.1792028690053;
        Wed, 14 Oct 2026 18:44:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:44:49 -0700 (PDT)
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
Subject: [PATCH v2 02/25] ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:01 +0700
Message-ID: <20261015014324.5569-3-phucduc.bui@gmail.com>
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
from acp63_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 5137305662ef ("ASoC: amd: add acp6.2 pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 04c014349347..12c341e89bce 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,7 +211,13 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
 	runtime->private_data = pdm_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp63_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

