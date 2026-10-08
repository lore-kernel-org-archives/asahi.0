Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1A498912
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456297; cv=none; b=KkGQXkxWrlCwuJtdcgurCJo9a1xIi+P1BTsEVeUYTBaEgvYOXChk65iYqLHnEDlCMwhpnUjtlPgcf5WXP7daS6ynVqhykLFNYSXN9W+j1S9wG5Mk0UHTvQLUo7CR61tQmKVIvaUmlJhmOSc79vMJgyPjNP2Y4+8pf1IWM8iQIbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456297; c=relaxed/simple;
	bh=f8CcWoO4sZy/Z9AND7TTLaeemfCybBHCm1tDpN4e8XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cafTZ363D1c5TUKKys11YUwpIEkz9Gh3k2ZEOQvFFU1l3QHsilOfJFbehOxnqx+hjUUp+YLTcwxAe+whuxTfbrlvSo9ScvsOxqU71eXqvr/8v67pVx4x0+9pZbZ1WWVieOUV9mOxNMUU2YNKxg8i/LAAx3I3NuCvROTciYyOuUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1rdV4xC; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1rdV4xC"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-34ca2d54925so7792318eec.0
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456295; x=1792061095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vuCt8LfoeVxeGP9EXdKyFEToJzhlOF5O+NhVLwPyMgM=;
        b=C1rdV4xCXbItL9ZbzC+rGj/8XgL7kALBpaujJlzqhifHXF0oh2Z9+fhJsEQeSkUA5c
         D7HGO53SSjIk3jyUZVDkXzcCVSFZo6p3ZMe44ImKAj8aYvovHFuKTwiVCx6b+xnNRxjr
         tGziuIQaqTPkXOsEef0STSP1+B8fu5CxidSk/RKLpUGNV1Ia+0UbExXzawSq5CN1C1QK
         SxiW0jTMwNm2K+8/UQw+yWxPrujcPdfysNG6eu1+RILiCFM085xY9WgfqwYuxVw+cNpR
         ysn7MdDZhJeC7DnuCTNO02/HTeiLmOGapQtKGvdp1rzFG95hI1yw+/v9XsypcWpmj/3b
         D60A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456295; x=1792061095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vuCt8LfoeVxeGP9EXdKyFEToJzhlOF5O+NhVLwPyMgM=;
        b=PZeRSS4H1vngRQ7igwhwB/uAWptjvSZgrERl9KRQT6Vjb0cDiT6b38MZlDLkBw3nbu
         IpHksoR1rUXiw+5e18u3KUlqJQ6V8ZZNwmyOOXR6MqIXKpw5eWSbKqeggjMA3t9it2ix
         qjDToN60JhivpIwdf/wimHmQ91xRrAnbWeRk7pACNNa+WJUUMRlGJykVB4rUugq6rGHk
         6ZFUmU1Bahf6SNgHJx2gv+VpZrKx/12UbDzaYXtIRhLfB1Xpd2xesZcxs2bOG7BVZavL
         sC56fUvcz5hJpHWGG3WIi+CyA8uVx1t+gb5jtlNx8R06wYCjTZ5xAV5aCfdpgPYzwIWD
         SZIg==
X-Forwarded-Encrypted: i=1; AKwUvBz4nsm+S1Pfbe4iSXMP3FHoOFXpJhZeU9fyl7OyZNocrJNDXTUHj75MfhG2ICjaEAjdZ8feOg==@lists.linux.dev
X-Gm-Message-State: AFuF++k8Zh695e8xcgZlgKs2vxqLK2x8QAgLPvFuRRXsdVCXmngj7Lll
	hm8bmAGA86ZsVNmg8epB5QMvzoph9ue/II7i/U4jaywRRNzxD+4nW32R
X-Gm-Gg: AYBFou3huVGC9d6r1nClRG7Qx24XWUrZfDjkN2tSdt/89QTQ5S0nNCIJMnREgpESdyN
	4CWrbkazq+H19gSm7JTp2hRAinSb+Y07q1c6n/wSt+8vd8uIZtBXNKncd5M3gi9KBRBU3G19Ibo
	UZLoHJbFOjsz/UenR5ubQUxo0RamI5oBbYsFpeJ4YbyHcmmblyRLBFwIITg8BKjMyqdvGrvrwon
	pBv3Xt4R+TGNkYZNrkW3REU2TvXv4ha6VmlV1CQeVEk0XENiQqe1Njsfts4JAqhaUGoZBlASs1e
	dds1Wot8hen83TU1BUJcpxrn/f3/moKoLayUweOYiP4IQVxAHU/Yqj53StO+vTOFt547oHbwwvA
	Z/6KcJYDG2UV6ppq4nqb3kXByIL5fP2HvCERnIjudbE6Zrgw8XSN3ihN/PEKHvskpg6oOPJCgPy
	Jt+wjgkoqs6lT85C0IiyoQ22JqczfJIzS0A9u75wjteL8g4bvYTxtFI2ygNJ5vAL6T7ArRa4JbY
	RmIKnJq1fxME9awVozRaK2PlcoBBZtrx15R53DhuPvli8OWcQS/gjUR8BWQgi81x8GX/bnCXRXP
	KLiXTh7hUc+2TA==
X-Received: by 2002:a05:693c:88c6:10b0:328:3944:ee53 with SMTP id 5a478bee46e88-3515da28859mr6112721eec.2.1791456295330;
        Thu, 08 Oct 2026 03:44:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:54 -0700 (PDT)
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
Subject: [PATCH 23/24] ASoC: rockchip: rk3399_gru_sound: Mark the link as started on success
Date: Thu,  8 Oct 2026 17:38:30 +0700
Message-ID: <20261008103831.542533-24-phucduc.bui@gmail.com>
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
from rockchip_sound_startup(). ASoC only marks the DAI link as started
when .startup() returns 0.

This currently has no functional impact, as there is no .shutdown()
callback in the relevant snd_soc_ops. Still, return 0 explicitly on
success to match what ASoC expects and ensure the DAI link is correctly
marked as started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 04e7bed8275d..0ec80a4b8c59 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -258,10 +258,15 @@ static int rockchip_sound_dmic_hw_params(struct snd_pcm_substream *substream,
 static int rockchip_sound_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	int ret;
 
 	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
-	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
-			8000, 96000);
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+					   8000, 96000);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static const struct snd_soc_ops rockchip_sound_max98357a_ops = {
-- 
2.43.0

