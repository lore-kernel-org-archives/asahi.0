Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6974E20B20
	for <asahi@lists.linux.dev>; Fri,  1 Dec 2023 10:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kqx9epO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701426820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kUGBybqkRSK6OmVbAIF6ZaxS5DrFBBIdD3KXr/fsi5o=;
	b=Kqx9epO+Ru5/dI4BwluqVYjYvkej5Ne9kTCySwiRA21G+OyJJYP8rSEOOk6PcxWlKrcxub
	XnXzganvfB077hRGzGvMgP0BxPjJuzs05aSbNnWKS+IxMOevJepnnJ9LFSmN7NOrA9J3tg
	CaCuYdVBG/7lGgqslbz2MNL5fENQIsw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-SWdfvcUpOieZ0UMVRqvIew-1; Fri, 01 Dec 2023 05:33:38 -0500
X-MC-Unique: SWdfvcUpOieZ0UMVRqvIew-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5be154fe98bso396706a12.0
        for <asahi@lists.linux.dev>; Fri, 01 Dec 2023 02:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701426817; x=1702031617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUGBybqkRSK6OmVbAIF6ZaxS5DrFBBIdD3KXr/fsi5o=;
        b=oySfa3wl+RP6YNg9kkQ7SS7x93SoYxJ7v41L27COTLzq73lOdnT9Q78RWkXwRW72s9
         xbUxFysnWLl7/L2kKxAUsuWHczKKdhzPUlRciVjszPrayNxbnK5Zg2MsyvRvB8ucDEX2
         rRobxsA4LK3XLQereN39wq7mzdugjl+nF6R/NyfHuNR1yzW66N6zafNHZXmbhxYANfAA
         5M7Vga1RJNeW+mBI4Ik0sYOxXkjq/M5nxMu4g/meCICP0tq6EnHj8J5M+AVR9D8CLSb3
         RLzt9fQZ/9DDyD9FEJ1+rQPjf/4Jdrz2tHqeMbNYb4d937vzW9LEUkLxs+PiGA7J8Ty2
         yCAQ==
X-Gm-Message-State: AOJu0YzQE2bzbz9coyrAVCt7p46joTkCFhQ5+3OFyYcNqaGaHH03Xp66
	sLoIsLxdGuwX8ATlQvnmsoTtPPUZ7kNoxwxmbUvaocEfwDemiNJst0jfpJxHP6kE39fSSpXCjfz
	RMT1oBFW59wzZ0Hsyc95ygK24Vq7Cmb4=
X-Received: by 2002:a17:90b:a14:b0:286:424b:5be2 with SMTP id gg20-20020a17090b0a1400b00286424b5be2mr5265388pjb.21.1701426817428;
        Fri, 01 Dec 2023 02:33:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESEcVcuWL3WyelI6GPfSxh6R2nxgKVIAvS3MhXrvFTq2zcFiM65ZAFrL0lG3z21JeWFvnSpGBe9Su1u3GrIAw=
X-Received: by 2002:a17:90b:a14:b0:286:424b:5be2 with SMTP id
 gg20-20020a17090b0a1400b00286424b5be2mr5265375pjb.21.1701426817147; Fri, 01
 Dec 2023 02:33:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231201-apple_t602x_extend_memmap-v2-1-a3831a0f3105@jannau.net>
In-Reply-To: <20231201-apple_t602x_extend_memmap-v2-1-a3831a0f3105@jannau.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Fri, 1 Dec 2023 10:33:00 +0000
Message-ID: <CAOgh=FyOpcWm_tBX8PQRRDC3C+GmTkObExBSXCk_VLKwQ2xSEg@mail.gmail.com>
Subject: Re: [PATCH v2] arm: apple: t602x: Add missing MMIO regions to memmap
To: j@jannau.net
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, u-boot@lists.denx.de, 
	asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Dec 2023 at 07:20, Janne Grunau via B4 Relay
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

Review comments addressed.

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
> Changes in v2:
> - use SZ_1G as block size
> - Link to v1: https://lore.kernel.org/r/20231130-apple_t602x_extend_memmap-v1-1-cd96b251d2dc@jannau.net
> ---
>  arch/arm/mach-apple/board.c | 48 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>
> diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
> index 47393babbc..7a6151a972 100644
> --- a/arch/arm/mach-apple/board.c
> +++ b/arch/arm/mach-apple/board.c
> @@ -370,6 +370,22 @@ static struct mm_region t6020_mem_map[] = {
>                 .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
>                          PTE_BLOCK_NON_SHARE |
>                          PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt = 0x400000000,
> +               .phys = 0x400000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt = 0x480000000,
> +               .phys = 0x480000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
>         }, {
>                 /* I/O */
>                 .virt = 0x580000000,
> @@ -471,6 +487,22 @@ static struct mm_region t6022_mem_map[] = {
>                 .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
>                          PTE_BLOCK_NON_SHARE |
>                          PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt = 0x400000000,
> +               .phys = 0x400000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt = 0x480000000,
> +               .phys = 0x480000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
>         }, {
>                 /* I/O */
>                 .virt = 0x580000000,
> @@ -551,6 +583,22 @@ static struct mm_region t6022_mem_map[] = {
>                 .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
>                          PTE_BLOCK_NON_SHARE |
>                          PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt = 0x2400000000,
> +               .phys = 0x2400000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt = 0x2480000000,
> +               .phys = 0x2480000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                       PTE_BLOCK_NON_SHARE |
> +                       PTE_BLOCK_PXN | PTE_BLOCK_UXN
>         }, {
>                 /* I/O */
>                 .virt = 0x2580000000,
>
> ---
> base-commit: 43f2873fa98b1da6eb56d756315c7bd7db63db27
> change-id: 20231130-apple_t602x_extend_memmap-c82c522ca8c0
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>
>

