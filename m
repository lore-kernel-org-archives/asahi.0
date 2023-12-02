Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8836C623
	for <asahi@lists.linux.dev>; Sat,  2 Dec 2023 00:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c9b8363683so34515601fa.3
        for <asahi@lists.linux.dev>; Fri, 01 Dec 2023 16:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701478502; x=1702083302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9Q0mqrHI60oqqAcl92jZhbzuOKaiPGGNZGxwhtg0Ow=;
        b=OQCDIEf1dl18byD1tTGkSDf+UrARPpt3izEq/A7DWd7m4MDj/HAmuPuOXWpD58syKd
         9i2IfsWKEFWY7oi4d6LJmaPxdjBO+ClRW3ROfExP6nYRa0ZmJW2zYIQx/khMkuFpn+fb
         1TMVQQgPU1NSSkLmFOFLie28q/I9KeENnmZUKW5kqbZvSr04KjxF4CQrbwc/hDABEh5a
         EBCP3KLDHPjGg6tmeMmP1+wxGHQnA31oLoSOLW/NPWgEO/nEqVmFvneeo4l7j0zDudy2
         EDkSv23BOV0znsbo7VP1QQrN2r5pwLLg55NsW6ggiPtRdmrum8yvxdqJI+dC+PKvQxqF
         5Z7A==
X-Gm-Message-State: AOJu0Yxz9cTUM7QWvNr4NBbwJ56yWkNXSfucyF7KtypyCMceuNspW6N+
	h5RdSrnqkIvX9VX5e8Ok6qeSjZxzeFlscX1o
X-Google-Smtp-Source: AGHT+IFV/5mQ3clPFqSxHLAO7IommyzxIkqLuBToMCWRcspyoK90K5mPkJi+HHJ8Br7visUtD9Tt9g==
X-Received: by 2002:a2e:350f:0:b0:2c9:d874:6f01 with SMTP id z15-20020a2e350f000000b002c9d8746f01mr1286861ljz.94.1701478501616;
        Fri, 01 Dec 2023 16:55:01 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id w11-20020a2e300b000000b002c01ff8442fsm554391ljw.130.2023.12.01.16.55.01
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 16:55:01 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50be58a751cso303027e87.2
        for <asahi@lists.linux.dev>; Fri, 01 Dec 2023 16:55:01 -0800 (PST)
X-Received: by 2002:a05:6512:793:b0:50b:d763:fe69 with SMTP id
 x19-20020a056512079300b0050bd763fe69mr1151445lfr.132.1701478500997; Fri, 01
 Dec 2023 16:55:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231201-apple_t602x_extend_memmap-v2-1-a3831a0f3105@jannau.net>
In-Reply-To: <20231201-apple_t602x_extend_memmap-v2-1-a3831a0f3105@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 1 Dec 2023 19:54:24 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-xkN6fP3_M84XaAbOutXuOR-K8GrybNA--SqTdQgEGKA@mail.gmail.com>
Message-ID: <CAEg-Je-xkN6fP3_M84XaAbOutXuOR-K8GrybNA--SqTdQgEGKA@mail.gmail.com>
Subject: Re: [PATCH v2] arm: apple: t602x: Add missing MMIO regions to memmap
To: j@jannau.net
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 2:12=E2=80=AFAM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> From: Janne Grunau <j@jannau.net>
>
> The memory maps for Apple's M2 Pro/Max/Ultra left MMIO space out which
> was not used by any driver at the time. The display out exposed as
> simple-framebuffer use a power-domain controlled by a device in an
> unmapped region.
> Add a map covering this region as well as another MMIO region in the
> range 0x4'0000'0000 - 0x5'0000'0000. The added regions cover all MMIO
> annotated in Apple's device tree in this range.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - use SZ_1G as block size
> - Link to v1: https://lore.kernel.org/r/20231130-apple_t602x_extend_memma=
p-v1-1-cd96b251d2dc@jannau.net
> ---
>  arch/arm/mach-apple/board.c | 48 +++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
> index 47393babbc..7a6151a972 100644
> --- a/arch/arm/mach-apple/board.c
> +++ b/arch/arm/mach-apple/board.c
> @@ -370,6 +370,22 @@ static struct mm_region t6020_mem_map[] =3D {
>                 .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
>                          PTE_BLOCK_NON_SHARE |
>                          PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt =3D 0x400000000,
> +               .phys =3D 0x400000000,
> +               .size =3D SZ_1G,
> +               .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt =3D 0x480000000,
> +               .phys =3D 0x480000000,
> +               .size =3D SZ_1G,
> +               .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
>         }, {
>                 /* I/O */
>                 .virt =3D 0x580000000,
> @@ -471,6 +487,22 @@ static struct mm_region t6022_mem_map[] =3D {
>                 .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
>                          PTE_BLOCK_NON_SHARE |
>                          PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt =3D 0x400000000,
> +               .phys =3D 0x400000000,
> +               .size =3D SZ_1G,
> +               .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt =3D 0x480000000,
> +               .phys =3D 0x480000000,
> +               .size =3D SZ_1G,
> +               .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
>         }, {
>                 /* I/O */
>                 .virt =3D 0x580000000,
> @@ -551,6 +583,22 @@ static struct mm_region t6022_mem_map[] =3D {
>                 .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
>                          PTE_BLOCK_NON_SHARE |
>                          PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt =3D 0x2400000000,
> +               .phys =3D 0x2400000000,
> +               .size =3D SZ_1G,
> +               .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt =3D 0x2480000000,
> +               .phys =3D 0x2480000000,
> +               .size =3D SZ_1G,
> +               .attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
>         }, {
>                 /* I/O */
>                 .virt =3D 0x2580000000,
>
> ---
> base-commit: 43f2873fa98b1da6eb56d756315c7bd7db63db27
> change-id: 20231130-apple_t602x_extend_memmap-c82c522ca8c0
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
