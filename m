Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E460E2578
	for <asahi@lists.linux.dev>; Mon, 20 Feb 2023 09:51:01 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id df34so1922640vsb.6
        for <asahi@lists.linux.dev>; Mon, 20 Feb 2023 01:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ubrSGGpo/lB1Nbx8tNcTbrObPXZHojbGZX+fWT2u70=;
        b=AlIFBSPCK/k3ooNjwrY3lEN2lm36QZxhwfzlGT3bvzW8aQz4IqFW7iJ3DySrB1UU3R
         hGKjfUpWjD4Mq1shhoT4OyOZrRIJAcqgzCJUrkRPx3ViLm6dzXSyIrSTtTyVY12ig6an
         DFu0ryJzx7wuiFcWiKQ+OcdPJIYmLnH7VNHAY0aJHF+cDgE7Jlj1JDHQ5sQ+IRVz7+CX
         5EwaYEnsOkHn4ipR/mVJCwcrf+hwMcfzu7BVYnOzNelFy/Zyz0CfOH0TSQk4FqlddsOP
         +fvjdjTLHl3LhxMm7zQkcNhsNmcASPhgg4eU8dDSxP9aUrFk7UedzqupicNRIZJ8AaIe
         MBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ubrSGGpo/lB1Nbx8tNcTbrObPXZHojbGZX+fWT2u70=;
        b=FVS+kKVyiWn+VWNwbh6Zg1OweJ30nusIhzDM0x0n9BUc50mU2oFPP3hwNa4ksUv8hS
         Q/aIPgrhtOeVCnS1iN0d5FpXAhP653bKA6KMUg9G9qv8DlKBIzNXM2ZmNFGE7q01DAB1
         ZYAdoDvkka5eg2Vqk+EfO6G0jA1rlnEwEX9tldvcrpLKzKdbrAfQlY7NShhFmLWs/GgA
         tULteZAzPJn6ov4hGNzBLTYejqQ17vtvD5Za2QxtOyTK20ABwgnHa1VQsJP9Mx4f1qAS
         2LfQX1u2743i8LkViVhNk0hnVWHUA9eZjU/jd3GLdiD9grz0axz+Ue440PQ9EuP6Q/u4
         +UCQ==
X-Gm-Message-State: AO0yUKV3R6gnFzNnqVLNVFrl/OIowlENXpcYsTH4aDzm32sO++/kFnzn
	RtQAhgQq1ssvE3kp3EgpLNXPwV81qoO/qr9UnYNwyg==
X-Google-Smtp-Source: AK7set8Fjc384404hhcu1ncWe0+xFejdg760zKN5yMZ6v+4ljTHJn2PYDr/3cyvciFET+aE/LrM8fImcsdeLrAWw1kM=
X-Received: by 2002:a05:6102:a05:b0:412:1c0a:1cbe with SMTP id
 t5-20020a0561020a0500b004121c0a1cbemr476510vsa.58.1676886660624; Mon, 20 Feb
 2023 01:51:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <mhng-a886c4b4-d748-420f-889b-76ada4f9a432@palmer-ri-x1c9> <0a0d1a182cef674a8e70347b2ed6f67b@kernel.org>
In-Reply-To: <0a0d1a182cef674a8e70347b2ed6f67b@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Feb 2023 15:20:47 +0530
Message-ID: <CAK9=C2UkeTRipSjhU6dNWjSOmpZu4S9QFpTE_ycpdZDy0EfJEQ@mail.gmail.com>
Subject: Re: [PATCH v16 0/9] RISC-V IPI Improvements
To: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, 
	daniel.lezcano@linaro.org, marcan@marcan.st, sven@svenpeter.dev, 
	alyssa@rosenzweig.io, atishp@atishpatra.org, 
	Alistair Francis <Alistair.Francis@wdc.com>, anup@brainfault.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 20, 2023 at 2:05 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2023-02-15 03:17, Palmer Dabbelt wrote:
> > On Sun, 05 Feb 2023 03:04:14 PST (-0800), Marc Zyngier wrote:
> >> On Tue, 03 Jan 2023 14:12:12 +0000,
> >> Anup Patel <apatel@ventanamicro.com> wrote:
> >>>
> >>> This series aims to improve IPI support in Linux RISC-V in following
> >>> ways:
> >>>  1) Treat IPIs as normal per-CPU interrupts instead of having custom
> >>> RISC-V
> >>>     specific hooks. This also makes Linux RISC-V IPI support aligned
> >>> with
> >>>     other architectures.
> >>>  2) Remote TLB flushes and icache flushes should prefer local IPIs
> >>> instead
> >>>     of SBI calls whenever we have specialized hardware (such as
> >>> RISC-V AIA
> >>>     IMSIC and RISC-V SWI) which allows S-mode software to directly
> >>> inject
> >>>     IPIs without any assistance from M-mode runtime firmware.
> >>
> >> [...]
> >>
> >> I'm queuing patches 3 and 9 via the irqchip tree as they are
> >> standalone.
> >>
> >> For the rest, I need an Ack from the riscv maintainers as they change
> >> a large amount of arch-specific code, and the couple of irqchip
> >> patches depend on these changes.
> >>
> >> Palmer, Paul?
> >
> > I haven't gotten time to give this a proper review, but I think we've
> > got enough of a mess with our interrupt handling that it doesn't
> > really matter so
> >
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > if you want to take it for this cycle that's fine with me, but I'm
> > also fine holding off so it can have a while to bake in linux-next --
> > there's no real rush for any of this, as there's no hardware yet.
>
> Letting this sort of things simmering in -next is the way.
>
> Now that the basic dependencies are on their way, I'd expect this to be
> rebased on 6.3-rc1, and we can then put the whole thing in -next.

Okay, I will rebase on 6.3-rc1 whenever it is available.

Thanks,
Anup

>
> Thanks,
>
>          M.
> --
> Jazz is not dead. It just smells funny...
