Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89D954763
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 17:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767981025; cv=none; b=tdfuxuvR7C/Bbsw7z8rLpQGkgNCSsoyO674smXpqArTdSjvpkRGf7/9szjwqMqkakhaYG3RHNj40vnlZYZyJaHYBSSa7KHqaTKC8CdpFZcFrDjPXLZAD3xW3BD0zVg3Fv9LM+xigtt5CBP0UNyD2U3vnIiI58SqNDocAPMLZLqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767981025; c=relaxed/simple;
	bh=Z7WNTsFLQ0B/DEZIDmfqoR1nkzU4/J/bjjm/MMDKVPc=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=p2wEPdYpfG7XUiBmkey0eAWYtOoU6sT+89M35YtE99ijP1YFPZLbieAhbiho3u79BG7i6xCq4ag55odRNbNYmAG+X7QIyydGi9V4KWKuZnnM9UGaajs8UnNHk6Sj+RrmVhXH1iT0iV/VJTJBlfFEF74AXq/yY1oyqLy4T1nXWwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=MgsAL8WY; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="MgsAL8WY"
X-KPN-MessageId: 816fa22b-ed83-11f0-8fef-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 816fa22b-ed83-11f0-8fef-005056999439;
	Fri, 09 Jan 2026 18:49:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=bw0SnJemN8vlRdVnFJHe940LY/ZQwWMmL8qdJw3GKeI=;
	b=MgsAL8WYHTzUiSyPt6OllR+IY0o90Qam/Uhv1ggAtMvnoBQ+UvKjsGLur4RNkc+CqxhBbovjoz3K5
	 EVkISFCCtLQ9FuJnIw8XyFEMdpTERc+iqSOIgeJBQ5bcoRRm6L4NEnuX9Zwao/lyeTNf3V3V5BKkra
	 U1h25fE1UQ2qnwrX6x0yZOjNiOKVv3BXGGQ1Rx60CC7LU6Tpbx6KZucrs0kiW2lO0Qe87KqWTZYzpd
	 hi1nQqHag4i5ycYtJhd5sTmBuid5xOt+0RnTfEYyP6DdMTJpnaGxBQi3Hv9R/U0Jmh8xdaIHnHoECr
	 An8C2iVOgueqeY14QfFSGWBSP/13Www==
X-KPN-MID: 33|VVDSZ+0jHKd1FmhjOV2xDnLeDasiUteuVbDNhk3T1sdD6bVgMng8jMvD++JkMEs
 5N2lxe2P+O3qMva5vIcjRQS0bsDIDEhFMC3dJA3TWTk4=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|gXdr302CMm4hyLOW8EnVueqrKBFT0CAPZXuiSZ9vTnZvf9DdkFdIv1aO5UVURTL
 Rt8pZ+Mxne0XmE4nPQdcSwQ==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 81a4ba5f-ed83-11f0-9bf7-00505699d6e5;
	Fri, 09 Jan 2026 18:49:12 +0100 (CET)
Date: Fri, 09 Jan 2026 18:49:11 +0100
Message-Id: <878qe6ad7s.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Tom Rini <trini@konsulko.com>
Cc: j@jannau.net, u-boot@lists.denx.de, kettenis@openbsd.org,
	asahi@lists.linux.dev
In-Reply-To: <20260109173351.GF3416603@bill-the-cat> (message from Tom Rini on
	Fri, 9 Jan 2026 11:33:51 -0600)
Subject: Re: [PATCH] configs: apple: Enable SMBIOS / sysinfo
References: <20260109-apple-defconfig-smbios-v1-1-16477009c034@jannau.net> <20260109173351.GF3416603@bill-the-cat>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> Date: Fri, 9 Jan 2026 11:33:51 -0600
> From: Tom Rini <trini@konsulko.com>
> 
> On Fri, Jan 09, 2026 at 06:20:30PM +0100, Janne Grunau wrote:
> 
> > Enable verbose SMBIOS table generation so that user space applications
> > can use the SMBIOS table to provide details about the system. The
> > desired information is chassis-type to determine whether the system is
> > laptop.
> > Adding the chassis-type property is proposed for the upstream device
> > trees in the Linux kernel in [1].
> > 
> > Link: https://lore.kernel.org/asahi/20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net/ [1]
> > Signed-off-by: Janne Grunau <j@jannau.net>
> 
> Reviewed-by: Tom Rini <trini@konsulko.com>
> 
> > ---
> > I do not plan to update u-boot's in-tree device trees. The Linux device
> > trees have almost reached feature parity. The main missing features are
> > the USB Type-C ports (on track for next merge window) and the laptop
> > keyboards. I think it makes more sense to close the feature gap and
> > switch to upstream device trees instead of adding to the in-tree device
> > trees.
> 
> This sounds like a good plan to me, thanks!

Yes, it is probably time to remove the in-tree device trees for these
devices.  They were never actually used in the build anyway.  Just
added because a maintainer insisted on having them in the tree.  But
now that we have the upstream device trees in the tree, the in-tree
ones can go.
