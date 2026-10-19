Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78C44DE710
	for <asahi@lists.linux.dev>; Mon, 19 Oct 2026 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408789; cv=none; b=QWWHTt6WKAOIbypITIRG5O95IT7aPIMxsHQplUbKuG8EAt50ZYFTbrgpcZYEbHZNsoJEUVZ0LEoiTFSDI4nW4kYjL+AFHRo7trTZ/e2yLTsD7/uRPmLKDA+CdOnQp3VtdwUjFGnYYvB2CVLv6mkdzLQNe42T94szW6YR3VWdON4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408789; c=relaxed/simple;
	bh=ayavAZuL6gut6kDdF8rlaUfdoiee/uNgEyjk+w1tEas=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=Ol6TgbTL2QtR5GBAE92VqvfPSIX/tkoMl+m9GG7nRPDDKnLnzGhuCgGCVrUJL3b6wiMFU0XJzTOeFHtNKZT0yKsX4RBkgBDVA8S7NZtcdkapPMUPJzx2GcCxtQ6cqMMcF4HpXUf6yDKzd2pmJYszV5/KvYVxFQmYfRkXAdiXLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=klAw3z6Q; arc=none smtp.client-ip=195.121.94.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="klAw3z6Q"
X-KPN-MessageId: f8060ea5-cbae-11f1-a05e-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id f8060ea5-cbae-11f1-a05e-005056abad63;
	Mon, 19 Oct 2026 13:19:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=wt5ocYb+wtAikdetWG/PtghRsme5LtymJEWIkM8xwI8=;
	b=klAw3z6QgMOKtt2faqc0ljWyDl7fQMDIttDgiAFmr+M5BUqPx4M153T2XKcBs8i4k6tHp1gONJJEw
	 OoRhHgygkbtkyu48BTa4EBU6Br1KV1UnX02XrKhZvUy3SIa4OH7/PA6Gl4XwaBBFsYCqCM2rZP82+f
	 tTYuRU3SKBG8u/NHTtuf6vyziReBl+xNUCIzdu4JlYJsWnFjoa/lNZ0XTce8aVGOY92Vgm1C5qtZgr
	 a8KCxIUP9i6v+22zVBMZcTP5n+YmNcl0wDCSphTpMMYzK7o4xlIFA/auVNbiR47nOcBiV7RP0L8jCv
	 3xItnbIaeUEgIrVx9d3dUxQNA9hxsVQ==
X-KPN-MID: 33|vkDL8VoR8EAtSdVM7gwabo+IKZ07Ucr3zqqIueNt0/Mm8Eb1x6lvbOso1fUQqdi
 5y2icZb4tJbyVSTmYwsvtCDS8x9gRQ9WUQ71UKlB248o=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|ksWR/1+52KPoPQE00MlW6pNzMcMRtrfU3bV12QvXFHRjkhmA5+AN4vXx5PuJIlj
 2joB5hh2ViOMw182XH9ku1w==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id f78d9c24-cbae-11f1-a8c2-005056ab7447;
	Mon, 19 Oct 2026 13:19:37 +0200 (CEST)
Date: Mon, 19 Oct 2026 13:19:36 +0200
Message-Id: <877bjeym2f.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, kettenis@openbsd.org,
	trini@konsulko.com, ilias.apalodimas@linaro.org,
	sjg@chromium.org, asahi@lists.linux.dev, anshuld@ti.com,
	j@jannau.net
In-Reply-To: <20261010-apple-t603x-support-v1-2-ca529f301a62@jannau.net>
	(message from Janne Grunau on Sat, 10 Oct 2026 14:13:58 +0200)
Subject: Re: [PATCH 2/3] arm: apple: Add Apple M3 Pro and Max (t603[014])
 support
References: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net> <20261010-apple-t603x-support-v1-2-ca529f301a62@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Sat, 10 Oct 2026 14:13:58 +0200
> 
> Apple's M3 Pro (t6030) and Max (t6031 and t6034) SoCs are similar to
> their M1 and M2 predecessors. The MMIO blocks have been extended but
> M3 Pro and M3 Max still share the same overall layout although they
> aren't as similar as M1/M2 Pro and Max.
> Most of u-boot's existing drivers are compatible with the hardware and
> M3 Pro and Max device trees will carry "apple,t8103-*" as fallback
> compatible strings. Only apple-atcphy-reset will use a new compatible
> due to USB4 and DisplayPort changes relevant to the Linux driver.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  arch/arm/mach-apple/board.c | 97 +++++++++++++++++++++++++++++++++++++++++++++
>  doc/board/apple/m1.rst      |  6 +++
>  2 files changed, 103 insertions(+)

