Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DA5158D66
	for <asahi@lists.linux.dev>; Thu,  5 Sep 2024 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725560177; cv=none; b=t/46BXjnEI7ZVLA7EV99Nbp9FL/0ZGx18P/cTInJ+Gv1aPBuPPWTj6wnM50hnL5isnzgsN5E87ZnarCF3XwIWOGeVoIjG4W2F8OKk5ZPiScbdqMgBKNLZRR1SifdPtQxdxEPIOgnT+BsjxvB8uqU36Uca+gRJh/rxZ+5lrzndVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725560177; c=relaxed/simple;
	bh=VDG73B3i8Fkx0gtYg22krryRHLAdvGRMSQ2YE6B/GM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGB2EygmCxXBEs+wU5AJ4gy/RxV6bf9lqHFdkid7jgSGbPVZHisAept1h5A/MQDfAxiaantnTycnRCyN0KLEqh67iJD+2Acp1AbvSopHaOj2VH1+HGDy7mLADw4j7u+Il0L4UGZ8y/0Bd3+5DgGkproIk/oul77Ez0IZvKS32hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gi4kj0hT; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gi4kj0hT"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4567fe32141so38961cf.0
        for <asahi@lists.linux.dev>; Thu, 05 Sep 2024 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725560174; x=1726164974; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdUTGl7VQBs4B0vEjvie8Mtu3hSlR654PMQj+t2RiC8=;
        b=gi4kj0hTNIReKiC1kOVz+S9kYLheP/Wvb9bMu4A9ErNdy1a/FQek62rYJ544hYcQWt
         hubPoKUDcqVA/nm4TOqWqurMYNXhGIBcLECl9E4CF7iDs34pNSd0uDdJPyS3ACbBhh1U
         n0tg4vXbQxm/kR9GhSMfV08WIWH/0pAngYNbuGD1qf+VfnPArl8emRuYr/+oq0XGyqdr
         5OZgewueXS0qaHJb7nvzoY+xRDT/j7BsY2D+6zZKP1Ba1G2Icb8/fDkpnMZfPjN1H9q4
         qLk4vPYgH+aeHhrCVlOZbZT9pqte3Rt5h1WDfBVoD2zdue5YYSCDArxD0sBR5qRq0sAg
         lBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725560174; x=1726164974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdUTGl7VQBs4B0vEjvie8Mtu3hSlR654PMQj+t2RiC8=;
        b=AuOz+FFV77OTedr4svYZrWqjVPKZvCvjUI6WTs6JOy02RM7jzltBze43o6gUmOY6Cd
         GDJ6A1moHTGQcMCyM6u2KQgKZasJHxUbJqhWIGP1uT2a30CN+LelX4njFQ4ZecOxglb7
         oCzBTkOK5oUfe9GK9FZfH4HIigmrWZvAKETcP7GPir9ZnzHw7qDBVCH7pAClmdidUYR9
         t39SuyklcTDkoJpSjY/qasVgiGvl3uGgLpZpKWcxC43hkACUqRob3pXI4m7fRJZt3c8+
         buq+qTGeLBwXRkE18CxgfZEUwC008NpbnVJup2jkTbwC8umwG0E7Grsxm61Q7Ix0gILw
         tiLg==
X-Forwarded-Encrypted: i=1; AJvYcCXUWpeCS0LJRo87ilQz/YuFwguAkWPCjLiji3S8yszV85sFAVhECvpRScHqtxHEOA4UHBFMQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQjSREGA0BM2tFsLwDCEDzGcHAlc6LK5aP0eCzQKAO0wmQpEla
	ffLfisGvHZGFJkUwA4WzT8gYzcCEiraLYDfdaV8iq+SGJx2bT9P70BMqjtlBk8R8Mb+E+aHKnBO
	cBMvQaH4wW90okg0g5HwZQ5Ny8c56j8c6U9Ss
X-Google-Smtp-Source: AGHT+IHplDe4MMiBWOY5cVCCpgg/EB/UGBgSHmgVn9Z/Jd71Qt02BDSa8paxdOMnp8DalfNq+r7OJlfFE4bJP3BtPdQ=
X-Received: by 2002:ac8:5891:0:b0:453:55b5:ecfb with SMTP id
 d75a77b69052e-4580c434242mr323391cf.2.1725560173715; Thu, 05 Sep 2024
 11:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-32-samitolvanen@google.com> <47bc562d-b9c7-464b-a2e2-dbb8c14d146b@suse.com>
In-Reply-To: <47bc562d-b9c7-464b-a2e2-dbb8c14d146b@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 5 Sep 2024 11:15:36 -0700
Message-ID: <CABCJKucxDtCeq5NgwU9+8Fb1yGbrcV_91NbzM=6YquPLL48Jxg@mail.gmail.com>
Subject: Re: [PATCH v2 11/19] gendwarfksyms: Limit structure expansion
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 8:15=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 8/15/24 19:39, Sami Tolvanen wrote:
> > Expand each structure type only once per exported symbol. This
> > is necessary to support self-referential structures, which would
> > otherwise result in infinite recursion, but is still sufficient for
> > catching ABI changes.
> >
> > For pointers to structure types, limit type expansion inside the
> > pointer to two levels. This should be plenty for detecting ABI
> > differences, but it stops us from pulling in half the kernel for
> > types that contain pointers to large kernel data structures, like
> > task_struct, for example.
>
> I'm quite worried about this optimization for pointer types. It could
> result in some kABI changes not being recognized.
>
> I assume the goal of the optimization is to speed up the tool's runtime.
> How much does it improve the processing time and is there any other way
> how it could be done?

It=E2=80=99s mostly a matter of how deep it makes sense to go. For example,
queue_delayed_work_on accepts a pointer to s#workqueue_struct, which
points to s#worker, which points to s#task_struct, which points to
s#mm_struct etc. Does a change to an internal kernel data structure
several references deep change the ABI of the function?

If we traverse through the DWARF without limits, during a defconfig
build the highest pointer expansion depth I see is 70 levels (!), with
~5k symbols going 30+ levels deep. We would end up pulling in a lot of
major internal data structures at that point, and a change to any of
them would change thousands of symbol versions, which feels
undesirable.

I'm fine with increasing the limit to something more reasonable
though, the impact on performance doesn't seem to be significant in
parallel builds. Of course, this might impact vmlinux.o processing
more, if we end up doing that, since the DWARF at that point contains
information about all the data structures.

I do wonder if there's a better way to figure out where to stop than a
hard limit. Any thoughts?

> > diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwar=
f.c
> > index 92b6ca4c5c91..2f1601015c4e 100644
> > --- a/scripts/gendwarfksyms/dwarf.c
> > +++ b/scripts/gendwarfksyms/dwarf.c
> > [...]
> > @@ -651,6 +742,7 @@ static int process_exported_symbols(struct state *s=
tate, struct die *cache,
> >               else
> >                       check(process_variable(state, &state->die));
> >
> > +             cache_clear_expanded(&state->expansion_cache);
> >               return 0;
> >       default:
> >               return 0;
>
> I wonder if it would make sense to share the cache between processing
> individual exported symbols.

The actual DIE caching happens in die_map, which is already shared
between symbols. The expansion cache keeps track of which DIEs we have
processed per symbol, so we don't process the same thing twice and end
up in a loop, for example.

Sami
