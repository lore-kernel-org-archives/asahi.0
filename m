Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4091D681
	for <asahi@lists.linux.dev>; Thu, 14 Sep 2023 11:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694691255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zyZTrDy0/hTH0K9EatTkNwN6H8aU89mHjN3C7EMRwqQ=;
	b=iQN9Fe6nfprTZ5syMdH/7BClWd+9TynWg8aPH+ty4DvwbfTuVa+/xVZBI708oS/S8/NrAa
	I4DcTFs72qNNZnKg1Z0hwPxnDRaqIP+jvOjRGSjnMvdY3gznFMv/d/OQB9B0WfITyB15Ek
	YKKr1vI2JTSpwfcQ690cMd4UGCzsdnM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624--7fuTPBsNsWzL54ya9pnFg-1; Thu, 14 Sep 2023 07:34:14 -0400
X-MC-Unique: -7fuTPBsNsWzL54ya9pnFg-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-27359a369ceso721371a91.1
        for <asahi@lists.linux.dev>; Thu, 14 Sep 2023 04:34:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694691253; x=1695296053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zyZTrDy0/hTH0K9EatTkNwN6H8aU89mHjN3C7EMRwqQ=;
        b=k0PiQTs9+oPsy/eyZ3gS7OuNTDzKqf7XjUjQ3yP7Oa15DczJmYj38XLR9YK8x/kiHq
         Y5R/8sS2Ks08ECRhYa++zTJ5E6pwJU5GrrzkMJ+BQCwwfljwWxryTo+75TGFluIlryoT
         kIj7izoPWjapfSq+7Fm9299kQLE06OzQoQUZdcNzsqEWpqmOD4Q5QATIsIcdkuliZaAZ
         gCD5QHpZkuPDfT4BS8FJxkvq5t+bxRdI3xytTXqve01kEq6onl+uhj6rbrrF4x3GRra/
         NOFoIjm1aJs2z3s68EUItEO6zRqJRrQv4DnLRsNeQF2XTsMeiZ+OF+MYGktuFgGRpqzd
         NYoA==
X-Gm-Message-State: AOJu0YzPLvdvv1a0TijLpNPgyVozKIWDqSPrOYCdvjwFQvjlBQT+sc5+
	RMIBVwzyfzRFH3luq1dMFIXOzB6rhtgWSUlnMxy1G9UbPOmYbEfR3u/ubfAMup3ntW4ViZBngzj
	DJuwiZFZoj+Ul7UnNNzxh7MzSMb43F20=
X-Received: by 2002:a17:90b:1953:b0:271:8195:8 with SMTP id nk19-20020a17090b195300b0027181950008mr4962719pjb.36.1694691253242;
        Thu, 14 Sep 2023 04:34:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+T3eZarPZ9nZ1kl+VZnwP2bzJmj2nhQcmZkbug8WrUbmTzW0SE3NyLmlL8SFSEAVUSs75vseHQzI79kWaPnA=
X-Received: by 2002:a17:90b:1953:b0:271:8195:8 with SMTP id
 nk19-20020a17090b195300b0027181950008mr4962702pjb.36.1694691252955; Thu, 14
 Sep 2023 04:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914111712.586522-1-ulf.hansson@linaro.org>
In-Reply-To: <20230914111712.586522-1-ulf.hansson@linaro.org>
From: Eric Curtin <ecurtin@redhat.com>
Date: Thu, 14 Sep 2023 12:33:36 +0100
Message-ID: <CAOgh=FykP9LLpkg4WLhYaKYv8Myofu7KSYc2=_3ea=4paPfMCQ@mail.gmail.com>
Subject: Re: [PATCH 04/17] pmdomain: apple: Move Kconfig option to the
 pmdomain subsystem
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Sept 2023 at 12:24, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> The Kconfig option belongs closer to the corresponding implementation,
> hence let's move it from the soc subsystem to the pmdomain subsystem.
>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Sven Peter <sven@svenpeter.dev>
> Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Cc: <asahi@lists.linux.dev>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Makes sense, since the C code and Makefile is there now.

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

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
> diff --git a/drivers/pmdomain/apple/Kconfig b/drivers/pmdomain/apple/Kconfig
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
> +         generic power domain framework, and also provides reset support.
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
> -         generic power domain framework, and also provides reset support.
> -
>  config APPLE_RTKIT
>         tristate "Apple RTKit co-processor IPC protocol"
>         depends on MAILBOX
> --
> 2.34.1
>
>

