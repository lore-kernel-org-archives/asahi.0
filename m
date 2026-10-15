Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD3D244687
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028638; cv=none; b=Bvnh7fhNTL3r0kScI9XZgDZtYO4sUiGI/YBtgFWbIbDcf2y3X5K0Jdl0c/MmJvXERg0teOkoNwMkog9KN/JuxG24dszxEtA5yzA5EUK0Dl9rUmNRSdxZSHV4I21P1KIXRh3gqmwANJstTynaDm1HrKCXJoBLTLrHzVwif7pbqkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028638; c=relaxed/simple;
	bh=AsEVJmW9HdZ7itXRTksJcaPnMCR5//7NyJ3suWMaEoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tbTuXipmM3C+0Eq4x9nADTMgTIi2Hengs8pg4wQ3S55poyi1juolaO2wciEHRmN7tQPzytP6YLAHTmB+aS1ZZu01ybDQqkFJwhQFwMsNDWZlnn+WaLBOaE5/VOt7bAS/7PrIR0wUEpaSb8eOUyWoFOm4Iv6MOVytRzDa7pCZ850=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FoBwy+gL; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoBwy+gL"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so3241286a12.0
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028636; x=1792633436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=geVeIRJMETVZrOFQgXZr74ay0B29FFoh4B/JZUuVWw0=;
        b=FoBwy+gLJ8DBXSUW3NfXKy3elQSHLglf5H7Ppgf9GWwFiDgiAacgjxZr8mzVbcfiv2
         5MHOmEUbxXXg/ZxRg5UFqk4OBziSwmVBQqNGuPmTT2f7OaFg3FvUK8VvgEN4apYl1d4L
         iMNwicKg6Qg58Dfd81koZrJeFB0J+A7YFl+c6BZFi2QgDLZvanmMCdosf44dqWa2CPBR
         jq5zjs3883pjexZvOLxnK8ncjLalw+xG2ZOdpBR4yvGPDOojeb82r48k3wWGdmFBPnei
         k60ubaFZMO1G0NnKGEWgsTeuGKuBKPftaEPY04qjKia67Dxy6mFP8e+I7yFFhqinwfaU
         40Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028636; x=1792633436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geVeIRJMETVZrOFQgXZr74ay0B29FFoh4B/JZUuVWw0=;
        b=bMbt7qJ8vsnfAwWp+EOf0bNn4g2bTIHHsQojTrSF/JWJkNDP3kpWeR8kQ13OTHmn95
         X1Ne690JzrcCDzun9tnrlw3pDMFmhGONqKtG0OUfnabFWEZkTWpf7klTbEEfkS3jvWYT
         mVKVeyjeyTuE/5nmsucNIa3W0CG+G4zcKsTrle6F23TzMkn5Luwyln5pwHbGkZp0OYbg
         JGj0AirAQ+ZSMdH/8nU8kWWC56273qiXiRpq3AVrdB6UDy1QJ1tUEXaLgIeMIApgUF20
         Z1U1bnmWwjfOkPAAjpavMKS7NRcQZKcbnipT78umLTbsc8NuvAgZFxiYmJ3m+fMMxvdI
         SsFA==
X-Forwarded-Encrypted: i=1; AKwUvBw6JLo7RQxZ1SHO+hEoZBFcMjvQyp4CVsm5HMC9IaL+Y+KqMHA1hkTkYXpTn7ayDQ7tlmsz/w==@lists.linux.dev
X-Gm-Message-State: AFq9FYKkIF40AwCouqMCTJzHdNEnJmcOytznvU4IUXwmbpFegU6jVXrx
	yxeyTMDf+d7LR5OMnHQwScxNb81T6ZZpD5opQ3y8ZisZaQwBDH7Ngrj/
X-Gm-Gg: AYBFou1Pqw8qHEERwhRHqTCP+Q4gwzTz3YngmFK5OJBfaEmyAIkNZ2Kl47TX/YW8FXr
	XB1dOiFUYkrL3Qe3KKSbew1IgPTmuI2z1hwtPRbKuXk1pTpbPuE8lBUgIIvEZPrGRRyvz4QUrmU
	pIb/b3nVCsWjqgqc2wER+UcVtB4uPgtgolg8e2xYWhgGshskR0rLds4apMhiJDWSpGtj+YvspVZ
	QVU2v/n6R9dBqxH1DKD1dhYpJjDPNg01cT3zujobst8/8t0vl7m5A80MrnjPF9L5iHuToogCF1Y
	WmQj5NySq2sqw2DWbi4stnfRhrYVEtpXLhwDLjUHJ7iiOEi/7bL/kZpT2oo/qyczAmV7/9o2Sgb
	72ahqDLnP7Cj2By995sHhZxZLuHaBast5leHnQlCnGmdZLOxnqqFfHZa6auojlI5OJcjpjAiBMG
	ggooT1/aXyGfutgAjGKF4DenKIcIaRsFz99Mw9QmWUjgUvUZ26ux3P5O/DipOfl06WvOg7bu0YB
	Vmq7WiAiT0PczdcvXKuBS+kqHGJ6wytguNnriyWT4RwvIAZqxZh7/ZqS3I+7nrgj39KnGSCopYJ
	tdtpy+YUY+u14g==
