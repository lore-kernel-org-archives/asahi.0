Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4421825A334
	for <asahi@lists.linux.dev>; Wed, 31 Dec 2025 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767191300; cv=none; b=TX0qJhB+2yghkKiOt6a8w/SjaZbG6J3++A/a/gd5lvRfcXH+fzo33twDeE6yggQVtlcXTQuF2O8ENqUjrGJeq39le5NzBJz4h/VLCZUsbXBjOiJMsZjexUBfrqXSQlXExUJare5m2mIIN+ZULoNJiAqoQZxauwG2PiMY74Q1Q/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767191300; c=relaxed/simple;
	bh=2eFuPTdKA5XuNm5nzNn9/WiAWLq+5UoOPb5Um71Qgr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcznJN00cyz7z1oTbH1Wo7M7xtLsGPvRToHmbR/rrL03TmhlDOiyKwu5FGLE2Jiqj/Cq1XG/WK/GlgyshT8WAUa7QvWQD2+QmCyjmxxxo2+mqjBeZsbr6f+YYBu1a3c8p/pUrsT0kR0gix5JZKwi1Tc9E8uBdjwCeMNdm1AqK8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKm7Bnv5; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKm7Bnv5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso113164025ad.1
        for <asahi@lists.linux.dev>; Wed, 31 Dec 2025 06:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767191298; x=1767796098; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMV6DeeoDol5vW6Ifpd5XnY16YMsP6em2WlQ7TohT2g=;
        b=VKm7Bnv50nrqW16VyKSe2XR0KaRQzYWd8D7GTr+mct0NJsXCJBtgDWbbSPzxa2ylMs
         s9WUzmgtzMwnkURoyQBLFI8EkQ+MHab4QMxzzOnxmSSXcx1V6M9mn9yWwrXJQEPsNRIH
         +ogXjtIg0cde9YjDsulkCpF1BMdULRaoUconk9zzZb0ZZ+dEwYPs3RP5GZKuzgQaXocE
         iRwD4u0IXsrWdMeI+k4rBnV6N4FdMSr2g6SLybpEDYHZ/Q7QpC1EgSy5c2ix2hplMjeD
         ptm1ZCCx9wGn/8Jlq0Ib28L61Dh5qeJKUG+eWSlQ+wLFSkeKJKS9Kdi0cbvILj+pVX2z
         UMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767191298; x=1767796098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jMV6DeeoDol5vW6Ifpd5XnY16YMsP6em2WlQ7TohT2g=;
        b=rHlPPhnemYiMIYrZ6zDOLkh6vMRJxmpxDUUBXpdBFHC6Miqacrn2RXZpz3ASNqp6oG
         0D7HIkp7TGhBApWhYK+nSz19/wMw8NqqgA9FhMG5eowtqAU3/X1Nb4E3djMYpvEGXdkn
         lvaSceeP8LKmbeemoZEShptzgUTKV/trC7Z0tDa8Dn9AL1cE5pPVEP9sq3n/5lN8yJpL
         Idw1j9Vwsn+bTx0CYo3Lm03QfQ1E3wYDpHxMaEo2KMYi8aAPEaa4FoFvyt60tF7XzT9I
         D4suDuUi74IaFKR4zsOGM5VsBZ07XH4Kq83qv/eUtELaiboCm/aiHfE5SCgXnZy7IQj0
         YnMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPrP5EImT1agEonEKkZsPYq5/R8aqYuSoMYKGywC9DaY+id4KZm9gO9V/OkbHiGaezDZ9DUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQimNn9LP/nErAb9viIdmV3iCsyLQAWirHtG5Jsfks+PJ4Azsj
	/AAVs9U/f2iNSLD/Sh+VI8omuvcjsY/VRr0KZGKEtvzvSSOeZ4iJ5+VF
X-Gm-Gg: AY/fxX5Ubcn2EHfRElny3L8ErszgGU/9nHgkWe9o03hV2mcKpkI0MLlwUtU7UtLjwGS
	lyXMJhSBG+xVRPhEsn9Pm7TAWQMpjpCMo7ZlrRM+udRbk6kNGyrZcHcFuhICdobJ2GApgmsnawc
	SXRZGMAnHeJkjaUdrZD4pQKC9ygX/bB0LU2/Ut+DovnBRVBspNG6w//5qiDGlp6J0LIEFLjhUE3
	ypAcq/1MPkO7m4LKHpad/xJ71+xzPnm3Np6733UE551LhLvmqdgZMgM6tiD8yrnw1o4kW9J9mTI
	WZFnKZQDu6tpOVyfEluGdBxgD+myOjFZxIy/oC3Hypl1uZHCucHJcHHi0QaVjSwIyC34318yM+O
	Nw1M7MZiI8Qa91DiWtdAISmu02NUxDsvmBvOu/yY1gb4S47/RdkRp8uDSr/hWu7DJppyzdgPuyV
	q35ER5GvcbWnS6d0wwDQkdJ0Tg
X-Google-Smtp-Source: AGHT+IHT1LbcUINYNqMyB9CX8YBrFNHzxw864OFLPJDnx9s6IC7xwrB55T2EWxDGNkf6J10kosGXXw==
X-Received: by 2002:a05:7022:f698:b0:11d:bea3:c93d with SMTP id a92af1059eb24-121722eba22mr29428274c88.29.1767191298434;
        Wed, 31 Dec 2025 06:28:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254ce49sm135194664c88.15.2025.12.31.06.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:28:17 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 31 Dec 2025 06:28:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] watchdog: apple: Add "apple,t8103-wdt" compatible
Message-ID: <68e8bd60-85b1-4b4a-8a82-f47640ad0ad9@roeck-us.net>
References: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>

On Wed, Dec 31, 2025 at 01:07:21PM +0100, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,wdt" anymore [1]. Use
> "apple,t8103-wdt" as base compatible as it is the SoC the driver and
> bindings were written for.
> 
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
> 
I don't understand the rationake from the reference. This patch will need
an Ack from a DT maintainer.

Thanks,
Guenter

> Fixes: 4ed224aeaf66 ("watchdog: Add Apple SoC watchdog driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
> device trees in [2].
> 
> 2: https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net
> ---
>  drivers/watchdog/apple_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index 66a158f67a712bbed394d660071e02140e66c2e5..6b9b0f9b05cedfd7fc5d0d79ba19ab356dc2a080 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -218,6 +218,7 @@ static int apple_wdt_suspend(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
>  
>  static const struct of_device_id apple_wdt_of_match[] = {
> +	{ .compatible = "apple,t8103-wdt" },
>  	{ .compatible = "apple,wdt" },
>  	{},
>  };
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251231-watchdog-apple-t8103-base-compat-8a623e9831b6
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
