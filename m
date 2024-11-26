Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372E0CA64
	for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 03:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732593086; cv=none; b=q8XO6fafax5L8LjWWr7D4FUeKpE/bach8Eg9a4/VQqSgBw+7RPX89uyXkqWxdsYPpq6WLSo6nugI0GkHVgoZ6tIw5fbG1fAqNxINnHnBAtlMlJwECZJEbM4jcwzwJ7Adov9A60MiPUFjrOhxnO7kkiXuNCk/ct1Npfmyp/+1aUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732593086; c=relaxed/simple;
	bh=zMONBQMoYUxKJcmzdRpne6c+qzfU1TZwryMh/qwAkig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euKcqGIH4TlnUvkIKdWRo9h6UeL19ra+TVObGRS9B5KFW36wn/g20f6IFRG/gJcTm5uPGq5gHsAhOQWBG4IY3NZZXEDUReFD0or2OhT4RlR54gnUDbAFLJ9tor1KBdjdzdTJfGyWn+Hs16KNTcyZX+kSBxPsvVVmtSBRD85VdDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcbB6cmk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcbB6cmk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9793C4CEDD
	for <asahi@lists.linux.dev>; Tue, 26 Nov 2024 03:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732593085;
	bh=zMONBQMoYUxKJcmzdRpne6c+qzfU1TZwryMh/qwAkig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GcbB6cmkPNgfmPY+L6M4TOdJi1U5I5Mt+1Eh1luEb/wFRjsMhQAJIdwMp43gsQIjk
	 6tR/K4RyGQEnju0MfVfMPIil1Jqqrc/VUMup/jI/9DwTiyEDtMOYzkAd+BfF3skNLc
	 j+iZ0HANiYqQ8ADZKa2qX2vS5Lpu/m7AeDCC5JM4die1O2F5zKyBR60xnmHfGkwzna
	 bh8mNc1tnyNr9wdgselSM5KLOdzQHQdCMDPxFDbvnp5mcfgvvAUEMVcw7eHYhQQ78f
	 q2K2Y6h7nbnZ6thk36coy/7EKCJCnEXwZuUqxoc63S+ID1SGPHr09wnnuiIYPYbHJn
	 H8wCzU0eXDb6Q==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53dded7be84so2804406e87.1
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 19:51:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX4HiGnSy3/CFoPyvIUyhiBpYnE3nWhQKMN85BcbQYp1ZundbYJJwqI80FwlJH20LOrv3Olxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmrrzJo0VlG3TuQ2ArTWST09v7N0JWtvc9Yw8Y1lS+F9vjgYoH
	B1CmkePeuaWuyTCUl+nk9s2Nqg191p99eUBh5Evsol7kDTOdpMmDhKLcx3KAP9HEFZRoEzQCcqu
	Ww0+hk6JIUAYKYz6HmWkFq/lzbno=
X-Google-Smtp-Source: AGHT+IGfZbCGxLVNWV4gijGeosGJ443DngbeOpxPOn45AImk4jYRfXEGZyQcjNG4hqqjcdHxcChMPYKgSDJiicl7DPQ=
X-Received: by 2002:a05:6512:e83:b0:53d:df26:b782 with SMTP id
 2adb3069b0e04-53ddf26b7cbmr3805477e87.31.1732593084382; Mon, 25 Nov 2024
 19:51:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-21-samitolvanen@google.com> <Z0UIdmDHYQtUTR1i@bombadil.infradead.org>
In-Reply-To: <Z0UIdmDHYQtUTR1i@bombadil.infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 Nov 2024 12:50:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNATK9rSm4AUSneq=aYbADatPL=1eUXuYRChX+WU+zNTyKw@mail.gmail.com>
Message-ID: <CAK7LNATK9rSm4AUSneq=aYbADatPL=1eUXuYRChX+WU+zNTyKw@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] tools: Add gendwarfksyms
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 8:30=E2=80=AFAM Luis Chamberlain <mcgrof@kernel.org=
> wrote:
>
> On Thu, Nov 21, 2024 at 08:42:22PM +0000, Sami Tolvanen wrote:
> > Add a basic DWARF parser, which uses libdw to traverse the debugging
> > information in an object file and looks for functions and variables.
> > In follow-up patches, this will be expanded to produce symbol versions
> > for CONFIG_MODVERSIONS from DWARF.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > ---
> >  kernel/module/Kconfig                 |   8 ++
> >  scripts/Makefile                      |   1 +
> >  scripts/gendwarfksyms/.gitignore      |   2 +
>
> This doesn't add scripts/gendwarfksyms to MAINTAINERS
> but then again   scripts/genksyms/ is not there either
> but it does got to Masahiro.

scripts/genksyms/ is a very old tool with no maintainer.

It defaults to the maintainer of the scripts/ directory (i.e. me)



>
> Masahiro, should we just add both to KERNEL BUILD and add
> Sami as a Reviewer to help with gendwarfksyms?

I think it is better to have a separate entry for

F:  scripts/gendwarfksyms/

with Sami as the maintainer.




>
>   Luis




--
Best Regards
Masahiro Yamada
