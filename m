Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA792022E4
	for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520461; cv=none; b=B3ncgiis8C+y+5mAEH8Ihg732zKrQHtJZLAI+uEZyGWNflgJVpOQUhCUi4SZPGxw36+2XLPV078J3B6jPVBJ+LSe+YqiGEAcKA3WQgEGm7IDLi6w3zTModYqOms4KRqd+7+SDMiPAfD1FFzyfJ5dcWQqbet6d08a5Kt3bXb90gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520461; c=relaxed/simple;
	bh=GLNEdJnIJ8LZnbahpw3kB6Ri67YbLsla73/1yEoh83E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmnP0Ve+JEr/ynaI0W6riDRL9o7O9RSnkf3N5dzklWirYsrT7tw9eR3gUKzpakGz4MxotleVb85MgtwbMqVno9Z62gueeAcz9zRt/z61IeYg48WNvmRCO8hNoF+VX3rdDW+0tcJRuyHqCK7tNbBQztKPpC3Cxyj7PznZzuxitpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xUXuJUqM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xUXuJUqM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c932b47552so9262a12.0
        for <asahi@lists.linux.dev>; Wed, 13 Nov 2024 09:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731520458; x=1732125258; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OY7wBsUbdQcWggybLDq37KJ8DaxAj5d11PMFbvDEhAw=;
        b=xUXuJUqMmwv7YApD/6EsmLVU3c6nJ2lujhHBm2EptSPZ1W7Tfv8wdUeJYwwW/vDDsC
         +71KIqI8BxoIh/AMMb+WUAfgPgJh3YetXO1mL1GVQrYmlEZd+4mY4qVpk3i6tlXQbLJa
         J/RwoUQvqgVBhdsYOEj3ItY+0j5OiiSyirYtT1txuoRyM36Ymc9BNCNY2oNx0QdVnGjZ
         ZxrGoy3JJxskypNWUZbxsvuCkcYZDfiiVvRCVcmheLMl2Qn98CIl4ln5kwltjY2R0nbi
         5mq9hv3NQ3fhGBRTpcD4UxaSrDSlPOX8jOo4NexWjnYQ5tMVPP+8SzT7mIREvr5yqHtv
         2Dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520458; x=1732125258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY7wBsUbdQcWggybLDq37KJ8DaxAj5d11PMFbvDEhAw=;
        b=Q6jE5kwnZyAFP8OuipMuCDQxpqXaYytcmEtfD0CyisGqsE3AaB1iby2bYlDqp7MxJX
         T2SfOKDZfkvZTwx3sC1v8+0N4+6UEv0GXSmH7V20RpjiZwyNVF3d4O05u2v87NjHpIxi
         8oWd5LK4ca5lnQAlzsDPIQLG05VATn72F+Po5ahiSF/BmYkb75CEu7g5Jt7I3wLOGtVe
         gn/xlLgDM5tKbJCcdlU9iH/zaAuZULd7eKyKR5r9Q//xgFbGE3fcPeF74SUgiAlX2IsE
         Hp+FgWVCWzVlgRS4L5GK9Q3v8PLSsw5ZhHGaPZrd5dCWHxOq3yeKpHsxIsKayRov51kh
         5JpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/hKG3GnfG0ZsJlB+11nVH2xsp5VT5SrUaEA/VS2puvaFcCIin0pFQuIanFxkdSVGk6USPbg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/B6CrJD/FRwmkQrdx1bsnNlKfD24YvuqmIYQ7u/hUeVgTu86D
	jxEAAidnTakk1/tmGgZymDUZCcBh4UJumcWKuIBjK6+ZcbRRukDkG3v8e90Mh6nfCuFcQ5Z4ICm
	lcqpGDBN7gMo+hMGvhJtkRENjb4NmBrPEvmhV4s22m7CHSDMgjA==
X-Gm-Gg: ASbGncsSjAfy84vqRLgUfkrMDHLFoD6vBK+G+V67wnFUca2X+yWp/MKmX3BZXOHnCDe
	27qTju2v2PlJ3JPt4tQn7l5jPg0Y6
X-Google-Smtp-Source: AGHT+IFXLnHsfDYTpS01K6b79CsIuzgS6MULqvEjuFdWIkvmBmxgPffAF9QVNOOGzikrvjwjQEp2QY0dMQ2TSECyW3Q=
X-Received: by 2002:a05:6402:5308:b0:5cf:659c:abb9 with SMTP id
 4fb4d7f45d1cf-5cf659cadbfmr209409a12.6.1731520457717; Wed, 13 Nov 2024
 09:54:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <20241030170106.1501763-22-samitolvanen@google.com> <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
In-Reply-To: <CAK7LNAShVzrE6uhXxZ7HepKhmOJYsZeigq6w19jRN3OH-T_Jyg@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 13 Nov 2024 09:53:41 -0800
Message-ID: <CABCJKueVjP8V-=3Ehi4QvQzg1FZh2unyVMDzSJ_vJ_E5EE+gLg@mail.gmail.com>
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

On Mon, Nov 11, 2024 at 8:06=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Thu, Oct 31, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > To avoid duplication between host programs, move the crc32 code to a
> > shared header file.
>
>
> Only the motivation to use this long table is to keep compatibility
> between genksyms and gendwarfksyms.
> I do not think this should be exposed to other programs.
>
>
> If you avoid the code duplication, you can do
>
> // scripts/gendwarfksyms/crc.c
> #include "../genksyms/crc.c"

Sure, that sounds reasonable. I'll change this in the next version.

> > Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Acked-by: Neal Gompa <neal@gompa.dev>
>
> Does this Ack add any value?
>
> Acked-by is meaningful only when it is given by someone who
> maintains the relevant area or has established a reputation.
>
> $ git grep "Neal Gompa"
> $ git shortlog -n -s | grep "Neal Gompa"
>      2 Neal Gompa
>
> His Ack feels more like "I like it" rather than a qualified endorsement.

Like Neal explained, an Ack from a potential user of this feature
seemed relevant, but if you don't think it's meaningful, I can
certainly drop it.

Sami
