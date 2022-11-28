Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195072F5E
	for <asahi@lists.linux.dev>; Mon, 28 Nov 2022 11:57:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A132541A36;
	Mon, 28 Nov 2022 11:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1669636659; bh=EwJToLzTU9h6aco5n9NXZUfUVrHciJDtXP0+NrxOMN4=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=vAUs1d2xmDOZAYc5dlIyiS1spEYljgtDMqNxaLu4aT5AlxdajmKH+b2J88piBbOFW
	 onPWgc9PC6IoXDLesSl9ycz1HWQwRhfSNusqM4qV/AULub8EJz6dVB2Q3aYqA+htfr
	 a2rKEIyh3pwo3n/4ULDJ/HI/O7IPJ5MGw5qwXSYSBQEK1Tsyzm7I64UwZDnMm+GBJH
	 PVBb/e3dOXeiD0Mn1UcWIZaan843DVKIuvJ9U8rK6gh36+xsqiHgGA7RMtxoVZYvuM
	 aB8TKj1oKLZVYYwmSnIsXVAHI3srI2u/zSYeBnoXvHU2BYCPx4ynmMlsT9IX0r/M5z
	 kzdRing6imHPw==
Message-ID: <9410ffc0-3bc0-028d-cf67-b67bc54ef600@marcan.st>
Date: Mon, 28 Nov 2022 20:57:34 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221122220619.659174-1-robh@kernel.org>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH] arm64: dts: apple: Add t600x L1/L2 cache properties and
 nodes
In-Reply-To: <20221122220619.659174-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2022 07.06, Rob Herring wrote:
> The t600x CPU nodes are missing the cache hierarchy information. The
> cache hierarchy on Arm can not be detected and needs to be described in
> DT. The OS scheduler can make use of this information for scheduling
> decisions.
> 
> The cache size information is based on various articles about the
> processors. There's also an L3 system level cache (SLC). It's not
> described here because SLCs typically have some MMIO interface which
> would need to be described.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Based on apple dts changes in linux-next.
> 
> This fixes the warning: Unable to detect cache hierarchy for CPU %d
> ---
>  arch/arm64/boot/dts/apple/t6002.dtsi        | 51 +++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t600x-common.dtsi | 51 +++++++++++++++++++++
>  2 files changed, 102 insertions(+)
> 
[...]

Applied to asahi-soc/dt, thanks!

I probably won't send this one up until the 6.3 cycle; I've rebased our
downstream bits/000-devicetree on top so it'll get some downstream
testing before going upstream (and in the meantime someone should get
around to adding these for the other chips too ;)).

Cheers,
- Hector
