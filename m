Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9533BB12C
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456268; cv=none; b=X0JKAGbF3cBGZn/t0QbaYk9/6o0auJiTl7AkRSW5yLe99OUGCjXaQRKLkGUnKusC8j6y8E7jzSXnmODqP400TqZjag/MERYC1kbRPFXTXdPNHKOF0jrGjJR0/uosJccI0mcaAxPAvGsikixEkbd6mMqtv65Ux8LGHKwCns8vE5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456268; c=relaxed/simple;
	bh=IeY1UCp2zv3XkIJvaFQJCH/Jamzhz2wdmHX15Fsk8cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQFNN5KNWl+PIZ0Qor8P2UGn0UifvQp9XWXvHpSpoXxXlVVNT20hCtDKunKPrINqvbAFSWwiEwvaT/8ii8avmXbu4/T7gSd3tiXl6twzcSuvKkMecX+vEqO2L+QaHohwdnc7nNmVGijY9pSk4/wS1e2uuvzkV3WhgerYqBOvAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8duAIVc; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8duAIVc"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-351767ef18cso1965713eec.1
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456266; x=1792061066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuLwPV5SkTfLeBmEQBHF5wyNVMglPos+3a2Ytz5Xtg0=;
        b=S8duAIVc8Z8sa/aokGIPBU8gRBveBRFs/zfuflWa7WmiSu9MPItolNTrEMn07uctuZ
         8xdCFgg3Aene+Oniv/UQWmC4Lp4uKiqOVwCBPLkhsm4IDinSHank6SEDK7YPZc3kaWSa
         ct4H4929XRbLk/WBg4ZMtHxykzwq7WsLAwxqgRuQgdyKYGq2341Vi3hJ/P7C6r2zT6jA
         rDptzognPDoJTrVYx6fa6FsnZMBeKeXM5uiOzQOWFPAhscL+27UvBvVJCLR4Th/rxqOy
         gcNC3JH4+FUAGj/fuP3FwDfP0dVnUHiivMO7JjH5us7uXBrHkTD+gncRqbfsLgJFZ4iU
         UCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456266; x=1792061066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuLwPV5SkTfLeBmEQBHF5wyNVMglPos+3a2Ytz5Xtg0=;
        b=Tw967TwPc9aJTg+34knF7LUej/bWwymzuwVovSr1mKXx/4PFuVctV54edNcXNxmI3y
         SR2E3npEp7FbLLg01i9yLGnvCDqIH9gdZLUEU+/ibii7+9+o4JFZJbH1QI2b4Ri7cTcM
         cr5UKE25eSxtCZhkCK0tNdIi9oMUYMFhSmdY4hU+YWNCCInMKB24DhGJ8qrY87Q3h1xO
         HyvAl0b4mb/42W/clLcN73WvVvXS96GXW+u1Z6i7DT4icWaVmdAFNMLZKvKTF42tD6Cn
         ZcAwhHxBJz6HhqQlYE8vDgLKE3QFLdZ2HeGRpExXrhYqP8lKq/XaJFMll/9k5Fc5M3X3
         0/aA==
X-Forwarded-Encrypted: i=1; AKwUvBxINo1Zta8caE4JxUMSl3dO+1ysfAfxrAlP2oon6Kjizkkj0PgmhBnaZAFNnyBu7idAzUB9wg==@lists.linux.dev
X-Gm-Message-State: AFuF++krBHwChI1wGw4P+tfdG7RWqFas1Hz1jh5WaQfSyZ74deMBRmTu
	h+HyTZXCvtD2X7nI8wiODhOQXbEbE53XZC7gmF59XG5D/X302PuwSXIz
X-Gm-Gg: AYBFou3L2Q9jEzc+mh+dNe0YYiobx0ugJoC9gwKp+ma/PwTDHxD4gzXoVHO+GKEFcQC
	j44FxGpw3FFHNLrelby9KBaWCPbxvFqCBA6QS/UdTKb6iizR95tuXnOaXysFG7x9v3DU4kjV9Tn
	lPokWHHjRXhoV9Em5d44C+/FNxsGtlkfjCkci8scw3qBxgH4YJo3JXbxdSumBIof5smv2H3YIs9
	pS0U2UcGC5BqhS7cE2/RElfYmA2YvbSnHjwAQDnao9AFBrbPHsG+kW/BskesNLB7k5vHqTdCDYA
	y00L07U0ke44X86v98LyDJ/LTXYqA49B9oZyjIU1Pd3W/LqhebBbHg7z3OOhWxlXZK3KuFULnd8
	xCu7gMl9PBzO5MCorZ7I87RBulFh4ZTGz8OJbOU4+TV31W3/Z+E3/+K2+P29PqTFwXGfPq1rLiX
	fBG8mz9TVQYF6A6YuWLFF4zLGmxkqa5c4JK4zIVpamjnzz/l700RB4maeUw2pv4vw9yWx94JsYQ
	8JZBNbhipiHYRRavJ9JFf+/ZCbKXo0rYpmYiKRm1LKVEd/gy++Ckdu6xmRYHX8cxNRWJsvQeFDw
	gemqGNZ70vpiTQ==
X-Received: by 2002:a05:7300:d408:b0:34a:e7ba:863c with SMTP id 5a478bee46e88-3515dde5512mr6327305eec.18.1791456265752;
        Thu, 08 Oct 2026 03:44:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:44:24 -0700 (PDT)
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
Subject: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:28 +0700
Message-ID: <20261008103831.542533-22-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from msiof_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: c61caec22820 ("ASoC: renesas: add MSIOF sound support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rcar/msiof.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 128543fc4fc9..9fead9a22cdc 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -427,10 +427,12 @@ static int msiof_open(struct snd_soc_component *component,
 	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
 
 open_err_dma:
-	if (ret < 0)
+	if (ret < 0) {
 		dma_release_channel(chan);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int msiof_close(struct snd_soc_component *component,
-- 
2.43.0

