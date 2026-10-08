Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676D24973BE
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456141; cv=none; b=sJ341Gqr2I7dRuoCsYcwbKk+WmhLK2xQRSZ91XNjB18MjtRaQHGuQ+Du0yfkz3VqFDemQnboRnojT+uFe2jsB6aocy5qgt+depRQ/O4N6r66WukszDEFUZKxe+ToxwbZRXniw6MdD/bba8itMxX2SrhYftMOegjK5Au0maQmSZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456141; c=relaxed/simple;
	bh=6dFh3KYbxtITJpRD4kNPYQg713kSVg+CYVFiW9/LyIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+tFHtOJ6jvagK09EPFYq6+n19yhmxw9CoElNPnZJkww0Qm/l89/l1iM+yEQYaG+FCPHyqjBD0o9XvkO+TqaHY7eiqdYVaeOi5MUzsOeMLXu20fYBJeu+AUkeRKXP5i/AWbeHMFrv+awyZbCfsQ05nIa9Pw0CnR3gLQKR65AztI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdUQ9DDL; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdUQ9DDL"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15943c9c005so1850520c88.1
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456139; x=1792060939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0qhtd+efK/Hc1Em0lvih3vUFvGAfNajebBLWEpeLzs=;
        b=XdUQ9DDLau+pU/zptkURmzu8Oq7o7Bh8PwsOkx0yeKcSUhtJuva0yX/SEIoF6Wtn/V
         aDsoDgyxMyAhp63pGsySQ0W9Q6QEn+/s5xLR3AuhH/k3LBYrK9DBjvPJMOT5kTnIbe3F
         5MpStSQXeh2iwNvpd0zaTURymZ/f0y9UqJcWQDz6XaAKCzB+lv7kCiGqHcmOWKkUUHGr
         po8n908bZtGBnws3FEhPSYOyA2Fw6ImTd+T5N+jyjwkn/tnXcfbkXR0AA5xdFqsONdE3
         8TnHBgzpKRVTGbOtb0IDT4u+UTKcctLe25UAVZ1bZzo2FOPu3aqQ0b9OaPWa6X0nqI3M
         gnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456139; x=1792060939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p0qhtd+efK/Hc1Em0lvih3vUFvGAfNajebBLWEpeLzs=;
        b=swPSskDX+seW0cyrlcL1uS4dmVrHEbTg6MBSNnG7soLDGSL0E31vpY1MKEChTUC8Um
         HRKqFJ5GQfiR746N2PMgZnbLUr861cA5paZQB8RQf1QmniOn9hSKQjU8vUhcLk9Mbbh4
         Wd4hHjywW6rWijUHRPlRHA3ArExgIS9gKFT4yrqDa5afhbW/gMXEs0ygCP+tWFsd7Img
         fUYltxmy/9DnVF706Hn8cZw+WGi64kN9GoX5qDa8wUMt4e5qyLk4kmj0YPVnvc9RG575
         5QCtuRKHkAMwl9Vqsp9NeyTYJhTT/HMZGZ2YVHr1Odl2a/1F2XBCFpqDNJXo0CXHsOpt
         ddBg==
X-Forwarded-Encrypted: i=1; AKwUvBzQg6Jkq6D8gQlAUKQqdi+DOs0NUummhXNM2ExzFkSSb9gQrTWkj6MoZ0jRNEu0T1l0pSNreg==@lists.linux.dev
X-Gm-Message-State: AFuF++lRM8j64gmG5UrmZsgYgEz3B7z4c+L/2S1Tuh4EgsemV2fNhXI1
	30jMj5/Us5kjF2pEN16wvSZq1I9Zuafxv5V3eizDglaclz5vDEIG0uAJ
X-Gm-Gg: AYBFou17DKt9MH1Sn4a2Ao/03lv9Rdpys9y52N89Hg4/0FOfeNwXukCmnJKobQp+Yek
	+XppONCrK1p9eum9X0HyALv0fi7nxmIkvOCn/jprkIwS3DTujm84H1TEisIrYloXhR490YP6Unu
	iSVh6eHHR7anJL4/24K/OenBzJzO0LKUVaJZfeTaeDkbBUjhLznoGkvRkdxmznU0ac594Ee6bcv
	XfmYBYN5NBfBWwGW18rRKVtG8ovk3SLBeWK2WASmlHjT3vNUd5wY75ikTx2r5ZU9IWVL0OGbeZS
	gaYErthQZIPrBBFVILSRicSYTd+4aGc8T+jSweCmQJbJCZePLYnuh0rJAkk1k5MUyeZy6V0BYZb
	lo2mv3+8gKkFuGeMTCemiWAabmnSXa/G49f0tOLsJva4tm28/MOQBTIgifzt+tQZgqZ00BLg5kP
	NGKSSQtpn3IxANbjdcTGuZ9lDt0yRRF0BTOY9RwoG4s9OhlBChXJXyz+thJRVAZtY/yXUYeDiST
	MK0iQ9yc/C1dcvaSAZw4c3Azivkt8DM0cQS147TvTQtx3lGG4WvbPGH4dbQAhpOcBiY4/N8WN5W
	sftrlQ+XHXfIOUo=
X-Received: by 2002:a05:701b:4501:10b0:15f:6789:2c2a with SMTP id a92af1059eb24-16207d7c2a4mr5290246c88.36.1791456139402;
        Thu, 08 Oct 2026 03:42:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:42:18 -0700 (PDT)
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
Subject: [PATCH 13/24] ASoC: codecs: nau8821: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:20 +0700
Message-ID: <20261008103831.542533-14-phucduc.bui@gmail.com>
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
from nau8821_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8821_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8821.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index ecadbaee1037..935df063822c 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -829,14 +829,19 @@ static int nau8821_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
 	const struct nau8821_osr_attr *osr;
+	int ret;
 
 	osr = nau8821_get_osr(nau8821, substream->stream);
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
 
 static int nau8821_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

