Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9231F99C
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028873; cv=none; b=MFdD4vP9PaZqrQtCF7jxYmE1vIOSEeasLG9Uo2WW2njw4OCPM71NMUlt8UmTtEWWzKcWNWZ7elCGOCnndbEUOlUpOJ4/Vn2GfA3Pm3txYMR0IXkZpXKHAhplQ5aJEr0lT+FUQRSMERQYL1N86LyjDS0Y+hWmnBiAAnWNaIXNheU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028873; c=relaxed/simple;
	bh=lTLKa+91g0xBOu/fagB1HB+X80BcBi+hkbX2nHYkS5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/3htilYmaTNXypI1gHP9Q7bfKA+E4I6WKAcxidKvb5Uj9b4j8lZcLXxwIvMKEQcF297srJTOLSkmzD0OxFkMZLsRwNmFRzFXtUelmKpUz5q0YwlPVFwC83qTY0yfDIR+PXygDYVAIcLHEsXBhjoJdQqSCrKKb1O5W2ZKAA3Oqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvdhsz9J; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvdhsz9J"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e7006bbf77so10080955ad.0
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028871; x=1792633671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r52r7lHoOPMhC++VZB/BAS85K3dCRyowF6eP319pd4Y=;
        b=pvdhsz9J4glgUHxGljjD3uPjtCbn3yPR+e0yv+GDK6tTBoZY1eSCgAvqgnN3Xrlsiv
         TYtB1aEonYwNWw0B246VcsyLkVVXvOrlPbNVPGcjJY7INwzrsoDSpLTTYVLWA0ttasj2
         L6gEJzxy2HmfPzybajlmjyearYbYna4CCwRmEDEl3QbWoqCbRFXGOyDsrWsxkMWfgt7D
         5aBvqXt6vuqw2xsexBqAhYIUQb7t1j3HCHaaCUMb73YjjvjeE/p6kuYDgZAzQmA258f3
         sCEVa964ea4m+FMrs5brbNz2+9py/5C6ejrw+ZBThHpxrynHFqG5S2BFG0K78Ot6rWeK
         gDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028871; x=1792633671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r52r7lHoOPMhC++VZB/BAS85K3dCRyowF6eP319pd4Y=;
        b=ydLWppDPUQpXRd8SKkUHP144uagHgsoQ7/f8EuUPlSPiQYLsgChGBju/yogyArjfso
         tClSK3CWBMnhQEnUi4ELmvqqABmuEWLQphwatbTxkgpnKKf3/ZjV4gEKOeFsbhOXwqeU
         dYL7PY7qYGHZXdYB6gZ0PQTZQqMsgEif3hcqsatJKi6Y9Vi3y9zcK6Ck9bMSP2iXhode
         vg2I/xpKsHPwfDTKGgCFyYEAPKHaMnORNywLBeL8/kokLoHhotyjiuQ+h1gYV3m54v8E
         VviKCrfkGl+d5eM7fSOF181dqEMR1f/LAREoD2BaIs9K5N3bmej81LlwHkwPl5KAdRdx
         b55Q==
X-Forwarded-Encrypted: i=1; AKwUvBwjjFPIIJoHc6gnH1UEUNJei+fgO54UZlp39aGRDKQ/pYTTN4GAs0cV3DQ0ztAWv8w66zJgEQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYI2T4/knZl7EnzxOwJiy7MV7wZN9E4d2hkpLuEkuiiGJEATGq+e
	NQdf+8NL/xkA1GaXq/uvexO74iO5SgIrHOaNA8HdPYNETTNzBL02Mjzq
X-Gm-Gg: AYBFou3B+cWTx8Ih2VnwRBCvq2mzMarPm+aXdYFHanxEA8VQhRa8F9DBuGoLqC3Zi5D
	m3sFs9KgJY7Tf4rRTylogoHBgljFj4gMtDen7HadD/JlzCCnYXcxXMySsLk6iig9LpBDSfQ4ClK
	Vw9RtkdwGyXBaP+74NjmcYiOP32YNDaZQg2Z/zPYQ6q7uU7l/WcLp6HTAw8AvhlNqG/CWdPXI/1
	Sb3usPhi0XikfiGC1OTW/eOydjZgzihAMVpTuBvymTsOg3YQZRI+/CPW1dWNQcOcz8uSv14fSNy
	5WXaRdsxURQ8zrWenbRuJG4uj6xIWGqVeGCK9neK1TiK7vORGQK9MX+WN3FLr98Metsv3RZa1nE
	SsS/NvBXMkURIxzpKssej8ZrkF7dalxkjLkEYm+df8CMALORskz9wftDW+kvD4UooncDZe9Zm9a
	Z5ho35zs7uFHnFJlDFbI0TD1HpKaphQCsXdzqBfRBjdXryXtG8N6vrRJUXHQM4o5wg10Z82MG+d
	GQ/0MtOjrNt5FdyssoU9ZHy9WyponxTBnKQ+EcEjjVpEBZBYMKrDWpkmD+h1mLU/Mzb8Ux15vA2
	Byqz3gQTYU/z+F8=
X-Received: by 2002:a17:902:d4c9:b0:2e2:dbf6:3744 with SMTP id d9443c01a7336-2e842ce7d6fmr143717775ad.42.1792028871192;
        Wed, 14 Oct 2026 18:47:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:47:50 -0700 (PDT)
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
Subject: [PATCH v2 14/25] ASoC: codecs: nau8824: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:13 +0700
Message-ID: <20261015014324.5569-15-phucduc.bui@gmail.com>
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
from nau8824_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8824_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8824.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 853eb9472af9..046cce9192b7 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1061,14 +1061,24 @@ static int nau8824_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 	const struct nau8824_osr_attr *osr;
+	int ret;
 
 	osr = nau8824_get_osr(nau8824, substream->stream);
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
 
 static int nau8824_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

