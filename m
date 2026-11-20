Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209696;
	b=Uli6himrayCPva4Da/H1YYv2h+LGv6JVDYmEThnq4RH6Mqk5WxPO6ie6eHQ2QYcd3a0S
	 0mY3pEf360bzixBIiFcvWczj02mhkKObFjPDU3vW9MXQRPzJ7MVfu1XOcYTnpytf1Brbq
	 eBnYSmIAI81jUAmGpLabkT+ikzeAPox0RLk4j3Bgf1jvk1Rw6T8qo9tOgZDD7VWA0mXhn
	 8kKHV30tEF7lGV8Un2FlOes8MbvxWta0OvdF2RepPo1dnUBO4EJKlG8xhkH9XN8wM+oUn
	 aKt6yba+ihmINJA/ujCAjIlX1Ik9zQUcCCEiYr1BhECc+WmttckKUbloYXB+vS2lAgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pg92/TM2Jbz+jpxng0cnysYHqRfAh6lLqL0yIuj3+aw=;
	b=ct+npszAHEFpjFwtgnGlKgcmlQPI0sxTybGEEG59L/gCftAgdtPZWdOjlJu6ClmcwgBj
	 zyQO742u1F8lm+vPmbflDYrbAnPt+AB+tqALROPTtTyd+R/RdagYtZy/0u5O3nr4lbdg8
	 Cug1CbYtAVsbrpLLFKmLJPcaMVE8u0UTRKSeUobUiLWAnYzC4R61skc5iVzaz0YxiOsY0
	 4FQnHWuikWon27chga/dDmn00G1HNSdbU7FRfsQAH0xiR4xn9mGOX6BNaQTyY0XKjAQQ1
	 FWu6kAd7/eDYTEwWfonJ0HnGIhk6tavE3TIcwGd58xnj8TRHqYXsEftKft8h8oYgJzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZqlS5+uF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E39606A6A9
	for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 21:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9E39606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZqlS5+uF
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso1639276d50.0
        for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 13:21:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795209694; cv=none;
        d=google.com; s=arc-20260327;
        b=Lzo5rxtCPDM55+8yltj3V6/tzYj43W6Mek9agdrMCqVf0+2pGjxOsRPoAa+z3XJMkt
         N+vkuTnenIgB2q/XvDaj9mUZ2kRrj+n1aCfsSAV2/Tf9kHJXVgBRJWpbBPdgxUNPWgU8
         2E1lJu5oEOByMZQAt4SLmsdqw7uymIUZEHop8tJmI/g8dfm7sJ8PqHe3sFygQkTH9ZFC
         6egmdTNV0qoPqp42WTh1TDlpchQLNSRX565yIUco8maii6UibRqQx1oJhPcchl5OccgB
         ty/Pk7olQdI20edKd7ZbtFlfSK9zc+LQQKA/Bds5kPaCt/GzG1hpJzqmqwbVQ8NvZQrX
         hmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pg92/TM2Jbz+jpxng0cnysYHqRfAh6lLqL0yIuj3+aw=;
        fh=FoYMZlWXzb2qnvKsHq27dNuqO4QyfZXYNvHYyXeSbmU=;
        b=HlLI65a+lhxXJekzGMzQsGvrwQKxQVP4cZ83y1IVlM8pn+/1PC1f07DAovljX11gZx
         CrWPSLb4aI+Ye/3PBZXjQwjy4dddZiqQh/5M5+yN416pVWp5LD/9bAVuWeTJxzsdljYt
         wF73a/rtq3Fdkr6/h++KAGRiiqNsFtpT1GaBZvvisKMbwqZxJE13idtxY5txrIXgDhol
         J87TidhI4cAUG3ZrJ/z0MI9tbu6sUQyWNYDemWEifxRoWJqUiiyPQpS4hbbnVCeMn3Gp
         Ym9JLIMdYYwkNRQJ+JZ3AWcjODqGg7YIdKm2mscV4xHO6u0VwWN4HzVJaXhNhFgaLU4q
         J52Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795209694; x=1795814494; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pg92/TM2Jbz+jpxng0cnysYHqRfAh6lLqL0yIuj3+aw=;
        b=ZqlS5+uFX/5nRt93/TX5ApEjujWytdg+EIe85dw9CHfrsdzmumZZ/MdZ3ue32MbsNV
         RPnuTyTY0G8eYBvO/VI77WbUu7vo5XnaaOGiNj2vi216dkucbF4Ai+TnL7nkym0VpBq9
         NiDMk9DI3X4tnxY9ikd3NdEKnotNbZDxe95V3APlQiBrrshIOTAUwSeML9iffUAdVcFT
         GpPWJJW93DMgnWKIH7FGY2qMOl22/0np/Tax5BRNp1TDEjuK2M6Myv2lur6DxnyJcrt7
         zwNGWTx5IXoM2Z0gSUy1WOHeUtj2j5qc2tTGBk/i5voHgJKrJn5VzfWH4n1NAH2Ju7L9
         K5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209694; x=1795814494;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pg92/TM2Jbz+jpxng0cnysYHqRfAh6lLqL0yIuj3+aw=;
        b=ileimu2mm8ZKNZnpyGqJ2qzwfSE5v7NKXQnOWjkurcI3ezjVd0/nO9MVnSvff0qVbv
         vCaR1F/2OipwRG28z/YmQQpPAU685nJNB9MjmKC3CrYpRcK1be27rKnJNIO54qSXBK2C
         jTG7KsX3WX+2uixuGFH7V+7p3L0tjpcS4s9h/JT/YGryYxaMRO3kloR5ygS4NfPI92G4
         YiXNt+ZkhMDP8TR/SXjRtBClwRhbLoXWiT2Pfj1Pddy7CX17skEuOS7wP8PFbkQsn+fV
         9tV4vGJRhlJSvLb87NXLQP5LLnyPsOkS6A+QE1eehCQdxuNFI9Dq9PI9OFqx9Wt/cTHW
         4xoQ==
