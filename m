Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641D374
	for <asahi@lists.linux.dev>; Wed,  7 Dec 2022 04:29:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id DC06A42450;
	Wed,  7 Dec 2022 04:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1670387357; bh=+jI1yEGY3MEpXp/4yaQDZCPhmgfp0LSji+jxCewxEKc=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=BBpC2QaLDcDhNs4KmU9PjAxnKsEAL+JdXs7elNnpf+Z98t/0L81rrrUg9ICYT5JYu
	 Qvvqh0Tm5miite/MRYn1Aio3SOMGWuRyHKozvN+e9T8ZsjtqxrqjAuGJqk+El11Tus
	 Zl0BFd/arbSPA5FMhfA9EyilWPTbhtiFJzSfwMpcA44ebEQxMwSAIzYUZh3B+EcSZX
	 kR4siA68OffCEcx3b57Iyd+fSP3Iqa1E1BU9UmLBJPmmAJM2GuWpb6620haqQ2IN3f
	 7rT/94NB29HaWAfoudK09pSQACdzjrKQKSlOkNLiiRopRLsWmKwUBIAPN6MxAgmgTP
	 QF1IlTUSZU7hA==
Message-ID: <7fcb4e87-7314-67c9-3217-48687f1ec86b@marcan.st>
Date: Wed, 7 Dec 2022 13:29:11 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221206-asahi-soc-t8103-cache-v1-0-577c5ca2360f@jannau.net>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH] arm64: dts: apple: Add t8103 L1/L2 cache properties and
 nodes
In-Reply-To: <20221206-asahi-soc-t8103-cache-v1-0-577c5ca2360f@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/12/2022 07.38, Janne Grunau wrote:
> The t8103 CPU nodes are missing the cache hierarchy information. The
> cache hierarchy on Arm can not be detected and needs to be described in
> DT. The OS scheduler can make use of this information for scheduling
> decisions.
> 
> The cache size information is based on various articles about the
> processors. There's also an L3 system level cache (SLC). It's not
> described here because SLCs typically have some MMIO interface which
> would need to be described.
> 
> Based on Rob Herring's patch adding cache properties and nodes for
> t600x.
> 
> Link: https://lore.kernel.org/asahi/20221122220619.659174-1-robh@kernel.org/
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Hector Martin <marcan@marcan.st>

Thanks! Applied to asahi-soc/dt.

- Hector
