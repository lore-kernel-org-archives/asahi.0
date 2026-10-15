Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8D318BB8
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028764; cv=none; b=ToJ1XkSRxtqqrVOndVtmKQ6pjyFAjbdBeAu6jdq27EgGUvQLNNJ4wQrvoJHSkF84gH25l1kyE/7ZA9DWSy5YcCl9D8aFLc2t9PqiKgHWKN0dKul8oS0GADNww5MnSNzHTIF2yWFrtp5CdAEviWl1tCVelPfEaz45vgrJ6IL8x04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028764; c=relaxed/simple;
	bh=MChSqGnxO0vcLQoIbJBZYB9F790qawBg1rHdme95xaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDYFRzcVuz7CdEkW4oGfYIHCDws5tQeZOrN8Q9CRKdCZGskJ6LKzkCHUUs4bf0HNJ2wZcFwofaS64UBliTfEkuXyKbu239cbvm0Vc+hA72+2NxNhdhfam21qtK5UOjkD5JVHCBrOq3UCKG1rehycsVFTDT0lHJyaotrBJqs4xL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3NM4w8T; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3NM4w8T"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e60f9af6e6so12925625ad.3
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028760; x=1792633560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+glVHzZv3mmREWfVKTa0Xbh8v/mgn1NgWb1AqzOGiM=;
        b=H3NM4w8TrDlMODTW6SwNHLhME++2JwmCfzlgJCDsHmL6hcqyjh8YkiDWSymclYh1OO
         oxZ1lrjFmXnkvcMWq/p6Hipnq44IVKGOS9Ex9JKdWw5yi7H5Q5Msh3p3gWYc5S2wnjFg
         1rmchxaCoVK7GSw0dTvdDxzWY3SSeYoqEJm+pzO0Da9HdtsJD+UWOxrX6zcZHJQNSOBQ
         Go6SKU8J0KYb9zdS1E1ZWN8G1crvzc1VI4HFiYGrRxA76BVk0G1wu16v6pBThvULsWNQ
         pTHTUScRUr3LX4oEv2iSqtqGdAvA7UGw1NTJR/6766QbR3/aDmeyUomjoRYIjg29xbw2
         hlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028760; x=1792633560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+glVHzZv3mmREWfVKTa0Xbh8v/mgn1NgWb1AqzOGiM=;
        b=PQFL7K+eFpqNO5DsIZLVIdQMyBhN+XGWNCED+7uilpCNn+LrwpxTGpH2+NPV6T7Iph
         B8B76FMdIx4DO8201GQyFNpdE/19LK3+vb78JQjByXWcPh5krf39gmWkGQ4tPlq9MpUN
         fewgZD9XjDJR+fuAHU/pQ+zGRpP/BgZFpTYwe43WWSnJaJzOFW3/SbIeR052jUUpvREo
         JDFS643ET8Zg0881d5gBby1g6QfQPQGVAyLAm7JdwYa1uEpEuts+XunZR9ZFQayUCUZj
         nPd+kCwlKSmRqkGx13IJHUk1RZZw4klM/gaakWDPML3SCBMu5+ajiTxieBYfMnvKTdj7
         li6g==
X-Forwarded-Encrypted: i=1; AKwUvBzCUy3z4A0dmnh4TDm58CP1A1StY7FmDNLu937WCe0uFSOpgZrxetTsk4zuiveuCcH2xCuE1Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJf5JzTBsHKmYcaW82jj91fS26bWUe0+WDhBBOcBtoLWHrYSnYf
	cUhdMNrm+7+c6ZczjOLZDisDflujHCuxuZTxbMalrLm5rBx7P2xdlEZv
X-Gm-Gg: AYBFou1iE5ZHXLOc22GrM9WtVZBOkrUkKf0Ksmp61Bj5VOb0PhKyGfsoWU5LHBFdPIz
	QReWRPxNvhdtujmN21CwEK76XdjGwSo2usa8FDhdmL32UdauvdXFQDEi+dRZFocVhVJBEaZfEzh
	MUxlDBGvn/XI1Fvx817B2LIpGLPsrIazaw+ckeW2P6Wu8CxIsBXVWtIz506ZFBfesbhb++Xfujp
	K5N7EFMwZ4LmYLFlPhyn91PgGhgBn18tdA22a06XrHUni2JkUkqzX53EfvhRsFInH/bLhwDhkhH
	vE5vhhIVflWH6j+lOpqSCosSMowbmhUv5S/N5WeQd1ZdkRqg19s/Whk8luw6tL5RAMY1qFx/hpa
	Wj5eFkAK2GXTczYXXZSmcxGQov/nRyccKl13MiA+W2dV/o9JUisfIq7t54hKVTCahu+gd0QuvXr
	wq3wcYp/7Ky/xvL6qdDp0vs6TncTjUDUw4nWWh8DIG46Mq51rzVPvRGtDSQ68mAxqkLybBwydZx
	Vbz5g/W8rCud7QC33MMEXSPFBnSpwyD2SBVTJ6K86PO8dfSd1r/hEaLs9zd9Z9sKq760GOlT/Xl
	FPu5QIeKLRMLn6k=
X-Received: by 2002:a17:902:ccc4:b0:2e8:695f:96d2 with SMTP id d9443c01a7336-2e8695f9ae1mr130100745ad.25.1792028760086;
        Wed, 14 Oct 2026 18:46:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:58 -0700 (PDT)
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
Subject: [PATCH v2 07/25] ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:06 +0700
Message-ID: <20261015014324.5569-8-phucduc.bui@gmail.com>
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
from acp6x_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: ceb4fcc13ae5 ("ASoC: amd: add acp6x pdm driver dma ops")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 40c4d833f4ed..cba2509faaa1 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -209,7 +209,13 @@ static int acp6x_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp6x_base = adata->acp6x_base;
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
 
 static int acp6x_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

