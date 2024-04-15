Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4A21E896
	for <asahi@lists.linux.dev>; Mon, 15 Apr 2024 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713188793; cv=none; b=nbqdJE6KxugST8I/31RiI3+IW4ZpYMqgRata2Umj6XsfsUco7J9AD+psIVdO3w5L2pQyqqv8bxdt97S+owV67LTozMzxdx98RPpM3ZxcNd3ThQ8yUxvKPtZBfN/60iGIUdL8J1/Wi9AfjLYEDLNK1umUo/oRNijg0JOuW4BXwtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713188793; c=relaxed/simple;
	bh=9+LV73Q+4rJz10ddhKLL5L+/yG144PmcXtF50zM6BhI=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=upACoRq2CbkKT4/EWFgr29hmo129knDFie1hTx404SwaqPCASxf21zS5eVspckurAC5kkU5gfofJ4QHpfi+8VMwz0LzYfE3HlDfXZdzNFKBp0QdOsp66xb51h3DKzo/s2gFHaXitbQVYjD+5bTUmV749PfeA1N/0kLTRX8g1NKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=To7BWjMG; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="To7BWjMG"
X-KPN-MessageId: 3b307acf-fb2e-11ee-9a83-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 3b307acf-fb2e-11ee-9a83-00505699b430;
	Mon, 15 Apr 2024 15:44:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=i3WmzlMMCfzRk3qHLZW1TVz1ONvMbptMvltpQwYNN9Q=;
	b=To7BWjMGRlLRql9Qv0C2cff+bkZ/QrS3XHOFbPrbGrh9e+FoB3HsPKhzIyOkwjUN25w4qyY+4K+54
	 L44Xo0xfSPO+5UuXZ8NfuM3D2I5WXHFx3kf29T3H0luc/f8nrzzEoFG+XduxoG+SsQMqwq/VWQPm6I
	 eWXBhWqJlSFzWeV8HI9nWZJSYGYQBRD/Pti2QUI/NjSKYLgbl/+PChdr5Cc7zJjtdGnd+JScIm810E
	 aj6Twx7bDSwffPqGPZbtGxTdkWWnX5MbeLhtoDgXg36m9gPTqleZmA3a4dCZrmTQHE/uZejH4PcPeV
	 pGTnWC+Aa6wpHz8Ye4fIVfavvfYNcKQ==
X-KPN-MID: 33|FsjQH1OiWUy1X4lIrzF+q232GLLj0K8BSDUw4SCTKRAVNBcFzF4SsFi7fIgVpjn
 INnkaAfosYiRagvUf5O5/cE91qaK7Vlwo7NIf35de0Oc=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|pY67LYVQJoIUVn/0T8gWZUhJaiZ3V6P0sbNu6K9UFVp2kxDsDdTiUtcbYug3/+D
 ho7UwicgTfFTAPrwDzbEZ9A==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 65cca86a-fb2e-11ee-94ef-00505699b758;
	Mon, 15 Apr 2024 15:45:19 +0200 (CEST)
Date: Mon, 15 Apr 2024 15:45:18 +0200
Message-Id: <878r1ehh8x.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: <j@jannau.net>
Cc: kettenis@openbsd.org, trini@konsulko.com, sjg@chromium.org,
	u-boot@lists.denx.de, asahi@lists.linux.dev, j@jannau.net,
	marcan@marcan.st
In-Reply-To: <20240317-apple_config-v1-1-1b862bc140a9@jannau.net> (message
	from Janne Grunau via B4 Relay on Sun, 17 Mar 2024 15:54:47 +0100)
Subject: Re: [PATCH 1/4] apple_m1_defconfig: Turn on CONFIG_SYS_64BIT_LBA
References: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net> <20240317-apple_config-v1-1-1b862bc140a9@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
> Date: Sun, 17 Mar 2024 15:54:47 +0100
> 
> From: Hector Martin <marcan@marcan.st>
> 
> This makes USB HDDs >2TiB work. The only reason this hasn't bitten us
> for the internal NVMe yet is the 4K sector size, because the largest SSD
> Apple sells is 8TB and we can handle up to 16TiB with that sector size.
> Close call.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> ---
>  configs/apple_m1_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/apple_m1_defconfig b/configs/apple_m1_defconfig
> index e00d72e8be..31d966f0ab 100644
> --- a/configs/apple_m1_defconfig
> +++ b/configs/apple_m1_defconfig
> @@ -10,6 +10,7 @@ CONFIG_SYS_PBSIZE=276
>  CONFIG_DISPLAY_BOARDINFO_LATE=y
>  CONFIG_BOARD_LATE_INIT=y
>  # CONFIG_NET is not set
> +CONFIG_SYS_64BIT_LBA=y
>  CONFIG_APPLE_SPI_KEYB=y
>  # CONFIG_MMC is not set
>  CONFIG_NVME_APPLE=y
> 
> -- 
> 2.44.0
> 
> 
> 
