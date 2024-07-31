Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB21B3F09
	for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 12:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430355; cv=none; b=BEXD+eJx/XdEl8PYrkaioME9h8JGeTzo//sT1zWVYn41jyeuzYOU3bZGxWpPHZXaqoBSDFaUalWg6EztyF0B9tNlS7pCzbWLjv5JVL7HuFiikaMXoj7JnyVsIs/9E0BVAn+mpvwQoFFzpqU3E6NC8zug8rzFXnuINhoCHNTd03U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430355; c=relaxed/simple;
	bh=6COqeP6R/6UfPOjPmMiluGsDLj5UU/F63qiH5apWj6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndfmRCQuqPcepedyZdKt/gQoF0KetdPDtC0aNJSJ9A0JeKXV2JT9dBRwQBaa4H1TolBCVim/OhNIIVVD563hCFxCcthyRh4LYW/LZEM4pKdbJomr61RF9ql90L0K8tVfZNWjGw/qeYlFBNx9hGztDMzit8aGQlxa1ITpln6Pl6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so8591389a12.3
        for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 05:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722430351; x=1723035151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6COqeP6R/6UfPOjPmMiluGsDLj5UU/F63qiH5apWj6s=;
        b=uWVyUcWytusVsad13VaaKuowVgb5z+uDKOjPNLAmTK2ts4Ms5xE67rhZ95T8Xl6+8c
         AxRRZHAJC36JL0dlZpYIJVVlRVBDdXwyZVQDKwDt3f9xk4rFzAnO39o/5VR9IRqPsmiA
         YZraNe4dcR4Pa1uDWGoBHlkTbMkTMMiyRoVDmikfk6URa++yxRFDGez9hCbyv/KD+k4U
         HLftlK+CNjT/j09RHWdnazBb1WAeSlVgFx7QYI68hUwy15WXa4ojmpCjQYJXIZdK+/sH
         N+RBynUKYGGIvWUJhqyu2boE/aDDa3uj/u2D0nwzaSrISWQy5mIpL/3+7egsi54Dm8mi
         oXNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlN13jXfJg6aO0jynSydNBmceTf931Yd9suPgPSSZsm/gDupDet9RJXu+HTY0mNyKV+/mVgC+gVLYtizBOew1hFkGad/M=
X-Gm-Message-State: AOJu0YyPaoJ4/H0GKIsns2JDvug3/7u2VIEPbfFRDq95iUne5SVOO/4Y
	U1BS18RCcWU7Wqdw7I/8jOTsJNIQXoNYaf+0ugnEw/gXaAnhcEnt0gQSaMz6
X-Google-Smtp-Source: AGHT+IHxeesiDba/BINj6Njx1pwKkSF1g0+oAjyyLLfUvKxW69+RWi1SUu/HbdT7JYRl70TgAq5B3w==
X-Received: by 2002:a17:907:86a2:b0:a79:8318:288f with SMTP id a640c23a62f3a-a7d3ffb6a2cmr1042076566b.16.1722430350370;
        Wed, 31 Jul 2024 05:52:30 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad90251sm779517966b.143.2024.07.31.05.52.30
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 05:52:30 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so8591356a12.3
        for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 05:52:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXcCxxdz2JRNEMe4w39WxU/TN6nI6EflGL70OKBEDjX6l9IN4klxpgfVovjbag3KuQ2a55VPTH+qUcmfiAnH3YxldClqbQ=
X-Received: by 2002:a50:9b5d:0:b0:5a1:22d:b0ff with SMTP id
 4fb4d7f45d1cf-5b0225c61f4mr7998812a12.35.1722430349907; Wed, 31 Jul 2024
 05:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240731032030.2847151-1-neal@gompa.dev> <CANiq72nXN-pkHAG6A19JrjiL-uKpem_-8GN8RhiVgc+sKJN6wA@mail.gmail.com>
 <CAEg-Je_S8hAUg9Gdp7QAOxww2dvV4_OoCTV1pvxMNAAvVkQueQ@mail.gmail.com> <CANiq72mibFYOpQY4RxuJf1DQAdqnAsuLW2-24MnY=JpdSoXd5w@mail.gmail.com>
In-Reply-To: <CANiq72mibFYOpQY4RxuJf1DQAdqnAsuLW2-24MnY=JpdSoXd5w@mail.gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 31 Jul 2024 08:51:53 -0400
X-Gmail-Original-Message-ID: <CAEg-Je85yStrR4tQ4Dqih=fguT7-zO_9ZpY1RCTEzwHPnjDDxQ@mail.gmail.com>
Message-ID: <CAEg-Je85yStrR4tQ4Dqih=fguT7-zO_9ZpY1RCTEzwHPnjDDxQ@mail.gmail.com>
Subject: Re: [PATCH] init/Kconfig: Only block on RANDSTRUCT for RUST
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, asahi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 6:29=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Jul 31, 2024 at 12:18=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrot=
e:
> >
> > When I originally wrote this patch two years ago to get things
> > working, Fedora used all the GCC plugins, so I was trying to get GCC +
> > Rust to work while minimizing the delta on build differences. This was
> > the combination that worked. We've been carrying this patch in the
> > Asahi tree for a year now. And while Fedora does not currently have
>
> Just for clarity, when you say "carrying the patch for a year", does
> that mean Asahi used it with the other GCC plugins enabled?
>

Yes. When Fedora had it on, so did we.

> > GCC plugins enabled because it caused issues with some third-party
> > modules (I think it was the NVIDIA driver, but I'm not sure), it was
> > around long enough for me to know with some confidence that it was
> > fine this way.
>
> Same here: I am reading this as "yes, in Fedora we tested it for a
> while with the other GCC plugins enabled, although not recently".
>
> If so, that is great to know and we can relax things here.
>

Yup, that is exactly the case.

> > This was mostly because I wanted it to be clearer. The negation didn't
> > exactly read to me the same way, but that hunk can be dropped if you wa=
nt.
>
> I see, that is what I suspected, but I wanted to be sure I was not
> missing something.
>
> I am ambivalent on what reads best, to be honest, so I think I prefer
> to avoid the change if it is unneeded.
>

I'll send a v2 then.



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
