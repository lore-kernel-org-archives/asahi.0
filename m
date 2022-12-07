Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD4376
	for <asahi@lists.linux.dev>; Wed,  7 Dec 2022 01:14:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 7387042458;
	Wed,  7 Dec 2022 01:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1670375636; bh=0ih4CXZV4h1yIADw8dfARqV0yBALDiODB2EOVwhwpNQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=wpglg4NsxOMvLQz3QuaNdCzlezRhmLatxQBbxNDsowldbgDtHmIYbZNfrbufXxrNh
	 viakgyfDs8Rjw+hyJzxXgHrINKRb3xh2skBusQXUGTy9suJbUttgIDD7/w6hIYEUsE
	 9Y0IW7DHUy6UVZzdwqGx0Cpge1dEyoXpQ/EMR96Kvd5PwsWG6LTb9x/oHXx4rgneG1
	 o15RsIfi3ZYmG6faDkjFCFgVuc3YYnlhtiGyRAsBNGNvpL98vicWtYrGWUy08kPKt2
	 kSd6Qp/lz5bTP5F+FHIiAKUQnmllZTpTv4u31YNfFwE8OmEl3PWF9WNaqQo1C+2Y0W
	 LNYwlvE0nZ/Pg==
Message-ID: <9f874026-da4b-c2f9-0a4f-65f514112dcc@marcan.st>
Date: Wed, 7 Dec 2022 10:13:50 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] Fix Apple silicon PCIe iommu device tree node names
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221206-arm64-dts-apple-pcie-iommu-v1-0-210c56e48c01@jannau.net>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20221206-arm64-dts-apple-pcie-iommu-v1-0-210c56e48c01@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/12/2022 07.57, Janne Grunau wrote:
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
> 
> Best regards,

Thanks, applied to asahi-soc/dt!

- Hector
