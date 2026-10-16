Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CF737F006
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 04:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123936; cv=none; b=ZAHqVsUUKfWBnrZ1H9V9/zifgq9bFV5i5QUulg84bjYPJ8+p806IGzovHLT3tf05w+RKUWgKL8Ux4Y/xqwYohKTS3WQm0HCyxSxhaqCicB2UoFmMa+/qpD3yOr2ZzrkSiuycOfdkFXvl9YHgOpgtc2oKa7WW3dg70dPpsjELf58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123936; c=relaxed/simple;
	bh=Gs9t3eNuKnVFUO3uoF5nDdlII68A+pSb8mn+aZ2CHts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iM13heZDKIomB3nZPhDrQpHsqNebOWyo78Vyty8ErlRYvtAo9uXp28F2Rhnk/27/XKBAXLHMO1nAnmC8xWcdfpMd/lnHaR3ZJB5HJK/InBPSdECTtpk0pyEVZmMqjp96SYP6pf+sbtyTK42fXKi5dhA7YCKV/YPwjyCWEwkPZUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGyeRkxU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGyeRkxU"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e942864693so10793615ad.1
        for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 21:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123935; x=1792728735; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AZDJdjhNuFXFYn0yeoBtoVorlOWOlf41UfMI392qg0=;
        b=YGyeRkxUsZcADDijv8/I/MMNOe7ul7fkbQWf0/HEO3sFB4HrUttcHnqT5Itt6Kahhm
         tVcX4RoNjU4aNVNd7mMaSmqsJKuwcFvXgtunS2uCUDEKbciO2OhAPXvTOhZqfautVGtK
         zgg1Hr+Cu2Aom1IruhDiDYCEVV/kkipgPmaTFcrnwxz8z3zGIfvDrNUuWweEWR6jWB/F
         yHOABeWR/KrGwi7HyDrm1FVYTLC8J6gQBOEvP1a9yyHZD0sDVkvKFUmLS3Rknuh6IDkW
         DQ2EP9BKsiXSxJbpn8kvaHiC9LyfkELxxgpuPXCxR8xItugRxe822IZUCvvINWvMZ347
         FLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123935; x=1792728735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7AZDJdjhNuFXFYn0yeoBtoVorlOWOlf41UfMI392qg0=;
        b=nM1iG+8TNJCrIE3BlILbe/ijrjfvjnZ5LUv/MlmMgzSaaxM/KxmLN5c2uKk4S10ZHO
         zP82AomVgzM5xL4Gny3VjYneGiX5zmomfz7CvcmPQGfHPEXcX1A4sYHdoK0IZNeYN+Hn
         CkD7yU3HvNL/FQoFid/Hu+MNqSZf3WvjkAMgE+0An7LFp+tvPwsG/GjHB6U/pZWlEx+l
         GuSGDz2xg871p97JKxvyjtb0AhW1y6HD0p+COmWlqH0D0FSG305MAvB4tmAGm+vj2KVR
         wVo5WndgfmlUf0CEtJO7Y9AUdKa2UFGHifklUvOPGabhtwrZ/94mRiTWhpc/bTAltz4s
         UvqA==
X-Forwarded-Encrypted: i=1; AKwUvBx1h0LLHYiphCplcMvKuG/XPIBBJLMain8xCT73AHwMLNOd9a+t2fCmy9DId2HPjGsEz2Vc/w==@lists.linux.dev
X-Gm-Message-State: AFq9FYIdcQsxfjk2tFXdrmEVJ2bsfQHzneYl3yyTLIKp96M1Z7fbxQgD
	IA1K34gPaEW+y9Zcy+qiv59izOIsYXzeSt5+7YfC30e12+/DhT/PHuD5
X-Gm-Gg: AYBFou0xLOn80PL9GKhQZRkYEhR1ip+NamKO5iknE2HpQTAMRJwckQ+s0PNeJNLw7Nh
	zJBXw5MCqxwpjY5CU734ZPoKwuE7OU2l05Ve3M+HS+LaKeizRganR948JVR6UlZJ7IjVGGux8zT
	FwBk+Cv/OFCWesrjvazc1/kSNzastFvXtT4U8LHxLApLoMKT7WO4QuUmydvd9P1PQsNmo8q8Fw/
	UnmWyze11/CZi+I1uwss0IpEbodJCHRxYsCyqPyZhMQFh7zPODxHkcjSzvQZS0B+3agnau3oUOA
	D8t0kGeZjulaKjJYaJIh5WmkiyamEQqxfDIuvTik3pCmWrWlp9LJZenSVxoEaOG3dqXkO1eHNKk
	wPAYzxn84/Cva5l+PY7NpKalvBxorlN22ncBRfz1HpMUZ8Z6Ds+ndFBYAnjGp4CWJTEk+XfBEQv
	DoBiQFPWPxf4TEM06g0WnLyw86fr+KoRsEZRNtMSjhJ7U/i9f1H0TFAFV//XHn8fy4S1/oDshud
	5PEs7lf9hTXcXm2jdMzfMbk2y4ugyX05U0L9c460TyNnn8rbBxNYZJLaR1PI47IeHoziw2eVEOX
	nEL/2gEZtK82Vw==
X-Received: by 2002:a17:902:f70f:b0:2e9:660a:7944 with SMTP id d9443c01a7336-2e9660a7bc6mr31481475ad.58.1792123934758;
        Thu, 15 Oct 2026 21:12:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:12:14 -0700 (PDT)
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
Subject: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component open callback
Date: Fri, 16 Oct 2026 11:09:45 +0700
Message-ID: <20261016040946.521195-11-phucduc.bui@gmail.com>
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

In DMA mode, the generic dmaengine PCM component already applies
the integer PERIODS constraint in snd_dmaengine_pcm_open().

Since rz_ssi_pcm_open_dma() only applies this constraint, remove
the redundant component .open callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/rz-ssi.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 9f36fe2c16d2..9a0781bb072d 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -954,19 +954,6 @@ static int rz_ssi_pcm_open_pio(struct snd_soc_component *component,
 	return 0;
 }
 
-static int rz_ssi_pcm_open_dma(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream)
-{
-	int ret;
-
-	ret = snd_pcm_hw_constraint_integer(substream->runtime,
-					    SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
 					    struct snd_pcm_substream *substream)
 {
@@ -1017,7 +1004,6 @@ static const struct snd_soc_component_driver rz_ssi_soc_component_pio = {
 
 static const struct snd_soc_component_driver rz_ssi_soc_component_dma = {
 	.name			= "rz-ssi",
-	.open			= rz_ssi_pcm_open_dma,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0

