Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B92F37
	for <asahi@lists.linux.dev>; Fri, 31 Mar 2023 13:28:19 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id ek18so89626790edb.6
        for <asahi@lists.linux.dev>; Fri, 31 Mar 2023 06:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680269297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9kQgeyK17OKmqbFzH4IRm1k3jZcfLqZAx4ecVwrUaE=;
        b=rdBUxDqWcuJAWu8LuiLEesEWoT8n14SxBxFHxj517h3l+R6ojDNRFDy1Neuz4ARGiT
         d49be+Mn5W49vwTfeO6nLxcLsV2jprfJnIJIwbNY0XJeDFhaQX9YGCf1wMA3T0sI+Yk9
         aoB24W9Qmm9mg91qjZY7HZPMJ+K9nPm7JOAqO83Jw0wXHSb9wqRx8dM8qF8+KuHPzLLf
         RGIuQLBLV/fZWxJoL+seAVSkok9oEGZ/7IUrQnfOgCevsAzCDo3JxhhIyMWd6Hdh1o8B
         nEHSwlk3WC1o6suAHfEDjOq1OrZxSwPrd5hn0wM+sovnFTyBpd4ChYgCmHuiQlqPSgFp
         w/0A==
X-Gm-Message-State: AAQBX9dBzQvxxILAFHjsNgldQhtRi5Atn4saRHtWhBtd6Bn6yKtwAefX
	K4HuC5AHmUI4o/cnEyISHIRSHOwEfyYisw==
X-Google-Smtp-Source: AKy350YTr8OfDwpS7886GV6osWVLqRgcIB4yU/+ywUYxQKt3nWPiki+dIDONzkRIO8eS0hLestRzLQ==
X-Received: by 2002:aa7:c2d2:0:b0:4ad:7224:ce9d with SMTP id m18-20020aa7c2d2000000b004ad7224ce9dmr26424065edp.17.1680269297242;
        Fri, 31 Mar 2023 06:28:17 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id t20-20020a50d714000000b005021d17d896sm1056813edi.21.2023.03.31.06.28.16
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 06:28:16 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id w9so89608316edc.3
        for <asahi@lists.linux.dev>; Fri, 31 Mar 2023 06:28:16 -0700 (PDT)
X-Received: by 2002:a17:907:a412:b0:947:9f2a:8ca4 with SMTP id
 sg18-20020a170907a41200b009479f2a8ca4mr1531769ejc.9.1680269296254; Fri, 31
 Mar 2023 06:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230328-soc-mailbox-v1-0-3953814532fd@marcan.st>
