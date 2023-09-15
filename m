Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0190263A5
	for <asahi@lists.linux.dev>; Fri, 15 Sep 2023 10:21:52 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9aa0495f9cfso670227066b.1
        for <asahi@lists.linux.dev>; Fri, 15 Sep 2023 03:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694773311; x=1695378111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DeroP2FcWVhozmtBWEw7Me43OWeaZ0iYsWXzbmy9YxQ=;
        b=bGZDjovwJWHu6rd6fcQIrclxVcilBLXajSG1kSL60Kyi6I/rppF5PSzUcxVESInkAg
         u6FpH5Np1lNKF9PYhpJ39q+dFcATDP4QqEl+WNJ7NC3d7LOyD4chBTjG82vdGqC5rEE2
         9AIHZYmzzhjko65Faq5lNXJC7BcWTCG8eiMw32qx39pSAFvtbO7a83J2mBG20YGixORl
         pgU+klfD1jbnnIjgmXqdfl9XLQLhsiNkZsNbzvqMeg4Dry9pBWwH/XT0zUNyDbE4vRQZ
         tyM+08lqDcL9CF+yHNtGOObFg5g5XNNEH5rzzUxiPHAFwX5KjM5agoEzP2GJWAfLieWQ
         KxRQ==
X-Gm-Message-State: AOJu0YzOl6qDEOvU/mEtLj5rd6fbqA9B5bRHx3txr1e/diG3gKdCU81u
	qXkh+RH4rTBNaswWcUpjX4uBrixoDqkJRQ==
X-Google-Smtp-Source: AGHT+IFyW1nCIDMSn7ogFPm9lgo1l4HNS+7zDTq9ByCfw5BcrZqENvL/QAjMmSixrOkGSZOZTC7NWw==
X-Received: by 2002:a17:906:9b8d:b0:9a1:8993:9532 with SMTP id dd13-20020a1709069b8d00b009a189939532mr6753431ejc.30.1694773310486;
        Fri, 15 Sep 2023 03:21:50 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id fy20-20020a170906b7d400b009ada9f7217asm2214242ejb.88.2023.09.15.03.21.49
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 03:21:49 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-52f3ba561d9so4294592a12.1
        for <asahi@lists.linux.dev>; Fri, 15 Sep 2023 03:21:49 -0700 (PDT)
X-Received: by 2002:a05:6402:2695:b0:52e:4789:bee2 with SMTP id
 w21-20020a056402269500b0052e4789bee2mr6586101edd.6.1694773309157; Fri, 15 Sep
 2023 03:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230915092003.658361-1-ulf.hansson@linaro.org> <20230915092003.658361-5-ulf.hansson@linaro.org>
In-Reply-To: <20230915092003.658361-5-ulf.hansson@linaro.org>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 15 Sep 2023 06:21:12 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-hNCuKfr_g1Wrp7uYWMmoj4=3NY86oR1wEqPc1wX9jqw@mail.gmail.com>
Message-ID: <CAEg-Je-hNCuKfr_g1Wrp7uYWMmoj4=3NY86oR1wEqPc1wX9jqw@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] pmdomain: apple: Move Kconfig option to the
 pmdomain subsystem
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 5:29=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> The Kconfig option belongs closer to the corresponding implementation,
> hence let's move it from the soc subsystem to the pmdomain subsystem.
>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Sven Peter <sven@svenpeter.dev>
> Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Cc: <asahi@lists.linux.dev>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>  drivers/pmdomain/Kconfig       |  1 +
>  drivers/pmdomain/apple/Kconfig | 18 ++++++++++++++++++
>  drivers/soc/apple/Kconfig      | 13 -------------
>  3 files changed, 19 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/pmdomain/apple/Kconfig
>
> diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
> index 03c8991ad0fd..482d9e970e14 100644
> --- a/drivers/pmdomain/Kconfig
> +++ b/drivers/pmdomain/Kconfig
> @@ -3,5 +3,6 @@ menu "PM Domains"
>
>  source "drivers/pmdomain/actions/Kconfig"
>  source "drivers/pmdomain/amlogic/Kconfig"
> +source "drivers/pmdomain/apple/Kconfig"
>
>  endmenu
> diff --git a/drivers/pmdomain/apple/Kconfig b/drivers/pmdomain/apple/Kcon=
fig
> new file mode 100644
> index 000000000000..12237cbcfaa9
> --- /dev/null
> +++ b/drivers/pmdomain/apple/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +if ARCH_APPLE || COMPILE_TEST
> +
> +config APPLE_PMGR_PWRSTATE
> +       bool "Apple SoC PMGR power state control"
> +       depends on PM
> +       select REGMAP
> +       select MFD_SYSCON
> +       select PM_GENERIC_DOMAINS
> +       select RESET_CONTROLLER
> +       default ARCH_APPLE
> +       help
> +         The PMGR block in Apple SoCs provides high-level power state
> +         controls for SoC devices. This driver manages them through the
> +         generic power domain framework, and also provides reset support=
.
> +
> +endif
> diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
> index a1596fefacff..eff486a77337 100644
> --- a/drivers/soc/apple/Kconfig
> +++ b/drivers/soc/apple/Kconfig
> @@ -4,19 +4,6 @@ if ARCH_APPLE || COMPILE_TEST
>
>  menu "Apple SoC drivers"
>
> -config APPLE_PMGR_PWRSTATE
> -       bool "Apple SoC PMGR power state control"
> -       depends on PM
> -       select REGMAP
> -       select MFD_SYSCON
> -       select PM_GENERIC_DOMAINS
> -       select RESET_CONTROLLER
> -       default ARCH_APPLE
> -       help
> -         The PMGR block in Apple SoCs provides high-level power state
> -         controls for SoC devices. This driver manages them through the
> -         generic power domain framework, and also provides reset support=
.
> -
>  config APPLE_RTKIT
>         tristate "Apple RTKit co-processor IPC protocol"
>         depends on MAILBOX
> --
> 2.34.1
>
>

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
