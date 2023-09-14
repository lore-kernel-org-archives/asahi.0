Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589F0219F2
	for <asahi@lists.linux.dev>; Thu, 14 Sep 2023 13:34:35 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9ad8d47ef2fso127020066b.1
        for <asahi@lists.linux.dev>; Thu, 14 Sep 2023 06:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694698473; x=1695303273;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpUIdnK9U7Z8dFu+3u/h7aGjExjlf4tG3qsuv5njPLM=;
        b=N9cOvP8o/h4YHQ0t1hgHiOl8sg7fHtZa0jdfwc10SnZRAYuTWDVAMIvNhvy20X/rdH
         gvMgBUM26IYR1+JCm+jSv4/sBesPkWR1XEt4l62OFOOLoixW8uCkLo5cIIMERnd+/g1Z
         Vz8e56z5Us6PjHWZpx83sYw7EKMiqIDY8eCA6NqHzZMZWHQIFW7vBZ/zpyAvOUmzaVYX
         1nZ+Sjucpt7d805BNgpo6xZny4NH1ptsTT00KcT/dFn/dHaJAUbRjlmAGsy+Y4pOjoRu
         yusETZclmQ32Gk3kTpmc0ANvrUHzPdqPEKtppevo184fQrJ12tuhHFHCrnOj3dkMK4yG
         P8zg==
X-Gm-Message-State: AOJu0Yx0cQRjgokhZ7XdVk6AE5Xay7PRRzJBEwpA2Tn++/cXmawbd3uA
	/HvJOIrpMWpcvaaza2SUQtLCaOwZs8uklXKQ
X-Google-Smtp-Source: AGHT+IGbDjX1zZ/BDK57U/WpM1Ic6e7m6mYWZDNzvEbaBzAV46HOGeH+QP5scbYaCpAXfk3xBzBS5w==
X-Received: by 2002:a17:907:7894:b0:9a1:edb0:2a89 with SMTP id ku20-20020a170907789400b009a1edb02a89mr4705566ejc.9.1694698472996;
        Thu, 14 Sep 2023 06:34:32 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id va13-20020a17090711cd00b0097404f4a124sm1030022ejb.2.2023.09.14.06.34.32
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 06:34:32 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-52f31fb26e2so1174158a12.3
        for <asahi@lists.linux.dev>; Thu, 14 Sep 2023 06:34:32 -0700 (PDT)
X-Received: by 2002:a17:906:2182:b0:9a5:c79f:bed5 with SMTP id
 2-20020a170906218200b009a5c79fbed5mr4416706eju.16.1694698471866; Thu, 14 Sep
 2023 06:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914111712.586522-1-ulf.hansson@linaro.org>
In-Reply-To: <20230914111712.586522-1-ulf.hansson@linaro.org>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 14 Sep 2023 09:33:55 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_Goo+8NVXzF3m4zocNwCpE0kGty2aDpMj+zKoy616vbA@mail.gmail.com>
Message-ID: <CAEg-Je_Goo+8NVXzF3m4zocNwCpE0kGty2aDpMj+zKoy616vbA@mail.gmail.com>
Subject: Re: [PATCH 04/17] pmdomain: apple: Move Kconfig option to the
 pmdomain subsystem
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 7:17=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
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
> index 07d2f8165abe..55a9ca191849 100644
> --- a/drivers/pmdomain/Kconfig
> +++ b/drivers/pmdomain/Kconfig
> @@ -3,5 +3,6 @@ menu "Power Domains Support"
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

Makes sense to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
