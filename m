Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEBEEC0
	for <asahi@lists.linux.dev>; Sat, 10 Sep 2022 11:46:28 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 781C126F009; Sat, 10 Sep 2022 13:46:26 +0200 (CEST)
Date: Sat, 10 Sep 2022 13:46:26 +0200
From: Janne Grunau <j@jannau.net>
To: asahi@lists.linux.dev
Cc: Mark Kettenis <kettenis@openbsd.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 08/10] arm64: dts: apple: Add J375 devicetrees
Message-ID: <20220910114626.GE4024@jannau.net>
References: <20220909135103.98179-1-j@jannau.net>
 <20220909135103.98179-9-j@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909135103.98179-9-j@jannau.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On 2022-09-09 15:51:01 +0200, Janne Grunau wrote:
> These are the Mac Studio devices with M1 Max (t6001) and
> M1 Ultra (t6002).
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> 
>  arch/arm64/boot/dts/apple/Makefile        |   2 +
>  arch/arm64/boot/dts/apple/t6001-j375c.dts |  18 ++++
>  arch/arm64/boot/dts/apple/t6002-j375d.dts |  50 ++++++++++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi | 115 ++++++++++++++++++++++
>  4 files changed, 185 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/t6001-j375c.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t6002-j375d.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t600x-j375.dtsi

...

> diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
> new file mode 100644
> index 000000000000..c5444cb34389
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Mac Studio (2022)
> + *
> + * This file contains the parts common to J375 devices with both t6001 and t6002.
> + *
> + * target-type: J375c / J375d
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +/dts-v1/;

This stray "/dts-v1/;" has been removed locally from the .dtsi file, 
fixing a build error.

Janne
