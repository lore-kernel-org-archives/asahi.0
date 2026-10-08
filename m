Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D389497B87
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456218; cv=none; b=nTtRmYE7yPjoX01VwXQeRImOAVN4lsZXXeywycX3MxlO8IcJgmQ4y0M/1Q+lR21Ek3zI2bMO5hDfCBGcMwVjzn3l+/LsaOSEJZNQcB/UeEvkX4B8dsiYaDlSA656D69sEh3RgxW8SQqT17dWAknCM7wj4NZn2gTU3KVZT2UuQEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456218; c=relaxed/simple;
	bh=M6D9aaF9YzenOEQjSguQl07lda02HnO0SBENTFTDcdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddYcJDSc8zkD3bL215zeW0rgiB8I3HFtEyuu5bdxEBK8o5KxatYRWmi1cmUhsTNimJGNYjWfT7eIz/oI+8Vor3sc63oBV+kfE5pq0+cM1W/4VPZciyJzULUTUGCmDG/yEe+zclQdpufKPFrP/vJLweaYCryuhigvjFnrv/TlDMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtFTeJuG; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtFTeJuG"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so798678eec.0
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456216; x=1792061016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfWx2qRDgtNnVPrZV6mmc0DG+YGHGqR8DbBEhiLgtRc=;
        b=QtFTeJuG6A9lQrGjwOXz8ryIiPRYDpf0ThS7z9NB2s2t3wPTobCDNu3/PvZ+QqxQbE
         X5Os8Gb5VFXRfdXCR4hbgjVaIBEqWrv3xROH8N18yEQQ0q8Dykhxv8xHqaCmsvYpIDCZ
         vxPxb2kHRNvjhpUGH/+43/FeApDaeKlXSjR5AqD6YeekH4H9s/HJrX6JPxoL5u4IN+ep
         m0R/BVxx/Iy3I055NxIbtIqHd4G5YpmXVh+BRERL4ops6N6WfMGUZhuyVuDv0HNsxNce
         IuykeZYnqEgZDH/LSTEgDFGZh5w05S8r+fyGGvzL1+81b4/bjNeXaNV1DwEi2K2+bwjg
         ObEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456216; x=1792061016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfWx2qRDgtNnVPrZV6mmc0DG+YGHGqR8DbBEhiLgtRc=;
        b=lrOl2u2BOs0ERoyO6lk3JBhY1sB3/JgvXHuWXLlSV77jbsdc9rua91TZLxHI8q/ohC
         Ylt8wOanVgXkOGYHZIcR396UFfkCi2z0y1Krwfgf0ZpWoQBjm1CAA3VWB46aKKLcR9wA
         3JD3A18ox1RqvBosM6s1ZHNCLJrP+VWXKLQAswLC1Df4NUBhPVhBzh5r7bxaJup6ye3x
         BVX9EJRgp1dRopZ2hPGI4vN3LUKobEewwzmfO9mYPvgHAvXer8ouuk2oJFnal6P6TtN9
         d4jUiycFr5w91Mg4X+rrQ1N50S1NakI0JDbNmE1yIz1E+Wh/R75A4mIg4y7SSdIE1emW
         4vmA==
X-Forwarded-Encrypted: i=1; AKwUvBwF+HRUcNbdvPV4YXUrZLD2pUMc5UZgA/aXG5mNk2x262NAvRelGaJwgrJvwtbNnwo/zW3Q2g==@lists.linux.dev
X-Gm-Message-State: AFuF++npVcJChOdX8tOQGgOshKLU0ddotA+KsvWD53cSdY/YVmCgLBHv
	ctk5xeQXH4NYibzruTVyRfL1tMlj7kxqQoSWr7gU+pZSnFYN9WjebC0q
X-Gm-Gg: AYBFou2rpPVb2ybqE1qGuIY6ujN0UQCg+In/C9x755L+9YneAT5Qt64ifzMPkm5uUmV
	7RGYtiauyYnnMxXNI/fq7d0lZXDXlpfu0e3oNJYUQ+yVzx1YQgu0cMhFFtrc9d+iCytXVyvC3IO
	T6Ihv8jliYvqwKfQDZHd1focz+MivyzREdAPBlxjIFPrbGqjrjSF4ijs1bZaFVmxHcfxBgIjEpK
	XrjQjWyWtfOz/IYrgNL/uxDgMFqXqKY4ePlqU6cWIM9iL4gxEmJ3DbC4sDK0oWddYBSJmUPt39B
	fhZ8U/ag7Xf2PHQu+y8axLlcTxmpW0dqIfKEbmpYqLyCQDoG9oq7lwQDiVTkLcNb/TonQplgQJ4
	BgybyT+rB2wd5FS8dtGp3MSIwqBphooKnpyIRYUHFRt8f/NOSMVBaUWfZP/l7dUBGWCGE0x8X3u
	YgSkwFBoh8qb+/6FMI54O3CAQsakXLfJthmtx9aoOIfPGV199kWUJVrdhYXC3DyHMH6Bc4XaZex
	ELXVYRez3xKCopw3OAojheQBjme9ezhVOHgfpS9jsobyk6hZWIl4JBkQRHs1pWRMJeisFFuUTfs
	uH9Hyj7Cnc40oo5dQExwI8qE
X-Received: by 2002:a05:693c:2402:b0:34c:e77c:f92d with SMTP id 5a478bee46e88-3515de8cbfemr6349033eec.33.1791456216244;
        Thu, 08 Oct 2026 03:43:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:35 -0700 (PDT)
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
Subject: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:25 +0700
Message-ID: <20261008103831.542533-19-phucduc.bui@gmail.com>
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
from imx_rpmsg_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 3c00eceb2a53 ("ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 7086fb7fc1eb..30e75fee5175 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,7 +269,7 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
-	return ret;
+	return 0;
 }
 
 static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
-- 
2.43.0

