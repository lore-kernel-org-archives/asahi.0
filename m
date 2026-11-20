Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795209650;
	b=MwbxuTMtvxf3q/J3ZU1XMWXoocceH5L9DBbmPDhxeu1+dknRVTT18CxV/tC1Vhdf5Bfc
	 Gh2qN+lo6WBhyreOFr+n+RxiWifYWNhhqs/MXZt3OXZIal5wzs665s4cuXeChRb2Ymont
	 sj+jkT9fbOOeYTeeUzezGESPY+1x1c7gCROdEh5KVnShclR0Vvy6+3clIQlNa0app94od
	 TiN5EAsqnwMcTG9lPm4gZSIkQN6GBRA6Z+NxTXCh8SkDgCbzq+YeIqDuEzL29V/hQrj5y
	 gCvZzJuJeF6RkEYl4kdOZi6wWlWvnMhirMKc2mAiwAsuuJf3qZcpuosDG/R0OeTxFQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SjVWOkylskyZConARtvloTNnuzMTPrNN8EEDs7qATdw=;
	b=SXvWvzyh2rJTZVIdLj5Gd07/Dsg1o1zgfsr8Or68ZVSPeZlb7RSPHFHZOTwfv0wPNh7O
	 4za/yYfI0c0YdOnvTdRgQ9SkxlX8ZzhDOFawQXQUD1tzrK95tnrIv1x/xo2czyAIlBMF6
	 VbU6JT9Ah2piEBaD8m0V/G35tzxKB3jAL+17Ui87fMSCg6IqfU+FdL8OjGvvq4YbIJr7J
	 Gu9OKiZCG5bIbcKNHBbVqoizZI9aQHp4TRyV9ofKucMr2P3GtmbF26srD/iJaTQ/DeB/u
	 zo5KcruJsmubTnDoa5ZW6Zzte4Wlto1q7GepnmYLsfZRRblFYI36T4OjuD7iyCLtrjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bWu561dT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B59606A69D
	for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 21:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3B59606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bWu561dT
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-679aeeddc6bso1387428d50.2
        for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 13:20:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795209648; cv=none;
        d=google.com; s=arc-20260327;
        b=Z4D8bpfajTBy19iDG7fZ4qVgsVqk1fVLcP8Viz/DFMAOAK1YRujK8sTwPmfHX0mgP9
         6MXxnabjGCS+0rTVP+9A65swvtiJNeSQdVFkZMMI/ymSEVlqSPLKIeZJk5TslzHrtH2y
         W0w1SAmiYSzpHgYSvo1BgtiRVZYfncbUFgHg69UAiBAk9KtdCJyWPdYghfP6mOFhHql9
         d84HuZquPQ4uvOeZGnuRrqvNbhbBI/ru4kV+4z9fpISJ1yRy7ZUP9rCoN1qLBJWCf9EK
         7I7rEmi5x+eHFtlRvJKc6t+pnLxH2UmPsdIGcJu+lORkMmf0eEy8rrU5B1mTLd+qITNo
         uz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SjVWOkylskyZConARtvloTNnuzMTPrNN8EEDs7qATdw=;
        fh=q6pHrREATlYxd1E1LeAik742lZovfk4nka4rrKNaWnw=;
        b=OaQH8TJQRL69kMc00P9yTw2QU09w44ray7EHH8RqJKUKEn6wCwYVi03MSahzUEE3qc
         yQRpJVTZmvojG55NtDsFj1psIcxt7lYky/s5XqviE4UMqX5JStuQayP+/KG/7kM61Iuu
         MHo83kuoCrEbWtGs63hrMXgJX8ljQuDe9QDStRKw/jwrZI88UmEBq3iLz87vcrh3vX1v
         9DqCeELVy6hfUn0VQN9kOwEtFg8MBlyI2mZJZ5oIud8MtZI0VYHfcxsa12y81bqXdmLd
         LeGMiAIMj934QtREM2QdG35Z0JOyTxu1wH8/1xufvWMjBGMsYMlIE4BV/U1dDJDmtzw8
         NqMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795209648; x=1795814448; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SjVWOkylskyZConARtvloTNnuzMTPrNN8EEDs7qATdw=;
        b=bWu561dTfnsdRAkeGiZaaOk/UahxLF1HDBLv5XlorP5d992oxU0viO1ViJTELnZLoB
         /Tg2k7cEg5n2bJhCkcY1MM97fwvhT2bfH/yFh6mOKXjb79SGpibA86Rx80DyI9MrEKUy
         t66C4CL8vlhmquDdpb9RC+eKxiCnUGfeBB/TrQj5DWPwrzxmDCmCAtLXGzodiVJtbld/
         XA6K5FOvaCJ6q5zf+f8TdMZ96alQM1w7Sg/++iF73Oj/Wq+vaTpsXMOap6e3bu4E1R7D
         1kItqkuCRFizSW55o6NAyf0abVdaR36lHq2LrRWF4caS9nfTA+4RVJdl6J5uJDCzpRmT
         Ww1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795209648; x=1795814448;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SjVWOkylskyZConARtvloTNnuzMTPrNN8EEDs7qATdw=;
        b=HgQWQ+tnuwN/AsrAiv2MIx4W/H3R0k1ECfhku0zSUO9doYmPZN1Z6V70QRglvm9S/c
         W9ibhAf04eNim8+d0pwMI1pq8dwCcC+JuoSKm54mMfqGWMOuyTo5cTr10ArUvP3BckeX
         6b0B7DaVt5kpyghBesxmQFHBYv5vD/I1oKD9iB8aTCL1Mf54hiSFkilBNCAOZWZ0Jv3a
         9F8akXGowJ6VKjka5dvtsR0PJoGSssEIjeJYECFLhhsNdVAj85wUcsls4cPeeV+r0fgF
         UW1w8a9uaIrA5dhO50IbNVspaofhnsixjrvGRG2R5NoDYt/f01ZV6PIXhPq1dI4gmrTF
         HrqA==
