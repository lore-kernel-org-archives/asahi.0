Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBE92031F
	for <asahi@lists.linux.dev>; Mon, 16 Oct 2023 10:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J7tvADzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697451715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xGjF9yN2JU4rsRBxh81TQLA4dxrIk2DTJW01EJMcc44=;
	b=J7tvADzlVd1+BtY1TcY80IV5tTSXUCM8XpWUCTXVLfwCBmqcW3uzlP9yEpvTsZ9xH3uy4I
	oNT/0yiTfD8yaH/0iGs9BWiPPnyrFmU5ZpIghlHz0RxhukZ5WR71UXnjlpW6oxUCE12V12
	T28kgI+KxuM5sHfRI3rU50uqrML9k/I=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-AgamO-hzNQqFRVljagsuXg-1; Mon, 16 Oct 2023 06:21:53 -0400
X-MC-Unique: AgamO-hzNQqFRVljagsuXg-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-27d797630b3so998148a91.0
        for <asahi@lists.linux.dev>; Mon, 16 Oct 2023 03:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697451712; x=1698056512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGjF9yN2JU4rsRBxh81TQLA4dxrIk2DTJW01EJMcc44=;
        b=wj0ATpeMQbFIZwWKjeK9KdBMaFnDPKm4CDglVdSrYHVY6idK9nmNA2l4FjxBm4t8Wv
         rsMTg8eriH6/oUUsIwpMI/PjokiYZ/s3Qyd2JFb6Y/B1M0DLgYJdFfpEGBGX5eXIUp2C
         rkrOHlV26Qvp5d8taVLBTziEzHwEd7DqAPKruB1y9L1Avvo9g5YZn6kapK1ulaUWZRZ5
         lZ1KE+Whfb+FaC1SryyG3DwB7N4nlL7TJn3vVhoXTwduEuaJfkXUlr7mrZlOI4F927zn
         ZKaW+yRbYdZX5TT6xwXJ7mDTm651Jlk2EuxEJwkfVeVhSa6Qn6pkqmy8EPXoFuSRPDy9
         +9Xw==
X-Gm-Message-State: AOJu0YwAp96IvQnQBHyhdbGMWIHfXCZXz/zB0AacZfOya8IjBLGvHxbw
	gNvbiPTZ3Q6eDfF/F1vGkdvWB4oTBUaZv66OBaev96QdZsYSx8LKWtypnElJkNYrKIwwetLdVhb
	sxSqBRMiZbPGF8ccueaOIiL3erQgntGw=
X-Received: by 2002:a17:90b:1bcf:b0:27d:5568:e867 with SMTP id oa15-20020a17090b1bcf00b0027d5568e867mr9777226pjb.9.1697451712622;
        Mon, 16 Oct 2023 03:21:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh4w2kfgA6irj9S5H8CD7jiE2fT+aEXo0NBodAdw0sHrdeKFRvizHig84xpQz0v52lUAoqIUCPBOCW+1adeO8=
X-Received: by 2002:a17:90b:1bcf:b0:27d:5568:e867 with SMTP id
 oa15-20020a17090b1bcf00b0027d5568e867mr9777213pjb.9.1697451712327; Mon, 16
 Oct 2023 03:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016-apple-watchdog-suspend-v2-1-7ffff8042dbc@jannau.net>
In-Reply-To: <20231016-apple-watchdog-suspend-v2-1-7ffff8042dbc@jannau.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Mon, 16 Oct 2023 11:21:16 +0100
Message-ID: <CAOgh=Fy-=wJGcLOp1kn+Zd0H0+KysCQK3a7CwFyZLLvZ5W2Ekw@mail.gmail.com>
Subject: Re: [PATCH v2] watchdog: apple: Deactivate on suspend
To: j@jannau.net
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Oct 2023 at 08:05, Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> From: Janne Grunau <j@jannau.net>
>
> The watchdog remains active after putting the system into suspend. Add
> PM callbacks to deactivate the watchdog on suspend an re-activate it on
> resume.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

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
>         if (!wdt->clk_rate)
>                 return -EINVAL;
>
> +       platform_set_drvdata(pdev, wdt);
> +
>         wdt->wdd.ops = &apple_wdt_ops;
>         wdt->wdd.info = &apple_wdt_info;
>         wdt->wdd.max_timeout = U32_MAX / wdt->clk_rate;
> @@ -190,6 +192,28 @@ static int apple_wdt_probe(struct platform_device *pdev)
>         return devm_watchdog_register_device(dev, &wdt->wdd);
>  }
>
> +static int apple_wdt_resume(struct device *dev)
> +{
> +       struct apple_wdt *wdt = dev_get_drvdata(dev);
> +
> +       if (watchdog_active(&wdt->wdd) || watchdog_hw_running(&wdt->wdd))
> +               apple_wdt_start(&wdt->wdd);
> +
> +       return 0;
> +}
> +
> +static int apple_wdt_suspend(struct device *dev)
> +{
> +       struct apple_wdt *wdt = dev_get_drvdata(dev);
> +
> +       if (watchdog_active(&wdt->wdd) || watchdog_hw_running(&wdt->wdd))
> +               apple_wdt_stop(&wdt->wdd);
> +
> +       return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
> +
>  static const struct of_device_id apple_wdt_of_match[] = {
>         { .compatible = "apple,wdt" },
>         {},
> @@ -200,6 +224,7 @@ static struct platform_driver apple_wdt_driver = {
>         .driver = {
>                 .name = "apple-watchdog",
>                 .of_match_table = apple_wdt_of_match,
> +               .pm = pm_sleep_ptr(&apple_wdt_pm_ops),
>         },
>         .probe = apple_wdt_probe,
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
>

