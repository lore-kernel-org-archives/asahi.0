Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E0549D595
	for <asahi@lists.linux.dev>; Mon, 19 Oct 2026 09:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403962; cv=none; b=elpfST9t0NXmhWYKCZfDRYMNH1ip6h6O59jYXR0u+BK40KmU1j6Xwj6fTOeWgP3yunEpo4bcVlAHYBj77VQ6I9XPWYwo45OafxZfRySWa6sDg2h+RsutC1ZaDFg8bt4TTWeJ5bKoa+vD2tfvHyWZzNG3bSQgx5EOX28Ec8Oa+nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403962; c=relaxed/simple;
	bh=qXng/NRO7J+ctWSW8wGB48l3qUcjJ7U3gebaN+32eWU=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=B0X9eg6Jqfqs4x0f0xgXaL8v9RjfZYgh+RAJbQYZ4X2DffvYaY/xupu+2Sw6lhvT2wM2z7Q26rSDOvWY7jAGbTqwWK49vHfTTIC22oYIfbLoiwDTFz1jW7NgQfG8X/EtMBuJxLe5gfB5k1czDyJqDOc8KRnvtOKR/JLyLasKh3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=A/7K5J4c; arc=none smtp.client-ip=195.121.94.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="A/7K5J4c"
X-KPN-MessageId: b9d2bcf2-cba3-11f1-a05e-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id b9d2bcf2-cba3-11f1-a05e-005056abad63;
	Mon, 19 Oct 2026 11:59:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=721rIvHurXvzbsv3ReoZHJIOA30PI2Ctef7JDRu3I5Y=;
	b=A/7K5J4cd2ApTzLbyJKdZPQOGEUtI0W8Gm7xPjX8ecPuEaQfxGhymB49bQmaYW4//+AZcmO1l8WEk
	 rT+91YMHPX8wenZSNxRYHoJiBXPxmQpTPjNTrAFq1lM+tv73XAqHdzvkKm3ntQS4PXDfA1+hvQJ64i
	 bi4L8hKkYPfQskeB+dHN4dGdcMB5VqERK3pl21sFCnP+yzjXPLl+svh4cwsb9ODnfs0u+bDsaEVeED
	 IIhAd3n6KDhXTSzKQ2O/IBqSP/xhs7MXEFwxcHZ06BoA48txoR/cntJl3s6E94EUG4VXTilEaX/RkQ
	 sJeP/p6PK0pnpVGpm19E9A5ao0e2e8Q==
X-KPN-MID: 33|lT89nFkYjxKx1DAwBAr16pf1XzDFaOinkIbIlSIvSt6fEju8meFiBqp1PpIdXaX
 LYb6tlX50IDHOGpl9sWi15zubzxJQdvODR4HpReMKMvQ=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|pugamrQRUnMwWgJiCK6kVC0V6jmSKdmXfgCrduLNU3m0dScKgMXwoSx0ayi5Nkl
 sI0qhM6LRmaEgyix2e8ypyw==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id b95b93b6-cba3-11f1-bd32-005056abf0db;
	Mon, 19 Oct 2026 11:59:08 +0200 (CEST)
Date: Mon, 19 Oct 2026 11:59:07 +0200
Message-Id: <87a4oaypsk.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, kettenis@openbsd.org,
	trini@konsulko.com, ilias.apalodimas@linaro.org,
	sjg@chromium.org, asahi@lists.linux.dev, anshuld@ti.com,
	j@jannau.net
In-Reply-To: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net>
	(message from Janne Grunau on Sat, 10 Oct 2026 14:13:56 +0200)
Subject: Re: [PATCH 0/3] Apple M3 Pro, Max and Ultra support
References: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Sat, 10 Oct 2026 14:13:56 +0200
> 
> Hej,
> 
> this series adds memory maps of M3 Pro (T6030), M3 Max (T6032 and T6034)
> and M3 Ultra (T6032) to arch/arm/mach-apple/board.c and lists the SoCs
> as supported. It contains a missed documentation update for M3 (T8122).
> 
> The memory maps for the SoCs are becoming long (alomst 1000 lines) and
> Apple releases multiple new SoCs each year. I'd propose to move the
> arrays to headers (one per generation, i.e. "mem_map_m1.h", ...) meant
> to included only from mach-apple/board.c.
> I Can do that either as v2 of this patchset or when starting with the
> M4 generation.

I like that idea.  If you we keep it to a single memory per include
file, this would make it possible to diff the files to see the
differences?

> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (3):
>       doc: apple: Add Apple M3 as supported SoC
>       arm: apple: Add Apple M3 Pro and Max (t603[014]) support
>       arm: apple: Add Apple M3 Ultra (t6032) support
> 
>  arch/arm/mach-apple/board.c | 224 ++++++++++++++++++++++++++++++++++++++++++++
>  doc/board/apple/m1.rst      |  14 ++-
>  2 files changed, 236 insertions(+), 2 deletions(-)
> ---
> base-commit: 5508406582f6f7120dce0c4b3059819a41788db2
> change-id: 20260907-apple-t603x-support-9e77ba0bf855
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
> 
