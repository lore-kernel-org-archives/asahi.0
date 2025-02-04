Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3462139D1
	for <asahi@lists.linux.dev>; Tue,  4 Feb 2025 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680633; cv=none; b=pdzDdl08IYQQWrbeEzh2jLoS4FbTcQxNxJ7N8Hfb7qFhTTAy5/TWNi7v8wKebaGVGnu9Unp7a0prh+rrP9iAlUTitIUjqtASgGEQYMszUNHnnpnmZ/8+nuiNYKTpU0Ro8ObPb3kqngH7juFMaDnbujMvmdf23JQ6p7MnwEtyoLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680633; c=relaxed/simple;
	bh=PVDI10kSspSbKiqiR3cWmHfQUFuV+mJrrZh7MaBhxPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaeGwt4VViNoiCne2pg04rDcRb50yd72ymkLIx6Ft6Dmp/AJtRHGQGAmIBT/lvONNSfLEZKUKridPqc7yOGzz/+xYxWfnJhrViw7RmKFku1+w0dz5XoTzylZV1aTfV5nVPml+occ2aWN2WWbZvOpELXWx/VPKSR8UbZ7sdmCRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJ3i7B96; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJ3i7B96"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b9bc648736so548964385a.1
        for <asahi@lists.linux.dev>; Tue, 04 Feb 2025 06:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738680630; x=1739285430; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O93zUfmkQJ5yLGKvDRcJEjXroIe8dkmS2F1TSj1aIr0=;
        b=eJ3i7B96TOdmu2oGGPvKARkCVySSl069/0VrbpYCW1TM28VhjtpBj9525dHIIhP4Rz
         Ru2H5AuzJkn3As9Exc12Q0dlXyxjOAJZ9bzrR23plrWRKamRIq8G9TS/XUqyjkH2z2DN
         3oTuI0cghYRmHEr2pcWh2rmpOc2RqdZjdD1t9tPVnoMYEbQiBoOcirYRXpgzUBN/reLo
         y4F6uEvpW/C7itXm1LlheRMSy9QpSeOmIoj+HdNHnQwBHXVg7+73tGgu1MwcDgyhV1mu
         txtDnseUZzaO64gb83TLpvukhYchfpprKurEoYmWsux7vD5UARrIT3oUlwepVS+SSLFj
         2IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680630; x=1739285430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O93zUfmkQJ5yLGKvDRcJEjXroIe8dkmS2F1TSj1aIr0=;
        b=mm/jt6v9ivvPTZ2bFkyHkk+Hs6stRscoImR4QAEiiWhCdvt8rN4Sb905yupkCWd2Dz
         HpanU/IH76t96ZU1VoTLdO2Y8vfouYhRLUldEvjcGfb2bRK76RkOEs3kbDmGs41PgRB6
         46nzTpw6fg4IF+SdpenWQYcYP6lqOYv/CyE0pB1UczDWRRKQKwgjCQ9dGDAS+20n2yIz
         tgXcLm1mTzK6YoMmOpAU/iFsm5IpigtXscR50ubwAA0gtJlBz7OZHULF6s5HVOjFS6Qf
         eBsq3jUNyPMz1doJn3h+wQSVu/Nkvg62DBi7CcKbjWOyqU/EN2De2mc4vIV0hu0D7HJ/
         TgBA==
X-Forwarded-Encrypted: i=1; AJvYcCVnZLuralRS3WCUMM3T+23Ilifnb4dha25ENr03Yb5curIk5K4ZIK7h+Miw1kNdC/BD1Q5Byw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLQJ0iluZQZSiMONY1PNIW3wGvbTeNxD74xoZX90tmaNFTLiad
	Etq3jPhER3xuyiT3h/zRH6u96cPkJq6LnQ5J3Ikc39I3coToxWTL
X-Gm-Gg: ASbGncvmvxvqYOYag4UyU+1bXQ3J2PRMZ5R8sic5YUCPeNt+VlxJ/HeF1bEiI1l1AaG
	pPRLouGoH75ETsJ9VZ1IZmteIGEPoyH5xCZ9VtqcF67Zhz2ygwc7MO5z3/B67Jumn/U7wbwE630
	2ZFX/nRs/kjd8QQ23y8OELnmUGWEnQ9/TTn5BwjvfrO/II6nB+dhqgkc/2Q33a0soQMPEQI9FFp
	zzQH6ir4Rr47VtT978Of0U+jDREYIB7TATFWiydxOFGZrUrPKhrwng8WbYv5MpVIkPbnGWbGTw3
	30lnBXb7yfzWo6OHh2eRvpufpj4BNnKOwLkJxfePiVZ2CNeG0a0e4L0BNRqhDF4s+E8jUPb03Bg
	VarfJaw==
X-Google-Smtp-Source: AGHT+IH0tfWWAkUUISaVsW7R9y0WycKwDyOEfJRx4RoIqxcqcAbwE9Cp+b3y3nIulRFvqaZhMXeL8Q==
X-Received: by 2002:a05:6214:2305:b0:6dc:d101:2bb2 with SMTP id 6a1803df08f44-6e243a86cd0mr372471186d6.0.1738680630220;
        Tue, 04 Feb 2025 06:50:30 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2548196ffsm62572346d6.44.2025.02.04.06.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:50:29 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id EA5CF1200068;
	Tue,  4 Feb 2025 09:50:28 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 04 Feb 2025 09:50:28 -0500
