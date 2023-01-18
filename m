Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C10553A7;
	Wed, 18 Jan 2023 19:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674070368; x=1705606368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rd8D9WM+DMkQQdSGbyw+RjACp0njYXtWMwISiTkUNq4=;
  b=T4lJdMXUUc6Pd2ID0OrI7xaZsc3n6TyZo8EI8nranR6kdSckdmscaCcd
   NYttoCT9cbItJ+uLMxkGOq7d8Eh3vqx+YUmivXmCQd+VyAiVp8eTYAlSI
   Oq2acZrRaqzs587kgOhG/sAxi5mBeEf2ulvtcQdx9Zb0bHKz7JOF2+zHs
   rZQnfg8fzmRzX3Fw+IjRwAlP1DdyIxGFcNEM28+ZLG7C/mkmzkAIUgnBP
   KaZPpVe6FivM2leeU3BfgcrxGXEXZw5TkYCadfsThev/ZWXuicip+nI9R
   hor9OPlZiuiDZeqh+6nYd5nSOnrCbGh0EWS7oUvI6xo3QTFl+sDKP9fli
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411319203"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="411319203"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 11:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="802328577"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="802328577"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2023 11:32:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pIEAh-00BLES-15;
	Wed, 18 Jan 2023 21:32:31 +0200
Date: Wed, 18 Jan 2023 21:32:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Olivier Dautricourt <olivierdautricourt@gmail.com>,
	Stefan Roese <sr@denx.de>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>, Green Wan <green.wan@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?utf-8?B?77+9ZXI=?= <povik+lin@cutebit.org>,
	Peng Fan <peng.fan@nxp.com>, Paul Cercueil <paul@crapouillou.net>,
	- <chuanhua.lei@intel.com>, Long Cheng <long.cheng@mediatek.com>,
	Rajesh Gumasta <rgumasta@nvidia.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Palmer Debbelt <palmer@sifive.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: dma: drop unneeded quotes
Message-ID: <Y8hJT7gaw3+s62rv@smile.fi.intel.com>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 18, 2023 at 07:01:43PM +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
>  Documentation/devicetree/bindings/dma/dma-controller.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/dma-router.yaml           | 2 +-

>  Documentation/devicetree/bindings/dma/intel,ldma.yaml           | 2 +-

>  Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml   | 2 +-

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


