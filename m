Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E0D1CCEDA
	for <asahi@lists.linux.dev>; Tue,  1 Oct 2024 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727817687; cv=none; b=MwHMXH+/gPpi/LMhzDrk/UDRTuKfNeMKDm8nOsnOhlzIF3NRpGVZI1Pgeq1m8i0jqbg1jLpeF3t5Bjbz2o0xe003b7ay9YUoV61GNM3jeEjkIcV+9lF1FJwUa2CXjb3sUh6AZginsm59/V07YzR//0Ihsme6Kd/aX+Y1WWo8WlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727817687; c=relaxed/simple;
	bh=EQjfFUP6V15WHbsMfHvl8IITEfL2R5znZ0//S7cqib4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLUKQO/khr/8tJFJUNz9R2MWO/Hn7wi0NVR4GhTetiVXPJQ4e/4sNz9xQ/abTBhzIq9W9LPhECBPUi0EDusQTEAVPAIsfYi3drWKnXTmCbOXP2MiCg49QX6FMC109IrqVreCZCFeVrzE2xpsFhA1sA4F23jth/xSOcjNuvpgqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HjqOI1lw; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HjqOI1lw"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5398c2e4118so8166e87.0
        for <asahi@lists.linux.dev>; Tue, 01 Oct 2024 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727817683; x=1728422483; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoWrsU7z+qdIIFDpkMHhN4PhrREusH4jkiAl/mJtNdI=;
        b=HjqOI1lwDEGQKTKsdfX1EVD1sa2GR4F55kyaA7MtNdeHkNCUtQZoftKXfjZZaZ56kL
         SQLiOfdLj1E9/Ed8XzzxFFp44svpkgCJRz8MC2E04xHO6wggUSiwrcXDRElK/Z2+Ir4y
         4oCNizYyCGVrcxrJx/NiIB2+/ZewkPcawmgqvTCQBHh8kAKKs9w3hQUsMMTzOvVYd2fN
         KOb/uAxtipxCxeB8C2ptAVD1pq1N9H2ycUnHreF2yEFCyRpsTzaQGlZOL3pcSZwjLpFw
         qIbguE38fyKQQv+Ad3FrkmkEOy/7i6yAKFVXtAIcaNwiJtcD/vYgXWnE27yK/4ZCJRn6
         JPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727817683; x=1728422483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoWrsU7z+qdIIFDpkMHhN4PhrREusH4jkiAl/mJtNdI=;
        b=f3nxDb9XSM9twb0Pr7IxBh7uyUaMNfuyngQWWpb1K7dSMZMdeUYBq0VvUSog/BDyYf
         7fzZ17P4aHehUFhtERDMPoYZv0ohWPd+g15Ew+TA0jOFnZVZu76e1IedQcKQCBkDQBWI
         WULCO15JLaMPJyBgAQUc09ebL2MfnJTBThPsNGGqh//f/Xu9BvjZv8Kg9l7T01LssCTh
         EddMzEuGGygg1imq+40ltghu7J8YLPDnqoZ85oUFmYnKTsSeGYhJryCMtwk+Sh+6tPLt
         e3Nk1TgPyAFT9C4K7ewb37qXYpGmBUo/Sliydi9mIVIttDOoDx8RsDU/B/ni+1ULbpjL
         YRCg==
X-Forwarded-Encrypted: i=1; AJvYcCW6gUsw89uweAL29GnbjAmBjYzQpv8x6cHXdy5xiMcaf48JrAP1aYW1/nLJ3aqKyD96OeseMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyjorzw0gEtRMOQt2TyLiTPB8S40b6Omhdmv7l4y2GlglKNODBH
	lPZ76A53TKAI7fL4wOAT3qv0gMvlk1PtslBj9PkSKZV/mFU4rtT6JjNEvVJ+4gq+4wNoMdzPBmh
	mltwNFxdrW/dhMXq9aM9qXahD9hGJv0BAXA5B
X-Google-Smtp-Source: AGHT+IGgP22tnj35LCYM0fX1Dz0p+NCTjOYdsvD+bPVZjH0BMXExjm00WWuhd0WmAK7axQvJ/g54h5N5+4LKt45smrY=
X-Received: by 2002:a05:6512:239c:b0:539:9ff9:5cbe with SMTP id
 2adb3069b0e04-539a0f0695cmr152225e87.4.1727817683249; Tue, 01 Oct 2024
 14:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-32-samitolvanen@google.com> <f0eee8a9-766a-463c-bc36-676e49efe950@suse.com>
In-Reply-To: <f0eee8a9-766a-463c-bc36-676e49efe950@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Oct 2024 21:20:41 +0000
Message-ID: <CABCJKudn0WcOAg89ouTQoEHQC5n90SdetxHYG7GvQWmWo6WQ5A@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] gendwarfksyms: Expand structure types
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 2:16=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 9/23/24 20:18, Sami Tolvanen wrote:
> > +static void process_variant_type(struct state *state, struct die *cach=
e,
> > +                              Dwarf_Die *die)
> > +{
> > +     process_list_comma(state, cache);
> > +     process(cache, "variant {");
> > +     process_linebreak(cache, 1);
> > +     check(process_die_container(state, cache, die, process_type,
> > +                                 match_member_type));
> > +     process_linebreak(cache, -1);
> > +     process(cache, "}");
> > +}
> > +
> > +static void process_variant_part_type(struct state *state, struct die =
*cache,
> > +                                   Dwarf_Die *die)
> > +{
> > +     process_list_comma(state, cache);
> > +     process(cache, "variant_part {");
> > +     process_linebreak(cache, 1);
> > +     check(process_die_container(state, cache, die, process_type,
> > +                                 match_variant_type));
> > +     process_linebreak(cache, -1);
> > +     process(cache, "}");
> > +}
>
> For variant types, should the tool worry also about DW_AT_discr and
> DW_AT_discr_value?

Hmm, I initially thought they were not necessary, but looking at the
rustc DWARF output a bit more closely, it might actually be a good
idea to include this information. I'll add these both, although since
DW_AT_discr just points to a member DIE, it's probably enough to just
process all child DIEs for the variant_part instead of limiting
ourselves to variants only.

> > +static void process_unspecified_type(struct state *state, struct die *=
cache,
> > +                                  Dwarf_Die *die)
> > +{
> > +     /*
> > +      * These can be emitted for stand-elone assembly code, which mean=
s we
> > +      * might run into them in vmlinux.o.
> > +      */
>
> Nit: stand-elone -> stand-alone.

Oops, I'll fix this too. Thanks!

Sami
