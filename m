Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185F84C4F6C
	for <asahi@lists.linux.dev>; Mon, 19 Oct 2026 10:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792404965; cv=none; b=u0u8bcQEIwlVjxtXDTYsK7oVSXxHr82v1pkcNBUoGi+o5NcvlsNwI0DVuYiRiqyRT8OJJKghaCSDb5TiZkjSQ7r78o9zdvb2naSYefw+ZOnAochCyNof4ceE+xRhU3CSKMtmLivileqq7Duo4K32aY7wPu+VhgPJLXgzKBHvgA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792404965; c=relaxed/simple;
	bh=wtuJMQ2ZK2Wkf5LwKqJOpf7r/3GILIjv+7BzuHseNGE=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=g++CdmcP+WY8HlydVnEClT++k7MKFII4VALhUscdH2R+6WMPqu8WaVcl2MbD/lPCixO7vRzo2nHc2Y3s1hpYLb8t+lqiRddMKdtbFF0nC7bBlkpjNcrymlgtnUaws0xSvdUngCAihX9wp9v6kqHZVmY37BLZiEa2addvMswH+84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=QvK9Yq7E; arc=none smtp.client-ip=195.121.94.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="QvK9Yq7E"
X-KPN-MessageId: 140775cf-cba6-11f1-b2ab-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 140775cf-cba6-11f1-b2ab-005056abbe64;
	Mon, 19 Oct 2026 12:15:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=8M/9VOV4M58wdb34Ao6d8bMluDly1tjynfPCwZqYCII=;
	b=QvK9Yq7Er/I0bms3nCOVMQzoiviD8DGXH3aoX+oopVO0X7Znxkhd2EQVymW6ugCKPXiRlOsd1IKJ4
	 ypu4B5AOV6+uVKOkrAb0ikYI35N2UmQEWKMWg8LK3cvQ59zw+ZvgbZr0mpHe9459GrHJs2Fwoyb8SL
	 sWmmTQ7bQgAYHLTtea9AXWgxuhPCw3UozClQ9ZoxvaHjltmV+wKpsCJm1mjzCRRVYpKJRfXnV5VVjc
	 7wQN7SpqQd7A45fzxmA0LVbK1lUqEGLfih/GgyVkodcn3/xRyoT6HtICOpDXqph2wfarJO66qCd68Q
	 wczQw93glSBkvEMnfKuy9WDneEN9g0g==
X-KPN-MID: 33|FdOQJQjz63tiboHACDrCStziBLNpp7Li3tUAOP3elpwoQK93HUcF0q9ge3WQxQt
 nkQaQX++VQNOTTeCBwLWhw8P+NlIqsK+ksQgTH4XNemU=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|XNp40WKAGiYwcAK6un/VSX/pxGBIxxnZ5Id2swDdu6nz/uwsP6zqhcpd6AGMlOV
 LoRMMoeu+6bNp9bTpIfC5yg==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 13915d12-cba6-11f1-92b4-005056ab1411;
	Mon, 19 Oct 2026 12:15:58 +0200 (CEST)
Date: Mon, 19 Oct 2026 12:15:57 +0200
Message-Id: <878q3uyp0i.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, kettenis@openbsd.org,
	trini@konsulko.com, ilias.apalodimas@linaro.org,
	sjg@chromium.org, asahi@lists.linux.dev, anshuld@ti.com,
	j@jannau.net
In-Reply-To: <20261010-apple-t603x-support-v1-1-ca529f301a62@jannau.net>
	(message from Janne Grunau on Sat, 10 Oct 2026 14:13:57 +0200)
Subject: Re: [PATCH 1/3] doc: apple: Add Apple M3 as supported SoC
References: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net> <20261010-apple-t603x-support-v1-1-ca529f301a62@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Sat, 10 Oct 2026 14:13:57 +0200
> 
> Adding M3 (t8122) to the documentation was missed in commit a1a47eee6763
> ("arm: apple: Add Apple M3 (t8122) support").
> Since Apple silicon SoCs have switched to upstream DTS stop listing SoCs
> with device trees. The expectation is that u-boot support is added
> together with Linux support. So the device trees might lag a little
> behind. Since u-boot's dtbs are usually not used on Apple SoCs this is
> not an issue.
> 
> Fixes: a1a47eee6763 ("arm: apple: Add Apple M3 (t8122) support")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  doc/board/apple/m1.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/doc/board/apple/m1.rst b/doc/board/apple/m1.rst
> index 900c5e6d91ea..4ed275f7ea8c 100644
> --- a/doc/board/apple/m1.rst
> +++ b/doc/board/apple/m1.rst
> @@ -9,6 +9,7 @@ the following SoCs work:
>  
>   - Apple M1 SoC (t8103)
>   - Apple M2 SoC (t8112)
> + - Apple M3 SoC (t8112)

That should be t8122!

>   - Apple M1 Pro SoC (t6000)
>   - Apple M1 Max SoC (t6001)
>   - Apple M1 Ultra SoC (t6002)
> @@ -24,8 +25,8 @@ On these SoCs the following hardware is supported:
>   - NVMe storage
>   - USB 3.1 Type-C ports
>  
> -Device trees are provided in dts/upstream/src/arm64/apple/ and available
> -for all M1 and M2 (t8103, t8112, t600x and t602x) devices.
> +Device trees are provided in dts/upstream/src/arm64/apple/ and available once
> +they are merged in the Linux kernel tree.
>  
>  Building U-Boot
>  ---------------
> @@ -82,5 +83,7 @@ supported SoCs.
>       - Base Address
>     * - M1 (t8103) and M2 (t8112)
>       - 0x235200000
> +   * - M3 (t8122)
> +     - 0x2a1200000
>     * - M1 Pro/Max/Ultra (t6000/t6001/t6002) and M2 Pro/Max/Ultra (t6020/t6021/t6022)
>       - 0x39b200000
> 
> -- 
> 2.55.0
> 
> 
