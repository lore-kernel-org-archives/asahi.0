Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8603F3890F8
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 04:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123949; cv=none; b=E4JyvdSTgOiikuPCFK9GNZwn/tY3T5Oe9iX1qpXz3IbaN/deQtDLkpjaMjQfXLVVTt9+TCbu92nFox0BkR+d9Kl8TJSSyflX56LohNRdWNITV+MKUBie5miEYfKBAx8yoKkas9F0HfcaFIkkq/OhUm0htwT5VbPuXACW6sWzs+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123949; c=relaxed/simple;
	bh=r7OlKukmBvsw9WjHDtwSqYZmBLqvfhuoOIuidK+OgfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXzwds+9z272gfw/kxEuIAvoXHIX+QMNhnjoQot9tApP2jla/H9TqMfrBziu+N4xSVgY191O3zNh8v0cs6D4fHE+NVj2Eto//F2Ni7F87h5MHGtrIOQAnnzZebziciJ6scKauPb1AnvM5dgs2hOGgXAsogDcl/U6J1gQECHSWwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0mro+ed; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0mro+ed"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e987a2ba0cso2041385ad.3
        for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 21:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123948; x=1792728748; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tCZ6GoTFAN+ex1Ct3jpbL93IWIQW5JGKx6t1S7CNuas=;
        b=e0mro+edLHTUyODn4mQfLKJc/ybY7dpzr9qgnfW8LRS0f0dF/nBP3F8CwrhfcE75ak
         QoxyvwBRZbmo8Bn7EzOBq1NlZob/M2Ophkknq6vpx4iWC8M153n9br3x4WUNL4Bg/g8z
         PWzhTJK6qvZY0zt3WHiAbSPZXuZ9LDVIgysmL9MOya1WWk0wjblnzcvL4gT6SE4NtK/g
         EOwiajIe5m0uP+pDqbyW3UugvW8IwqswRi0WS5V3aH6sROsGguJqiSefLKTROHIrcCRH
         ED886CK7c9d+QBmMIQr/mk8gR2WpfC+lgAIfLFrAFrHLsntLOFlLggip5QNji3ipQ8KX
         FwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123948; x=1792728748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tCZ6GoTFAN+ex1Ct3jpbL93IWIQW5JGKx6t1S7CNuas=;
        b=huKwffD/A0eMr6RGlUPr0GhXcrijH93/rTje+5UzeiJGuy/Q9bio7lB83QyBnQNsBK
         w+atVtLjylJ8O3E1MWff5eydJAbwXDolkhgSXikSaRyyfGuX8i7aeUgOzF6MFWEkWIDC
         ig0Ur8bQ62WaEaG7kPZZnbM5w+pZ+rDhUbp6cvW/IIREwCsQD7nPoQRm3vorugvVcMTN
         FzBcB+RvuWu97wttSspZTfJa+P4LM7XFhr3XkDVoHtUb4UdYBqU/eWsXCLkSP8HNx7nB
         wZsSTy+8+nPOTjpwI30ZpIntRruFfTnDUt1jIDo31p7+1rrOkDR8boNjFKyN4kBmRbbV
         d+5A==
X-Forwarded-Encrypted: i=1; AKwUvBx9k8nVSq7QIcuGDaNpQxPgTU3fQm2DMObk0mL36LGqIaXfJpMYXyl07OYQFuv9XgezZp6ypw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLNyyJ6UsltsiYzQEB8v1b7uXQYlCncujrewkT4fKB+mh54z1b+
	ekfVVc72HN9buAVBW5HVdI6gNzl9Nmtwoik5Cb7HhXD8lWVKRoWUGxec
X-Gm-Gg: AYBFou07whf3eDuWsmJpw8UMXHKSJ01mDQ7UM97DJtJKFdUfpt3cjzuDzYijlE030ih
	7rb8ksSYROoSi2SszpEN8z90pKyBNuG5yUqxQhl/YjtD34klbwm2kKsCeP2Ndaj8MaquDTddeHx
	DKr/J/5hpukeGodNedspY32VjP0GRcukEOAeT2IMvKwNZsIw2fPdwLyUuzYG30UNTMvEH5cEgdD
	uU9GoG6LhdMtTWXH8Ro3lrUYckCfVHEeCUeVZgmh331ilmXt3+UBu7vww0gkNL1YAjXHGFuT53E
	GKtIRLjZxJj9a5jom4lIfuonuOvFN2eCSjq5Bx1/ugrotl7Bp+hZe7iCy+jjLiG42lqaFzsdUhe
	FCu8FmMnJkMLHLAsdmKr1DBu+LNLT59l5+05L4LZlYQ818ArZuvt0Cr3odFvAWAOEK2tG0glBCa
	QhgrCy6OWsdd6/D7GdXtXvXfKErysmPCpVSy1S6XWGPSC404OIQFKut8D8zm20mSxz8oT/5hLM4
	8AOPN7X/EYce72EoEgy+EkiQIDpNLprRJ8rAtENTGXu5Xxi3wobiJDC5yS1o6TRm071ZeDOuc5i
	AjC9XTnjkqNB9g==
X-Received: by 2002:a17:903:94e:b0:2e9:4243:431d with SMTP id d9443c01a7336-2e942434bd5mr63920435ad.30.1792123947778;
        Thu, 15 Oct 2026 21:12:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:12:27 -0700 (PDT)
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
Subject: [PATCH 11/11] ASoC: rockchip: Explain DAI link startup return value handling
Date: Fri, 16 Oct 2026 11:09:46 +0700
Message-ID: <20261016040946.521195-12-phucduc.bui@gmail.com>
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

Add comments explaining why the .startup() callbacks must return
0 on success to ensure the DAI link is correctly marked as started
and prevent future changes from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rk3399_gru_sound.c  | 5 +++++
 sound/soc/rockchip/rockchip_max98090.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 0ec80a4b8c59..d4a0daabfb42 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -266,6 +266,11 @@ static int rockchip_sound_startup(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI link as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI link is correctly marked as started.
+	 */
 	return 0;
 }
 
diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index d54c36682415..de392b420ebd 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -202,6 +202,11 @@ static int rk_aif1_startup(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the DAI link as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_minmax() may return 1, explicitly
+	 * return 0 to ensure the DAI link is correctly marked as started.
+	 */
 	return 0;
 }
 
-- 
2.43.0

