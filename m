Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B3314A0AD
	for <asahi@lists.linux.dev>; Fri, 10 May 2024 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715329788; cv=none; b=Yyru0BvaBohIZxei62GppwRZ5wD22wJZiC+o1799h9bfgLFheauaehyvUQMUe0sJVIdC5cdMarX+TusHXKDd36C+gB6daJjLUxiOdCyQh9V4TDYYk5iWSCZXlRVOrzcZN1k3irGq8piLqelCs6vfGDw5PNWDTJgt6DltYODkp+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715329788; c=relaxed/simple;
	bh=7cev1urkkriXH1Kz2Kjf4vy0a3n4geUSsLoRNQ3CwIw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ehyie8/RTyEI0qwF1UNSCF9tcMo7FqbT7u/aZmHkf70pH1ONq47ekPZnsEXGIl6Om/Ucsj9ZBvC0ebuwlQ525rYyICcGUI5eyonkwPgZ8wtLehnk8l0OA+WmPBu+QcOuMZzNepPn3H5tg07cMiH4uBeV3iK+1DYCB9CvjoK6BCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DKgKQVl1; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DKgKQVl1"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-ddaf2f115f2so2707521276.3
        for <asahi@lists.linux.dev>; Fri, 10 May 2024 01:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715329776; x=1715934576; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dnr78Drl0hwy8QosBN5FMiEeANWK1Ml2Xi29sDzFrpE=;
        b=DKgKQVl1h23ScHI9gto1CjMcKqGN2+RSXsqFYIY/EYmH2WuJu/huKgofiZhANETiO3
         sXw51Gzlg1xR9FlP88E/hp8nrw1SrOeCr3B/hbe/hWG25D3dHEtBi58crUMFXQAVVUYN
         +IgmUcLknpOAqRH8TKLSuTSid/wQVPNQuIm+OtT+KaYXH6dt9deIYExnYTEUq17UEbUN
         xOptZgMviUgc/RwTwI6l5e1mqfvLlyJ8qNxdGjvvpUacTJTx3tGP7Vso/pFtjTysegDJ
         iiXx0hbKnyqu+5A55H+OFq6Fwq0u3oAm912BrMoQvVbW6YfgsXPIhzoMjlZQH38wI4+H
         viKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715329776; x=1715934576;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnr78Drl0hwy8QosBN5FMiEeANWK1Ml2Xi29sDzFrpE=;
        b=PUbkiuefXZrNZNUBkt1f7pfxhBe++lKXlvdwYvGneO1CjKIojVudrGwQ+K8wisBAYZ
         D+PK3Wuxwmk3fuF+LV14yl8z67xFrtnItbXoPCOktwloF2IpuM853JET7YG5gS75Re/W
         POtujO34m67NGwP48ORULIpfJTAZLYy+KwiBXgKdykfr7rlsasBIJNoGcHWif5aJ3Oyf
         Lm8dcq1pP9CkBXLK69tICirWtWL/d1/a35YD6o/expzykPh7bxqvJjMyS5HGvKc9yn6W
         ypmG/cEDmZv6pqDCnnXnpA4rtXa1ttvB/boSd3lBxBOyO5o+KMMXxe2xdZovb1SwFrsJ
         Ta0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLtAmWF4ZCqHcyCUc4YhPdbCHkjdCDxQeRgqIO5kGDQrT5e5xbAIK8E/0g6yUSNj54NAKP7xzTWOsReizF7zKcULW5Ks8=
X-Gm-Message-State: AOJu0YwJGHXn8b+3cFp/1CsHzscoVnwZLWwlA2ZqGh26SUb2IJp0URJR
	AhcrphJR1haj6T/gdsB9thMnK8yOxmbYNaKcus9vE4PTE+PnYse5Zs3bw10kj87My/85X0PLS7P
	ocqAbj2CcaA==
