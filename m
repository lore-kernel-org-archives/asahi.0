Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C39353E02
	for <asahi@lists.linux.dev>; Fri, 19 Apr 2024 08:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713515303; cv=none; b=eiz6UHkNz2jtsh/LJOVL8MRKyPt488sMg7foqAhj4vFr5cxZmOTmRA+bysW72GJkwUp94HWoER0pqizlgV4faRkwbextyz/119cOUTFc50rAgaesHdPsE7YnJV6pagoialt+8OS+c09Hy9BJpBVt5NrM1qqVOWmcpDyuCpGsfHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713515303; c=relaxed/simple;
	bh=TDJm1qEiwX6CmoIqgNB8cEJbW9nXsrTt8pustM3eDAw=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=OEXweaVhQurb31G7W4vVklYFJzRXgByQLe/bQhfrT9kKlGfxcds2dLQb+08Vvh7UEJmuTQ+jrk4Ismn9f1kbkU5JSS9LMN50KiLypSXptKuU30TtghqSjUpWMVfbQjAw0BG9P5GNJuFSAhlIbUM004oxTQ1SVdD7BNeFd2/4J3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=KuaqutIj; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="KuaqutIj"
X-KPN-MessageId: 8f06af55-fe26-11ee-b571-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 8f06af55-fe26-11ee-b571-005056992ed3;
	Fri, 19 Apr 2024 10:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=NHhqh3O/or1fjJv4v4yAfQQWEbO2lgFVF5MDLfpQ7X0=;
	b=KuaqutIj+vi34/Mca+53p+c/xNanAznyxU6kPqDPpOzP9HnXKx5iXt6yw23TvRrs+1z29eywvLcxk
	 q4haPRa/xYTlGTK/E53O/whpACUeJIuch0+C56xknn5sNp3INCOoQ47+qun7rc0tLqGLsZIJu1la3T
	 tnX1p7/jzvwlZHNKilE1yAaFEeGKuWlnYjFLwlqcIxT+sPW5FreXdviF1rWWgclBJgRmHx2mtkQhM6
	 FlLMgQMNGTLkQNEt58UBplFrpAoZciyorQO0Bil2zKI4DzUk3NAlo8BFGbqN097R6BAcPdaOnSfl0x
	 Al28mNh1ybYeGNvYj4PS7q89+MEGeCA==
X-KPN-MID: 33|vYY4LZgbLjsOVaAnapRQ2MQfGnNQi82JIcH/UpJqJWlq6FI8hPeksl7Jm+77nay
 BnsmvIRs7XcmwQJIyBOe2vcJg7iyhINS7heZyoqsDG0I=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|PcUiV460QhCgLl0Fl1WsuISEkPLtR7finQx17+Klo7ql0PnC7J69q5Z82WAE2P2
 oSskfcBoK8/nA4O42VyBYyQ==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id c256d62a-fe26-11ee-9ed8-00505699772e;
	Fri, 19 Apr 2024 10:28:12 +0200 (CEST)
Date: Fri, 19 Apr 2024 10:28:11 +0200
Message-Id: <87plulg3j8.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: j@jannau.net
Cc: kettenis@openbsd.org, trini@konsulko.com, sjg@chromium.org,
	u-boot@lists.denx.de, asahi@lists.linux.dev, j@jannau.net
In-Reply-To: <20240418-apple_config-v2-5-7e5c6b9a9db3@jannau.net> (message
	from Janne Grunau via B4 Relay on Thu, 18 Apr 2024 21:00:29 +0200)
Subject: Re: [PATCH v2 5/5] arm: apple: Do not list bootflows on boot
References: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net> <20240418-apple_config-v2-5-7e5c6b9a9db3@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
> Date: Thu, 18 Apr 2024 21:00:29 +0200
> 
> From: Janne Grunau <j@jannau.net>
> 
> The bootflow list is only seen briefly and is probably more confusing
> than helpful.

To be honest, I think that applies to all boards using BOOTSSTD_FILL.
Which probably means the -l should be dropped from the default
BOOTCOMMAND for BOOTSTD_FULL.  But until that happens:

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  configs/apple_m1_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/apple_m1_defconfig b/configs/apple_m1_defconfig
> index c30aec7c55..4eac1a9e2d 100644
> --- a/configs/apple_m1_defconfig
> +++ b/configs/apple_m1_defconfig
> @@ -8,6 +8,7 @@ CONFIG_SYS_CBSIZE=256
>  CONFIG_SYS_PBSIZE=276
>  # CONFIG_DISPLAY_CPUINFO is not set
>  CONFIG_DISPLAY_BOARDINFO_LATE=y
> +CONFIG_BOOTCOMMAND="bootflow scan -b"
>  CONFIG_BOARD_LATE_INIT=y
>  CONFIG_CMD_SELECT_FONT=y
>  # CONFIG_NET is not set
> 
> -- 
> 2.44.0
> 
> 
> 
> 
