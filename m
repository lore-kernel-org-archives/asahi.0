Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3F71E766D
	for <asahi@lists.linux.dev>; Mon, 18 Nov 2024 21:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731967130; cv=none; b=nPs2f8VPoxdXpts+rhifZw0ZtXCk20EhzCAW/KdDL/Mslnxk4MFQFnarAWmFEJkIeIFDh0QeuZ7wkzrTrI2YGl6t1YX3n8XGLjcQx835Ih5F82TQ0WFQ3/O2IBf1pu/LJRuEn1tPdNI6ThWl6MC3YNeDz+JvFHIJbA73/nbERNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731967130; c=relaxed/simple;
	bh=hQkH15gr6Qgm2KoVe/ThQVUD4flOHdtYi2Q7pTwd0MQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NOztBeL3dk/f7irexRzVJkh6UrqNDOJwjMqkhNmLXq5L0v5ZD33v79SOWOSpQAT4NUBcOOo5dducLwZMXTwPyUz7vYh2qAqxNM9+LRFrGe63gzzHfnPkP41aoDFQg5Zgai3cfJ+qt3uCPC0/5Yg10XDhXcaIlVOhXn4Hn75zQ6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e6NErmWs; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e6NErmWs"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cfb81a0af9so3408a12.0
        for <asahi@lists.linux.dev>; Mon, 18 Nov 2024 13:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731967127; x=1732571927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQ3Et6WIBdQ7sud4i/NonpGyXfau4X1TNW+PUgugafE=;
        b=e6NErmWsm40GCNw4duGMk0xAnEADp9xuqUG/wfm3kKnxC2LxyZQP/Xgn7rwED0mBm7
         ASDlJld/f1YazxVb2SpwGr9yDyxbA2CfhTcffpbfI3W5U/Zq0ipnSiSx1M0bFuWJfZks
         R4IblTXQB6NFp6odl88Ds8hzODFJx/ENXvQYg3Cm8MHb44hlxoPRdwob7H9L6oOYYZ2T
         DBahmomiLPVZefFqh0oOFzgJAbx2PpXl3LLYwSKN9T+WI+gJ1Izd/rHOo1vOxJL6Uz82
         hIFDRvtrG8F1Ir/XdheqL/wC+GtjkEHadGXEQB2v3X56I3UksuXanC+VZZvyTa+uJuvW
         QVNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731967127; x=1732571927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQ3Et6WIBdQ7sud4i/NonpGyXfau4X1TNW+PUgugafE=;
        b=CGj3v2Y36nJJcNBKlMF94neN1MXK4E3kJ42J03RGrd13xiY+lxSfj66eSjwIbO9tWL
         Pz+T5FZ2TU7X+UsqdZx/qjN01xo1YjYppPECXE72Nq2HJYqg9RTg8nO+PE9UuQRLuplT
         66msXeEKQsXk0HAxuiE8pYhzrqcgunQYN0e4DemRF5HOj3Rtoy3dZo0Pe0/mr2o19q5u
         2BDlMjdQQ3UlJfV25PgiDI8S2j3OW3buLBiq3rOmH82KJZk0YXCEaISn+v3JhzWxC03h
         sKxowcDJkQz37Kp6sIG85kSjIHVGzk2jdhGgtrcMQZj4V/o/vRsJXKs0XlEVSwLtoiLA
         jAEA==
X-Forwarded-Encrypted: i=1; AJvYcCWY52tRu3cVmqU893JNyXQqC6KZnJ/O2HtXeY42qfrwZQ0i3eOoTGarCF0OMHE+8U2q7JYquA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyObcOmmPbHgf/bxi48fWdYGGSlSsN+oGRSmN3Mk+/9xJ0MilsT
	1MU/giR8y1TvzCMGFA2mfXmog5YwXCQZX2amj3yBa/q/CznoiAp/t3JkceaUSuTmniUrMxv+DKN
	uZiFDDHyG2TL4WFJUaDSragLAzieY4PKtyx21
