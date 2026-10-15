Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF0A2C325C
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028818; cv=none; b=De72Mzr87qh3kiFFpZnZ0nNJqWp3Ox4vWx5YCRpta5FYHuF0dIS+EaHgDF+7Bmwp4xTJtiB60Kzuuets1pEAXZzCdHoAyJCZQQYlx3TNw6MW0ZYl42KVZ1G2pQILNtopubcN0tjXaYG3TAumpjpHZstMjVBN1h03KPtZEwatrAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028818; c=relaxed/simple;
	bh=b5pvZP3GD540pr000CqdgVuOT1MR9F2E/LPs2Mdzp0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQfP7lXHZHP2atk2ywLVVa/1qWrDus2mMVGVblhOa1O33LOX19K/BkAu0eWeYWiH2yUFmV7vp6QOL15YCDNeUZj68+PJi72sk+efM7MWe5hfGvnlrpYlxGqMir+7T1NIq2TKt4Bco17YB9+JMrGX1JLdMDBiq6jOiv7r0GuVYXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q84XSWo0; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q84XSWo0"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e608cd460eso25827785ad.3
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028817; x=1792633617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkExA76YJWwf2po0CbLVw6mxayxnqBJKULe/shJjNF8=;
        b=Q84XSWo0DEsgzEvTBZPYWDvQmlZj98HTrjHckNaB9sJ3im+gKcKI4SAbErrUaXjrXh
         gq5azS5vjhaPe04Eqe7bmQoOc8pqEOyNThC85aJhgiGNreda4wwA0Ef7R78335FV8YE7
         CupnDZsdb8Y2dqaK3GYujSjyLTjSP8icOYCRFe6oAucw11XjjyorIAwXIYRENd2IfOnj
         oKd5EFIKdP7TP/GDL4ju7DdsENwkYXIvWW/pA7dOUCKfyme6acoeYx2arhSb4X4alezg
         IqBCPNblTqngf4UENC0fkcGerY087feOfkZjJlb2TxXNNUkr9dSLQSeBs7K8cqfY7jUF
         xGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028817; x=1792633617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QkExA76YJWwf2po0CbLVw6mxayxnqBJKULe/shJjNF8=;
        b=tHayHCTFFSm+IVqUuAsLcuzOMQNF3bz8H/qd5qDgJXI12oLHMjQHGb0GFZaTMEw94P
         Ssqk8y0U0/4dxErg5W0DXLshHH5/chsJSx+cT1QzbLxUPuUZ9TTgukY/HDuTR3osSPJ+
         /RiR8WZ3RBZL7Vu7+pK2aE6X+N5oBHgbtEPEtORrzLZYcwvYk4NKBc8iItHHytQx81Pv
         JO7NvR77Ur8UPNE9vnz4O3Z9QVGDpaLlIqV12V3FCy5CZCd6/04kMX8fYUmpAuV43+Er
         bonivW3ECAVi2eWEW1K6/I8mImuMDo0yygTRu1Aqh8DMjegYjgZeifCJKWT3kXZfygx1
         9uog==
X-Forwarded-Encrypted: i=1; AKwUvBwCoR8KFuc1YkdgCiuw6NSv5XELmir7vb7XLPTuEMOlIw2kp2KCGXmomXk3nRAQ4wTvU4/FRA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLQ9QETMjFG4ra9DddRSj6rqrkNxooBTzj8XuoM0i7Ok9OjbFgc
	n+QZjSQUD+1GEOzcz6cFOkAlNA+b2CH0zGDlWXldIiv3aHirbHbOZ1c9
X-Gm-Gg: AYBFou04VreCJn9iX611mj+tSn2pxCBKUgM6GO7FKhlrG2g9iWyiP8yRIeLMzhzsbEE
	HmwOGFoMQXFmlEbTs5651Ak70wDDDlJ+5BzCYrJ+ZV72VW1shhJQpCw+ov/oxj7IW0fX7aOnE49
	vsrclJT8/D3kaHYMfYKJvcXopM/Yv7lrws3UFXSsj9yQAVLnJRJU8NUMCfCnHD8r0ff1OYGqJA0
	hF7U3AV6FzeOaXacG6tnwhhHI3/NXZwZYH5QXx62nYvl7f6S6uF6gcGHyUQujKMY+sOeytRHX6Z
	M8vgCmE2OFrMhZ31KcrTI2ZpI1weHTligDFm5utJHzI/teNB+XPcVCQLJB8j5za+udWJ0juYWLw
	NBrfUvJW8fcaNgeojU135jROnFNHEOa/e0QgLmOIy4RydGwclgIT0RF4l8neW0lLvNVFOzX5Wf4
	9Nfi32pX9MMgp25s9k0bdXYwleumRjgbkfW7XvovXwOBd3vWOK0RQ2NVZAohIZRbQTc/qg17EB+
	+UwGBG1AfAQIcsmPPr/E8PyEmHgIATlyT1IBrUVmL94DlRU6GUGqHHjmPupuNp489nhiYTfK3zW
	nizVCI/SWeeJe2fgd0cGxt3O
X-Received: by 2002:a17:902:ebca:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9401ffb38mr25578395ad.16.1792028816992;
        Wed, 14 Oct 2026 18:46:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:46:55 -0700 (PDT)
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
Subject: [PATCH v2 11/25] ASoC: codecs: nau8325: Ensure the DAI is marked as started on success
Date: Thu, 15 Oct 2026 08:43:10 +0700
Message-ID: <20261015014324.5569-12-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from nau8325_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as nau8325_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/nau8325.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 2c95ed00a681..5ccf4c110567 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -489,14 +489,24 @@ static int nau8325_dai_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
 	const struct nau8325_osr_attr *osr;
+	int ret;
 
 	osr = nau8325_get_osr(nau8325);
 	if (!osr || !osr->osr)
 		return -EINVAL;
 
-	return snd_pcm_hw_constraint_minmax(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_RATE,
-					    0, CLK_DA_AD_MAX / osr->osr);
+	ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   0, CLK_DA_AD_MAX / osr->osr);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
+	return 0;
 }
 
 static int nau8325_hw_params(struct snd_pcm_substream *substream,
-- 
2.43.0

