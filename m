Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF22071B32
	for <asahi@lists.linux.dev>; Mon, 15 Apr 2024 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713191163; cv=none; b=VeiIbPtfD+31TtRsRieGHsmHpsZgmPOYEVhzfZBexEXoLn/Rpd6w4DXc9gUzT6CQCnnZAi94+dsJD034StsfZsagVhyDrzLcjrVzxebU5mV9DG63ZQYy5GoQ0rBg8lCu0AoxLqNkQI/Wn2HYmAwEqNZmhUZxzIBXM+bDLXWsGE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713191163; c=relaxed/simple;
	bh=9uBFKK4sFcYemt44mjLmaNBlm+t5/97eHCiS+lii244=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=cQrY1ig+NwTNXw6LM1kBFiTq6+9wV+PYvWovrTmBIHivnCadSq0D/yJvXO2u05pqAVBt+/p7TXDMqU/fK+Y7nL0fym3ie0l41EoG/9qtC8Eym9MHRVE3/nSR4OJiykk/NG5lWRHag4eoBEScU95Kt9DRH/UC4TwpVkV+e86PI/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=a1GptqBE; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="a1GptqBE"
X-KPN-MessageId: bda76bb1-fb33-11ee-99a6-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id bda76bb1-fb33-11ee-99a6-005056999439;
	Mon, 15 Apr 2024 16:23:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=4egGE6y9Zm72AHZF7pctEsdpWMjrDWBhCYt5emihWHc=;
	b=a1GptqBEtdfYzMrWxnbGbmOYpbNnVU7Y2bEX95yKdjFQ70xNHEt2eaK54KfADu5hRey9mMFXYQHxL
	 z+E/rwoy7ZXBb1nEaAhF1O6nBqzZoRWN1HCzMGbIM9Fpw0VAb+WFncEnkKN88O2CBbxQcmziHSxMMT
	 MtYBfq5CoJiLLFImWbipAEo1fVRhAHw1vJYSrboUIbdiJPtcSehv/MubUkm71PODUz7a1bfE16q01F
	 jT2Gv4BYVgeevQrOPHxAx4KOsyLC9xwAW3UOKPBDxHMa/SlVoyj+hoL++8EiaOvlCatvMkugXdQxAw
	 OBhaazkWLv6aeefYTmRDpWEInh894dA==
X-KPN-MID: 33|zejDGefllvU3oKWQ20NPC7NZrBbQxGIUiujU+LUosYC/4fjxyW0NpLedv8mBlPb
 TTwAT6u/PRmVLNPSGTN1dOxpSfIdqLsMcpMYz34AKAPg=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|63iHYI0bpA36NnccfbFyC83oFnEyUnzrhIBebDeOWomldKGJ+FxBxmYlPVSYpBL
 wn8DU1Kh2Ul0983coapB7Sg==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id ebb40341-fb33-11ee-94ef-00505699b758;
	Mon, 15 Apr 2024 16:24:51 +0200 (CEST)
Date: Mon, 15 Apr 2024 16:24:51 +0200
Message-Id: <874jc2hff0.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: <j@jannau.net>
Cc: kettenis@openbsd.org, trini@konsulko.com, sjg@chromium.org,
	u-boot@lists.denx.de, asahi@lists.linux.dev, j@jannau.net
In-Reply-To: <20240317-apple_config-v1-4-1b862bc140a9@jannau.net> (message
	from Janne Grunau via B4 Relay on Sun, 17 Mar 2024 15:54:50 +0100)
Subject: Re: [PATCH 4/4] arm: apple: Switch to standard boot
References: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net> <20240317-apple_config-v1-4-1b862bc140a9@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
> Date: Sun, 17 Mar 2024 15:54:50 +0100
> 
> From: Janne Grunau <j@jannau.net>
> 
> Use standard boot instead of the distro boot scripts.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

As per a somewhat recent discussion about this for the rockchip SoCs,
I think we want BOOTSTD_FULL instead of BOOTSTD_DEFAULT.  Even though
I think that BOOTSTD_FULL is a bit too chatty at the moment.

That also solves the issue that BOOTSTD_DEFAULTS doesn't run the EFI
bootmgr (which does happen with distroboot).  Although Heinrich has a
diff to fix that.

> ---
>  arch/arm/Kconfig        |  2 +-
>  include/configs/apple.h | 20 ++------------------
>  2 files changed, 3 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 01d6556c42..ad89abde41 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1034,7 +1034,7 @@ config ARCH_APPLE
>  	select USB
>  	imply CMD_DM
>  	imply CMD_GPT
> -	imply DISTRO_DEFAULTS
> +	imply BOOTSTD_DEFAULTS
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
