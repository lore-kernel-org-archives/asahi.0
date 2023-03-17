Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C17475
	for <asahi@lists.linux.dev>; Fri, 17 Mar 2023 17:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DFFC433EF;
	Fri, 17 Mar 2023 17:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679075277;
	bh=+kGC7FbC9kl4Uk9kpXxBRDWJCgeiHeBHPRPimywbtMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n0/kQS9q37VRCcmxsnhRngTuthe7jfLxnqAZEsV0LTiuO7b73aKJZECZL+Z0+r507
	 dOyKg3KaMlPWglXDtmmkTaPR/xhKYBl1OWOPNU2rJUFe7pBj4y81pymOMpHAXBoa/z
	 sURuYsc+LWxQzwbroiWOfKkWpmEatH2noS/sR3sym6cb3ENQY2Kdxy0iZG1R+b4zdB
	 pjLbJn4yRhA+t25iQwuzt3ngqb2XryPpzw+c58pd7hAg92kFNLUZYnyO006cjdfLG+
	 piBnpSnnWSXgWTRx4cvbGf8b0/+RBkEqj+a6kjZwjRN6wBy3V2LVhbs3iUefHSl9Mr
	 LCOX7Ixh/Dg5g==
Date: Fri, 17 Mar 2023 23:17:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 13/15] dt-bindings: dma: apple,admac: Add t8112-admac
 compatible
Message-ID: <ZBSnybiX5c9oWe7X@matsya>
References: <20230202-asahi-t8112-dt-v3-0-d1a5f6383d95@jannau.net>
 <20230202-asahi-t8112-dt-v3-13-d1a5f6383d95@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202-asahi-t8112-dt-v3-13-d1a5f6383d95@jannau.net>

On 07-03-23, 13:10, Janne Grunau wrote:
> The block found on Apple's M2 SoC is compatible with the existing driver
> so add its per-SoC compatible.

Applied, thanks

-- 
~Vinod
