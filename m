Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E361A170A12
	for <asahi@lists.linux.dev>; Thu, 26 Sep 2024 18:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727375853; cv=none; b=OnmAWwrd3fY7W8dw933ufbWttAAayysqpLzAMaN9nNc1zdK3kKBH+P9iq4vkAXSGgwvBX3B8+nzGH/9bfFqcIlxcfPv9UA+9HkUZiIr//jOAf6ck8Q4HbNB8oflT3IGaqy3k5tsoX+eV6OcCuvwJsfCgHUWBurseYii444dseRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727375853; c=relaxed/simple;
	bh=qge/ypv3jnq9WkpUdpRE7x8QIIC6GXWB3609FUVVm8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gy4+ztnbxbVrT5YcP4AosfQiR3AAA6JxcQs+CrEqNq/uhiiG/MKOAKwFgp+uneemhiVHjkonpt419iU1hdBVP60uQgJ6Rv+eu4RAJdbchH8NlLh0uiMLBfeVavpAy+MpT3srTDCNauhX19XSX1F7lhV6FwxYyqCe6kSmdEoUlrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H8ow8wps; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H8ow8wps"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4582a5b495cso46221cf.1
        for <asahi@lists.linux.dev>; Thu, 26 Sep 2024 11:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727375851; x=1727980651; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajD7HYLuvBx8/17wWfxPAMem46iIj42I6Vl0LQ86WrE=;
        b=H8ow8wpsNgvE5OURvbYlsMvyHkby1BrT1VZWMo9CkxzM0NKZGKPdrYXpWuP5cx4ODj
         d7cdZelLLqK7SNEWZfp9Z9JiyyDEL73ZR2dfqWenpA+UdEHkkcexWXboB6BgCGHG1i4z
         H6tFB9HuovvUyARMYnJGytI6Zm8DM3eRTTPxm67AVjAwLcZQbxEzKkiEQc7cxfM5NxBU
         mh7OmF5QJ2FTR5K8MNFAQtvkUEck0lVmOd4Xr3xT6tAGz7t01nlLmNd5hGIs7Mm31pjf
         sL0RyJyDIqKmg4uw6Oh8Md1GDUu8zLaks4T0Ho4JutRxakOIdqGZ2op7iIi4Y+Ghqu+j
         F9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727375851; x=1727980651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajD7HYLuvBx8/17wWfxPAMem46iIj42I6Vl0LQ86WrE=;
        b=Nnzmz/EJwmhvjkeGJMHGKdTk4QPd/AKgzwD1zlKyXp/Uge7deIeSDFTxMxzt2tN71v
         HEpoC4T51Hko9U0RtHRj90tMXW9TfbAZ4OeQebT2/Vzjxgkj7vSB3BxmdskwW9Ys6HK3
         /Rl1LKBsLTh8v6XsrMy8CArMC96MPl8fZMNJ1i8FNS+17BuCmr7c9EUkXQyhyj5h74z1
         P7VAnzJDQBkoCt1GOY05TNZ13/T4AsJ3+5KuChHQekXvyJdcuFyLxLHPCyRoZ9RnIjHQ
         jQ4qhANEBV1vGYXe2TMwczu6u3CFcOkCKy/GeoEOizj9VJYVA9PpphunTV/Pd7c2MnW5
         a7cg==
X-Forwarded-Encrypted: i=1; AJvYcCWbhd3xkXdV2A3DU7/Tr1jSlBzy1EogwGPKfBD98Mgv95XBBXNHKIrjLx/ACcZS5nqVXhQpPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfqiD+g09ZOW3IHVN5GiKe5rC1xUTCnWjTI3P+LAn+D0SRJcWA
	+sTiMn5qfu3+okI/XMHdJEUk9PCgTIKdSeeDaSW4eX/dMbSUnH7d4Sj/CyWkUUGEDIWcqqVlFKE
	jpEQH7u7b+vm/e5b1YHtFQTCwMVj3L916jMYf
