Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE3C2F509
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 10:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576881; cv=none; b=bTunhymYkOocp/zMjMFa8rMvXPpvuEC/T2SuiF6pevkvVqsYQ5HdajV9tkzf+XQnHFcxZK6pTPrw0fRoWhxM0JKTPaKlmIE81MnbqB8dfIy3hsBhMPVqXP5zO+qMR8Utmi3EMqaWHvbK8idPDtBWbzQzqTDHSUtmeS1IbWxd5zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576881; c=relaxed/simple;
	bh=kdua4+YQ85GykUIHsDe45i3nydQ0QIA06M4GK2rq+eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrY5+rSR2EYdu23hJzKHUIeOHJmsaeJUrw0Rgo3jJJxty716zHyLTzBJnbZoI8EZ96hmavJ0XNximzZuHRHzBnYFOAgQWpZtxsAAAyjZxg8MDGDTeDoeqH5m4Q8jwx8sfqvbd0rgy2KPSpRuVIgJMg8cD4keGidt1Tbv+mtXh7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=doEoJvpc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="doEoJvpc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2093849f8f.0
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 02:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738576877; x=1739181677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEGNgfB2S/8AjXy/uNgsGPvZS31C4zTjkg+WKJogdi8=;
        b=doEoJvpcpoAV2VAo/Rg27DzLOwYrBv+4gwOzFaEnhqY0fhUBLwIIa1UilyCXaXErLq
         R9E4VnGb9+C78pIiV/XF3JtGepHpvsFv/cPlXu/rLxMi/K21cIhOkx2iLxLnTq5+21/8
         juYLhJBkuSCWwnchXJNcly1Zkvu8+qbMIwR8VlpNXSoXVQWUbjM5KlRhRn7+iqajp3kw
         wKvs3Y/zCGgkaova6Twrc/83bPaD/N4I98SAUELMoiWabvXUtNx25/DpTPOXaJ80OpMW
         iErxLQR2L1ARu6GE8UGQTb6NWtcxpdYJfXnoWDK6zuYgxCH8++VIz+Ep/Py1unCJu8Yh
         q3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738576877; x=1739181677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEGNgfB2S/8AjXy/uNgsGPvZS31C4zTjkg+WKJogdi8=;
        b=uZ/XUDq4pSODequNMgdQw6l7ekW8AhGZtm6Ko3w2fzrsEI6VRWBzo1RT8YRBA+DgYR
         DiSJlp9pA33lfkL/upAN58BZzC8x/6APge5K5bA9lb8fqgDWufAfY8mLYUJXdziiHWYV
         bC1nVlPIYRFkwrykytG1U4N+Fz69F0udIfBvxa+iwPf/Jpy4Uxm73ffvQzvQg3sBMcQs
         2iJQouUcMvJmy1fdVtQieYQPcK6Rc5PyJbFUkAHhRNJLlzpOKg1Ot4EDi10GpXYNoFHJ
         9eC5vdbtCTbc7neMGCkRZ2sNF+GKpe3WyuReh48fakm4VGZSLh9p0ArYMCCG7Bbvi7k7
         KsuA==
X-Forwarded-Encrypted: i=1; AJvYcCV7EyncqCqkwTe3w6KgPXsl3lWXqcYU+DzFhM6uV/Mv0LnxEmMzMyCXKvVAAF3psluWnt4NRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmTJ22RXriPht5x+FO9Vjs/5vwAmfQtAf8dujPO+R+KzxOE+C8
	HZbRUpV17z7fPCmTBhIJxWQ6j1YBZzNFcACGYWwYqeDf9TVjAG8beejWtu1W3UdrjSYgIScIthu
	YBN9xmcRi+CXd8orVZZ5qJuMsseCg8OLFZJHv
X-Gm-Gg: ASbGnctfFT4yN7hB+uf3OayAgd/othEXSKchnuaDF9j0HQY+2oKNIVZ1V9cdRlwvgjU
	ZLWj1F40erCk9iSGBEtqQ/hnuDmzD24ZpUXmxoisy87Y2y6zNrn0uA4uWniTfEfeav008epW8vk
	eV/EAdLCwV4BGuwBEDO0imOGnA
X-Google-Smtp-Source: AGHT+IH3g2mPZEl5GlZ3WLWpDP89LKo0b2KChSH5cl3Q6a9dl/Hpn/AlGzitcM3Z4OiZyJKWLS+CB0K0XadAjdKQxbo=
X-Received: by 2002:a5d:6d02:0:b0:385:f092:e1a with SMTP id
 ffacd0b85a97d-38c5194c3b6mr16768265f8f.11.1738576877295; Mon, 03 Feb 2025
 02:01:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-5-e3170d7fe55e@asahilina.net> <87jza74amo.fsf@kloenk.dev>
