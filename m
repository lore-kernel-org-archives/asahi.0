Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6511422AB
	for <asahi@lists.linux.dev>; Sat, 14 Dec 2024 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734181500; cv=none; b=s08AqhrbN0bX5b9VFUN8jqci8Zkzx0t4w5/QwNVR00ov4VlXqB0BAEIIn/7qsI6SdgEFmWCYDbCUDM/2kSTyCpeqU2Ngo2ZHVHjHEuaB/R6eG0QoLsrJfN1S0xlmobagTZmPBKSHeaC+P6IU9lNvHOsKVdCaq2QenAAG7NWm7CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734181500; c=relaxed/simple;
	bh=g7RkEQvxHCUgGPAPsXg09LHzWL9erwZn26Z+wYkeh+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ezDqEYSVcnxwkmwFDuY2Z7juoA9eYvsQLaf6dFz9yYpOZWHl1NfwcUkpvnYdqk5pv7R8jbjQKqiMLIxQ1Sx2+z8u+vjN6TrIhs/ne180pekSb3ZGnntuKugGjVcUWpR9vN7ZH+K2fYuF7JOWBfVAh3e7uRDBG8Ab6k6JDk1d2Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EysGNamk; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EysGNamk"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54024aa9febso2585567e87.1
        for <asahi@lists.linux.dev>; Sat, 14 Dec 2024 05:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734181496; x=1734786296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=smLP5LsKfh06xnFeNLi3B7TBCTXcGf3Y2qTyvmyCwTk=;
        b=EysGNamkq6TFwRn886DmcXxfiFBc+XSmWty/3HXy3e8JRf11S6ynu/TvusQ9LsMWdB
         07D9+P1N/rIuq6AYXrJvNAauPaLOwYaTQ7kAM14QTquc1KOLN4ifSTdJDgAc6ey7tdAG
         khTSMjcHWyAP4TpPjZ2QYeqMhii/sc0+uIo9kXd/k2pVvd4Raqg2CmCoGN/WMxzSg3/J
         pfaeJM9ebeuUfVmiGYjV6cHW1UDrf+HfRUDLZ7aIDzdIo2Xtem9h8DpJWz+go8LR2v+x
         Xp4tLx5IjRctppHn7VKc5vu5Vv2/P5Z49hlhReR/4IVskPF6AmtKYaAkFx+GyxYSyoO0
         r8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734181496; x=1734786296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smLP5LsKfh06xnFeNLi3B7TBCTXcGf3Y2qTyvmyCwTk=;
        b=bWW1k3JL2W28NRxy372vENDdymj8ewRdn+nZTuxsgmbpxmBmct9ufFzkePCZGQE7pA
         jsDqiw8tJYmpJ0r68ChJzAGd4dF9av9YubXIjI99OzniVpWghGa3DJLh44nrKePErtCE
         9Q8jZdpEFVa71duuf9Ewn8j2VO3LveLCHMn3/CFzUc357nnAKmNT2B57/Qb+lNUjgRHI
         cwU/YRAQqbSUXeil1f1kHLAV1WA/ue5aKAkqEFuxOJN5ECbs29D8lecPI6y6DSAq1UG0
         CpyP3hPh1B4sVeREr3moxZGxMVcgVXjigAnbeAi70wx2nV8T3IlBGzerqf/Db8Pd9JfS
         hT+g==
X-Forwarded-Encrypted: i=1; AJvYcCXjA9y/quw1VOjKKtz1pKFjIRnQSxSbzUAKakhQIDkJDeRKwC2zfgiZsTxdStBwLvhTU6JLeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUy+KZ1JDkfDvKCjNnNOCHysG7FE9nXAPdPJJpRgPVCNVKhxCX
	CSqoiwYWGR/3AFWkRgc1ItkGhZswMkXxu8V0nWZoCtx7iH6h+z1XLFPsv2+dMG/QzSgb/42DSBD
	0sYA1n8bHOpP/vLygc2isxjoV5ys=
X-Gm-Gg: ASbGnctrftKHpzBDlOJW0Xu87g3VU87cjsAfWQdzXAZqFAgxal23rNkfi524tgYzXpr
	/4ym3ND1GnqQuEBh2rgH9Aq4abXjjRc9LR4OVLhzTt9Jx1E8fKij26VNOmj6ceWpH6Jin
