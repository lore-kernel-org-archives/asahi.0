Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D6280CCD
	for <asahi@lists.linux.dev>; Wed, 23 Apr 2025 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420226; cv=none; b=b2jf2fp/Fe3mrJ/7NVPj4IMnmee0UqLPVsTEvfQ1cBKfyDdjY7+iWMN1Iv8bKhMrw8wbe7Bxm3aGdvtR4GssR1YrFH6uZpCe6rKjn7jE72pcC6V7Sqx1Wg4DKOfFFzm+f7n0zzQFlFCeJ4P49ydC8XM+eFxuQbI5dVDrBRfUCt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420226; c=relaxed/simple;
	bh=jnfqlRhyk0nxJXxoUORXfipw+CR6jruRhOi93htI5a8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/UgnQh88hoNqk/KEE7DZJxMdy7PMMZOZoGn2fnWn3QZJRcK4XiO1oQN0Fh3Nl9hy5H/apusT79jEELia0VEbLzCdWwKnQ/9aSj5IewmUmk29tXELn69ENvuXQu1yRglHZNq9ndmz4N9/6pHH5CdxmMSYPPtYE5g8wcqfVu0u6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c54b651310so902699985a.0
        for <asahi@lists.linux.dev>; Wed, 23 Apr 2025 07:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745420222; x=1746025022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlyPTphf+x28unQ9fsmlIwni94vcWgQaX/dq2nBGd2c=;
        b=LdAfzE1exYrm5L1YxFluUFexp9VtsTC9Vv84BC9hmeqQLSk6FY5M4koAO6xsLuDJrX
         GUQnh0aPgeOCYTeOi9qR9G3YBIk/1CE57+2sVAiyvcJNkkOGiTWN8xHkZOxIrESTshGM
         cB6hEXILx6pRAkE6M02pjy9Z1mdYafzNULRWWyaiEuD+6r8RWLz0Xk8zCGz8swH3UXLs
         nNlXs7l5Ldwh8j33k8Lzt9rC1OoVMN8Rr1F3Uk9MCoUDVK9emDN51A61KfOxFvkZfDHR
         nDWAhiFre/dMUf2B8g4dMaeu7tsqnhajNkCCLbGoKXP25kiUg7GWIu40UaGRyjrYwJ9Z
         VufQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfv9sLvM/DZwN5opHfBwROC3K5rx2koEHL+PPP7hhkOx0grVy91ClqcSCVBrfci1K9J9Oxig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt2+Zru6LAIcQd/SxP1XRho4F2Ho27q5c2t0n7AI+nXuB/S8aY
	S9Yw6zv9lgk8fYKMCmsgPuVdZuVSwaW8G/c5ZbZBRQ5h8jEK06fBG7/5PuDw2ls=
X-Gm-Gg: ASbGncuOL/6N/xs5gFmuVBxvGhnqcxXXOCAVbTfdnhOZ8UZz3/av8zfHmYOijDpIWZM
	oRDrhogyR33eGPL326eUtRBxgugwB+gnrHTMktWf5uw5L3D+cvSdMucACCHO4+jvrRd0dXX68Xd
	qa7AU1n2LeGZsmEOSmTSGhGeaC2Ghy2v5qlQJtIdJ844DeuvbwP+iu14S136knnkUTaG8tCTlxG
	28GlFlW0ugEFtSdzQvRqeFDPf/t2uB3h8X6uJsgW7mJYMLzNrA9td+Te6fVz49puwq4WdHnGskH
	fF4INKdsoTm34DFQPYxszma/G8JBmO2KVcrwLUDRSmY4OuQ6Pxo0csmAWjPk9jpZzNFG9r7lvZ0
	iL54=
X-Google-Smtp-Source: AGHT+IGRMcDFuHF35uxcJwNTtCrO+ai9OVvOOn3TJvG9tWPEU9VvOkkhV38OMrW5aTgmLrXIlANA7Q==
X-Received: by 2002:a05:620a:44d3:b0:7c7:a5ce:aaf1 with SMTP id af79cd13be357-7c928018e95mr2894257785a.35.1745420221983;
        Wed, 23 Apr 2025 07:57:01 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a70a80sm689719585a.22.2025.04.23.07.57.01
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:57:01 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e900a7ce55so102603636d6.3
        for <asahi@lists.linux.dev>; Wed, 23 Apr 2025 07:57:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxpbGPh/+qP1juMYecFJIjwidWb1jnDwnG6+eIw7U0tIjR5qFZIrQLygysJFjMF4uC32qeRQ==@lists.linux.dev
X-Received: by 2002:a05:6122:793:b0:526:285a:f4b3 with SMTP id
 71dfb90a1353d-529253b90f7mr17209301e0c.2.1745419814638; Wed, 23 Apr 2025
 07:50:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
 <PN3PR01MB9597B3AE75E009857AA12D4DB8BB2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com> <aAjthvTuIeUIO4CT@pathway.suse.cz>
In-Reply-To: <aAjthvTuIeUIO4CT@pathway.suse.cz>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 16:50:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuawN0eC0yO40-zrz70TH-3_Y-CFSy6=hHCCMLAPvU5w@mail.gmail.com>
X-Gm-Features: ATxdqUEtXjwX1Xvi6EF4OaIe3skICOJiGJO6vzaZtD0WSg84WGPiul-c6IaIVeg
Message-ID: <CAMuHMdXuawN0eC0yO40-zrz70TH-3_Y-CFSy6=hHCCMLAPvU5w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Petr Mladek <pmladek@suse.com>
Cc: Aditya Garg <gargaditya08@live.com>, Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io, 
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

