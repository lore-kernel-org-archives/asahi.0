Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768892222D1
	for <asahi@lists.linux.dev>; Tue, 20 Jan 2026 15:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923790; cv=none; b=Pq2x5gNlIX454yajtJhdSTWPHnXxpIu7QW/bC9UaPaQg98yhYMuzhrZejbResRbhPYwbfY5rX/0hN/pa9e+1XDLuT0/3zp9+/tPYNE0r3/qLk2r1EzShPB485/h8qOVXxrbAojHrrkrBg4EOCx3wzuL9n6qcv8Rkdmk+citiI80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923790; c=relaxed/simple;
	bh=7TdqoT0rGpuw7LPs8c/RsCOBXZvBI6DpmC1g3shR4Bg=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=LJg6CJjuO2T0LfUa+CGs8uqDixhaOyBpwVlJAR2fagTw0Z0y+bOWV/IDsIqooEsLzU/gVqpZjzTOsJYJwr5iILHcRNwCZjq8edagU4siLlLHxafw42jyUbN0QgTq4SWzwXtdRGmWjtOw/au1bXmauQq7bfewQPyzry8l34bOgx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=uKuw7+VX; arc=none smtp.client-ip=195.121.94.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="uKuw7+VX"
X-KPN-MessageId: b18e0fc1-f616-11f0-af3f-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id b18e0fc1-f616-11f0-af3f-005056994fde;
	Tue, 20 Jan 2026 16:42:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=b5GmnV5hH19TmEjM1zmElt3ODM0+Qg2la/Lz52igLHI=;
	b=uKuw7+VX+XAOxSIwh+yDhGsLnjyPcwPNLxBe434kozH4ZOejc4zV0daKknMbF5/LvzWvUbGumlaBl
	 FWER1J00+yz8UAhExoVCeEA7Ztp0XVdIWkHP+19lXGIfEyYHs88Jj5ZGidg4qGwYT71taFLt+j+iQO
	 ocSJNil0scXuYofrbj7fpIT+0szZzC+20XgQIlTwWC3X90Kp7vqS8N7S7/p7DURErQFBnmYMDrhyXp
	 P7QPWd5aAqt7TFZ9PqQouIuUD3y+BvwkUx8G+mv8Wk2rk4iwrdG5/syIvwtmtLsWsPMYDMrXc9+EHK
	 6idjAYlk8zrjgajxLU9RdEKkcR3498Q==
X-KPN-MID: 33|atlskeW/izMYHWvIo+6pWnStY/q39cTzPH8wM+5euOKxDTJ/81Vjt+gR7+p2Rwf
 +9L6vKa1Z6dFufWZWVRCJ16tyt2qTRmmh9y0DQaYCtFI=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|6eQgfqsfS30NSK5YWBYH25wpwpuo2jlrUC9J/f2pLNzn8n3zFC8Ncbcsdy6z/0O
 LHjhHLdzB1azBoNtKZVBRVw==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id b0f3fa70-f616-11f0-8d40-00505699b758;
	Tue, 20 Jan 2026 16:42:57 +0100 (CET)
Date: Tue, 20 Jan 2026 16:42:56 +0100
Message-Id: <87ikcw70jj.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.denx.de, kettenis@openbsd.org, trini@konsulko.com,
	asahi@lists.linux.dev, j@jannau.net
In-Reply-To: <20260116-apple-defconfig-smbios-v2-1-861d707b466a@jannau.net>
	(message from Janne Grunau on Fri, 16 Jan 2026 14:44:46 +0100)
Subject: Re: [PATCH v2] configs: apple: Enable SMBIOS / sysinfo
References: <20260116-apple-defconfig-smbios-v2-1-861d707b466a@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Fri, 16 Jan 2026 14:44:46 +0100
> 
> Enable verbose SMBIOS table generation so that user space applications
> can use the SMBIOS table to provide details about the system. The
> desired information is chassis-type to determine whether the system is
> laptop.
> Adding the chassis-type property is proposed for the upstream device
> trees in the Linux kernel in [1].
> Enable CMD_SMBIOS as debugging aid as the platform can easily deal with
> large u-boot binaries.
> 
> Link: https://lore.kernel.org/asahi/20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net/ [1]
> Reviewed-by: Tom Rini <trini@konsulko.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> ---
> Changes in v2:
> - Added CMD_SMBIOS as suggested by Mark
> - Added Tom's Reviewed-by: trailer
> - Link to v1: https://lore.kernel.org/r/20260109-apple-defconfig-smbios-v1-1-16477009c034@jannau.net
> ---
> I do not plan to update u-boot's in-tree device trees. The Linux device
> trees have almost reached feature parity. The main missing features are
> the USB Type-C ports (on track for next merge window) and the laptop
> keyboards. I think it makes more sense to close the feature gap and
> switch to upstream device trees instead of adding to the in-tree device
> trees.
> ---
>  configs/apple_m1_defconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/apple_m1_defconfig b/configs/apple_m1_defconfig
> index 2d685da8c9eee2084b0144050e12c03c77e5184e..1ce69f2882a1baf8d3713c18f8fe6b3fe5e2ae57 100644
> --- a/configs/apple_m1_defconfig
> +++ b/configs/apple_m1_defconfig
> @@ -10,12 +10,15 @@ CONFIG_SYS_PBSIZE=276
>  # CONFIG_DISPLAY_CPUINFO is not set
>  CONFIG_DISPLAY_BOARDINFO_LATE=y
>  CONFIG_BOARD_LATE_INIT=y
> +CONFIG_CMD_SMBIOS=y
>  CONFIG_CMD_SELECT_FONT=y
>  CONFIG_NO_NET=y
>  CONFIG_SYS_64BIT_LBA=y
>  CONFIG_APPLE_SPI_KEYB=y
>  # CONFIG_MMC is not set
>  CONFIG_NVME_APPLE=y
> +CONFIG_SYSINFO=y
> +CONFIG_SYSINFO_SMBIOS=y
>  CONFIG_USB_XHCI_HCD=y
>  CONFIG_USB_XHCI_DWC3=y
>  CONFIG_USB_XHCI_PCI=y
> @@ -25,4 +28,4 @@ CONFIG_VIDEO_FONT_16X32=y
>  CONFIG_SYS_WHITE_ON_BLACK=y
>  CONFIG_NO_FB_CLEAR=y
>  CONFIG_VIDEO_SIMPLE=y
> -# CONFIG_SMBIOS is not set
> +CONFIG_GENERATE_SMBIOS_TABLE_VERBOSE=y
> 
> ---
> base-commit: 127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3
> change-id: 20260109-apple-defconfig-smbios-a37802021452
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
> 