X-Google-Smtp-Source: AGHT+IEPHgyqAt1cX70wM6GRV4JVDyFqSzf59RAxPEnyLNBb6LyX8wtzB0NASqgmUnpv3CsW0s5bk6c37/J8K0cVLPk=
X-Received: by 2002:a05:6512:ea5:b0:540:2223:9b0b with SMTP id
 2adb3069b0e04-540905aae88mr1968894e87.35.1734181496120; Sat, 14 Dec 2024
 05:04:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-38-samitolvanen@google.com> <CAK7LNAS7Pi9=Hcm7Kr=Ju4fMWK4taXEPLOqYombSLqGQ3ehR+w@mail.gmail.com>
In-Reply-To: <CAK7LNAS7Pi9=Hcm7Kr=Ju4fMWK4taXEPLOqYombSLqGQ3ehR+w@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 14 Dec 2024 14:04:19 +0100
Message-ID: <CA+icZUX_actkO4Si2HNQiH6AcS=3aNXA1OOka7LZNtEBQCNTGA@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] Documentation/kbuild: Add DWARF module versioning
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 14, 2024 at 12:34=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Fri, Nov 22, 2024 at 5:43=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > Add documentation for gendwarfksyms changes, and the kABI stability
> > features that can be useful for distributions even though they're not
> > used in mainline kernels.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  Documentation/kbuild/gendwarfksyms.rst | 308 +++++++++++++++++++++++++
> >  Documentation/kbuild/index.rst         |   1 +
> >  2 files changed, 309 insertions(+)
> >  create mode 100644 Documentation/kbuild/gendwarfksyms.rst
> >
> > diff --git a/Documentation/kbuild/gendwarfksyms.rst b/Documentation/kbu=
ild/gendwarfksyms.rst
> > new file mode 100644
> > index 000000000000..7725d7f57131
> > --- /dev/null
> > +++ b/Documentation/kbuild/gendwarfksyms.rst
> > @@ -0,0 +1,308 @@
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +DWARF module versioning
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +1. Introduction
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +When CONFIG_MODVERSIONS is enabled, symbol versions for modules
> > +are typically calculated from preprocessed source code using the
> > +**genksyms** tool.  However, this is incompatible with languages such
> > +as Rust, where the source code has insufficient information about
> > +the resulting ABI. With CONFIG_GENDWARFKSYMS (and CONFIG_DEBUG_INFO)
> > +selected, **gendwarfksyms** is used instead to calculate symbol versio=
ns
> > +from the DWARF debugging information, which contains the necessary
> > +details about the final module ABI.
> > +
> > +1.1. Usage
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +gendwarfksyms accepts a list of object files on the command line, and =
a
> > +list of symbol names (one per line) in standard input::
> > +
> > +        Usage: gendwarfksyms [options] elf-object-file ... < symbol-li=
st
> > +
> > +        Options:
> > +          -d, --debug          Print debugging information
> > +              --dump-dies      Dump DWARF DIE contents
> > +              --dump-die-map   Print debugging information about die_m=
ap changes
> > +              --dump-types     Dump type strings
> > +              --dump-versions  Dump expanded type strings used for sym=
bol versions
> > +          -s, --stable         Support kABI stability features
> > +          -T, --symtypes file  Write a symtypes file
> > +          -h, --help           Print this message
> > +
> > +
> > +2. Type information availability
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +While symbols are typically exported in the same translation unit (TU)
> > +where they're defined, it's also perfectly fine for a TU to export
> > +external symbols. For example, this is done when calculating symbol
> > +versions for exports in stand-alone assembly code.
> > +
> > +To ensure the compiler emits the necessary DWARF type information in t=
he
> > +TU where symbols are actually exported, gendwarfksyms adds a pointer
> > +to exported symbols in the `EXPORT_SYMBOL()` macro using the following
> > +macro::
> > +
> > +        #define __GENDWARFKSYMS_EXPORT(sym)                           =
  \
> > +                static typeof(sym) *__gendwarfksyms_ptr_##sym __used  =
  \
> > +                        __section(".discard.gendwarfksyms") =3D &sym;
> > +
> > +
> > +When a symbol pointer is found in DWARF, gendwarfksyms can use its
> > +type for calculating symbol versions even if the symbol is defined
> > +elsewhere. The name of the symbol pointer is expected to start with
> > +`__gendwarfksyms_ptr_`, followed by the name of the exported symbol.
>
> I am interested in this sentence.
>
> __GENDWARFKSYMS_EXPORT() is primarily introduced to handle
> EXPORT_SYMBOL() in *.S files.
> In fact, .discard.gendwarfksyms is always output for EXPORT_SYMBOL()
> from *.c files.
>
> Can we make it faster by processing only symbol references in the
> .dscard.gendwarfksyms section, and skipping all other sections entirely?
>

