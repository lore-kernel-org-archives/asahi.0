Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648CA3803D1
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 04:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123888; cv=none; b=WIn5Z8tQQrpeQmleFX7TQLxQVACMxId43chtin1+fpNe37wMIzXmq8JTXRSf8AFghbp/1PPha0chfaXGhEf0r+mz50rQr2ce4k5af74N8rg1n5u7iTbwtN44ODl0A8+EGn7kvNUD+vFsLnNEJDq8hTzj5mrW5kWu+SHoWHyCr/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123888; c=relaxed/simple;
	bh=8jX29D2gDGlcFjhAzB8ItddONnlX6s2Irul3cotnAzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L07LKklGkjnG/eueftSisEZ7a5eGkRKkIzX5fdcpgQGHeTnsKpZ53d+zYSiYKAyxd5/uhvjTD6QSpJFawEUWEr8TmdTnp4MKMrxm/OoZN2n+2SACW7SXlKQxYD1Bavw4jj37kw/JCRBL303XeJf20w1PooZUR6hOZLi5dSH3obA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JYvSNd6/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JYvSNd6/"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db80fcdf8bso35128605ad.2
        for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 21:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123886; x=1792728686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFZz4n9YWSVULVEw1Vk7UW4bxuXJ2XFPuy179wpDhwk=;
        b=JYvSNd6/HKg3KeFKBRElTTvLk119o9M/gzXETNaf72TJv3sA4fHLyQiriGD2e9bBJy
         uBFGr3yEPTZjMgyf9BNCedpvu4drhBAOwR+1ckhE4Aj6G2Xo0Of3DSuAz+LYxB+4U7aG
         r7HHNKYus5H8gskan1MS6Utkquv52z72PtEU3Z/jDCxmv2yRLjHUPHjBBl1dSXL29Hck
         29rPs4kRZYXbONyz5+fXe+CsG4vFU8UaJVZr46eISYQqpdX+X18B0yegiAx40+HWTwT7
         u+SD9ot7TcAjnxVBEyxnPxMChHJ3ifDVLINF8UNr4w6S06+otoyTJ69UQeiFG+cGa7cE
         nFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123886; x=1792728686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFZz4n9YWSVULVEw1Vk7UW4bxuXJ2XFPuy179wpDhwk=;
        b=WCaXgs6hbEabsabTy0YMB5B3NAPFPteIfWZ54eO4kXKD1PQbMzw/jn0nhELRkszkRn
         ZDVpzlTHTkFfA/mIa5HCF3w1eeMpI1iy47X0ECfSJ3khtS4/tlXE/On86k1x6n8nCtax
         WPAaWKS+HJ4RXDzos7CgG1a3wKpSfl1MWobmdBtUYwzxTQKOBDlpv4yU4PGGox72j01Q
         0ysILfcvLZkmY6DNV9O5OvrlBMwFeTy88JjajB+Ze85wumfjrTalonX1QonPDZnhU/jn
         iHOGOiQ4VJi6kvDKziAK2LFyPzrBPpF/bCRFyX4m8rb1gb4FbzmW95a10Bwo5kZPddYx
         Z4hQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbDd26notM72txiQrblv5X6YfDfZklwFZQ/6AcXEH6unmJeZApLa/1WtVhSN+YE7PplpZ0OA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKkwnI9ebqvuJUBjt7N58akhgSg3TpzrSr1vxT2wk92PwCOPAca
	dY3/Ao6P1eIlxaIUs6DM4kfSIXmwHw7dodbIEiHwbrprKr4OmO87FlcA
X-Gm-Gg: AYBFou2iHCYnYh8jTmDP9/oVEOyv7bypWN04oOQciPlmXFXzEjuN3hvWVGDObj8RKm7
	P/ANiEHTpERJ+YKwnPL89x50m10GxejQbJ6o8z3OJKV3t1c8tFDm1G8K7XNZSP+9zd37ixnbC1A
	UPJ0vb+dXGVkaoUT8oPn6mTQ/aE3Zh5jGhybae/Bd7kxnd5ZD5OOzIAERyKxJH4N7/oGiJC95RB
	dT55ixdn7ughlSTVv7nkXBy69yo8C5oVYNekl4Wbveb7jJNVKMT+q0BbhRLfLH61l66hSD5nO2n
	mjZyKRMU5CLj0luQwK9n5iryCRcbZRXWIxfoQDE9N+Jmy0EgohhJYMtqLcN2qRfoGvCpQQ+JpN5
	NYd1Yz5XEJ4Zb5ZLxEPfcqLGVhVTY4boFBkg/1GOUcx0RxxZ/TTGMk0B5ahfxQV6a1kdYo4tDVL
	AE14cVLtl0mP7o0cNDZ5F3FTLvSqqmCgogXPy7wwueYxnogFkhzeMRj/7HJTAOYPCP716XCfebN
	2wchID3+Yf+A730ISNHE/HGH0kopqK+YMmM7R/RyWQW7WCTvKcJxhgfltFU5JjOEXOQIN+CdabF
	qkdj6yrr2XWxrA==
X-Received: by 2002:a17:902:ebca:b0:2e9:401f:f0f4 with SMTP id d9443c01a7336-2e9401ffb38mr56691775ad.16.1792123885664;
        Thu, 15 Oct 2026 21:11:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:25 -0700 (PDT)
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
Subject: [PATCH 06/11] ASoC: intel: atom: Explain DAI startup return value handling
Date: Fri, 16 Oct 2026 11:09:41 +0700
Message-ID: <20261016040946.521195-7-phucduc.bui@gmail.com>
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
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index db1fb3b26909..58681e007abf 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -341,6 +341,11 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0

