Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72995A0E5
	for <asahi@lists.linux.dev>; Thu, 30 Nov 2023 20:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="FjaGKIGn"
X-KPN-MessageId: 66024aa6-8fc1-11ee-90ec-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 66024aa6-8fc1-11ee-90ec-00505699b430;
	Thu, 30 Nov 2023 21:45:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=wRBnsSMpxk47NJ9LiZMl2l9xDx5Ziq6j0PVG+dHYc8E=;
	b=FjaGKIGnL1kmmFtqU119hjr2sC41M0kRKWSkc8AoMpUarPVjUVcM5vnZihxBM/w+mfPRoL4tzlWK7
	 JhcIDfWC8MKD61Iof+svt2GH3w4xI4lhc9O3B0PL9UPRzO3ZlOO00/liaAabqa/ovzrQ2qDOQQmANn
	 daQycUkWZtIUpT7fn+brF2ZqzMvQsIrtwUqMheMM0xr0mAW6VHkuhFXOpw61pjlXXf+TswJ4v+/sY8
	 J7sDUTKvj+EG1/QQtiku9ePjYyNALknYsRAn87MXyDGZ0DBrjSV6S4w+b1jHA5xsb6mhgNqI6ABeFS
	 O87MOBpRqoclCe/tsRmn1GLUi0s9w1Q==
X-KPN-MID: 33|wlX5AGLjZlt2jPjJLv3etq/dRXWbwi9deqQDFBCGGGqLuy3NlZzNo3yQyljvBG8
 Gb4AosDeod+nJTy/1LhSUn0b1gshynD7WHrErsY19uFg=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|f+xYDDl8aMRj13hriGoQmFLoHCZSjtNrJZZGvkJ4GRomUqiBggRrbqJAYQtyxzG
 UwK5xMJLuTRDscwbOVdI36w==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 6965e7d2-8fc1-11ee-ac85-00505699b758;
	Thu, 30 Nov 2023 21:45:36 +0100 (CET)
Date: Thu, 30 Nov 2023 21:45:35 +0100
Message-Id: <87jzpz0y34.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: j@jannau.net
Cc: kettenis@openbsd.org, trini@konsulko.com, u-boot@lists.denx.de,
	asahi@lists.linux.dev
In-Reply-To: <20231130-apple_t602x_extend_memmap-v1-1-cd96b251d2dc@jannau.net>
	(message from Janne Grunau via B4 Relay on Thu, 30 Nov 2023 13:42:22
	+0100)
Subject: Re: [PATCH] arm: apple: t602x: Add missing MMIO regions to memmap
References: <20231130-apple_t602x_extend_memmap-v1-1-cd96b251d2dc@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
> Date: Thu, 30 Nov 2023 13:42:22 +0100
> 
> From: Janne Grunau <j@jannau.net>
> 
> The memory maps for Apple's M2 Pro/Max/Ultra left MMIO space out which
> was not used by any driver at the time. The display out exposed as
> simple-framebuffer use a power-domain controlled by a device in an
> unmapped region.
> Add a map covering this region as well as another MMIO region in the
> range 0x4'0000'0000 - 0x5'0000'0000. The added regions cover all MMIO
> annotated in Apple's device tree in this range.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  arch/arm/mach-apple/board.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)

Hi Janne,

Is there a reason why you can't use a SZ_1G mapping for the blocks
where you're using a SZ_512M mapping?  With SZ_1G the mapping code
will use a 1G block descriptor which avoids another level of page
tables.


> diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
> index 47393babbc..e05ec431bc 100644
> --- a/arch/arm/mach-apple/board.c
> +++ b/arch/arm/mach-apple/board.c
> @@ -370,6 +370,22 @@ static struct mm_region t6020_mem_map[] = {
>  		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
>  			 PTE_BLOCK_NON_SHARE |
>  			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O */
> +		.virt = 0x400000000,
> +		.phys = 0x400000000,
> +		.size = SZ_512M,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			PTE_BLOCK_NON_SHARE |
> +			PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O */
> +		.virt = 0x480000000,
> +		.phys = 0x480000000,
> +		.size = SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			PTE_BLOCK_NON_SHARE |
> +			PTE_BLOCK_PXN | PTE_BLOCK_UXN
>  	}, {
>  		/* I/O */
>  		.virt = 0x580000000,
> @@ -471,6 +487,22 @@ static struct mm_region t6022_mem_map[] = {
>  		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
>  			 PTE_BLOCK_NON_SHARE |
>  			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O */
> +		.virt = 0x400000000,
> +		.phys = 0x400000000,
> +		.size = SZ_512M,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			PTE_BLOCK_NON_SHARE |
> +			PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O */
> +		.virt = 0x480000000,
> +		.phys = 0x480000000,
> +		.size = SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			PTE_BLOCK_NON_SHARE |
> +			PTE_BLOCK_PXN | PTE_BLOCK_UXN
>  	}, {
>  		/* I/O */
>  		.virt = 0x580000000,
> @@ -551,6 +583,22 @@ static struct mm_region t6022_mem_map[] = {
>  		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
>  			 PTE_BLOCK_NON_SHARE |
>  			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O */
> +		.virt = 0x2400000000,
> +		.phys = 0x2400000000,
> +		.size = SZ_512M,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			PTE_BLOCK_NON_SHARE |
> +			PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +	}, {
> +		/* I/O */
> +		.virt = 0x2480000000,
> +		.phys = 0x2480000000,
> +		.size = SZ_1G,
> +		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +			PTE_BLOCK_NON_SHARE |
> +			PTE_BLOCK_PXN | PTE_BLOCK_UXN
>  	}, {
>  		/* I/O */
>  		.virt = 0x2580000000,
> 
> ---
> base-commit: 43f2873fa98b1da6eb56d756315c7bd7db63db27
> change-id: 20231130-apple_t602x_extend_memmap-c82c522ca8c0
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
> 
