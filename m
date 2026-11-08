Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149903;
	b=FTdQ8Xr8mlCLD1UeJyp1E/YPfSh0YVsCvUidIGDQhSPF1p9RlKfX9MdW/LtEr6dIIiF4
	 P3+wGO21gPcVew9Dezufus50Dl0irdSN278AWok+cpifNj5jLCYGv6eQPyKWQ9A3pvFvS
	 YsBhfHNWGKeSQUg0EOc29yS7KJWPHqe57ANT9p9lMuXING5rXdUisWcObeBpmxfoPHcDK
	 CoKsyupfppKC/mSqczLb7OvAh0EvwnBD/4g8heTO69kEf76OShmUL0ivSjTt8hj2h0U1L
	 gnP/2gjbNRJRZh2JfdPw5DjAtmYdr6nCs5PTper3uKinCSC48tCUYTRYtY+qfD+/HmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149903;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9G8iDq9PgStkjmR+yV5JSPWsbqrzQ4CGM0C2KH6B3hI=;
	b=MLvKvAMgA3l8wfknl2M4uVlsps5AlBhGU0RVIPoP7rPkQIkxiEykTu6PpjwMLtEf0Woh
	 vySPLjPjpKt6EA5w2G4Kq8SpcBxzypxHz2Z98w4xMho2n2lB2vHNBE/VQJEO1H2V+aSBb
	 Sm07pSj8JFpRPytYCSGrkwf1tnM4UaClMajhPm/RzVY4i4WkvJIPaGs+QOf+VGwkhvZmW
	 OuACAhmVafAme/6tykNQKOkKW2pxKo9qTooHmOtQM0ZEHGKPTi0h3OOr5fDl2yt+UguUZ
	 tjcvJ9PmOo1UJAVSPQSVEvLbgMGLCWQhF4ytHOCttcaaQz6PVI/xB7JMI09Csgto6pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=GK42ABHy;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0eC0qwAa;
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB854606A323
	for <asahi@lists.linux.dev>; Sun,  8 Nov 2026 14:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB854606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=GK42ABHy;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0eC0qwAa
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E4D7BEC0588
	for <asahi@lists.linux.dev>; Sun,  8 Nov 2026 09:58:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 08 Nov 2026 09:58:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1794149901; x=1794236301; bh=9G8iDq9PgS
	tkjmR+yV5JSPWsbqrzQ4CGM0C2KH6B3hI=; b=GK42ABHyjBtdZT3jPCUSYX7jxL
	O+a6kIhNL09GUpYqD/jfA30j1rRoAqkw3ihFAUhcmNyTVdmKDFJYhsUGl8owJ3lN
	Fjl/B/sXfDq4ZVvxEhYlerI3kh+pD9f4rtI2mGy0mDqdWy/LqrINfQ4cocvTIH4q
	sYm7vw+NRAL9h7z6Z37DdhFIcI+/1JhLh0OnZjA2FYumNGlh4JOdTN7wx/d6vH+k
	4ZQYWOD3RnyB4pynE833Zz2yK/X3NL7IPwpVa3kH3e26wsTIEzhp+R0sgVMzPmQ1
	jE/isXCy054cXhHAO8ES0I1PpSCpuATxGNU0L/BfEkmZV2Lc/0bRf4jkg7tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794149901; x=1794236301; bh=9G8iDq9PgStkjmR+yV5JSPWsbqrzQ4CGM0C
	2KH6B3hI=; b=0eC0qwAaFWFVLOIZyG4V3PFu4nYgGrm7GW9vSqBj9as/vJRAar7
	Keg/DYEnt2297sZd43L/sMcKH7Qfi8CEBTJdGj6fEO0D2ohCUlw6AMcsYCUtUuR2
	Ig0WD5Ji5hQRYu6U5XYf2GtHg52W47MqyeVwlZ6zOtLwUV18k7xBfidOeB9R7RtD
	OtLI7KKv/VLkCAR+wMlOBrqS7YqBYQ9MQjyNZmwl6YXIljSaeuRlw8LYF32WqGSk
	YddmVZsIzdU7P0mprh+CAuetmGKP53ZqyIuAGwzDbKYa5K2gLrSTIlYBaZP0PxXp
	XTrZrUd2YIOWlx4x/7CLUTqbf7CA46vM5DQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794149901; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:FPsycWOO7yMcRmBBEaA869rTUA6Dh6jubjztIzb876YDPdn
	aYO44vyOvuQ5uuxrhGFD1mQRq2EnlO+NPowTzwrMQPiEol7+fTvW8P2zYw0VIn1m
	cgvnrWbyatMThC/ulfmxvi9Ob/19gO9G5zK/2yb9Q1R++5KDydWqax1/dcqyoaVQ
	4PVrQvQFs+xkwSTtvKJOJw4uWJ5DduIy54jV5RHBX/Gl8FefkOdQhyKXbfD/z8y2
	ckC4Bfitq8YqwFp771oDMSYCDLczfXf8kcBbPexcNsUq2GnyB2naMn1O0/HyASf2
	v+ZYhg1OhWS8CPAaTnIVGF16oD7PPMd6Jf4kiIQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:FVyg89EHhanLbUX+laxjF8YLXPMSx/LDlmdfiJ03Z3c=:CEgt00gN0SsvFLw1HJqV8+/SJMLe87wDDOVUlEnHRF0=;
