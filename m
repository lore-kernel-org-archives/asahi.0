Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E325B0A4
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028904; cv=none; b=mXUO8x2rXZGxCta4vqEzbUdqa3w6Oy8qT/LhvxC3DoBUB/GkkUVMOgO8yJkd2U4B8F2OxbOzcXzwSVZGDHZ4DGmoF9vMy2uA5z5pRIYBscZEPSWbSjzqoXCRDaMVlNYK4sqNzF6wtbbopiPAbfUcl6KFzxZpEvO4/uBEJet7GBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028904; c=relaxed/simple;
	bh=tEX34tHuv9Enx3BSXJsLezOkH8S4dBDt6DQw1nfmw4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5lXgVGUCeDbaN34OAtTEHyzKMPlI7YxOcYEq8TrJzcO45CxR3mN5w5qkv/oTPiDtfhf26Q9d5voo08NpottsRS00rZjZ0m4YcKfZPd5R660HThppnH4+rzlInD4cSqI4zZW36vpmFI9Q+6f++xJhsVuqwAygmYzdhtYei7y540=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHjdL0oc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHjdL0oc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so25017585ad.1
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028902; x=1792633702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6Pl3gMBQYmN9D7oerWQplIq1HLxsu+OxdUd7erjjPU=;
        b=KHjdL0ocISznk3K8rHWG9GPZ5fm/GGKoulnMEtwilA+IeYCH6zdmIrNB/C6qOda8Hr
         YDhMQQKGLA3+8lEeQKO+4vHJ3H/zlONBdDs6+AcqhHf5TCGXDJrfixXG7XeI51Ol3JD7
         vwWUnKr09cJIIrFBBHAmGQSmWwOOmBx2XGWwhidORD4qf8VEw3fTv8D4mC1adm/UVljt
         PJltOSeTDxNrb/W5580F37bDYhprfyrr3UoaTaV3EsCp/Q56f6bNkoyDr2/2ghhKxoFH
         +wxr6wGLoFPtvCHSB6TEalnfd5Np2kNZMV3r/qbEQIQmLIbyNkDgOFobCuVXgE8sBQes
         zBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028902; x=1792633702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6Pl3gMBQYmN9D7oerWQplIq1HLxsu+OxdUd7erjjPU=;
        b=sddU1YWH26iyGueNNU1y8vt+nL3ODNgH3uXRSK5nCPkGMYjpQsaz6fN3ICvaPk8sl2
         uZJs3GsLeeat41WqpnZgRduWRgYRvR78LlXPHfPgYnunIOgmhgmbUXhPO9OVwi/yyyUY
         n1UWMbpDZ/6JE07J5n7MEILFBMqOO44hn924bmFq5bdGesMnFKzTcr3JG9HBow53bt65
         pzhIt0cza5OSEqGzs5Gq+pWs9cQ5azx3trPgmw6bdxM9ZGs4t1UPJ1lglmwdGaMFHuTa
         jt+aMZrFoJ7SmhbWiOarVddGOhHTqh/rZJyWqmkyl1g1kTUgqAvYG9o9wnfA3/B37wdG
         WrUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBR1hyf3TKAQMhMgk3Plgc3d3+Jd+PJFObRNk7gunKbeX7IwDidVxrO02Z3wSbZ7CpVvD6ww==@lists.linux.dev
X-Gm-Message-State: AFq9FYJLCdL8zmXAf1k9jyN8gLS/iqcflm4Ot/4/d9okT6qhg4s4RS3o
	pAvIiuCb2qA1k5/ufrDSbrA+WEyWqc6YIGznf4vQfRLR9VK2NC5u8JBT
X-Gm-Gg: AYBFou2dPoiM750N9/ACOJ/QArxlLSuNqEkxqk9wIMuHToUx7emkRpsq/NfszYAffOK
	sDioAcSJwsJVo3XjBVTubquetDRVKQvrXjYQUfQLa0bT75yBKs+3MJ66fhqG95z55x+9KKIFUFS
	CrB15yFs+49sPshESXGlI7QCVrEohCWgPypvUhUPtJaLGuJaI5Ky9XnGpqFgN6SLTNQj/KFe+tX
	RXHr4bkO27U9n5dMxpofqepD/2sP36rvDdQHMub0deRI90epjMkkSbH1OD6MvNE0bElNnfHMynv
	okkG05VhIeS/21Y+P4j9BeQorXE23hme0syqy9Uzt/YF9c0+n6hrFDkO7FZOaHlAZhHKsQVtU9l
	j7/AMGQQjtzfskmJi3objwJp4mS3jgHM1dRa1Syj6mU1ksN+QkiegYj4l0oJxlmzoxf1lL5Gvtd
	TCu9xvN0s3MhHTdQ3OlWpurRDg2TCMnJgJPU3PzsuuE3vUGniRdcjvEGaAC/9BFwyPzevv/Efhi
	kmv1TMIDWGwOT0JDgqiDk9xn3sR68+MaIXopXYJdY6YfNkA9dQ97jQ/Ex09O26wSHF1b81ULeXn
	GteU8Bx98coUmEw=
X-Received: by 2002:a17:903:1b06:b0:2e9:5d1f:dfee with SMTP id d9443c01a7336-2e95d201631mr3403435ad.25.1792028902474;
        Wed, 14 Oct 2026 18:48:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:48:20 -0700 (PDT)
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
Subject: [PATCH v2 16/25] ASoC: codecs: wm8580: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:15 +0700
Message-ID: <20261015014324.5569-17-phucduc.bui@gmail.com>
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
from wm8580_playback_startup(). ASoC only marks the DAI as started
when .startup() returns 0.

This currently has no functional impact, as wm8580_dai_ops_playback
has no .shutdown() callback. Still, return 0 explicitly on success
to match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8580.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 9bc5d1e795dc..cee80da8f753 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -852,9 +852,20 @@ static int wm8580_playback_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *component = dai->component;
 	struct wm8580_priv *wm8580 = snd_soc_component_get_drvdata(component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-		SNDRV_PCM_HW_PARAM_CHANNELS, 1, wm8580->drvdata->num_dacs * 2);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS, 1,
+					   wm8580->drvdata->num_dacs * 2);
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
 
 #define WM8580_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
-- 
2.43.0

