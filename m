Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F6E489FA2
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455980; cv=none; b=h1QF7ghvKjvN/ArOfxkMwzAlqgnMbdo5I5zAO8uBz3icEvlxNGWB8yJrwDUlnmILQoyzTMdw8GeoehET+1u3EQdZQeHnbtI1ALXIWr1wzYZnv+xwseBbwYAQ7mSVc7kKwQVGUd7TPzmMOuSN57IZLkDRUvg0+H9Zb4S6kIEiXwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455980; c=relaxed/simple;
	bh=M5phZ5RgYLMwqgmoz0IyXZlTFh80R5DGK+A0fLhzSx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWWGG5oPRm0MlRayj9223fsejdTXNW/vSgCcSJ3src7OPWD2etSd7W7VWSpkxV+k1TbXVRRJSXM/SdrvcwTAxpIa6WmZtMLYuSUY6og0t8F9NQpZgSRP66BRWOk+ra/xJJ1IdlRDjqRU4dRBsqrUT8oiuJ8z0ZU8KMDNWn+axU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwrsHqEl; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwrsHqEl"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34ceab2900eso4961825eec.0
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791455978; x=1792060778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yX2YDjC9CYpjnGWLfkYsSXKBPsqSscsCNhhIkMB+OUM=;
        b=mwrsHqElwX47BzILnMN4dUaoXNPDanvf11/+1rYVC1qfOiYmwd6sAeUFCtDzWr+PYO
         sN8DwCUS86eaH6ihotLCoTQaL0ODcs6WsB2T4jOo0sNXj0zKcDhOQV0aMJAH5+QO3t6C
         LiRBMHPxGL7aMjlLKa/x64TTSeWwXo47G9F12y76qKbRtmaJavGYnjQazLMomyWNXmxr
         VgHsj2Od27JfaBHcanAZ5zoyeiPlr4FPzJlsTWcS7ERaSs7790On3do45Tt5YAnHbrvx
         NEmz8ii0F17rVIWPFZmoKzzs3QE+Kcc5al/TtYhepz1lz4PDT8VKPlKQTwyL3sRtDLX3
         Ivtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455978; x=1792060778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yX2YDjC9CYpjnGWLfkYsSXKBPsqSscsCNhhIkMB+OUM=;
        b=qUBQNXrnWNyPtxjmiLPawpDFxCwAlr2Fy+CQ8Mh1lux61at1VvxNpxLRjj4l6w0BeQ
         cz0NBWQzWzOy5GwnRWz1f2tCP9jWq5aKkAo2mFTMV+w0s/Djr3Fqs5FQ6DkyMIb0pSr3
         o426ik2qG5T7E9tLQOUN1mOQHi51qhGMe699n5qQn3zpMOAdrMUvkVX/pxOUjm9+3faB
         8NvXgA9fULtdZFKTC4sE0eRoK8TIWbBPsdYvmhEBc3WTPfNf0tlHbCiA0yDKS3dwrVhk
         Yx22vEgzm1pljC4JU0gGleO5e7SseiprD3Ee9k5F626QOmj9+s1Y8uV4WD2C9LYU/bDp
         KoRA==
X-Forwarded-Encrypted: i=1; AKwUvBwShZQGC5GuFcd4ut3CjKsJul4Zr9jkxKI6HoWOUJPQPko5ALjw37mxV4ZDZgJpJOClh+9pZQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLsmkA1LA1jNbuLUEKGeuxxpZUbOT1jC4LrdNizfVJHAAX34+m9
	V/j1o/Ob2JguD+XIl3K6p1NvkJZ76ECvKLpRDex/RtYn5ACiC4qYS0/j
X-Gm-Gg: AYBFou19E72HZe9+jO6AxCNE3+YDXyQM+WEd3KXurO/k1Z+mOcoD6A3kGSSSvhBrJmn
	Z8MAnkekJwM3xSehfwI8+X7N3Cq4cSzpL5ks2MegnrWbHIOWlJdNsP0pmMqBVf0LgRqo7mVSlaQ
	rgB0JZ5Jy1x5Ke81T+GNpL5NvazJfqPChUZNjVLBfMSroAsanbSIrnY23DyM0uLirpIND/isaz5
	Kju79TUeM1+DJ2RYO4O8tsKueou57W4MsClg77yKKecVu5wKK31IGSdZ6WO0AePoCxNSfH+1fGf
	gZ6mQhLHrCJ4ZcymYlUXwzun9xEB1I52Gf4ZgQnBSHsbNIopK8KvlDJQz522ka/Dw5/VtYu7TqQ
	IoWKqS/F9FfBcJBEhoydJbHa6vffNzQNSiGbhoBLLEnxmL0fSSDkzNndWQHBjwnzyeXe7SRK/1B
	bdp3CitFf/TaT1v3LdYikBZ9eSpwEl4TXr3lBIFKx8RHEdm9j/HzgEV33yiBYCk07taxicCV5ZZ
	oY5TPxBoN67epNrSE0EolgGENzhiUldw8fobXTMnAvYtHo0A9ulpd7jtS8Gj8ZfXNccaN0G2Gjz
	Ma1HHnqN4ueRTOmbdH7m+Vrm
X-Received: by 2002:a05:7301:1e84:b0:350:89a8:5598 with SMTP id 5a478bee46e88-3515ddb2b12mr7231654eec.9.1791455977867;
        Thu, 08 Oct 2026 03:39:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:39:37 -0700 (PDT)
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
Subject: [PATCH 02/24] ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:09 +0700
Message-ID: <20261008103831.542533-3-phucduc.bui@gmail.com>
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
from acp63_pdm_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 5137305662ef ("ASoC: amd: add acp6.2 pdm driver dma ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/ps/ps-pdm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 04c014349347..28e0686e9373 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -211,7 +211,7 @@ static int acp63_pdm_dma_open(struct snd_soc_component *component,
 
 	pdm_data->acp63_base = adata->acp63_base;
 	runtime->private_data = pdm_data;
-	return ret;
+	return 0;
 }
 
 static int acp63_pdm_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0

