Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B5C29A5
	for <asahi@lists.linux.dev>; Fri, 19 Aug 2022 12:54:41 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1660913678; bh=tTprV1n7p44voEK5W8FVLH7SdnHe3gxie4vMBDCp63o=;
	h=From:To:Cc:Subject:Date;
	b=g3bbBbdFZKKhaFxMxs/5P6L1fMZgLmBIiA6e/vR1YREkdFAj0+ECIAR8LnylytQ1Z
	 rFgsJ1ol7nBDkBgiqpiQZJJr+YE5jZAjtpq676mE/9HJLijT9x1LMReFuaJKeai+ZY
	 YO4SV+cn+8FC1j/K+W6StvK74GrHtD/EpM8LP3zA=
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
Subject: [PATCH v2 0/4] ASoC platform driver for Apple MCA
Date: Fri, 19 Aug 2022 14:54:26 +0200
Message-Id: <20220819125430.4920-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

this is v2 of the ASoC platform driver for MCA peripheral on Apple M1,
to be followed by a machine driver later for sound support on the new
Apple devices. This time I attached a DTS patch for t8103 (M1), which
I guess should go through Marcan's (in CC) tree.

Martin

Changes since v1:
 - reflect the set_fmt provider/consumer change in 6.0-rc1
 - fix the probe function requesting optional reset
 - unroll 'dma-names' in schema
 - fix binding schema/code discrepancy in register ranges
 - minor things

Changes since 'macaudio RFC v2' [0]:
 - addition of locking (extra commit)
 - transition to set_bclk_ratio (instead of getting the bclk ratio from set_sysclk)
 - using shared reset control and documenting the reset in binding
 - formatting, comments, and a minor fix to hw driving

[0] https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/

Martin Povišer (4):
  dt-bindings: sound: Add Apple MCA I2S transceiver
  arm64: dts: apple: t8103: Add MCA and its support
  ASoC: apple: mca: Start new platform driver
  ASoC: apple: mca: Add locks on foreign cluster access

 .../devicetree/bindings/sound/apple,mca.yaml  |  131 ++
 MAINTAINERS                                   |    8 +
 arch/arm64/boot/dts/apple/t8103.dtsi          |   70 +
 sound/soc/Kconfig                             |    1 +
 sound/soc/Makefile                            |    1 +
 sound/soc/apple/Kconfig                       |    9 +
 sound/soc/apple/Makefile                      |    3 +
 sound/soc/apple/mca.c                         | 1170 +++++++++++++++++
 8 files changed, 1393 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
 create mode 100644 sound/soc/apple/Kconfig
 create mode 100644 sound/soc/apple/Makefile
 create mode 100644 sound/soc/apple/mca.c

-- 
2.33.0

