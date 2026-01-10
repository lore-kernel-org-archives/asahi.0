Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6467629D26E
	for <asahi@lists.linux.dev>; Sat, 10 Jan 2026 19:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768072440; cv=none; b=Upqt3i5eB21fPR4ICVii/YhuhmPsv5+nrL5WaQgkfhrSmuZa9Hmn10zNurDH7D/l++bnGQPirWOnNWm14UQCfnGxL6Fmc22lFlwexPu67d86TzCI45i7sN6z0qeyXGdWfmKvTU8u/7cn3fvPW5FQYNuifLnJPXedJmGc0Ql5y6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768072440; c=relaxed/simple;
	bh=h3Cx8tyqMYRHmyVodrWQGk+4ydYO1OeaY7ClZMbJTj4=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=NbzhPRbbp5dnx4Te5sWi6SD6GoxdSzsPFgpOlPkSDx1a8k0+hCsr3t61TgXzx5RDCR1uw4z8NMwpp+OoxK32h8iEHND3SF0VHQ5ZGIdUFIlgF8Ib08sLRKZscemPgLYCfP6Tp5fW+aL9E9WXKjnh0WTYQLYCTedRKYtT7ZMnz2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=Hxg+brja; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Hxg+brja"
X-KPN-MessageId: 7dc0aab4-ee58-11f0-89d8-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 7dc0aab4-ee58-11f0-89d8-00505699b430;
	Sat, 10 Jan 2026 20:13:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=FmNUNchhXYD2+HGqqF9G7SmeOdg9hoimFKhVXz1TY0c=;
	b=Hxg+brja1Yq1AotGMcJpsutRE3IJiAW1AvbAHVVrfZnHDg054U+JDakbduNFwXyW3xKlf6v0obOkT
	 L4JvVOy1TqiKV27boiEx04hjM9HiZ6iUX5S2QkmqUO1eAxBtclRpUU2n5nhtz8xEXtDhBV3x2jHaaK
	 p3OUy8XqLPxqmmw3W3ycf/eNYbX9QSfFrTo8ylJ2Jhj6RhSyGwKcTASne35BvraT70eGAY8HKSmuSp
	 kqd9Y2TtJQ+NSRm3zatNvAgDfNpzS17T4Sw49Y4Ni06naohLaj3sk0aJzQOso2OjfiPP14K4fLlQFW
	 fd/fBy8ZyGEXue7euKlPAguwNRKVr9w==
X-KPN-MID: 33|0wgyXI7qLuaXMgedYKB6L2q5i5jrAI6DXbreMhXV2EOGQOxotndPOSwmXPYn4fD
 q+Drw/KNN90oPmHwQVLbLuB65iN6tskP7AWg+9EN0hwY=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|UMkPAj4XxmK3uM9kKexgYdRbUSYEHWMRoVn2kRXu9wwft0chV616W058oCJ1jlP
 HnBUov/2rXYT1L5JpoHQmbw==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 7deda2c6-ee58-11f0-bff6-00505699772e;
	Sat, 10 Jan 2026 20:13:49 +0100 (CET)
Date: Sat, 10 Jan 2026 20:13:48 +0100
Message-Id: <87y0m58emr.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.denx.de, kettenis@openbsd.org, trini@konsulko.com,
	asahi@lists.linux.dev, j@jannau.net
In-Reply-To: <20260109-apple-defconfig-smbios-v1-1-16477009c034@jannau.net>
	(message from Janne Grunau on Fri, 09 Jan 2026 18:20:30 +0100)
Subject: Re: [PATCH] configs: apple: Enable SMBIOS / sysinfo
References: <20260109-apple-defconfig-smbios-v1-1-16477009c034@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Fri, 09 Jan 2026 18:20:30 +0100
> 
> Enable verbose SMBIOS table generation so that user space applications
> can use the SMBIOS table to provide details about the system. The
> desired information is chassis-type to determine whether the system is
> laptop.
> Adding the chassis-type property is proposed for the upstream device
> trees in the Linux kernel in [1].

Given that we have no real space constraint, should we add
CONFIG_CMD_SMBIOS=y as well?

> Link: https://lore.kernel.org/asahi/20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net/ [1]
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> I do not plan to update u-boot's in-tree device trees. The Linux device
> trees have almost reached feature parity. The main missing features are
> the USB Type-C ports (on track for next merge window) and the laptop
> keyboards. I think it makes more sense to close the feature gap and
> switch to upstream device trees instead of adding to the in-tree device
> trees.
> ---
>  configs/apple_m1_defconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/configs/apple_m1_defconfig b/configs/apple_m1_defconfig
> index 2d685da8c9eee2084b0144050e12c03c77e5184e..52672f59566dc0ebbb1c829cff6c7d8f798e7c50 100644
> --- a/configs/apple_m1_defconfig
> +++ b/configs/apple_m1_defconfig
> @@ -16,6 +16,8 @@ CONFIG_SYS_64BIT_LBA=y
>  CONFIG_APPLE_SPI_KEYB=y
>  # CONFIG_MMC is not set
>  CONFIG_NVME_APPLE=y
> +CONFIG_SYSINFO=y
> +CONFIG_SYSINFO_SMBIOS=y
>  CONFIG_USB_XHCI_HCD=y
>  CONFIG_USB_XHCI_DWC3=y
>  CONFIG_USB_XHCI_PCI=y
> @@ -25,4 +27,4 @@ CONFIG_VIDEO_FONT_16X32=y
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
