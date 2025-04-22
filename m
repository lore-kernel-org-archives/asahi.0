Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E187261579
	for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311461; cv=none; b=E6ZhdtbUPMtF/CasiLOfS4k+eIKVvGp8n/dpKqqU07b3J5JFEFDhbU+HJxGl3GllDH/99ck+3YP9RPnrO3ZR1fcG7815+URiUi4KN7PAzSkLTLav46tsmGRtO44d5a9yExrKgl/xOL1nbJ2ZXjPJTa+a/xlpV9oc8t/JC4Af9k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311461; c=relaxed/simple;
	bh=d3vMkZUgF1qGZvdCTBm7Bb2MO67cZCqhiB7dVZXff7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JS60liv0C5IiTSv3vF5FVuExwZXpAtKqHYFQkw71BK8Vq73IS7ZXVb3ybeTnV1rL07Xg9BGVjyrhO/wdGDDJufmg4o2sOEwbxxBGQdPVjexxu1bYGXdYy+6zonBODILIcRsi0K7hQtfabp5NW7fG2TqNvaRX6lVXi86EpfqObqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-523eb86b31aso1831532e0c.0
        for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 01:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311456; x=1745916256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLaMluqDEwjyr3+Ikq130BwnO35HxC0ThAvpH6TmcJU=;
        b=NnubVzI8qiZ4rCr+2EIQsnMhjRpAG8DBMhO4FEXkl/qaBkKb0C2eF+lRq4bNVCV9iX
         pc0FjL0QNji9/fBg9u6eraVvWy3P+KMs8aS0usL1QAvK4uEVvjFFUTp2C/ZOcxwRCSVI
         Lq94xLHn7PIlSeDUt/ln2IINDTmb1RMGzhIqn6ZjNeH/SHlgBFzxN7iQrjbpt1lV2gfE
         LULREqtJKEH+4cE3UgTrAlWjjysCC+z57Al0+CeSBt7QFCHXDsTtWujUAgjHgKqhZxVC
         kWygxSC6WT0ZlJRPbs+g5CVQi7fJZWyad9/IkeK4PzdS9CxBL8dL669fShOVCm1Qy84Q
         W3aw==
X-Forwarded-Encrypted: i=1; AJvYcCVK2TGmZNkU8EPm3PNz+s/nNHe9RZdiSdVONG+Iw2IBEZ5BiTuXgfHmHL4eoSDo2GLA8anVbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqQD5K5W88WeZJMFti7ClIbd3euyDx2G2IxDHuFecp1IArgz9f
	bh0wVJcOXxjfg1UKq8leLH+yQYuZTAhGuleet8w4Y5ghSIparlYEfANkJuJt
X-Gm-Gg: ASbGncuBZHvu0+fXjK6V5mX7fCNE/k4o+kJTjBpzAbqBe25tHENJmuoXIpSc87gPx9M
	uERymqggoMQxDruWQzegMowp07vTSd04XwpMBue8OwahR8Nn5h5yUkBnIc+CAfPDQGlLGKbflxl
	zYxgUWgyRTXk05p7hlewEU53y8adRlJGYcr5XHk7ADeuDEjeLwSm3mP4Riz4yD+mVZH1Bi+qEMl
	xqNTXxq7vFtxvoweL83/RAYzVtFUDldX4XT9Cmv/gHnahVUv7svdTxtXBK/S4UGF/KyHMSJRrb2
	QyIQ76Nr3z2Ve87lWwdP23RjLI4eNH3ZNcM0Q62y1DENxz2Tl822d74WaCuEwx9WFqEV5N2ttLD
	m2tK0SIc=
X-Google-Smtp-Source: AGHT+IEPn3GkZiw/lsAD6IzB741uHjFtVWVluB8CO9GUTaMHlk9mQBpNzKCDhCZ3vrKLLlmED9uJGA==
X-Received: by 2002:a05:6122:2517:b0:50b:e9a5:cd7b with SMTP id 71dfb90a1353d-529254db0c0mr11678246e0c.9.1745311455554;
        Tue, 22 Apr 2025 01:44:15 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8776466c8b4sm2180461241.11.2025.04.22.01.44.13
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:44:14 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so2090277e0c.2
        for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 01:44:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXALYWMb+XQ9t14B73iIleRYm67Le+UwmB0tONJvyp9wdb700q20SN/Z3lS9drBPj5KQ4b4pg==@lists.linux.dev
