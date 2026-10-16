Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A277C3815D2
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 04:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123899; cv=none; b=kZjl5cSE+wuQS8gNG0GcCWGP+GU2hAT/jbSE44JmFrkBvFBctndViZM3f3fl21orspkmwosGmbMWkkn3VnbjqG0muipkvzaKovT2LQW5jeUQyAoEs/zsSuX+x4r66DnmlCTF833syO9aTE4Rwy7Ptyq5w+7YQL8K7k3AQ3PHWzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123899; c=relaxed/simple;
	bh=uLjOWXpOgCN4Y4ReFAuUHvuVmI9KZ+NG4nVknG5Mu6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mX8oSPocSAew/PTazJu1Dt/iIRfO4ZRT1gkSI3LfpF7uGh0ec7mmhrAc+u3O8J7SIqtY5oFotngyTouULsuqfh4a6ia1gc7St8vdOrcKwSCuHRU0MjopMkH6vxfkAfajwa1o2sIwHF53f78AlNuhZjne34KcwN5iNap327tpoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYh5ugYb; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYh5ugYb"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e987b4a710so1150795ad.1
        for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 21:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123898; x=1792728698; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AfJhOKZbdns69Qk3jxc+qI7b+rXXsiPaDqc4PQO3Hk=;
        b=nYh5ugYbkIZuANSPehNmuIVU4/axuHtk1WcOtF1pB3vrtDZy2uZSxO6CdM6WgU0BlJ
         VI8z7DJSMmtTpL2KtbozuZqSAHNVLqVOKH+OI6+li324cmLYLtRxdldAKWN+usfKWlCf
         peHyKnFnI6IhG5GzE+omxfrVOs6AEUkhCc3baNusq0oLuD1freS257Ujd9niJXx3rrlC
         G2QD094eougoYZqGnOd/ohoU4ORPx8FI2Ic7yrMOKX99hqrgbTGoc5d+FWHE9+cCb4Rg
         YueSZFGLiMQdqcCjcB7DBWaU5rie9wv90b4VX7TFGW8v7wVXY55HX82rf/Vv6vDvqz0C
         CGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123898; x=1792728698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6AfJhOKZbdns69Qk3jxc+qI7b+rXXsiPaDqc4PQO3Hk=;
        b=eknjv3ME04fYg1TPf+FJGxkb3LNc86hwT+N33MmboxwB62tZkyRJ/i8nRYRJs5I0GC
         zWRnKxsutzFgEYyQ193oNsipDBOmLDgfeZLNj026ozbnEsplWz7w5fcroIw+j6GGhdZm
         7UdEFN7KU0BK1Z4i4XTclb290poPqEPsfzvtvywrXSu2m3fj3odjMiyQioTMs4iXyDor
         GTjXVyDJ36mbpmMMRZcU0bTdg0uzg0w3ceEmpPaUqVqXnUYGiR+4l/OR6Uf6YHPQZYR0
         JNzmgmMXo9hNJggGJhCWuccZ1mBPGdvmxJOtJ+CRLwlGa8VFgU1eHoZZP/rvAkpLYUhF
         Ajwg==
X-Forwarded-Encrypted: i=1; AKwUvByMiHaLPLGRH5ifx5VpuzvZzCtjTd8+XWjSm7C1QAaaYFKYkg6syEDDvQo2s4O9MELCrMC33Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKqgS6to35UwmqSTELTFMw777W7g+kmsCPYnmjqQ0oqw4EgkB0i
	yMF+rCPtfQjPaAqRgDOzyV2G3Nu1nn81UZP6Yt8BWHy1OAA8O6TWsxb4
X-Gm-Gg: AYBFou3kHWb5y/oVZtDqc5YPs6cPenhqTkGk0s6qCGGvnDNwKfIkxqj/3pTKcnQicku
	Wp/8txIzrLQfBkKeyMUsIga+0xZCfVQcTX47ZV7r3P/dihpRlNl7QycPOsi3EmVUgSnXcLJsbzU
	ldXZSIoJdMhyOLOC09NYebJ4Uyftbpo3qvGszEO1TxUBCEw6vURLLw3bBZNF4NCYAcah1ff3A5T
	yna7UWZqCfRB3yMmFUqiV0iu6wHlAWY9JJonUFUczEHM1dbuKgI5kDIkFk0lD2IBQWhgU4qd1SX
	mQHllWy0qzCZpYLc0bh8mI70BgdBpMc0Dy4L9DhV63QnNAyAPu9J8/xE/UT23WZkNDoWbPdW1Pu
	TFmwiPpwD78w3hzKvIe5zK/HseZ7WuRLgE6T7zO2Yyq27WuqhpIkz85PW/3BzKX1uL9ouuTaFGn
	4qQzGEJeNcvR8dh4pnQc/l2XWfVfcg8W2cmZu27qvJJ47k6bUqL9FL5kVNmOia0iVOHTsjUVWMX
	aR2UVGam4flk+K9kCiOsDDgyfX34Z02wEkbBdZiHUqe+TYPvNBZSocE3D4MhmtNhM3ESNFX9I75
	SMfEm3gkdbhCew==
X-Received: by 2002:a17:902:e54e:b0:2e8:3b2d:c0e1 with SMTP id d9443c01a7336-2e977597291mr13010325ad.41.1792123897928;
        Thu, 15 Oct 2026 21:11:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:37 -0700 (PDT)
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
Subject: [PATCH 07/11] ASoC: renesas: msiof: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:42 +0700
Message-ID: <20261016040946.521195-8-phucduc.bui@gmail.com>
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

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 88618e4b052d..74e2ea002fbb 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1820,6 +1820,11 @@ static int fsi_pcm_open(struct snd_soc_component *component,
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

