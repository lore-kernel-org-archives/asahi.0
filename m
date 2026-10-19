Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058FE3F8891
	for <asahi@lists.linux.dev>; Mon, 19 Oct 2026 11:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409068; cv=none; b=P/HJpFOIr0YfJEztb+IkiTYjkPvpe4Pj72mnNtiKcE3ejgsqfc41foKEtd95gss3UNNSX7RVnCJxUabd9aXZuIXiZNexZnb0A0enm11LQ3ORquzcLAm1fpHo6Dm5rS8sCiXamkyGmENw7dx87gJlOfCY8FkXx+tpQ78s7pj3TMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409068; c=relaxed/simple;
	bh=NzMMwcrEtJscXn+NU6CRwFMoWwt/YjM4pQ9EIXQsd6Y=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=tkbFH/eaHt8xyM51fhZCRDCqJLuWdGGdgrpz+vRVS6/G1Slbd1RuIUv2LOvo+gBum5JLIed6pJS1ruH2lBo5vAhNC70ZcOsxWJ0q5SxlC0AZ5FzZpj3H7VyMJGc9sKW7Nda/wytR88EwOaPbF0vdxlRWogrth0eEX4flAEGDJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=GKOKyqAg; arc=none smtp.client-ip=195.121.94.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="GKOKyqAg"
X-KPN-MessageId: 78797b94-cbaf-11f1-8627-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 78797b94-cbaf-11f1-8627-005056aba152;
	Mon, 19 Oct 2026 13:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=9qKTRWPXou2pUoYMP76ROHflwFeDMPWWub2/5eH/774=;
	b=GKOKyqAghVzOYEqEEOJJzDYbfVATg9v6NM+9OyNU10u93h1Atbv9i0eKdR1W8FIdO0TQSjPMpyHqr
	 R5Q2LV9a+0KOKhckAsQ/H3BKS3EspfFBGr8Z9v7wuVzViI9LZuxHCmW30ZqExCBkvJEcDT3xgvrhaR
	 KW0jrLI5mH1Rr7k0yntjQVSoENUOmNrUdUZHmoKhL1hQw+x48vFLwyKUbYelHjCrBcYoyaKc9age1t
	 QAEezx6fvvGfFDEWyHlZEyJJByj6JphcElW4ZnquNSJ4GxiK9rqEglDaaGpF9bpB6pqpWHwygFMhVF
	 m05+icHFnUs1ZLEZ8y4OVpKfXA8atKA==
X-KPN-MID: 33|nlMB/bceciL7WYirUKhjjJ9qwozPGKnquFilUcdYWpC8As/pm8XlaLeciMrlVN2
 feZQ0syp4gKavxDu6WOgMbA==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|iBg/d0SC4HewNveoPX/e3tcW9UNmsBkK4KfCW6iCziSjnwhy7Y30Na/alB6aPcr
 1uL59QPRmKPi3l/HZg44O4A==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 77fcc2ef-cbaf-11f1-92b4-005056ab1411;
	Mon, 19 Oct 2026 13:23:12 +0200 (CEST)
Date: Mon, 19 Oct 2026 13:23:11 +0200
Message-Id: <875wyyylwg.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, kettenis@openbsd.org,
	trini@konsulko.com, ilias.apalodimas@linaro.org,
	sjg@chromium.org, asahi@lists.linux.dev, anshuld@ti.com,
	j@jannau.net
In-Reply-To: <20261010-apple-t603x-support-v1-3-ca529f301a62@jannau.net>
	(message from Janne Grunau on Sat, 10 Oct 2026 14:13:59 +0200)
Subject: Re: [PATCH 3/3] arm: apple: Add Apple M3 Ultra (t6032) support
References: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net> <20261010-apple-t603x-support-v1-3-ca529f301a62@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Sat, 10 Oct 2026 14:13:59 +0200
> 
> Apple's M3 Ultra (t6032) SoC consists like its M1 and M2 predecessors of
> two M3 Max dies with an "UltraFusion" interconnect. Since it is only
> used in the Mac Studio the mem map does not need to duplicate all
> entries. Two of the USB4 / Thunderbolt complexes on the second die are
> unused. Only PCIe host controller on the first die is used directly. The
> PCIe IO on the second die is used internally to connect the NVMe
> controller with the NAND flash.
> Most of u-boot's existing drivers are compatible with the hardware and
> M3 Ultra device trees will carry "apple,t8103-*" as fallback compatible
> strings. Only apple-atcphy-reset will use a new compatible as M3 Ultra
> has ThunderBolt 5 / USB4v2 USB-C ports.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  arch/arm/mach-apple/board.c | 127 ++++++++++++++++++++++++++++++++++++++++++++
>  doc/board/apple/m1.rst      |   1 +
>  2 files changed, 128 insertions(+)

Acked-by: Mark Kettenis <kettenis@openbsd.org>

> diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
> index bd0c69fcb512..d8ad925a00e6 100644
> --- a/arch/arm/mach-apple/board.c
> +++ b/arch/arm/mach-apple/board.c
> @@ -843,6 +843,131 @@ static struct mm_region t6030_mem_map[] = {
>  	}
>  };
>  
> +/* Apple M3 Ultra */
> +
> +static struct mm_region t6032_mem_map[] = {
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
> +		/* I/O */
> +		.virt = 0x2280000000,
> +		.phys = 0x2280000000,
> +		.size = 2UL * SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			 PTE_BLOCK_NON_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O */
> +		.virt = 0x2300000000,
> +		.phys = 0x2300000000,
> +		.size = 3UL * SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			 PTE_BLOCK_NON_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O ATC4 */
> +		.virt = 0x2700000000,
> +		.phys = 0x2700000000,
> +		.size = SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			 PTE_BLOCK_NON_SHARE |
> +			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O ATC5 */
> +		.virt = 0x2b00000000,
> +		.phys = 0x2b00000000,
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
> @@ -896,6 +1021,8 @@ void build_mem_map(void)
>  		 of_machine_is_compatible("apple,t6031") ||
>  		 of_machine_is_compatible("apple,t6034"))
>  		mem_map = t6030_mem_map;
> +	else if (of_machine_is_compatible("apple,t6032"))
> +		mem_map = t6032_mem_map;
>  	else
>  		panic("Unsupported SoC\n");
>  
> diff --git a/doc/board/apple/m1.rst b/doc/board/apple/m1.rst
> index 002f4926ed5e..f1be55996b95 100644
> --- a/doc/board/apple/m1.rst
> +++ b/doc/board/apple/m1.rst
> @@ -18,6 +18,7 @@ the following SoCs work:
>   - Apple M2 Ultra SoC (t6022)
>   - Apple M3 Pro SoC (t6030)
>   - Apple M3 Max SoC (t6031 and t6034)
> + - Apple M3 Ultra SoC (t6032)
>  
>  On these SoCs the following hardware is supported:
>  
> 
> -- 
> 2.55.0
> 
> 