X-ME-Sender: <xms:NCmiZ7BaXbSavOjU4Nn1_N-AyNHAAdOU4uEomT1DDbEYlbArrMU0dw>
    <xme:NCmiZxjZby0UjbmwsFTVBgfeMvxC0NutCutLbtam7psCcN_YS46aHGpNrskYscJ2n
    oaB5JOBOmcRmNfVpQ>
X-ME-Received: <xmr:NCmiZ2lXK7-eofJMRYN5D7a0pbJpEmcy8Cfdd33D73bJMZ_kA8mqZuRNHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvfedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhgrsegrshgrhhhilhhinhgrrdhnvg
    htpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghl
    vgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrh
    ihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghi
    lhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvg
    dprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhroh
    hsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:NCmiZ9z5qz1n5fm3agtBtZCTy6bzQYcxUw-R3aMLwK8QDODXxt9zdw>
    <xmx:NCmiZwTPyB9mI1Jgy7P5G0FEDVWaYa3QS-fO-i5zVUx0DJmSzsx-Ew>
    <xmx:NCmiZwZZFMOdWFPGGnX1-WUQtro0fi2Xp7J2XtrAAVjK_IKv9_GuVg>
    <xmx:NCmiZxTdyg8CcUym1qvO-hPjzOg9BhIcZS5kzV2xQCPvp52NSbVZEw>
    <xmx:NCmiZ2DmICtOZUqHTnCejbMw4BgPVUSqjDKyo3QR7wFn_9ME9sTSdfrY>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Feb 2025 09:50:28 -0500 (EST)
Date: Tue, 4 Feb 2025 06:50:27 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 4/6] rust: addr: Add a module to declare core address
 types
Message-ID: <Z6IpM1zuR7-iThua@Mac.home>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
 <Z6Da4XV5hcTfBiNH@tardis.local>
 <8f098064-d2d5-4a02-8306-0a3d31557bab@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f098064-d2d5-4a02-8306-0a3d31557bab@asahilina.net>

On Tue, Feb 04, 2025 at 08:50:17PM +0900, Asahi Lina wrote:
> 
> 
> On 2/4/25 12:04 AM, Boqun Feng wrote:
> > On Sun, Feb 02, 2025 at 10:05:46PM +0900, Asahi Lina wrote:
> >> Encapsulates the core physical/DMA address types, so they can be used by
> >> Rust abstractions.
> >>
> >> Signed-off-by: Asahi Lina <lina@asahilina.net>
> >> ---
> >>  rust/kernel/addr.rs | 15 +++++++++++++++
> >>  rust/kernel/lib.rs  |  1 +
> >>  2 files changed, 16 insertions(+)
> >>
> >> diff --git a/rust/kernel/addr.rs b/rust/kernel/addr.rs
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..06aff10a0332355597060c5518d7fd6e114cf630
> >> --- /dev/null
> >> +++ b/rust/kernel/addr.rs
> >> @@ -0,0 +1,15 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +//! Kernel core address types.
> >> +
> >> +use bindings;
> >> +use core::ffi;
> > 
> > I think we should use crate::ffi here. See:
> > 
> > 	d072acda4862 "rust: use custom FFI integer types"
> > 
> >> +
> >> +/// A physical memory address (which may be wider than the CPU pointer size)
> >> +pub type PhysicalAddr = bindings::phys_addr_t;
> >> +/// A DMA memory address (which may be narrower than `PhysicalAddr` on some systems)
> >> +pub type DmaAddr = bindings::dma_addr_t;
> >> +/// A physical resource size, typically the same width as `PhysicalAddr`
> >> +pub type ResourceSize = bindings::resource_size_t;
> >> +/// A raw page frame number, not to be confused with the C `pfn_t` which also encodes flags.
> >> +pub type Pfn = ffi::c_ulong;
> >> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> >> index e1065a7551a39e68d6379031d80d4be336e652a3..eb1a80ba8ff83ab2d1b3b1d11fed4fb704c7a4f5 100644
> >> --- a/rust/kernel/lib.rs
> >> +++ b/rust/kernel/lib.rs
> >> @@ -29,6 +29,7 @@
> >>  
> >>  pub use ffi;
> >>  
> >> +pub mod addr;
> > 
> > I want to share my worry on this `pub mod` list in kernel/lib.rs may get
> > too long ;-)
> > 
> > I was about to suggest putting `addr` and `page` into `mm` after Alice's
> > patchset merged, however, seems that `mm` mod only cover userspace
> > memory management (which is not my impression of what "mm" in kernel
> > development), thoughts? Alice, do you think we should extend `mm` mod to
> > contain all memory management mods?
> 
> I think in kernel-speak "mm" is usually userspace memory management and
> kernel page allocation and memory management, but doesn't include device
> stuff (I/O ranges, DMA, etc.) or the low-level concepts of memory in an
> architecture. The types I declare here are more relevant to device/arch
> code, so I don't think they really belong under "mm", it's more general
> (mm deals with them and so do other parts of the kernel code).
> 

Make sense.

> On the other hand, I think page.rs itself would fit under mm, since it
> deals with the kernel mm's idea of pages and their allocation.
> 

Agreed. Probably some follow-up work after Alice's mm work merged.

Regards,
Boqun

> > 
> > Regards,
> > Boqun
> > 
> >>  pub mod alloc;
> >>  #[cfg(CONFIG_BLOCK)]
> >>  pub mod block;
> >>
> >> -- 
> >> 2.47.1
> >>
> > 
> 
> ~~ Lina
> 
