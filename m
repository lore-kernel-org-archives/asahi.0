Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE382773D
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 04:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123276; cv=none; b=T09e1ZvxctDTgveYkQK4tpOLUfcGr3uSfXunURtWGzIsZaDXiuDIq2NcnXr4uqCKROb1bOtdDJluC8S+CaW5i3PNVQ+AFRFsoRu59d/VQJFSwkxXKLnApIuZb1b38o9ufPATJJbHhLBE41+d+y6jm/UcMcNk9fupd2yJwGs5TO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123276; c=relaxed/simple;
	bh=kz6hWgoXjwzN/plzsOuupJpm8SEQMOhxfOMvvFLoLo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UH1dw2xQbny+0uCdZ0FY73oW62W0oy9pIzQqALxylKLVULHED+SHL13/S/4s0m7yakeMXQLiQ5ONYYpPIr8ye2WCNrqPjX/oZ9B9SV+XvPaWj3fO9OlVGwUqx7fOb6hgIRDBDsuIVc7zG1Qh2UqeGYe6niW9GP0vuAJe98Alulg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uf7ZuTb5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uf7ZuTb5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e87c66e556so3167075ad.0
        for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 21:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123274; x=1792728074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Qhe5E4dgThyJhSYyDtuQ9hNBBoGOWOTPXhOMe7iZzE=;
        b=Uf7ZuTb5zPeSyCCa03pPlazy+Gna2r728f0vGxp5EW4AzEF6DY6GJHH2vME92CT0wO
         RJE9+eVXYaEkz9EoheUY+AUwXEBYv5h7gVTIl3Qhryb1i6qpmPYuecip25NvElpO0vfy
         qida+1hgfeUdpfMDCzW7SaHFGnfGkzEV0VC4EuLBpC8zsUrT7UvBJdqyRai41XyFH9DE
         xL1ycD7y+Q4uzGV3mDGutIHkK7QVAX+vD8Wxd6RJEXQ+lpIP2QNW06qjfhcFhbejGBSj
         Q6iMm6PdZUUfwBsvwc97GWAr36Gx3K8cw+18tx6p/EWZPvhQskDFOsceL+br8AFOQW/s
         mkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123274; x=1792728074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Qhe5E4dgThyJhSYyDtuQ9hNBBoGOWOTPXhOMe7iZzE=;
        b=qUG94g0+Xle4R+utX+e8mDHXdAjnf9kALlMMuEkrkUOCi5krPesQDs9FRtEDjAvyHb
         ingu31xg2aHZuQW8OiGLsAQMwaNgR4/pMnaqQT6H0BqAkK/v+eAzQ2GJ5ajb/rAXj/d1
         4HvULZY2Udz7UCQQq8KUPU+2wJns7VQB/apHNHMfpZCjuOWRlzsyiAlmu3FPNIit9s3M
         7uHZSq/SxGNjkP0+hE5IdtweH7BSgVLQD9Tm898/cdxtk+Due/2TzFKhc3Xek1LGdGLV
         qjyi00hFF8Hf/cJS8i0RWtuEgJJaCHRpNvHkbSF4KtH4V+QmgI/Ak5c5iOtcA2cXHIb5
         u3rg==
X-Forwarded-Encrypted: i=1; AKwUvBwRYdiA0AB0KGq4qtHrDKLGNLmTjYOwA+jF/t4V+zpkPTYF50fqHP/aTcVJ6QGNXRdqwj98MA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKwVY7d0H/ovs5JCHK5pJOqHFDVMx/oMgDXpLOxmK3JT1wuAS7G
	neMKIErMowj7qyIuWWTOZ/ES2EAsaXYBZD1r8nZl9UBKuU/tMiSX5fC/
X-Gm-Gg: AYBFou3TxjtG6KaG2eXFXJl/9IPYYYRC9Y1hwkjgpiX+4hGxZ240Vgg1npL32w9jbFS
	X44y+yd9MLARc+QthaXG4Wmm+qDfUQBPAdtiVNhgH8UmCd5TXBBDqGwlz54IkdYtDvkyuQ/Vaz5
	agOJx7QGAi+GtIAkyXsVd8oKcZ2UHczy3aAMPyf8ZWqjRXQDDqexfH4F8hmSb2D1g5MTv9wC+/x
	a/PaUtNLuPKtPZCfh45g2WK/yWWqTfuxWXd28pv5/SxDuzHWO9/vXbppdeJyzVj4lm64mBvZM9d
	DQOBQ3jOBuW2P4pNZ/BndcoJQthESI1xIs2mWBbXqVVZkhkbllfwCEep4lFARdaebEc1CC0Gnw3
	bJE3hMsE0wpbZL6PbJJVZLYpWq2DO1k3Phrv6BXmFcln7AuPOujaQTMU5DtOH7xlE9qlrk3a+wZ
	s6O1AJHst9LNRp7La0wU5rV3xV3nqXvkHhz9diwxTmCbjw7wSzDV5uMB0SZvRDc5WxSyMUmjjb3
	K0K6MGb2dqem7HVzXpLmCchX3KE6aVSYIp9VKDMU83ssG+SL6DlMz7HsyBSmMUCKAXtyNewRVlk
	HjozFpz7W4Yqogo=
X-Received: by 2002:a17:90b:39a4:b0:3ac:b764:8521 with SMTP id 98e67ed59e1d1-3acbb9255ccmr1718768a91.38.1792123274359;
        Thu, 15 Oct 2026 21:01:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4872861sm2304450a91.7.2026.10.15.21.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:01:13 -0700 (PDT)
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
Subject: [PATCH v2 25/25] ASoC: rockchip: rockchip_max98090: Mark the link as started on success
Date: Fri, 16 Oct 2026 11:00:48 +0700
Message-ID: <20261016040048.506531-1-phucduc.bui@gmail.com>
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
from rk_aif1_startup(). ASoC only marks the DAI link as started
when .startup() returns 0.

This currently has no functional impact, as there is no .shutdown()
callback in the relevant snd_soc_ops. Still, return 0 explicitly on
success to match what ASoC expects and ensure the DAI link is correctly
marked as started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_max98090.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 426506a8e18e..de392b420ebd 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -191,12 +191,23 @@ static int rk_aif1_hw_params(struct snd_pcm_substream *substream,
 
 static int rk_aif1_startup(struct snd_pcm_substream *substream)
 {
+	int ret;
 	/*
 	 * Set period size to 240 because pl330 has issue
 	 * dealing with larger period in stress testing.
 	 */
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-			SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 240, 240);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					   240, 240);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI link as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI link is correctly marked as started.
+	 */
+	return 0;
 }
 
 static const struct snd_soc_ops rk_aif1_ops = {
-- 
2.43.0

