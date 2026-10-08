Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD325493D3B
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456172; cv=none; b=J1da6Kd1PKeJP8t7agNVZimwqA9dgVBPbsBtQoJ1OCrPcMrfsiLlCwguXtV1QhoQdS10445csOBnN5xmCbazVb18eKPhXpAAWlQiOtYo3AVPgYmizR/AflDdqmFWnFHfGfuAfhpB3uQMPM/QeQi1icWaJw/5qN1fgs+AMzm8RKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456172; c=relaxed/simple;
	bh=5gdHEOl1guP3lKSItABKnxUiFa7+ruLS9jKThkThl7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgWHvIfDvQ+Ya6dSzHYisZAJY0YMOvP46B5Z5CIEfeZgRpxRi4Lbod82pKQDkS+m/uGzahsFPxJY1qYgkzA42An4tGgAirCDc4o6jKdb62a3jo0oj/xB0mSPWj9NokiV7lm6c1iq1reqnp/TFR8LyCeoKTkm1j8sAlpTtUP/y9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oriS/IEK; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oriS/IEK"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-351767ef18cso1962525eec.1
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456171; x=1792060971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzYVoHEdz3P+bsZXHKAJVN1yBKjLyzB0nPd+jwADmvw=;
        b=oriS/IEKe1oszP2VngtgfBMP/1bmF9b0dcJfOEhD1sLqVTfae4hBxd41RM6Lpm5dQC
         Tog2kJq6pewznYr91lPmGP8FP3LPDpQy0q8CKrAGtXQt2c5FPiT7nrmQC7eMzD+QagmK
         7Kb4Lyfwc4jVzj+68rKz/3PZ9x1S//5ImF/7VuZzM8aVcCh+/Slh/xMaRPBfqkd1rzdB
         QBkGtmE/FKIFh5N0JKB7HMJ10AKOJDXd20NQ+s4hWb53bV7FbXCfpLrywLSssJudNDI9
         l5ptSZSteidFN/JwgpqrmAmYzVhezNkpTCmVztBfLZIJljZDErijvOsKmlqYVMe7g9Ug
         +krA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456171; x=1792060971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xzYVoHEdz3P+bsZXHKAJVN1yBKjLyzB0nPd+jwADmvw=;
        b=TKc690raEPL71yjIx6pFzGQUJooTyZmJuMTCxltHPBLuDFZ4khTrHmyYCiFd/1bA7U
         RI5oNKIVAGiIfvw6N5LEEIkDPq+ip2zAm3UHCusHFKAFXT+3bBse9/6FokiSDWBr8WX2
         614vlyMfqoral7xc/z2eOQJs6fAIe3EmwrzMQ72ACJzEzVqUPOR2Ok9Qtj5l9mRXN9Db
         mzOimaXF6fz9l3Dm/uo4xBLTUeI+T8Jz9u74Ui+LaEobXqJ3wVw/+oSHsVzGqrvs59Bs
         omnp3V2je4uKadsQTzuF/w3qx0FNsfmUKPv5mIgepMJrICZbRuUnc8lS2t8q5W5jES1j
         baeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVIQAOQo92KX8SsnkBTxi7p6bkV4lcVnspLMFBZvfZFgi3biOrmeS+KNgukPeoJ9uYa7LjVA==@lists.linux.dev
X-Gm-Message-State: AFuF++kCUGZPVsXdt6KEkQv7eWLtV047GqIEBeQ5T7/2pJ7luAWCtPSe
	WL6MSFA3eGQ71vMOOUVAP7TEu1I3q4iihkBJUpovVnYK1HY6q6meve7s
X-Gm-Gg: AYBFou2CwO7o2HjIpL5LbZAgENNof3nfaydFqzUMsHynL+rLvPG8NAE3Vtudg7GnVh9
	kX6Ny4UzNvz+A5ysyVMm23v2ttJ2/1LuPylVwMooF7DrIC/G2qu+F5ijUDoxSk2Ske3Es9b2atp
	JvEGseK6b7HSVpKOklkabIOei1VSknaTqN9KGlbuXyg7S4I7b4ijocPEVe8KgbVwnQjzMICjUxV
	pkvXDFcv1rwxTGnYlct72CBZ137KNskxG/gFbUokGAD+eTSyVrqMf0A1474shrtX9+cXbOJ6ulc
	9V3eOI30g3MmziOYZM7NAVRNeEjTSPiGMFyziJsjSV+97IG5na/I0/ND3tnrv789wnXVnauXbnl
	Af1e69at+Fp0GSW798wXGbCt70kjxp8C2cnNQdqi5sf9P9yYbJ+0Trd9jWqkHcToPIO6Wb3CwMc
	T7NmeqTLBxVQ8+J0QzcZXW90/7r+PM+8b4t2qSxpUG7hMk3eJN+az7/y6TV14F4rgea0wHSvL0t
	lm9sKHvQkzgCthrRKyaa9OoUCH54I0vkxM0/9KVC8i+/Wo50Se3VOjfEMgJK9HYnB7PRYZSYJs5
	z1eUPoDQi+f45Q==
X-Received: by 2002:a05:7301:8617:b0:351:11aa:5d5b with SMTP id 5a478bee46e88-3515dde8bbbmr5895512eec.19.1791456170565;
        Thu, 08 Oct 2026 03:42:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:42:50 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 15/24] ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:22 +0700
Message-ID: <20261008103831.542533-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/nau8825.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 63d927f31409..10bbfbb460b1 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1261,14 +1261,19 @@ static int nau8825_dai_startup(struct snd_pcm_substream *substream,
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
+	return 0;
 }
 
 static int nau8825_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

