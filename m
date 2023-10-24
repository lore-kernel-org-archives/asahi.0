Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED30440E
	for <asahi@lists.linux.dev>; Tue, 24 Oct 2023 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEeSFINi"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6bf03b98b9bso19100b3a.1
        for <asahi@lists.linux.dev>; Tue, 24 Oct 2023 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698170648; x=1698775448; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiNf7bxs7WQlL1p7N8zEaMblQKww7yLL72WVvv0ROXY=;
        b=cEeSFINi4Hw2nwyjpxaJuipFFq5XWVegZCfiJ53J5CGkgBT8NcEXBs9Uxn5uRNI7KU
         ogUbpdQcPUNtgk1QFOrUlSiMF7JiLKwK4pzMTr5i8/E7sGmtF/1yc+QRIcY5NDf4IPQa
         2j25M5WFncfGCqV8SqjNybykUSTZBGsUdRYjsCRkBv/oXoSV4DcfLn7tkjuDZBxsRrKm
         LxpMeUXEwEqsDVutNtPY6wecBf3lGdVC6XBGQItB6Icy5ntCHrtfwK3w0+DfmlK402/M
         Rxheb/OJJp21Aow5OORR2k0Q+aMvur1J1hBwhMhKjamgdUYEbeSSGVzHyEJpYEkxMNZC
         3Dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698170648; x=1698775448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiNf7bxs7WQlL1p7N8zEaMblQKww7yLL72WVvv0ROXY=;
        b=mP/IomDLZ7kbRxer4dGobZ4Wasimx0Z6mHHqTnnxXOr23967MB1bPQwd2n70+p+ukR
         dd+jvmbFJWomBi6bjsUjhEZiQ4oEQ5SPYGCDUWpBjFObR9chjvB+IWGsY2jat/ZWItJb
         tejjAFKPg0ujxBCWZABkCC60iwkw9K+5c76Z5hQQxngA0Il9tmFoSjvUwregBFaRvC34
         yyaRxoM5sjBVdCzvRR2WPtncwXo2iYCDM4scj5ExEKHAZrBjP1BsctJqiTu8VRuzIO40
         wyTY8/fAde7ew/8fwOFwi+2a1S+NwzqK701YRPFLQOKC4Os6Ctu+gdVpqR5MaELCIWbf
         N6XQ==
X-Gm-Message-State: AOJu0YzecmuwmLE9ZAjpNls0PXSClNfh/h6Fsihr/EUotXSS9myRDjQW
	q7vYbW2IVmyukhHHWHsFZIY=
X-Google-Smtp-Source: AGHT+IGGmy0G/+afdYUJkH5aUTsk4FzE1PuM+hOPncww8+bWosXhuzeZyzk6ESrdepCC8vjB/+o4NA==
X-Received: by 2002:a05:6a20:7348:b0:17b:2c56:70bc with SMTP id v8-20020a056a20734800b0017b2c5670bcmr4227853pzc.10.1698170648145;
        Tue, 24 Oct 2023 11:04:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e14-20020aa798ce000000b0069023d80e63sm7872398pfm.25.2023.10.24.11.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 11:04:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Oct 2023 11:04:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: j@jannau.net
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: apple: Deactivate on suspend
Message-ID: <5e975f5d-c60b-43fb-ab15-f657cb8419a3@roeck-us.net>
References: <20231016-apple-watchdog-suspend-v2-1-7ffff8042dbc@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-apple-watchdog-suspend-v2-1-7ffff8042dbc@jannau.net>

On Mon, Oct 16, 2023 at 08:58:01AM +0200, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> The watchdog remains active after putting the system into suspend. Add
> PM callbacks to deactivate the watchdog on suspend an re-activate it on
> resume.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes in v2:
> - use DEFINE_SIMPLE_DEV_PM_OPS
> - Link to v1: https://lore.kernel.org/r/20230930-apple-watchdog-suspend-v1-1-1998c0be9fd7@jannau.net
> ---
>  drivers/watchdog/apple_wdt.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index eddeb0fede89..d4f739932f0b 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -173,6 +173,8 @@ static int apple_wdt_probe(struct platform_device *pdev)
>  	if (!wdt->clk_rate)
>  		return -EINVAL;
>  
> +	platform_set_drvdata(pdev, wdt);
> +
>  	wdt->wdd.ops = &apple_wdt_ops;
>  	wdt->wdd.info = &apple_wdt_info;
>  	wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
> @@ -190,6 +192,28 @@ static int apple_wdt_probe(struct platform_device *pdev)
>  	return devm_watchdog_register_device(dev, &wdt->wdd);
>  }
>  
> +static int apple_wdt_resume(struct device *dev)
> +{
> +	struct apple_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdd) || watchdog_hw_running(&wdt->wdd))
> +		apple_wdt_start(&wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static int apple_wdt_suspend(struct device *dev)
> +{
> +	struct apple_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdd) || watchdog_hw_running(&wdt->wdd))
> +		apple_wdt_stop(&wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
> +
>  static const struct of_device_id apple_wdt_of_match[] = {
>  	{ .compatible = "apple,wdt" },
>  	{},
> @@ -200,6 +224,7 @@ static struct platform_driver apple_wdt_driver = {
>  	.driver = {
>  		.name = "apple-watchdog",
>  		.of_match_table = apple_wdt_of_match,
> +		.pm = pm_sleep_ptr(&apple_wdt_pm_ops),
>  	},
>  	.probe = apple_wdt_probe,
>  };
> 
> ---
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> change-id: 20230930-apple-watchdog-suspend-7f73831130fb
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
