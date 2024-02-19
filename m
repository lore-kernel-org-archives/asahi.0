Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358DF2C6B8
	for <asahi@lists.linux.dev>; Mon, 19 Feb 2024 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708342340; cv=none; b=jLhUaTHAF58Ug7SDi76m4tZHI/2Rpwk5hD3g4GLhZqyzoeiw21ay5FGoWFYEzSdDCldF5gOOsbNmaeH8R8qkl6Mw2jvo5zmnXv/Ws1aJq8aE94IMOpbswTw5ac6MOMJdm0t/ts5Z/Z8eajdtRuM3kTEhsHcwL4RFkT46ZbFUr1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708342340; c=relaxed/simple;
	bh=gbOcFoOzr/7EnXJW4o3Q4MK/WjQw3an8g42KJ/FDXq0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dnTEiFMz6ZYLgY/Oe2+0TXC5BnCIhTRDONUgwzo2X8BKexpSZDwXuWpnOqK8mBV4/ZvWB3FPhPBtp1uWVcXh6ICwk6qFQT42iPCbVlQP8/AtfLwHOTW0HfYyh3ZgqkGXOfBN2bW0DrU7cJysNKlViHLVDiUrXJcjUDJW6vt6ZjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rHQFTgzA; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rHQFTgzA"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dcc58cddb50so6833413276.0
        for <asahi@lists.linux.dev>; Mon, 19 Feb 2024 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708342337; x=1708947137; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F9Y8XdXv1kzTQtopo89RJ5Qe87rOsaXFYORvSusUYec=;
        b=rHQFTgzAc0HakRq5qRqJvDczsZ+Wo9EL8vwvOQ7Ipp8wYO5ai9DXevAa3IbiSx1S3g
         1749oQ9MBNGqGKOuwYRays+bkoBTCjgliG8cA+e2J4bamtYS61zhL7L6dpAokTyEtogA
         9d7h0LmxNgch3n849Fd+hMbAtgsfaxPAbabAsToH4C2AR45rAuhz3vBKgQ+i/MXE/kw4
         05BPUz84gDmFrXHno337NMfmoKYoUuhB4EneKBx8XxAAzvsj9+HsC0obx856tfA2L6gL
         En7lZwPkZan0KWPRmBpnB36lon27sI19xI6/NX0Txx8K4ubf55I7LB2sgBXck0gNcm4J
         6z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708342337; x=1708947137;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F9Y8XdXv1kzTQtopo89RJ5Qe87rOsaXFYORvSusUYec=;
        b=oOxtxLxE9Rn5BGmEMRqsBRLcqM9FhlMqVQGc1WhA1MbT4mP8pE5LHJE3jx60KA8SvZ
         5vHg9lyH+AaRdK4n9AKv0KFphZSwVZwfbqurJhSnWWeZHt5AIZ+jfJGhFWvLRXUakUu3
         E4D70U/s79LyzEmZ/JMC/ew6AjWTFsZ6bdHyehPO993LaD4GOv+gsx09d1N8JQS/aPCp
         xvXq/kNXZp5cZcpoT8UdUwiQmLuxEz11fBW36DhvN4qMJSARt/6qVN9M+w/GhkEe5a+w
         eO3gkYHXGMeKE5Z3gIxq3UXdW4UHv75+eHkbNu8yOne51VfHp2Hi55wsZMN5tZuucloF
         5fYw==
X-Forwarded-Encrypted: i=1; AJvYcCXUyNMJPMLcGw1JaBqL5Ih1o2oHDLFTnbjYa++uZAwjFRrozs6PPIw4lV42XTxvpLs3q+eJmPbo/KL6r62EOywUFZYS3Aw=
X-Gm-Message-State: AOJu0YyhkAy8P8bWVsKp5aHX1VKnlRL66097+VYUDt80+tNz7/vaP3FV
	XPDUQyeHqxKzpkHkYd5/c6ywuA64eZyPjkOrPegFfgf6tUIp0mjT3M4CMpJ/n+BQq7ieQ+rVBSA
	qgYWKarV8vA==
