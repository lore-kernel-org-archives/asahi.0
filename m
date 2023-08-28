Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D02213AC8
	for <asahi@lists.linux.dev>; Mon, 28 Aug 2023 17:00:24 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1693242016; bh=2a0YyIYnFhba8kmovt7IQO7yRT9lM892IESkc2yJdAs=;
	h=From:To:Cc:Subject:Date;
	b=O+VXi8yO5/F905z4PcFqW0PFJdF5Fb7MFUQltAuXYWEnJ5j3M9CMxdyH05MPNbjNu
	 7qaH6f4gexkBp5SuYR5LM+BHdPi7ZoC5jpJt4dxX0scX9s7SUWipjDsFAoLFiR3lNQ
	 yw5Urj3+ReJf5gV6St2/REEMuAMnv7n+/1i3N1J8=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Apple SIO driver
Date: Mon, 28 Aug 2023 19:00:11 +0200
Message-Id: <20230828170013.75820-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

see attached a driver for the SIO coprocessor found on recent Apple
SoCs. This coprocessor provides general DMA services, it can feed
many peripherals but so far it seems it will only be useful for
audio output over HDMI/DisplayPort. So the driver here only supports
the DMA_CYCLIC mode of transactions with the focus being on audio.
There's a downstream prototype ALSA driver the DMA driver is being
tested against.

Some of the boilerplate code in implementing the dmaengine interface
was lifted from apple-admac.c. Among other things these two drivers
have in common that they implement the DMA_CYCLIC regime on top of
hardware/coprocessor layer supporting linear transactions only.

The binding schema saw two RFC rounds before and has a reviewed-by
from Rob.
https://lore.kernel.org/asahi/167693643966.613996.10372170526471864080.robh@kernel.org

Best regards,
Martin

--

Changes since v1:
https://lore.kernel.org/asahi/20230712133806.4450-1-povik+lin@cutebit.org/T/#t
 - move to using virt-dma
 - drop redundant cookie field from `sio_tx`
 - use DECLARE_BITMAP for `allocated` in sio_tagdata

Martin Povišer (2):
  dt-bindings: dma: apple,sio: Add schema
  dmaengine: apple-sio: Add Apple SIO driver

 .../devicetree/bindings/dma/apple,sio.yaml    | 111 +++
 MAINTAINERS                                   |   2 +
 drivers/dma/Kconfig                           |  11 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/apple-sio.c                       | 868 ++++++++++++++++++
 5 files changed, 993 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/apple,sio.yaml
 create mode 100644 drivers/dma/apple-sio.c

-- 
2.38.3

