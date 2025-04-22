Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B79F1DDA1B
	for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745318465; cv=none; b=Esh8vijfDJyXS0HlceKaQezIxAh9gpkCNRxSs/TVbN5uTc0MqgSqBnQ7G/6E8sp++thuyEXBcfWyL0s0Wtt6EgHr/n+dvDwUdzXiH2/o3BxmVlYRKkMfqIHhVVzPEaG0kYmT2kKqTO1gdDYbagsaEVCRZjwXyq8WKTJ90z3rtTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745318465; c=relaxed/simple;
	bh=c74m9nJuaHqBhP0VHLohLK106T0cVKwkPnarj1bL+14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIsiW50z/2+M3dg9dWEuxV+b++jyz05QTubsVKzqbXKSVbPHSMzfLFkfM+01XR7wE+TPV7WE/tssJoN049afP8DM08Q9WpWxVoUXlzPvCKjU2cKYQWIReZa6YTRv88NE/YxacRwofJGUDv3RLUZrehtFJ38aJJdmkc6bUQfv6cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so58587356d6.0
        for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 03:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745318462; x=1745923262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vytO4TOm8gf3AQur2lnADNQtT+Rd1ucyY5nITKDwjU=;
        b=wLPRfvHBY6Mj4qJ9HbI2wDoe8y5oNOxDgTicv0GcWOaGPD0fq0NFg+UaqiLMJDPpRJ
         Xc0Gi9b5CvM5c8tIqE/knPngIfRcpYIoX7jf02uCN6fFHJh77qc8CBVQsGwdjusVokZU
         QTiQE8h9fl+qhre+kefoWpC3PNlg3daB6b5RoUYd4Io5jelMy+xPiFTBrY+eaXXDFfBb
         86JRayLzk3zoRAZ/p3d3ptZyv93ElygyC7jcoGi+l+OD2vfMDq7lZpO48qJ1h/8+A75r
         HEOeKY4yHAzYGZtv8ZIblRXnOOF67cPp9gLy97OgiKphlTzg6eEQzrFOs95w4Y9GoPzl
         j8Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUstKsV+BpSEfN9p98ibwDNXyEEROwyrJSZzsrALDXkNNzAKhBQIClachUa/Elx1K2SkwTihA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg6qGXW5VJRZTDCSulON1EjxyXmXUgIVj7IacS8pibC34kRNiA
	Ozo5fP3zsAPV/jULe5y1uRY/rdVJJD/bqzHULsoAK5eKjDwqFtpb/vckvsZp
X-Gm-Gg: ASbGnctU2el+lqxquBCpLwqfSWS7jNTpibVIocMbF+DJHS8eFO064DYHPGvh+sriTYL
	bgg2viWwDDQwS7gdXD0xQmXpfL3CFeLjwUSgLATelWxxpRXl115wYAb7ZrzYqt1Cu1emrffpt/h
	BOAX4fRoKPGswWMU/zCEr1qz2zSKQAseGlN/iVEs17CuCdAdHeTkbOfWCkBSQNfbsLz+nmh1i2o
	dZQJoHI/GXDyGknevErqvjamnPPL+RsHj9LLHpfiX6bzptWH9bVaMLOtXcmBJDyzDlidXYkfNaG
	O2iUen9WQ+Lo/xnhlhI6EgiWX9Ak/buSAJbfnVyYGbmcG9P0CBb6Mh41ZgdMGvIRo2tMOJuQncB
	OY5A=
X-Google-Smtp-Source: AGHT+IEGyT0G+6HtwM4lbQQ7akZGX/r6sSev7LstsQusSdjduRNMng05HnMTojI15Cv/QK3gG/9QpA==
X-Received: by 2002:a05:6214:1cc3:b0:6d8:99cf:d2e3 with SMTP id 6a1803df08f44-6f2c45663d3mr234226086d6.22.1745318462092;
        Tue, 22 Apr 2025 03:41:02 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com. [209.85.219.46])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9ce265esm53981211cf.61.2025.04.22.03.41.01
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:41:01 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so58587216d6.0
        for <asahi@lists.linux.dev>; Tue, 22 Apr 2025 03:41:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRzh5qMItC8h1eSk5YwwpwrySKPVzi7o9d6oEYtcoENprE7vJxWr8+uSVIRWuqgGWYyWB1EA==@lists.linux.dev
X-Received: by 2002:a05:6102:3139:b0:4c1:c10d:cf65 with SMTP id
 ada2fe7eead31-4cb80232571mr8147349137.25.1745317975059; Tue, 22 Apr 2025
 03:32:55 -0700 (PDT)
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
 <CAMuHMdWpqHLest0oqiB+hG47t=G7OScLmHz5zr2u0ZgED_+Obg@mail.gmail.com> <aAdsbgx53ZbdvB6p@smile.fi.intel.com>
In-Reply-To: <aAdsbgx53ZbdvB6p@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 12:32:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuM5wBoAeJXK+rTp5Ok8U87NguVGm+dng5WOWaP3O54w@mail.gmail.com>
X-Gm-Features: ATxdqUFtFyy2GYQo3KtAmKWE1aHynw34_2Dg7VBWf7uTMs4ERXRYeYaDF1kqp6E
Message-ID: <CAMuHMdXuM5wBoAeJXK+rTp5Ok8U87NguVGm+dng5WOWaP3O54w@mail.gmail.com>
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
	Asahi Linux Mailing List <asahi@lists.linux.dev>, netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Tue, 22 Apr 2025 at 12:16, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Apr 22, 2025 at 10:43:59AM +0200, Geert Uytterhoeven wrote:
> > On Tue, 22 Apr 2025 at 10:30, Aditya Garg <gargaditya08@live.com> wrote:
> > > On 22-04-2025 01:37 pm, Geert Uytterhoeven wrote:
> > > > On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
>
> ...
>
> > > Originally, it was %p4cr (reverse-endian), but on the request of the
> > > maintainers, it was changed to %p4cn.
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
>
> It will confuse the reader. h/r is not very established pair. If you really
> wont see h/n, better to drop them completely for now then. Because I'm against
> h/r pair.

I am not against h/n in se, but I am against bad/confusing naming.
The big question is: should it print
  (A) the value in network byte order, or
  (B) the reverse of host byte order?

If the answer is (A), I see no real reason to have %p4n, as %p4b prints
the exact same thing.  Moreover, it leaves us without a portable
way to print values in reverse without the caller doing an explicit
__swab32() (which is not compatible with the %p pass-by-pointer
calling convention).

If the answer is (B), "%p4n using network byte order" is bad/confusing
naming.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
