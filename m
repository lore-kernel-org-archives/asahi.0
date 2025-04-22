Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022B3211711
	for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317257; cv=none; b=lGqZ3vmSxtccfe2dzG9PHpnBInbGNCstvLxiNP8OOF8AM9ogDWyjfB5ZB8Yb8kldO26M4GZt2YPJx4tKPVJiKRNlWYXrvt77iE3l5IoZKXpvBGQ7FIxgx0ie0iFCb5B0eADI/n7C6FHGrhqT/qx+kZ1A9MZ0/oc63daZOpvN8vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317257; c=relaxed/simple;
	bh=Wxe5WY7G3RUU93PW+mJYq20A1zO1eLTby/47ySQYMsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i4gcgrM5uY8kY90IH96R9E9bcF/RlWxbZoN7JIPO+EnuMuzn/TKNRnioXqw353R2QAxy9jvp0P40Bv+hAoa5W1quCvUqIT1vahQ1is01/tsAmV3Ei9WsmG5Ao6j3N33Hbfhmm4ojYQNHBdix0/qfUFhHLO7pySLXNm7pDbLUiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5259331b31eso2173939e0c.0
        for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 03:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317252; x=1745922052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohxPhiK6YcJP8Y4tA22q1xDQLWt1Qweo8WFh3HJlJLE=;
        b=dYdr0YYpnA2hV9KkwT/AmsejeYTD+zcxLrbOWOf48S+pA0HMVRmP2Af12ocUVevpwg
         QDK9mjwiQgeqQZvBG7QiE4s4H8KzAH+s7Oc7wcK3i/3cs3jmEHtg5hdb9/Pz+J6/vnxR
         VlHRtYxH7QK/KX9Thnh9UAgu9vgpNdflfGmpQKXp6t3TlB9ee141rMZkH/inFeODOYOH
         GUxoZWfXBPW1urcRf+zt9576Js9fUUce/A/AYMeSCHta7RnBAEJoGA2rDtbXGvBOJHMa
         +r7xsPZQdRHhucHSOf9jVtHBa9LEUIk59/W1FuB1i2euWqiaF62wHwGP1xlo/of26n8H
         GyOg==
X-Forwarded-Encrypted: i=1; AJvYcCVbzBALFtk0jM1y4UFmOK6YpLEyHnkZe6jsNZ0JH6wWQ0bnROr7vtsHvRaJaxRnx6fIpw+7KQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXLY45zb4n9dU1abCCgRIz/j23FwGTJBGpy+6hDLTKpXhYNzzg
	DC1ZgMY212T0lh/+8P94SMol/1I5tv9Ujn1QbKIxsdqv4nqZZxaU0O5gzMDY
X-Gm-Gg: ASbGncux4JlWJfygrUvHqRAyECiR/i7CYPOIVFq191ZZQ3c/ek1+NcI45RntfWNlRsU
	OXy4kKhXMnzzQQ1qpwird6GRGSBToRqOQ/TJh2jCJZmAK+1zgsE/b6kHqkS/PHgmrQF1qQ5q9d0
	A7NGhW+KcV1bxMYQ7in+dQW6nokJXdXKe76DIVeV23HBMAmlx/H5NUJv9S/Z+Cm6k45gpQjtYms
	Ob8U5b1x9NEmbcSPYyzETIe+FBzd4PXVHhgrkPedj5fBQVqcDc3C9/ptEro0KRDTvY8z0AWFv4J
	YUVcrqHl4SeV6+1Q4tBylzO6v89mqMj2UX1mlp1ZgHb5UZ/mO8Ya9P7HlSds/0oIK2D52IdfCF8
	oCK0=
X-Google-Smtp-Source: AGHT+IF3fRPaKorPxPqOT5Xiv55CMC+zKWHHQxZuzoTZ5JVA7trwGmrYWj8pCAkEambbKf6CDUQXjQ==
X-Received: by 2002:a05:6122:1692:b0:520:5185:1c31 with SMTP id 71dfb90a1353d-529254d5675mr11391356e0c.9.1745317251975;
        Tue, 22 Apr 2025 03:20:51 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-877647999c1sm2219419241.29.2025.04.22.03.20.51
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:20:51 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86feb848764so1497814241.0
        for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 03:20:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZopEhECWoEf4FBg0f6GOBTbuOrnI6IejdzFpqznPmuppa0lGG5xJdfJjQ+iJxavOixTxAVw==@lists.linux.dev
X-Received: by 2002:a05:6102:1173:b0:4c4:f128:3abb with SMTP id
 ada2fe7eead31-4cb8026372bmr8785686137.25.1745317250910; Tue, 22 Apr 2025
 03:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com> <aAdrkxhHaEpdl05d@smile.fi.intel.com>
In-Reply-To: <aAdrkxhHaEpdl05d@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 12:20:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu33wTjgAHUXdaLFvgnCqMzXGZkcc7i4iug0QP=-WkLA@mail.gmail.com>
X-Gm-Features: ATxdqUENa0qwyfrGVHcZ3QDmHbGb5nSiuKchVuCF7S-gHUHHmDPBWDnwpEhdUFQ
Message-ID: <CAMuHMdVu33wTjgAHUXdaLFvgnCqMzXGZkcc7i4iug0QP=-WkLA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Aditya Garg <gargaditya08@live.com>, Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io, 
	Petr Mladek <pmladek@suse.com>, Sven Peter <sven@svenpeter.dev>, 
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

Hi Andy,

On Tue, 22 Apr 2025 at 12:12, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Apr 22, 2025 at 10:07:33AM +0200, Geert Uytterhoeven wrote:
> > On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
>
> ...
>
> > > +Generic FourCC code
> > > +-------------------
> > > +
> > > +::
> > > +       %p4c[hnlb]      gP00 (0x67503030)
> > > +
> > > +Print a generic FourCC code, as both ASCII characters and its numerical
> > > +value as hexadecimal.
> > > +
> > > +The generic FourCC code is always printed in the big-endian format,
> > > +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> > > +
> > > +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> > > +endianness is used to load the stored bytes. The data might be interpreted
> > > +using the host byte order, network byte order, little-endian, or big-endian.
> > > +
> > > +Passed by reference.
> > > +
> > > +Examples for a little-endian machine, given &(u32)0x67503030::
> > > +
> > > +       %p4ch   gP00 (0x67503030)
> > > +       %p4cn   00Pg (0x30305067)
> > > +       %p4cl   gP00 (0x67503030)
> > > +       %p4cb   00Pg (0x30305067)
> > > +
> > > +Examples for a big-endian machine, given &(u32)0x67503030::
> > > +
> > > +       %p4ch   gP00 (0x67503030)
> > > +       %p4cn   00Pg (0x30305067)
> >
> > This doesn't look right to me, as network byte order is big endian?
> > Note that I didn't check the code.
>
> Yes, network is big endian and this seems right to me. What is the confusion?

On a big-endian machine, it should print 0x67503030, like the host
or explicit big-endian output.

> > > +       %p4cl   00Pg (0x30305067)
> > > +       %p4cb   gP00 (0x67503030)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
