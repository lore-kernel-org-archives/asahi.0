Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAE0168483
	for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 17:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520134; cv=none; b=P4U7fFJpW6kLdvb85QKWXqUZmrOw/xw/tSmATGJPRzpLSem0UT1FJbMxUjIw9pPOKRAOjKECq8G43CWmvT5luvSoWU9HuyaUFCcIJX7e7lELLwTZVigzNn1j0W/eYE+Xz4MMicN/xG9ZQl68DnSnOg+TuJOxRwEWCayQSUM8unE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520134; c=relaxed/simple;
	bh=2vvecHebovoeGzhdxA64vP0FIVcZsrzn6/S2UuTdzUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEMWnNsZV6gB76EgqqMzlwxS+IBsV/3YyP76q1qFgDVGkbHiI5tDQTAYHk0zw8Bk+Q49gRbleYzdBNxCxxO3xAiPTqwnWxs1DXvchXhaCXQyPrMHfVP2Mk9DyZm8v/byu1lw8ilzlJCvivRWbNR1PjjOneppqfndvG3E0DI4MFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uLgLE0j5; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uLgLE0j5"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c93e9e701fso7055a12.1
        for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 09:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731520131; x=1732124931; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ut09l0p4ejZD65rK22Do5DdJADgIGvLTdDvLpb35Lpg=;
        b=uLgLE0j5Oet0YkGUV5sRC2qWdJDdceffyVDLkAA5FB3aKVJgiRyHeU/pZlrQ+A4pFa
         pUtsHh/W3xqJgcQrUMs7tgA9AW5SCnCrlDBWBmjvbP6JgAY6L2vmcHuu1YJ8UwqdeDtL
         rH2cbfOVe7Vcvpe4oaMGG5TyU6/+pkIa1FAvdPjYChR8I1C7vO9YFUUQwb4e9itjIGXW
         v1jLlFc7JkgiWDteKb8dvTg1En/ffW0qikNqocr2nwIv2nupTO4JQyjCR78qXajeJD8L
         H2rfkBpoISY7Nvw9nPlwYVys7BaSYxwUsye/H8vIjKJM/xm/qsuPfcAx2s2vOTm6ixYR
         wljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520131; x=1732124931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ut09l0p4ejZD65rK22Do5DdJADgIGvLTdDvLpb35Lpg=;
        b=RpigP2M5oTE/A0Vgb8vEcARGhJRMRdnsmONmxWZf2i8zCpnUlw2LxisZSCoiZJpFgd
         z1iZbXekOtYpm6ckC5NMqXMrtJyLGAs0cNSyEecXyRhA8JLqDH1HbRMsw5WkzWiUg6X/
         pY0rQF9/A7y/3kAXaA3FrX/u+8IdxzEv8rkC68U0rn/ddyDyxkK+xZ8RYJLR9nL0R3w8
         +8UVXVTQY2lPEFHvJWRoEqlDo2m0jlBLNO+LmnTvNhFqCBObgsY1s0hpR3sqAPIWT6Ht
         UPyUVHyj7Tq7Uz/j/fQMweecd5qwKiqy3npVyKdo2BtoGRB6CgL5u5sFqDywADtWJyfl
         1r8g==
X-Forwarded-Encrypted: i=1; AJvYcCU57nuAORQ9UqjVfl/96k85JgOJD65QaLV3WXJpp2cJ3ndcqemSxv2PkebkfZxAbXrYRnM7zg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw66uinRYU528h8NWQtuH6A2iLk8tjrSL7aNqxDjmLO9Jb4fy6a
	bRLCiXfvd0EjMsgLQTxb7LNVMWDDPQ75K6LRL8yPYLzGXV6POTxzBZUcgmYtxp6f5lmym2IDp0S
	9mEmuP2Z4OVe6zjggg6zgvIYt7/INgzb8SK0y
X-Gm-Gg: ASbGnctdCaaEnoc21eBQZ/UuieTF9OMobgnynjua+DKOfhx5+NoThPHv52y0BITIj/o
	eKjdZ85LnoFupUVFnctndBviejiJj
X-Google-Smtp-Source: AGHT+IF+3cQN9o21cQiIysZAB4NJwFjVHmftEWZ1JWnUJZdbBdxTB+kUQux093XqXmTqkJPQ2rghtkSNf6aJlDPPoDk=
X-Received: by 2002:a05:6402:886:b0:5cf:7145:be96 with SMTP id
 4fb4d7f45d1cf-5cf7145bfa8mr145258a12.2.1731520130908; Wed, 13 Nov 2024
 09:48:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-39-samitolvanen@google.com> <CAK7LNAR9c+EEsOvPPn4qSq3gAFskYOXVd=dg8O+bKeeC-HMifw@mail.gmail.com>
In-Reply-To: <CAK7LNAR9c+EEsOvPPn4qSq3gAFskYOXVd=dg8O+bKeeC-HMifw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 13 Nov 2024 09:48:13 -0800
Message-ID: <CABCJKudWUBE2ZboktcBEykBReor4T1Cf8dfRCWJYEryoT81OEQ@mail.gmail.com>
Subject: Re: [PATCH v5 18/19] kbuild: Add gendwarfksyms as an alternative to genksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Mon, Nov 11, 2024 at 8:09=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> >  # These mirror gensymtypes_c and co above, keep them in synch.
> > -cmd_gensymtypes_S =3D                                                 =
        \
> > -   { echo "\#include <linux/kernel.h>" ;                              =
      \
> > -     echo "\#include <asm/asm-prototypes.h>" ;                        =
      \
> > -     $(NM) $@ | sed -n 's/.* __export_symbol_\(.*\)/EXPORT_SYMBOL(\1);=
/p' ; } | \
> > -    $(CPP) -D__GENKSYMS__ $(c_flags) -xc - | $(genksyms)
> > +getasmexports =3D                                                     =
           \
> > +   { echo "\#include <linux/kernel.h>" ;                              =
 \
> > +     echo "\#include <linux/string.h>" ;                              =
 \
> > +     echo "\#include <asm/asm-prototypes.h>" ;                        =
 \
> > +     $(call getexportsymbols,$(2:.symtypes=3D.o),EXPORT_SYMBOL(\1);) ;=
 }
> > +
> > +ifdef CONFIG_GENDWARFKSYMS
> > +cmd_gensymtypes_S =3D                                                 =
   \
> > +       $(getasmexports) |                                             =
 \
> > +       $(CC) $(c_flags) -c -o $(2:.symtypes=3D.gendwarfksyms.o) -xc -;=
   \
> > +       $(call getexportsymbols,$(2:.symtypes=3D.o),\1) |              =
   \
> > +       $(gendwarfksyms) $(2:.symtypes=3D.gendwarfksyms.o)
>
>
> I do not want to see crazy suffix replacements like this.

Yeah, I agree. It does get a bit ugly.

> I decided to delete this.
> https://lore.kernel.org/linux-kbuild/20241111171753.2917697-2-masahiroy@k=
ernel.org/T/#u

Cool, thanks! I'll rebase v6 on top of your patch.

Sami
