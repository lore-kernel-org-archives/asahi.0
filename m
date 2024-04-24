Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B0A1534E0
	for <asahi@lists.linux.dev>; Wed, 24 Apr 2024 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713944573; cv=none; b=AmaGzxT4+HdK0irHc7n6SRE2028gbEWwMJTH3j1kx58t0UBnJgN3qliQMFiW9UDuZGFO/O/ZoUWe2exnWGRhj3QFf3SpP/7It+ggQb8fEDBdIKbXi0hLxamWAbVEzNkIWU5P7p+EBv1YdeD4eJnN75EXFWwZ6iGJezGPXe18QiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713944573; c=relaxed/simple;
	bh=KEOY/H38r2q4LMqOZqaCRp80aSw3OHhkx+jVNw2tNvc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rEFRvDrDxk9EyIGPWi1dCLAXSY5UaMWZNiUNl8PbGFV1TLiNNC/3DmVfmm3OQVJ3uLMZEmmv/bKqmWrj7FFZL3/YnHTpFXKe8yP3bc6r/Ue6oZX/fz3BMCdFsYBUTOj9noD/nyyBNQGHFQrw854OD3goZEMthRsHCxDGrm897Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IwF/zSks; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IwF/zSks"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61b32e7f94bso107923527b3.2
        for <asahi@lists.linux.dev>; Wed, 24 Apr 2024 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713944571; x=1714549371; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Zl0sYd+valIIqLNedoYvnicwykqmWgTtyjDljuZmiec=;
        b=IwF/zSkshZxpEFImSnUIbUvbzWL1Bxx8gzyBWL8Oq4Bu5XK4FOtyLVZ3XTblZWzUdz
         gwikX0cJJIohNHNf/HVE4+DL//XjBhoTT+ZDr4qdT76bcIk/DwuLN+dDu2EyYvKEMK4p
         qHeCEySticBUaNY3L+nTAiiyG577Fw3FkbvDxXjEXiiuOm3qvVkhJWp2fZdS0jiPaLDY
         2x11D8fcg9iWLw/NFMQld9vhlpoxZHaTHc0v65totSmD+JJelGb51/Wl/OOXl7eMqY7N
         RbR0e98ISePSFSzXYh64+9wx3Rm4rt+Yf1MiEdStknML7VIhsyfQKq7KAjT3+Iq7twQ2
         ZqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713944571; x=1714549371;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zl0sYd+valIIqLNedoYvnicwykqmWgTtyjDljuZmiec=;
        b=bCsQWNxDe1hyhTqRjdFqfyMHJD2S5OO95slFIBrimVJd1us+4jPX0PtdGlLpa+izPl
         2xHSHOjPB69kTpu4iA3c0SoZDOAQu+CykXLr2kXsBTtnVqglksplMZ/0Xyx9b53Jt9dR
         28bS8wU7Br413bV6AzyqAMR7RUy3gT/bNNJI1aXY4Ko09V8Snznwd08daFJKHbboTUvP
         eBISEqwY9jEVr1zBPsseg3dGVi20vmmp1mFk4iPYMIVNnEEgKPMV85iReNH139JuHfmf
         +SolpwyVH70KAele/2NKAHGVSB5Fz0IrsRUcLvAb+8NnkEWBKGNbP6wyWuqyTwu2G5kG
         p1Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVToHBVJVMyrXCU0kvyny2LNKL8dBeOR49g4EjG06uEo4sdnYmgUUspZw9TM+CTx/ZIWOqGVzvUxZIRp1a9wmTedWEuSEc=
X-Gm-Message-State: AOJu0YzGDEWMxKBxsKj8SoRVrXHqUgbTue5tVGLyIKVG3YEKpRrG8orG
	hirPtji96yCv6DiW/tJIhG5Sppedwp8k2e1LfP8FEPIImt9+fjjU/wo87Zh995Q0u2ykx7N5oFE
	zbX35PpAAeQ==
X-Google-Smtp-Source: AGHT+IHAgakRN1GMcYnGCFXgcp0S6jDEiv/2+gY/KRM4h43j6n7j458O2RZcU7HXGWBkkYoEbxUyhX44RKGCPA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:6902:154f:b0:de5:1f88:ae4e with SMTP
 id r15-20020a056902154f00b00de51f88ae4emr651015ybu.2.1713944570760; Wed, 24
 Apr 2024 00:42:50 -0700 (PDT)
Date: Wed, 24 Apr 2024 07:42:41 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240424074242.519895-1-joychakr@google.com>
Subject: [PATCH v2 0/1] nvmem: Handle actual amount of data read/written by suppliers
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
 drivers/nvmem/sunxi_sid.c           | 15 +++---
 drivers/nvmem/u-boot-env.c          |  6 +--
 drivers/nvmem/uniphier-efuse.c      |  6 +--
 drivers/nvmem/vf610-ocotp.c         |  7 +--
 drivers/nvmem/zynqmp_nvmem.c        | 13 ++---
 include/linux/nvmem-provider.h      |  4 +-
 40 files changed, 253 insertions(+), 231 deletions(-)

-- 
2.44.0.769.g3c40516874-goog

