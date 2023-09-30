Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4288F5A
	for <asahi@lists.linux.dev>; Sat, 30 Sep 2023 11:58:19 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-79545e141c7so38266139f.0
        for <asahi@lists.linux.dev>; Sat, 30 Sep 2023 04:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696075098; x=1696679898; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4B8cqh/E8dvMkxyYDZyl7ZQqxhx7sl7i0aMKMFX1cc=;
        b=YyQOFym+AF9K93WDe9mQn52SaRdsAthHfA5Azyw3/fEhEvTwdUHzEyvJLUsNfBsOxO
         KaMn4sE12KkH3+4VPyxaMFZMn3V2AKLtFKWTvboXstx9Dp0Ksn1ul3bfkp6V4zS2Hf26
         q42/c8xecSoj1DBp0itKGcotg6SPc13tkA+O/MT/m3VgnhKVo2W2I9lEr3awsGS3HRuZ
         KfqzfGvq+6M8o7bP8CJDxJ4o7otHx7WkJry/PpLWr8HFoCAOt8CRjtuaeIMhQegHDqRB
         lWFvDmpSaBlWdmofu8mskCvs3K/wgFZPtQZr717OTL2N8NiKlgYu54V1MKvb/6reROXe
         LYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696075098; x=1696679898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4B8cqh/E8dvMkxyYDZyl7ZQqxhx7sl7i0aMKMFX1cc=;
        b=OR7VOTbNjvYdBXV49+/vZp89OEcPb0HlCbmpZ0BxycZM8awzRNwi6Bia0H7rMNaPR1
         zSUG1z2Ue4TPRV3MmuGdA+KU6CKHoydloqB+srdUTcDvzFivhWcg4G+rwukEfr2ngG9t
         heuUXHSUlV9dA8I9juQAayLk2L6B5DDXnLLSm2ujg5QPObzJP2NX9q3MRwnMpt4MzYtq
         8ATwmUQv2k8Z5uAVOdsY0PXvzmsIDqJVRQYJmfbZeQ87hZbncejTj9B/w8btYt6DUkGR
         7y7htE1DEqoFpSIwQcYMCVFmK+9/r0q5M7sv7/Gk/DKymdCjvQgCSwBeHxBR/RGMSInh
         QrJw==
X-Gm-Message-State: AOJu0YwKFRabrsdE1WOSg/wsGzZcc/7geOaZ7KnKTFlgujLVR22YxGKE
	HEvHNe1Zjhin/u9iqD4L66I=
X-Google-Smtp-Source: AGHT+IFL9BXm3OjXoEc4q3qMpme4S27UurE4+d4CiPM6lBLR5DAmOgKh529unCKKqYs5hUwLo0WcvA==
X-Received: by 2002:a05:6e02:974:b0:352:682c:1b91 with SMTP id q20-20020a056e02097400b00352682c1b91mr2764724ilt.4.1696075098275;
        Sat, 30 Sep 2023 04:58:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q14-20020a056e02078e00b003514edd0415sm3330299ils.67.2023.09.30.04.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 04:58:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 30 Sep 2023 04:58:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: j@jannau.net
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: apple: Deactivate on suspend
Message-ID: <e0a6f9f3-b472-4fda-829c-5d8f29234a4f@roeck-us.net>
References: <20230930-apple-watchdog-suspend-v1-1-1998c0be9fd7@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930-apple-watchdog-suspend-v1-1-1998c0be9fd7@jannau.net>

On Sat, Sep 30, 2023 at 10:19:26AM +0200, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> The watchdog remains active after putting the system into suspend. Add
> PM callbacks to deactivate the watchdog on suspend an re-activate it on
> resume.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/watchdog/apple_wdt.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index eddeb0fede89..2167e0ba705e 100644
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
> +static int __maybe_unused apple_wdt_resume(struct device *dev)
> +{
> +	struct apple_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdd) || watchdog_hw_running(&wdt->wdd))
> +		apple_wdt_start(&wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused apple_wdt_suspend(struct device *dev)
> +{
> +	struct apple_wdt *wdt = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&wdt->wdd) || watchdog_hw_running(&wdt->wdd))
> +		apple_wdt_stop(&wdt->wdd);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);

Comments above that define say

/* Deprecated. Use DEFINE_SIMPLE_DEV_PM_OPS() instead. */

and with that the __maybe_unused is no longer necessary.

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
