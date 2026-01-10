Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CE418DB37
	for <asahi@lists.linux.dev>; Sat, 10 Jan 2026 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073356; cv=none; b=sZUgbrP6mDQebwW/YuutGuaBIhuO7r1hWKhmP0TEQO1jMThE9i0pcND6j0TBQbvnEdGRykTLrZVYNPYn2OYJcN97uT3Rp+1W4f0XqmIzQ9kB00MOY+sl1a3btiK4XnkxTtDVCD2RGuPUctEngKUJtAOtAVvQNKLscacIG16fsCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073356; c=relaxed/simple;
	bh=JBGdeOCbaRNuG0HHSVLLpkGtcCuDetqvTak5QOTmuPs=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=JOpyrKfHpP0eNqA9ZQGFhUA1YLgnzRS0B+EaF0rLPYt1kCFJ5XQn6YZeXgGXd4Wo3KaBfea7Y1uizuX4/qm9Wlsx/B+zsflv5SMkT6wXXdvXyjrlj9wdcYRwWgPTLGKs2OBivAjHSvrwOdOcOOzoZrSUUHw8TG2cmpeHWsPIDpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=Wj0DLwWE; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Wj0DLwWE"
X-KPN-MessageId: a474ca67-ee5a-11f0-89d8-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id a474ca67-ee5a-11f0-89d8-00505699b430;
	Sat, 10 Jan 2026 20:29:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=is7sIcZRkTvchgsj8/mIfcfByBbJFYN6C9fw8XLk4g0=;
	b=Wj0DLwWEFS5mmUCsqnYqN+SaorcHTmVM8qXJK7L/fqdQ4vqEUCQ5yg1zARDsTPL2ZATIenhi28xhb
	 u8m76KKQ3nTD5r29Y8Ev2zjKKGO5pLWAo1QfQb/CXBXvRDPOM+Sh0falOdNN5u1+UHsP7i4KizDw25
	 qKn+99BNTdtBR3xfJgds78xh40De1+iuzf7qXuuTqPOHmXBiqniMBvOle+Lsexu+RJTnRqVbcTpTWG
	 l47IPADLkKwy0i/gckYCUBAcHwevaK5nWeR38RoFx/qouVO53JkcEn6WhPVEsumRfhd1G/1K7tx4FT
	 a8H/E7D+2j8q8NtZ7PZYeJM6oYVkSfQ==
X-KPN-MID: 33|Pw5kkYYL7KLJWTemvwpNCL+nwc8UQKEJ+zEvHx+ySDF2UwPvx4nXwDaDmu7al9v
 i45v5O1fkPMHzmzP91yZkHQ7yrftRiB+gbZ8xu6yyIn8=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|T+ig73/TxdepUA0w2qY46nMUB99zpIVBWHTJ36bgyTIm/enBlT6O+kwXVKkRI2i
 8FXKQYOgifa3HaovjFYNx2Q==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id a4a4a505-ee5a-11f0-bff6-00505699772e;
	Sat, 10 Jan 2026 20:29:13 +0100 (CET)
Date: Sat, 10 Jan 2026 20:29:12 +0100
Message-Id: <87v7h98dx3.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.denx.de, bmeng.cn@gmail.com, marex@denx.de,
	trini@konsulko.com, asahi@lists.linux.dev, j@jannau.net
In-Reply-To:
	<20260109-usb-dwc3-apple-compat-linux-v1-1-b6e255b5e5af@jannau.net>
	(message from Janne Grunau on Fri, 09 Jan 2026 20:41:36 +0100)
Subject: Re: [PATCH] usb: xhci-dwc3: Add "apple,t8103-dwc3" compatible
References: <20260109-usb-dwc3-apple-compat-linux-v1-1-b6e255b5e5af@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Fri, 09 Jan 2026 20:41:36 +0100
> 
> The Linux support for dwc3 on Apple silicon SoCs switched to using a
> apple specific glue driver [1] that uses it own compatible string. The
> glue driver handles platform specific requirements on the interaction
> between dwc3 and the USB2/USB3 PHY and reset-controller for USB role
> switches and plug events.
> To keep USB working as before when the nodes still carried "snps,dwc3"
> as compatible add "apple,t8103-dwc3" to the of match table. Eventually
> it is probably advisable to add a dwc3-apple glue driver and write code
> for the currently empty Apple Type-C PHY driver in phy-apple-atc.c.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> Link: https://lore.kernel.org/asahi/20251015-b4-aplpe-dwc3-v2-0-cbd65a2d511a@kernel.org/ [1]
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/usb/host/xhci-dwc3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/xhci-dwc3.c b/drivers/usb/host/xhci-dwc3.c
> index e3e0ceff43e6abdb8643f265819eff28c2c802f4..ba42c3247654b7d9272c42ea9c4cf0bd9082915e 100644
> --- a/drivers/usb/host/xhci-dwc3.c
> +++ b/drivers/usb/host/xhci-dwc3.c
> @@ -238,6 +238,7 @@ static int xhci_dwc3_remove(struct udevice *dev)
>  
>  static const struct udevice_id xhci_dwc3_ids[] = {
>  	{ .compatible = "snps,dwc3" },
> +	{ .compatible = "apple,t8103-dwc3" },
>  	{ }
>  };
>  
> 
> ---
> base-commit: 127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3
> change-id: 20260109-usb-dwc3-apple-compat-linux-821ee75bec48
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
> 
