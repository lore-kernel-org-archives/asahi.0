Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7956E1AAE17
	for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722421135; cv=none; b=J9xq8kXGHeFQhmo0mlCdO1CZ4098GuZIQ1nmYKITz+kPBOhHzdtROrBaWpzg9Y4cJtz7sx6lND1kIteWhq5PHSSK7CGkureN5iez8nIUPxpKxR5t1COHzfqMBV1Rpm9oMh58+XpD0wMmeaVmKHGcHe09ZC7WygkQrQ4mHt8QU+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722421135; c=relaxed/simple;
	bh=EkOTvOnnll8O5y05XMa80C3KVe4Fh7qBLRV4CFzAfw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=liEbt2DrLu38odcEcIRMdJMKRQFrLxfdDqZn0Bgkh0qFvCo3hwi3kequ9WBVXBLngjXVkLYXy/tO32fSc4yagYmsRxyOC2FdWSmGAYymxzg7419UK00oHSGvz5+PvcQc7BYDqbXp66+FuL+j8DKgGnAP9VBGmaizTGjyZqbgAB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7d2a9a23d9so640448466b.3
        for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 03:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722421131; x=1723025931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnL6/nj6QvP3RhHvWpZGJriP7Wb5iQwYQPBn96pxO+E=;
        b=sg+Q+6k/1DcnfrBOJCQmx1Uy6ZJ7PL3bw0N+mUcWHM20J8/cZC3NptX3Xb1o+D1tsA
         QcRcEr7nfnrlcVaKVRTt5LaJ4AjfVZCQDB9RhfnWgrIGe7zbhuj9WjebxaA8cE1bTbNa
         RO5u7RtlYMOO9PYEPFIiD/HbrCzP6lOSVOf5YramsYkdCFwW3CCSD+wov4JtA25bVvO8
         wkIH+oUU8x3nmvAk/D1jPMiH0kNsibQPby/pw6yiyAs9a44KDBuYVQpiWGwYBu4zPHAz
         4u1zX1yxyUNmUuVqBdo38vu2O/5rSvkZGE1Z5Pl2XVM4VktgVFmOq8jAcnHReOXbZ+7L
         SvtA==
X-Forwarded-Encrypted: i=1; AJvYcCWhbkpEcL8x9TvFjIJ6+EBWv0LvemJAYgkdkltstoOhCKtv6f7WRr5c54mn7gLjHkWq0njPzL4QhZjHwvl7o8BR56setG4=
X-Gm-Message-State: AOJu0Yw0Kredq1RGMM50smUsgcLxGlWfHjUbL1KBFFEYbVIWvi3yBB3u
	/CjOEWGhNFv0RFlXy42+gCFKpEq9h8a9ZLiVx5D1vfy+luWQCGOGe+rdhRdr
X-Google-Smtp-Source: AGHT+IHj8dlbiIbG5ZhSgB1Pyj3f4htyzO6UUxX1BYPeRSfm9rqFIWKqeEI5l629Ua3F62GlyxEcug==
X-Received: by 2002:a17:907:3f1a:b0:a7d:a25b:31be with SMTP id a640c23a62f3a-a7da25b3d8dmr76852266b.39.1722421130917;
        Wed, 31 Jul 2024 03:18:50 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acab5359bsm750742566b.87.2024.07.31.03.18.50
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 03:18:50 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5b5b67d0024so929092a12.0
        for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 03:18:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzpTZBFusyb1Dw4XtsTIisduW5v6Ez/AMAFPNeCY3rhIHVmxQFJQg07jqcQCY1yKTE+QM7gQKX3FVMfIR4CzjqJm7sPgo=
X-Received: by 2002:a50:8e52:0:b0:5a1:bac7:f98a with SMTP id
 4fb4d7f45d1cf-5b020bc1395mr7347967a12.17.1722421130376; Wed, 31 Jul 2024
 03:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240731032030.2847151-1-neal@gompa.dev> <CANiq72nXN-pkHAG6A19JrjiL-uKpem_-8GN8RhiVgc+sKJN6wA@mail.gmail.com>
In-Reply-To: <CANiq72nXN-pkHAG6A19JrjiL-uKpem_-8GN8RhiVgc+sKJN6wA@mail.gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 31 Jul 2024 06:18:13 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_S8hAUg9Gdp7QAOxww2dvV4_OoCTV1pvxMNAAvVkQueQ@mail.gmail.com>
Message-ID: <CAEg-Je_S8hAUg9Gdp7QAOxww2dvV4_OoCTV1pvxMNAAvVkQueQ@mail.gmail.com>
Subject: Re: [PATCH] init/Kconfig: Only block on RANDSTRUCT for RUST
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 4:32=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jul 31, 2024 at 5:21=E2=80=AFAM Neal Gompa <neal@gompa.dev> wrote=
:
> >
> > When enabling Rust in the kernel, we only need to block on the
> > RANDSTRUCT feature and GCC plugin. The rest of the GCC plugins
> > are reasonably safe to enable.
>
> Yeah, only that one is what we had initially years ago, and then we
> went the easy route since anyway the mixed builds are best effort at
> the moment and GCC plugins could possibly be going away anyway.
>
> Did you test it with the other GCC plugins enabled etc.?
>

When I originally wrote this patch two years ago to get things
working, Fedora used all the GCC plugins, so I was trying to get GCC +
Rust to work while minimizing the delta on build differences. This was
the combination that worked. We've been carrying this patch in the
Asahi tree for a year now. And while Fedora does not currently have
GCC plugins enabled because it caused issues with some third-party
modules (I think it was the NVIDIA driver, but I'm not sure), it was
around long enough for me to know with some confidence that it was
fine this way.

> > +       depends on RANDSTRUCT_NONE
>
> Also, why is this changed?
>

This was mostly because I wanted it to be clearer. The negation didn't
exactly read to me the same way, but that hunk can be dropped if you want.





--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
