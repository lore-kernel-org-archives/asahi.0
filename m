Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B111D42E41B
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455995; cv=none; b=e4Iy+yqTmCgPAIitdE2hoCpo3pSbEbYGxY+8cEIdMHb4b2hGm7/sl6KA5JGNsil2zQQcLsr/9B4YQK/mVhurTt4d2zmfuzfP9SCmFGA18bGrP7Cimoef+ZvLwCKAFyjzUl/CkeiLWnulaDfZ7jS+rt9VtMODAIuzeVLs4MpK7cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455995; c=relaxed/simple;
	bh=xzwyXU0svYILi7ZURG5eXIdZab9K6St2c6iN68qi5hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rNQelLtVEGuoJLYdEZ77eQIGJqA2BN4OeATDwpartpeZIsxTUd7rD07wIKLztt3Nxf473rqXIC6xtB4lSusOsfkcaLPrBhIFE6UwflZ2d0fj5THcbIV3Kkf82Wg4HGbqH4BG0BusHJtAkhx0ldsGSzhrXBAKpmQkzhklkIIPjTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0pkIak9; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0pkIak9"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33c2520ad38so6661298eec.1
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455992; x=1792060792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFcTZ+kGWiuWqdZS5yC9jJRo6WNRtV/WgwZSDkO0NF0=;
        b=L0pkIak9796Yn1veLCKDJrAl/NgamK4+HWFWh6lQbVZwNhHwLsbQCQK8qYhfbx1Yb8
         MRrsjHV7r0L+BayKfqYEujUIwfYvUEs4fHWWgA8cUlhDu3qHVfNR1iUXasP6WhSBcEHE
         At91epvZAueQgoH2k/pEFv2jLCm5wkXuIoQGsMPLSDSCuyCtgh1zxkWNPtrCaJXsA+Up
         XbaaLePxA6ESg9Y5ubB1EmINFLNCEzlIDV5ym3xNktFbss+f82Ib7gZ6kr2AfwBlT4Ol
         4WnR2kPQ2QKVkMyFD3iroPBK/LSsw1gjKfK3qvE/3lbuynFur/o/1eNLlQR9V+gNzkgv
         Pjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455992; x=1792060792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mFcTZ+kGWiuWqdZS5yC9jJRo6WNRtV/WgwZSDkO0NF0=;
        b=kJUp+HrE2yWC15N5qrDZrsu6XAtgll2cO2Sr9f7e2rSVFgilBb5j1V0DNS0B6P9arD
         N/BqREwWxDEBa3l8qyLP0rProYsmtuMRKERb8heYvCLi2mSt7ya0177/c6Km4FKwgmeq
         mrTDKlY1eLDvYILosU3L7HcYJA0J4t2G5OUDZEgTv5H8Lmim4dCAfdeakWrgbL1IeHiA
         lA7RiQAZWAEIbT2eQUbyj9QKfJQ2Ut7FeHL7TNvvPPDy15ypwPse4uD809GAmfDR7mfZ
         JCpK0fBnNdeYCD1blXJ7+aNZbEQMbZiYnzNHn2Uct0R4vF4sTlFuga5Hw7cqBEJC2bWx
         YO/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwiO06erP9XGWAFOrsQ+wVAKgvvFq6mhujacIyzKivCeJIL8qzb8J1C0SUWFkj+mnL4l3h53g==@lists.linux.dev
X-Gm-Message-State: AFq9FYK+wHJm8bo+jqejXoJjcg6WKcLMtjkvF4H5FyC4zKyBpWQZ1wmU
	ldD37DzDOCFwqsu896ThNyG43VRriOrK6oH5wgX5fC8lWn8t3AUd8Pli
X-Gm-Gg: AYBFou3xymDRv8C9qzddx5jX+s82yRrTDDc+6EZROgLyTS+xhKgDULWOj4J5hrTD1SD
	lWROtoLIroii8jGjv8BEcRZHYEscAXuKx3Rl6nnYjKcYKS93v4jU9sz7Zc0KOu19/KtMrERohAj
	lIy4dQRtNrQYbdJCyHN2vYvsUMF3+5S44UODZ5l2GRZQmTyE4o1GW8+S3nG8m7gSa5GqQ7aRbmy
	OMw4bpeVjsjlTdX9Q4IzjhapUXzdOH5/kn0MSSu1VX3t6DcByRClcHouJ1F+MyThs6WQpAZNLba
	l/IbTaL2kGm3wX6Ma2LrAwUt0z77btVF5anNigMt9hsNwY68httWOqLF/yVDHQcVFukKEskc13p
	hS3e001m9ryzUVSPN7gqtOsMt39URhaBevHnBp9Z0JjmQCgEkDeC8dfMq6CgwzkPcgPwl6ZKAEp
	TQNNPehFKMVo1rMZETvAZkati3HhEOg/LoKcC07OlV9QomcpK6/tqQILsCgz2ccuAETc4s9PGwJ
	mXmiX24QMet+YcDU/OsI7fw8bbn177A5l5elcB/xOUeJs43o0nBWZ0JJ4lKbrkp9ZKzIaZtA/pb
	1jbi+tKcZ/9C5xg=
X-Received: by 2002:a05:7301:3d0e:b0:351:5112:ec4b with SMTP id 5a478bee46e88-3515da5dc10mr5687961eec.2.1791455992008;
        Thu, 08 Oct 2026 03:39:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:39:51 -0700 (PDT)
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
Subject: [PATCH 03/24] ASoC: amd: ps: Fix acp63_sdw_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:10 +0700
Message-ID: <20261008103831.542533-4-phucduc.bui@gmail.com>
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
from acp63_sdw_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: f722917350ee ("ASoC: amd: ps: add SoundWire dma driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index f27ebbd21379..553fe11a2e50 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -337,7 +337,7 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	stream->stream_id = cpu_dai->id;
 	stream->instance = amd_manager->instance;
 	runtime->private_data = stream;
-	return ret;
+	return 0;
 }
 
 static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