X-Gm-Gg: ASbGncsxKMBe+9bgIEyxSfOKZfAu6lzdpNblHZdW+QMyKUmt0zw2D2rcbClpSxIHbqm
	SseB8E208IvKuYaAeTT4kc/jc4dNk8BgrLvKHT70b6t5Vk2P9GCsN7pPsCl4=
X-Google-Smtp-Source: AGHT+IED/n5r3VjG+Ri+3OnSZ0XSX0QLyw7ggJKkFG+u6FSu0srLpXwOc/cszXrN20qB0TpblSw7+zX2Fd7l9uwnoW4=
X-Received: by 2002:a05:6402:50c6:b0:5cf:deaf:ac2 with SMTP id
 4fb4d7f45d1cf-5cfdec1bb2cmr23256a12.2.1731967126565; Mon, 18 Nov 2024
 13:58:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
 <CABCJKueVjP8V-=3Ehi4QvQzg1FZh2unyVMDzSJ_vJ_E5EE+gLg@mail.gmail.com> <CAK7LNARVK1ZpGXZVTAynuo7CDjgB4uT5bQzcGiWseZfaEu7Tvw@mail.gmail.com>
In-Reply-To: <CAK7LNARVK1ZpGXZVTAynuo7CDjgB4uT5bQzcGiWseZfaEu7Tvw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 18 Nov 2024 21:58:09 +0000
Message-ID: <CABCJKufVpx4dsr7A44qA0ydwTEx+3Qy_OMx9Ch6OKa4nzvRj2g@mail.gmail.com>
Subject: Re: [PATCH v5 01/19] scripts: move genksyms crc32 implementation to a
 common include
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

Hi,

On Sat, Nov 16, 2024 at 9:09=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Nov 14, 2024 at 2:54=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > Hi,
> >
> > On Mon, Nov 11, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@g=
oogle.com> wrote:
> > > >
> > > > To avoid duplication between host programs, move the crc32 code to =
a
> > > > shared header file.
> > >
> > >
> > > Only the motivation to use this long table is to keep compatibility
> > > between genksyms and gendwarfksyms.
> > > I do not think this should be exposed to other programs.
> > >
> > >
> > > If you avoid the code duplication, you can do
> > >
> > > // scripts/gendwarfksyms/crc.c
> > > #include "../genksyms/crc.c"
> >
> > Sure, that sounds reasonable. I'll change this in the next version.
>
>
> BTW, is it necessary to share the same crc function
> between genksyms and gendwarfksyms?
>
> If CONFIG_GENKSYMS and CONFIG_GENDWARFKSYMS
> were able to produce the same CRC, it would be a good motivation
> to share the same function.
> However, as far as I tested, gendwarfksyms generates different CRC values=
.
>
> When a distro migrates to CONFIG_GENDWARFKSYMS,
> the new kernel cannot load old modules built with CONFIG_GENKSYMS.

No, it's not necessary to use the exact same function, this was just
to avoid adding more external dependencies.

> So, there is no need to share the old code.
> Another solution might be to use crc32() provided by zlib, for example.
> It requires another external library, but this already depends on
> libdw and libelf.

Makes sense. I'll switch to the zlib implementation in v6.

> > > > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > Acked-by: Neal Gompa <neal@gompa.dev>
> > >
> > > Does this Ack add any value?
> > >
> > > Acked-by is meaningful only when it is given by someone who
> > > maintains the relevant area or has established a reputation.
> > >
> > > $ git grep "Neal Gompa"
> > > $ git shortlog -n -s | grep "Neal Gompa"
> > >      2 Neal Gompa
> > >
> > > His Ack feels more like "I like it" rather than a qualified endorseme=
nt.
> >
> > Like Neal explained, an Ack from a potential user of this feature
> > seemed relevant, but if you don't think it's meaningful, I can
> > certainly drop it.
>
> Tested-by is more suitable if he wants to leave something.

Ack. Neal, I'll drop the acks from v6, but if you end up testing that
series, please feel free to add your Tested-by.

Sami
