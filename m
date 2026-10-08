Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BA1497B81
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456082; cv=none; b=cOA9aEQ8zYQ1wRX3P9Khxwc5Y2hZ/a4oNQTRfJMKdFoL4lMYwSb+8W+RJwiC3N3TfB7EZcxr8So9VkoTaqbTFFDwo84f7KBsf/3eJo2qA/rVfVMdxxjiw8meokw5IPqnXNtbHqkosiJ4ZStQjR0a38e+ZVZFWLjsvgiuuDwQXIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456082; c=relaxed/simple;
	bh=jX20kt7q2qTPB7R7+kU+hL/352znpJ6GWnJmAMBJbuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCb1BxjFp9Xltzxsr4rkfwt0rAjXQBaSewbevOb6BevhwcfLHUF3WIuXDjyHIwG5id2PqAoPOcXQmL6pfNkW4pSKGoXXcJz4rU7PpK5tkh1aK/408D3da/WrUyP/TIvJcTL33vnACZ3LbZPkOtFXIEv8AAGdFAypABZ/nsX3j7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHbFBWJW; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHbFBWJW"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3516c82e96cso2575368eec.0
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456080; x=1792060880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K47qRPAQ198u1Fkbi+cWvMQCeIpB3dQGzP07geOfbJw=;
        b=jHbFBWJWCQ2pcJ/5pTjV/XxwR9M9lFsyXYYbgqQ7S8GMHLN11c9Cc/+Rgfb5t+cOz9
         vsX46/t0+tfGiLV5dP9DY4whTA5fxMFVm5ZyWm3w8ofrg0LGwcWG+q9v032KKgcyarME
         1NZD1mMT1v7YVc64rhYn0U5UQ/307oTga8gFYDqWNBzHaaVw8A/cbT8B47XzHpMaKoC1
         r9gzgjahAd3+NIOxVs5I1YOrekSekgW7A94RsoVE0U54z7tJfCYgFKh3nJl9OVbCff98
         7/3iFwAP4L6bbAPLNhhOEN2nVtPAzZukHBY9vVTlUQCN/RIhO62NpFpeLsUzaaNdRHLZ
         d9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456080; x=1792060880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K47qRPAQ198u1Fkbi+cWvMQCeIpB3dQGzP07geOfbJw=;
        b=LzU5c7bbaW3POAI6k7AszDIcB/axMGXBpk3TxbqoJhAQzd7ndXjmGU7FI3A0zEfARf
         NP1Z7lU9xoL+bBatcP7IhAaoCyRIRgtBrqhDKzioJt50NQJ8qmchq/Oa3vuxEVK0O6gB
         93OykfQbCQUF3fF5y6cGr2S2r8oGtWmxvtAL9IiFijlWWJZ2bYT6jQwtvXi3X0UMSQbI
         nCzM1v6zBajVzprAwdbvbLd4FSAmLK1YTyxCYG5MHMh7DNP0Sn41lEH8lcddb0L9Jf4J
         B3m8N6Gcck2kLiY21TPbOes1/HJmiutUNGgGAG5VaDjSejNKfzH31DWBXHD/rF7I9KI/
         HmvA==
X-Forwarded-Encrypted: i=1; AKwUvBw45Sh8kgvsdHZDJnivUWRKzwR9uhpL1DP7qqa1/fGF8hlUpKXO8qa+XelCRgtH7Q2VF6ji0A==@lists.linux.dev
X-Gm-Message-State: AFq9FYI+yG9iwwI0xfYTY11S+yUU0wPfRnjmzuZ3es6TsFVGo5c4yfdJ
	Uh10mzsc2QoK6FgPuThkT/qpfCIRaVWJz/nj+K7WikhHQYJKcsvvBcyP
X-Gm-Gg: AYBFou3FaAvXuPJ5vZZU+iodX5OTDGJ9kvBDcDBFs5nz4mhMqbqVRMIno7AUXc/51GI
	XJOZj3bOep2ogb5hbtLoynMUbQ7trjjg/5cYlXkEbDk1qNtjFU5uDtwlLjw7eY4prvGUEZ/nMZ3
	yAtN3Tt4gak5D/Pwl2dC6XJZ8zQmdpLOQPmRF6TZGXL/DpS2asH4UdxETSFeKboUUVn39ZmcYLN
	ztTlrWj9jt6XI95FOkFTa/3qvrGj9gqSI1aMyHrsWAPkx07zUqiRgMrprLKPufYpsX1BVS1qclb
	UGM9WTvlgN+84jGHg+/8RsM1ltT/pRFs3+nTWMqVawhVTOFbx4RBHy/VpMuCYooRgyFJBNA/HQ4
	8Ud0QWfBL4z8MKRDdKqIRBUn+LjlSiug9RBIthRK7NR+JWrYcJPXaokqbw8mFffdTS0VBMSnCSC
	swV58W650sQxy0zfDhIKqLCls2Cxc6a3R+NCuELYFwL+ayJWSS9RUmnC0BGrXx1xBnpjBDx6IyY
	hvrynx0DDLJqmY2p8wm7qAbDOw8sDX3676LRlFKzQBW/QB6OglnSsolblKK6Fq6xajQMz2LKmXi
	S4Qglaqr0oHfPQ==
X-Received: by 2002:a05:7300:6ca1:b0:351:4d2d:af26 with SMTP id 5a478bee46e88-3515d86f0aemr8805338eec.2.1791456079525;
        Thu, 08 Oct 2026 03:41:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:41:18 -0700 (PDT)
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
Subject: [PATCH 09/24] ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:16 +0700
Message-ID: <20261008103831.542533-10-phucduc.bui@gmail.com>
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
from atmel_pcm_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 92dfa6198623 ("ASoC: atmel-pcm: split into two file")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-pcm-pdc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 374f93fa6e0b..552bfa30d4ba 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -295,6 +295,8 @@ static int atmel_pcm_open(struct snd_soc_component *component,
 	}
 	runtime->private_data = prtd;
 
+	return 0;
+
  out:
 	return ret;
 }
-- 
2.43.0

