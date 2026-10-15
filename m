Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09660356773
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028734; cv=none; b=hPiYcjUhHYh+RwsJyE2rxilEcza1y7hw1XaCcuxZdimOou8c9jjEnAkGLSh21NuEgGbGt/RuqVAl0NNmoB/nzEpR5PC2KOg1Uj3Bl5m0a4mA5DF1aW8iA1F0dvRV9hBCxqBwqGcrF2MBGu4Q3I8SmYqimTzwi56bruBXoa+WUyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028734; c=relaxed/simple;
	bh=42Th3Qj56b43dUmPcGDSjuTLub8jxmLc2kGADA+KV8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKxfE3gdCjlTR1+VCs9SeaTdkyTucUsNRMgWcoZ/fvVD3WRdMvBcW5plbHh9BIE5boYCAtuSY6pg3yWJQH662WN/qNdVY4HzRRBLAhqvG38Y+mjDTZqZ5DReKIY+bQCDT+RgrqunMEHIKs5B0ZcGoTVts5gfcaNTTAD4yxlOXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBvo+iqc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBvo+iqc"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e831e86ebfso8943765ad.1
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028732; x=1792633532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eK8UF2f8kXq1TEqWl9Zyp8tJ5HPyvJ/UCpsqtpYFERs=;
        b=FBvo+iqcxvQdPsUwkZcihAZUJ8t4doq+AccxpqM8IlbwiNxZxck2E0jpmfrmlMVqF4
         OlhKBuZnVVec8J7P2SOYujbmDfV515hDl6U97RRgmUVz0PihaWdgSmV9X1h6j73AHRx6
         +5hUT/yJNexhcNWyO0N6K+FdHBgvy3pCDDS193FBllvrZumF8KxIJ1EhEl1MbA9hstMh
         W8AM5toRFJhtNPiwdvFVdonWYrZ0nFiaKgwUzrrx57mz3PbT1UG3NbTUkUXo1+0nW5al
         S52Ar3Jwofl9ngZTOF/RgXTmShwXua4+FBFGK4VpnpI/BGhs0Z8poV61jPGwRRb/XJuV
         Aqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028732; x=1792633532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eK8UF2f8kXq1TEqWl9Zyp8tJ5HPyvJ/UCpsqtpYFERs=;
        b=2p2SGqLbmPehsgcF4J4yFeTZHVA18MQVwMFJqhK1K4gHVJC427Gcy7An/rR3xN8r6X
         OIV3sguCJvP8BRcr5s4IJaDwFVETT8wpFWEtjQm5DZwljDSgeeF48P8aa90H7u8sd0wn
         HaROcf6OtVV3KB0UumsBbszLU+soTNrPZRJmJFQAolSBxb37ebo2pKMfKf0j7M1R4tMb
         CXIyNIwKloIXwfCcp5tD/DoBWiJ7m0kjrCYk8CqAYKBBLufyaa0qSGdtOGuhTYt6dy9F
         v7pgOSO6sX0YgKPi8+DujabP4yLB6ZcEIqbyiP56Z1HBBqWReYqczbpK2acnoc2oYWTZ
         99ww==
X-Forwarded-Encrypted: i=1; AKwUvBypDEPR5spXFR8i+peIvrPs9boCjSxe3AoIkPKpwhcWCqQdgmNXNLTn6Wa1orJ5WKFS+YZqWg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJkgFhOj1Zd609lohI3StLUWbZ14J094i6ULrbyjYNcbiwAspjS
	8vLjBgcE1sqyJIgDxqya45Djinl9iBc/BdDPypGOJ5F+7O+ML5Q50qmR
X-Gm-Gg: AYBFou0F0MHIJJXg5/gbgo/diO0TPmOK9Pozfvx8bmyHI16Es5q5EHXl+LZLxS68CRa
	D8NIhWBp4L/ZhYbAPOqxx7Euu8bBIcAfjAju5cfyEcPzj8HE1eQ+GEzFJDDqsXvqxj85jY+ruzF
	adZOrYu94pA4EFYYERo/KdRwQrHdzb5zGF/zD3dAgzIsqGMzFE0koXWYEceI/6Cg92BGVDZHfUw
	yeV7xPo/J/hfrcd6eebdCq69go8J57kuFGDx2Rs0Fxbs4goYzGZ2wNF3Hx+mKWYn+CDsOzMH5Ps
	c0/tOCiMcUMe8aa1tLOSpUoQgy/I3kI/mw2QG6MY2NBVFbWzpwg38G2TGd5RpnS/Xh1I6GeOhoe
	S9S8BTRQmOXM+nxDuqusJHs2C6zjM+2O+TgguVUMIVPjsRcJy7lwouUY3p74l0/ty1A2m1EzM77
	PHOzlCu5VCKnfXt+c/uymuXkEn2X655GMqAMI4EUEB9Vz00IBhPeSuy91b6flcM3gL2gzsIVDUK
	Ad1CW3db8MWbFKGj2bsg5ZhH69V7haZAPPvzVGs61pqUks3eLcFWQxC9Whh/uSHMwwNjxCdDlI+
	b56XoCGHVtykjg==
X-Received: by 2002:a17:903:19e8:b0:2e8:79d:15ec with SMTP id d9443c01a7336-2e84280afc4mr161680265ad.6.1792028732357;
        Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:32 -0700 (PDT)
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
Subject: [PATCH v2 05/25] ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:04 +0700
Message-ID: <20261015014324.5569-6-phucduc.bui@gmail.com>
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
from acp_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4a767b1d039a ("ASoC: amd: add acp3x pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 3f59b753243d..89dc60849c06 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -233,7 +233,13 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp_base = adata->acp_base;
 	runtime->private_data = pdm_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

