Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDF7DF43
	for <asahi@lists.linux.dev>; Fri, 15 Sep 2023 11:47:21 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-d7f1bc4ece3so2039098276.1
        for <asahi@lists.linux.dev>; Fri, 15 Sep 2023 04:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694778440; x=1695383240; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pKvJMFgrnKfiKIEIwaAMBoyLZ9Folrq2rV1ccO7Uz70=;
        b=wia2OC2QegGVACxQoN/BOOwUpdHZeuYZjqkzm9bXz2Fa9SSY0IJlraInoghnkd0cXa
         u66Fj8pmt8gMcnKidBr34pM76Rxo8eu3uIoBBYTnsSJa4LfgjCSlgHCi8wJw6opB6plK
         QZxwYQNXDoURfkIWmXdk8QoqCNikxYMtgPrb+QPyhQ5zj8KLEAkGAbJqrcgU5uGjnny/
         xEhQ0QAUsMunRZLJ1gJufBzxXLDzCPwZgdmACVfSESIES3IX7tfkRqNiijDooDfmqSy7
         19oexfp7SNNMw6kHt0uo7kllL6Xzy2IzbR6FlBvTbq2jC1IdB17Fz7sbyDTEEL8vSHth
         I/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694778440; x=1695383240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKvJMFgrnKfiKIEIwaAMBoyLZ9Folrq2rV1ccO7Uz70=;
        b=SAAItosZP+9OTos9pLUD6ZzGNtyM8oEPfODFj9m0eKFGIL0R824SKZzXrNvYHx0mMo
         iMXY+l85XKqEd5bvEHEHL02RDs0azYhfZi5XEpQnRtNB/i4ZrTecED1LihYhSoczYo+Z
         JP1jG1/T3INs6qhMOrpf8+flk+QAIPoOL5Sj9G8FePwbSA5CK7vW55nCMIq2CoHlOL74
         ZiBkbfhPFwOGG9P8Dz44UJvhBbRG2QcRY6vkni4DFzYM4LyXRSJqPQMbnkFt9+167rVD
         fttXIEE1tJuwVsZQNb7Hx6qYG5J1xHtfUX3aHfwvAl3qg1rCshRPE8kUz2Gn5zj+zcMk
         NK6A==
X-Gm-Message-State: AOJu0YzRts/Sv5/7InzCg/fEDxeIRJHYKqleONqJMUvcrnTjXYc+/Br6
	4S+pBTZHnlFozboHVdf7n4tWZxWpK0UMmWoeu0fpjA==
X-Google-Smtp-Source: AGHT+IHNjbPocfOapzruHHkOSM0gBYdeN9YzEb9OGi/a0yQ9a+TId3ZzRP/xtB5m5r4YaOhU3X77DPcN8RZinfnXLMw=
X-Received: by 2002:a25:d450:0:b0:d81:61fd:ef5d with SMTP id
 m77-20020a25d450000000b00d8161fdef5dmr1350219ybf.27.1694778440112; Fri, 15
 Sep 2023 04:47:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230915092003.658361-1-ulf.hansson@linaro.org>
 <20230915092003.658361-5-ulf.hansson@linaro.org> <CAOgh=FzNordx=_YMiQs2Uj6JQ7Ctqqi=XZbbRAY9cS-F8v68RA@mail.gmail.com>
In-Reply-To: <CAOgh=FzNordx=_YMiQs2Uj6JQ7Ctqqi=XZbbRAY9cS-F8v68RA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 15 Sep 2023 13:46:44 +0200
Message-ID: <CAPDyKFpYRwDGbYajVK8MMDjf=0ab-ZpMH2QXKUsVAFy0kh-iYA@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] pmdomain: apple: Move Kconfig option to the
 pmdomain subsystem
To: Eric Curtin <ecurtin@redhat.com>, Neal Gompa <neal@gompa.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

+ Neal

On Fri, 15 Sept 2023 at 11:45, Eric Curtin <ecurtin@redhat.com> wrote:
>
> On Fri, 15 Sept 2023 at 10:29, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > The Kconfig option belongs closer to the corresponding implementation,
> > hence let's move it from the soc subsystem to the pmdomain subsystem.
> >
> > Cc: Hector Martin <marcan@marcan.st>
> > Cc: Sven Peter <sven@svenpeter.dev>
> > Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> > Cc: <asahi@lists.linux.dev>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> This patch in the patchset looks the same as yesterday, so...
>
> Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Yes my bad, again. I forgot to add yours and Neal's tags, sorry.

Thanks!

Kind regards
Uffe

>
> Is mise le meas/Regards,
>
> Eric Curtin
>
> > ---
> >  drivers/pmdomain/Kconfig       |  1 +
> >  drivers/pmdomain/apple/Kconfig | 18 ++++++++++++++++++
> >  drivers/soc/apple/Kconfig      | 13 -------------
> >  3 files changed, 19 insertions(+), 13 deletions(-)
> >  create mode 100644 drivers/pmdomain/apple/Kconfig
> >
> > diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
> > index 03c8991ad0fd..482d9e970e14 100644
> > --- a/drivers/pmdomain/Kconfig
> > +++ b/drivers/pmdomain/Kconfig
> > @@ -3,5 +3,6 @@ menu "PM Domains"
> >
> >  source "drivers/pmdomain/actions/Kconfig"
> >  source "drivers/pmdomain/amlogic/Kconfig"
> > +source "drivers/pmdomain/apple/Kconfig"
> >
> >  endmenu
> > diff --git a/drivers/pmdomain/apple/Kconfig b/drivers/pmdomain/apple/Kconfig
> > new file mode 100644
> > index 000000000000..12237cbcfaa9
> > --- /dev/null
> > +++ b/drivers/pmdomain/apple/Kconfig
> > @@ -0,0 +1,18 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +if ARCH_APPLE || COMPILE_TEST
> > +
> > +config APPLE_PMGR_PWRSTATE
> > +       bool "Apple SoC PMGR power state control"
> > +       depends on PM
> > +       select REGMAP
> > +       select MFD_SYSCON
> > +       select PM_GENERIC_DOMAINS
> > +       select RESET_CONTROLLER
> > +       default ARCH_APPLE
> > +       help
> > +         The PMGR block in Apple SoCs provides high-level power state
> > +         controls for SoC devices. This driver manages them through the
> > +         generic power domain framework, and also provides reset support.
> > +
> > +endif
> > diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
> > index a1596fefacff..eff486a77337 100644
> > --- a/drivers/soc/apple/Kconfig
> > +++ b/drivers/soc/apple/Kconfig
> > @@ -4,19 +4,6 @@ if ARCH_APPLE || COMPILE_TEST
> >
> >  menu "Apple SoC drivers"
> >
> > -config APPLE_PMGR_PWRSTATE
> > -       bool "Apple SoC PMGR power state control"
> > -       depends on PM
> > -       select REGMAP
> > -       select MFD_SYSCON
> > -       select PM_GENERIC_DOMAINS
> > -       select RESET_CONTROLLER
> > -       default ARCH_APPLE
> > -       help
> > -         The PMGR block in Apple SoCs provides high-level power state
> > -         controls for SoC devices. This driver manages them through the
> > -         generic power domain framework, and also provides reset support.
> > -
> >  config APPLE_RTKIT
> >         tristate "Apple RTKit co-processor IPC protocol"
> >         depends on MAILBOX
> > --
> > 2.34.1
> >
> >
>
