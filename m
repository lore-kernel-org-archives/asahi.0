Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B293313342F
	for <asahi@lists.linux.dev>; Wed,  4 Sep 2024 20:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725482968; cv=none; b=NUandzLMf/Ert/i5qKkjJOm59t9N+80CRFJVpNE5dYTYqJp7qeYrOzHeXphjnfOsKPlsfvn11bNs+bc8zc4Pae3cK0VUY1RvnktHjUqg4nrXliqQixe0HRMqfDHKYLXqYiFhoFoQSh00Bdpld/+RYeTfzBtgk+/LvyhdqqELOdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725482968; c=relaxed/simple;
	bh=Cc8EAH8IE6Yvd2aBPD8rscltUpBUI4dNmp2jXK/tiZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+8tEYO3BzO4NcnmHxi4SiMLeUaJUj9VWRkrzgLVpxkH13fTNGWyBGgDFTeQj7JYSfqLVateLzpF/X0APpg702gc2oLXVR0CbHbSW30HvK44Ns0u7h/iSQTWxuWu92OluGvoUaZqUEN/KEJc0wLMg07EJ0CUl4oar3saqt6u5U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DI6C7Gfv; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DI6C7Gfv"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4567fe32141so28531cf.0
        for <asahi@lists.linux.dev>; Wed, 04 Sep 2024 13:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725482965; x=1726087765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gx0Hp8KWD3MclVMhWNlTjqLSDptdez0gd8c+TTiyWFY=;
        b=DI6C7GfvNNKBU7Q1zC/2YjTzVnHvukRe1f0U5SudQxPSzfrKEXzoeDXoPeLbbUVGUq
         mOIbRlrjIZRGoMTzkxREEnDYS1rxyjUIecshO0EEYX70mzte9XQ6hJ5eMl/7LjMys8Yg
         qww5jZTFQ3B3eXYKGbRiTgzKYk9S+xLEOOFrv7bXZuNH9rYVLAVW8Sqi99VXQYfSfy+t
         b1tkQWVT3b7D8emw2bV2N0lzNJpCr1AHty0C6/n2KBKES7uui1egsWrSNHQJ892l/kGZ
         iuum9xEVJYKieL2Yjku61WIP6ixwcwr8vdfSWIzlWvBK2Uy6xE6TQBvW5HkIGgURE1iU
         l1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725482965; x=1726087765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gx0Hp8KWD3MclVMhWNlTjqLSDptdez0gd8c+TTiyWFY=;
        b=SB7wHLAnWRFJcfWpY/qwSLkkhETHKCY9bb+3PHIWBBa2tmgI1FP37aRsvNzcV20Yca
         +xiCiValGsgHstukuexyOZcTD0BZ1d6WCUAqDMeBRcWdId+3MxNSh/SYyjQQviQcRV2R
         ZnINvPq7A5Oaxbz1tnqqT40l0gce3u5vrPKTRhAdo/J5SInJS8H3unpQ3KosPzy4yNVd
         Ujam8aUC+/kSsxEWS5M/GZ9O3cuDh3EXlpvBzx7rIKK1msRiPtYpFYwJ8EF6l3pws55/
         nbsfaduwZOvWr+Lc4+T/OXfs6QDZP7V6RnLzI7CvRh/wFoikPPsxHHTx0Umd+1swdIJ5
         3P+g==
X-Forwarded-Encrypted: i=1; AJvYcCXGXbPImKMy6rg0KfgpURUeyklIwlHwJfxDFiYVbetetIHY8ut9OL0qzM3F995U7j+PSiR/jA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGW7+4Jb3iYqApA33GXe/9M5P4HzxtNUpIZ3p/7PHnM7fAK4WF
	VckTMRGHN3efTuVqty8iVUAc/2vxJ4n579CY3wbsv7pDh7/hoJHy2UpgEVA0vYg+NW3ix2XWrIF
	sJOKhaJ0FVpf1A8BqJue6BoFsBlzVJAWKKyIc
X-Google-Smtp-Source: AGHT+IFd6KrSrGqG+ulcWq9YMSxY7NK7vHFG24Qs6rA2X3nt4MsgAamSOqjNX6oKm6LJdBaxSA3RA8iCSuENhDVVJls=
X-Received: by 2002:a05:622a:2a07:b0:453:58c8:3fd1 with SMTP id
 d75a77b69052e-45801b1f7ccmr1000011cf.0.1725482964482; Wed, 04 Sep 2024
 13:49:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-24-samitolvanen@google.com> <CAK7LNAQs8E1pKo1Bcn4RUAkGbBFPmUsWRRrQCnUUiB588FB09A@mail.gmail.com>
In-Reply-To: <CAK7LNAQs8E1pKo1Bcn4RUAkGbBFPmUsWRRrQCnUUiB588FB09A@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 4 Sep 2024 20:48:47 +0000
Message-ID: <CABCJKud+c3CdKATGDghCdJ=Tn06es5z9U5T5nDi7gWMBkyRNZw@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] gendwarfksyms: Add address matching
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Sep 1, 2024 at 11:11=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > +static int set_symbol_addr(struct symbol *sym, void *arg)
> > +{
> > +       struct symbol_addr *addr =3D arg;
> > +
> > +       if (sym->addr.section =3D=3D SHN_UNDEF) {
> > +               sym->addr.section =3D addr->section;
> > +               sym->addr.address =3D addr->address;
>
>
> These two lines can be replaced with
>
>                   sym->addr =3D *addr;

Good point, I'll fix this in the next version.

Sami