Acked-by: Mark Kettenis <kettenis@openbsd.org>
> 
> diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
> index e74a5a76919a..bd0c69fcb512 100644
> --- a/arch/arm/mach-apple/board.c
> +++ b/arch/arm/mach-apple/board.c
> @@ -750,6 +750,99 @@ static struct mm_region t8122_mem_map[] = {
>  	}
>  };
>  
> +/* Apple M3 Pro and Max */
> +
> +static struct mm_region t6030_mem_map[] = {
> +	{
> +		/* I/O */
> +		.virt = 0x280000000,
> +		.phys = 0x280000000,
> +		.size = 2UL * SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			 PTE_BLOCK_NON_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O */
> +		.virt = 0x300000000,
> +		.phys = 0x300000000,
> +		.size = 3UL * SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			 PTE_BLOCK_NON_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* PCIE */
> +		.virt = 0x580000000,
> +		.phys = 0x580000000,
> +		.size = SZ_512M,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			 PTE_BLOCK_NON_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* PCIE */
> +		.virt = 0x5a0000000,
> +		.phys = 0x5a0000000,
> +		.size = SZ_512M,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRE) |
> +			 PTE_BLOCK_INNER_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* PCIE */
> +		.virt = 0x5c0000000,
> +		.phys = 0x5c0000000,
> +		.size = SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRE) |
> +			 PTE_BLOCK_INNER_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O ATC0 */
> +		.virt = 0x700000000,
> +		.phys = 0x700000000,
> +		.size = SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			 PTE_BLOCK_NON_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O ATC1 */
> +		.virt = 0xb00000000,
> +		.phys = 0xb00000000,
> +		.size = SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			 PTE_BLOCK_NON_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O ATC2 */
> +		.virt = 0xf00000000,
> +		.phys = 0xf00000000,
> +		.size = SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			 PTE_BLOCK_NON_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O ATC3 */
> +		.virt = 0x1300000000,
> +		.phys = 0x1300000000,
> +		.size = SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			 PTE_BLOCK_NON_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* RAM */
> +		.virt = 0x10000000000,
> +		.phys = 0x10000000000,
> +		.size = 16UL * SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
> +			 PTE_BLOCK_INNER_SHARE
> +	}, {
> +		/* Framebuffer */
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL_NC) |
> +			 PTE_BLOCK_INNER_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* List terminator */
> +		0,
> +	}
> +};
> +
>  struct mm_region *mem_map;
>  
>  int board_init(void)
> @@ -799,6 +892,10 @@ void build_mem_map(void)
>  		mem_map = t6022_mem_map;
>  	else if (of_machine_is_compatible("apple,t8122"))
>  		mem_map = t8122_mem_map;
> +	else if (of_machine_is_compatible("apple,t6030") ||
> +		 of_machine_is_compatible("apple,t6031") ||
> +		 of_machine_is_compatible("apple,t6034"))
> +		mem_map = t6030_mem_map;
>  	else
>  		panic("Unsupported SoC\n");
>  
> diff --git a/doc/board/apple/m1.rst b/doc/board/apple/m1.rst
> index 4ed275f7ea8c..002f4926ed5e 100644
> --- a/doc/board/apple/m1.rst
> +++ b/doc/board/apple/m1.rst
> @@ -16,6 +16,8 @@ the following SoCs work:
>   - Apple M2 Pro SoC (t6020)
>   - Apple M2 Max SoC (t6021)
>   - Apple M2 Ultra SoC (t6022)
> + - Apple M3 Pro SoC (t6030)
> + - Apple M3 Max SoC (t6031 and t6034)
>  
>  On these SoCs the following hardware is supported:
>  
> @@ -87,3 +89,7 @@ supported SoCs.
>       - 0x2a1200000
>     * - M1 Pro/Max/Ultra (t6000/t6001/t6002) and M2 Pro/Max/Ultra (t6020/t6021/t6022)
>       - 0x39b200000
> +   * - M3 Pro (t6030)
> +     - 0x289200000
> +   * - M3 Max/Ultra (t6031/t6034/t6032)
> +     - 0x391200000
> 
> -- 
> 2.55.0
> 
> 
