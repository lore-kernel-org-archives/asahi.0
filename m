Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09637C
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 08:47:02 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id BCFD626F78C; Tue, 14 Feb 2023 09:46:54 +0100 (CET)
Date: Tue, 14 Feb 2023 09:46:54 +0100
From: Janne Grunau <j@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/17] dt-bindings: power: apple,pmgr-pwrstate: Add t8112
 compatible
Message-ID: <20230214084654.GG17933@jannau.net>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-1-cb5442d1c229@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202-asahi-t8112-dt-v1-1-cb5442d1c229@jannau.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2023-02-12 16:41:11 +0100, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> Add the apple,t8112-pmgr-pwrstate compatible for the Apple M2 SoC.
> 
> This goes after t8103. The sort order logic here is having SoC numeric
> code families in release order, and SoCs within each family in release
> order:
> 
> - t8xxx (Apple HxxP/G series, "phone"/"tablet" chips)
>   - t8103 (Apple H13G/M1)
>   - t8112 (Apple H14G/M2)
> - t6xxx (Apple HxxJ series, "desktop" chips)
>   - t6000 (Apple H13J(S)/M1 Pro)
>   - t6001 (Apple H13J(C)/M1 Max)
>   - t6002 (Apple H13J(D)/M1 Ultra)
> 
> Note that t600[0-2] share the t6000 compatible where the hardware is
> 100% compatible, which is usually the case in this highly related set
> of SoCs.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> 
> ---
> This trivial dt-bindings update should be merged through the asahi-soc
> tree to ensure validation of the Apple M2 (t8112) devicetrees in this
> series.
> ---
>  Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
> index 94d369eb85de..59a6af735a21 100644
> --- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
> +++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
> @@ -32,6 +32,7 @@ properties:
>      items:
>        - enum:
>            - apple,t8103-pmgr-pwrstate
> +          - apple,t8112-pmgr-pwrstate
>            - apple,t6000-pmgr-pwrstate
>        - const: apple,pmgr-pwrstate

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
