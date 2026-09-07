Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFEC3AAF71
	for <asahi@lists.linux.dev>; Mon,  7 Sep 2026 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816251; cv=none; b=cc3fLPzKEY7kjtBpeAsL4JvtUsjK4Ku8rS7mNG6wi7wPpzUeXTX7hjvTCmuJ0hqffvTgRq+XyZy/WaIvW0Ragfxe8CZIWsPNIXh1rw1Ul3AIqf35c56R8SzJj1x3zV699WOXI+fcQg2ISNJJ4APcXyIiUuUn6806G6d51QgiWfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816251; c=relaxed/simple;
	bh=Id6tdm0Tuev4Y/HsTFvfsTGXea/uHNyEo6GHMaUWi1M=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=EGLvSp8x9osTBH/AzJJ9vUDB3qqYCQvrp9yzIdOly51Z4Uy1RzNmoSvW/4eGawfr1V2JBBYHdx0wVr4Lh7kYqkKthJ9sJQ72Gqitadmq0xPANlAFlMWFfEa1v8ny8osC6dbsjypaHgsEBn9X65WSisV1C+yYqLfbnPna3th5Ock=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=Vsn4NlNQ; arc=none smtp.client-ip=195.121.94.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Vsn4NlNQ"
X-KPN-MessageId: 73fb101a-ab02-11f1-861e-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.37])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 73fb101a-ab02-11f1-861e-005056aba152;
	Mon, 07 Sep 2026 23:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=t8/QKxuYIOAzM8iCIfe4Rns8kvfQlzsdhBTdAeSDhlY=;
	b=Vsn4NlNQ0LicBFQ/FmZozdaC3WVpdt1RCoH62akC5p1GsEmk09ztKeYvusZy5kMbC0xeVdR+Ps45n
	 hEe6rwR3iVwHm6mCCM47gayVHsiHxZRLaXmkkXEWUsGdm/PaVmQBYiAaFvzxs23rxTFkXJwleC2++/
	 AXE4NElt0Kfo5oghLHADR65rzpLqQcNOQz3ekvYtm0ppVmf6Z+QfIBmukwXcWb+3r6919AJvGmgouS
	 tdc2gpAdQXUcnRpoXU3O9Fn3vB+1kgD0YtrKcyWxpQcqiObaVU5Kzc4dAGhmjyvDUznlhT/AebSm8d
	 9yLYkOxLZDxKTvYRzKLF/gj1cd1gfKA==
X-KPN-MID: 33|58FeQ0QsBK4ag8bnEtJV6DGJ0dmwgBKvUq4zrar62q8ogsAAQfbEUbrLHW+HFE7
 42IpljMX/DEeFP+kpcZ6dvpLMn7ovC1PSo0TG5+T4oy4=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|YavA8tLVNzCQAUz1y+7h9DcJLrV0K4uzcy7Fc1dQRVm9HX39leu6v6wLbF2X2EA
 2KSYM+yABU3fMDhuEddo1DQ==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 7383ba93-ab02-11f1-9281-005056ab1411;
	Mon, 07 Sep 2026 23:24:04 +0200 (CEST)
Date: Mon, 07 Sep 2026 23:24:04 +0200
Message-Id: <87pkyosqkr.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, asahi@lists.linux.dev,
	kettenis@openbsd.org, sven@kernel.org,
	neil.armstrong@linaro.org, bmeng.cn@gmail.com,
	trini@konsulko.com, fberder@outlook.fr, j@jannau.net
In-Reply-To: <20260904-apple-nvme-fwabi-v1-4-f7ede661c469@jannau.net> (message
	from Janne Grunau on Fri, 04 Sep 2026 21:22:42 +0200)
Subject: Re: [PATCH 4/4] nvme: apple: Drop the PRP null check chicken bit
References: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net> <20260904-apple-nvme-fwabi-v1-4-f7ede661c469@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Fri, 04 Sep 2026 21:22:42 +0200
> 
> Now that we program the DMA direction correctly the NULL check that used
> to make commands fail passes. Another side effect of this bit was that
> non-align buffers on the admin queue were silently allowed and that's
> been fixed now as well and we this don't need this chicken bit anymore.
> More importantly, starting with the firmware installed with macOS 15,
> which is required for M4 but can also be installed on the previous SoCs,
> the controller no longer exposes this control register and any access
> SErrors instead. Just drop the write entirely.
> 
> Based on Linux kernel commit 8ce883fd068b ("nvme-apple: Drop the PRP
> null check chicken bit").

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> Link: https://lore.kernel.org/asahi/20260806-b4-nvme-fwabi-v1-6-bde19ce8db04@kernel.org/
> Fixes: 50333c94f2de ("nvme: apple: Add driver for Apple NVMe storage controller")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/nvme/nvme_apple.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/nvme/nvme_apple.c b/drivers/nvme/nvme_apple.c
> index 54821f80c81..948a56e518b 100644
> --- a/drivers/nvme/nvme_apple.c
> +++ b/drivers/nvme/nvme_apple.c
> @@ -26,8 +26,6 @@
>  #define ANS_BOOT_STATUS		0x01300
>  #define  ANS_BOOT_STATUS_OK	0xde71ce55
>  #define ANS_MODESEL		0x01304
> -#define ANS_UNKNOWN_CTRL	0x24008
> -#define  ANS_PRP_NULL_CHECK	(1 << 11)
>  #define ANS_LINEAR_SQ_CTRL	0x24908
>  #define  ANS_LINEAR_SQ_CTRL_EN	(1 << 0)
>  #define ANS_ASQ_DB		0x2490c
> @@ -257,9 +255,6 @@ static int apple_nvme_probe(struct udevice *dev)
>  	writel(((ANS_MAX_QUEUE_DEPTH << 16) | ANS_MAX_QUEUE_DEPTH),
>  	       priv->base + ANS_MAX_PEND_CMDS_CTRL);
>  
> -	writel(readl(priv->base + ANS_UNKNOWN_CTRL) & ~ANS_PRP_NULL_CHECK,
> -	       priv->base + ANS_UNKNOWN_CTRL);
> -
>  	strcpy(priv->ndev.vendor, "Apple");
>  
>  	writel((ANS_NVMMU_TCB_SIZE / ANS_NVMMU_TCB_PITCH) - 1,
> 
> -- 
> 2.55.0
> 
> 
