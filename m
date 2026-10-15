Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B846C2AEE1
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028775; cv=none; b=LtHuk/mC08eygEV2k/FdhzfFs4Jw16Ftii1Uot1iNhw+RmXclDPYZrSChuoppnUaX2pDvxUt8NGAuODxx4DrOV4giccb9bEW8HU2hhyH8pl3KpxXPDLGLSm3Ywv4oPFEJP2BmtT3xYlaJYckKYfEPerzAjtdocr0Paj6lfsxAro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028775; c=relaxed/simple;
	bh=yyOhgd07c+cxIzNpWT9aCbeZ38F5m8HPqyV963AJgU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=di7YVyDJ5tA6RRE835z1Mimu8UahyFFvAewOtB6yhJSaxiRqgffN8lIHIbcpB9m6XSC5s2wyOgCCN9tnmaRpTZVQiqIgMpMvQ/PNq6KR79MFUM9R90nzvbcj9BBkYtscK8nC8R4ClgpTCcaUn3nSvtEerKZKmN4stoO03hTJd0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bepXdn8R; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bepXdn8R"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e915887d9dso16477935ad.1
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028774; x=1792633574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUuyyTReTSIMtXgKEYicRWK2Sg4dljNH29dcQFqlL0M=;
        b=bepXdn8RUVOfdd4NTtmQkZOBtWzk6WLE/batMAQn/A/yzWNFwY3c4kLjGP8QaitGY6
         EbJgJzyl/02OpXMsis4kQDj1Ki/XIYB1WM4NXRNAMVOT4Py1kkSu0lI4Xguwf14B+mPg
         t8rn9oVE2sdL9hBXEr6+xQMcHyKiikle++YGjBruyvuUO4R4cQeOOEIE21Vki1zO6mg/
         m8CAyZqGxEgRWX6LlpJd46GyEJ/Nc34VoH16h6beDzlsAuMhZ6EsO04xy6j/2cWJfXdC
         25BBfYmHEKK3BZd7kL7kJlHfTfqzSPQoanOmG8zgXpx1Jb+pd1+h/VJqHV3WHmiITCB8
         VO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028774; x=1792633574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUuyyTReTSIMtXgKEYicRWK2Sg4dljNH29dcQFqlL0M=;
        b=19DsFgEzbmk08SFdxEXg6ebtoNaMPb+WCQHPAUvQkmuV8fHC9mXM2l8PKAJxrkOLio
         TlncvmqFAkyOKBSMbK1xogisf4QNY5EAx1RAqYK9Fv9aiey720fb/hlFPtWm54P+gVrF
         kTLFt7avrqpuBsUWZIGzZCKqdrYYedA7XRTyq8bn5cFyr2c3zzFnXpXnc8oqKfKlg9hj
         FUXFj80AJm7hORgvDp3YjSuI1mxgg9wLCcoF5PewZ8lS2Xq6ak8F3jq0m3K9q1duCU6a
         PPkQRNhm7sQCrhNmrHkRAn4GfLjBEGELZ0+i6B/F/KBa1+ACQJWv4EPHxh0TapDoBHqi
         yemg==
X-Forwarded-Encrypted: i=1; AKwUvByquvEPdU/7WvIY1SPeFnbFcZpw2ei/x44j5Irchs+/enPSJ2GLJNfY0Zev220z4wCdaNY9Tg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJdR50cxeniZFNWI2EkketnfrMsBTOywQY+Pn7Kw4XCPrioQPmX
	QRY4gec7NBpdNeRHYIHUd+eZ46hoDMQf2jkEidV/bxgvEObr9JYwJ8lE
X-Gm-Gg: AYBFou1kdibtssS6XphYrsYFhWl8RHTwWdZ6zOY8vvJtPWbjaxCM7UHT983K1iatdG8
	j13em8VMwgQEiXgbxjBqjhF5sSYa6eNQ1BdjtCUiCVrV6NLdFgh90J8AO9b5CqGFrQeWLONx1cw
	gVwM/UXZwmpmlGrv2sTqKtPdsT/sD1JBjL3dbpCgqJrADRN7QnKs3+vByEyLSqWRdlZC1TZBjHe
	BI0lr6XSgc8cWT4ECHgZ53GnTanYk6hhk0t8L36hxIXUAf3UIziPyML7dNxHPYtSkmNMYdmokTp
	iWIiNouh0e/l/oCLnFwYuDGaGFlqQ854qxmrrLizMJEWxOXW4v7u9KIXwOAoRrPQqV6aHkmgHLX
	bIufmiVl9JrafwtU99FIu0OOJngq82+h/VhGYh2XmDr1zMnHQkmILqsTRuBf/3AK2ZyA8Fgb9/L
	nQ4sjw85ZhFdY846WoD+41JR/KyLVxge0wPBMa+Z5v1q7/tb9zvaX7tK04SUQXGg41vOaKtgyUC
	hS9dmQ5dnH19wxHP4V6vInKDS4Dnps+Oz/EzlocaSWxXuceUekp9QMeTaJb59zamLaxQziTvUuS
	GYPnSt1nWHriNA==
X-Received: by 2002:a17:902:cec2:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2e842e02a57mr138459075ad.61.1792028774224;
        Wed, 14 Oct 2026 18:46:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:13 -0700 (PDT)
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
Subject: [PATCH v2 08/25] ASoC: apple: mca: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:07 +0700
Message-ID: <20261015014324.5569-9-phucduc.bui@gmail.com>
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
from mca_fe_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as mca_fe_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..26022a42a95e 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -516,6 +516,7 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	unsigned int mask, nchannels;
+	int ret;
 
 	if (cl->tdm_slots) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -528,9 +529,18 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
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
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int mca_fe_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
-- 
2.43.0

