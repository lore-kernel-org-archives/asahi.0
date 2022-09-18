Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB247F2
	for <asahi@lists.linux.dev>; Sun, 18 Sep 2022 10:09:17 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1663495156; bh=GhjgtFBnDwq38pLPrNGHQBD/G+iWkmUIYKT3/As9ZJc=;
	h=From:To:Cc:Subject:Date;
	b=ldzxa9jok4Kb04UQIOk7AiM4ZQAwglQLzjSUlyk1Z98Bh63ESFFPkzVJU9e70S0CM
	 T9QNwXVv/VjhfbXgiYm39823aHfYFd5Jucz3vErpKqojhorKEK/LT/Sz5F4SKFJWiN
	 HNo0Yrot80oPSe85qwqv13ykeE8wzSn983uksGUg=
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH 0/4] Apple ADMAC peripheral reset clean-up
Date: Sun, 18 Sep 2022 11:58:41 +0200
Message-Id: <20220918095845.68860-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Apple SoCs the ADMAC peripheral shares a reset line with another
audio-related peripheral which is the MCA.

On the side of the MCA, the reset is described in binding (staged in
broonie-sound/for-6.1) and in the soon-to-be-merged series adding new
nodes to t8103/t600x SoC device trees [1]. The staged MCA driver does
make use of the reset, knowing it's a shared one.

This series catches up on the ADMAC side, adds the reset to the binding
and describes it in the t8103/t600x DTs (on top of [1]). It also pulls
the shared reset from the driver.

Since [1] already includes another ADMAC binding change and will
probably be fully merged into Hector's asahi-soc tree, I propose the
binding change here takes the same route. Leaving patches #3 and #4 to
go into dmaengine.

[1] https://lore.kernel.org/asahi/87pmful5r4.wl-maz@kernel.org/T/#t

Martin Povišer (4):
  dt-bindings: dma: apple,admac: Add reset
  arm64: dts: apple: Add ADMAC resets on t8103/t600x
  dmaengine: apple-admac: Do not use devres for IRQs
  dmaengine: apple-admac: Trigger shared reset

-- 
2.33.0

