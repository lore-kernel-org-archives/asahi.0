Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FF63624A6
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028721; cv=none; b=C8rafHbAlZZa0ZioHcWg2bXWcfsIJlZ/RXvmobApJVYe7tSwt2y1sEUjOMV0uu45ffgzhPgYvyUkrBAD2WZfspaOe6pyC0coJqmkPKMSi5UCjZ7IUetp0otW3De8kUTay/leetsxoC40G489ynrhARCePCuAu2nlw2V/G5kzH1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028721; c=relaxed/simple;
	bh=jqJ5MSiUT4wmuGEu7gmmhxIxMq4n2gfyS3RH/x7Sng8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LApYgxvEIvkDkAY1UrY4R09YvvR9Derzb3McAsao+Bf49c3JBaGPZ7Nx3WzOAYzC8I5sSWROKPXHg7G017KNTyIWKatYr7wZiT8TNRJJtDryqW5OF//BjR8N3IqlztI73pEOD6czW+aUE2S+w12XmwT8zI8om/ObSYv2aK+/5RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6YIEjk1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6YIEjk1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2db80fcdf8bso27561095ad.2
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028719; x=1792633519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LV2XZk4JI85UeqWxHMk6K3Umo8587cjHfY2RFPxWAV0=;
        b=s6YIEjk1NPkOfXhtG0EJZYHd2wlpkwvkeWmVcdBzILh44wVyAYaje5H97pPyfRCpkS
         yzjKMoXzikooAKGDLW9DF22o/CzyKfCtFz83hCFlcHoa9bSaLBQpUplAWBMRji2414Qe
         pPkBxvIHir5hQhpvkrnUS5fn9vfccHTS2OWAw4Q2NyXdS08jzKnrk8pp5HyP1WSyokcg
         OAcQjdkuUYsf+aKNynJQSnaPvndi4LliPpizSW+ocXXAFW3L6kpQQgBpP3If6D9IH4TF
         0UGBiqrNxjDIfTs/K5GJ8LctMJzLd5YSTmA6KC147iFUZ6NZfEdmz4SkhXQlQD2QKzMJ
         97kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028719; x=1792633519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LV2XZk4JI85UeqWxHMk6K3Umo8587cjHfY2RFPxWAV0=;
        b=w5xCe4gTV0/pTY/wBo4QT9ox8sQyX33D2OemAhTwA1Rz7Xe0KhrshCy03OE90vNxaI
         UDUi/otWySS5DpPLiUkIZnsM16opN8aEyOUn98aN7ybwAF15MpTt/qNJaMtpZvprOwtr
         HLm4wTI/6062u93wMkU0uMlV33cm/D53rp3cB6L3lbi6X8xzLtsT3bCTaGYwGVep/+dZ
         5KTl/pCPl4pifq5FL47z0+3KPpRt1MH6QgdpHh0hrIWWXh/KwH+6JTTpI9WzlHxn8q9i
         9yqiLPXX31MpwI2eo8gnBF7wYDi8N33J5sjeEjE2u7Xq2HNd7/6AHkSpswX7clKQJon+
         XPUw==
X-Forwarded-Encrypted: i=1; AKwUvByi4fq80XsHAhF+AVazevV4Y9pQCORdM3HW+zQg7PVm83tOjGBTmskhJkuLhBOO6HW34SqkSQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYI/zwMBJ+CwidkbYqb32sXA2JvDkpIdlVlN2t6h6mGslXOrjVY5
	SnzK9ScsUkc3zlQbeGAJECd5OM79kjwxSyFYEtsz5khmnwd9p3thhL8R
X-Gm-Gg: AYBFou19dm6eO3cNwPwXCJQwHv31DnVlbK8W4cozYhCrSm9iWoRNLIYQZDX7SFIter3
	pMGAJ1gO25E5QWMpwUio6ZxOnlfbZ/FdTC+XFFyqPyvs2uZDeLgoP9qTMEujf4saJ9pf7KvO/bd
	n2aX7i7MiXQqyIBU7WwL3S51XpigpQsWkoXfeuPqwwVAs9xjxErsfi38QfvWMJ6dFp0plK4r3tg
	xYkaCRMolfa9xocYFSXJzZm/tHnvrySanC5gh6WLL0pTq9J55xi9kpAN8Dz9y+G1hL/bhq1JLBt
	jtETp6Dv4GQJY6gO69+G4QUXYOzFKUVf4aArRfjJBLfQosXxyWegdGVsclO4qjO4bRRvrd+oaa7
	Q5sKFeZXEPiSkLbvf3bEqkpQmnBDKqNrD9YBuvvPlrwOj17cCGKVITSNx994jct+12xTJh57T94
	btuAcM49hn/cGDAHWBHQg3m8QXAOZCxUaPG3nCwmkr47V7M9hzT+emKfCJ/mzyu0Su0YdsP1rCj
	MNskGz7olajYBrwebXWOPLKJTCb82JvW2w3SRQDuAAHFf85eNOlnA9UpVjqH6oh924liMBpSu6j
	YRzLXNf6XMynsA==
X-Received: by 2002:a17:902:ecc3:b0:2dd:ad73:5b6b with SMTP id d9443c01a7336-2e8429ab7acmr151706215ad.27.1792028718870;
        Wed, 14 Oct 2026 18:45:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:45:18 -0700 (PDT)
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
Subject: [PATCH v2 04/25] ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:03 +0700
Message-ID: <20261015014324.5569-5-phucduc.bui@gmail.com>
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
from acp3x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 703a6e22888b ("ASoC: amd: Enabling I2S instance in DMA and DAI")
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 37ea5c572eb9..765057499021 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -237,7 +237,13 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 
-- 
2.43.0

