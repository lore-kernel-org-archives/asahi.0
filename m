Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C40C2C0F72
	for <asahi@lists.linux.dev>; Tue, 10 Feb 2026 20:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756509; cv=none; b=LV2la22C5gh8Ybb3zgQnAqniu1KeyOVJ0LXlLVm+WtJDgymioI2Ugd2SFkyFwh7J6BCm0piHoLg6PAh3NBuE4RYFVue3/HoMVU2sC6Feb8IhDRsdhabP+dq/zw51NKOB+hmMCG1neU6MTIwJOzsGpQW+oKlOu6mZ8ix/fi32QXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756509; c=relaxed/simple;
	bh=YTe90HOOdkVfNfCT/gue8burqLOxJxyUIeHAwdAkruw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyN4aCNlT8H32VGZ+56x5NVGLFcs1hxSgdv9pGB9FprUolfQrXgmnMZBLSd4keURkTPbnTVY/k0+7zHdtWMv69NXeqVjgg2Qh0WplXy4YWoq99ZA2h9QQFFl2RLQHVguSXlPUuHJExTAZwSfKgavhXoInm3OF+dH21OsuNTUsP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWXnYHhm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWXnYHhm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806fd9033bso10463825e9.3
        for <asahi@lists.linux.dev>; Tue, 10 Feb 2026 12:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770756506; x=1771361306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qyFgyNWHXU64SHJN29WjtJtR7uYHlrJZAim1yoRlcII=;
        b=jWXnYHhmkIq8MkxGL64G6MBrmCIMeeZSOJG6VNhK8mkU9n6Z+oDKN97dQRAx+0Mn0K
         2vLyFifkrjHPrWIeOT5x0jXvpU95GagnxX/8aCFHpcnM5VT7UTUi2o2tCF0lXHYf4pxn
         iIUwuGMOz9powF3GiYZu2m3u5iHRQdJwrtfyk0lj5bOaXUGRp4y4DB5Y3ULJox/mOnTE
         2m9FNU+58ztS5ScS5xRAymHEmbMAB9QizxDgWmFu3KGztzu6a++DlZChBQunFi5x4sqD
         WvPrxzJGb89JO36E+rpAdAjxQkFNYrxyCg5TrHRmGJ9Ynhj5Airb75EV9uAHbSqI+0hU
         AyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770756506; x=1771361306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyFgyNWHXU64SHJN29WjtJtR7uYHlrJZAim1yoRlcII=;
        b=Ko/KexPcVOupk8jgwTw/hwsryw4z8fIjzYxiIieWKFsj72VufKV8EgXd91RxlQrgTx
         EcjuvKc8FAvilyLBKPrXsFYUdQL/8ewTpQuEtbD2n12lLp1DoUzDK6BzB+hsqgTYGzPc
         Jv9bz69IO+a0v0ROzdht1fYPdi77S+2KhPdpMxcFrG/MRYP9cnjQEYaJ/LirPptkK9rN
         i4fSBW8EJwS0UXHvFldCDv3gxa+j7WlPi8TBHePROuO06mqGSYhSybyM6eks9+Kd3cX8
         eMPw7JTOq3ctqnhJgdh79jqygouHXRbSNE1aYzvpD8DqoVSR3XmjZf5UhK/EPVtfDUDS
         YFcg==
X-Forwarded-Encrypted: i=1; AJvYcCUvdTZ1dOLOvHuwWiX10VQcD5I2eR36rUR3/ZPnkMoP80Xcpp5zGSCeMYqoC67cWd1tm+3f3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+ILXSKuncboxPuVe9J0LSdgLdfo/lcV/tlD6Q0hgIYaPao89d
	AonQI6xrXSUZh7fAmjXelD8+INXjbHQf2//bSF18QDavjrNhx7oHLKM4rQAAXg==
X-Gm-Gg: AZuq6aJDF2YfRmAYg1JykgTPtYoB/6U1ERE0M0GaqM5I8nFrx2y2KuDSrP46s5GYxb5
	Wy+8oXKcgpC/sdPCUyJb/E6ZCZgWM6ldCmpN4um9WsNgKpAUzM2aQb0/abMlrQJDetpvChDI+e1
	KsnIbgeuKSCdXAJDVOFGRgrlw55OT0Utw0kSulR+w6iOwII7tF8eN2HVs1s2hmUKOnTTYuJXJIV
	nvMOBlT0YVRgcAdSN7S9UMtS/rORuo7pY4fHesEh/79nFlIbJHLzi7GfdOz0Awv5tZOFnbxLr9p
	ED0NG/3xFy9LU0VGA5xgqYUGAyaKtRfsp8jS+muky+052CgJb0WBFxDSZmiq+cTN9nl+HOim2So
	a3fzyfLNEJDwsHW3Zis3Bc45BGSJdYK+kJfhqMeK6l0Ld9WBNXu4EP/zUsYAMiTc2TusvN9j3iO
	cDG0Ls71O1nDFChag=
X-Received: by 2002:a05:600c:64cc:b0:477:5ca6:4d51 with SMTP id 5b1f17b1804b1-483511ccf92mr29460685e9.3.1770756505624;
        Tue, 10 Feb 2026 12:48:25 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:d8ac:c964:9b43:1b13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8ebfsm133863775e9.2.2026.02.10.12.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 12:48:24 -0800 (PST)
Date: Tue, 10 Feb 2026 22:48:22 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH phy-next] phy: apple: apple: Check the actual ioremap
 return value
Message-ID: <20260210204822.jr22el4rlyosin2q@skbuf>
References: <20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net>
 <20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net>
 <20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net>

Hello Janne,

On Sat, Feb 07, 2026 at 05:40:34PM +0100, Janne Grunau wrote:
> The address where the devm_ioremap_resource() return value is stored is
> always a valid pointer. Check the actual return value instead as that
> that might be an error value.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/asahi/aYXvX1bYOXtYCgfC@stanley.mountain/
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/phy/apple/atc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index dc867f368b68748ea953e594ad998d7f965d8d1d..c144e273a555a741b49adfccbe046df83d193e03 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -2206,7 +2206,7 @@ static int atcphy_map_resources(struct platform_device *pdev, struct apple_atcph
>  	for (int i = 0; i < ARRAY_SIZE(resources); i++) {
>  		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resources[i].name);
>  		*resources[i].addr = devm_ioremap_resource(&pdev->dev, res);
> -		if (IS_ERR(resources[i].addr))
> +		if (IS_ERR(*resources[i].addr))
>  			return dev_err_probe(atcphy->dev, PTR_ERR(resources[i].addr),
>  					     "Unable to map %s regs", resources[i].name);

This does not seem correct - every call site that tests a pointer for
IS_ERR() also decodes the error using PTR_ERR(). Whereas you are here
creating the pattern "if (IS_ERR(*a)) return PTR_ERR(a)".

Proven practice seems to tell us that insisting to save the
devm_ioremap_resource() return code directly in *resources[i].addr
is too complex here.

Would you consider creating a temporary "void __iomem *addr" local
variable, and set "*resources[i].addr = addr" only once it's validated?
This would make the code obviously correct upon review.

>  
> 
> ---
> base-commit: dbeea86fecef7cf2b93aded4525d74f6277376ef
> change-id: 20260207-phy-apple-resource-err-ptr-5923d1130465
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
> 
