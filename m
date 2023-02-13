Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454408F58
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 15:08:26 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id E16F326F77F; Mon, 13 Feb 2023 16:08:23 +0100 (CET)
Date: Mon, 13 Feb 2023 16:08:23 +0100
From: Janne Grunau <j@jannau.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/17] arm64: dts: apple: t8112: Initial t8112 (M2)
 device trees
Message-ID: <20230213150823.GF17933@jannau.net>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-17-cb5442d1c229@jannau.net>
 <1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org>
 <20230213140113.GE17933@jannau.net>
 <16804864-dce2-d68c-ce81-b6fdeb20a527@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16804864-dce2-d68c-ce81-b6fdeb20a527@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2023-02-13 15:36:33 +0100, Krzysztof Kozlowski wrote:
> On 13/02/2023 15:01, Janne Grunau wrote:
> >>> +
> >>> +		pmgr: power-management@23b700000 {
> >>> +			compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
> >>
> >> Why this is simple-mfd?
> > 
> > I suppose because the syscon device is not limited to power domain 
> > controls. The dt-bindings in arm/apple/apple,pmgr.yaml specify those 
> > compatibles. See the original discussion in:
> > 
> > https://lore.kernel.org/linux-devicetree/57991dac-196e-a76d-831a-d4ac166bfe29@marcan.st/  
> 
> This did not answer my concerns. There are no children here.

The child nodes are in t8112-pmgr.dtsi

Janne