X-ME-Sender: <xms:DY7watBszlm3goS9QnMsC-Gp_1lHJyNUYonfhfC29_fhVaXtl1qCsw>
    <xme:DY7wakeOY2b7m8CSgmR1FqPAHwAfNkOM6q2_9NtMqfbiAjAkoxTvQXoq3atu9Hmfz
    Po7rAvC-5pFHFwvJ5P-1uSSRPXcDLsOPHSp91Ih_P53DR5BxzuWEzU>
X-ME-Received: <xmr:DY7wakKm5BsrHEARH_yqJ3DjXzxF8jyKm1UFJGc_TMbla-JxMpz6yNugCxbYcyzb00NkbNjSmDwMPvvfsmRvPufZcQsZFqXdqTA>
X-ME-Proxy-Cause: dmFkZTEHaGvpM3yxaQgu7rtFJBM85WX2facGuVlKhrud5kZMZGJGAOISDqwmz6jyz80blO
    wFnvuQ+m27u39K5gByo/qMS1BLzGiNq1BRkmQyy2hF12i2ibFLohw6efovrLPzcmPSNOV+
    miVWWlsRsC6ziQhIxNbhhhfHh+0Ow3eEH1YtfkMFsanYBY0y8Y7sinzZ7xGJcQgJyThpab
    2T2NhRphpP4DzlG3paTwC1s40JSsocbvuTMJ6Ka/u1qxrn0JfZ0tLEZhXu56wJk4SzA+ok
    qB3lnuQ4sNxBb3PhUEXIkRRGuL+nSL3rIigFQZ605d5V+T5H/ioElZ+yvKEo2O+HxhrFVy
    S9nWH2NPcFxXRD+8VygpJa5YhRlra+pu6HcvORoCZpqn4DcQAYMSq8qcb9Wevlg2Sy7rYw
    XCuHk/P9H9q/jxQihgkORYjSScwJZMgGWD5q7dVS/KPQzsojZqZgsOXRZmhjD9b53wbTXR
    jlizqXWJpUajNTwE6BxevGgOFYOhK82RUXPuk13lg6JK9BPfelAkT33Lw4JNQA0CqEQbRv
    FI/KyJhVI9yRfc6QVqWNM7igKd0qcpzhGU1EC5a81E2LW717KD/8q+NnBzhIieuSl3b4WJ
    tX6bbuJmeYIA3jb3od+FGXmk0NayAiW87XHE9wMWVk5HgG6ItW47NBd/T26w
X-ME-Proxy: <xmx:DY7wan1XA8ZCjYIXi7Qyk39YzIfBzX4CaCvv7LGHUxBa92lLlxRUpg>
    <xmx:DY7waujoBaYELkOLySvqVA4BNbILcaDUq0P-VmfpW-3AD3n6QiUz7A>
    <xmx:DY7waoUKksn_a4PdtRnoXSJcRS9acH5fKSuIDq9_WZnRHx8zj_aLEw>
    <xmx:DY7watXHs3ciSeTtk4Bu82bRFmp-_bdaI71i9VuMxOI0WlEcEdc3Kg>
    <xmx:DY7wapU9UPUHTu8dgLy5yDRN2iV0y_DaXSvrzpSr-QYlK6RCk0YuXaKQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 09:58:21 -0500 (EST)
Date: Sun, 8 Nov 2026 15:58:20 +0100
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: apple: Fix swapped paddr and size shift
Message-ID: <20261108145820.GA1462246@robin.jannau.net>
References: <20261108-b4-sart-fix-v1-1-dab7dc1e9adb@kernel.org>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261108-b4-sart-fix-v1-1-dab7dc1e9adb@kernel.org>

On Sun, Nov 08, 2026 at 03:35:11PM +0100, Sven Peter wrote:
> Right now we assign the paddr shift to the size shift and vice-versa.
> Luckily, this doesn't matter because they are the same for all SART
> versions but fixing this doesn't hurt.
> 
> Fixes: b170143ae111 ("soc: apple: Add SART driver")
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/soc/apple/sart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/apple/sart.c b/drivers/soc/apple/sart.c
> index 66b99955b395..5f1f9ec5d311 100644
> --- a/drivers/soc/apple/sart.c
> +++ b/drivers/soc/apple/sart.c
> @@ -258,8 +258,8 @@ static int sart_set_entry(struct apple_sart *sart, int index, u8 flags,
>  	if (paddr & ((1 << sart->ops->paddr_shift) - 1))
>  		return -EINVAL;
>  
> -	paddr >>= sart->ops->size_shift;
> -	size >>= sart->ops->paddr_shift;
> +	paddr >>= sart->ops->paddr_shift;
> +	size >>= sart->ops->size_shift;
>  
>  	if (size > sart->ops->size_max)
>  		return -EINVAL;

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
