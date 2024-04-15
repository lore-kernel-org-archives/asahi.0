Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E41E1E896
	for <asahi@lists.linux.dev>; Mon, 15 Apr 2024 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713189369; cv=none; b=X4dEjSLL1J4fpbt+5GahXtRR/ekIZcadYihZ1Uik784Er4Uu9ZLXQzDsjP1X2qI4kXh8WIL26jvR6lZYHcj6c/tjMhfM/R1xFvNCqpXUdFp7CeONZsluO3uTEp4D0mMZgvAXJagw4zZFtT63rtrAG4DJ8IhBVpA22PzT9R7++ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713189369; c=relaxed/simple;
	bh=z84m/Pp/Qqot8QFsb4absnFMv2Iut+pCrypQp9Z5KYo=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=iUk+tiCy22EVgoIBjuBHrSx+Y7+HDhvU0l6LCCvMjoFy6P0FUKAKE4U05AS30u46bUGgtoBRY1Y39RFOjtDUeI3Ppt0fzG8Nb+QqXmoCYIbI08MKaRN6bHR+d6oZqTfT+wZSIO488fSFFe/50tUbcipQXBNktFsprGDrV5MKaUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=SkimkQUk; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="SkimkQUk"
X-KPN-MessageId: 900e21ba-fb2f-11ee-b571-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 900e21ba-fb2f-11ee-b571-005056992ed3;
	Mon, 15 Apr 2024 15:53:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=F7i4+D5wx6h53OXDd8u/HmMA49vGCxp0DdUuKlS4l1s=;
	b=SkimkQUkenSxuhkCuI9aZDv4tUdHpJmZCMMYdm6y4E8GTPiuhtz6NPiEYNoSxXkPaDaVpp+Ofs9cS
	 x5veDODrL+nzs/4c0m+gj9BzCl6MPqoYJRb7RlheCKp+WNFXEA6rvy0BSscpKVNytxLn0eeyEoU4Vq
	 3+XBqNw1UI72BxUZxunIWFtAOYoJ9k9W0UhXT/gnyISZtNKk/i9mP+0jkX+cY2EFf6tq7mU0KW7JF0
	 8hDUlrQPFUlGxy4TleS9UjN6W9kKr/84Et9sXULGIXW0WZODLJkFvHrMyzuITO4enp/owNwMuOESWH
	 lHis6ll5I6Z8U8wXpIo3yddy5qhafeg==
X-KPN-MID: 33|+tRlo4EicGthqpH4CNUryr5VXNf0NDb9b/wsqDgskfA954N1n87i7Va4PsTMvgB
 NQsP6Js6reUW/pr2Ncveem6YlQvjZOAoXiar2KiSp8Gk=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|o2Ei4hbXENIp5s5K0TSmrfkGohMFifiogRxJIHB2Qj3m5Z/+Q2wj6O+cxAt8fd5
 rm6Z2XhXjBCdR7Jq/vKxR3w==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id be16545b-fb2f-11ee-9eb4-00505699772e;
	Mon, 15 Apr 2024 15:54:57 +0200 (CEST)
Date: Mon, 15 Apr 2024 15:54:56 +0200
Message-Id: <875xwihgsv.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: <j@jannau.net>
Cc: kettenis@openbsd.org, trini@konsulko.com, sjg@chromium.org,
	u-boot@lists.denx.de, asahi@lists.linux.dev, j@jannau.net
In-Reply-To: <20240317-apple_config-v1-3-1b862bc140a9@jannau.net> (message
	from Janne Grunau via B4 Relay on Sun, 17 Mar 2024 15:54:49 +0100)
Subject: Re: [PATCH 3/4] configs: apple: Enable CMD_SELECT_FONT and FONT_16X32
References: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net> <20240317-apple_config-v1-3-1b862bc140a9@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
> Date: Sun, 17 Mar 2024 15:54:49 +0100
> 
> From: Janne Grunau <j@jannau.net>
> 
> Apple devices have high DPI displays so the larger fonts are preferable
> for improved readability. This does not yet change the used font based
> on the display's pixel density so the standard 8x16 font is still used
> by default.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> ---
>  configs/apple_m1_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/configs/apple_m1_defconfig b/configs/apple_m1_defconfig
> index 31d966f0ab..c30aec7c55 100644
> --- a/configs/apple_m1_defconfig
> +++ b/configs/apple_m1_defconfig
> @@ -9,6 +9,7 @@ CONFIG_SYS_PBSIZE=276
>  # CONFIG_DISPLAY_CPUINFO is not set
>  CONFIG_DISPLAY_BOARDINFO_LATE=y
>  CONFIG_BOARD_LATE_INIT=y
> +CONFIG_CMD_SELECT_FONT=y
>  # CONFIG_NET is not set
>  CONFIG_SYS_64BIT_LBA=y
>  CONFIG_APPLE_SPI_KEYB=y
> @@ -19,6 +20,7 @@ CONFIG_USB_XHCI_DWC3=y
>  CONFIG_USB_XHCI_PCI=y
>  CONFIG_USB_DWC3=y
>  CONFIG_USB_KEYBOARD=y
> +CONFIG_VIDEO_FONT_16X32=y
>  CONFIG_SYS_WHITE_ON_BLACK=y
>  CONFIG_NO_FB_CLEAR=y
>  CONFIG_VIDEO_SIMPLE=y
> 
> -- 
> 2.44.0
> 
> 
> 
