Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24B29461
	for <asahi@lists.linux.dev>; Tue, 17 Dec 2024 00:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734395373; cv=none; b=IpSmBCGA1nePbs8nzJI+3AnnLrG792oGPOW56nMJKc7RPb9CGaqrY+9dA3NGUwTlNhcn7mnBTsiSbSS5G2bPbmhaS9ZOxr8XW4AHp9stOx2rziwzb79fH40/zW6EsD2mkSLt/wPUqa6yShHwLGh3isJ9/I5BTofZaqKLq2nAZsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734395373; c=relaxed/simple;
	bh=EcMHthg8w1+nS6G5Zs4+7mc0M0kkZqrbK9TwcDBa+AQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLt5C1FfBgYtlSbD9Uq7Ru5wIJgwXX7YNtRsOXs827GJmp7iZ4EMezBHMnfRMkk2WKV4XE4jlGqjqMeF1VSgYnt9jo2hricHrFPS4zY7HWCHoMpQzNvMfR5ghIRCHDRC5XiYBA4kWyCu4RWncjEZP5SUuQiEXf+4CUxhTBmIwM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UQxu4hUD; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UQxu4hUD"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3e638e1b4so1858a12.1
        for <asahi@lists.linux.dev>; Mon, 16 Dec 2024 16:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734395370; x=1735000170; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcMHthg8w1+nS6G5Zs4+7mc0M0kkZqrbK9TwcDBa+AQ=;
        b=UQxu4hUDI+4H8908j69Ydsb4d+jlJ0sy0r7Bau8yFimbPv9tK3B7bms7OndqkQvRHk
         g/DONht8irCD/SrkAQrGQgaj1SVLLwcMFhs537slfBB7aS05kg0JhB23jy45fr2WZ01i
         UvfpyCHzgNZzvNRO1zxLeqsDQLYG2l81Oo7pP6YRdTCLdDL2HSB5uMfcPSvKQcOkVLHN
         H81sH3kfnuRrNx93o3LSq7IBbgP+YgAr/atQF+PJSk3uUj2T9dUYjyiUMzmEMl+1AtAF
         h1mfeTKBvFc78HhLtYVIrElOjtXBRH+e2xi9XV40d1rxMJvgbXwJDEyJznWaf+ZNCfQp
         1QBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734395370; x=1735000170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcMHthg8w1+nS6G5Zs4+7mc0M0kkZqrbK9TwcDBa+AQ=;
        b=IUVIvo6o0SkujcuOAY4nNeGtG1qEWVl07UA8AGxw4APaV1TzytLTlahfgvkrmmiA8N
         x+ai4pYwnDDKNuw6nUfKu885AqYhONAEwdMF8dqYBpWSlS8Q4uwFqzD/ieb07voghdoe
         LnK56kKe4N1U4um/iiaIHg96ZsbUV7qv+KlXev85EmQMmJ9FC9f6X7ZzzwixoKLSNjlU
         pt/89aGOrxdER/d2KRTtn5+oTfOG4Lb2iFARk/gjfVNHaggTaVtJ4q05FjlTisVrAmTZ
         KVBN1tHQhkqyN0a1+bHkGf0IdeNxjOW3wNbO4S1bPHgr2BcSxQeHMfhnT0FbTEkYVh71
         TO8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYH4z5EJVZ+1x9D0ZZn/1Lxl6c3+zfSmToAseAgycFBGW7VyWGXtzsQ006+okJKC3pJG8Uzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuUJflXVbjz3nAh/reHgDGY6WkUai/e4f9aOhkJnNpIq0Zg8AH
	FuHSssr5elpI/JH5/5Vl8njImCovOipXtGsRuMuWpsCrbf7MxpaEEvMKvtUzzsdI79kOdJd6OdW
	F7AfUvfsoYx+om/jtsP2ZAOi41DNAh5ZDe4CM
X-Gm-Gg: ASbGncuHpA2UB6AMsDgEVA10zlzfDvDfi9DVY1CIOx7piKWLp+/h+Rs7wgbW8DhrGc9
	gVVBnBZlDxqCKPXrUUY+/wwDxpVf2qIBiQm0=
X-Google-Smtp-Source: AGHT+IGJ2vMJeNxhiowuw33Qt/H3cjobYWBekImH6tWUBKuxTu+odWdOFkVa8jp2BkFSKsaw+CS/TQ1/n07AUP5JKDM=
X-Received: by 2002:aa7:d3d2:0:b0:5d0:d7ca:7bf4 with SMTP id
 4fb4d7f45d1cf-5d7d638f84dmr41885a12.0.1734395370189; Mon, 16 Dec 2024
 16:29:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-38-samitolvanen@google.com> <CAK7LNAS7Pi9=Hcm7Kr=Ju4fMWK4taXEPLOqYombSLqGQ3ehR+w@mail.gmail.com>
In-Reply-To: <CAK7LNAS7Pi9=Hcm7Kr=Ju4fMWK4taXEPLOqYombSLqGQ3ehR+w@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 16 Dec 2024 16:28:53 -0800
X-Gm-Features: AbW1kvaGgMMEILJN5boY_yIqECmEZxfHxS0KrWFUsA14957v4WM1ex3EXvwLDI0
Message-ID: <CABCJKudLD15R1YoR37NcKGZPqdwrwBVLcoCiH1m-HDZYUt+Gfw@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] Documentation/kbuild: Add DWARF module versioning
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

On Sat, Dec 14, 2024 at 3:34=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Nov 22, 2024 at 5:43=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
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

I don't think we can, because the DWARF type information is still all
in the same .debug_info section no matter where we place the actual
symbol references. Also, locating exported symbols from the debugging
information is already pretty quick, the slow part is actually
recursing through the types, which would still be the same amount of
work even if we had separate debugging information only for
.discard.gendwarfksyms.

> > +4.3. Adding structure members
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +Perhaps the most common ABI compatible changeis adding a member to a
>
> changeis -> change is

Thanks, I'll fix this.

Sami
