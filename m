Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8CF9CD
	for <asahi@lists.linux.dev>; Fri, 19 Apr 2024 08:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713514580; cv=none; b=DwdMk0BIRM873QAoAEThxN0QOSb8HDOacytYzf0okqW8KhDWO6Zrl+DJo+6lTVXuZUm3wTLRUzcJVZJFSwX/wEp3GdHmEshsqUNlUKWI13tPtoJd7AxLQmh4wf93o2pUNIsoqrWxv62OwHNN+DbvIlg1RD/Lei+U6vtzGDwx7S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713514580; c=relaxed/simple;
	bh=N1hlbrxTkaVbXo3idPQdJNW+NZJ6Z2N+WLHs0y7lXpc=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=YtqPqCVJOj4ZSanZqhaIV0g+in7FQfQtvsfdFUXENKxTqQ0u9JguOdZLQi/u2p2Dgu39+qxQjs1bV4YMHAllzB6OxmKLuM8oxrv5yMAe6UqVDD6KBEj3/Y1C3G6yh/xIFpHpbkbKGcdR7si9WfxzRy6hPqEbLLOlRdvpqkwpsjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=qlrxiviJ; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="qlrxiviJ"
X-KPN-MessageId: e0575e9f-fe24-11ee-99a6-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id e0575e9f-fe24-11ee-99a6-005056999439;
	Fri, 19 Apr 2024 10:14:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=pplZ9RErv6AW/ydgJmm94w6lc6ntPvrVee4n6RngUp4=;
	b=qlrxiviJIiypniLhPGyWeD7Qw+fCnp3ZtLPpf1+gUMGxOLZ5qj5b/sJlDou2y1CmusoJyePFozeV/
	 prMeGSeZm+cZ1hNreNrMoz2qD7FQLUByOBtsLDJCSxumgzV09ciJ1wLU/fbZahb+uJegINHFvrw94g
	 4Fk8tuKioQJb4nWxsW0yzWBCM0FzuL2boSHuKOvgDA51PhXJ6cOKZrWXmDN93N83zE6QZn2swa+B19
	 ypamPSUSq5xaVGKd010gQiVvlRCE4SCDWSk/S3xouxwSi5l/o+TdvFnOUWjtHSPPQ1RMYllaDsUO8r
	 iyN30MESuZQ7q0bQ+vxOtrFSHBJhocQ==
X-KPN-MID: 33|xeV+d9U+pJlCagBcalF3fXCl8t3PcnOKTW1z9e/wdIC8JDSZ2hOpSk5BVqC/hAB
 JgDH6AeFyFP1oBBb3RxRFYXkELwlmtiPnc2OfGgIsd9w=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|dcLmLr4bjHVr6brwIRQ+TonRSTZPutMt7gQzZqntbO1YrOFv6kFugXk8Q0UsaGY
 9E/tVPLxOdX++EkRoHptrag==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 1396ea6e-fe25-11ee-9506-00505699b758;
	Fri, 19 Apr 2024 10:16:09 +0200 (CEST)
Date: Fri, 19 Apr 2024 10:16:09 +0200
Message-Id: <87r0f1g43a.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: j@jannau.net
Cc: kettenis@openbsd.org, trini@konsulko.com, sjg@chromium.org,
	u-boot@lists.denx.de, asahi@lists.linux.dev, j@jannau.net
In-Reply-To: <20240418-apple_config-v2-4-7e5c6b9a9db3@jannau.net> (message
	from Janne Grunau via B4 Relay on Thu, 18 Apr 2024 21:00:28 +0200)
Subject: Re: [PATCH v2 4/5] arm: apple: Switch to standard boot
References: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net> <20240418-apple_config-v2-4-7e5c6b9a9db3@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
> Date: Thu, 18 Apr 2024 21:00:28 +0200
> 
> From: Janne Grunau <j@jannau.net>
> 
> Use standard boot instead of the distro boot scripts. Use
> BOOTSTD_FULL instead of BOOTSTD_DEFAULTS for easier interactive use.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> ---
>  arch/arm/Kconfig        |  2 +-
>  include/configs/apple.h | 20 ++------------------
>  2 files changed, 3 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 01d6556c42..9b83b2e6f8 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1034,7 +1034,7 @@ config ARCH_APPLE
>  	select USB
>  	imply CMD_DM
>  	imply CMD_GPT
> -	imply DISTRO_DEFAULTS
> +	imply BOOTSTD_FULL
>  	imply OF_HAS_PRIOR_STAGE
>  
>  config ARCH_OWL
> diff --git a/include/configs/apple.h b/include/configs/apple.h
> index a70440b3ad..1e08b11448 100644
> --- a/include/configs/apple.h
> +++ b/include/configs/apple.h
> @@ -9,26 +9,10 @@
>  	"stdout=vidconsole,serial\0" \
>  	"stderr=vidconsole,serial\0"
>  
> -#if IS_ENABLED(CONFIG_CMD_NVME)
> -	#define BOOT_TARGET_NVME(func) func(NVME, nvme, 0)
> -#else
> -	#define BOOT_TARGET_NVME(func)
> -#endif
> -
> -#if IS_ENABLED(CONFIG_CMD_USB)
> -	#define BOOT_TARGET_USB(func) func(USB, usb, 0)
> -#else
> -	#define BOOT_TARGET_USB(func)
> -#endif
> -
> -#define BOOT_TARGET_DEVICES(func) \
> -	BOOT_TARGET_NVME(func) \
> -	BOOT_TARGET_USB(func)
> -
> -#include <config_distro_bootcmd.h>
> +#define BOOT_TARGETS	"nvme usb"
>  
>  #define CFG_EXTRA_ENV_SETTINGS \
>  	ENV_DEVICE_SETTINGS \
> -	BOOTENV
> +	"boot_targets=" BOOT_TARGETS "\0"
>  
>  #endif
> 
> -- 
> 2.44.0
> 
> 
> 
> 
