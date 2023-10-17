Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB94141AAD
	for <asahi@lists.linux.dev>; Tue, 17 Oct 2023 14:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53dfc28a2afso9935075a12.1
        for <asahi@lists.linux.dev>; Tue, 17 Oct 2023 07:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697553569; x=1698158369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSBGvJBtrmqf+urGWh+wa2QhIgHNfzUvaKB+5zrRekk=;
        b=UNkbjFcjCv9rCnKEnfFHibFj7t2xPQ8t0HEToT8V/xmchCtrheIJHLUI3MZCd2+07i
         Hyf1tr23Kxe5A9Kyq0dnoL641cfegRynAK+Qigbsz6Ju2j6icJHnJoQiUM/WNmJ9+Aa4
         dEIqqAuce3oiZcO+HOftdzDR9lIJ3pue8plXS3oPMAXiWlf1q8Tf/hvoDqMv0kp4IU0Y
         Nc4ME0TXlC+/IR72JUbibXoVKcUHKw6nRrn1m15FsOVruO9eMz4BSuMNCIvuEbml2iya
         SWpwBBm5e9arpdT044CY3F32GKgo6bD+aL6uonjR44BrU5bEs/uNKH2ta3plMagi8eea
         /x1w==
X-Gm-Message-State: AOJu0YxevGqq+GIaFoWeoYvu9j9UP1FUp3uqnCNpDRpaXvXwfroSvaLQ
	eyuCrXgBA0P31t1ZryUmy440dWIaTP2JuXDO
X-Google-Smtp-Source: AGHT+IGGbwg4IVHnQnpT1j4ugmznPRr6Q9hAPqYpCY3Jlr2N/by+Jno2mIhCOo+iMc1uw5PHybFSfw==
X-Received: by 2002:a17:907:7ba7:b0:9a1:af6f:e373 with SMTP id ne39-20020a1709077ba700b009a1af6fe373mr2272848ejc.42.1697553568673;
        Tue, 17 Oct 2023 07:39:28 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id s11-20020a170906a18b00b0099bcb44493fsm1373698ejy.147.2023.10.17.07.39.28
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 07:39:28 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so952380566b.3
        for <asahi@lists.linux.dev>; Tue, 17 Oct 2023 07:39:28 -0700 (PDT)
X-Received: by 2002:a17:907:9403:b0:99c:6692:7f76 with SMTP id
 dk3-20020a170907940300b0099c66927f76mr1833687ejc.16.1697553568208; Tue, 17
 Oct 2023 07:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016-apple-watchdog-suspend-v2-1-7ffff8042dbc@jannau.net>
In-Reply-To: <20231016-apple-watchdog-suspend-v2-1-7ffff8042dbc@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 17 Oct 2023 10:38:51 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-UMr7ZzSjPraHqkAneoHgBKsis7jfzcYt0vcgvUADi4Q@mail.gmail.com>
Message-ID: <CAEg-Je-UMr7ZzSjPraHqkAneoHgBKsis7jfzcYt0vcgvUADi4Q@mail.gmail.com>
Subject: Re: [PATCH v2] watchdog: apple: Deactivate on suspend
To: j@jannau.net
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 2:58=E2=80=AFAM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> From: Janne Grunau <j@jannau.net>
>
> The watchdog remains active after putting the system into suspend. Add
> PM callbacks to deactivate the watchdog on suspend an re-activate it on
> resume.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - use DEFINE_SIMPLE_DEV_PM_OPS
> - Link to v1: https://lore.kernel.org/r/20230930-apple-watchdog-suspend-v=
1-1-1998c0be9fd7@jannau.net
> ---
>  drivers/watchdog/apple_wdt.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index eddeb0fede89..d4f739932f0b 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -173,6 +173,8 @@ static int apple_wdt_probe(struct platform_device *pd=
ev)
>         if (!wdt->clk_rate)
>                 return -EINVAL;
>
> +       platform_set_drvdata(pdev, wdt);
> +
>         wdt->wdd.ops =3D &apple_wdt_ops;
>         wdt->wdd.info =3D &apple_wdt_info;
>         wdt->wdd.max_timeout =3D U32_MAX / wdt->clk_rate;
> @@ -190,6 +192,28 @@ static int apple_wdt_probe(struct platform_device *p=
dev)
>         return devm_watchdog_register_device(dev, &wdt->wdd);
>  }
>
> +static int apple_wdt_resume(struct device *dev)
> +{
> +       struct apple_wdt *wdt =3D dev_get_drvdata(dev);
> +
> +       if (watchdog_active(&wdt->wdd) || watchdog_hw_running(&wdt->wdd))
> +               apple_wdt_start(&wdt->wdd);
> +
> +       return 0;
> +}
> +
> +static int apple_wdt_suspend(struct device *dev)
> +{
> +       struct apple_wdt *wdt =3D dev_get_drvdata(dev);
> +
> +       if (watchdog_active(&wdt->wdd) || watchdog_hw_running(&wdt->wdd))
> +               apple_wdt_stop(&wdt->wdd);
> +
> +       return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, app=
le_wdt_resume);
> +
>  static const struct of_device_id apple_wdt_of_match[] =3D {
>         { .compatible =3D "apple,wdt" },
>         {},
> @@ -200,6 +224,7 @@ static struct platform_driver apple_wdt_driver =3D {
>         .driver =3D {
>                 .name =3D "apple-watchdog",
>                 .of_match_table =3D apple_wdt_of_match,
> +               .pm =3D pm_sleep_ptr(&apple_wdt_pm_ops),
>         },
>         .probe =3D apple_wdt_probe,
>  };
>
> ---
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> change-id: 20230930-apple-watchdog-suspend-7f73831130fb
>

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
