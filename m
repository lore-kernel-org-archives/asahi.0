Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5AB7A
	for <asahi@lists.linux.dev>; Tue, 31 May 2022 21:52:29 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1654033457; bh=ziyRGQZ5j9pXKOOFBr0A16Lvtbsz+JTt1HHydCrON/8=;
	h=From:To:Cc:Subject:Date;
	b=YNvEFc9197nSTsQy4b7S5TbkOG0RjCFC4tboeu/FYPbO2EP52aj3sZ9szSme5DDS9
	 3Kt+SRtqxTihCCQC2DjxNoPa6HYbK9Zj5FUwS9nooM7A7xfheYDKgFxAXk82csdfp6
	 7DnUveiuPgt9QkhO07LVQBxbaE+RxU+Ed/vOktK4=
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Mark Kettenis <kettenis@openbsd.org>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH v4 0/3] Apple ADMAC driver
Date: Tue, 31 May 2022 23:36:12 +0200
Message-Id: <20220531213615.7822-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I am doing another push of this neglected series which adds support for
Audio DMA Controller on recent Apple SoCs.

All best,
Martin


Changes since v3:
 - collected Rob's r-b tag on binding
 - split off MAINTAINERS commit for easier merging (allegedly)

Changes since v2:
(link: https://lore.kernel.org/dmaengine/20220411222204.96860-1-povik+lin@cutebit.org/ )
 - in binding, make 'interrupts' fixed length and add a comment
 - do not use devm allocation on descriptors
 - use platform_get_irq_optional to not log errors in the course of looking for
   an usable interrupt
 - make channel no. unsigned

Changes since v1:
(link: https://lore.kernel.org/dmaengine/20220330164458.93055-1-povik+lin@cutebit.org/ )
 - in binding, drop 'apple,internal-irq-destination' in favor of
   prepending entries to 'interrupts'
 - drop admac_peek/poke helpers
 - use special versions of dev_err/WARN_ON where desirable, fix %pad
   formatter invocation
 - bring implementation of terminate_all up to dmaengine spec, add
   device_synchronize
 - minor fixes (comments, formatting)


Martin Povišer (3):
  dt-bindings: dma: Add Apple ADMAC
  dmaengine: apple-admac: Add Apple ADMAC driver
  MAINTAINERS: Add ADMAC driver under ARM/APPLE MACHINE

 .../devicetree/bindings/dma/apple,admac.yaml  |  75 ++
 MAINTAINERS                                   |   2 +
 drivers/dma/Kconfig                           |   8 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/apple-admac.c                     | 818 ++++++++++++++++++
 5 files changed, 904 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/apple,admac.yaml
 create mode 100644 drivers/dma/apple-admac.c

-- 
2.33.0

