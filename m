Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04723182C0;
	Tue,  1 Aug 2023 18:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E760C433C7;
	Tue,  1 Aug 2023 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690915524;
	bh=6ecqCthtX5y6DW+x8fFvSPeJvMEWUDYrHhQnKo4fw2g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MCgeSAtxkn/Cm+2KX+Cy2ya7BIdT7/jl+ViyqC9GLpRguZ1quqlduJY201e9YY+Gl
	 tPuWVXKidBwoQEQOGw9dB+OvKt+xnFrB0j54IxicMem/IXJTfyVWG62tXO8z1Oidqn
	 2NOA3Pu3s2NQonYg8bgH4gYg1I3ajHJTZ18017Ae5m9Oa4tGlZ1fXI3lCOlefo7d8y
	 ThVJ77i4Sa8SZrf7DUrw4H3M9A25o0ZXrQMqesV5j/lH8f2SyyTLSeFXCYClgzdAqC
	 onCUY8LhZGFKLCVVvkTKYf+Ki+4WGuZFHhFEKqNomiwiYDAlugFGuYkdZfhNjJFDS6
	 h8ARfo4bV8Srw==
From: Vinod Koul <vkoul@kernel.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sinan Kaya <okaya@kernel.org>, 
 Andy Gross <agross@ker>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20230718143138.1066177-1-robh@kernel.org>
References: <20230718143138.1066177-1-robh@kernel.org>
Subject: Re: [PATCH v2] dmaengine: Explicitly include correct DT includes
Message-Id: <169091550886.69468.9371544048617721749.b4-ty@kernel.org>
Date: Wed, 02 Aug 2023 00:15:08 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Tue, 18 Jul 2023 08:31:35 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: Explicitly include correct DT includes
      commit: 897500c7ea91702966adb9b412fa39400b4edee6

Best regards,
-- 
~Vinod


