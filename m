Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2670C194A43
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732527310; cv=none; b=PFFlzQEO60xsc+w6nLwpUlA4dKdSLDd1GlzRgNJUzhI+XaJYN0+W8/qXafE6UqeFaFIo3R9KqOsUo+a+xHWTLUgFpIc0QeEuBiWC0n2J6+hwrLzJ3wuYCkbEVVUncaoRz5n/n/DJ5gb/L0lYeJmnfaJNT1p9yzSk9aZTkGmO2HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732527310; c=relaxed/simple;
	bh=jaT2gMZATI1cr2w+kBtCP6nseVsxavYfNusYFbNNQeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tDeI9Lhcjom8sQrhST0yL6lT0XcOmlgOQPxdI5V8TdFMrPbypgNmOuhDrJWXzQgtJYcBiPWbN3mML4vKuIiIVNdgZN+Cw9xTfkiLrVhn6gAvYFV6tl2CjQCHhBldOVEe0MSf9VZoC17CzgqPzWyOV5Jvoo/WcpkkQSWHDe3J44w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sa3mMI2B; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sa3mMI2B"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cfc18d5259so7663a12.1
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 01:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732527307; x=1733132107; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaT2gMZATI1cr2w+kBtCP6nseVsxavYfNusYFbNNQeg=;
        b=sa3mMI2BmOzxWte56F7mILMg5iyI9UQZG15h88C7Qoy7aafkh7eau6mIBTheIWVMfG
         Pu2QOBUd9OuLJ+2co3666xCyvQXGDkOLNQ9xgb86dHqrPGtdWMKgewVS3tKY4Q15iRUZ
         mDmKF1s3P7K5Jkwfihqyzvil+FtgXQ/P0fO0eng+Qe11S85CbgoX9BUUxsR8XlRlPANY
         90kjm8jCgXfmEs35RNUNnEt15OM1CBn10rSzNjSQQ6yurFzi7dYizpigD57P72LCXBEU
         +BblMkqH/hRganud8BxLeMDZ/bCnUNcKPdBsI3Zpos7NUxEQrYdL7YgrR2C/35WUHAyX
         V1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732527307; x=1733132107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jaT2gMZATI1cr2w+kBtCP6nseVsxavYfNusYFbNNQeg=;
        b=WLd//XFE0KlPBUKFIq3jSxON+2yWtWX4LRAEXx+qXNaaOgEZVHKxuVBrysxIuZM0Pe
         RWPRMQrJiJSZ4+8koSxgWO6CKaIFMpb5+jF0sF2ie1mLSjA9QHOD9PjLYWzGMjxieqZ6
         8q9T2XXM1ImyHmu4aL6K/Hj+r6H2HZu8iDZFDfA+CkORQcehJZWHLsf5W0r/c09YVpkI
         /lKW51c4lc2dmHILWt0ksqCoeg81pWvkz7jPNrUJ3wrjUg4F9TCW3SzLYCmyaG1rpkuC
         qfvb92T3ApwA8F3xzPTXfAw7YlMFO4aFfs4eQ6vPTm6NTyfa5h6EPBlKRvoSO7vdWkzP
         zabQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqraVPELQPztI0UNUGVv9w6Ou0hca7g4pAHeF9OwjEs0ZaSjjs6lI+yR1olfcLtxMPGYSmzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu/3aKjk+vDkdERPBJZDIKuorSmg0KXptbElkhZGQ3BSBK1IhU
	gP7JmNoVeJ5L7i5/S3+IaCQSoMrGGFmH8yDksFiRiwxbl6q4k0cfrnSnY4s0f1J6FOMPLpIJxRE
	xpcPshtQs1A4MF/h6guwWI57sE42rG4cBmYEA
X-Gm-Gg: ASbGncvpK3lugQaFnf+eYg0LO48GQb1oyNgzsy1sARDHud4mK7MWrr08rFxx0UJX80Z
	wgiIIl+VchdKQwdqYv8iBMpsLkpDp0B1b
X-Google-Smtp-Source: AGHT+IGTmrlfZpaacQIL7m1sVBbpke3zA30uDeHjmOTDx5UHOJssl129/RankrUjb/fulgjiVDxdQ2FhiBHkvVnjtVM=
X-Received: by 2002:aa7:ce09:0:b0:5d0:3ddd:c773 with SMTP id
 4fb4d7f45d1cf-5d03dddc84bmr69002a12.4.1732527307223; Mon, 25 Nov 2024
 01:35:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <CA+icZUX-gf8624z8u+h-W8KeddCruYDng-4vTggNGwC61NzfNA@mail.gmail.com> <CA+icZUWSKygQJNiODzdauNiHz2Di-2eSGGmd-fgBrFpdyh_HgA@mail.gmail.com>
In-Reply-To: <CA+icZUWSKygQJNiODzdauNiHz2Di-2eSGGmd-fgBrFpdyh_HgA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 25 Nov 2024 11:34:30 +0200
Message-ID: <CABCJKudwpKX1_j46Tp6=eAJ0JU2zWE15+c8OFq9LMAnSqwesOw@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: sedat.dilek@gmail.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Nov 23, 2024 at 1:23=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> > BTW, I am testing with the latest kmod-git and pahole-git.
> >
> > I will give this a try when Linux v6.12.1 is released.
> >
>
> I have a prolonged build-time of +22,75 per cent.
> Compared gendwarfksyms-v5 + Linux-v6.12.0 VS. gendwarfksyms-v6 + Linux-v6=
.12.1
>
> Is this a known issue?

In my tests, compared to a genksyms defconfig build with debugging
information, v5 was slightly faster, and v6 was 5.6% slower. This is
because the expansion limits were dropped in this version to ensure
version stability when exports are removed. See the explanation here:

https://lore.kernel.org/linux-modules/20241120215454.GA3512979@google.com/

I did profile this quickly and most of the time seems to be spent in
libdw looking up attributes. We might be able to speed this up by
limiting the number of attributes we look up depending on the DIE
type, but I haven't had time to look into it yet. I'll take a closer
look when I'm back from my vacation in about three weeks.

Sami
