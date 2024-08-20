Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9121C4623
	for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 18:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724179693; cv=none; b=QkROn/af9s0VwuLdWU9EhaGNpR50s5KuqSz61q4XAtWdmesY4vb6ukXP4bvox0mJsxsDVpLHnNibqSclfg0jPCtuVleIaQA7R7JC6x1LJjyG1P0PhQBla2ZRr6a2LZitAQqsr3iwc0UIPEcVpqu3rUQPB3eJnk/VV6a9+AH8e9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724179693; c=relaxed/simple;
	bh=9IntjtaXg9k+kUVEV9axZKmA4rC298YdyXwRG+HAIh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLoacnLKvKM52VQkNn+YBtq0pgmQPNrlrKAl927+ZRDzprauD9uPOHw9fhqJx/LuJB2NJpQQGyDS5g7LE3+0mXIhiBOlHt19Sq59In0CNLCnRK6IFhO0/X5TcoEUJXWYg4wGocPanP6auKyOAq8F2qmhG5yy6u12Cu7oGsvLqNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GUa8SifK; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GUa8SifK"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-45029af1408so31491cf.1
        for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724179690; x=1724784490; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kqyu9H3Z/7xJHVyMUShvAD4YuvpcJRXIyTBe+BDA0AQ=;
        b=GUa8SifKwOPRaCYG9cTQ31zHoKi//0PRBtb+TM0TCGyt/SUZllYNRLU6lBdsxIK46f
         tlEuw5TESkUYU41iPez79MW95seKboBbXoq+yzYoJvCb44JJx94+U6D4fl9kKkCxAvux
         06OOLFMS4OwND36ppOno6LPyNJF5NK86T9itjSLiK9qXp4EI2XLAkNwRqv6og93xapG1
         1Rj1LYp3sA2ncOLs54cM+FcHUm1ins/bpm37bnRQTBPA0OwLzmzSiZVdrP5+mUHpuuXG
         WZEcIbotCbCxVKi1MjBg0zjJJaFdBAZ3foNEJ8reVTpM8dg5B7kp23XFk10xJnKX7Eq4
         irnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724179690; x=1724784490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kqyu9H3Z/7xJHVyMUShvAD4YuvpcJRXIyTBe+BDA0AQ=;
        b=WALUYBshzh4EK5Ya9mRqRMxP8AlPuo7djbE4e5Pz4yRI4cJ2hTmxQIdY7kghlW7u2c
         eaqT1Yb0a00yo4ZWzsE7/Tew+ibm8x37UaIy++if8822VzsZLHxoc89jXEOcyGS9wj8D
         kSs2r2Dd8L5IYS+YKtea15rgJQ5rRvHdJlCvSL1Io9LFQrou+zdIe5yAWkgc0+R3JnF2
         7imwbuofYjm6sqRK+F/0kdLhxLRaZb52FWLVeNnHeztt03xbIvtpjJ4dT04gISBKeWor
         FTpMpAHusMpa7hqiZUjiQKMI03LhSEzQm0oewYFsLg4UeVK0AmJHY2z5/1cBIeYGNwWB
         yf7w==
X-Forwarded-Encrypted: i=1; AJvYcCUexK0SEHA2arV3MlNMAxhqkcUW5bw2axKtZkHJBGngUl7/hFNnijyKBYfX/RtyTV8YTe7Nnw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6ntUg3BHVKIo7SHXF3cqN1ShRLbeArdtY4cNG0XeeLlcidBgh
	4nq0RYkgQi2+PHk3/7xEZSo6PKe8osl/+tXiphoTop7SRSP96bpiqEK78xG1kwYFtsZaDLvs5RK
	v2qo+5+tCJ4wSO0BX60H9Nv1+SxMp5iyYtNWa
X-Google-Smtp-Source: AGHT+IEaaaVbWTiloHDIiXOmckXCXgvScfO2Sv9V70rY2jP8blHGtm/LE4cy6bWAnQvIHakKwQ31ZmSJ833RTPp+SXA=
X-Received: by 2002:ac8:7dc5:0:b0:447:d97f:9765 with SMTP id
 d75a77b69052e-454e642e2ccmr3218081cf.16.1724179690110; Tue, 20 Aug 2024
 11:48:10 -0700 (PDT)
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
In-Reply-To: <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 20 Aug 2024 18:47:31 +0000
Message-ID: <CABCJKudAF0=29js8SDcYY5r6kM7RBveTrZH9RyECNGqkcqy=nw@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Benno Lossin <benno.lossin@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 10:17=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> On 19.08.24 21:38, Sami Tolvanen wrote:
> >
> > This definitely looks cleaner than unions in Rust, but how would this
> > scheme be visible in DWARF? You might also need to expand the annotatio=
n
> > to allow replacing one reserved field with multiple smaller ones withou=
t
> > using structs.
>
> Hmm that's a good question, I have no idea how DWARF works. The way you
> do it in this patch is just by the name of the field, right?

Correct, it just looks at the name of the union fields.

> If Rust's DWARF output contains exact types names (I just checked this,
> I *think* that this is the case, but I have never used/seen DWARF
> before), we might be able to just create a `KAbiReserved<T, R>` type
> that you search for instead of the attribute. The usage would then be
> like this:
>
>     #[repr(C)]
>     pub struct Struct1 {
>         a: u64,
>         _reserved: KAbiReserved<(), u64>,
>     }
>
> And then when adding a new field, you would do this:
>
>     #[repr(C)]
>     pub struct Struct1 {
>         a: u64,
>         b: KAbiReserved<Struct2, u64>,
>     }
>
>     /* Struct2 as above */
>
> The way `KAbiReserved` is implemented is via a `union` (maybe a bit
> ironic, considering what I said in my other replies, but in this case,
> we would provide a safe abstraction over this `union`, thus avoiding
> exposing users of this type to `unsafe`):
>
>     #[repr(C)]
>     pub union KAbiReserved<T, R> {
>         value: T,
>         _reserved: R,
>     }

I like this approach even better, assuming any remaining issues with
ownership etc. can be sorted out. This would also look identical to
the C version in DWARF if you rename _reserved in the union to
__kabi_reserved. Of course, we can always change gendwarfksyms to
support a different scheme for Rust code if a better solution comes
along later.

Sami