X-Google-Smtp-Source: AGHT+IE5luy5UBQ185BJWoPqDDM1TnLd4PCqV2DLnc+LIC9QgkGZbzUPxUEZLm0+v/dLWn/IHMzUNmnXBY+ab/kjVpA=
X-Received: by 2002:ac8:4904:0:b0:456:7d9f:2af8 with SMTP id
 d75a77b69052e-45ca03bd89bmr245591cf.7.1727375850392; Thu, 26 Sep 2024
 11:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925233854.90072-1-mmaurer@google.com> <20240925233854.90072-15-mmaurer@google.com>
 <b31c74c1-0c19-4bc4-b1af-db817977748d@csgroup.eu>
In-Reply-To: <b31c74c1-0c19-4bc4-b1af-db817977748d@csgroup.eu>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 26 Sep 2024 11:36:51 -0700
Message-ID: <CABCJKudyC_EzRTtkJSSQqQhLdUk_9tYBtoq62tjmghFyi8omWg@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Matthew Maurer <mmaurer@google.com>, masahiroy@kernel.org, ndesaulniers@google.com, 
	ojeda@kernel.org, gary@garyguo.net, mcgrof@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, neal@gompa.dev, 
	marcan@marcan.st, j@jannau.net, asahi@lists.linux.dev, 
	linux-modules@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 5:22=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 26/09/2024 =C3=A0 01:38, Matthew Maurer a =C3=A9crit :
> > Adds a new format for MODVERSIONS which stores each field in a separate
> > ELF section. This initially adds support for variable length names, but
> > could later be used to add additional fields to MODVERSIONS in a
> > backwards compatible way if needed. Any new fields will be ignored by
> > old user tooling, unlike the current format where user tooling cannot
> > tolerate adjustments to the format (for example making the name field
> > longer).
> >
> > Since PPC munges its version records to strip leading dots, we reproduc=
e
> > the munging for the new format. Other architectures do not appear to
> > have architecture-specific usage of this information.
> >
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >   arch/powerpc/kernel/module_64.c | 23 ++++++++-
> >   kernel/module/internal.h        | 11 ++++
> >   kernel/module/main.c            | 92 ++++++++++++++++++++++++++++++--=
-
> >   kernel/module/version.c         | 45 ++++++++++++++++
> >   4 files changed, 161 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/modu=
le_64.c
> > index e9bab599d0c2..4e7b156dd8b2 100644
> > --- a/arch/powerpc/kernel/module_64.c
> > +++ b/arch/powerpc/kernel/module_64.c
> > @@ -355,6 +355,23 @@ static void dedotify_versions(struct modversion_in=
fo *vers,
> >               }
> >   }
> >
> > +static void dedotify_ext_version_names(char *str_seq, unsigned long si=
ze)
> > +{
> > +     unsigned long out =3D 0;
> > +     unsigned long in;
> > +     char last =3D '\0';
> > +
> > +     for (in =3D 0; in < size; in++) {
> > +             /* Skip one leading dot */
> > +             if (last =3D=3D '\0' && str_seq[in] =3D=3D '.')
> > +                     in++;
> > +             last =3D str_seq[in];
> > +             str_seq[out++] =3D last;
> > +     }
>
> Why do you need a loop here ?
>
> Can't you just do something like:
>
>         if (str_seq[0] =3D=3D '.')
>                 memmove(str_seq, str_seq + 1, size);

I initially had the same thought, but it's because this is is a
sequence of multiple null-terminated strings, and we need to dedotify
all of them, not just the first one. Here's an example:

https://godbolt.org/z/avMGnd48M

> > +     /* Zero the trailing portion of the names table for robustness */
> > +     memset(&str_seq[out], 0, size - out);
>
> This seems unneeded.

Strictly speaking it shouldn't be needed, but I think it's still good
hygiene to not leave another null-terminated fragment at the end.

Sami