X-Forwarded-Encrypted: i=1; AL+hErHC3/8Aptb01NUISglPVP/vtYXC37c9BUTdyLvyyH/13triKhUd3Z+5a9JGcGltkB3u7/58ig==@lists.linux.dev
X-Gm-Message-State: APuU4Z/wawq8yqx8tPi5TWhx5nyoeG0tAAQYJPfL5SddxByhHta++1eB
	+frBGSifZWpcTUd5KI/igwrf+LFTGqf32P/8P7xNdR7+zhalYgkrLxXkQFi2VBAljdy+Kh3UuO6
	MwcJm5ttOEmAk1WYaMROtn9iBVDeinj9V33uLYYssiHZQy5+Sqk5DmiBGjA==
X-Gm-Gg: AZFdTZfxsrr62Ww+/EhQWNPxPT05ezeSz/JuEJ4zFbPGVxUXeVASa2IJTw6BSwefScm
	F67/aae2NnAIt1P7QFnKV6MQzSaDztA51gXDZ5yLLkTGUvOd8oiEUEpZkISmpXQsrP5EtWMyJqR
	zJw/otPoNHh79/tBtYJiS0RW3FIsJfDVazvS5E1yj8hkEZ8z2ODl4f4ztluvAapLMG7egst7OyH
	ssTPwppMtL8LsB47Elwdw4sG396FPoyetJRQz87OrdQkaMuT3JgNQDYM16yCQgSZr3ZCDj0kvGY
	4OvMw8E09vrcTtKFehJmFBptlb2YBQEhpW4qD8/YdWXXX269pfYHIvEwhyW54hQuM60eKZ8tMzE
	ACqcdkwkJbKgR0lMBMMh19HEE+8+PEX2u8Rz34Vrq3mMSF0scnCkEPIrNCicCcVQfpoTm7f8fBB
	Qq8calROrDgOcwrmUJAx+fkPSQQMwN1Zo9r140WepONvYqsQgXWwfqzLqmMWDjRohNcr3R+otnJ
	ajRpnKzaWrjHMQ8/L/pti+ieylr+BKkn0eVTeRIKn5q5tYyz1JjUJOPpxJPTE2eG6RjxFfJJXbk
	GUvaz7INyRceyIbvvqW/9V//KuwigxmJH7jCuliW8F4SghQNBwC9onPDUzqj9a8YDPkG5Hnn/ho
	R1BrksJtVecLESOT0i+XL0bLZLxVQlqF0ieSpkmvZ4Y9xQTGzKvvGZ5fXvD1EoPhrcuCPxXqQcj
	b8HYsA930rU0oNEumL0JwFDdybPqnQcAiJ2b2zzINI55yNziHRf9DQH06xZsFQ8Befo4YNlMtqr
	28liJrWmgHAKSKzvw==
