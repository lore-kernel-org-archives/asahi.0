Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBE421A0B
	for <asahi@lists.linux.dev>; Fri, 13 Oct 2023 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cutebit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cutebit.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org header.b="hAdic2C8"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1697215810; bh=Zz8k/vmZ3NGYYQQPdxfPH4QZU0TH/TxEf+ATJmTjL7A=;
	h=From:To:Cc:Subject:Date;
	b=hAdic2C8HcMkOI+fxprcLO8c4u0x8x+m8k8xEjpvFolJB+VM3EIaZmVyTakYQDNas
	 D0LOl7xZ3qK+kq3272moX0ZlXHjv3QegAKrkltDToL8igO5+iPwnqMi0VhFn2TntVi
	 1wJwVJ0jJw6dGlkVTsBv9wEiLyOxICu+YW0Ns50w=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Apple SIO driver
Date: Fri, 13 Oct 2023 18:49:34 +0200
Message-Id: <20231013164936.60718-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

on v2 of this driver we had discussion over the device_config op not
following the dmaengine spec. I came up with a lazy solution I am
happy with. See sio_device_config for details.

Changes since v2:
https://lore.kernel.org/asahi/CAEg-Je8_f_hZ3VyBg+8tK8uobWNaEqCwp==2JhV6jVpPYXj_Pg@mail.gmail.com/T/#t
 - do requested formatting fixes
 - fix device_config up to spec in a lazy way

Changes since v1:
https://lore.kernel.org/asahi/20230712133806.4450-1-povik+lin@cutebit.org/T/#t
 - move to using virt-dma
 - drop redundant cookie field from `sio_tx`
 - use DECLARE_BITMAP for `allocated` in sio_tagdata

Original cover letter from v1 follows.
--

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


Martin Povišer (2):
  dt-bindings: dma: apple,sio: Add schema
  dmaengine: apple-sio: Add Apple SIO driver

 .../devicetree/bindings/dma/apple,sio.yaml    | 111 +++
 MAINTAINERS                                   |   2 +
 drivers/dma/Kconfig                           |  11 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/apple-sio.c                       | 907 ++++++++++++++++++
 5 files changed, 1032 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/apple,sio.yaml
 create mode 100644 drivers/dma/apple-sio.c

-- 
2.38.3

