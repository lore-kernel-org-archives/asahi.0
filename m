Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F517E
	for <asahi@lists.linux.dev>; Wed,  7 Dec 2022 06:40:08 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id CC5A826F498; Wed,  7 Dec 2022 07:40:05 +0100 (CET)
Date: Wed, 7 Dec 2022 07:40:05 +0100
From: Janne Grunau <j@jannau.net>
To: Asahi Lina <lina@asahilina.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>, asahi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: t6002: Fix GPU power domains
Message-ID: <20221207064005.GA20388@jannau.net>
References: <20221207014305.21018-1-lina@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207014305.21018-1-lina@asahilina.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2022-12-07 10:43:04 +0900, Asahi Lina wrote:
> On t6002 (M1 Ultra), each die contains a self-contained GPU block.
> However, only the coprocessor and global management circuitry of the
> first die are used. This is what is represented by the "gpu" PS (the
> one in die1 is disabled). Nonetheless, this shared component drives the
> processing blocks in both dies, and therefore depends on the AFR fabric
> being powered up on both dies.
> 
> Add an explicit dependency from the GPU block on die0 to AFR on die1,
> next to the existing die0 AFR dependency.
> 
> Fixes: fa86294eb355 ("arm64: dts: apple: Add initial t6000/t6001/t6002 DTs")
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  arch/arm64/boot/dts/apple/t6002.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
> index 1376103b49c6..8fa2d8dd72ff 100644
> --- a/arch/arm64/boot/dts/apple/t6002.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6002.dtsi
> @@ -296,3 +296,8 @@ &cpu_p20 &cpu_p21 &cpu_p22 &cpu_p23
>  		};
>  	};
>  };
> +
> +&ps_gfx {
> +	// On t6002, the die0 GPU power domain needs both AFR power domains
> +	power-domains = <&ps_afr>, <&ps_afr_die1>;
> +};

Reviewded-By: Janne Grunau <j@jannau.net>

Janne