X-Forwarded-Encrypted: i=1; AL+hErGaFpNnC5KBvtgo9/aN/ceyORUuZOdhOCTjkMtLMqM1G//AafzPmknN9zwE458ais2+m/YwGQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9425PdmK8EnP5Z168PcvVPcwJwKoxeKM9SuR5HOg79jreELwH4
	xd2b/Gy/RYwwoJq2ec6E+OUYe2kx28zJi0eyE0vuKf1lAWWa07v+ZlH3jVrxODTqjAV9zAcIlLr
	awkqQu46cUVDTCjbRMsfnUoWHhSsI7zsrCRxFsGriJQ==
X-Gm-Gg: AZFdTZclnajKltd4AJ3IQt0pemF2MAT+cgJoG0iF9YQA2Tu4stH1OjEhJKulDSCv1ix
	1zj2sXXXFiZ//oAs15KvUPH01v5ZThXOZFChj9gu66nABhaBf9ulqo8ISfH9HmA45u913osLd/h
	icxNJ2dnkCr3YhE1nNGYyUNk6iRqpbtZ0evDRXNelMKtEogMWEnkvPa+LAuLAUPseRUatY1CvF+
	IG/uKcCrt6veP68aXx8KSgJFNIeWQ4RazTfPsNvwtIUjqxviJuNVDzWhPcovbe/UrHd95i2k5zj
	0b1sqHjtoX5lDQZJxzPwMmjKeLQXiumPXBXmpzWC2TuQo6yaKPK7hoWndgvDGG9nLaSJrDVH4Zd
	SOjsz4F0bOA/54p4nFKwNi/6mWLDlaV1856rCoDf/+nhS7FGsiIVzSU0Kf3FsQU3+0m5cWh8uKG
	B2BH8lOmoy+XM3GiRk6JH9cNkLRVUzrZsmoBEQKEdbBzh7UKSF+itYb234pNZgXlcZi80rH4dju
	y7KtNakZ5bF0Sj9kJzqB9WIEg2D54ddipObx53GE3haFlyzQ5PGD10v6p7g9h+fZhhVjGVR+lwb
	DY2m9mHJ089egj3PusvXz4FnnkmJAs9uptV9gcKO22DCZq++tlywqvKNthmcUPqybJiioJaEse4
	TvopXPPa9ITH/GCC/ltVwON86qDlN3GNVpngdeL5LvOQFatfSb/8reG18mi9ukZAtYU4l36CN0E
	0CTC4ZGlYTqNtfawW5jMv9poNOh4eEvqysSDy/QzO5IVR8aA35z75qmKhqQOPmx8BRhCx3
X-Received: by 2002:a05:690e:150b:b0:67d:a73e:2b61 with SMTP id
 956f58d0204a3-67df4515518mr1194716d50.99.1795209647900; Fri, 20 Nov 2026
 13:20:47 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-apple-t603x-support-v2-0-606b4f5fadc5@jannau.net> <20261120-apple-t603x-support-v2-3-606b4f5fadc5@jannau.net>