In-Reply-To: <87jza74amo.fsf@kloenk.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 11:01:05 +0100
X-Gm-Features: AWEUYZndXPsUdFaaW3upqQnP0AEq9KZD2d2molkEULuOFcYuzceGr2VHgZKEEdM
Message-ID: <CAH5fLgh7gKRpT7wXzkqTwi0rwg+QyzAbqYzt12=85LqduC-oiA@mail.gmail.com>
Subject: Re: [PATCH 5/6] rust: page: Add physical address conversion functions
To: Fiona Behrens <me@kloenk.dev>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 10:54=E2=80=AFAM Fiona Behrens <me@kloenk.dev> wrote=
:
>
> Asahi Lina <lina@asahilina.net> writes:
>
> > Add methods to allow code using the Page type to obtain the physical
> > address of a page, convert to and from an (owned) physical address, and
> > borrow a Page from a physical address. Most of these operations are, as
> > you might expect, unsafe.
> >
> > These primitives are useful to implement page table structures in Rust,
> > and to implement arbitrary physical memory access (as needed to walk
> > arbitrary page tables and dereference through them). These mechanisms
> > are, of course, fraught with danger, and are only expected to be used
> > for core memory management code (in e.g. drivers with their own device
> > page table implementations) and for debug features such as crash dumps
> > of device memory.
> >
> > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > ---
> >  rust/helpers/page.c | 26 +++++++++++++++++++++
> >  rust/kernel/page.rs | 65 +++++++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  2 files changed, 91 insertions(+)
> >
> > diff --git a/rust/helpers/page.c b/rust/helpers/page.c
> > index b3f2b8fbf87fc9aa89cb1636736c52be16411301..1c3bd68818d77f7ce780632=
9b8f040a7d4205bb3 100644
> > --- a/rust/helpers/page.c
> > +++ b/rust/helpers/page.c
> > @@ -1,5 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >
> > +#include <linux/io.h>
> >  #include <linux/gfp.h>
> >  #include <linux/highmem.h>
> >
> > @@ -17,3 +18,28 @@ void rust_helper_kunmap_local(const void *addr)
> >  {
> >       kunmap_local(addr);
> >  }
> > +
> > +struct page *rust_helper_phys_to_page(phys_addr_t phys)
> > +{
> > +     return phys_to_page(phys);
> > +}
> > +
> > +phys_addr_t rust_helper_page_to_phys(struct page *page)
> > +{
> > +     return page_to_phys(page);
> > +}
> > +
> > +unsigned long rust_helper_phys_to_pfn(phys_addr_t phys)
> > +{
> > +     return __phys_to_pfn(phys);
> > +}
> > +
> > +struct page *rust_helper_pfn_to_page(unsigned long pfn)
> > +{
> > +     return pfn_to_page(pfn);
> > +}
> > +
> > +bool rust_helper_pfn_valid(unsigned long pfn)
> > +{
> > +     return pfn_valid(pfn);
> > +}
> > diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> > index fe5f879f9d1a86083fd55c682fad9d52466f79a2..67cd7006fa63ab5aed4c4de=
2be639ed8e1fbc2ba 100644
> > --- a/rust/kernel/page.rs
> > +++ b/rust/kernel/page.rs
> > @@ -3,6 +3,7 @@
> >  //! Kernel page allocation and management.
> >
> >  use crate::{
> > +    addr::*,
> >      alloc::{AllocError, Flags},
> >      bindings,
> >      error::code::*,
> > @@ -10,6 +11,7 @@
> >      types::{Opaque, Ownable, Owned},
> >      uaccess::UserSliceReader,
> >  };
> > +use core::mem::ManuallyDrop;
> >  use core::ptr::{self, NonNull};
> >
> >  /// A bitwise shift for the page size.
> > @@ -249,6 +251,69 @@ pub unsafe fn copy_from_user_slice_raw(
> >              reader.read_raw(unsafe { core::slice::from_raw_parts_mut(d=
st.cast(), len) })
> >          })
> >      }
> > +
> > +    /// Returns the physical address of this page.
> > +    pub fn phys(&self) -> PhysicalAddr {
>
> Rust  uses for similar references `as_*` so `as_phys`, would it make
> sense to use the same naming format here?

The as_ prefix is only used when returning a borrow, which is not the
case here. I think not having a prefix is correct in this case.

https://rust-lang.github.io/api-guidelines/naming.html#ad-hoc-conversions-f=
ollow-as_-to_-into_-conventions-c-conv

Alice
