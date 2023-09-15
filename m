Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.145.221.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D642DDD1
	for <asahi@lists.linux.dev>; Fri, 15 Sep 2023 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694771150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F1VBwuYXQUntYei3UdowzwFY82byxmtnNnjvSqOT3Vs=;
	b=DG98/YMwmd5GsczuAJdp9bIcbwTf4jD9V4zURg9sBBkx8R+3yqU2KBJWqtNCaVbWABH4g5
	lrwMqgMG95tpZhBL1TUWLFOLoiaRmwT4eDNr8FPrahJFUvVsTqWWdfHy9tXE9jWcSjb7hS
	MQGQq3/IVyhcAta7Uc8zg2+zl17kl50=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-xMXlcYkJO9yrOVE5FjZlhg-1; Fri, 15 Sep 2023 05:45:47 -0400
X-MC-Unique: xMXlcYkJO9yrOVE5FjZlhg-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2748d60c072so881728a91.1
        for <asahi@lists.linux.dev>; Fri, 15 Sep 2023 02:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694771146; x=1695375946;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1VBwuYXQUntYei3UdowzwFY82byxmtnNnjvSqOT3Vs=;
        b=bGBhjgfhyAgkjW+nxNoO4evfYxVY12o7jxgxjUobDAB2tvE2rHrR4Tyw7cxodLaTF5
         MiL5zfHLOY2agHV6EZ3FJoZPkB2T6Zyw6ghHWFw4lqu5ZC18MG24DOFaauLM3hRhjkP3
         pPXhonG7HdhOZsKRkvAEShgZnfN4AsuG4Wzwd5iCo/lLq8wXST5VBuSlD7bC8x0z0ABE
         B9R7T4FkehLB0qzC7o5k+3Ecz2BkY29UWFyR836J8Xm9yypvP5JSXHT39acKkTQZgP1q
         mP8Hlv++cbEcCYx9aIUu9InGF1lL/whIi+SQeWD4sSBrAOYJsrzQoU2hZaG4rAiEXwvH
         EVvQ==
X-Gm-Message-State: AOJu0YwFvKIpfEKHTc/K9mEKZeDHdHClJywZEZQsS/e4+r0vffVU57QT
	xKgBLtak3MOmuFGdSyJMdSi79gvna6bx/K5NqYS/qVeAeI8OvSq+85sWAMj6sGqbl2fH9VYBHrw
	gfX89nTqplGZ8zx5UO4oNjm/VWkw1PO8=
X-Received: by 2002:a17:90a:488e:b0:25c:8b5e:814 with SMTP id b14-20020a17090a488e00b0025c8b5e0814mr905167pjh.44.1694771146514;
        Fri, 15 Sep 2023 02:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+w0KCMY2aOS5+Qti0qYHaaiMfOlm1MoZJGYHxoE7tu1gXi7tNdwS+brqiPhBxoPCU8oo/3Z3q4o6FnaJnUN8=
X-Received: by 2002:a17:90a:488e:b0:25c:8b5e:814 with SMTP id
 b14-20020a17090a488e00b0025c8b5e0814mr905153pjh.44.1694771146206; Fri, 15 Sep
 2023 02:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230915092003.658361-1-ulf.hansson@linaro.org> <20230915092003.658361-5-ulf.hansson@linaro.org>
In-Reply-To: <20230915092003.658361-5-ulf.hansson@linaro.org>
From: Eric Curtin <ecurtin@redhat.com>
Date: Fri, 15 Sep 2023 10:45:10 +0100
Message-ID: <CAOgh=FzNordx=_YMiQs2Uj6JQ7Ctqqi=XZbbRAY9cS-F8v68RA@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] pmdomain: apple: Move Kconfig option to the
 pmdomain subsystem
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 Sept 2023 at 10:29, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> The Kconfig option belongs closer to the corresponding implementation,
> hence let's move it from the soc subsystem to the pmdomain subsystem.
>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Sven Peter <sven@svenpeter.dev>
> Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Cc: <asahi@lists.linux.dev>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

This patch in the patchset looks the same as yesterday, so...

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

