Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45117FBC4
	for <asahi@lists.linux.dev>; Tue, 16 Apr 2024 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713253817; cv=none; b=KJt0jWpOnlazTPlhz16Ql90pLNwudtJS0IVCdT/L61Hz5KSNFYrzPmY1ayoKQ6A2W1P5i7P2pYzHkZszsftYMK2gVRptk98fSX/WzRZN58ZL1dLF7cbTzrHzCwax0YAtu6Nlhldl/iS3GK5h5glkMoQTUTSlmg4HP2FGKbgQDwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713253817; c=relaxed/simple;
	bh=UT3qVsjuwDmtDA5y8tvHLJYY5aE5TH7TYgr9nZdjH5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDePQ0eox7u1dfmx3VBeTZlT/nF9rGLTYbU9AgDNABdwlB+iW8IRYe8DgyWHh1/6wbg4W/uZN+NXJfYjafZvQk7to05YCJc00nLny0/LaaKdcrX/lU3VmszA76tspFuZRMEJeHm1fr/iAeLUU6K8T89g6qo+rAr20XkXMCKapVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=DLnEUoNw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=e4LQdpgV; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="DLnEUoNw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="e4LQdpgV"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id AB12413800E4;
	Tue, 16 Apr 2024 03:50:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 16 Apr 2024 03:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713253812; x=1713340212; bh=i06W3/YhBG
	o2XQpS0UdV9A6jxZH3reUca7CzREeMejY=; b=DLnEUoNw/xJPfFD0haYnffcUS+
	JB8g83/tPMOgcMaUnsQpBU6qbMmTds5QcGmAttdMkgoxfVikaG9IoLQHGgVYvW9B
	b2WxF6lyiv+dbf7CmciIO1ziuPmslKuSovDilCsE3zVuH3jaRkc5z4kuBxyNWB2p
	jwz2IuGxz5lJmMMeiz9ZZISpy6O95V8ZU+nMS+zrQwTwqF5S8dTCNGM8WGKaArUH
	csU7WVY6zg5l4e3TK5XeKnNxa0MFO4R8L6QuCBdNBLTdb4SGQ7mHaKqsyN1htfHX
	0vqw2N8k14RIQUlBWJ13eRvOiewqlaRIr2m93Pg5AYX0LNtAZjrGjsZ0tH6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1713253812; x=1713340212; bh=i06W3/YhBGo2XQpS0UdV9A6jxZH3
	reUca7CzREeMejY=; b=e4LQdpgVn7bBcBCv78DcysLALl0fjSCvOdCj/IPWq0CG
	dMy/IEasRCGD1jrrmQi2CN2hlsmyyOE04ir74K5xkj8WDcoOdzkVcfOYc4jzpv/E
	EtrOwZHtsasi+c5cFhSeUwzcZTNK/5qvvadvJiYjWULBJFceIQ2FLkP3yYCq3Rwr
	nIZphcJt0NyctQZk3qw7knEvcicaAwQsfJhoCsv8f48ZzfFjzIz84C8oNlbHYFTz
	M7B2uB9frOe+2HkvzqhVVJQ9dtDCLfMAyhIBB0TBBXBAQKmjvTVa481t+QGsVEAT
	a/VY9xRwfoDam/aj9PWSFglPH2iyUlEQt+nu4t3ZKQ==
X-ME-Sender: <xms:tC0eZvGG_5oqcGh6-c_BB3XkBdKCG8LPhb906u-py2S2Z8Kd3AffiQ>
    <xme:tC0eZsUWKz5ppXZxOLUhsDucYp5dSXF6EF2-2VYITRM972dR57B7tU2ENW6oSmudR
    Xz_CkgOltoegv8crT4>
X-ME-Received: <xmr:tC0eZhIIyvm5P0MvDElaQdLjHFIE9B1qO7Y2a49S5aqut3ZoZsqnjkHsbY4MXJ3zN_IoAakA12EetuPY11H6BvLFgavztA0Qtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejfedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghn
    nhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnh
    epgfdvffevleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnh
    hnrghurdhnvght
X-ME-Proxy: <xmx:tC0eZtEHwS8KZ5Ki4qHrrFocrK2gq5F2BJ_CJlkTGHiG4auO6Kv9YQ>
    <xmx:tC0eZlXeJXFQeb1S9SHT2ukv9QeOFNMmvyhB9nkZhkDQg1ntXroa3A>
    <xmx:tC0eZoOkImBTgek4P0I6PMA08ul35vebtwXAqu4cj7U3VkMwh_uz4g>
    <xmx:tC0eZk1P78OcLcfCi2cdbzG31P4OsMCQvtXTowJF7f2FSYnysApB3w>
    <xmx:tC0eZnKKkIomclj5xDOIP9nY8mwFRswPWQfB4yT0Gm6B5zhXnw6act4w>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Apr 2024 03:50:11 -0400 (EDT)
Date: Tue, 16 Apr 2024 09:50:09 +0200
From: Janne Grunau <j@jannau.net>
To: Mark Kettenis <mark.kettenis@xs4all.nl>
Cc: kettenis@openbsd.org, trini@konsulko.com, sjg@chromium.org,
	u-boot@lists.denx.de, asahi@lists.linux.dev
Subject: Re: [PATCH 4/4] arm: apple: Switch to standard boot
Message-ID: <Zh4tsfA1UJWYWrlr@robin>
References: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net>
 <20240317-apple_config-v1-4-1b862bc140a9@jannau.net>
 <874jc2hff0.fsf@bloch.sibelius.xs4all.nl>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874jc2hff0.fsf@bloch.sibelius.xs4all.nl>

On Mon, Apr 15, 2024 at 04:24:51PM +0200, Mark Kettenis wrote:
> > From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
> > Date: Sun, 17 Mar 2024 15:54:50 +0100
> > 
> > From: Janne Grunau <j@jannau.net>
> > 
> > Use standard boot instead of the distro boot scripts.
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>
> 
> As per a somewhat recent discussion about this for the rockchip SoCs,
> I think we want BOOTSTD_FULL instead of BOOTSTD_DEFAULT.  Even though
> I think that BOOTSTD_FULL is a bit too chatty at the moment.

I noticed and added BOOTSTD_FULL to the defconfig downstream. To solve
the chattyness we could override BOOTCMD to "bootflow scan -b" in the
defconfig.

> That also solves the issue that BOOTSTD_DEFAULTS doesn't run the EFI
> bootmgr (which does happen with distroboot).  Although Heinrich has a
> diff to fix that.

I've seen but I think for interactive use BOOTSTD_FULL is still the
better choice. The full bootstd commands are helpful for booting from a
non-default partition.

I'll resend with BOOTSTD_FULL and will think whether to change BOOTCMD
in apple_m1_defconfig or in Kconfig. I don't think it makes much sense
to list the boot methods by default before boot.

Janne