X-Received: by 2002:a05:690e:4394:b0:679:8db9:517c with SMTP id
 956f58d0204a3-67df42c4560mr879800d50.6.1795209693819; Fri, 20 Nov 2026
 13:21:33 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-apple-t603x-support-v2-0-606b4f5fadc5@jannau.net> <20261120-apple-t603x-support-v2-4-606b4f5fadc5@jannau.net>
In-Reply-To: <20261120-apple-t603x-support-v2-4-606b4f5fadc5@jannau.net>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 20 Nov 2026 23:20:57 +0200
X-Gm-Features: Aa3M54qm88u75vhj-AqcUBzpzlfSq41SF7zzGbK8SEZ8ND7a364JqMTDLnaflzE
Message-ID: <CAC_iWjKy+OjvzG70xS2L1J+wf2D2nQKy_2U7B7hXbCeQw0JZ8A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm: apple: Add Apple M3 Ultra (t6032) support
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, Mark Kettenis <kettenis@openbsd.org>, 
	Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, asahi@lists.linux.dev, 
	Anshul Dalal <anshuld@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 20:53, Janne Grunau <j@jannau.net> wrote:
>
> Apple's M3 Ultra (t6032) SoC consists like its M1 and M2 predecessors of
> two M3 Max dies with an "UltraFusion" interconnect. Since it is only
> used in the Mac Studio the mem map does not need to duplicate all
> entries. Two of the USB4 / Thunderbolt complexes on the second die are
> unused. Only PCIe host controller on the first die is used directly. The
> PCIe IO on the second die is used internally to connect the NVMe
> controller with the NAND flash.
> Most of u-boot's existing drivers are compatible with the hardware and
> M3 Ultra device trees will carry "apple,t8103-*" as fallback compatible
> strings. Only apple-atcphy-reset will use a new compatible as M3 Ultra
> has ThunderBolt 5 / USB4v2 USB-C ports.
>
> Acked-by: Mark Kettenis <kettenis@openbsd.org>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

