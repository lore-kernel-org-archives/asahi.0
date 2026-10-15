Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E51936EAB0
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028945; cv=none; b=EEyixfyF8U2aLeVmwBuI4ezHaU3YKcMGRcqsWT4QLixHhfYEH7R/nK+ftzEMUvVhz5JrtLbc+TqsSRXCum1ks4U0euJVvQEvpmEdNFwcNERA7CPHt1pEac3cYYelt+hteE573WZdbCeWJC8jLFzLSkBJ3NuM5U9ezMLz00pKmKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028945; c=relaxed/simple;
	bh=DUWEL6UBJjwb+FrcYegjJbSUhp1MVY9nmyM190lvMmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jfn3fhjNw/tv1+0G52n9Zla5DAM7g3Mf2wE4t9lqwZGXIHnPXbFd3OH2Po5SfpvanFs1UIQmlHv4pBcNA8ScUVD1VTZqWwpneSzEIf8VKoUjhui2v6W/5rv5+WNv6QD6HXAdTKtk/ZA2c7BYuo/SJSb6pe0AFVfEGawb/B8g22k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFt43v0/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFt43v0/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e5378b281aso26427965ad.2
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028944; x=1792633744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1jbxv0B573E/6JvVMqt4p2dOdYoex1i5fkYQYaL9us=;
        b=tFt43v0/ZcWcZ4SnkcdhMMyBoXC/nmU0jSotAulyIOATjdrseMEtBxoF9LXkzAzqBN
         XBQWzXt2joIQgjFczSYbiRCSR/sAGVpiLse45g9HFjLBb9QuIETqdaefEQK++yGp8mJD
         yBZhRPtBWRGSDXXtK7uqDsuZqJl9COt8oAYyhFqkPA3K4hiXom3/l3KpbWusfGVS8/yR
         fKe3iI0/B8Cf2JMSm85L1uaK5en7EKdjPxlDPbzXNxl2WeG0RRDEWppPMw6Sx6GHBjm+
         5oGgd1fGGQSXf4Lnfhhi/1Fz20m/apPT4qtOCe1JZnCROOzsf4qQvmTJVwx18DhwnoEC
         fdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028944; x=1792633744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1jbxv0B573E/6JvVMqt4p2dOdYoex1i5fkYQYaL9us=;
        b=aLEVJf0bLwoI0Btchp3dAb4tOVGiBH03RJBSdsqWCwxbU4UIkZzbO4bAKcfeeRCdgc
         gFVuP8lAKTSbX6k2Q0+iy/pp4D09NO+8NYDQL4NRKHwpCVBzvqJPVjNUBGA4oS4jUW9/
         wD8YLfiP03rxDiUe5b4wwJBEOUeXqtPFTxzFcAoI14cRod5+pfEGzWu66VFzSseGoOIo
         2TwXKI1jbkhDGjw05BS/qnkr3Oq34/pE1Oc3ZqKlLrpVyVL2VyDim2qGbXGyNPSwqbpz
         aCiWMXELzfh5oQrAYIlnica12UWxp2WH0VrjeD73us5Wd3nbVB0iL6wYGDXNQ9VhNehY
         v7eA==
X-Forwarded-Encrypted: i=1; AKwUvBxxjTx3+/DHHon9FxAKc4iB4CtQKmcX1TGLTya+vqKiDrptoQeQEH2Gen0XLH8H4DlMpwiekw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJZ4SEMU7ZC9SMuDJcIeP2tgvKvF/Fnv/oavEg8/NV3wHnCfzxJ
	5EuoQDDCpliq6w2Kxdz+EBsVGSd1aT8u5pDSCFz7RYB8DuzvsalBkvjI
X-Gm-Gg: AYBFou0t+rPz1VwLKVZjpwg4KLzlrPQvjFaZVQwL+NJPJfzE3MBVifAc81B2ScpcY0m
	Z86cP0F6tb1o7sAC8jj9J7S3GFh0KQJE4PFsZROlFExDGbv5VfPPM6qDkyctb4t8S55NXCrR1Kg
	Sqk6eAiGJD0jWfgdxJ/fHlVuBJ8LvCRhTi1I1eEanpCKexN2JBA0ORCJJCJnMZd6u5Wp0xhLEod
	fedE6OtOCgXlVbkepWspxCDy9jQ5GiTMFQCVT+2cxyvj8PFHZiNRz20ZmdQ00Ekcov/n6V83hRt
	csDgo1GlT4iF/T6cNLHY6dcWVMfoydaMp4w8B+WWlRC8Y+2qi5vD7tW3PPyYyJulKLJfwSM11F+
	Fwff1V9baPuDD5FaACFmUWgwKvYjCW571Wt3DQ2TZMUsb5pmert3w0bZitj7LELQ6e3I6CxKrvj
	2OZtatd3icrB22vmZyVmN9I6f4XroiwitjaDHbyhcDgX9K8HN5yq3M1Fb/rqZ6w/PRMSDxVM5Q0
	c98c/w6TNrQCtDyL4tvdC1JoUajQIgbWKLId4UhUlDS8VlpY/5aF42jefC3sp7VDcBimYdLbChv
	LmnpdRQlmZ9f4OkEz3YULlz4
X-Received: by 2002:a17:903:41cf:b0:2dd:7a0d:e51d with SMTP id d9443c01a7336-2e842ab64f2mr171051285ad.16.1792028943557;
        Wed, 14 Oct 2026 18:49:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:02 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>,
	Chancel Liu <chancel.liu@gmail.com>
Subject: [PATCH v2 18/25] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:17 +0700
Message-ID: <20261015014324.5569-19-phucduc.bui@gmail.com>
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
from imx_rpmsg_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 3c00eceb2a53 ("ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg")
Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 7086fb7fc1eb..85b7c929a28a 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,7 +269,13 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
-	return ret;
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
-- 
2.43.0

