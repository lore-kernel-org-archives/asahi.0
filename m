Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5476112
	for <asahi@lists.linux.dev>; Mon,  5 Dec 2022 16:27:27 +0000 (UTC)
X-KPN-MessageId: 8bb85bc4-74b9-11ed-8ce8-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 8bb85bc4-74b9-11ed-8ce8-005056ab378f;
	Mon, 05 Dec 2022 17:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=CfEttA1FTi4AQiwQc2S061M8eH1bU8ujIZnK8AP1oeQ=;
	b=tuxrP4iDj3gFH2k+uiOY5AfY+VDm6lVhO28bzix8YLolw2WAb9dOlUjt6DU1RYah/hqPen25aYdBj
	 Lzxz6CzqzzxZZ1ADc1Wfswn3J3cI3A1zYphYND/h+RB5++kN0VXm4o7yMIaChUXEWwsE26bXpgVd2d
	 Gx0QhmtFMTh9HEiqQ51WT8cqWmow/+zkN5jFOIBfMmWjay79ZStZD0jO3Now+514+yuc0CUotJU0J8
	 rKsRltX3NP6CSHdR2UsmT8jiZLX/kc6xgjj5ph8F46lHvlW6Gt9QNIoRPObzd+0r/uIp+8XBTHCiAm
	 A6uTNRabcexvUPTUsus1Q3wy+CQihyQ==
X-KPN-MID: 33|/HodZ7OyzfPhmz8Wusw/hvCrbfwF8XAK2F6SsbeLUeM5/1JFyfL42Q6rfOIUZT5
 vs4/subOAw9WbxRrOMNUpjys7KE1IU/78c9NChulDz6k=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|HlvWMV6eR643KdYhfvNggMVMrOq6Fo+jZ0b/IE5gCpz70CJjmaqY8DBfnSwYzJL
 Vv4nF2ndQQ97M5SSCHFJAHA==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 8aa4c61b-74b9-11ed-b8b1-005056ab7447;
	Mon, 05 Dec 2022 17:26:16 +0100 (CET)
Date: Mon, 05 Dec 2022 17:26:16 +0100
Message-Id: <87tu293jh3.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Hector Martin <marcan@marcan.st>
Cc: povik+lin@cutebit.org, sven@svenpeter.dev, alyssa@rosenzweig.io,
	devicetree@vger.kernel.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, marcan@marcan.st
In-Reply-To: <20221205100211.3155-1-marcan@marcan.st> (message from Hector
	Martin on Mon, 5 Dec 2022 19:02:11 +0900)
Subject: Re: [PATCH] arm64: dts: apple: Rename dart-sio* to sio-dart*
References: <20221205100211.3155-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Hector Martin <marcan@marcan.st>
> Date: Mon,  5 Dec 2022 19:02:11 +0900
> 
> All the other DARTs are named foo-dart, so let's keep things consistent.
> 
> Fixes: 51979fbb7fb8 ("arm64: dts: apple: t600x: Add MCA and its support")
> Fixes: 8a3df85ad87d ("arm64: dts: apple: t8103: Add MCA and its support")
> Signed-off-by: Hector Martin <marcan@marcan.st>

Consistency is good!

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> ---
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi | 6 +++---
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> index 0b8958a8db77..e2f972c2c147 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -53,7 +53,7 @@ wdt: watchdog@2922b0000 {
>  		interrupts = <AIC_IRQ 0 631 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
> -	dart_sio_0: iommu@39b004000 {
> +	sio_dart_0: iommu@39b004000 {
>  		compatible = "apple,t6000-dart";
>  		reg = <0x3 0x9b004000 0x0 0x4000>;
>  		interrupt-parent = <&aic>;
> @@ -62,7 +62,7 @@ dart_sio_0: iommu@39b004000 {
>  		power-domains = <&ps_sio_cpu>;
>  	};
>  
> -	dart_sio_1: iommu@39b008000 {
> +	sio_dart_1: iommu@39b008000 {
>  		compatible = "apple,t6000-dart";
>  		reg = <0x3 0x9b008000 0x0 0x8000>;
>  		interrupt-parent = <&aic>;
> @@ -179,7 +179,7 @@ admac: dma-controller@39b400000 {
>  				      <&aic AIC_IRQ 0 1118 IRQ_TYPE_LEVEL_HIGH>,
>  				      <0>,
>  				      <0>;
> -		iommus = <&dart_sio_0 2>, <&dart_sio_1 2>;
> +		iommus = <&sio_dart_0 2>, <&sio_dart_1 2>;
>  		power-domains = <&ps_sio_adma>;
>  		resets = <&ps_audio_p>;
>  	};
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index 6f5a2334e5b1..1ea760ef2c25 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -318,7 +318,7 @@ cpufreq_p: performance-controller@211e20000 {
>  			#performance-domain-cells = <0>;
>  		};
>  
> -		dart_sio: iommu@235004000 {
> +		sio_dart: iommu@235004000 {
>  			compatible = "apple,t8103-dart";
>  			reg = <0x2 0x35004000 0x0 0x4000>;
>  			interrupt-parent = <&aic>;
> @@ -431,7 +431,7 @@ admac: dma-controller@238200000 {
>  					      <0>,
>  					      <0>;
>  			#dma-cells = <1>;
> -			iommus = <&dart_sio 2>;
> +			iommus = <&sio_dart 2>;
>  			power-domains = <&ps_sio_adma>;
>  			resets = <&ps_audio_p>;
>  		};
> -- 
> 2.35.1
> 
> 
> 
