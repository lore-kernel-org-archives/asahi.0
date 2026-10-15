Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD6236C9CC
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792029025; cv=none; b=Ui9PT2VTbjlFYiYV9ddN7Q/p5oot0A2rSkGUQC4DcRLqphfMzmiPfVEb2rq7blXi4N0e9RvpKBSOpA+3zFhtyqeERhpVlgJbNG+bypjyz4NaQwr7BJr54VvQj8Fy7yaXUaQqn68QQy1tFz4wnH1Cda5QnvaUl5ewfle2KfWexoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792029025; c=relaxed/simple;
	bh=FZEwana/OW3ODi6xFN55pPX+MLagNsoGOIMAf6UwyHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K//b+56rn9fnSGbFDuJNyFF8M1kKrpJNBO+UjDhiXgmZ3VpFFNRczrpj1sfKixjbbGDlVMB8v/ossj5PlbCV8F2pGX4hT0g/ruW4fGqyu4Ny7Re1uJ35DbnfFEc4SyduiuyG/mcjtWsw4KQhpZ990WxSnngJ6XPZ7lJu1MD0gMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=suCtmaKt; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="suCtmaKt"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e49fbf92aaso28046035ad.0
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792029022; x=1792633822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=adbLjE108wpHReKKgrEkXzgfA1DRZ6TN8trHQTyRjGk=;
        b=suCtmaKtrXVGs2/wP7PEekmD1UIaGpkmD5GKFYdTZRLOZnztOX/3JWQS+eKY/WcC3d
         Uc6gIYEwvvJ5TcmVSt6klpX77GOPMhlX4Nr81JUyDy6fERqLKjlAkYCYsO2o2pFSdcT/
         LsAfk1gyaXZ2+kNrFc+p0u0MmIWve2Lq0Bs5McVNRR8sGjyodxt5zVhd1ac3Xr81bRcM
         2hIITsli6kub539Gl500THnLeEZZef2Wyq5yPHBfeijn9HKmNOhiJhvMHoIjNSTK8xk4
         htHM6R9is6PighYXPFBRt7H4iw/X2ifnYTtaKL336LdM26S0XCanCCMPlUWoWGFUL2kn
         WMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792029022; x=1792633822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=adbLjE108wpHReKKgrEkXzgfA1DRZ6TN8trHQTyRjGk=;
        b=hrXBya2H6CM9VJ99SyS0Q222NezF5U4uEJShqeeQ4nw+DxwA/hXo8f8rOrlR9g9+xM
         nlGDN0mHF7KfyGDejJTFUJjGJER8eK+UsQsvD18WHjjKs4E2qC+tIGmBuMCQB5OZFyx/
         COap77q/smwHqHvH4lJlhv+Pp3LCv2xgrXF+p9s9yhfOI1AHL/lBOurio4Gvs/LlELPv
         V1WWI+kQHjWYud99+5hVEQqFzjcIZ+IeHxv9ZGxWtekuYmdbqdzsO/I2KX+Mgpc0F2D9
         +EqgXy7Jwl4/9gGBZRsLd2ixTkZusOb2+NlhhNxKlWzORUvw0mY4D2OHuaCdP9sG7h1M
         ocMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzy8qgCzjce4Su5KSLodYJujJyJ2Xtv59atTkMA49nXOR0qXFWSQ+ezYORUmZRxoaBFz3zYRQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ+L0CLzFhm1RW7g7wcSsl1/coPpBB+0il5zB7GLVyJWgt5b+/V
	W3bFgEuJMce6cFqDHN4qfvEUbOtP4hjYTyi0wQk6wD1h0N4r5sMeRhYY
X-Gm-Gg: AYBFou3I5XcAYjwV05qLRAI8vCqsTvk918JgltIbtZS4UBkIS7gpuh9/1xk0MbBLRh9
	1oMYaOv6Eh582AaavJEkxuGaYIvYqa1egn/owoyLGmz9n14gFyVjp6TQjJvcKuwaMPvEuZ7hAfe
	zupeKfi22QfEAwmvFyN0muYTVfLQOzJUUS4/UiUxWaSC8mRMsg/BlLBs3KHU/FUWn7+PWy/zLMK
	qXXydl14cnL1yH6FWn4tfdiPWH+4OfEkNEI12FObRgQXuvVGXJZMn0/nd61l5j7gsaS2XpHu3s5
	Chc/yJPlGQDGuD7vb1+Ijc9sq5SoYir7EUn5fEuC1sIJ2P6kL7pvC04dbqITYURHNKbnvCqc4eA
	d66b/QLtRw1bb1fnOudYxNC+CIXVujIegn6w0QathT1oUoFv+BBgRsU5woUssbYoTPU50QQ5iXR
	dPHQV42cqRGndfGCksNdOMEou2LzGKA1SndkiOxaUcH/UcdAfTiYyxahUWMrkRf3EWd3ikdUTgT
	BohK4FXYjAAD5X/Xbg4dKcYoZ+I3rFTqb2EKakej11qYaFhO1clP+ZP/lCZwtwolZhdhGU3pZtD
	DNuscSNllPYjLA==
X-Received: by 2002:a17:902:ef44:b0:2dd:c100:7cbb with SMTP id d9443c01a7336-2e842bc6930mr140413355ad.55.1792029022012;
        Wed, 14 Oct 2026 18:50:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:50:20 -0700 (PDT)
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
Subject: [PATCH v2 23/25] ASoC: renesas: rz-ssi: Remove redundant component open callback
Date: Thu, 15 Oct 2026 08:43:22 +0700
Message-ID: <20261015014324.5569-24-phucduc.bui@gmail.com>
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

In DMA mode, the generic dmaengine PCM component already applies
the integer PERIODS constraint in snd_dmaengine_pcm_open().

Since rz_ssi_pcm_open_dma() only applies this constraint, remove
the redundant component .open callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 5f4a53886541..9a0781bb072d 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -954,13 +954,6 @@ static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 	return 0;
 }
 
-static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream)
-{
-	return snd_pcm_hw_constraint_integer(substream->runtime,
-					     SNDRV_PCM_HW_PARAM_PERIODS);
-}
-
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
@@ -1011,7 +1004,6 @@ static const struct snd_soc_component_driver rz_ssi_soc_component_pio = {
 
 static const struct snd_soc_component_driver rz_ssi_soc_component_dma = {
 	.name			= "rz-ssi",
-	.open			= rz_ssi_pcm_open_dma,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0

