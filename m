Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1629469F
	for <asahi@lists.linux.dev>; Sun, 22 Oct 2023 16:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nN71oLBk"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3b2b1ad7ee6so1710390b6e.2
        for <asahi@lists.linux.dev>; Sun, 22 Oct 2023 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697993289; x=1698598089; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=zaC0k6XVBVVgzv+xMwI1MNbASVkxCUyoOYu0hkRSSx8=;
        b=nN71oLBkiyW4luMnnf0HNruMFlrgIU+7xgNqgLrwvL2iqWQgS1yIc3xovRzbAxeyoL
         L1koKtYeMoqIaDALPf/mgEiz5M9m/wRjt23VZ4Mas2AR0A1ewc2lTQshyf+2/mx81tTX
         ykm5wx6hfFSIcktR2IT43i+8Zo1m+FvPV5+czgjq39xg0lEzgGsADIanEcAWRZQ9Grjp
         70lvVmArCcF7rvcm3Tce5cYt/P9TiSGLRJAMCO/032F74vd6zBBI0GCKb3bia7RxhlxT
         TOizK5D1+gy09p2kJLc/Bbe4phm3IW0Hlpp9+IC//e5uV4ZuoLw1ZmDis4E0meAFMrGn
         dJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697993289; x=1698598089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zaC0k6XVBVVgzv+xMwI1MNbASVkxCUyoOYu0hkRSSx8=;
        b=M15JijrRdiNujRqFiYB340/ZZLUlbarNeoTEHIHI3gFah600+gCFDIkRRQzchQkC2s
         Aj5e/jrv5yjpAozywtjZB3Q8EyVO4a1Bv5ydQ5ZMNX9iojYWXvrlt7twJQUGNI/HkytY
         dO63qRyFaHKyoH0PT6V/eiVXS+biqaFhKk0n5eZ7ZyplkzyDtGgMc98NpQGhl9z2Banv
         Vhh9rqRLRTe9MdyGlAoeTQgNkL2H8rXDLKCvoQokKyni4o27Q7OubPRcUO88GW4lNYlc
         pZdHwBpHj+pTW/SslFVNRAYBDUKukKa4afcro3cRwDm01GIil6BI3YDENAwVeFKmDehQ
         tXeg==
X-Gm-Message-State: AOJu0YxaB98r6CAsOz+6DhAtypwsij40fOdfR4J+lGPLAKhfc4rZqqmK
	GWuqSEQ6/pDOnPPprdjrV/8=
X-Google-Smtp-Source: AGHT+IGpkNvGgZVMKkF8ZxGYFUTvP28BBBEKhlGAJdl1GmJbCGwO7rIiSfOHfkeIf2OwE4ATpvi6Ig==
X-Received: by 2002:a05:6358:9146:b0:140:f6ab:b11e with SMTP id r6-20020a056358914600b00140f6abb11emr8468882rwr.28.1697993288607;
        Sun, 22 Oct 2023 09:48:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f10-20020a631f0a000000b0056b27af8715sm4456037pgf.43.2023.10.22.09.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Oct 2023 09:48:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c6149f04-4cf6-8dcc-3aca-d926f49a34d7@roeck-us.net>
Date: Sun, 22 Oct 2023 09:48:07 -0700
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] watchdog: apple: Deactivate on suspend
Content-Language: en-US
To: j@jannau.net, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231016-apple-watchdog-suspend-v2-1-7ffff8042dbc@jannau.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20231016-apple-watchdog-suspend-v2-1-7ffff8042dbc@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/23 23:58, Janne Grunau via B4 Relay wrote:
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
>   drivers/watchdog/apple_wdt.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index eddeb0fede89..d4f739932f0b 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -173,6 +173,8 @@ static int apple_wdt_probe(struct platform_device *pdev)
>   	if (!wdt->clk_rate)
>   		return -EINVAL;
>   
> +	platform_set_drvdata(pdev, wdt);
> +
>   	wdt->wdd.ops = &apple_wdt_ops;
>   	wdt->wdd.info = &apple_wdt_info;
>   	wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
> @@ -190,6 +192,28 @@ static int apple_wdt_probe(struct platform_device *pdev)
>   	return devm_watchdog_register_device(dev, &wdt->wdd);
>   }
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
>   static const struct of_device_id apple_wdt_of_match[] = {
>   	{ .compatible = "apple,wdt" },
>   	{},
> @@ -200,6 +224,7 @@ static struct platform_driver apple_wdt_driver = {
>   	.driver = {
>   		.name = "apple-watchdog",
>   		.of_match_table = apple_wdt_of_match,
> +		.pm = pm_sleep_ptr(&apple_wdt_pm_ops),
>   	},
>   	.probe = apple_wdt_probe,
>   };
> 
> ---
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> change-id: 20230930-apple-watchdog-suspend-7f73831130fb
> 
> Best regards,

