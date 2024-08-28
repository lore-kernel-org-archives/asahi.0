Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F0113D891
	for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724829341; cv=none; b=f76Ouqdbb5ZQuoBuxPkHIb+EdwaFyGPZqdRou5Hhp9PtSRMUiCXf5XHSyFFr3dW5/UNTwSIYq3di1Urfusf237ECU2XR4cGoYSPC0yIxq6Qg8STFiG7Sk6QeV/8OspS79VYrr4ljR+lY3RkoTT04HCerTsHushoaH5pulJrz9Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724829341; c=relaxed/simple;
	bh=NMwwwM1jrp/qrf+hPLfBh9ss0lqgPsdHmYFP+q8ILEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pO5Vbv3+nf+aQSY5+D+9yDfftgBaxZde9+cPr4EihrQVGs2937PMhNyW4+JDspWggg87d2g0j/Sxw4jaaV4Kd7AlpEexQtKREtGz70yO/EY2Qd8LkmXGRAcyjg+ZM9z25o/H4qjgWu5Lz5LsO+pvtbLPG46fEhQUttWgjlKQ0MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiPwKgBm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiPwKgBm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED72C4FEA8
	for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724829340;
	bh=NMwwwM1jrp/qrf+hPLfBh9ss0lqgPsdHmYFP+q8ILEI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CiPwKgBm4qW1V9eKUMJ/+GFFaf0/jo4/DdTduEA+VEsgPTRsAG1hLhGW97M57eiS9
	 YyxcIMhJzAhFWWqM2LDr64HgBWLolJ57tE2OyXLO4pCrBZizxf6tS1g1C5Gfkun6Gl
	 4uMUXzdq++aaJ3F/jYrcD7MDSTtYwcaqQcWL1Kg/2fgaMnzrN8/IOgDa56b9ZtehHx
	 LXqPiTR8H3De/wzEMpOrcgSGo4Y8nAKa9QlkWz92q3JFONpZf2P/Yvoo2B/r+bJdEY
	 LYUTKsuV1MXQGFF7ViXNZtbACqtOdDkDlwHoBZ3aLdkjrrCfFnKCQMRIaqV7lS2BJq
	 fOQDS1N42t+RQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f409c87b07so74649421fa.0
        for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 00:15:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkQG+1HmhQMoKSNeoReZijnSrJFKJ8C5onTGGcoiYCcTEn0FDsMsr/XJwAGdh4liDuu4EhvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+eGvVX1+jownSAkqRZzlVMzb2Qef4Kpo42uUUpbWObZIDYHIw
	1V7fldzsSCLsNl6o8tKNSBMII13Pz0s4YmHWxQfg3GIantCRfboZI92smJP78drmSNqFBESQi/c
	yfyJXe2SXMtjOqZKZLTolpFQM2Ho=
X-Google-Smtp-Source: AGHT+IGeiHzjppyiOzBEOUZ/0V/PBewgAL1CCGk/uVR+74Z8yFzChu+qKl3qWPdvEuIh5XMH14MHw9544LmMkmjX1ss=
X-Received: by 2002:a05:6512:3195:b0:52e:9f17:841a with SMTP id
 2adb3069b0e04-534387558bdmr10993178e87.6.1724829339571; Wed, 28 Aug 2024
 00:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-25-samitolvanen@google.com> <CAK7LNATb8zbwEVgM+_=CaYSysov6YBMbKjy8+t8CrRA_72jxuQ@mail.gmail.com>
In-Reply-To: <CAK7LNATb8zbwEVgM+_=CaYSysov6YBMbKjy8+t8CrRA_72jxuQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 28 Aug 2024 16:15:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBO-VA8G9uumwH5m9idQofY1ZR+hnNfL7y4P3m16xFNQ@mail.gmail.com>
Message-ID: <CAK7LNAQBO-VA8G9uumwH5m9idQofY1ZR+hnNfL7y4P3m16xFNQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/19] gendwarfksyms: Add support for type pointers
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 3:50=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > The compiler may choose not to emit type information in DWARF for
> > external symbols. Clang, for example, does this for symbols not
> > defined in the current TU.
> >
> > To provide a way to work around this issue, add support for
> > __gendwarfksyms_ptr_<symbol> pointers that force the compiler to emit
> > the necessary type information in DWARF also for the missing symbols.
> >
> > Example usage:
> >
> >   #define GENDWARFKSYMS_PTR(sym) \
> >       static typeof(sym) *__gendwarfksyms_ptr_##sym __used  \
> >           __section(".discard.gendwarfksyms") =3D &sym;
> >
> >   extern int external_symbol(void);
> >   GENDWARFKSYMS_PTR(external_symbol);
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
>
>
>
> Commit ddb5cdbafaaad6b99d7007ae1740403124502d03
> had a similar idea; it has a reference to each
> export symbol, including the ones defined in different TUs,
> but in assembly code.
>
> Didn't it suffice your need?
>


Presumably, this is an unfortunate duplication, but I do not have an
idea to avoid it.

The symbol reference in assembly code works in *.S as well as *.c.

The C reference will pull-in the debug info, but it will not work in *.S





--
Best Regards
Masahiro Yamada
