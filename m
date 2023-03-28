Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD24B79C5
	for <asahi@lists.linux.dev>; Tue, 28 Mar 2023 13:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680010677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0ELZOPdZ9ahXmREqv/BhJUnUwXaKs9loNrBEDp7bMYI=;
	b=Ze3ieIrtdDrnklOdOXFw4Ak4f9gaYzHxX37I/MjBxaEfQQJu6dkv1NiNXXJxZ+/fRp7Cq8
	BpXmwgIRldATr+FQ2zxpzYqfgFAC2IcLV4BIjz1vXmLkjG8y3aiNofi84/5G56kqirTzpq
	cv3CX3AlRpuy/Z6esUejXMl9p/9TqBE=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-kYJLfaUINXCyoy2aGSo3og-1; Tue, 28 Mar 2023 09:37:56 -0400
X-MC-Unique: kYJLfaUINXCyoy2aGSo3og-1
Received: by mail-vs1-f71.google.com with SMTP id v25-20020a67c899000000b0042600f009c3so3595597vsk.4
        for <asahi@lists.linux.dev>; Tue, 28 Mar 2023 06:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ELZOPdZ9ahXmREqv/BhJUnUwXaKs9loNrBEDp7bMYI=;
        b=cJAyx3KMWOcCdgSmN4F9jaoy062uCQpohnr0WhQw9O9n9uVZhzrotATJxZrjtiuSay
         dvIhzE+FPUDWiujDTWweXZgkW21eKtA/kEqbdp3g/fAv2XBNck2/ZxcpME3rEbKOYZF/
         R6luGLoXlUzYkSG1Ebr6+aNsjWvEa5TOF8wttMX9YEfJfdkQjYDFif3pDhVHii+6ZDz+
         RkkvigP7S4lRqi1jF6Y7wUvHhV77QtcnBMfW6UexmSEqfGfL/5+6jJekQY/byPpqeeiz
         U7A52+q6Yzl1eqeHO08zfYisMJHqbuhKDn+wC2anN542ZmHFumWJj5auwqv3oMbXsGBc
         yuPA==
X-Gm-Message-State: AAQBX9dqF+/OJhq4mL/pXg810RA7ygXn0vgS1gi5seet3l3lyjKg7oiN
	g8H7H3lG725zYl104n7QCddZnBd2iVEXWM4XzNIiaDxmQL8liaPdZ4bllEtTZsNUBsgO9iAwNdA
	mNaJtydCgaqxanwnwi/KZudnR80IyNRs=
X-Received: by 2002:a67:e019:0:b0:414:4ef3:839 with SMTP id c25-20020a67e019000000b004144ef30839mr8886924vsl.7.1680010676039;
        Tue, 28 Mar 2023 06:37:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bzHkjamopCB/emRy4NpYC/2MwLux+aQLEq3yqt9nVX8wJmaY8K25Ik9PrNlj0PPs8GQigV6hE6mUYphSPV40A=
X-Received: by 2002:a67:e019:0:b0:414:4ef3:839 with SMTP id
 c25-20020a67e019000000b004144ef30839mr8886911vsl.7.1680010675788; Tue, 28 Mar
 2023 06:37:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230328-soc-mailbox-v1-0-3953814532fd@marcan.st> <20230328-soc-mailbox-v1-5-3953814532fd@marcan.st>
In-Reply-To: <20230328-soc-mailbox-v1-5-3953814532fd@marcan.st>
From: Eric Curtin <ecurtin@redhat.com>
Date: Tue, 28 Mar 2023 14:37:39 +0100
Message-ID: <CAOgh=FxjuMnpiyjsEebsnf8rEoZFkRQfnRLAiu3zAGttw8Y3iw@mail.gmail.com>
Subject: Re: [PATCH 5/5] soc: apple: mailbox: Rename config symbol to APPLE_MAILBOX
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Mar 2023 at 14:21, Hector Martin <marcan@marcan.st> wrote:
>
> With the original owner of APPLE_MAILBOX removed, let's rename the new
> APPLE_MBOX to the old name. This avoids .config churn for downstream
> users, and leaves us with an identical config symbol and module name as
> before.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>

Watched the stream

Acked-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/soc/apple/Kconfig  | 5 ++---
>  drivers/soc/apple/Makefile | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
> index d0e29bbd8c6f..c5203c388bf4 100644
> --- a/drivers/soc/apple/Kconfig
> +++ b/drivers/soc/apple/Kconfig
> @@ -17,11 +17,10 @@ config APPLE_PMGR_PWRSTATE
>           controls for SoC devices. This driver manages them through the
>           generic power domain framework, and also provides reset support.
>
> -config APPLE_MBOX
> +config APPLE_MAILBOX
>         tristate "Apple SoC mailboxes"
>         depends on PM
>         depends on ARCH_APPLE || (64BIT && COMPILE_TEST)
> -       depends on !APPLE_MAILBOX
>         default ARCH_APPLE
>         help
>           Apple SoCs have various co-processors required for certain
> @@ -33,7 +32,7 @@ config APPLE_MBOX
>
>  config APPLE_RTKIT
>         tristate "Apple RTKit co-processor IPC protocol"
> -       depends on APPLE_MBOX
> +       depends on APPLE_MAILBOX
>         depends on ARCH_APPLE || COMPILE_TEST
>         default ARCH_APPLE
>         help
> diff --git a/drivers/soc/apple/Makefile b/drivers/soc/apple/Makefile
> index e52edf6a73da..20feee6f3943 100644
> --- a/drivers/soc/apple/Makefile
> +++ b/drivers/soc/apple/Makefile
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_APPLE_PMGR_PWRSTATE)      += apple-pmgr-pwrstate.o
>
> -obj-$(CONFIG_APPLE_MBOX) += apple-mailbox.o
> +obj-$(CONFIG_APPLE_MAILBOX) += apple-mailbox.o
>  apple-mailbox-y = mailbox.o
>
>  obj-$(CONFIG_APPLE_RTKIT) += apple-rtkit.o
>
> --
> 2.40.0
>
>

