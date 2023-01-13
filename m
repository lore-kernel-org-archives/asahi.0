Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73A120E2
	for <asahi@lists.linux.dev>; Fri, 13 Jan 2023 10:23:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id ECE8341A42;
	Fri, 13 Jan 2023 10:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1673605409; bh=Qk0SZhUSDcUli3ukUepHX62c899A3JbfgCFO6jDV0xw=;
	h=From:To:Cc:Subject:Date;
	b=l/RI4vKRdxtkr1dgBIidcWG5huYub+Hd8IQ4/8AQ9V+BjXniGnGiU7aIFRlbq/vxE
	 dK8mHJeu6jhqseny7hhgTLMcPfw+YXb154e8BipO9gRGyOO2RcT8qZtqsPak13kkLh
	 IGgXh82uSQGygDRIJQn6rNEdRI8f1YGPhIix1NOMGljo9TSMplT3v3/x1zyAw4UZh4
	 9jJxba6lyvTo2g+bEa5jpYzUAFq7WnLQdwVdRVaQN/hAqns+goLBeSRMCn6sHaEDlP
	 QhugQLLKCicRknkAnVE25f2+/4BS/2Zn8wyKIJOzBFBk5G6F5alMKkPUA6iw8L8dyn
	 gEGvHEbkbAXWA==
From: Hector Martin <marcan@marcan.st>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH v2 0/3] SPI core CS delay fixes and additions
Date: Fri, 13 Jan 2023 19:23:07 +0900
Message-Id: <20230113102309.18308-1-marcan@marcan.st>
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

v2: Removed a stray variable declaration that was triggering a warning,
and dropped the first two patches which have already been applied.

Janne Grunau (3):
  spi: Use a 32-bit DT property for spi-cs-setup-delay-ns
  spi: dt-bindings: Add hold/inactive CS delay peripheral properties
  spi: Parse hold/inactive CS delay values from the DT

 .../bindings/spi/spi-peripheral-props.yaml    | 10 ++++++++
 drivers/spi/spi.c                             | 25 +++++++++++++++----
 2 files changed, 30 insertions(+), 5 deletions(-)

--
2.35.1

