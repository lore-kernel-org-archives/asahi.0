Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23AD1CB9F0
	for <asahi@lists.linux.dev>; Wed, 16 Oct 2024 21:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729113745; cv=none; b=ALcxbG3XLy0wA39Z5jEgtehRUyBZCXe5ZR2SLXzeB/lCzBkHlAoapfnfeFgHARMt1b9BbI8CvEAZvgcl86FzkaLVlZAcwl7uHN56+wyPmOCQtdYndeyq7rnfNTl3Z0Ff8ygArpU8CLadjHWTBCuAL7dKU4/Kus3IwOAkc8PlypM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729113745; c=relaxed/simple;
	bh=OyDiTCgIIBa/GkRKvyHzzrkbUA9z+By1KG3O7d5eMiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrGPsqnki9FbfIPSC5vWXHX8ZXJso81kVqrfsCNrvNrWswogNnQmEWc3T4t8laRMci9BfR/RjI12qop96P5E9IzDA4gckrnqFVyinlYB3QikYaKtC4UU2ztjoGBuXsi2fni7HMFWou67u0wvAvjv02A6RPmdEtIbJCfjZRfFLs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k3uqQlpb; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k3uqQlpb"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4601a471aecso33941cf.1
        for <asahi@lists.linux.dev>; Wed, 16 Oct 2024 14:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729113742; x=1729718542; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wkZ4sufrMCkWvTY6u4q4CXshqu7FtbhJxCZflIH3KQ=;
        b=k3uqQlpbijYJGY0w++0734JUxM8DmmQSHG7srST5VE48NsqCtd2oMVZcAdWZprxxzC
         uTih8a6+exIeIreKZBqIEs3YYF+UxadU2BSR0A7ZUqg0GcONzGLXnSXZeUf3rBrtrnUa
         b8OQeUMP0q32zieh0ZhqwwCpIiTPmxbL8wnQXjSiOpVHr0bOQrwX8s54ayDDDskGrN2y
         ugIgG5D5YSweJU/IaG52Q+Llbyyfq7mcJasjnskuNkJywD8MHDaJGXJJ3jdc07EsPSxx
         fLJ7HT1g0eVj1LGCNgri5fXgwcpvbH+0gi9jFeQAVfoiOqBnbczXJqHmuv0Wda5Dt/4L
         oCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729113742; x=1729718542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wkZ4sufrMCkWvTY6u4q4CXshqu7FtbhJxCZflIH3KQ=;
        b=iv080Ua4XFltrxLGzUGwzqZHRiML3FZhUwuq8J4/EzHOljosT8a82b14MckEkdPg0T
         vfWIGMCEtmLufCqjxz6Y0NInCqw6kyz+q45Q1C6e3gOJZU7jo3pwcMEQfQTC3x6Ql483
         hLrNejK1D0fmP0cc/q+3rfJ8PR2VFdD5W4F46t7WlOoNjz8shpQXKmRmGSEVXZDH3KVM
         pc8A5rvdptcf4/iS5QVWlKr41D9xJdL1ZEw5jLXxtYwOVuSvjVw9CAVc40AYZ6CmsGZr
         UF/bT+2AWduocarcr0ZWwEGtLRMYE3oay5ZUGPs7vosUCS/knofmkStIZ21v7Soqq65N
         GgzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+4uxB4h3Qj3bHkarQ+LXYdZrezwzzQqhwzEOhWIruj3VQFr1d/mNQQ2O9gOi+9u7ZJLxJZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIxNFs+Z0hczG3sep9ZXr6jEEUS9WltLWyeUwa9469yAksbxIT
	wLIDqYMQUYQV/TpQ2nhofpg7YVk8kgQleNUWpWnXqPyKByGxDlynMx84wQtfSNatckjrK2mIiWh
	38qBSq2/MhuUjQOkDBQg8xAxh9X2x63WW4GlH
X-Google-Smtp-Source: AGHT+IErDmtBkSM4h9tKCOEanhS8tMEL2BUmPka/EOw8X38eJd4BfzXBdA4cVWCS8SklYFIBG5mDLRG4jlKSB1gVUX4=
X-Received: by 2002:a05:622a:5f08:b0:460:4a62:4ff3 with SMTP id
 d75a77b69052e-4609f6b45fdmr324641cf.23.1729113742418; Wed, 16 Oct 2024
 14:22:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-31-samitolvanen@google.com> <f60bf3b2-6e3a-4382-93d1-1eca521e4ebd@suse.com>
In-Reply-To: <f60bf3b2-6e3a-4382-93d1-1eca521e4ebd@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 16 Oct 2024 21:21:43 +0000
Message-ID: <CABCJKue-APgjaWf8pGnYVe3uSBjzApX0FpMUCAHsm56wNSyRVA@mail.gmail.com>
Subject: Re: [PATCH v4 10/19] gendwarfksyms: Limit structure expansion
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

On Wed, Oct 16, 2024 at 2:16=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 10/8/24 20:38, Sami Tolvanen wrote:
> >       /*
> > -      * These can be emitted for stand-elone assembly code, which mean=
s we
> > +      * These can be emitted for stand-alone assembly code, which mean=
s we
> >        * might run into them in vmlinux.o.
> >        */
> >       process(cache, "unspecified_type");
>
> Nit: This hunk should be folded into patch #9 ("gendwarfksyms: Expand
> structure types").

Oops, I'll fix this in the next version.

> The commit message and the comment in process_type() describe that each
> structure type should be expanded only once per symbol, but that doesn't
> seem to be the case?

Yup, it looks like I messed up the logic here. The ptr_depth check
should be later.

> If I follow correctly, the type_expand() logic on the output eventually
> performs only the first expansion for the CRC calculation. However, it
> looks this process_type() code should do the same, if only to be a bit
> faster. Or did I misunderstand anything how this should work?
>
> I played with the following (applies on the top of the series), which
> matches my understanding of what should happen:

This looks correct to me, and do I like the way you cleaned this up.
I'll apply this to v5. Thanks!

Sami
