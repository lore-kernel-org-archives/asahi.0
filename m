Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150EC7C;
	Mon, 23 Jan 2023 20:20:13 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id cc13-20020a05683061cd00b00684b8cf2f4dso7994579otb.12;
        Mon, 23 Jan 2023 12:20:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJIseX7fbuePlCt3lfYMHgc5yPjn6sJZXZh9GvE7Yuk=;
        b=QDvZrFtYshfyZPaeMote97Ffk8L8SHkg6dtkkEsHgNKUD13KbokALWxSV7GU8BSKS1
         Oi3vwZTP0rFw6NS1T+vjLOoddRENzonaL2VUq0Opxt0MWCR4i4ArQdgaYDWAqlQz44jQ
         LN4e5lNeUol/XEnkm7+V26mFBsMof4RHdrim69rPK9WkrnbHuwJXO4feVV3th8Rt1v3x
         CPNZs5Cand81U8aa1AhT2mPxZDEhWXXNcTDUWj4PVnzbN39s2Kpz9kEfKocbVcABYzpo
         faWxBkZvqLS93zEWlBPocK1VNuG99C3vDYmRA7QBE6ofO33D2QhRAhUYIKrQ8VTgGmve
         0iqg==
X-Gm-Message-State: AFqh2kretgl0OfJYCyvlf8NGFH/afJpsOFMng3QQagVp90DSC8xmvPtJ
	6e94gfa42pebnNPlWG6czw==
X-Google-Smtp-Source: AMrXdXtXo7dsxEuvQDVOZCdjfJoyKEoO2vYkeou3j0fcHEiMdz4hYCE8ilnCls8sDDy5APHHbusT7w==
X-Received: by 2002:a9d:370:0:b0:66c:dd2b:e1ad with SMTP id 103-20020a9d0370000000b0066cdd2be1admr23494564otv.23.1674505212954;
        Mon, 23 Jan 2023 12:20:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x17-20020a9d6291000000b00677714a440fsm52560otk.81.2023.01.23.12.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:20:12 -0800 (PST)
Received: (nullmailer pid 2457598 invoked by uid 1000);
	Mon, 23 Jan 2023 20:20:10 -0000
Date: Mon, 23 Jan 2023 14:20:10 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Olivier Dautricourt <olivierdautricourt@gmail.com>, Stefan Roese <sr@denx.de>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Green Wan <green.wan@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?77+9ZXI=?= <povik+lin@cutebit.org>, Peng Fan <peng.fan@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, - <chuanhua.lei@intel.com>, 
	Long Cheng <long.cheng@mediatek.com>, Rajesh Gumasta <rgumasta@nvidia.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Palmer Debbelt <palmer@sifive.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: dma: cleanup examples - indentation,
 lowercase hex
Message-ID: <20230123202010.GA2455859-robh@kernel.org>
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
 <20230118180144.364756-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118180144.364756-2-krzysztof.kozlowski@linaro.org>

On Wed, Jan 18, 2023 at 07:01:44PM +0100, Krzysztof Kozlowski wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - use lowercase hex.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 36 +++++++++----------
>  .../bindings/dma/stericsson,dma40.yaml        |  4 +--
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> index 2bedab1f74e0..d34d0fa62ab5 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
> @@ -113,21 +113,21 @@ additionalProperties: false
>  
>  examples:
>    - |
> -     #include <dt-bindings/interrupt-controller/arm-gic.h>
> -     #include <dt-bindings/interrupt-controller/irq.h>
> -     /* example with snps,dw-axi-dmac */
> -     dmac: dma-controller@80000 {
> -         compatible = "snps,axi-dma-1.01a";
> -         reg = <0x80000 0x400>;
> -         clocks = <&core_clk>, <&cfgr_clk>;
> -         clock-names = "core-clk", "cfgr-clk";
> -         interrupt-parent = <&intc>;
> -         interrupts = <27>;
> -         #dma-cells = <1>;
> -         dma-channels = <4>;
> -         snps,dma-masters = <2>;
> -         snps,data-width = <3>;
> -         snps,block-size = <4096 4096 4096 4096>;
> -         snps,priority = <0 1 2 3>;
> -         snps,axi-max-burst-len = <16>;
> -     };
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    /* example with snps,dw-axi-dmac */
> +    dmac: dma-controller@80000 {

Drop unused labels while you are here.

> +        compatible = "snps,axi-dma-1.01a";
> +        reg = <0x80000 0x400>;
> +        clocks = <&core_clk>, <&cfgr_clk>;
> +        clock-names = "core-clk", "cfgr-clk";
> +        interrupt-parent = <&intc>;
> +        interrupts = <27>;
> +        #dma-cells = <1>;
> +        dma-channels = <4>;
> +        snps,dma-masters = <2>;
> +        snps,data-width = <3>;
> +        snps,block-size = <4096 4096 4096 4096>;
> +        snps,priority = <0 1 2 3>;
> +        snps,axi-max-burst-len = <16>;
> +    };
> diff --git a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> index 664ee61a00d8..57395a810719 100644
> --- a/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> +++ b/Documentation/devicetree/bindings/dma/stericsson,dma40.yaml
> @@ -147,9 +147,9 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/mfd/dbx500-prcmu.h>
> -    dma-controller@801C0000 {
> +    dma-controller@801c0000 {
>        compatible = "stericsson,db8500-dma40", "stericsson,dma40";
> -      reg = <0x801C0000 0x1000>, <0x40010000 0x800>;
> +      reg = <0x801c0000 0x1000>, <0x40010000 0x800>;
>        reg-names = "base", "lcpa";
>        interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>        #dma-cells = <3>;

Indentation?