Hi Petr,

On Wed, 23 Apr 2025 at 15:39, Petr Mladek <pmladek@suse.com> wrote:
> On Tue 2025-04-22 10:43:59, Geert Uytterhoeven wrote:
> > On Tue, 22 Apr 2025 at 10:30, Aditya Garg <gargaditya08@live.com> wrote:
> > > On 22-04-2025 01:37 pm, Geert Uytterhoeven wrote:
> > > > On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
> > > >> From: Hector Martin <marcan@marcan.st>
> > > >>
> > > >> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
> > > >> it's useful to be able to print generic 4-character codes formatted as
> > > >> an integer. Extend it to add format specifiers for printing generic
> > > >> 32-bit FourCCs with various endian semantics:
> > > >>
> > > >> %p4ch   Host byte order
> > > >> %p4cn   Network byte order
> > > >> %p4cl   Little-endian
> > > >> %p4cb   Big-endian
> > > >>
> > > >> The endianness determines how bytes are interpreted as a u32, and the
> > > >> FourCC is then always printed MSByte-first (this is the opposite of
> > > >> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
> > > >> allow printing LSByte-first FourCCs stored in host endian order
> > > >> (other than the hex form being in character order, not the integer
> > > >> value).
> > > >>
> > > >> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > > >> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > >> Reviewed-by: Petr Mladek <pmladek@suse.com>
> > > >> Tested-by: Petr Mladek <pmladek@suse.com>
> > > >> Signed-off-by: Hector Martin <marcan@marcan.st>
> > > >> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> > > >
> > > > Thanks for your patch, which is now commit 1938479b2720ebc0
> > > > ("lib/vsprintf: Add support for generic FourCCs by extending %p4cc")
> > > > in drm-misc-next/
> > > >
> > > >> --- a/Documentation/core-api/printk-formats.rst
> > > >> +++ b/Documentation/core-api/printk-formats.rst
> > > >> @@ -648,6 +648,38 @@ Examples::
> > > >>         %p4cc   Y10  little-endian (0x20303159)
> > > >>         %p4cc   NV12 big-endian (0xb231564e)
> > > >>
> > > >> +Generic FourCC code
> > > >> +-------------------
> > > >> +
> > > >> +::
> > > >> +       %p4c[hnlb]      gP00 (0x67503030)
> > > >> +
> > > >> +Print a generic FourCC code, as both ASCII characters and its numerical
> > > >> +value as hexadecimal.
> > > >> +
> > > >> +The generic FourCC code is always printed in the big-endian format,
> > > >> +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> > > >> +
> > > >> +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> > > >> +endianness is used to load the stored bytes. The data might be interpreted
> > > >> +using the host byte order, network byte order, little-endian, or big-endian.
> > > >> +
> > > >> +Passed by reference.
> > > >> +
> > > >> +Examples for a little-endian machine, given &(u32)0x67503030::
> > > >> +
> > > >> +       %p4ch   gP00 (0x67503030)
> > > >> +       %p4cn   00Pg (0x30305067)
> > > >> +       %p4cl   gP00 (0x67503030)
> > > >> +       %p4cb   00Pg (0x30305067)
> > > >> +
> > > >> +Examples for a big-endian machine, given &(u32)0x67503030::
> > > >> +
> > > >> +       %p4ch   gP00 (0x67503030)
> > > >> +       %p4cn   00Pg (0x30305067)
> > > >
> > > > This doesn't look right to me, as network byte order is big endian?
> > > > Note that I didn't check the code.
> > >
> > > Originally, it was %p4cr (reverse-endian), but on the request of the maintainers, it was changed to %p4cn.
> >
> > Ah, I found it[1]:
> >
> > | so, it needs more information that this mimics htonl() / ntohl() for
> > networking.
> >
> > IMHO this does not mimic htonl(), as htonl() is a no-op on big-endian.
> > while %p4ch and %p4cl yield different results on big-endian.
> >
> > > So here network means reverse of host, not strictly big-endian.
> >
> > Please don't call it "network byte order" if that does not have the same
> > meaning as in the network subsystem.
> >
> > Personally, I like "%p4r" (reverse) more...
> > (and "%p4ch" might mean human-readable ;-)
> >
> > [1] https://lore.kernel.org/all/Z8B6DwcRbV-8D8GB@smile.fi.intel.com
>
> I have to admit that I was always a bit confused by the meaning of the
> new modifiers. And I did give up at some point and decided to do not
> block the patch when it made sense to others.
>
> But I have to agree with Geert here. The current behavior of %p4ch
> is confusing on big endian system. I would expect that it does not
> revert the ordering.
>
> Well, I still think that people might find all 4 variants useful.
> Andy does not like "r". What about "hR"? It is inspired by
> the existing %pmR.

I am not a fan of complicating the format specifier even more by adding
more characters...  But seeing %pmR, I have to admit it does make sense.

> The problem is that the semantic is not the same. The modifiers affect
> the output ordering of IPv4 addresses while they affect the reading order
> in case of FourCC code.

Note that for IPv4 addresses we have %pI4, which BTW also takes [hnbl]
modifiers.

> Avoid the confusion by replacing the "n" modifier with "hR", aka
> reverse host ordering.
>
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Thanks, LGTM!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
