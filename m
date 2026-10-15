Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C6E313E2C
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028995; cv=none; b=HNNYYqJcE0mM5+dXstIAfaf77O6e/RmePlKMdvZ1F5uxEdxCeiqYN2YETVv6kQyhqsWEEwk/IQWB/OrvIc13YuaklH0xD7ycx1RV18WVC8+HQD+5bvrqOKZJHaXD6DXBX/rulnHKfz+QROB7e/pmq42FaAVFiH3OiTfgCKGE4DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028995; c=relaxed/simple;
	bh=AsRVQlxF+563JjvP+sFHOx3JXC5esmyVVxsSsw++eA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhZf5jaOOyONNMjIu0jUN1DMzuyhDWehf62jQr7h6N0ahGbO/CgeuIpL6YUjGkNzOWAO6RV63sN6DBiRMF04Eh1catxDRo2a7jST9Yfs0cWmyzAJzFlWqDuNjtnwe0PHvwkhGPmp1qwGdZi1hQAPq0x8Zo7NNr372+tyLb0so5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o/GlKy0I; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o/GlKy0I"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e812e2b31bso26937235ad.3
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028993; x=1792633793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X8N5wvVyB4OZfrBnjP1FYFZJGH9J4CpZz0KjhM2upoM=;
        b=o/GlKy0IlPZj2VXcrcL7In/Mi5nUY2O3MsBpyh/AFNLRGhcBAf5zzMJ/vBg7+hZUCY
         lTq1wJvWbSn5QGntHlnK+9cR4UZR2Plaz7l+WKXGvX0703rB6EVXRs4f6WiaRlt7iaLb
         bfiTR2WICQqelyWhTfd48JtWgU6WFjy0ebPtCSIHZC87are+YOWVAA4GCJzzsn72Dk8m
         rOeQjc1ay+ZOEDOUAPRmaI0SWyCnEt7UArlkZ75YA91WykjVT+i9l9KTGoAWX9WfVIbM
         aEKAM3bBQik+pIcsnGlMvGqLIuF+jUa/9TEkQymh+VtC1430MZSZjTyKr/+FsdjD8rI2
         VTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028993; x=1792633793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X8N5wvVyB4OZfrBnjP1FYFZJGH9J4CpZz0KjhM2upoM=;
        b=sNOGvwuqOV/TyBlwdlb8s9dHxJQs+gh8blar9zSCurGAigTj4AdWjwkPyRh/nfUa6E
         RM9ZBgOok91+znq8gctT/MmBmx8w8P6wbc9b4eqIa9uogzLpJfyGsR6RA65bIyhWnNWl
         sTekrXsXE3d94L1xNZnT0I3266aHgRWcy719SlszE7pWTycqvwZjIKh5kh7UIX8Vn9Cr
         IzC/nMDqV0BqCTtSjS7jt6Rx08vBYO0z7wWsRXdSt9x+8XxuNoo2lOm5giw10qWLF6pr
         meKR/kMRHJ1stB1ff+CyW/yl1CbeSa1hwtXipVHNCnQj6dmNn9AH6zqfWA521tFolqqe
         we7Q==
X-Forwarded-Encrypted: i=1; AKwUvBx+1e24R1B5xvfo5QyoznmdL9TP0ps7xA76KlbzGWBbrrAX4zsR7HOfaabc7gGitNOshNlz4Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKtglDnSj9bpFoqTSbqJ8yPZ5WXVzhY+Ia2neUh7viDh3gWzKvy
	s5xYr3gWQVp7O+ImtE+jrE7ycS5HTlGB3gedHV/iIUOvMH4Sg1deBMh1
X-Gm-Gg: AYBFou1opxjJHoCJ4q6zyz6G12+3PzEbTdcLul5kENDyRKz2MlakrbfEQt1NrZ+PD6I
	wCH9hohZ9Ej7mUUJZnCyh2vyg+UlbvtTomc5+Qi+P7+/qL7SII00u/t1pig4GjmuikyYmJK+985
	20at6d9Fo9d3JAozvA5aj0wjkNva887XsOhjq4qFTzPASvnwFCHG6DHSTgcaX5OY5rW0pen4E5N
	VKmaRVpikyv6PKAPwYZCDlhuOtOUVvzatQBf5Nxxa8XEf5AWxaiVGOJ744bhTHd4Yc8dRmNt2Qt
	JAOcodX8ImZ0R/rODCdurxQqORZM/NjbRaYhnzavbjCNhPfyQ4vrtP3ARahZ7YkryPMD0Ip+Mgv
	nel6NJN5i2/Hv1Y+DSEZaK9iq3CsAQXbps8lRYY0EMi8z7ADWENUGRMGdNH5pNscGou37KBg+sQ
	uHJpFNsjNcqkWN6Lu7sJ+QnFevyQeEGlPgZej+5cODsnnFOecR7IxDl+2Zxwib0KTpzki4aBVu8
	OxN9ztI/q4dlsSMoQPcuYGSy1gd1Y1hozuJ3VgsjRXoeOP8gcVFeB5x8BvWJsn+cNQu1xXbVtu3
	UzXHD9pWWh4GDA==
X-Received: by 2002:a17:902:ef4f:b0:2e5:c563:c0dc with SMTP id d9443c01a7336-2e842cdb0f8mr158108285ad.42.1792028993312;
        Wed, 14 Oct 2026 18:49:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:52 -0700 (PDT)
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
Subject: [PATCH v2 21/25] ASoC: renesas: msiof: Remove redundant period constraint
Date: Thu, 15 Oct 2026 08:43:20 +0700
Message-ID: <20261015014324.5569-22-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_integer() is already called by
snd_dmaengine_pcm_open(). Calling it again in msiof_open() is
unnecessary, as the constraint is already applied and the second
call returns 0.

Remove the redundant constraint call.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Remove redundant integer constraints already applied by 
   snd_dmaengine_pcm_open().

 sound/soc/renesas/rcar/msiof.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index 128543fc4fc9..11a6f22ec0ad 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -419,18 +419,14 @@ static int msiof_open(struct snd_soc_component *component,
 		return PTR_ERR(chan);
 
 	ret = snd_dmaengine_pcm_open(substream, chan);
-	if (ret < 0)
-		goto open_err_dma;
-
-	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
-
-	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-
-open_err_dma:
-	if (ret < 0)
+	if (ret < 0) {
 		dma_release_channel(chan);
+		return ret;
+	}
 
-	return ret;
+	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
+
+	return 0;
 }
 
 static int msiof_close(struct snd_soc_component *component,
-- 
2.43.0

