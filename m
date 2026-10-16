Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E497D36F437
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 04:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123838; cv=none; b=Yj3yVzRA5p/MHqyeTCS/T8t65zWDgm9DbUiL+r8FsmNlZdr6pg5KTO/D/5LItbIxH/2XUAnbr0vPfWCeE3N5ngE7K318C+LCQNndX1juZhe8zCmH2eP9vOecZn3U+OQ3VL9U2+rkhPsbVbZctKPbBRJrNqhMF/bTYqZTdZsXDlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123838; c=relaxed/simple;
	bh=6DbU/lmMa56vZUldhssy3WWvEn6fSDga+TC7sPaI04Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BB2Lf8FddwC9mrZH9uNbJsmtpwlCgqiDIOqmMupUVWwtyP8g6DPE3el+/ioCWRmXXT5LR/0roDRCnUTGo0fwGfTJSosj1TWJs6D8jsoCSsIJEwKtkNSly/L5l4DkjwGP6fz0E+M5W30fJoaM7IUJQb4AaqgQqja7AVNPNriaqqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F19Tzzx7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F19Tzzx7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5fb79ce82so34576585ad.0
        for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 21:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123836; x=1792728636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QFH69Gbmd4pLwYRTdAmCw0agJokE4nomqHT+KuDYM2c=;
        b=F19Tzzx7M3+OPUNywggy3cW7tRfa1qn35pcYH4e1U7fD73ISYoaURLa680lcbF69NB
         fEaaE8GGA9SQjRPnvfILR26SSSbVELJSjIr/TmwYLcij0BX4q/+6lSURindl8xoWa132
         L8dENCrw6KIr63XKEnxgnUupgwBi0TlsWQlXiifQiva44YBC87JYx2qbc8ag6lvbEKul
         mKyF9rwQsu4NsbVcIi9Q9yX27yXt2E6Sd3SAtF65BsTbQtLlLsAtOLbPOQHMXrGQ1xoF
         QBcO2HvVe1ZbyskZBQqzwAWjqQm+zNTnNH/aOA5aOH+fS6yyJQdMuMTZAedqe7sV3pv9
         laGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123836; x=1792728636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QFH69Gbmd4pLwYRTdAmCw0agJokE4nomqHT+KuDYM2c=;
        b=FzuevGyX9cnJFgS76E16lcFL7nl8HfT4sUzcJO59tq9Yf7t8eixSoIwwD6aJhWfMsN
         LqVqHaTh+2SL9HJGos/BaJ44Y6QrRi+c5Ms7JK9AAVcnAlaBWTm5zsdvutROenVYCMhp
         c6z/OWWJ/7jG4idqKiJpq37BKG/LMzmcm3tC8ob+w1uHnLLVTlyROcwibXd+7/qcz6Qd
         VX6B7LC1dB0c78ZRowR+jbN/lFgX0eIiOzW+VbJpPab3TppBcXeTuAdpe26Bqa6HBAX5
         T5w8fpaFo+Whmb1sU67H5pe7upFoZDcTLflz0TD00B+Es2ks6eOzI2bRqySxy1D5xJq3
         dQPw==
X-Forwarded-Encrypted: i=1; AKwUvBwjfkNuUEWZV7MT0kKPm0Boh9SH/Lb7pf/ReK+rtUloHXFfoJI1kf5qKuF5TXRA6bDBL0xNGw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIX9PB5FoxVx39QGCgV0OAYZMdULdOoDDPxjsv4+5LtNiRTP7al
	Op/6K8DLib4IUmD2QNLIAA3eV4pdt9wmkc2UKiToQA7xgERaYbRTDNrx
X-Gm-Gg: AYBFou3jHqDEoYrI88MWoAux3TiBYjV5rTpYubemsfpfyCuRPqumw5MrMu91/cjmZjY
	3g/FWr0Nr/9VRaVKwXLOZZoJ3dl/LtZqAUWwcAyCdk1x12j4TQw28goIsgtNIHXaRlzyLsX9N8O
	pd27wmZuTm/y2XfjdgtsLpoW4wyBYeLlXJymXpASz8XjLnin3QgVF2G8X4CsfgfQD9c5HVBCRmc
	7zNkUsn86Ci2yTULxrJdHMHw+fddP1jqPcl1CVuLQ+LZk/kfBHfFfPCGoAQgapfXQJAkk7tb5QQ
	2GSogciB/jh+63UJSHtOeIppvI+d1vTVyKWe2++2UQq4slP94a6458FRbU2XR9RVz0i7+s56UQz
	EZUSJGyXI8w4LafaFCEE+7LftGHZeMls5UITbZQB1LtekjulqjR3LQvoHPTfUX7uEYDnOdYwLNc
	rxkWCH3GSLJwmbHsqAsqoKCDJcZMhD0DXoYGAB0ZenBh9DCyeo5kSWqfgapZkmgr2pHAYSsGKZv
	k2AWtEU76h05TItKZjGodWMTaO4wWk+jekVm5i75S3KenBpzgLORk2qfIj3Q1MdZWKufo1MFM4F
	W/rblzkHq38zitu+ffaYc34N
X-Received: by 2002:a17:902:db0b:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2e8427efd9dmr210035865ad.5.1792123836136;
        Thu, 15 Oct 2026 21:10:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:10:35 -0700 (PDT)
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
Subject: [PATCH 02/11] ASoC: apple: Explain DAI startup return value handling
Date: Fri, 16 Oct 2026 11:09:37 +0700
Message-ID: <20261016040946.521195-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add a comment explaining why .startup() must return 0 on success
to ensure the DAI is correctly marked as started and prevent
future changes from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/apple/mca.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 3585432ad49b..26022a42a95e 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -535,6 +535,11 @@ static int mca_fe_startup(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI is correctly marked as started.
+	 */
 	return 0;
 }
 
-- 
2.43.0

