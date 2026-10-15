Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890EE29BD9A
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028930; cv=none; b=P44Uxt7cnNnsVEydu2THYOFl0+SMXa7aL/FCzZd8laz7bCmhxz/r58Gmjpp2xCEM8h3AXfhGzTk5+yOItFDTBRSNRsWpTbcsB/dZI77zA287SI0RcmbyW3te9JXzVr/SWKYgCFeZzV6pdizjb65UNIYMo/we6epOiLWlwj9E6BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028930; c=relaxed/simple;
	bh=6J9ua4kM2AQ1AbmDRprUIZcBpH1X+E/0V7ZxxtKcoOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYBuZT2IPwlE+XWuHgbNqr/ho6ZRhAXLJQlJx8jTL/Q2CVzHqwFD/rtnRH+8admZ4yQ/O0h6aG0P1DBEx5zawYXmLAHx2eZIjn2wafQ/OCCdDGkYFr4bBWmgpg1ZquRIGx3X2YuKUQjEQCvA4hLJy0o7hm5CyRSk4ca52i8Kayk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrkbsbKJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrkbsbKJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e831e86ebfso8954125ad.1
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028929; x=1792633729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yU/tI1b3Chy6tvjhfXj60ZgAk9bekyFoLKnVljFmz1M=;
        b=FrkbsbKJTBzxqWubTNlASlKLmTTyUbIw4DNV3ChGVYbCVy5gK4wlmpFC8fGwYucZ48
         K8up39UudGZQXMRBfSi0pvBAHT/O+/n3GtNyX+Ztyt0sY4T19xjqHBHcrG160bFqGCVo
         AjWSuul+IqK+cu+O/vBxod8D/DPDEQFnPoruIp/KoA7yDMYcZi1rlmdQrxpw3Nc1seL/
         jszYClVFtqqh2cWxSnufDtVOwIaoyXFiSQgGclzdLbsbgS0vccr5Kq+UxnhdzerEuqf2
         fRljTwIiMVGEI3QaNnCwJoHmOzqj0hz0iVnktLCvUGLhAxYgTxtmIGr4l7SmJAKC3MmO
         V08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028929; x=1792633729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yU/tI1b3Chy6tvjhfXj60ZgAk9bekyFoLKnVljFmz1M=;
        b=Vi+JL1AXK8shRso324bblIw3NGn5tcIrB7csy/u65RJQl+bBFhGPIKIVaKGRsOzjNk
         dyFeSm6H64trehYzJLvEx9vvVyr6IGVwkxZrhDVlPWMtUQoSMiQRz/qcszuAuqPgx2Tz
         78uMfKL+eCCq09C/Jan5q9YRnaBv8U+0K+xD0rVspi6V0zum/0HN+IKs54tDyzW1/VfG
         SXpgjqePqXph9EFNg6DtSLXwwiOOweuRWEc6kbJ/4qvCkOFNcRQ/JAPXRZQKHugjC/d5
         Aj4CzsHa6qrNqGkVjf2mKqIdjUDCLJRgWyArKlKi0dt865ql90hNRcfZFm704ehehFgu
         6Bmg==
X-Forwarded-Encrypted: i=1; AKwUvBy4w5BxAcSwwhawHL+J+JamkZrbFmLUmn0r0Fj4qe7SzotBT71PqiQTgIt8AgDhbn/g5VCeeQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYI1evdSyp/C2j+1uJu5hKsoN3ldaQGLygnPvO7gcou/7eeJuTB2
	zZsh7X7ucrWXKsGyMnxQwx70DQju/uwJfFML9u7f6LRB1+KPNkl/EjUs
X-Gm-Gg: AYBFou1pBcC7hjUUQ0EJXo1z2IWJ5ELC5QxhhRfSyBvluFF8oO8liAILi9c2m7eV0FN
	052P6JlBRdL3EpVLodMRlRYsl4OIyfPXiv4McrZQ0t9nEVWBKz0CPSGZhrtUj7lrN/+TNEvLwJi
	rtrJU5AdKy5ZM9PogVBIeG42944DOrdzPy1J9iUa2kRw4jWJD/SvCbrGJp2d1GBnU7Nug5PmvzG
	UNkIRWGWLweN299X/JpTT7oql7A27GgVOLfiwj+snlhpmN7/XKLltiTfU+3YqkUP5A6piZ9mr/I
	IvaCzzsFwyrUOMNw0b3/2niqFW1QicsSIHKXYi1SRfrpZZz6CL65q1msYY5hfw7xAr8vRBqlyr9
	AAHs1jyNMtMyrJa5p5uFHRKUYvXXgzApZIWlCZbnsn++oWW0A2C8R8F2Fz6SgzVJrNYVGD/a07q
	upR6D8HB2eEPPB7J2spjcI+YFwcSahChNvLTosQDXWKswBV4kRyPK9CF7dp3s53gxqGw8zO6LMB
	XSBNiz1uLCeDOcbxogJhjE976j+7HBmrcHYH6geBFaQP4WtUhMkyqnjKJAGyVTKxDHRzMxL5/9c
	5hWlmtFp0fisXQ==
X-Received: by 2002:a17:902:f786:b0:2e9:3215:c458 with SMTP id d9443c01a7336-2e93215c642mr37739115ad.25.1792028928882;
        Wed, 14 Oct 2026 18:48:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:48:47 -0700 (PDT)
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
Subject: [PATCH v2 17/25] ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:16 +0700
Message-ID: <20261015014324.5569-18-phucduc.bui@gmail.com>
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
from wm8782_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as wm8782_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8782.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index 3a2acdfa9b85..cbf0c823c022 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -39,9 +39,19 @@ static int wm8782_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai
 	struct snd_pcm_runtime *runtime = sub->runtime;
 	struct wm8782_priv *priv =
 		snd_soc_component_get_drvdata(dai->component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
 					   8000, priv->max_rate);
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
 
 static const struct snd_soc_dapm_widget wm8782_dapm_widgets[] = {
-- 
2.43.0

