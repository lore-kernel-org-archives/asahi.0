Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903D0496D2A
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456203; cv=none; b=pmmCD9i8uJmcUur57pqCbxYM/ovD2ZwZc5HCECgzXzZq+toDSc5nZ1VI0VOYeoPi5v0y1I/zJMbuvnDNacMXv7uMPCQXbIS5sXPKX+fES7LbAG71uyqEGlqcFB6+4JnD5XxfsA9gd5KZavtJOB0TbUXgZTzz0ApYWrhQu7Bhlb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456203; c=relaxed/simple;
	bh=aeGEPZ62WG1rYJ4UmaiX7V6fFIdooxIunanCDD+ki4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jinWyLjn4jgls41WOvqP5toQ0rTl0x0ucfY4tFOyW1MEuFQ4rReubtZ7I+rPcZ5vmVdG7FW+PAafAl0uVryvDe0Vvv/5w8lryb4LMfdlmnjRBkJ3jjiYCNtdJlP5g7yHpZUDcFs7XY8xTrmJqRGxPFmSPcfVVQk0UujdtsDyrJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVQ3zFUb; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVQ3zFUb"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-34c4a0868b6so4656559eec.0
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 03:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456202; x=1792061002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tshzH2hs2YBcBixu+hfpqJYKGYNe4yJtAc6VriLVkyE=;
        b=SVQ3zFUbrVddsQR/x2UvAzqaVYgGgRhNvXcpHqKIXHhs5VRBiVXkuVU8hBMmM8EXf+
         BuHJGqVU3n9UHlaaFhB3uJ6sdBGUVeHVqc3rW4GUu0g++WQt+Znr5+ttXnbq5OrrUyw2
         pNVxhTkkYCl+JxlqSDrt/SagFzFHD3KEEILhkf4uLT30l4HIf2DISeWVVcmDhqdGZcMB
         7l/yPZT5UZKanm5wAjC8vrZN5tCwSRSrxbAX5Poah+a2lMnWyJ3pXM4SmpC70MlyDG3+
         tErcTCFPZFDxKTCYQJ8vHGRWU2zOtPdjGZSPggPYb7zSsxj3vAFSCChRjrSPNWpJfRrn
         2ydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456202; x=1792061002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tshzH2hs2YBcBixu+hfpqJYKGYNe4yJtAc6VriLVkyE=;
        b=SabIQOdlFGsMLjfk+8oTKrd9DGG/m6yrqu+5v+D3vDbnqazsX47k4FLuckKPp2L+9A
         5tMgOFcebW12lvjUuUGMg1QZsdBvMH3QMMv9mBLTJK4HmYwTZghpwuxwzKnBv7KyN1qI
         QMnlspxko+QXJWCdaQ4a+q5BZfPp5OXyLtwPyXcWjMbdM36oIWFaSgdAVrn2Ev1VaakT
         RmVSUny9bQMmV6P9ORlqVmo8hEEaT8Hf0F7YoTl6rwyB7LKTLk/PTa8l/NFtHXm0DcUr
         LRpSEkujYrJVsvQmwfZWgMxIM9VWEFVdaN/ZB+2laLaQt4uxXmUL9DCHpepGGPlIv+mn
         xPVA==
X-Forwarded-Encrypted: i=1; AKwUvByTpN7Rrxnn9wXf38O+vdU6TbuHUft6aA8jMeog7yJZF2DwRHLZYFGi9cbInwZU0+wLRhzolw==@lists.linux.dev
X-Gm-Message-State: AFq9FYK/pCyv2abuS3MIFDrDA5ETS5C01po3gKQz7r/LaQEbnxg1nMdv
	9hWNJbRo8XXgW7vyPAcMYpJZCJtc0ywFtOarGmYkjT3+wHJ5qku4Wmk+
X-Gm-Gg: AYBFou37gOEdi71FbPFL3SrZa/jbwPb+3kR9iWo8cwAkHTm9232QaAT9yLGFBSq3ZRQ
	c9lbvKnMTkQmbLFYeebqSOeTlBvB9rsF5iJMWyC3wps2HSdBUUCK9MU0rbgsKBkw9kODYiCoDyh
	MfzxPzUqmcwXs9srfaMCn6A6L2Pto7gNr5rusDayuUEJfaMbZTZRfCyWKF6ad1l9wEwFVv28B3C
	M310eNimrN1kDvUXeBAaOXcWtj7Nxj2efki7AvxUdrkGru66IjzYvUl6Jalgo0Z0XlSUvWZqG0T
	IX/WRV+XzhFgsdsLaXBCgEsrhVP/11qvPLmAFHLqbJwwhliukG61GKOjiks1zf4d+5H82DC7K3Z
	NQAI6ZsexshUUHib3fj2Z+JUvqpUh24IO/c1z4ZqaPftJeC35eJ9uZczpDjPK3hIVmec8SKxwEQ
	iw06OlFFRxXWlMaDBfM/WU9Kv4pQ+1binCyRRYRBC797wIJ65/hpX9fG60nkTy5gBu7xDvqzS6S
	wCYaNuK3n8mCC1rplaCp1pvhZPjqNjevrEBX7M1MBihWyts3qJ7CMojb8I0DXZmKJFt3a+WxZaq
	agMu3m2z9JreVQ==
X-Received: by 2002:a05:7300:601e:b0:351:2200:1cde with SMTP id 5a478bee46e88-35177712b66mr2416825eec.8.1791456201448;
        Thu, 08 Oct 2026 03:43:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:43:20 -0700 (PDT)
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
Subject: [PATCH 17/24] ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
Date: Thu,  8 Oct 2026 17:38:24 +0700
Message-ID: <20261008103831.542533-18-phucduc.bui@gmail.com>
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

snd_pcm_hw_constraint_minmax() may return 1, which is then returned
from wm8782_dai_startup(). ASoC only marks the DAI as started when
.startup() returns 0.

This currently has no functional impact, as wm8782_dai_ops has no
.shutdown() callback. Still, return 0 explicitly on success to
match what ASoC expects and ensure the DAI is correctly marked as
started.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8782.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8782.c b/sound/soc/codecs/wm8782.c
index 3a2acdfa9b85..767251ac4f89 100644
--- a/sound/soc/codecs/wm8782.c
+++ b/sound/soc/codecs/wm8782.c
@@ -39,9 +39,14 @@ static int wm8782_dai_startup(struct snd_pcm_substream *sub, struct snd_soc_dai
 	struct snd_pcm_runtime *runtime = sub->runtime;
 	struct wm8782_priv *priv =
 		snd_soc_component_get_drvdata(dai->component);
+	int ret;
 
-	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+	ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
 					   8000, priv->max_rate);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static const struct snd_soc_dapm_widget wm8782_dapm_widgets[] = {
-- 
2.43.0

