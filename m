Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBE124167B;
	Tue,  5 Aug 2025 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754431716; cv=none; b=UoyQyfwHAHr5Jx5kOz0Nky99tfpqI4C9NvZJb5QlIZpcLo6Qx4luxROIcStQwQfCTPg4IHrDhM0ELC6A90pgvw6KC/iFGN44mmZ+OjMqHzhDbNTbRF+1jV6pDaWwgXagGGZTzTTCfD8EZ7mecVWK+JASocx/Y5DxUTCGMNzLv7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754431716; c=relaxed/simple;
	bh=/aoxjBnanB6z5ZymLaTy2qG1GykI0n2CxoPSGTJMDc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GcMaR4tp2XFuu2pOkXDPuR0HRmskqryxmvSOzAbrW5nizhmCei4P621W4jWFdsPCDgUlpQxz+Vnuv2CsTqMGrPQLvU8uMZeZV1/1gDSJYhjS46cpDhJq58onNWE+n84TUWNN42sJxZxgInMco7r9xIOqIgzYzfduPg3zz+rozp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnuMfwcR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnuMfwcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754431715; x=1785967715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/aoxjBnanB6z5ZymLaTy2qG1GykI0n2CxoPSGTJMDc4=;
  b=fnuMfwcRKAFEfNlyqfrpQR8xaIvx6uPvE+4eTLFRAXIurD7TsmVrISif
   HOwsQOx91u56cuf87ZJSUtE2iHEM+JXvIDrlrK+/T6ayPT+UAFwLjjJBc
   LL4Xym8XPOt5NNmvbjGNE0ZTCwM3V43qcDNugtRoKIrJoaWkMrCEBfbko
   OzGBL8ErfS1pY1Iyc62ZKjHmriA1hP6qdx8xiq8nuytFBQ6o7/FzlLI4H
   X9vJzRUUlQOPlLMBoLsOW/ihg3MLmOyUJwTjfYkqEX8lrB3TGcAhpMyCf
   fWnKhkEfqSGsl6107buvC0svUflFA4HOL5il9dfMwm0WCmN99+gRhDY9n
   Q==;
X-CSE-ConnectionGUID: Dunl/cAQStuFBOdHGWmJXA==
X-CSE-MsgGUID: QGfB0BHIQ5C6Gmrb+LGeeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="44334910"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="44334910"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 15:08:31 -0700
X-CSE-ConnectionGUID: cvABU6gySmCN+nSbWkFxIg==
X-CSE-MsgGUID: QOXnb3dlQReNBMfKeCvA3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164139100"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 15:08:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ujPpG-00000003rhU-3uHR;
	Wed, 06 Aug 2025 01:08:06 +0300
Date: Wed, 6 Aug 2025 01:08:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Viresh Kumar <vireshk@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 3/6] dmaengine: qcom: gpi: Accept protocol ID hints
Message-ID: <aJKAxkXO7csIi5Oi@smile.fi.intel.com>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-3-b505c1238f9f@oss.qualcomm.com>
 <CAMuHMdV0JO=qtregrrHsBZ-6tpNdPUj3G1_LWRfRsj0vBb+qyw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV0JO=qtregrrHsBZ-6tpNdPUj3G1_LWRfRsj0vBb+qyw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 30, 2025 at 01:32:58PM +0200, Geert Uytterhoeven wrote:
> On Wed, 30 Jul 2025 at 11:35, Konrad Dybcio <konradybcio@kernel.org> wrote:

...

> > +       /* The protocol ID is in the teens range, simply ignore the higher bits */
> > +       gchan->protocol = (u32)((u64)proto);
> 
> A single cast "(uintptr_t)" should be sufficient.

FWIW, this means (unsigned long) as Torvalds is quite against uintptr_t in the kernel.

> Casing the pointer to u64 on 32-bit may trigger:
> 
>     warning: cast from pointer to integer of different size
> [-Wpointer-to-int-cast]
> 
> >         return dma_get_slave_channel(&gchan->vc.chan);
> >  }

-- 
With Best Regards,
Andy Shevchenko


