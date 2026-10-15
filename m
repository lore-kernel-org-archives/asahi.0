Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A46834B1A3
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028674; cv=none; b=qKZcoFCXnFPcSEecuWaMtptxuzjeqD9HbBAfe5nVOctueHj+mKuD/ZIvegSneHG5THRCDzzoTY6s4UMjmjPzqidnRVQyHlp/sJB7o4Esfdv6Ncp6DG9j+6ZBdP4hnG25r6ICZDdXjMMIN3lWxu5eQQj8sAeTYHM9Du3q2AgElL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028674; c=relaxed/simple;
	bh=PxltNMQY4Mwf0miBiwGdcHoJbpALYxNGOELj9h3ky6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rvLqNeBpg4J0tTMvOE06r/IStaKR72dz24bpX9DY6un3jb46yCiB+bvkmsdJ6QoIxViunEdIPOahwTWFnQuGPSt9Y++lO+WDw0A6Cx4h6lrUyeNAPek8AZw+MLqWc037bmjRwLY2sxCNpz65gr1d9ZpRJGXXRIy4fUuAe4mdEUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uq5+qEYv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uq5+qEYv"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5d0ee1951so29990205ad.0
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028672; x=1792633472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0f9CDxT7c2yfniMxJX6Z2S0DK8dovzfteRrAqStY2sw=;
        b=Uq5+qEYvwfWDk8Q0cEn3cjiTxsuEsWqqMF9aRESUlyCRQCAi6Q/7/uFLWTIiYMguvF
         njikad8iNQQrnR1BcuWVAxQd5VZs2XhOM4Pm1HYwMpkwVuTc+joXuwohlTUUcxtzoLEM
         rSYDist9KhrbBYFV6KMimYzhslVZYbhoh/K8xWa/BlL6CKvHrIsrAaeqBw43420ysoa0
         FYmbBWSKq42DbQt5zkV+m3x7XTAl8xCyDqeZiNNfjs7m3chkNsWU4zEVnRUJCq9TuAJ/
         ESySVUKpXL6leSSdr8ZX1UlOWzbIejmccNVgJpHGULSFKbSokQOKycuBu+++Efd+hOvr
         prbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028672; x=1792633472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0f9CDxT7c2yfniMxJX6Z2S0DK8dovzfteRrAqStY2sw=;
        b=ytO0P/4wztfoF/Ro/AHnod6loPBDqNyiuxt1GZU0FRjS0xIfEuOTqbQtI/63mSOS0y
         8Dfyqw/ZFcFWWblkkEQxN3c3TWowkgkTCswITlBhcq5EJZLLav6C5OfHXNrdt9QIgwdV
         wkysl7Ehvdi7KhSNNQIgkPFIMkJ7fSgrAPmyooGfRaGBwRPWr4i4hJczJxWBwsfNnvSq
         CY/mLA6pMA19PLTaOIg/9nV/Umt89fKPmZ04HrYZiJuQwjYtSotBnlXlqQN/du3TcNVw
         +2sAmVM9cpzHl21urS+kFjnFV9YPq477lF5yMOUg7sy7qWE7hhUeJL/z5C1h7i5QTDdg
         PblQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcx2RXBoYaD9iEbcZDPuIDTGQ6j4jGHolf0gD5DScbeoVzKqYjxMiRq5MxmTuO9jWvIjZOwg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLsenD5lPLIEKnnzPyS8AUJpYblEWdpBddA4j07Ye4EU35ItURC
	nZt5e9bo48WK0Jp05RRX2j8hLlIm0SxKo4ZYAwt0VjH3VvNvuDOhxY8E
X-Gm-Gg: AYBFou0nrDG5BSbYlwxv1R3fMdY0XzNNaE+MJOggryHLyDtqSxipaoQBadjUyCu7u9C
	r3z4DULjuULg9OhPpmABiQDksclJuEwFV5MmHvZGrW0+rFz7z8DORa91gMitqyEmaV+sCXdFdDs
	2BrFwNvmzE5R9fMcAQ0FH1Wyi2o66k4kVbAApWya3LKvGSOkVFWlYZPp+UEQbOah2IxzZ5htJhn
	coYlkbofjELiRDIY+2jXzf0cHUt3fILcGXNg478lGsieXasBkl9+45T2t5PyRJX8ESQA+oMMlnP
	YH580rZLjGAL1Hg5Utks8zCZ2bYwCe/Kl0n9yaQ05HEF2sjTLt14kHpsIAbmHPxCj55DFECy519
	LS3OMZKTWlSWBri785y42ORDWpAtnXnpoTp6OZ6Osjw1usU+Qyu97iE2QnSl+YW2CAQCZL3Hg0X
	c07FYdzPest1gPrriXkX5oUJAB3uav/T84/QI1bPLtvEkBZV4xBgWUe3TBjXBgE8ZODIVO4lQcQ
	ZY55RKiBtQK34hR2Q1/jj6IWE43ganHaUubIsvqMzU9ZK+suImGhVi0jE1as3NljqcJEdUTsX0o
	TRHgHtxJ46Z/Kw==
X-Received: by 2002:a17:902:f541:b0:2dd:ad73:c938 with SMTP id d9443c01a7336-2e842abebd7mr158700385ad.25.1792028671728;
        Wed, 14 Oct 2026 18:44:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:44:31 -0700 (PDT)
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
Subject: [PATCH v2 01/25] ASoC: amd: acp: Fix .close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:00 +0700
Message-ID: <20261015014324.5569-2-phucduc.bui@gmail.com>
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
from acp_dma_open(). ASoC only marks the component as opened when
.open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 623621a9f9e1 ("ASoC: amd: Add common framework to support I2S on ACP SOC")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/acp/acp-platform.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 6b1e18b31c1c..f2c8853775ad 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -248,7 +248,12 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	list_add_tail(&stream->list, &chip->stream_list);
 	spin_unlock_irq(&chip->acp_lock);
 
-	return ret;
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int acp_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

