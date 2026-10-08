Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C422489FA2
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456038; cv=none; b=DvLLATLEHh21CMcVIcdLst/rs0S4/mjNfsrSHyxQRgu74vgd6xUAmWu9CWIV0YWXrfidlSYFrutXQN8ttT1XZj+bnx9Hfji8U5keQ0DiUpYq5YUuJgRWA5nApn3Bl2OAVgr/Bjf/440rkW4T5/LxpRdsRFUidRqPrSyZ+yijKhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456038; c=relaxed/simple;
	bh=nJhvrGr3lgVZ8FMtw/5ZoBJyNuHoH9T5gKcidfHw3xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhwFzGTXssI/k5+8ffU0TbuSugBXSLYCnzh0XSqjJQgibmlbOl7yjDZXVQfejSlid9n62UoNVq7BjI/mGH+CwVMcALY20fm1+rKpifggq9VoRQlo9oi+MVv6eKRU0RaIYqWauLY89p2bfltJhwUyFkdqLJ4KMIW9ICcjGOoS1Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpjElZLN; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpjElZLN"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35120d43ecaso7719898eec.1
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456036; x=1792060836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCoq+QQx3kZdKIK7QgXRpmYJ03Qsfh2Iq2ERtZh+EYs=;
        b=qpjElZLNOixPJlGEPulZjQgLBpVtt9Gd9yP6J/2iTu2E+HMgEaILIkp3x+NTGQlDbN
         pf2p74Tl++8lWd+rObgJi/KLBGfhzq0LXA9q9C/drvOkjkQbci9Quu+Gl7AzNlIwDGOB
         g9mAKmXV+EVmXQ3nkjgmmIXB4zcpplW+j9lnXKqfStBRq+htEJlhfNF61DFUK+mH5e6J
         KnGPSNINUX9Pz/YpBB0+EdNdaF2IXVKJBFR+0n/3ILiFAwbNwqHK0+tpqlyl9wTSMwlk
         BJD4MprPI5GPbMvH3XeIjVEnxDpnMPNOMwKt8By+kMaS41xtkCMQFFovTn3uevQPB1C7
         yz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456036; x=1792060836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DCoq+QQx3kZdKIK7QgXRpmYJ03Qsfh2Iq2ERtZh+EYs=;
        b=01w+upNdFJFJyASl1nCtqmVayyoKaZW9xSlKIPbrR9eepPmS9L8EZkXgFnSRWg804S
         ZL78K6MtE3FAXLmsWszn8BLVTfO5o+4+8v5QDOS1O7/bxFlsRRZ60ql3tkhTTqOU1px5
         mtu5HUeWzushq1yGrIB/uUHtcDzyIV5pZwx5eiggyvwi3ERAJVE33zie1NH8WnbvPMwE
         x7xCNh97UtyfpwaZ6uY+bUSs7hApPJ8IjFy14bYwr0hcWK4d7Vto4L9G0vpli62n2nzR
         xItJtb9tS+O19yiDfDaBCe6eb5oGhN/nXlqZPetYNv60R9/XF6ajGfFufFgz0W5m8C9s
         sDFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgg3Aucw0gEHXTdu13NPNgCvTmCqKm0SmPZCELuKgAV2ToveQ1J1bTQpn/vjQrMWin2T+pMg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIcQfj/73BKY1F4avF9EHJvnoiTr5Dj8f6LitS3FJns10Smcx8x
	wpf/usQ4qdanjWE+LeEjAmBFUy6X6vgjkDEYgqhKiUezbG/+3wM4j/4w
X-Gm-Gg: AYBFou3VMycummS4IoZpYtqkUsaJUg6lEPTSDumAJX5LoVvQeSry/HQmjL7SC7mhH++
	Xa77sma/g+z+eCqwXRa0b3S1hlP6SCUJyHeYUk3l2Sl2pLQvFb6lfomHGQ3r6Vu88oBSfkkn01q
	u+0+Iu2BXTyoefOKP99c6drv/pdF25t6Z57pqt/eFmJ+XIg2qW0hRrqDu4pxuL0nRurTTf11nIT
	AC0cmHrVib6aPJw9DPojOL0fJq4UjiP8LC+R0Le/ZELUYHDsx2zL+cvEkzw6Yri5xhvY9Uw/uUC
	xUoTsY7ywKUzE85ulNmN6HV7r7WDa5qGR8tMoXHXB77c5NSA1qANvTYIY1T2cxvtA2Nrfk1FdgC
	ChzTOCzSwHXKVbxDKlmDpQ89Z8/ataITI3E+a2pw4LRLkYIpuu3/xGJNDPmeBP/OPI4si1EN5X5
	iRb0eq/0349FrS6zPROWOZR83LHl2J26iOLzoOgujF/HOpmeXhKuTs6t6IhXcP9taync6OdwuLh
	pICbRE2KPFf1XZ6fTH3LK0H1QZWZfVEtmUiWs1WZCx74hO/c9YYnHCQBTWa1bL7nMOy9JAJd5jB
	XBNyzKNfgARn3HgfE/dnIQFt
X-Received: by 2002:a05:7300:b088:b0:34c:b75a:ac1e with SMTP id 5a478bee46e88-3515df70a46mr6358739eec.33.1791456036268;
        Thu, 08 Oct 2026 03:40:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:35 -0700 (PDT)
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
Subject: [PATCH 06/24] ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:13 +0700
Message-ID: <20261008103831.542533-7-phucduc.bui@gmail.com>
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
from acp5x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: cab396d8b22c ("ASoC: amd: add ACP5x pcm dma driver ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 831e30e9b042..33d59d992ee0 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -231,7 +231,7 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	}
 	i2s_data->acp5x_base = adata->acp5x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+	return 0;
 }
 
 static int acp5x_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