Hi Masahiro,

I am interested in everything making my build faster.

v6 introduced a longer build-time for me.
Sami wanted to check after his vacancies see [1].

Just for the records.

Best regards,
-Sedat-

[1] https://lore.kernel.org/all/CABCJKudwpKX1_j46Tp6=3DeAJ0JU2zWE15+c8OFq9L=
MAnSqwesOw@mail.gmail.com/

>
>
> > +4.3. Adding structure members
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +Perhaps the most common ABI compatible changeis adding a member to a
>
> changeis -> change is
>
>
>
>
>
>
>
> > +kernel data structure. When changes to a structure are anticipated,
> > +distribution maintainers can pre-emptively reserve space in the
> > +structure and take it into use later without breaking the ABI. If
> > +changes are needed to data structures without reserved space, existing
> > +alignment holes can potentially be used instead. While kABI rules coul=
d
> > +be added for these type of changes, using unions is typically a more
> > +natural method. This section describes gendwarfksyms support for using
> > +reserved space in data structures and hiding members that don't change
> > +the ABI when calculating symbol versions.
> > +
> > +4.3.1. Reserving space and replacing members
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Space is typically reserved for later use by appending integer types, =
or
> > +arrays, to the end of the data structure, but any type can be used. Ea=
ch
> > +reserved member needs a unique name, but as the actual purpose is usua=
lly
> > +not known at the time the space is reserved, for convenience, names th=
at
> > +start with `__kabi_` are left out when calculating symbol versions::
> > +
> > +        struct s {
> > +                long a;
> > +                long __kabi_reserved_0; /* reserved for future use */
> > +        };
> > +
> > +The reserved space can be taken into use by wrapping the member in a
> > +union, which includes the original type and the replacement member::
> > +
> > +        struct s {
> > +                long a;
> > +                union {
> > +                        long __kabi_reserved_0; /* original type */
> > +                        struct b b; /* replaced field */
> > +                };
> > +        };
> > +
> > +If the `__kabi_` naming scheme was used when reserving space, the name
> > +of the first member of the union must start with `__kabi_reserved`. Th=
is
> > +ensures the original type is used when calculating versions, but the n=
ame
> > +is again left out. The rest of the union is ignored.
> > +
> > +If we're replacing a member that doesn't follow this naming convention=
,
> > +we also need to preserve the original name to avoid changing versions,
> > +which we can do by changing the first union member's name to start wit=
h
> > +`__kabi_renamed` followed by the original name.
> > +
> > +The examples include `KABI_(RESERVE|USE|REPLACE)*` macros that help
> > +simplify the process and also ensure the replacement member is correct=
ly
> > +aligned and its size won't exceed the reserved space.
> > +
> > +4.3.2. Hiding members
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Predicting which structures will require changes during the support
> > +timeframe isn't always possible, in which case one might have to resor=
t
> > +to placing new members into existing alignment holes::
> > +
> > +        struct s {
> > +                int a;
> > +                /* a 4-byte alignment hole */
> > +                unsigned long b;
> > +        };
> > +
> > +
> > +While this won't change the size of the data structure, one needs to
> > +be able to hide the added members from symbol versioning. Similarly
> > +to reserved fields, this can be accomplished by wrapping the added
> > +member to a union where one of the fields has a name starting with
> > +`__kabi_ignored`::
> > +
> > +        struct s {
> > +                int a;
> > +                union {
> > +                        char __kabi_ignored_0;
> > +                        int n;
> > +                };
> > +                unsigned long b;
> > +        };
> > +
> > +With **--stable**, both versions produce the same symbol version.
> > diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/inde=
x.rst
> > index cee2f99f734b..e82af05cd652 100644
> > --- a/Documentation/kbuild/index.rst
> > +++ b/Documentation/kbuild/index.rst
> > @@ -21,6 +21,7 @@ Kernel Build System
> >      reproducible-builds
> >      gcc-plugins
> >      llvm
> > +    gendwarfksyms
> >
> >  .. only::  subproject and html
> >
> > --
> > 2.47.0.371.ga323438b13-goog
> >
>
>
> --
> Best Regards
>
>
>
> Masahiro Yamada
