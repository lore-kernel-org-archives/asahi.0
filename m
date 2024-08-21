Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2672176ADA
	for <asahi@lists.linux.dev>; Wed, 21 Aug 2024 23:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724281307; cv=none; b=fvbuQ73hSfy/7DGqfu+B1xffpz0Fr/8nt0fd3t3NqlfE6w+17NRloEWYLHPsR1jKwqR9Kp7l4Mp+F6D7XnpOTgmlfzGydKLaKJ6+9RQxPWfBC4xVTwPhFxEA62j4mgUuLLEN/PxdNl5q82BFSgOKOVrmNUMgeg0yM3SxWf4MXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724281307; c=relaxed/simple;
	bh=aWbQKsoO/3O0Lnp0a6MfXVSMRVMVZaRxC4kpSF7nsAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElBnFA+Mv1403bvdKi+J+4SzSCvVC0RWTCqimI14boAyA5y3BWiHcMMnNaArSTIN+vEYTcD40u5cyDOjt+t6+IAAckh3+ffIRm/DVj8zA4/KA8yPzSzLZ61NCxgFhPLr1teIuRSZ0wzk2gw0s54+IZcxhhJQ5uUP3XsXzCFVysg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wg1TBH7V; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wg1TBH7V"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-45029af1408so57471cf.1
        for <asahi@lists.linux.dev>; Wed, 21 Aug 2024 16:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724281305; x=1724886105; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYqlc+O3M1PAGsmUtdwrYwO0p9/AGmcfM5YGYrhFe/U=;
        b=Wg1TBH7VjGwl0o9EwnKTmISCfHt2phU1WUYb3EG1hhAY1jWsSn/g5jj1Lt7sPQACZ1
         e+9w6oEgygSb2eQE/hjjTuX74mwZeG2Ppk+Nm3HXsb1ECkSOawrETKK6gGJMki++pW6W
         DX389g3TGa11YwHCsG9UGFu0vZJoUoS0BAIPS0bzzd8w/Mpkc003D8iafuMaH62W+1KQ
         RVwZBETJQvzmWYRkx2yXTaCyDw5joGDfPIIWVRslQdpwXBHmwwgv/nTM8bZnJ/Id0mGI
         FwpdKgyJidE3WatnRub+7EZi2hm1F1eZ/gqF3dO36dn2oZaZA6F0odIuJDQVlibVNNpN
         FeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724281305; x=1724886105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYqlc+O3M1PAGsmUtdwrYwO0p9/AGmcfM5YGYrhFe/U=;
        b=euC/ZcVfzZ+IOoZa11Dd5TD1+iIIFBB4VDoAUkC6l7pj9kgCmpkFZAbgVqUYnFyBaW
         lnVXOAK5XQoAhriXbge+xJxvxlO1VvxsuT7rZTL46zre9isd1G9fwYLUlcLk+C443AYT
         YOASZCxVvl8X+hxBeoPPyuJV8t9XsrKS/AXUUJ5lYOjcEvhxml+xtlGtLKEmGPbWTboy
         xIF7Bwy9oxqCGooHOpJWhJz9sHciPwvYPDPEqcL6/A0MTygy1s17qsApxklUkf+Lemf5
         ofY1nqTlM737HVcKMAXpGqNJBKjKgXJiTdi5AOmmmj6Jwgi6qoZGc51SV/cEg4R1wOlL
         I+Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVVfo7Ra4Q/p4lV/q86nhxR9Qj4v0ZbATOD++k8o5GYTBZCC/8WbKyfhkB/FdK8Utj+EQM2ZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg6ioDOCDbCm6o/AYmcmsk7HjgFWRv9jt+0Ze1h/Yp+yEr1PaE
	5j6J74AybBh8iEv2h/qqU187pm4mKciGcSdvpEFCsnPX8YSibApi4F4sABkYtx0FOP0k1t/3TdR
	k7RfZcVAenZcbVFCD/mTVy9q2PlaKk+Lt2LpD
X-Google-Smtp-Source: AGHT+IHr6GY8qz9jDAmwr42+hMsnH5B+DA3xc3h3v+2emTPxckOukoEGDbPDha957SRPhSwjOBNcOQFJ2vjqfFpTJfg=
X-Received: by 2002:ac8:5708:0:b0:450:47a5:2203 with SMTP id
 d75a77b69052e-454fd778a28mr587521cf.11.1724281304543; Wed, 21 Aug 2024
 16:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com> <2024081600-grub-deskwork-4bae@gregkh>
 <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com>
 <2024081705-overarch-deceptive-6689@gregkh> <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me>
 <20240819193851.GA4809@google.com> <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me>
 <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com>
 <CAGSQo01kCUd64nB7C7Ssy1N=UBpOP3bORsRDcHJ1k2CqkbKsfQ@mail.gmail.com> <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me>
In-Reply-To: <c6c1e84a-40f3-41a5-a732-f1cf06521691@proton.me>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 21 Aug 2024 16:01:08 -0700
Message-ID: <CABCJKudN7vGB1gfGDuEArdkH9DL4iPFw3DXMPrX1ZLzPRp8+3w@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Benno Lossin <benno.lossin@proton.me>
Cc: Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 4:31=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 20.08.24 22:03, Matthew Maurer wrote:
> >>> The way `KAbiReserved` is implemented is via a `union` (maybe a bit
> >>> ironic, considering what I said in my other replies, but in this case=
,
> >>> we would provide a safe abstraction over this `union`, thus avoiding
> >>> exposing users of this type to `unsafe`):
> >>>
> >>>     #[repr(C)]
> >>>     pub union KAbiReserved<T, R> {
> >>>         value: T,
> >>>         _reserved: R,
> >>>     }
> >>
> >> I like this approach even better, assuming any remaining issues with
> >> ownership etc. can be sorted out. This would also look identical to
> >> the C version in DWARF if you rename _reserved in the union to
> >> __kabi_reserved. Of course, we can always change gendwarfksyms to
> >> support a different scheme for Rust code if a better solution comes
> >> along later.
>
> Yeah sure, that should also then work directly with this patch, right?

Yes, this would work without changes.

Sami
