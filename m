Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2137EA
	for <asahi@lists.linux.dev>; Wed,  4 Jan 2023 09:37:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 8ADF141F72;
	Wed,  4 Jan 2023 09:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1672825042; bh=wFL5o824s6njbpw90C6rdrkcieXj4RdD7IB7plCdhis=;
	h=From:To:Cc:Subject:Date;
	b=HA+GtbzMSd6PMgKNFRMmMWVo3XY7vGSaudzxbGV4nrCy72NFVLx1Z0frbOL9ibNg+
	 nTY3t4aohXhmkGerj3+0Imeqo34jbN50pLiIbqM8LQPoK6kjOhotemOVfZAIo2Psmf
	 FlzCKd7V202jAoMYP39gZ/64GWBj8Gw96r1abcZLcIf27jbKbkbZeSZ3NGgoW97gEE
	 m77bO2EcqQxFrF7AN2v+Bg09sNvaeL5BTtXY1SWThmpYz6iXzmRsQ6o/92vvEhJiqd
	 d2S4zUK1m3NprTy/xoeWShe+FFuQiX2of/suF8aBsWIzT3BRfFgnzJb3qCo1n/tSI3
	 5pkX2P5SfN89Q==
From: Hector Martin <marcan@marcan.st>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH 0/5] SPI core CS delay fixes and additions
Date: Wed,  4 Jan 2023 18:36:26 +0900
Message-Id: <20230104093631.15611-1-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commits f6c911f3308c ("spi: dt-bindings: Introduce
spi-cs-setup-ns property") and 33a2fde5f77b ("spi: Introduce
spi-cs-setup-ns property") introduced a new property to represent the
CS setup delay in the device tree, but they have some issues:

- The property is only parsed as a 16-bit integer number of nanoseconds,
  which limits the maximum value to ~65us. This is not a reasonable
  upper limit, as some devices might need a lot more.
- The property name is inconsistent with other delay properties, which
  use a "*-delay-ns" naming scheme.
- Only the setup delay is introduced, but not the related hold and
  inactive delay times.

This series fixes the issues and adds support for the two missing
properties. Please pull in the first 3 patches as fixes for 6.2, to
avoid introducing a problematic DT API in this release. The last two
patches can wait until 6.3, though are probably harmless to throw in
as fixes too, since they're trivial.

Hector Martin (2):
  spi: dt-bindings: Rename spi-cs-setup-ns to spi-cs-setup-delay-ns
  spi: Rename spi-cs-setup-ns property to spi-cs-setup-delay-ns

Janne Grunau (3):
  spi: Use a 32-bit DT property for spi-cs-setup-delay-ns
  spi: dt-bindings: Add hold/inactive CS delay peripheral properties
  spi: Parse hold/inactive CS delay values from the DT

 .../bindings/spi/spi-peripheral-props.yaml    | 14 +++++++++--
 drivers/spi/spi.c                             | 24 +++++++++++++++----
 2 files changed, 32 insertions(+), 6 deletions(-)

-- 
2.35.1

