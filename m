Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B03418B476
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 09:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526527; cv=none; b=MyArad5HahRxtm9jO/i71G8U6tzy1Ez1vFI41DMRCnueH23k6BLo6k7AC1fee/V4J3Gc7nQKgYguqV0/02MDkkGrh9TsU92sOeOrn31qfwjbFwQ2WXJgF9S+P/WKxGOgq43cE2f6nBmlAhM/5R/jMDEhG6E9nJOY22jK3Go4lzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526527; c=relaxed/simple;
	bh=FCYlpekwLX29y1babPtkl5hhwfzqAWLF9A3oe2+5id0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NlZlykeWxF14QFBIRpqoePFimmE0i6gNBEhuANHwuMGF10v7Bxb2VAUVktxfg0+GA50YmxSzWJQNtuzLk0tDwffNJXVEYP9M4atr8GWAsCu9IDrRXKdWvNR5S9woIEipYi+rH4HUyONY6lnSGEsJ4kGNHX/Sh42Xc/kkLR0n9Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BqOXoee4; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BqOXoee4"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so8221a12.0
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 01:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732526524; x=1733131324; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCYlpekwLX29y1babPtkl5hhwfzqAWLF9A3oe2+5id0=;
        b=BqOXoee4sLWJ0RlwTba3WZOALs8DNAlD7+osMlpBH4xkqmT3rL7skuufW6nnlhh0o1
         yKI5MS88zH5Zs22bhZoz3Q5tV3RJMD6ebLXI6JKteJYbrwgOubyTLm++orXDcTU4pYgg
         B9/+W2GXoVCsBwgUyX5YwlzZjuz55znuZhmNyg9ffl3266weRt7nbMODcDba3J807Lns
         BVglclwKmOlRn9Jr4qEKYZMoA9KMTbKUmCoFc7KDnqOIIeS/xRhifACR+MIjIGKjzthn
         GBL7yCUdQ8kv0iXNLgtfraLS1hZBmR2W3XRil4RKTS37jpOK0W+qiX2GSmt9RODuxBW/
         jFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732526524; x=1733131324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCYlpekwLX29y1babPtkl5hhwfzqAWLF9A3oe2+5id0=;
        b=q2BienRnXiWoqAKBvnlQZMFi2xvlb58HlEcDbG/1f/WuzwEoQxrKO+MpoUlyVBN4Dl
         S2n0wMx/Vm5+uiZ8i4tiQDxfhxrJhci6JQLK3RHQI7eJF8g4pqxCMOpWp5BFwwC3Pm+C
         wYJBbcyBjWQrg/GZ/+w5a9/KArufYSP8ZbGlNzOkZ5txZ4ADZCVoM4xoscw+22C+q+RW
         LqDRhUMi1d9t6t4x3y6aXKNI/boLdNcRrLacQc+Uo1odR5McW7mkxle+EzMzb7mncb+d
         6RPJZrF3i1KSpMBhyYtwhtRlCc3ydv0QrlcnuKIDI351aep4o5Y3LhGxRl6RDrMB3gS/
         MDUw==
X-Forwarded-Encrypted: i=1; AJvYcCXqU2cAVSTgnzI6ZB1Y7Vwlnn6e3oo6eTDqmLlv5uNupr/WoBB1YnzmrIhECccXklSo24RGzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWK3J8TKeFBBUUKoD8bXjEPRHUZ89/o2Ra5BqnvLF5omoo4naz
	VfDZQY0u4UVwxuDrerMsW+kBvebzFOtwDKuRKp7+U8N3llA2m4gwLujjY5tEZusPvnRHy5/ulq5
	SKtakeQ0lXWEMdzgwZxueTTqvcX5CsycCV42s
X-Gm-Gg: ASbGncvebgIz+E+nluCKsnAnsNEI/JsXaPjpafoXJL8p4ntTSMfiW4q/WNQqviL7l1z
	p4I8PFlpiNXaQyM1el/InEeyC+Wl3ib6E
X-Google-Smtp-Source: AGHT+IEyjVc+w4xYMWK45ReBVdh5zSSYk8/svaq/gH5CeUai6F225gz3gVyn1zbIlnkBPYmtw02u4vkN3IF6RImReBs=
X-Received: by 2002:a05:6402:1ca2:b0:5d0:3807:bcbd with SMTP id
 4fb4d7f45d1cf-5d03807bf0amr89021a12.6.1732526523672; Mon, 25 Nov 2024
 01:22:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com> <CA+icZUX-gf8624z8u+h-W8KeddCruYDng-4vTggNGwC61NzfNA@mail.gmail.com>
In-Reply-To: <CA+icZUX-gf8624z8u+h-W8KeddCruYDng-4vTggNGwC61NzfNA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 25 Nov 2024 11:21:26 +0200
Message-ID: <CABCJKufb7SLY3j7EqRwFkNbrp22moJ51rDJm8madpUQdOhV9kQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: sedat.dilek@gmail.com
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sedat,

On Fri, Nov 22, 2024 at 3:51=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> Thanks for the update, Sami.
>
> What are your plans to get this upstream?

Once everything has been reviewed, I'm suspect it would be up to
Masahiro to decide if he wants to pick this up.

> Is Linux 6.13 the new development base?
>
> Personally, I would like to see a Linux v6.12 LTS version offered.

This version is based on linux-kbuild/for-next, which at the time was
based on 6.12-rc6, I think. It should apply cleanly to 6.12.

> LTO is not supported - might be worth mentioning this in the
> documentation patch with some explanations?

Sure, it's probably worthwhile to add a note.

Sami
