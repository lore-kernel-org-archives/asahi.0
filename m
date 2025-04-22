Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D1713D8B2
	for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309730; cv=none; b=CRPgpn2boif2CtB4vn8P2p1IPxkGOLezakJWm3kNiTvcrOOWAt5uq2ut6hglHeNR+ge/0KD0TXpXjSpsNRimY+eFziVkWTIBAlB4dc8lVfVGAoPJ9hBxN+Eu5emRHHI7sf8UvCUGWrUcMDkoFS0M27+oT3kOAasRjqbc5xTaKKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309730; c=relaxed/simple;
	bh=583NgnkZC2ZT7AwTWERouOxzfLOJBfqNK35QOwK3mdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FrJYgJa1Py6pNodQUJxykManVfL8BzA+hTu3eFHgFlCnJ0wdD9Z9TYrD554NctUYXs0ymFrXWafTaSkiupMs52QMG0+vKOzj1Gwga91Xs0a4mi1bo3+K0s3RczVz+gmEeqP5fgRVkC3y7cj9B1QLUNkaAn0MFW5zoVbRQRUDyV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72ecb4d9a10so2921457a34.3
        for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 01:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745309727; x=1745914527;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8c8ma1h4TTKBEevU7DpgPt28PGW8UxGjza0Ib9e0KQ=;
        b=uicG3n976eASiFNTUhfSZysHJ/wmqCloWptutegdQrdeGch9PnGKzbxy1sl7wWB9lU
         QCPQiemMSq+zKMzaueG2ul95+IO4lRlM3EbvZ112x7eI7jlBPWHGqEagvDbREWUiCWc/
         D0KuMdCxt9U1Z7bHh5AZeSVxeEhkF0hJ4RdGCpFifRhf6cPbVtL7CMJPvuUYhEa/Tzft
         nnS4ENmpwvYCKmg66c4oGnLbiGDfROEyXojjPn+m+mx68YTXkgmV4jAAzyIEPy7uWSLC
         FtgsoxhPQtGMeAOBRPSBzJltzhqFCjRSRvvyw2HjwR1lSXZU9JNAz3/BoO4qj2W6w4/z
         RnrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX4l60kbUvMgC1wMEGE5OmcxDWfAJ94FlOgcoB48AzRBetFOf3/eQCjdf9sebEP+RWq60ePw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwP03j11hCmsrR1vdOV2SaRRTB3UDqow944WmbZf+Nq1DU5LS2w
	SDYMRpfpRY/hInBypXcIeYZ4wjV4keK4VPe4zu6udsgEtgcudHK0V8KmuK6u
X-Gm-Gg: ASbGncu0WoCVxZvaLarb6G8EjlyWMXiGldVKQ8bUXFRjfryRL+LEeXcxGo/69QtIfLn
	OquaIeQAgCpYuPZYTnxPYPutGlUVWTXzpE27J8q9r+nZ+o7+zJRDI1EWMrUQ9PJtpCgB6hshpZw
	ybuFnt07JifwKoQmJwz/r4a3BceCAP2OcUMVaULhRMCFv38UfG8onrunTVVrWIeNA7PK3TtDrjs
	arDFmjdVpxVc+8fxbc/rkz3wq6YkmDCOUWTyDR3P0pGCIs6tonLfdo7FLII6VgVw9Qk28thCDT+
	vqx04W59cJwlJTWTUWeyDG8S9bM9ZHaY3bCSdefnnU6G7DdK4bQalZspMZ+YnhHBrjnkyWuixRQ
	6Cecgie4=
X-Google-Smtp-Source: AGHT+IFf3BMix7gN/XX1rbN/JolLlqtc7lSSuBanDrRZEKGDnBwoARpx68a4+p9sko2pBL3Dlb45Kg==
X-Received: by 2002:a05:6830:641c:b0:72b:9d2d:804 with SMTP id 46e09a7af769-73006353a1cmr9105671a34.26.1745309726750;
        Tue, 22 Apr 2025 01:15:26 -0700 (PDT)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com. [209.85.167.170])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7300489de9esm1869769a34.63.2025.04.22.01.15.25
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:15:26 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3feaedb4085so2547321b6e.0
        for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 01:15:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7j4CrLodelwjHf6XkTFROFKlJv9wZmX3j4TQM5P+zREyjBj0IVXDIW7qS9jZs04lqZQNvBQ==@lists.linux.dev
X-Received: by 2002:a05:6102:5f09:b0:4bb:c24b:b644 with SMTP id
 ada2fe7eead31-4cb802080d4mr7323250137.20.1745309264946; Tue, 22 Apr 2025
 01:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 10:07:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
X-Gm-Features: ATxdqUEkl9rVCtzV1tSRbSe8H75mXfNa-MVqCJWBKpRzjTvK50pHzHN-MSLc5t4
Message-ID: <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Aditya Garg <gargaditya08@live.com>, Hector Martin <marcan@marcan.st>
Cc: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sven Peter <sven@svenpeter.dev>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, 
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com, Simona Vetter <simona@ffwll.ch>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com, joe@perches.com, 
	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, 
	tamird@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Aditya, Hector,

On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FourCCs with various endian semantics:
>
> %p4ch   Host byte order
> %p4cn   Network byte order
> %p4cl   Little-endian
> %p4cb   Big-endian
>
> The endianness determines how bytes are interpreted as a u32, and the
> FourCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
> allow printing LSByte-first FourCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).
>
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Tested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Thanks for your patch, which is now commit 1938479b2720ebc0
("lib/vsprintf: Add support for generic FourCCs by extending %p4cc")
in drm-misc-next/

> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -648,6 +648,38 @@ Examples::
>         %p4cc   Y10  little-endian (0x20303159)
>         %p4cc   NV12 big-endian (0xb231564e)
>
> +Generic FourCC code
> +-------------------
> +
> +::
> +       %p4c[hnlb]      gP00 (0x67503030)
> +
> +Print a generic FourCC code, as both ASCII characters and its numerical
> +value as hexadecimal.
> +
> +The generic FourCC code is always printed in the big-endian format,
> +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> +
> +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> +endianness is used to load the stored bytes. The data might be interpreted
> +using the host byte order, network byte order, little-endian, or big-endian.
> +
> +Passed by reference.
> +
> +Examples for a little-endian machine, given &(u32)0x67503030::
> +
> +       %p4ch   gP00 (0x67503030)
> +       %p4cn   00Pg (0x30305067)
> +       %p4cl   gP00 (0x67503030)
> +       %p4cb   00Pg (0x30305067)
> +
> +Examples for a big-endian machine, given &(u32)0x67503030::
> +
> +       %p4ch   gP00 (0x67503030)
> +       %p4cn   00Pg (0x30305067)

This doesn't look right to me, as network byte order is big endian?
Note that I didn't check the code.

> +       %p4cl   00Pg (0x30305067)
> +       %p4cb   gP00 (0x67503030)
> +
>  Rust
>  ----
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
