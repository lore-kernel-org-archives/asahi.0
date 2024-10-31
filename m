Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A53E1411C8
	for <asahi@lists.linux.dev>; Thu, 31 Oct 2024 06:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730355548; cv=none; b=qkDYjWQKqFjaBfwuGxOgQKsl+zuR33sE+VFtLeymLNNHClToNinJysWytd1KCLbE9mGlZN6bm9WJ0uiDS2bLWCzWHV+Z7GS47zNYR3kjEdskXGu5ysCVy2cdzFFJhSzNDIA8TsfOLYuCYylth6CrmWTBwulsLrQwgsgZKc0dsa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730355548; c=relaxed/simple;
	bh=FgqlLLAyzeN6qKHTbENOOOMEU83x4D0XmiB1bxocEr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQqUGEbu+XTMzqeusmrEbfOJZa3s7A+4sL4VEeyulKo6LP/vVcrh5ZXF7K2+n8mi8KWt2eOK3rw6cM8r3zm+P2TZYrsm1hnMvUVyNoMvgHq+oGqWPgwvk/ppC1PD2+4EDXDNU7DjPI3iPAnSW72k6B9R6ztWIbRmdXVGpB4vq3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBkFMnaj; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBkFMnaj"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso8006411fa.3
        for <asahi@lists.linux.dev>; Wed, 30 Oct 2024 23:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730355544; x=1730960344; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FgqlLLAyzeN6qKHTbENOOOMEU83x4D0XmiB1bxocEr8=;
        b=KBkFMnajom3ePSKoiyLMwRcOND/X0i10SVibJhyBKVpJLJwFEyLOfMpykPguZZks/q
         MuJIuNJ5f1Mut9sxaU27bMHE7jgQ+DCopeZAQZ5ff0g7c0+4UrlCJnpE4uv5F6ZZnhDb
         /EGJZl0RMtmcQOjeXoZYfn4uIS0ycDyLzJkHKdJ2WnJQJoDqx6D6wbR7Qkghk2Zx54iZ
         P/iiAiFwM54N87Bfg1iJUJEVU0MUTaGnOa+CfmR82yEn450mWqkcSGgkxfdc8gN22MiU
         hGZ98sldB0vILFsM3n5lMF8moBqE5PjpAQiR1TWap842sfLkQCOi2lT6HkZ2hBuQmQhz
         9ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730355544; x=1730960344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FgqlLLAyzeN6qKHTbENOOOMEU83x4D0XmiB1bxocEr8=;
        b=Gkqdu7rBuIujbh1GCANN2KdPdfs7AQxOV+qTPtj9BMXK3niJMQ8augZZVhMT2F23xY
         j1MtqB7noqu+o9ODrXt4f6smyvw5b8YPubTiQIhwQ6HAkZmFrQTM5QLmklP9VMPrnOjA
         ArjFYx9cqzoRRsMTFbPz3WtWzKoyBd0aN682wXBeADsIQOR+HKH1ZDZhovpkLoCTWXBm
         SyvvdaV2L6jgleaM9mRVlsivgVc8gGy88VCPgUscQFq2YCZT4KlhasfvqknMwviv1HW1
         msEhwZUkfnwFCndIrLl4fi0R905FOgv8MuK9NYjXuWNL+niQHKGD82gps5JVgwoI9Uv8
         zAGA==
X-Forwarded-Encrypted: i=1; AJvYcCWrGR4OoosFGRLzigbGOzrsLkEwHyjDS2azH1v5v1oQyQfpya6TgAm2IvqAS1wvRTWBI8Fi3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBAQ3AT4qBruiSiRB13kUou7pckj0mPP/DuH4i+zS2m4rNw1Ir
	u7AnBN/5brNL76HrjLTz80iB+7JjR0VoD5WhXJNxpE4PakqWPgsRo4gZ/0OfMdKBHxeNX2eLXs3
	FA7IzBk50TWsaJb2uNM+nMhN5SJI=
X-Google-Smtp-Source: AGHT+IFHxxJrlKSrgAAFWAELVctspErXwBbZUkqdQIAVIWmjs2xYQmxqsiV/CAi8amXUPGmri9GG+BeSf/deG9l51jo=
X-Received: by 2002:a2e:bc15:0:b0:2fa:c5d9:105b with SMTP id
 38308e7fff4ca-2fcbdf61167mr145428871fa.2.1730355544208; Wed, 30 Oct 2024
 23:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <CA+icZUWTdgM7HQrnR_NzgZZQE3aXXk+tAqD3srNd1Eyjr5d7EA@mail.gmail.com>
 <CABCJKuepGSFcQa0F5iO4aa4V2UbhuKO+tyfhB3_ODaTGs3sM5Q@mail.gmail.com> <CA+icZUXdMGk5uTZ_as0UOw-zmZuxTXc6J3U2_He00UOca86Gig@mail.gmail.com>
In-Reply-To: <CA+icZUXdMGk5uTZ_as0UOw-zmZuxTXc6J3U2_He00UOca86Gig@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 31 Oct 2024 07:18:28 +0100
Message-ID: <CA+icZUWRqBgqS0TpJsUumZRJMc=XRQJ=NMUj=O_WS9o2dCiBsw@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
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

On Thu, Oct 31, 2024 at 2:56=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>
> On Wed, Oct 30, 2024 at 10:14=E2=80=AFPM Sami Tolvanen <samitolvanen@goog=
le.com> wrote:
> >
> > Hi Sedat,
> >
> > On Wed, Oct 30, 2024 at 2:00=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.=
com> wrote:
> > >
> > > Hi Sami,
> > >
> > > perfect timing: Nathan uploaded SLIM LLVM toolchain v19.1.3
> > >
> > > KBUILD_GENDWARFKSYMS_STABLE is to be set manually?
> > > What value is recommended?
> >
> > The usage is similar to KBUILD_SYMTYPES, you can just set
> > KBUILD_GENDWARFKSYMS_STABLE=3D1 to use --stable when calculating
> > versions. However, it's not normally necessary to set this flag at all
> > when building your own kernel, it's mostly for distributions.
> >
> > Sami
>
> OK, thanks.
>
> # cat /proc/version
> Linux version 6.12.0-rc5-1-amd64-clang19-kcfi
> (sedat.dilek@gmail.com@iniza) (ClangBuiltLinux clang version 19.1.3
> (https://github.com/llvm/llvm-project.git
> ab51eccf88f5321e7c60591c5546b254b6afab99), ClangBuiltLinux LLD 19.1.3
> (https://github.com/llvm/llvm-project.git
> ab51eccf88f5321e7c60591c5546b254b6afab99)) #1~trixie+dileks SMP
> PREEMPT_DYNAMIC 2024-10-30
>
> Tested-by: Sedat Dilek <sedat,dilek@gmail.com> # LLVM/Clang v19.1.3 on x8=
6-64
>

Fix email-address in credit tag:

Tested-by: Sedat Dilek <sedat.dilek@gmail.com> # LLVM/Clang v19.1.3 on x86-=
64

-sed@-