X-Google-Smtp-Source: AGHT+IEiknRtBHdrQ2HgiFa5pD74L/Ye3Nv3Q0grhoikyts9vAUMehW+Dt9fd3K3/ZrjmNUP76nhD8GAX7HaoA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:c09:b0:de5:5304:3206 with SMTP
 id 3f1490d57ef6-dee4f52d715mr180759276.11.1715329776091; Fri, 10 May 2024
 01:29:36 -0700 (PDT)
Date: Fri, 10 May 2024 08:29:28 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510082929.3792559-1-joychakr@google.com>
Subject: [PATCH v3 0/1] nvmem: Handle actual amount of data read/written by suppliers
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
	manugautam@google.com, Joy Chakraborty <joychakr@google.com>
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
V3 Changes : Fix return value of reg_read in sunxi_sid.c driver
---
V2 Changes : Rebase on for-next.
---
V1 Changes : Change read/write callback prototype to ssize_t and
supplier changes to accomodate the same with core checks and bounds.
---

Joy Chakraborty (1):
  nvmem: Change return type of reg read/write to ssize_t

 drivers/nvmem/apple-efuses.c        |  7 +--
 drivers/nvmem/bcm-ocotp.c           | 12 ++---
 drivers/nvmem/brcm_nvram.c          | 10 ++--
 drivers/nvmem/core.c                | 83 +++++++++++++----------------
 drivers/nvmem/imx-iim.c             |  6 +--
 drivers/nvmem/imx-ocotp-ele.c       |  4 +-
 drivers/nvmem/imx-ocotp-scu.c       | 12 ++---
 drivers/nvmem/imx-ocotp.c           | 10 ++--
 drivers/nvmem/jz4780-efuse.c        |  7 +--
 drivers/nvmem/lan9662-otpc.c        | 12 ++---
 drivers/nvmem/layerscape-sfp.c      | 11 ++--
 drivers/nvmem/lpc18xx_eeprom.c      | 14 ++---
 drivers/nvmem/lpc18xx_otp.c         |  6 +--
 drivers/nvmem/meson-efuse.c         | 22 +++++---
 drivers/nvmem/meson-mx-efuse.c      |  6 +--
 drivers/nvmem/microchip-otpc.c      |  6 +--
 drivers/nvmem/mtk-efuse.c           |  6 +--
 drivers/nvmem/mxs-ocotp.c           |  7 +--
 drivers/nvmem/nintendo-otp.c        |  6 +--
 drivers/nvmem/qcom-spmi-sdam.c      | 12 ++---
 drivers/nvmem/qfprom.c              | 14 ++---
 drivers/nvmem/qoriq-efuse.c         |  6 +--
 drivers/nvmem/rave-sp-eeprom.c      | 18 +++----
 drivers/nvmem/rmem.c                |  4 +-
 drivers/nvmem/rockchip-efuse.c      | 19 +++----
 drivers/nvmem/rockchip-otp.c        | 19 +++----
 drivers/nvmem/sc27xx-efuse.c        |  3 +-
 drivers/nvmem/sec-qfprom.c          |  4 +-
 drivers/nvmem/snvs_lpgpr.c          | 17 +++---
 drivers/nvmem/sprd-efuse.c          |  8 +--
 drivers/nvmem/stm32-bsec-optee-ta.c | 12 ++---
 drivers/nvmem/stm32-bsec-optee-ta.h | 20 +++----
 drivers/nvmem/stm32-romem.c         | 26 ++++-----
 drivers/nvmem/sunplus-ocotp.c       |  4 +-
 drivers/nvmem/sunxi_sid.c           | 18 ++++---
 drivers/nvmem/u-boot-env.c          |  6 +--
 drivers/nvmem/uniphier-efuse.c      |  6 +--
 drivers/nvmem/vf610-ocotp.c         |  7 +--
 drivers/nvmem/zynqmp_nvmem.c        | 13 ++---
 include/linux/nvmem-provider.h      |  4 +-
 40 files changed, 255 insertions(+), 232 deletions(-)

-- 
2.45.0.118.g7fe29c98d7-goog

