Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE8A2F39B5
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028791; cv=none; b=s6GEik7MUhNJeABRVY2bA+MVSTUV3YyqEvNIloin/nzlj92o1Zge+Bw/RcJX6x1PnO2aSzNH7HzvHn4bJxkPpx+ZWdKc9+lXICnAt0z0SEg2QYPChFKBe5dt7AH3kLReJL0q38/j2vxOIk+MSP0YhX0v8LXINZvbaoKu9pPyi+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028791; c=relaxed/simple;
	bh=JyLcEpuVNYAJZZcS3MtfM//iTF4DoBGRH1sMBv09uo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Br1C43U5DJgQ18u4qiSW5qedc46feh7GIrGAmMhVYJ9sVJyPEaITIvtSkj+lBIqE//oSz1FdZNb+XhAO7JDqpjUap8YMQi771GsOQDoBIEGTYe9UUX8oxYqUw8N8nFGdaYs5cRc3XOgGWOey9Z/T9Oc5bat1cRZvVw1eK7lpUmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlftQLiW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlftQLiW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e934449bb0so11209475ad.0
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028788; x=1792633588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVoaE90uxAa4MGE2u5YmtFWHqpvVUok70EqIpA+eTKA=;
        b=PlftQLiWz1YvvJSfw23KXZfbZdlffswfTR+iylhIyMWQRfi6oJVXLH99Ysnez2Y2Q0
         lfh9w5FSVhHP3EVjbJmMxF9Hf32Un79PVrjt5walzaOqfxIX4wUuVHnwq/BI1tjz28f0
         NP5hE9YTh/ZLoaPvYwZ5eYHYJ+/fJUZU/vGnggAw6WN1JhQzUVQeaOl3W9yHvOoW/ryj
         7PEGipO3BNOMzvakkgU/2gt9nksLiA7RH0bvCBl6aQxfWLSnGCJZd9ZcanmWsovhnLCQ
         d5M3eisfyqQtVTGdFOyesi1gYF3OiLVPLpTUvy64TcvvCgQS9xSMa6wI0El2hYkrJxtt
         XSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028788; x=1792633588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVoaE90uxAa4MGE2u5YmtFWHqpvVUok70EqIpA+eTKA=;
        b=0eVeszynD0yG9HqUorBgcUbOynn6SHWmPLazBMwnd3+KKykaUfRjcDS14TSMPit48s
         /5UsYailb6+pJnNqB8xlNGI8XK2lvxkxYB+jq4V5ckdXsXun6SIAj12ZLzi3SrdglY1e
         P/rh1KDiXOkHnyV+oamLYVb9doCIMgmp1+Rx3DtXEC8XZvTKv3TvbcXS/qwvYDbVx50V
         KqQ3RBmVp903GrqhFzZ6JYgXxB/W4GYe7OC7IQBJaiReCLJc3MYUZfw4IRlGStDfOklo
         AQmnljRAzq+0poSbD6XL6KfO+yMlmKOxN0fmtfg192Ccb4KqLFuCpg/tlMxscCUI6Oxl
         NXDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjegG5OoMrVnOcUX0/Zz1oX+dxxvlBF1RwChNl4Y8FsNowRCnt3XRmkwlrHUouNXE0OyriXg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJZBq1q8WYhwHkIgMbFs5K73h1/SO+r6YbQmm34xCZe4CqD98Co
	izwrQs5PYs9mPNvt+F3WWaru+EL4a+tEqi8Jyo696lZkibESidtyFQea
X-Gm-Gg: AYBFou3yYrfNCY/HT4FnIg6igdhM7GIETacoAPmDGObvk/O4izInzbpaOQm6FbFLSFK
	cshPV00vE1hQWIaUoxxCITaUTK903ibmfzso73CA1A/ozTM4zuSqJfEasvkSctP59Tw+6D2meAl
	o6ZMJ6Xtm2UFkytgyqMB+ajybeyFXsT3nmM/JsKhzbIiPanPGTgPGr61Hlxdi2htnXc0uGuZS5D
	6Iwb9vjrtYHe+UeBFtixw/uvMZn+H4G5UPyYlJuIZHiRfikRyA6kifYg6kkBzcWjGE7VwW3yK7+
	ihG1gDnZjql2o0VrfPBt1JALL8BCp7Xrrbe4EVXhFnOn9Q7LDw/SW9g51RZjYEY//RivJ5RxYuA
	UVV/cvzsCF9kJ/09eGviueqngo8zLqkcH/iSSTe3cyDaaI/KXDsI+CU78JpZEJW4g4mLvbsUm8b
	q97jNP5BTx5PWjWX/9RuNEmd0MP9tKAO6QSQbhmFrQjZIKMSazQ/D4PEKG039A/6a2rukNRkx5i
	845ecB7tch/2X5b8p3E9CxQbCzi8nUl94qH6d2ywx7B6+aUO1X4CBht8JKdGjYkAIZhbplDDQw+
	U66qumW6Rqu78Q==
X-Received: by 2002:a17:903:38c8:b0:2e5:e3da:be04 with SMTP id d9443c01a7336-2e84304792emr134212015ad.59.1792028788486;
        Wed, 14 Oct 2026 18:46:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:27 -0700 (PDT)
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
Subject: [PATCH v2 09/25] ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:08 +0700
Message-ID: <20261015014324.5569-10-phucduc.bui@gmail.com>
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
from atmel_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 92dfa6198623 ("ASoC: atmel-pcm: split into two file")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-pcm-pdc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 374f93fa6e0b..4cedf2ad934d 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -295,6 +295,13 @@ static int atmel_pcm_open(struct snd_soc_component *component,
 	}
 	runtime->private_data = prtd;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
+
  out:
 	return ret;
 }
-- 
2.43.0