X-Received: by 2002:a17:90b:4a49:b0:3ac:a167:8542 with SMTP id 98e67ed59e1d1-3aca16787f0mr98748a91.30.1792028636097;
        Wed, 14 Oct 2026 18:43:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:43:55 -0700 (PDT)
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
Subject: [PATCH v2 00/25] ASoC: Fix constraint return value handling
Date: Thu, 15 Oct 2026 08:42:59 +0700
Message-ID: <20261015014324.5569-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

snd_pcm_hw_constraint_minmax() and snd_pcm_hw_constraint_integer()
may return positive values on success. However, ASoC only marks the
DAI, link, or component as started or opened when the corresponding
callback returns 0.

This series fixes affected ASoC drivers to return 0 on success and
properly handle rollback paths.

Found by manual code inspection.

Compile-tested only.

Link v1: 
https://lore.kernel.org/all/20261008103831.542533-1-phucduc.bui@gmail.com/

Changes in v2: 
 - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu.
 - Remove redundant integer constraints already applied by 
   snd_dmaengine_pcm_open().

Best regards,
Phuc

bui duc phuc (25):
  ASoC: amd: acp: Fix .close() being skipped on rollback
  ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
  ASoC: amd: ps: Fix acp63_sdw_dma_close() being skipped on rollback
  ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
  ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
  ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
  ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
  ASoC: apple: mca: Ensure the DAI is marked as started on success
  ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on
    rollback
  ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8325: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8540: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8821: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8824: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
  ASoC: codecs: wm8580: Ensure the DAI is marked as started on success
  ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
  ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on
    rollback
  ASoC: intel: atom: Fix .shutdown() being skipped on rollback
  ASoC: renesas: fsi: Ensure the component is marked as opened on
    success
  ASoC: renesas: msiof: Remove redundant period constraint
  ASoC: renesas: rz-ssi: Ensure the component is marked as opened on
    success
  ASoC: renesas: rz-ssi: Remove redundant component open callback
  ASoC: rockchip: rk3399_gru_sound: Mark the link as started on success
  ASoC: rockchip: rockchip_max98090: Mark the link as started on success

 sound/soc/amd/acp/acp-platform.c             |  7 ++++++-
 sound/soc/amd/ps/ps-pdm-dma.c                |  8 +++++++-
 sound/soc/amd/ps/ps-sdw-dma.c                |  8 +++++++-
 sound/soc/amd/raven/acp3x-pcm-dma.c          |  8 +++++++-
 sound/soc/amd/renoir/acp3x-pdm-dma.c         |  8 +++++++-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c        |  8 +++++++-
 sound/soc/amd/yc/acp6x-pdm-dma.c             |  8 +++++++-
 sound/soc/apple/mca.c                        | 16 +++++++++++++---
 sound/soc/atmel/atmel-pcm-pdc.c              |  7 +++++++
 sound/soc/codecs/cs42l42.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8325.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8540.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8821.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8824.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8825.c                   | 16 +++++++++++++---
 sound/soc/codecs/wm8580.c                    | 15 +++++++++++++--
 sound/soc/codecs/wm8782.c                    | 12 +++++++++++-
 sound/soc/fsl/imx-pcm-rpmsg.c                |  8 +++++++-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  7 ++++++-
 sound/soc/renesas/fsi.c                      | 11 +++++++++--
 sound/soc/renesas/rcar/msiof.c               | 16 ++++++----------
 sound/soc/renesas/rz-ssi.c                   | 19 +++++++++++--------
 sound/soc/rockchip/rk3399_gru_sound.c        | 14 ++++++++++++--
 sound/soc/rockchip/rockchip_max98090.c       | 15 +++++++++++++--
 24 files changed, 234 insertions(+), 57 deletions(-)

-- 
2.43.0