>  arch/arm/mach-apple/board.c        |   3 +
>  arch/arm/mach-apple/memmap/t6032.h | 136 +++++++++++++++++++++++++++++++++++++
>  doc/board/apple/m1.rst             |   1 +
>  3 files changed, 140 insertions(+)
>
> diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
> index c93c3bd56aa9..ae1b1a7b8a43 100644
> --- a/arch/arm/mach-apple/board.c
> +++ b/arch/arm/mach-apple/board.c
> @@ -21,6 +21,7 @@ DECLARE_GLOBAL_DATA_PTR;
>  #include "memmap/t6020.h"
>  #include "memmap/t6022.h"
>  #include "memmap/t6030.h"
> +#include "memmap/t6032.h"
>  #include "memmap/t8103.h"
>  #include "memmap/t8122.h"
>
> @@ -77,6 +78,8 @@ void build_mem_map(void)
>                  of_machine_is_compatible("apple,t6031") ||
>                  of_machine_is_compatible("apple,t6034"))
>                 mem_map = t6030_mem_map;
> +       else if (of_machine_is_compatible("apple,t6032"))
> +               mem_map = t6032_mem_map;
>         else
>                 panic("Unsupported SoC\n");
>
> diff --git a/arch/arm/mach-apple/memmap/t6032.h b/arch/arm/mach-apple/memmap/t6032.h
> new file mode 100644
> index 000000000000..5616d7f32285
> --- /dev/null
> +++ b/arch/arm/mach-apple/memmap/t6032.h
> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * (C) Copyright 2026 Janne Grunau <j@jannau.net>
> + */
> +
> +#ifndef APPLE_MEM_MAP_T6032_H
> +#define APPLE_MEM_MAP_T6032_H
> +
> +#include <asm/armv8/mmu.h>
> +#include <linux/sizes.h>
> +
> +/* Apple M3 Ultra */
> +static struct mm_region t6032_mem_map[] = {
> +       {
> +               /* I/O */
> +               .virt = 0x280000000,
> +               .phys = 0x280000000,
> +               .size = 2UL * SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                        PTE_BLOCK_NON_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt = 0x300000000,
> +               .phys = 0x300000000,
> +               .size = 3UL * SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                        PTE_BLOCK_NON_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* PCIE */
> +               .virt = 0x580000000,
> +               .phys = 0x580000000,
> +               .size = SZ_512M,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                        PTE_BLOCK_NON_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* PCIE */
> +               .virt = 0x5a0000000,
> +               .phys = 0x5a0000000,
> +               .size = SZ_512M,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRE) |
> +                        PTE_BLOCK_INNER_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* PCIE */
> +               .virt = 0x5c0000000,
> +               .phys = 0x5c0000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRE) |
> +                        PTE_BLOCK_INNER_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O ATC0 */
> +               .virt = 0x700000000,
> +               .phys = 0x700000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                        PTE_BLOCK_NON_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O ATC1 */
> +               .virt = 0xb00000000,
> +               .phys = 0xb00000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                        PTE_BLOCK_NON_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O ATC2 */
> +               .virt = 0xf00000000,
> +               .phys = 0xf00000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                        PTE_BLOCK_NON_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O ATC3 */
> +               .virt = 0x1300000000,
> +               .phys = 0x1300000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                        PTE_BLOCK_NON_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt = 0x2280000000,
> +               .phys = 0x2280000000,
> +               .size = 2UL * SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                        PTE_BLOCK_NON_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O */
> +               .virt = 0x2300000000,
> +               .phys = 0x2300000000,
> +               .size = 3UL * SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                        PTE_BLOCK_NON_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O ATC4 */
> +               .virt = 0x2700000000,
> +               .phys = 0x2700000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                        PTE_BLOCK_NON_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* I/O ATC5 */
> +               .virt = 0x2b00000000,
> +               .phys = 0x2b00000000,
> +               .size = SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
> +                        PTE_BLOCK_NON_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* RAM */
> +               .virt = 0x10000000000,
> +               .phys = 0x10000000000,
> +               .size = 16UL * SZ_1G,
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
> +                        PTE_BLOCK_INNER_SHARE
> +       }, {
> +               /* Framebuffer */
> +               .attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL_NC) |
> +                        PTE_BLOCK_INNER_SHARE |
> +                        PTE_BLOCK_PXN | PTE_BLOCK_UXN
> +       }, {
> +               /* List terminator */
> +               0,
> +       }
> +};
> +
> +#endif /* APPLE_MEM_MAP_T6032_H */
> diff --git a/doc/board/apple/m1.rst b/doc/board/apple/m1.rst
> index 3b4fb2913981..8637e29b9498 100644
> --- a/doc/board/apple/m1.rst
> +++ b/doc/board/apple/m1.rst
> @@ -18,6 +18,7 @@ the following SoCs work:
>   - Apple M2 Ultra SoC (t6022)
>   - Apple M3 Pro SoC (t6030)
>   - Apple M3 Max SoC (t6031 and t6034)
> + - Apple M3 Ultra SoC (t6032)
>
>  On these SoCs the following hardware is supported:
>
>
> --
> 2.56.1
>
