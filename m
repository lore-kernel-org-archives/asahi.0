Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A139D36EAB0
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028981; cv=none; b=B4yUDvZETvj3BX5FA2IO/SJKirzHpYfN/59MM1MTvYjGTsJ/6YUcxHwTCwFIZHUU079hRiw4GkW9ZarnD6zi9qB9RNSW/QJ2e0JMYWNwQSOwAxDYUHT5XRrIQdRk78jutuMvAfY5pD37sQoFwfQLJ6tTa+RJpzjhOLeA8UFH1rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028981; c=relaxed/simple;
	bh=jlEb+ienncM3LL+BnYDTqkV/y1oGhTtwElRku4Cmr6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KeATSsM50vWA+OFEV07cOfFb1LxoXQn8lrPEbb1UwPxsoVXqplD7wA785ZH9OxwA9TlNT6rsf2HT5unvi6l4tZIJyfNpE1syCbpSA2ohQlZpWGkPyFAs2AxdCGB+Rt7jaDOyZZwUVumcAc70hFBXYnI8ge52aIM0KQbmUieSKPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAZc9AHm; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAZc9AHm"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6e954afbdso7420855ad.2
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028978; x=1792633778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVU2me1+3bnamRCjCl3aeaOsDD74U7zM2YYw6HaRgfo=;
        b=DAZc9AHm86aGpQW4wn0TPzj7cRqoziLXh1h32beVCljsYGNz4r/udtif0EhnB5ksYk
         0Pyl1gZ+B+6EDR/fRbjNaecxCtSywS9nXG+czaYKUnb0b7h/4YRDnFgzvYgeRsTnleTR
         EReCX8AClcYVy+uOVcp/4Rr+q8vEXkE9Q7EIDxYmSApzP7F2RirGPDC+6CVfw7qAlmbc
         edQ5zQzJcvdoTIW98xVuUBGhLTLIIVjZee2goPtyP30ptoC27Fgc3Gz5YogAMxx3Wusl
         Hsi8JPj6mRJHxS+P7PDvXBfn8UrNCqiqYr0ettRXTi6aMpQrv/NCxXi0gVTTlpxSxCxx
         YnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028978; x=1792633778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVU2me1+3bnamRCjCl3aeaOsDD74U7zM2YYw6HaRgfo=;
        b=pZLePXAQGlluB2Qc7Xo56lTMcU8v4wvPW6dqhjxaQL7T4kLoe9+sIS6BQGjzgKezUX
         SrxAAgNH1UOHpjs4Uru49a5/62jvaEts+EmFb8twkW3aW5iS6d4pJK6KMlbYOl4F0HZX
         LQJileUINH/fbUwr79B7YfqAdaFWD46iojrw/q918TVQSBxOy8RQ0DIVxrKsxxa8/Tw2
         hmDzxCO8I3lPx/+dVnFTYWmadjD3vW7SaBRiVP+sy+iGO09QqWoFaKxDOJTsDt1raI10
         TNlo0s/KdPkxk4qutALRzJdOeRI4z9qJKmcsfMA3KixD/zAFsEByhIGlsYszJRkKsAbi
         LIFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOs25FH9kRoyqHWI2J31exuxRUAbQCtLTJB2e08AXKyfp8WsuNmzOyVLcnTSkRKOHcY6TAYQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYL6CIg/G1S5i/t3eA9YPPynGG1Xf2lpmCwcL43tb0rWMek1ZhBZ
	PR4fAWfNAyLEfkYOo2SgK2VehzAKkCgL+uoP1jon5GL4WNnPZ9hUW0e1
X-Gm-Gg: AYBFou1d1dnIv6yhYRVVab7+Y/qWL99sNh2LjRFJ3yQT8YTLz+XPJ/j+RJ5UkwTJ2Is
	8jTVjGNA7Ky5ZG5eiOwJliZWwMO0S8c0ax70LTjg5pudCWN3/M5hOHrhM/GIyAA4VPrxB056E0Q
	BSJB1JWoAn8RkzCAWEkDDQ3p4R8cmMKKIyb2xpHSh5xpRwBC5Mtc1Mai7ym6dHjR7ovrwUjFRor
	qkVWBfbEMKKL2mL5Ng1As9c2vSAn9n9MtF5kI4u5nebz9ciuna05r9RCdZJ71JIXiunOvCJJoqN
	ijs2ux+0QINLR8s2K4puSsIsJ+4YDrKSWYxkEuu5c9vglXZA3lngaNuLd6C5RjBhykLgezMkagi
	J1GI3LA446T8A8zzD5ZTTiSfJcS2EyPJKSM4u/se+9KVf6BuOB280aKEGghia7iQk9ARf6dfDKb
	4Da8S9DW2qnub6iRNSf8dtN+N2lVJQ+jZiqH6HopOJZ9nHvElHyiHo4PDBKum29R3CLsQNW+ltL
	hVYs/wnaJuGCPhedpE2muYJHK8SbNaQzDL+1tuaddh9oD/UaNxdiAu/byvpItTQfeFF7YwleHbZ
	tR61+70dfLGRTQ==
X-Received: by 2002:a17:903:3243:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2e842bc61a1mr152460415ad.27.1792028978441;
        Wed, 14 Oct 2026 18:49:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:37 -0700 (PDT)
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
Subject: [PATCH v2 20/25] ASoC: renesas: fsi: Ensure the component is marked as opened on success
Date: Thu, 15 Oct 2026 08:43:19 +0700
Message-ID: <20261015014324.5569-21-phucduc.bui@gmail.com>
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
from fsi_pcm_open(). ASoC only marks the component as opened when
.open() returns 0.

This currently has no functional impact, as fsi_soc_component has no
.close() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the component is correctly marked
as opened.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 23b7e63596d3..74e2ea002fbb 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1811,14 +1811,21 @@ static int fsi_pcm_open(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret = 0;
+	int ret;
 
 	snd_soc_set_runtime_hwparams(substream, &fsi_pcm_hardware);
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
 					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure the component is correctly marked as opened.
+	 */
+	return 0;
 }
 
 static snd_pcm_uframes_t fsi_pointer(struct snd_soc_component *component,
-- 
2.43.0

