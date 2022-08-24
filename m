Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E014D186C
	for <asahi@lists.linux.dev>; Wed, 24 Aug 2022 16:07:26 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1661357238; bh=vfSK7fJtUtZF7v3UQoemHYG11mAecyxCaxX8PYPRpzQ=;
	h=From:To:Cc:Subject:Date;
	b=a77t2Wm0ZCHFkidB88rzre6aeLIfhkq/9gl2n2ez05Cq3dJgUvznsbu/fv5l4gT4i
	 yhhwM/fbFcx2NT7IxLSbNKRPbGc629r4k0zKZAJGqbYhXg8GVrYuOrvq7Su6zGzCXO
	 GZERaZwHCqUxk0M1stlco3+9HLwh/DykEvT3LLno=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] ASoC platform driver for Apple MCA
Date: Wed, 24 Aug 2022 18:07:11 +0200
Message-Id: <20220824160715.95779-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

sending what should be the final touches on Apple MCA driver. It most
likely goes without saying but please do not merge the DT additions
into the ASoC tree.

Martin

Changes since v2:
 - fix Mark's style nit
 - order compatibles in schema
 - redo the DT additions for t8103
 - remove stray unlock in mca_be_prepare (and rename the locking patch)
Link: https://lore.kernel.org/asahi/20220819125430.4920-1-povik+lin@cutebit.org/T/#t

Changes since v1:
 - reflect the set_fmt provider/consumer change in 6.0-rc1
 - fix the probe function requesting optional reset
 - unroll 'dma-names' in schema
 - fix binding schema/code discrepancy in register ranges
 - minor things
Link: https://lore.kernel.org/asahi/20220808224153.3634-1-povik+lin@cutebit.org/T/#t

Changes since 'macaudio RFC v2' [0]:
 - addition of locking (extra commit)
 - transition to set_bclk_ratio (instead of getting the bclk ratio from set_sysclk)
 - using shared reset control and documenting the reset in binding
 - formatting, comments, and a minor fix to hw driving
Link: https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/T/#t

Martin Povišer (4):
  dt-bindings: sound: Add Apple MCA I2S transceiver
  arm64: dts: apple: t8103: Add MCA and its support
  ASoC: apple: mca: Start new platform driver
  ASoC: apple: mca: Add locking

 .../devicetree/bindings/sound/apple,mca.yaml  |  131 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi     |    4 +
 arch/arm64/boot/dts/apple/t8103.dtsi          |   73 ++
 sound/soc/Kconfig                             |    1 +
 sound/soc/Makefile                            |    1 +
 sound/soc/apple/Kconfig                       |    9 +
 sound/soc/apple/Makefile                      |    3 +
 sound/soc/apple/mca.c                         | 1167 +++++++++++++++++
 9 files changed, 1397 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
 create mode 100644 sound/soc/apple/Kconfig
 create mode 100644 sound/soc/apple/Makefile
 create mode 100644 sound/soc/apple/mca.c

-- 
2.33.0