X-Received: by 2002:a05:6122:3c44:b0:520:61ee:c815 with SMTP id
 71dfb90a1353d-529254ff048mr10359604e0c.10.1745311453748; Tue, 22 Apr 2025
 01:44:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com> <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 10:43:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
X-Gm-Features: ATxdqUE7mMMNjQJXGhijqI3kY1zbATKtnGoK226m5ymri0gv1G5LUPASpBBxpD0
Message-ID: <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Aditya Garg <gargaditya08@live.com>
Cc: Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sven Peter <sven@svenpeter.dev>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, 
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com, Simona Vetter <simona@ffwll.ch>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com, joe@perches.com, 
	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, 
	tamird@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Asahi Linux Mailing List <asahi@lists.linux.dev>, netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Aditya,

CC netdev

On Tue, 22 Apr 2025 at 10:30, Aditya Garg <gargaditya08@live.com> wrote:
> On 22-04-2025 01:37 pm, Geert Uytterhoeven wrote:
> > On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
> >> From: Hector Martin <marcan@marcan.st>
> >>
> >> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
> >> it's useful to be able to print generic 4-character codes formatted as
> >> an integer. Extend it to add format specifiers for printing generic
> >> 32-bit FourCCs with various endian semantics:
> >>
> >> %p4ch   Host byte order
> >> %p4cn   Network byte order
> >> %p4cl   Little-endian
> >> %p4cb   Big-endian
> >>
> >> The endianness determines how bytes are interpreted as a u32, and the
> >> FourCC is then always printed MSByte-first (this is the opposite of
> >> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
> >> allow printing LSByte-first FourCCs stored in host endian order
> >> (other than the hex form being in character order, not the integer
> >> value).
> >>
> >> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> >> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> Reviewed-by: Petr Mladek <pmladek@suse.com>
> >> Tested-by: Petr Mladek <pmladek@suse.com>
> >> Signed-off-by: Hector Martin <marcan@marcan.st>
> >> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> >
> > Thanks for your patch, which is now commit 1938479b2720ebc0
> > ("lib/vsprintf: Add support for generic FourCCs by extending %p4cc")
> > in drm-misc-next/
> >
> >> --- a/Documentation/core-api/printk-formats.rst
> >> +++ b/Documentation/core-api/printk-formats.rst
> >> @@ -648,6 +648,38 @@ Examples::
> >>         %p4cc   Y10  little-endian (0x20303159)
> >>         %p4cc   NV12 big-endian (0xb231564e)
> >>
> >> +Generic FourCC code
> >> +-------------------
> >> +
> >> +::
> >> +       %p4c[hnlb]      gP00 (0x67503030)
> >> +
> >> +Print a generic FourCC code, as both ASCII characters and its numerical
> >> +value as hexadecimal.
> >> +
> >> +The generic FourCC code is always printed in the big-endian format,
> >> +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> >> +
> >> +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> >> +endianness is used to load the stored bytes. The data might be interpreted
> >> +using the host byte order, network byte order, little-endian, or big-endian.
> >> +
> >> +Passed by reference.
> >> +
> >> +Examples for a little-endian machine, given &(u32)0x67503030::
> >> +
> >> +       %p4ch   gP00 (0x67503030)
> >> +       %p4cn   00Pg (0x30305067)
> >> +       %p4cl   gP00 (0x67503030)
> >> +       %p4cb   00Pg (0x30305067)
> >> +
> >> +Examples for a big-endian machine, given &(u32)0x67503030::
> >> +
> >> +       %p4ch   gP00 (0x67503030)
> >> +       %p4cn   00Pg (0x30305067)
> >
> > This doesn't look right to me, as network byte order is big endian?
> > Note that I didn't check the code.
>
> Originally, it was %p4cr (reverse-endian), but on the request of the maintainers, it was changed to %p4cn.

Ah, I found it[1]:

| so, it needs more information that this mimics htonl() / ntohl() for
networking.

IMHO this does not mimic htonl(), as htonl() is a no-op on big-endian.
while %p4ch and %p4cl yield different results on big-endian.

> So here network means reverse of host, not strictly big-endian.

Please don't call it "network byte order" if that does not have the same
meaning as in the network subsystem.

Personally, I like "%p4r" (reverse) more...
(and "%p4ch" might mean human-readable ;-)

[1] https://lore.kernel.org/all/Z8B6DwcRbV-8D8GB@smile.fi.intel.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
