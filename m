Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E692938654F
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456024; cv=none; b=sw/+GSW6uFccwUyf8EWxaCj44Pm2UrnmjMmmjCJIpcl/j4a4VBfFLpaC3UGfFBf8xeew8x4m9ChKRPd+3xBtEwP1N9mjKdZweu2SiNKGMlFQjEO8EbPNUU9IEw1ZXOi8on4U0bdgLrsTQV6nOdGSVaaVzaPzCh/Jwd/xo5tlxs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456024; c=relaxed/simple;
	bh=aAJwqH/KKsd5BFgyPNOpN1XC3DMyvJ2Ee51+WOeaFBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RpfSltvLFTiurgropqXOVBif8Wqk2UeqU3YfasPx4JX6DSUAQNWRrg7WQOAUgPhEpnqFhCX+wFY3JOPQU4Kh57toDU+z/jZ4Fgc6d+8kiPZ7EG/EGan+TuytHzFCp1OkJMuof9Q9YeYlbSOGjTdYmJ/YNSOhljhTgJe7q2IX9Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAZBdd+N; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAZBdd+N"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35120d43ecaso7719416eec.1
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456022; x=1792060822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9Ry8JRaSeFrVq0Ud0+uxs62YoBNOy3ejKA8MS9Fs2w=;
        b=FAZBdd+N01DkUu2hVTcRuAURqGbN6S6jJBDrK37WIHYIfe6NVAG23eNiYCE8t5oks0
         nU9pEDnjm0js3nV9YXxMa+yMFoAALd8wrQCq+5cMU24TdWrip3JPOVgfXWj8pdNyh4va
         SjuitGiBuxGjqyDmLnBRfws9COeDDXmmoN3cXa/XFpM/YHS+evCsY70rYRI80LrhuL+U
         pbPszXJVxIohAHBDF0Z1QZcTTeuMzc1Uc8bra6wp8SJ2LDTFP/nK3GZWIB9lUQTdOhE7
         6+TEKs3pmXdpZr8z8vGK2VJDwqTC01g1lCed8yxdWvXb1h0cgn9j4Hysp0FRFF9LJEOZ
         +uoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456022; x=1792060822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9Ry8JRaSeFrVq0Ud0+uxs62YoBNOy3ejKA8MS9Fs2w=;
        b=ojWuUJoXNtBnlONlJP5TnP/1iEfRzJ05S24LcckyfWT8vVr7EOXGCLB4rPO61oTyTk
         W46Z/TC3VixRjgS7RN/u9/ggjyNv4dq5B7uhYyj5caTOd9TsKHgZuCtIiN0cQtdASuzC
         TkWyITJ13ZoDx8/uMLkOf+URxT7IJBolrO+rMD1e7fXrtsY7eGeynoMLqjZqyKrNmINo
         42+2QhbOtd1orjtVxXpQMlSy0dxvc3r9v+bHbviXuOceKLHZhWKYbYeVRwpfJHFDago9
         vezFgYeE1QHnU24qyYalw5UhWNRL7KOI3mUjz8nHtFkNc7D+as/ud52vIyTvk+EsEkbF
         AABA==
X-Forwarded-Encrypted: i=1; AKwUvBzi4EczZT6+d3zktyx5UbHepWBrbl9SPTMuqHBvMTxXhfCr9ugSAsOMf9gUYDu1WyRpOOcNTA==@lists.linux.dev
X-Gm-Message-State: AFuF++kHRJjlDX8eqqavGqwgBnW4db/3wjmaBU2cO/y1HnoKceRRyd0O
	U177LUfyfWd1PCgBxe4U3XoEoEVLCR0wwmwf248dVaoVtIG9Pxsm60hT
X-Gm-Gg: AYBFou1So6v+Ui2Nz/RYZFQDTvxPVw5LPw2OvS+FImf0H/fIEQNUF6n5FEqoH+q0Lho
	dOgK4dTZh+5DtH4wjivUi+664/ypQHvyPSdSWoeJDxTv2vYNCtRzvKUCCA8a0PaSmrqiGeUlddF
	UpfMnwDHNa3HhsXE9RH2G40ahq2oBSUL7N7uesB0zFgI0zCO6IcZfFtyEmNtU4loZ5PcXJPuG9j
	e4LU9hmSk8G7SpiuoRsq/SGU5zM0/a9mOAbl8+bK4Yqj+aqDqwBONHtgCRSg0ECuzHZee7gsez+
	Mp2rU2tFG0FTQ0vgpI+P+95VX7Pi+IvFDJxEPwld9FGPEy3tIS5eWSYWVTUZgJuYubw96+ZVS7j
	QX6Jxs4h/JGcc5lg5AZClhFpPMdzvKWM0QnLroh2uLAy0/Vhuc1/mSOK766B5OR2orqiwJVJR65
	BZE+NBWghesMu+QCmhYVLWSgqvZLBXKUXuwI2Iu8yWJ0AhlQm5UC2kQZlvTvu3oIlSLA9t2WaV0
	fXw1tiFDnt1Pwc8J8OI1u+cz5CotqtQQaF1Wsp5O8B6Xmtqhmn5spl9O3K00VZJPosI20+TjPox
	clfaCleL1NKzGFn/NCto3TTh
X-Received: by 2002:a05:693c:414b:20b0:351:1e2e:da4d with SMTP id 5a478bee46e88-3515def434bmr6671263eec.23.1791456022013;
        Thu, 08 Oct 2026 03:40:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:20 -0700 (PDT)
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
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
Subject: [PATCH 05/24] ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:12 +0700
Message-ID: <20261008103831.542533-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4a767b1d039a ("ASoC: amd: add acp3x pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 3f59b753243d..c0481a9ba858 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -233,7 +233,7 @@ static int acp_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp_base = adata->acp_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

