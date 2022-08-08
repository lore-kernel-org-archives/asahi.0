Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B4533E8
	for <asahi@lists.linux.dev>; Mon,  8 Aug 2022 22:42:57 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1659998575; bh=vjy29MfdWk4pjl+jCL2RUCMpSKsefiHnDonIy4ZlDc4=;
	h=From:To:Cc:Subject:Date;
	b=RO6aXwxvIpL7I8JWWGKeuh6Uwmh0daPxXAgOQYy+dXsUyTL7Q5k/X5Tl6CxD64QiM
	 ft/aRd9SeyW7X51J0DvvNljvX8YmA6/nQgq3IrmpNWubDYGiV3PLNQk/KbUsiUVPsH
	 z+p4J67ohnjRgtbQMY9PQyO+sEfcoWU/BzTsnC2I=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] ASoC platform driver for Apple MCA
Date: Tue,  9 Aug 2022 00:41:50 +0200
Message-Id: <20220808224153.3634-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

for review I am posting another version of the ASoC platform driver to be
used on Apple M1/M2 platforms (some previous version was attached to the
macaudio RFC v2 [0]).

Martin

Changes since [0]:
 - addition of locking (extra commit)
 - transition to set_bclk_ratio (instead of getting the bclk ratio from set_sysclk)
 - using shared reset control and documenting the reset in binding
 - formatting, comments, and a minor fix to hw driving

[0] https://lore.kernel.org/asahi/20220606191910.16580-1-povik+lin@cutebit.org/

Martin Povišer (3):
  dt-bindings: sound: Add Apple MCA I2S transceiver
  ASoC: apple: mca: Start new platform driver
  ASoC: apple: mca: Add locks on foreign cluster access

 .../devicetree/bindings/sound/apple,mca.yaml  |  109 ++
 MAINTAINERS                                   |    8 +
 sound/soc/Kconfig                             |    1 +
 sound/soc/Makefile                            |    1 +
 sound/soc/apple/Kconfig                       |    9 +
 sound/soc/apple/Makefile                      |    3 +
 sound/soc/apple/mca.c                         | 1173 +++++++++++++++++
 7 files changed, 1304 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
 create mode 100644 sound/soc/apple/Kconfig
 create mode 100644 sound/soc/apple/Makefile
 create mode 100644 sound/soc/apple/mca.c

-- 
2.33.0