In-Reply-To: <20230328-soc-mailbox-v1-0-3953814532fd@marcan.st>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 31 Mar 2023 09:27:39 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-hO5F5AbjftFXYmVEJadkUAoV6-PUbk1HVTQnTRyD1mg@mail.gmail.com>
Message-ID: <CAEg-Je-hO5F5AbjftFXYmVEJadkUAoV6-PUbk1HVTQnTRyD1mg@mail.gmail.com>
Subject: Re: [PATCH 0/5] mailbox: apple: Move driver into soc/apple and stop
 using the subsystem
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 9:14=E2=80=AFAM Hector Martin <marcan@marcan.st> wr=
ote:
>
> Once upon a time, Apple machines had some mailbox hardware, and we had
> to write a driver for it. And since it was a mailbox, it felt natural to
> use the Linux mailbox subsystem.
>
> More than a year later, it has become evident that was not the right
> decision.
>
> Linux driver class subsystems generally exist for a few purposes:
> 1. To allow mixing and matching generic producers and consumers.
> 2. To implement common code that is likely to be shared across drivers,
>    and do so correctly so correct code only has to be written once.
> 3. To force drivers into a "correct" design, such that driver authors
>    avoid common pitfalls.
>
> The mailbox subsystem does not do any of the above for us:
> 1. Mailbox hardware is not generic; "mailbox" is a vague idea, not a
>    standard for communication. Almost all mailbox consumers are tied to
>    one or a few producers. There is practically no mixing and matching
>    possible. We have one (1) consumer subsystem (RTKit) talking to one
>    (1) mailbox driver (apple-mailbox). We might have a second consumer
>    in the future (SEP), but there will still be no useful
>    combinatronics with other drivers.
> 2. The mailbox subsystem implements a bunch of common code for queuing,
>    but we don't need that because our hardware has hardware queues. It
>    also implements a bunch of common code for supporting multiple
>    channels, but we don't need that because our hardware only has one
>    channel (it has "endpoints" but those are just tags that are part of
>    the message). On top of this, the mailbox subsystem makes design
>    decisions unsuitable for our use case. Its queuing implementation
>    has a fixed queue size and fails sends when full instead of pushing
>    back by blocking, which is completely unsuitable for high-traffic
>    mailboxes with hard reliability requirements, such as ours. We've
>    also run into multiple issues around using mailbox in an atomic
>    context (required for SMC reboot/shutdown requests).
> 3. Mailbox doesn't really do much for us as far as driver design.
>    If anything, it has been forcing us to add extra workarounds for the
>    impedance mismatches between the subsystem core and the hardware.
>    Other drivers already are inconsistent in how they use the mailbox
>    core, because the documentation is unclear on various details.
>
> The interface for mailboxes is very simple - basically just a send() and
> a receive callback. This series quite literally just rips out the
> middleman, and connects both sides together directly. There just isn't
> anything useful the mailbox common code is doing for us - it's just a
> pile of complexity in the middle that adds bugs, impedance mismatches,
> overhead, and offers no extra features we can use.
>
> This series offers:
>
> - A modest reduction in overall code size (-27 net lines excluding #1).
> - Fixes a pile of bugs related to using the mailbox subsystem and its
>   quirks and limitations (race conditions when messages are already in
>   the queue on startup, atomic issues, the list goes on).
> - Adds runtime-PM support.
> - Adds support for the FIFOs in the mailbox hardware, improving
>   performance.
> - Simplifies code by removing extraneous memory allocations (the
>   mailbox subsystem requires consumers to pass pointers to messages,
>   instead of inlining them, even though messages are usually only one or
>   two registers in size) and the requisite cleanup/freeing in the
>   completion path.
>
> In addition, it paves the way for future Apple-specific mailbox
> optimizations, such as adding the ability to de-duplicate message sends
> if the same message is already known to be in the FIFO (which can be
> done by keeping a rolling history of recently sent messages). This is
> useful for doorbell-style messages, which are redundant to send more
> than once if not yet processed.
>
> Apple Silicon platforms use these mailboxes pervasively, including as
> part of the GPU submission hot path. On top of that, bad interactions
> with firmware coprocessors can cause immediate lockups or crashes with
> no recovery possible but a reboot. Our requirements for reliability and
> performance are probably much higher than the average mailbox user, and
> we'd much rather not have a bunch of common code getting in the way of
> performance profiling and future optimization. It doesn't make much
> sense for the mailbox subsystem either, since solving these issues would
> require major refactoring that is unlikely to provide significant
> benefit to most other users.
>
> So let's just call usage of the mailbox subsystem a failed experiment,
> and move the driver into soc/apple, where we can control the API and can
> add whatever peculiarities we need for our mailboxes. Farewell, mailbox.
>
> There are no changes to the DT bindings. This driver has been shipping
> in Asahi stable kernel packages for a week, with no regressions
> reported by any users.
>
> As an additional non-kernel-related benefit, this introduces a direct
> module dependency between consumers and the mailbox producer. This, in
> turn, is in the critical path for the NVMe driver on these platforms.
> Prior to this series, we had to have custom initramfs hooks to add
> apple-mailbox to distro initramfses, and accidentally removing these
> hooks would result in a completely unbootable system (there is no way
> for standard initramfs machinery to detect soft consumer/producer
> relationships like this, they usually just go looking for block device
> modules and their direct dependencies). We still need the initramfs
> hooks for other things, but with this change, completely removing all
> Apple-related initramfs hooks will at least result in a *bootable*
> system so you can fix the problem. This has already bit several users,
> and it also means many more distros have a chance of working out of the
> box (enough to let you install extra stuff) on these platforms, instead
> of having a hard requirement that *every single distro* fix up their
> initramfs generation in order to even boot/install on these platforms at
> all.
>
> Jassi: Ideally I'd like to get an ack on this and merge it all through
> asahi-soc, so we don't have to play things patch-by-patch across
> multiple merge cycles to avoid potentially broken intermediate states.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
> Hector Martin (5):
>       soc: apple: rtkit: Get rid of apple_rtkit_send_message_wait
>       soc: apple: mailbox: Add ASC/M3 mailbox driver
>       soc: apple: rtkit: Port to the internal mailbox driver
>       mailbox: apple: Delete driver
>       soc: apple: mailbox: Rename config symbol to APPLE_MAILBOX
>
>  MAINTAINERS                        |   2 -
>  drivers/mailbox/Kconfig            |  12 -
>  drivers/mailbox/Makefile           |   2 -
>  drivers/mailbox/apple-mailbox.c    | 441 -------------------------------=
------
>  drivers/soc/apple/Kconfig          |  15 +-
>  drivers/soc/apple/Makefile         |   3 +
>  drivers/soc/apple/mailbox.c        | 434 +++++++++++++++++++++++++++++++=
+++++
>  drivers/soc/apple/mailbox.h        |  48 ++++
>  drivers/soc/apple/rtkit-internal.h |   8 +-
>  drivers/soc/apple/rtkit.c          | 133 +++--------
>  include/linux/apple-mailbox.h      |  19 --
>  include/linux/soc/apple/rtkit.h    |  18 --
>  12 files changed, 529 insertions(+), 606 deletions(-)
> ---
> base-commit: bdfe6de2695c5bccc663a5a7d530f81925d8bc10
> change-id: 20230328-soc-mailbox-3cb6bb2b0b2d
>
> Best regards,
> --
> Hector Martin <marcan@marcan.st>
>
>

Series LGTM.

Acked-by: Neal Gompa <neal@gompa.dev>



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
