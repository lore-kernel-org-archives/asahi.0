Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE07C3890F8
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 04:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123875; cv=none; b=sd6qPr3/TmUuyPOuNO92m3z1doSLjJoR2F05Y220SDQuIBkkIe+9SU1gmcmsVUgwitkSwl+ZgOQD9cFeuChTzGx/LxhmCi9nOHU4HlY/D0qKMXPygsXViNLH5u97k9/NsJbYNaBRe/veBTXl03CZxcBFt2PcvXgv+VBYow+tp6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123875; c=relaxed/simple;
	bh=fvLkZCJ3WJpgMh2sp/BTiEgwAehjZvHvIEf8HbSdvgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpDxXIc9hP5ijngmghgePtUd1EGsOaEGcrxsQA2Kg7PFLGXMfjyRlPKhQ6ji3p0ZQIq/SUf6HyCP2aMEQYK53sbN4LBDXh4tMM+FP0fuQskoX83Y8hHGcfYBqlcWuXNG1vi6qljvpBTK1UZQTN/UqXBzvH/meCBVyUh5pBsSab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPGGAR0G; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPGGAR0G"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso26856045ad.1
        for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 21:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123873; x=1792728673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXlahNE+Wx5snJLp/MKBjKZg6Q+5VrSpbj2QDx2YWrA=;
        b=UPGGAR0G3B20tjvgrm41dj+GAct4UviX+euKdBe4tQpB+2pwVETq5bucNYr4j9WOwd
         dgkfDcyUlgd6t7qWCP48uQPK1UdtxoYhE3RPos2Y7YlK7/Lwqlp6G/gt0rPWQKAJv0sH
         d7Mvy3+RLsrr0pZEGkPIMzJmFQxpyKAtL0D271To1Zm6op2KtGTdrb0UJPj6kip9CEMz
         +NTB7gl8XPC3AdxGSb94iEsENOJa9OmUD3meRUB/vATCy3ZyJxatbjdLtNXh59ChcEaS
         CFqmbOyerzL1ekWzfe3O64YYFSdQBWvTV1wd3rqLc9A2iTlHYcD2mv9Vfy7o2EBw4bbA
         CWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123873; x=1792728673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXlahNE+Wx5snJLp/MKBjKZg6Q+5VrSpbj2QDx2YWrA=;
        b=YRynnrmU4L+glbIYBPHu8D4c/6SaE9WFjr4QDZSY764cVXfRNQBSVhF9l24L6WTWFs
         G3f+P0P8QvDUi1oPjkEIJd6phx2lbwZvpwKDGTNg17O+IRKfj4Ilf6TA3H92sOBiGIvD
         2bYLp13XnB3Wvg176+GfGE6B97dk2PRRBsDlfav6CnmW4WVb6JWvxJ9MaFoDvrmVgs8o
         TkQ9vZpmj8gGw9yTZMO7RuV+vkrVIulYZoA89TnKziuGCoMx0vvhWDwkkddJd+F8DyJ5
         l1Lfh6edivcPfWvgNyLJaMqVF4N72VSyZxZky0s/I3rOPSoeSlO4hGERRAOzuxUOPq4C
         IAQw==
X-Forwarded-Encrypted: i=1; AKwUvBxvs+imPpb9gZyeEVolSffdPHtmoj/AQcN0dkBxbn7W0/daJnKLCXRL1maXYECm87lvCaXK3g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ9lE7a71l8G7N92X2qFeSBVSMkEJOQdu8XjeA+vIsBVPj374Kx
	JKUw3uSvlooVrbHq4JTpBJIvzJkTfvRSE/eohru2gRsFbvH7MfBRW8ZR
X-Gm-Gg: AYBFou1yPHRLSkWV9DX1n8HcucUa6akyCPhLh2iqrcLEy9uifCmQqYKp3ltif9wfyxg
	ejgXL3eXypa5gMEycISv8Zdr9tx+n3p6NdQ+UVO9fP1mOcui7idCMurW+nE8G21Z4g28lgS4YYw
	XJH7B3Av5/Uv/qnxUPJO8Nu6AWzwI80AZiL5K4EbOaj7usnvuGchuUxzozcG5T3wSoRBXtUTKPj
	n1HjTkA91EwXtzAtnh5Tndsw9dYxvr7ZfXyCVlQKph2ND9msXN5f7aeOTYiwBp4+fKNGt4X3i1e
	qhmR5ZP5psQ86h0tYJ7jNoO1P6H/aJbLjgiNHw0EHILV2WwaU7qYhU9+n+G0AuTCXfypXGQCPmi
	V8QEkatF1lM7h4JA7qTxkR85/OLq9TAokZc5z8hUA753FZ61T/1Q2PJk1gNv23qi4omDZpWI2tu
	P8AfxAEfXyGKubETVtFDjIWUI6BZHM3b1qv4H0241x1j4HJgty5/Cc+JrpfRq8GxgC4dIZfSrAJ
	WT4ZpziBm5zVnF513h3f8cmRNoeC5xNQO/MuwKIL2WDmzwxH5cfCDA06EBw8ZOw8HjCMiDm/Je5
	urwNLi6rWGbl5A==
X-Received: by 2002:a17:903:19cf:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2e842ce7c78mr210820935ad.45.1792123873102;
        Thu, 15 Oct 2026 21:11:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:12 -0700 (PDT)
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
Subject: [PATCH 05/11] ASoC: imx-pcm-rpmsg: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:40 +0700
Message-ID: <20261016040946.521195-6-phucduc.bui@gmail.com>
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

Add a comment explaining why .open() must return 0 on success
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 30e75fee5175..85b7c929a28a 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,6 +269,12 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0

