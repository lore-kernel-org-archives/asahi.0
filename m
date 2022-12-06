Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77402F22
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 23:24:27 +0000 (UTC)
X-KPN-MessageId: f55a3b5c-75bc-11ed-97dd-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id f55a3b5c-75bc-11ed-97dd-005056abad63;
	Wed, 07 Dec 2022 00:23:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=CIBeStOO0qbBcZ6mxWmcUguUE28tbAb8XjbHrtI/l1o=;
	b=E0LuIuM9iGdCWGe2kmEgOHZjUuwKGbwkpfDFdsKOwDmMURgVjtRp13HHbbG3iQHc0tdRyK0yjnuUc
	 ycUuAVg+HZ2x+4Cb0vnGMca6TSIw4s9UO5u6bXkpxz0g1Gae5+nYQjmqLy6Tdlta7bMjeXSfAcjgiW
	 ZXG3exOwFspPoRjbUxpSCN9NaBHITzHNI/P5DUG21Ur9hZHOsFx1q0gZtQRW9PltxdVmgFqKahZeu9
	 VbMxguncazGyD4JdAxGyVeNrJ6t5pSmbbFNvOs1/XR4L39hNr5dDg80wSPD3kSfARAzakjxlWDPsln
	 FR+vqPYHqF/jHtwP3SEggwkQVYp82Aw==
X-KPN-MID: 33|FtOEMHrbeBIOC7vz8Aa7KogKslJJNPLGdoTAREmn8gzz/VtkhcTQLtXJvhZy4Wp
 Y3krK5jAq0Y7cUuWfk6Rk9TD2nco14LiD13Ntve2O+eQ=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|NXpokNYCE8DxEVe8/3j3MToiwY0oPaG0xO7vx8a+f+z45yR8j+Bg1qimjDim4+q
 4SU69MqtF1Atl0EQ1s9QPNQ==
X-Originating-IP: 80.61.163.207
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id f5f371eb-75bc-11ed-ae04-005056ab1411;
	Wed, 07 Dec 2022 00:23:16 +0100 (CET)
Date: Wed, 07 Dec 2022 00:23:15 +0100
Message-Id: <87mt802k2k.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	maz@kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	j@jannau.net
In-Reply-To:
	<20221206-arm64-dts-apple-pcie-iommu-v1-0-210c56e48c01@jannau.net>
	(message from Janne Grunau on Tue, 06 Dec 2022 23:57:35 +0100)
Subject: Re: [PATCH 0/2] Fix Apple silicon PCIe iommu device tree node names
References: <20221206-arm64-dts-apple-pcie-iommu-v1-0-210c56e48c01@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> Content-Type: text/plain; charset="utf-8"
> From: Janne Grunau <j@jannau.net>
> Date: Tue, 06 Dec 2022 23:57:35 +0100
> Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
>  devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
>  Janne Grunau <j@jannau.net>
> 
> Hej,
> 
> the iommu nodes for the PCIe ports were added with the non-standard
> node name "dart" instead of the recommended generic "iommu" from the
> devicetree specification. This series fixes this for t8103 and t600x.
> Patches are based on the asahi-soc-dt-6.2-v2 tag in the asahi-soc
> repository (https://github.com/AsahiLinux/linux.git).
> 
> cheers,
> 
> Janne
> 
> To: Hector Martin <marcan@marcan.st>
> To: Sven Peter <sven@svenpeter.dev>
> To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Marc Zyngier <maz@kernel.org>
> Cc: asahi@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Janne Grunau <j@jannau.net>
> 
> ---
> Janne Grunau (2):
>       arch: arm64: apple: t8103: Use standard "iommu" node name
>       arch: arm64: apple: t600x: Use standard "iommu" node name
> 
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi | 8 ++++----
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 6 +++---
>  2 files changed, 7 insertions(+), 7 deletions(-)
> ---
> base-commit: d32c1530c7230b756ca9a6b6cf92ce6e60788594
> change-id: 20221206-arm64-dts-apple-pcie-iommu-7b0d4d5d4329

For the series:

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
