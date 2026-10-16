Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319E93803D1
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 04:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123924; cv=none; b=WZ1hYYTHz7tkge+6Z0LdjdnFLqTk+TD+1rRRikkvoKK5GFAI8tADjRv1TprKXYOoLlF73bbdqxnjd2YYnff387O3AbrK387tVkg4EykSuATXGpApCBbzlHftSr9C9YSXExNbTcao3Olg5OK4fUnjDCh9DP91+T3uDvzQgTTjbKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123924; c=relaxed/simple;
	bh=J+EeYnRsgcM/YnSU55c+lLcyk00OoD5ti7bbsMzTw18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrUpoUapRf0lMXlAhPcn/fvl/KGSCwS+uPegeMEq770LuuSMHjBtc7on2a9oY/7OLQxcv3gmJVH4/asak8vbnwpHDDPT06ciV8LCaQ+kaZOs9qa9OSaxNK3GYyiAHYZ/pvyxfmAIYLUcu4dDUY51JRTzFF1zkdQxNY8rC5QNnJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtSJTRwZ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtSJTRwZ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e5d0ee1951so38758005ad.0
        for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 21:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123922; x=1792728722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rWy1nSOU2shSy9HWS2JIxQi3sc/L3puAcABYmBjXjQ=;
        b=OtSJTRwZqj87qbq4XlFAcJM2rygoNb8t07UozZeQaNPuXrNZ0QD/hUNS119FeasF+Q
         5f2oNkupULi3aw8oY+OUZV6MgiTlY244KUwPq5iU+S+p1XjP87BWz0GD7FNorW4eHEnG
         U9YQ9envir6vJtPxQyz9KMC1iX/t2twBY1EB4nzTHTbDDlTqRNyvzXmnSuFLJHmss63J
         CwEs6Rb6evzSEaqFHwcChS72rnBzDIZNbofGcRo+8e+alSnnZcPi8pOYhhoiu2HqGiIo
         Rr1ZUrTEFYe6GR++e+NhXPyjwysgBQBGnksj8kJvvsZe2z+xBmUyBHq+xozbpfk93i2c
         luAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123922; x=1792728722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rWy1nSOU2shSy9HWS2JIxQi3sc/L3puAcABYmBjXjQ=;
        b=Wf1L+d7m/xkDXbgHkqguhrbBDwg+cM/WwfCwZNEmh2HlyiwVufSYG7ovIxrwioZjA/
         vzY49LA4Rt8WiQLx1rOs9N7UeIv5LInnyh5Vrn0tFFWA00iAEZ/2LpmCjQO08lhYBk3p
         2Wo9bw/pX+H2y1KoBzxBubuuGKC4Zs7cyh6Lt29SdVxpvVcCq6jdh1+1q2eSGMPnQNIs
         KLqvXWL1y0BVgVBdAINaj4iLAVoghu6xtuMzO8hVJWagxWDwPFwbXzr83FVZ29XQDB4j
         +YcoEJ49U07GRqh8tJnyVmc848uOoNCW2MhWbzKGqQBOjncKo95ht/b3acmXiVuUzaWq
         7A7A==
X-Forwarded-Encrypted: i=1; AKwUvBwjNLQC3JMVRkZu12W1GEvpYJnz/366qreDcITb9NHon1w7uk6BThCpu344WIjWJCBTJUUiJQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIjjcsUILFNy884K61B2AU9LzTIZAbHWNCd5H0CmGaA6R9wTf/e
	6FfBENHjAHMuob9FF8xmWTQvttH1SJjJYmC9wcX1JTRFdz+pw3tp2dbl
X-Gm-Gg: AYBFou2mNSVumh7Pa+LBDjv00iDXdA+kTi85DdQL/G6al5l9Obrn3zxDLrFfcKq3Xek
	HIoS5DQEFH+Wk2ZMF/qaOrE0HPbd+rCCXCuV1VDwIx1BlTwDi9CULyHvVWaHmcbuuHP1ZdBiZoA
	JYuFe7bO2cHHrmzHjivKgE59PlF+Fo4RduN4T2TUsMT193Q+ph0XmidgMmBGtQ9A9enDQG90RIP
	baOAOzOuhhuqv56hsE3BMOTd45OUvAomHBOjAGLCmjhN8xb5E98JFyjBm1/iIfWOyDwXTAGTCSx
	QSW/qz/TiP9LjWLk9yhv/PMwDZUE4KI+lKO+zzHgjXcAtfdYkyryq1Hae8MobIh8ayv+DpErtIr
	j3C5VU4s5asXdATj3aTWy2/9ADvUZY15YWZqYcGbXyVnrVzijd8P9L6AaFfM4r1AOUQPTvA6NYv
	us+Wb/uBrWRq73O5b0+xSza+aVuFztVRkZohRdwBXL+Md8fprKaMFnbWq21OioohNGPu+QuD/k+
	UXIf8a3nriQKzkRWHtByHA9t0eCL3EFPHdrbxj6HCpTz1YS5t1Lus1GgSIF2tL/NYp1i8kuR0wO
	0lX9icWbZs6mwA==
X-Received: by 2002:a17:903:4b4c:b0:2e9:66c4:1717 with SMTP id d9443c01a7336-2e966c41865mr35460075ad.61.1792123922489;
        Thu, 15 Oct 2026 21:12:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:12:02 -0700 (PDT)
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
Subject: [PATCH 09/11] ASoC: renesas: rz-ssi: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:44 +0700
Message-ID: <20261016040946.521195-10-phucduc.bui@gmail.com>
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
to ensure the component is correctly marked as opened and
prevent future changes from reintroducing the issue.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 2e297f721bb6..9f36fe2c16d2 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -946,6 +946,11 @@ static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure the component is correctly marked as opened.
+	 */
 	return 0;
 }
 
-- 
2.43.0

