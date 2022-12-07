Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1322C625
	for <asahi@lists.linux.dev>; Wed,  7 Dec 2022 06:41:51 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id E640B26F49A; Wed,  7 Dec 2022 07:41:49 +0100 (CET)
Date: Wed, 7 Dec 2022 07:41:49 +0100
From: Janne Grunau <j@jannau.net>
To: Asahi Lina <lina@asahilina.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>, asahi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64 dts: apple: t600x-pmgr: Fix search & replace typo
Message-ID: <20221207064149.GB20388@jannau.net>
References: <20221207014305.21018-1-lina@asahilina.net>
 <20221207014305.21018-2-lina@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207014305.21018-2-lina@asahilina.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2022-12-07 10:43:05 +0900, Asahi Lina wrote:
> It looks like the search-and-replace that happened to add die IDs to
> the t600x PMGR tree was a little bit too eager on a comment, and nobody
> noticed! Let's fix that.
> 
> Fixes: fa86294eb355 ("arm64: dts: apple: Add initial t6000/t6001/t6002 DTs")
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  arch/arm64/boot/dts/apple/t600x-pmgr.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/apple/t600x-pmgr.dtsi b/arch/arm64/boot/dts/apple/t600x-pmgr.dtsi
> index b8daeb0368d5..0bd44753b76a 100644
> --- a/arch/arm64/boot/dts/apple/t600x-pmgr.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-pmgr.dtsi
> @@ -225,7 +225,7 @@ DIE_NODE(ps_afr): power-controller@1e8 {
>  		#power-domain-cells = <0>;
>  		#reset-cells = <0>;
>  		label = DIE_LABEL(afr);
> -		/* Apple Fabric, media DIE_NODE(stuff): this can power down */
> +		/* Apple Fabric, media stuff: this can power down */
>  	};
>  
>  	DIE_NODE(ps_afnc1_ioa): power-controller@1f0 {

thanks

Reviewed-by: Janne Grunau <j@jannau.net>
