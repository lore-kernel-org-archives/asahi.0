Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC3253A5
	for <asahi@lists.linux.dev>; Thu, 29 Sep 2022 16:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFCDC433C1;
	Thu, 29 Sep 2022 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664469081;
	bh=m/ihyg+6/QviLbrF/OUEZsfQ9lsN0rCuzODFHQsvoso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ujm6lUIYEoDBW5zdIPQLQ6/6zCRoIRlVRW071g3XlmPUe3cxEhIOn5+pGEdT4MF1N
	 kRD4I5LbTzmuQPeNpuTHGuwZ2TGYI2TOonA8Osl3XeVSvqWtjRzH31wGHRqboqR6qS
	 taH0SZ8VPH1T9DDBDRC5tG+GBb08B/ChjNIovDT/GN0A02Hqu6SGAHs8TDKBfVujKD
	 4yWlSoOmssyx2+gJ2XI6mWbQrUeweBYKrpRh+WsSpF5jkkwSq2ULXBhR7mCRAmoTzf
	 77yVJPgOyAcVPRJxQSnvehA5pciqES0EXf8Tnni5JhN1vK0P8LAG5duyVZEKau6Miw
	 /nZz67UK9SO8w==
Date: Thu, 29 Sep 2022 22:01:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/10] dt-bindings: dma: apple,admac: Add iommus and
 power-domains properties
Message-ID: <YzXIVM6zGszDa2JQ@matsya>
References: <20220916142550.269905-1-j@jannau.net>
 <20220916142550.269905-2-j@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220916142550.269905-2-j@jannau.net>

On 16-09-22, 16:25, Janne Grunau wrote:
> Apple's ADMAC is on all supported Apple silicon SoCs behind an IOMMU
> and has its own power-domain.

Applied, thanks

-- 
~Vinod