In-Reply-To: <20261120-apple-t603x-support-v2-3-606b4f5fadc5@jannau.net>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 20 Nov 2026 23:20:12 +0200
X-Gm-Features: Aa3M54omDyIgLpDYf2f7bBEX_0eQ2ggkyDpMYq0SI8nPGagy7UVjdVv00cDjRXs
Message-ID: <CAC_iWjJQZNp=cmKdGBnO3Zf25s8DvU8Y=sChS-HUtPgJLP+YTQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm: apple: Add Apple M3 Pro and Max (t603[014]) support
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.u-boot-project.org, Mark Kettenis <kettenis@openbsd.org>, 
	Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, asahi@lists.linux.dev, 
	Anshul Dalal <anshuld@ti.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 at 20:53, Janne Grunau <j@jannau.net> wrote:
>
> Apple's M3 Pro (t6030) and Max (t6031 and t6034) SoCs are similar to
> their M1 and M2 predecessors. The MMIO blocks have been extended but
> M3 Pro and M3 Max still share the same overall layout although they
> aren't as similar as M1/M2 Pro and Max.
> Most of u-boot's existing drivers are compatible with the hardware and
> M3 Pro and Max device trees will carry "apple,t8103-*" as fallback
> compatible strings. Only apple-atcphy-reset will use a new compatible
> due to USB4 and DisplayPort changes relevant to the Linux driver.
>
> Acked-by: Mark Kettenis <kettenis@openbsd.org>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

>  arch/arm/mach-apple/board.c        |   5 ++
>  arch/arm/mach-apple/memmap/t6030.h | 104 +++++++++++++++++++++++++++++++++++++
>  doc/board/apple/m1.rst             |   6 +++
>  3 files changed, 115 insertions(+)
>
> diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
> index 6b3a0225f9ad..c93c3bd56aa9 100644
> --- a/arch/arm/mach-apple/board.c
> +++ b/arch/arm/mach-apple/board.c
> @@ -20,6 +20,7 @@ DECLARE_GLOBAL_DATA_PTR;
>  #include "memmap/t6002.h"
>  #include "memmap/t6020.h"
>  #include "memmap/t6022.h"
> +#include "memmap/t6030.h"
>  #include "memmap/t8103.h"
>  #include "memmap/t8122.h"
>
> @@ -72,6 +73,10 @@ void build_mem_map(void)
>                 mem_map = t6022_mem_map;
>         else if (of_machine_is_compatible("apple,t8122"))
>                 mem_map = t8122_mem_map;
> +       else if (of_machine_is_compatible("apple,t6030") ||
> +                of_machine_is_compatible("apple,t6031") ||
> +                of_machine_is_compatible("apple,t6034"))
> +               mem_map = t6030_mem_map;
>         else
>                 panic("Unsupported SoC\n");
>
> diff --git a/arch/arm/mach-apple/memmap/t6030.h b/arch/arm/mach-apple/memmap/t6030.h
> new file mode 100644
> index 000000000000..5d2061a446c4
> --- /dev/null
> +++ b/arch/arm/mach-apple/memmap/t6030.h
> @@ -0,0 +1,104 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * (C) Copyright 2026 Janne Grunau <j@jannau.net>
> + */
> +
> +#ifndef APPLE_MEM_MAP_T6030_H
> +#define APPLE_MEM_MAP_T6030_H
> +
> +#include <asm/armv8/mmu.h>
> +#include <linux/sizes.h>
> +
> +/* Apple M3 Pro and Max */
> +static struct mm_region t6030_mem_map[] = {
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
> +#endif /* APPLE_MEM_MAP_T6030_H */
> diff --git a/doc/board/apple/m1.rst b/doc/board/apple/m1.rst
> index 66ed247eca26..3b4fb2913981 100644
> --- a/doc/board/apple/m1.rst
> +++ b/doc/board/apple/m1.rst
> @@ -16,6 +16,8 @@ the following SoCs work:
>   - Apple M2 Pro SoC (t6020)
>   - Apple M2 Max SoC (t6021)
>   - Apple M2 Ultra SoC (t6022)
> + - Apple M3 Pro SoC (t6030)
> + - Apple M3 Max SoC (t6031 and t6034)
>
>  On these SoCs the following hardware is supported:
>
> @@ -87,3 +89,7 @@ supported SoCs.
>       - 0x2a1200000
>     * - M1 Pro/Max/Ultra (t6000/t6001/t6002) and M2 Pro/Max/Ultra (t6020/t6021/t6022)
>       - 0x39b200000
> +   * - M3 Pro (t6030)
> +     - 0x289200000
> +   * - M3 Max/Ultra (t6031/t6034/t6032)
> +     - 0x391200000
>
> --
> 2.56.1
>