X-Google-Smtp-Source: AGHT+IFrFQSwNuSWu6/Y6yp6TLKb1ES+/eMj+OGcS+zU6Jh3xmGly/67ECjCQIexHldo+hDW4MAPEIU45QbnUA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:ced3:0:b0:dc2:3441:897f with SMTP id
 x202-20020a25ced3000000b00dc23441897fmr3248186ybe.6.1708342337288; Mon, 19
 Feb 2024 03:32:17 -0800 (PST)
Date: Mon, 19 Feb 2024 11:31:48 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240219113149.2437990-1-joychakr@google.com>
Subject: [PATCH v1 0/1] nvmem: Handle actual amount of data read/written by suppliers
From: Joy Chakraborty <joychakr@google.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rafal Milecki <rafal@milecki.pl>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

This Patch series stems from discussions in patchset,
"[PATCH v2] nvmem: rmem: Fix return value of rmem_read()"
(https://lore.kernel.org/all/20240206042408.224138-1-joychakr@google.com/).
Where we come across the fact that currently the nvmem suppliers do not
actually let the core know how much data has been actually read or written.
Instead they are expected to return 0 for success and the core assumes that
the amount of data written is equal to what the core has requested.

On addition this patchset will also add some guards and checks based on the
count of data returned by the nvmem supplier.
---
V1 Changes : Change read/write callback prototype to ssize_t and
supplier changes to accomodate the same with core checks and bounds.
---

Joy Chakraborty (1):
  nvmem: Change return type of reg read/write to ssize_t

 drivers/nvmem/apple-efuses.c        |  5 +-
 drivers/nvmem/bcm-ocotp.c           |  8 ++--
 drivers/nvmem/brcm_nvram.c          |  8 +++-
 drivers/nvmem/core.c                | 73 +++++++++++++----------------
 drivers/nvmem/imx-iim.c             |  4 +-
 drivers/nvmem/imx-ocotp-ele.c       |  4 +-
 drivers/nvmem/imx-ocotp-scu.c       |  8 ++--
 drivers/nvmem/imx-ocotp.c           |  6 +--
 drivers/nvmem/jz4780-efuse.c        |  5 +-
 drivers/nvmem/lan9662-otpc.c        |  8 ++--
 drivers/nvmem/layerscape-sfp.c      |  7 ++-
 drivers/nvmem/lpc18xx_eeprom.c      | 10 ++--
 drivers/nvmem/lpc18xx_otp.c         |  4 +-
 drivers/nvmem/meson-efuse.c         | 10 +++-
 drivers/nvmem/meson-mx-efuse.c      |  4 +-
 drivers/nvmem/microchip-otpc.c      |  4 +-
 drivers/nvmem/mtk-efuse.c           |  4 +-
 drivers/nvmem/mxs-ocotp.c           |  5 +-
 drivers/nvmem/nintendo-otp.c        |  4 +-
 drivers/nvmem/qcom-spmi-sdam.c      |  8 ++--
 drivers/nvmem/qfprom.c              | 10 ++--
 drivers/nvmem/qoriq-efuse.c         |  4 +-
 drivers/nvmem/rave-sp-eeprom.c      | 12 ++---
 drivers/nvmem/rmem.c                |  2 +-
 drivers/nvmem/rockchip-efuse.c      | 11 +++--
 drivers/nvmem/rockchip-otp.c        | 13 ++---
 drivers/nvmem/sc27xx-efuse.c        |  3 +-
 drivers/nvmem/sec-qfprom.c          |  4 +-
 drivers/nvmem/snvs_lpgpr.c          | 13 +++--
 drivers/nvmem/sprd-efuse.c          |  8 ++--
 drivers/nvmem/stm32-bsec-optee-ta.c |  8 ++--
 drivers/nvmem/stm32-bsec-optee-ta.h | 12 ++---
 drivers/nvmem/stm32-romem.c         | 16 +++----
 drivers/nvmem/sunplus-ocotp.c       |  4 +-
 drivers/nvmem/sunxi_sid.c           | 11 +++--
 drivers/nvmem/u-boot-env.c          |  4 +-
 drivers/nvmem/uniphier-efuse.c      |  4 +-
 drivers/nvmem/vf610-ocotp.c         |  5 +-
 drivers/nvmem/zynqmp_nvmem.c        |  2 +-
 include/linux/nvmem-provider.h      |  4 +-
 40 files changed, 180 insertions(+), 159 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog

