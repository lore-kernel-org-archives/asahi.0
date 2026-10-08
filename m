Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC50338654F
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456067; cv=none; b=RIa6GThH0MNhI8guWg2Ax6Q/2UO7CHcCWo+5VYXKSjv5bPx7uhc5LARYBPHCI1rekbmbfoQBi21MH4wop8Y045FRQQOLG98NMDJPKncGy5PdKaiD7AxqDtUBl3evuU6JhoB8a4YSf+qHMpQpAt5Q5afWs8BdvdLunV55NscRw1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456067; c=relaxed/simple;
	bh=Z888BsRACHc4khVghw71yqQDS3j8iLQcHLU2iv4UfaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bRwWO5yoD7NyoKaM4PL6txR+mXyTaTenmF54wEOOu+KQ0EkEO0apEy0s73wp2W9olCnRt/E57grmXglshb812iQ7wKermttfZzHb2SXyb6vTaWjJ4PeFZMdm67Rtok+vjWYM18N0+SkHJzJf/ubOD9rcW7KU+wppiQfkKw3+Cns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9qOoFnQ; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9qOoFnQ"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35154cb9de2so4040958eec.1
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456065; x=1792060865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTcgEknypy3JpI9J/G9mPIrbfMp+7I5/710LUj+4UxE=;
        b=c9qOoFnQDscqEbmmiftBY6iMdTNhPX1bB4yEgAbfK48REAOmWE4HXk5PcNXHFHbjib
         P/NoopT8VnB5jbxAdkHCtu1Tnqv++hKFhYaYc0TUHcXrPTYmg1xgD6W/CDmOrfnNXsMQ
         A0ozwRyK0NJsBpaIjzy55jXkjOk2OiVxvy6Dqk9N8r3t8UPvqWwLiaZYxB8YdbX9CJh6
         CCCclOWJSalyUOzpaAvTD0+V9p+PytHHAMaubujY7S5zI+5WfRQ70kv3zt3Hww+xlBF8
         upmO2kf7b5Qotd5Hg3Re3rjqSEi2RTPKCSSj7691Jm8zLLhj1e12T4c1unAwXTFu2WGg
         4puQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456065; x=1792060865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTcgEknypy3JpI9J/G9mPIrbfMp+7I5/710LUj+4UxE=;
        b=Wgtry2uEzrsJZ74SD8u/wOMqxOERw3jv0Sv8dmnUTekbKbEcIWsS45mCGzuGwZQ7Qs
         s6vuifda5srcLjLuZfDcLgmyKTele9KI3AL1iXCFwQdx/FQE3LgqJtl6KRoGXcLXNM0r
         m+4WXmCNRd3iOiCmvDQF3gKRAdp//tqEy8m7MDKvPfVKTAsjfNjfMO8pb2vKlijE+VgK
         WR1f4oTckPLRGgsdq/a93Ba9O56ulCHyPKnBWt7le8BNFxbMWT96Isz8ma/rEVDhFnsB
         YvV5m7lIzpNVqPlHgiiwStEQapQmtIRIkQItxH51pYF1lmNtlOK4YDiD8t1OWOGGPFa4
         WCBg==
X-Forwarded-Encrypted: i=1; AKwUvBzbcGM5TyZJn3947wv3yOvBbF0cOkSCmuHzxxT/o23FpYP9bPxU7s9lWApA5olTuzJHUoW84g==@lists.linux.dev
X-Gm-Message-State: AFuF++nInII9TWQWNZut8ZIPOwZD/fSLT2hqZq8aEfbiOzLC2RNd+rtb
	NW68zW9vrYGp6K78PQNMVnGTsx57OUBEE2RU9dtqGaPRvvaFFYtlA7f2
X-Gm-Gg: AYBFou2qjlkwm5VysvNg/yB1Dxpn+03A3xS7ycWTtNAdGdOac/IOjwm9y1ZXJpLyZsq
	UHUlgjjV9VCDKlIDSwMxiOlzFZaKdD+ShpTVU/vZLLE4KMRS22Nhfs7GZK9idrSEL/bj/cNPYmr
	YrmrQWrRc5WufOGUFN4z0VFQo+HB8PKimqpUqkJEE/yL3GLnGWLYSutOJiBGl2+xp4gk7wAjquJ
	o81GFAAbc+1aekC++6ZTFKUq6/GQ4LUV/9clt5BBB38naxUxwYrrnDa6LNFdHFS+JW32dEUP80R
	QUnK7aJkBHDkoMBaDV69eEDu7bhc4iIZgPCKdurU0CW5GyZnSejtVklRkaW0e/s+xGJ3VtpBfUT
	zmUBSGftk1Q/aJ1oBYHWZIVmlL29ugxjdm1I/CDX5AXz0t3QTeir/rhsX5RvuDq0smFT61XVZrD
	pHdJcBMlrxtVUFsWAClcV+KJ0nQtfHcIyQOTkLF+fMYICbMXsDW96mM56y4BbwH0d+RUdJ4FDsk
	DEHEoC1L/umDmnGCb+D152CWjlrLyqqgCOhyghBfLVLwSfPpxPjSg4Qa2U2nZXXiUjhY4o7EeAr
	o9M763QRCe6G3A==
X-Received: by 2002:a05:693c:880d:20b0:34b:f279:2c16 with SMTP id 5a478bee46e88-3515db9190dmr5490986eec.5.1791456064946;
        Thu, 08 Oct 2026 03:41:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:04 -0700 (PDT)
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
Subject: [PATCH 08/24] ASoC: apple: mca: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:15 +0700
Message-ID: <20261008103831.542533-9-phucduc.bui@gmail.com>
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
from mca_fe_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as mca_fe_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..3585432ad49b 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -516,6 +516,7 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	unsigned int mask, nchannels;
+	int ret;
 
 	if (cl->tdm_slots) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -528,9 +529,13 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 		nchannels = 2;
 	}
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_CHANNELS,
-					    1, nchannels);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_CHANNELS,
+					   1, nchannels);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int mca_fe_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
-- 
2.43.0

