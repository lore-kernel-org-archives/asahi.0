Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F81DE2C8
	for <asahi@lists.linux.dev>; Thu, 17 Oct 2024 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729186549; cv=none; b=ed5m4wFoQ/EX2Mh2oGjDQvZd2HHsZgs8V+hnXNs+d+NfXrrtjvAAd1xDgVSyxOj56kqmCPY+1LT8luTJCcwJpiXfvyVOQlEWQ3v/3YtjCqccmMSh+P8+bMSOI1peTFB7ytM8pVDs9D+cN0eVFQupa2cKN9q+Sjxrt82+/QbXRGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729186549; c=relaxed/simple;
	bh=HuLw3XyUw5DMqXb931/MX/8kxOX3NCDGhGfWHIZsYUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTrVPp9YTZmXSzu9RZ/4cl+mL69Z28rwzkiSdYHLb9GRrPIFammfkEuKni68YkcUt8+7A9o2ERbUQQBdSa6incAj42+7MFY554RuQs9ntBcP4fvJXu20uRDuT1f+QTiH/s5YqFnNrbaloU273EMg2zkQU2MKilkN5Mmda9wAZiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ylzdR2Qt; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ylzdR2Qt"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4608dddaa35so18531cf.0
        for <asahi@lists.linux.dev>; Thu, 17 Oct 2024 10:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729186543; x=1729791343; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dURRoBcg5xdc+sfdygcMDdcNIH61rDVf7UQMeP0ptwg=;
        b=ylzdR2QtVObYbNB3/qD4Ip1WceLEbqofCafoSbWEIb9Jo/W0UOlk1CFhqit+FwtCRk
         VHWLC7JUQJLvowCTe54G7D5/kemEhVRSSWZVplbkvuMBvT+9kHj9d7b3RAiVeErB07cs
         HkxxaW6JIr7hOJRvI6UneHQr+2bm8NP8yisAYkuHgR0vLexXkjzSQhgDxNOD6JRIwkF1
         wC0WYQvm3K8n7RAVYg+9ypz6YhGt3CvrLhXq3VyoB4AoEeaUhKYtDYDOWkmG3Qs3/OJM
         6H0MsY0+WGmx7kNB54/x0rND9f6qzDUz1oKTJTYijMeJINN40JilWK+k/GXvCbgbvEFV
         1P1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729186543; x=1729791343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dURRoBcg5xdc+sfdygcMDdcNIH61rDVf7UQMeP0ptwg=;
        b=U2GoSJp7w+TdhVyUjUOU6dAYx1zH3jJtV46cq9n4j0WtIxmV3U8wVKiyJVVKxeFBYx
         dbiB8ZQC/uFiUCSmHrMBfqRKTOGPTleSM5eegdh8PrwHkjN5xWwxUQqLRgFFaoh4oAuN
         dPqimNaYwHbbE065y+UWRZVc7MQ/eBuv+TWEHCqD7V0ZbbApeKR1km3K45r1qAdLuQZ5
         XggNDPwmxNgXjhfyrw+EpxQ8wvNuS/8KrnSidmORzB2YDhww2t/28PKeSlE9MTlvZNyg
         Dy2j7OS9wIsY/pNaff0WvCZ4PBhyn923Io3fmfPOL4/XrZzrKLQ/DPp9eiZIos6tnEqQ
         HdSg==
X-Forwarded-Encrypted: i=1; AJvYcCW6zgF1Wx6rLbAzSrGphYN4LJL7B4YMJfo9hAsGUwcrZmUWD94zAKdQqQ2iRtI5mqoH96xSZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBpbVCBsRLmXYKvEYY3WvKazPm6nF/w0wh2sg1lI6gfyGLiuNW
	bm61s4s0Ljz+GxABBB2cTNuW+spb5p2WY2291f8uYvaNcDkRSpOie8I4mR45LQWdFbtr3bwT4AK
	YmJEMFWYCm7JEM41zTvNTMtFQ0hBbiceHaO97
X-Google-Smtp-Source: AGHT+IEaDSNEXF6UDd2rD0Gd9sSzpU9Rg3eq7jFfKlAmBkK223IeHgDaarxW/TGnC4DSXNdPeOYFY1DS/4zAFx3ebnw=
X-Received: by 2002:a05:622a:a64e:b0:45e:fea6:a3b1 with SMTP id
 d75a77b69052e-4609f69cb5dmr3909251cf.19.1729186543003; Thu, 17 Oct 2024
 10:35:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-33-samitolvanen@google.com> <13be9260-1799-4255-89d4-65d56358e348@suse.com>
In-Reply-To: <13be9260-1799-4255-89d4-65d56358e348@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 17 Oct 2024 10:35:06 -0700
Message-ID: <CABCJKueKHy9XmpRVG=HkJaJWAQvtN6OvnnW+Aag4Hd1dfif5SA@mail.gmail.com>
Subject: Re: [PATCH v4 12/19] gendwarfksyms: Add symtypes output
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Petr,

On Thu, Oct 17, 2024 at 7:13=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 10/8/24 20:38, Sami Tolvanen wrote:
> > +     if (symtypes_file) {
> > +             symfile =3D fopen(symtypes_file, "w");
> > +
> > +             if (!symfile) {
> > +                     error("fopen failed for '%s': %s", symtypes_file,
> > +                           strerror(errno));
> > +                     return -1;
>
> Nit: The 'return -1;' statement is not needed since error() doesn't
> return.

Ah, missed this one. I'll fix this in v5.

> > @@ -107,7 +108,8 @@ static void get_symbol(struct symbol *sym, void *ar=
g)
> >  {
> >       struct symbol **res =3D arg;
> >
> > -     *res =3D sym;
> > +     if (sym->state =3D=3D SYMBOL_UNPROCESSED)
> > +             *res =3D sym;
> >  }
>
> What is the reason to check that the symbol is in the unprocessed state
> here?

At this point it's mostly a sanity check to avoid extra work in case
we run into more than one DIE that matches a symbol (or its aliases).
This actually happened in earlier versions because we handled symbol
type pointers (patch 17) as soon as we found them, but now that we
just save them for later in case they're needed, this probably isn't
strictly necessary anymore. I don't see any downsides in keeping this
check though.

Sami
