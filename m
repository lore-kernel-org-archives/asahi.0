Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E93617CD
	for <asahi@lists.linux.dev>; Thu, 19 Jan 2023 04:29:26 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id gz9-20020a17090b0ec900b002290bda1b07so3225234pjb.1
        for <asahi@lists.linux.dev>; Wed, 18 Jan 2023 20:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1y/5KDHgKHirXTUDecr+02A1cm5hXFyau/VonkRgpE=;
        b=Qwwu3mjMk12mb8arDhmeBCvpdrQtaWykCv52bQMcfaQnPlZn+g4S4pyHWK9g5gJq/E
         bO7IKgK54I54tGt/S05MX6Bugw6bPxNfhg+ah1MT6QRzC2BodAU7Nxc3jTYm0+gOfRju
         rQK0Xne7+kdHXBVjGreIcWWobpNO5IybesRxyfrNKwIxvNJ4yschR/MT3M0xuU4V9iLQ
         o9Q6K/DEzCiH29zW01Y9cg6rR9MmG3HVgncg8V1EWXGBj2G8UTMnjfYdHZEb5fExOvTX
         fa3wF8EGcngCDygVAXXSYTLa32Z2WL/Lw84vQis+TJezj9R9KJ13ggeoKElki9XZ9BB1
         8FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1y/5KDHgKHirXTUDecr+02A1cm5hXFyau/VonkRgpE=;
        b=1W46yS16MN8C8eeGtiGW81yijYJJerXoXiWHSVWTh0WWB1rdqmm4UiFxs9Xr+P/hbM
         UuF8hJGza9Zf5Bk5mgnZd/HZY6fZopgxJt/gSoGmLED9NK4FqmpHETchfX7z8wJZ735p
         TGgNRr/bIpfrfRSkm/inSbU/yDN3nyJzTRbd7RExHrJDRAvNU/HGp0jEsw7KGYa5UNyc
         S6vZvYk8Y8qA6n0FkqskC21B4PN6NQVHtmiRbeJTXfJGS2GXaKZ1gQzQWmp9GkcpTMGT
         0G2PERvg800PR+5jMr0gXO9tV2ua6FPhqFh9iwZQs72W2Lg4T5Uy50zBPJoH1+JDn8Qf
         ekOQ==
X-Gm-Message-State: AFqh2kohSpAZKIyyO4cugWYdpLpYe3IRNCqjYnkb4C2A9CVQT76UHJS0
	XZCRVGO0TmxRaK8EliF9x2mMuA==
X-Google-Smtp-Source: AMrXdXsL1ggmaWVhUlXD0gW9Nplw6seQdpkL31Roa0A2ZWPa6AvCI+80NJvuCsPquPnD0v53gX9ycw==
X-Received: by 2002:a05:6a20:9b86:b0:b8:648f:f414 with SMTP id mr6-20020a056a209b8600b000b8648ff414mr9493806pzb.29.1674102565791;
        Wed, 18 Jan 2023 20:29:25 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id bg7-20020a056a02010700b004785c24ffb4sm10760212pgb.26.2023.01.18.20.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 20:29:24 -0800 (PST)
Date: Thu, 19 Jan 2023 09:59:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
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
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Green Wan <green.wan@sifive.com>,
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
Message-ID: <20230119042922.aiggjqvnirk6sgdo@vireshk-i7>
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

On 18-01-23, 19:01, Krzysztof Kozlowski wrote:
> diff --git a/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml b/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
> index c13649bf7f19..5da8291a7de0 100644
> --- a/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
> +++ b/Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
> @@ -11,7 +11,7 @@ maintainers:
>    - Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>  
>  allOf:
> -  - $ref: "dma-controller.yaml#"
> +  - $ref: dma-controller.yaml#
>  
>  properties:
>    compatible:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
