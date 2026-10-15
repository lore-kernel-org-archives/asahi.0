Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31B8342509
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028966; cv=none; b=sVNDVIoxueYJwWbvKF2DPLKB3IHWMM8U6nkX2Z0smY22dH3NdZFSm/xVqtAxWVjT6Dzcb2pfSoC0RVFHX7efNjx/42fEEs/JPAqKN2Jf9GIGpLvbRdapQzWONH9+qE1YpG1AB37E7t0Pal45UZVkxU3DciXcNTjAlfrvjjPALj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028966; c=relaxed/simple;
	bh=wpmHgU/SVIYOTBhjMxKFXWaiqOI+cwOYjPVM8h1oB/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=El8BvLiAU7pWHdN4bCKDQT+CTs2ONKQP31/F6dnmFIw3bW04t6yCwMeAMO3j7yjDePurIxvjdGxJUEsk11RHbrnmM5ziIWYCubmZF5yPzJGdNBr1Iok6SujdiHnX2DelPtXvZjWVtICARqJ7QjJIRrxN/KwoLUmWYFIiImhSQgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdrCuRfY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdrCuRfY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e60f9af6e6so12939475ad.3
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028964; x=1792633764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRhw/DGZE60v7F2bKWHVZMO73GmaBC+Vm8KSgOideNk=;
        b=NdrCuRfYtm57eO2dxl6CdVGKiuVwN81KYPZkiKxojz6OtXq/jhaD09+l+xZSqFll8f
         Z3TCeK9HkZD2HFar8pzVdAFmxGdqen6v9Ld2v1w4goEZooDTSO/xM0KifZttp+7MF9JG
         BvZ4IKNVfj8ZbzPjuPzWLTOC6N86tQh4j+NrWV8qDW+25dc/t7SufpLqdlhNiMMVzsa2
         T0eV29dybj2VBquZdQDkOouh2GlpWeSRXkp3YG1kFaufStG0fKjBTLyDIDbxqmKU2AtT
         7iddnl3cOBDnGf2b873rQbwdvHawncqRRyWRithUI+e75ekwrj0n9Jg46Dm/tn5ekZjW
         Xu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028964; x=1792633764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRhw/DGZE60v7F2bKWHVZMO73GmaBC+Vm8KSgOideNk=;
        b=nn15T7N1kjh5Me9OHOe+WQ/SpLXTgFRivXJVcZsP4ISF8Y/7wKQXjx0Gj/1odR5Pon
         l9hSSBmdqs5xyIykQCPHBfUJ9BjKxxebrNPyu0PL10tSvAZ3JdfeDsIEnKRf1YtNwHQK
         O301yRZawlXTjmya75dotBIelbKFhXkwAf2KY9omBYfuKKDKplbqmvQj76fRdBvMDbIc
         xg0SZk6hzQBgb0b/IQTcoKQ2KW6WtfkVsEnHlPy9shiOJ5jX1+fdIaSQPXUnI/1wVhuD
         6z4n4dsVMqRJrvTUPmsfG5xxTSJ9GaIue/QhUKb7csS+oZ1rcfVDQsdWZbjNxPLtlNwz
         AeyA==
X-Forwarded-Encrypted: i=1; AKwUvBx3EQBK6DVMrPDxdel/eeQjiHLhTBIKfCRIBtK5hTHIpF0Ry4xUzjeOmxIg0quoT4w1K/twKQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLnh3pL+EBz7I+Xpje464JaAjiQ7HhWV2NVBvEGw/LnyBQjzcLb
	m5DgYm3Mu0gfPjnj7QgqZqb6GWUsVf4+lO5DgMzEACwZUftSOZBXWW+n
X-Gm-Gg: AYBFou3K89JnERgYkCE7P6YbSPIM9Xjn2FUl2kgwuXaNGnuCJ+33A3h/RmbAymR7yvF
	CfTpNdvngGfCdRnlYH/YehPDkbw7kQNVD5rx9ASE2v62GtkIsMn01NVbWqcqRQqlKWry54rVE19
	NdJweq6nTowc7ZjAxdCyVgY1ZgHf7Hf48NVydqx4zYVIcMo8GzRYE80E0e5+7sG5GImle0ObJ0T
	RW3xnEB2+5LljCgNZwgY5uXrb6tr4J4E7wLPXA3oPLE1yCdFJpBzT4sA0kfMPmv0CuBRzgGQ3pT
	OAEZoc9YjM3WRwyowLce7ClZmSNALlF6TOwm7zEKiskkkpmngAQYojWu8W5wlnZqL/m9HyJq1w/
	SrvXK/NqlDhzKanEqdK4nPv/9IAIYNZ5ld2Q8KnmAbb73qDCYA2rZWggYl1yTvZNEzHWAqCe/jc
	0/8aKhEjd110pcaSO0U2CZbi7TfuTdco4iDuqLNfuRUBNNY40rNQqqstmQTPvkamMJdCf5VfOPj
	mi8t3CdwgDc4fmzlclZKmJyKMZceuuLFqs6MtmQR4ptRPDm+3bEuMsZx9FIeY8uNxLLGaelL7qJ
	BERmt1Ak8AW5Kw==
X-Received: by 2002:a17:902:e548:b0:2e5:54c6:e5a2 with SMTP id d9443c01a7336-2e842820581mr176747665ad.6.1792028964152;
        Wed, 14 Oct 2026 18:49:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:49:22 -0700 (PDT)
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
Subject: [PATCH v2 19/25] ASoC: intel: atom: Fix .shutdown() being skipped on rollback
Date: Thu, 15 Oct 2026 08:43:18 +0700
Message-ID: <20261015014324.5569-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015014324.5569-1-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from sst_media_open(). ASoC only marks the DAI as started when
.startup() returns 0, so .shutdown() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: 4889a8a73f65 ("ASoC: intel: atom: Use __free(kfree) for stream pointer")
Fixes: 6cc0f4e63994 ("ASoC: Intel: mfld_pcm: move stream handling to dai_ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index a4c8cbfba096..58681e007abf 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -341,7 +341,12 @@ static int sst_media_open(struct snd_pcm_substream *substream,
 
 	stream = NULL;
 
-	return ret_val;
+	/*
+	 * ASoC only marks the DAI as started when .startup() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .shutdown() is not skipped on rollback.
+	 */
+	return 0;
 }
 
 static void sst_media_close(struct snd_pcm_substream *substream,
-- 
2.43.0

