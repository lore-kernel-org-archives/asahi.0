Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517500;
	b=Z7VoHfPn/2gryyxMFmlPygoERnshMmJHtt5QAmKZfMEDheQBetVcS69MSFpKt74gz98a
	 D5B4mPaTY57QgUUuKd3NWsL2j1plhmyMJCWWxwhI6XuAM7toDTmqoVeMYpJ8aJEcqUsTI
	 ZBv1gi1Gf49YZNWJ3LOzWmJ8j8kd6PPrmqYN9vtrQ7trG7RYxuhirOKg9eU+wzEk/TViW
	 DWt7nyb4LJYUQgMPbGr3BNLbJeMhk+IZL2T/2pjGFdVBwg7JL9PnnNt5VozhF2SduJOdm
	 5tCSLlRkrLPS4auyRL+OkMPUSWfZYppvOFrasocpuJxgPTydN8gQWHoQTR8t98flxrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517500;
	h=DMARC-Filter:X-KPN-MessageId:Received:DKIM-Signature:X-KPN-MID:
	 X-KPN-VerifiedSender:X-CMASSUN:X-Originating-IP:Received:Date:
	 Message-Id:From:To:Cc:In-Reply-To:Subject:References;
	bh=8PnrdA9CkQmagf+bj49jlPq/UIvZlOkQcoS9Tv3eHpo=;
	b=tbnWE5XyUwwXS1et4zAiIHdwFFJF+2cMMeL5hqB/gLsj/YYn0CwERw7l6Ehyi7ortbP6
	 LjXL2hmigiyxlo/jAGxUno2abwLMAl+UuYdK8DuHpDbNgq4rQCkt7dbydbedf4ZNJSaEW
	 QqYf9CRRjFGdgxL25govlunVrdp85unO5ueXUVrg9QByAlU7pUoXymn8zc2Hg4909SfgU
	 rdnGrFwCJAk8Pl162PZlY7tNX1OulXAb88UQlpPZlavdEXm5O2U+/hCiSIERxpB2+3pEL
	 EmrYDGlybGRN6ZVZo/NXwJrrv4W9lhDkpBzzbO+cP7s33VSxM5qnbh0Rb+3hizoud0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=srU+T3Wa;
	arc=none smtp.remote-ip=195.121.94.167
Received: from ewsoutbound.kpnmail.nl (unknown [195.121.94.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB76D606A321
	for <asahi@lists.linux.dev>; Tue, 24 Nov 2026 10:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB76D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=srU+T3Wa
X-KPN-MessageId: 00ed7dd2-e7f5-11f1-a695-005056abbe64
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 00ed7dd2-e7f5-11f1-a695-005056abbe64;
	Tue, 24 Nov 2026 11:51:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=8PnrdA9CkQmagf+bj49jlPq/UIvZlOkQcoS9Tv3eHpo=;
	b=srU+T3WaxwX9Obf7H0yVNWP9wuf9FEtz2aZylIk3equVqU265x5cc3Cc5c1OuJei5kZAOqeK+a2S8
	 6TBLIPWdsS3oxCzwjVvYeBvrpXLAxR8dYVjLCoQ+7J2hfcUk62LZGdQSUyfTWDu4njkoMLvTKPKVgo
	 b3OuMUlgiQqEae2UPazoYGB2wK6SltC/TE252SN5VJYDzC9UfdNNOCXbAL5kKMgsT9md7x8ErfTHW0
	 rA5WlRE5p1+6fFm6ZilibmoEMr7g3p+veMCMb3AZPkdi7C/gFW8CEhZUBqY7rXa/iPuKjS9GpUJaIl
	 MHSpyllPuCMzGkRc2qCVJE8yEtPw5iQ==
X-KPN-MID: 33|LOsFBmHg4UW++MH8vVFCtTZlgT3Fopg7c8IES4Toyg09xn1srapxKpRPSQjvYLH
 YI1mxa6dGX0LRS+3g5i+fiLNNMIQ0skh0VMsq7Cm+zLE=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|YkhUKRsf3b5/lJUIh5lJ28hzjSnTKl60PRHLOaLAB94Ng5sIKyOjTJh9ehb7uIO
 EsNXl/A/PduolADcZXRYNqg==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 007310ee-e7f5-11f1-87ba-005056ab7447;
	Tue, 24 Nov 2026 11:51:29 +0100 (CET)
Date: Tue, 24 Nov 2026 11:51:28 +0100
Message-Id: <87h5h6wlhr.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, kettenis@openbsd.org,
	trini@konsulko.com, ilias.apalodimas@linaro.org,
	sjg@chromium.org, asahi@lists.linux.dev, anshuld@ti.com,
	j@jannau.net
In-Reply-To: <20261120-apple-t603x-support-v2-0-606b4f5fadc5@jannau.net>
	(message from Janne Grunau on Fri, 20 Nov 2026 19:53:06 +0100)
Subject: Re: [PATCH v2 0/4] Apple M3 Pro, Max and Ultra support
References: <20261120-apple-t603x-support-v2-0-606b4f5fadc5@jannau.net>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list

> From: Janne Grunau <j@jannau.net>
> Date: Fri, 20 Nov 2026 19:53:06 +0100
> 
> Hej,
> 
> this series adds memory maps of M3 Pro (T6030), M3 Max (T6032 and T6034)
> and M3 Ultra (T6032) and lists the SoCs as supported. As proposed in v1
> and supported by Mark move the memory maps to their own file
> 
> Add the missing documentation of M3 (T8122) support.
> 
> based on v2026.10 but applies without conflicts on next.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

For the entire series:

Acked-by: Mark Kettenis <kettenis@openbsd.org>

> ---
> Changes in v2:
> - fixed t8112 vs. t8122 typo in documentation
> - moved mem maps to separate header files in arch/arm/mach-apple/memmap
> - added Mark's Acked-by
> - Link to v1: https://patch.msgid.link/20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net
> 
> ---
> Janne Grunau (4):
>       doc: apple: Add Apple M3 as supported SoC
>       arm: apple: Move memory maps to separate files
>       arm: apple: Add Apple M3 Pro and Max (t603[014]) support
>       arm: apple: Add Apple M3 Ultra (t6032) support
> 
>  arch/arm/mach-apple/board.c        | 747 +------------------------------------
>  arch/arm/mach-apple/memmap/t6000.h | 104 ++++++
>  arch/arm/mach-apple/memmap/t6002.h | 177 +++++++++
>  arch/arm/mach-apple/memmap/t6020.h | 128 +++++++
>  arch/arm/mach-apple/memmap/t6022.h | 225 +++++++++++
>  arch/arm/mach-apple/memmap/t6030.h | 104 ++++++
>  arch/arm/mach-apple/memmap/t6032.h | 136 +++++++
>  arch/arm/mach-apple/memmap/t8103.h |  80 ++++
>  arch/arm/mach-apple/memmap/t8122.h |  88 +++++
>  doc/board/apple/m1.rst             |  14 +-
>  10 files changed, 1068 insertions(+), 735 deletions(-)
> ---
> base-commit: 5508406582f6f7120dce0c4b3059819a41788db2
> change-id: 20260907-apple-t603x-support-9e77ba0bf855
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
> 
