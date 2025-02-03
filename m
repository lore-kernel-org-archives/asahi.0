Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EA1208962
	for <asahi@lists.linux.dev>; Mon,  3 Feb 2025 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595047; cv=none; b=hgFhAMS+blRgNaeAJ+5hAga3xFIWRpxYva+jZc/rh6H56geMMr4Dz/MhgtsK+rP/WCY600QbmaAOR5uf1VNfbayc0/bl1/xvX7QgrQTy0RjqO7Nsv03uqWM+3a6NPDZkEQjEAScmsHEksNNelsAW6+on7j/DOdvfVqP06F6P984=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595047; c=relaxed/simple;
	bh=I0hGYVr+iXwhCvfG2kaXgx9DaPhR3rGJTXJPlr0Jpwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRoVqyXExbM3PcQhjaaRQ+SsYO1I+82JwLEUE+cLENBYPA7uhr7PuB6M2EuRygbJt5TVhx3S26oQV+vmPJ0qTiGFVoTG4aqpzOkCeZg70+MUqq0Xx6MnJKWbUvcMmTakVwnn2904uDNbMfDywtNtxDJv2loeMh6nJcLFYW13YZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKzbN0fI; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKzbN0fI"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6e9586b82so400262885a.1
        for <asahi@lists.linux.dev>; Mon, 03 Feb 2025 07:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738595044; x=1739199844; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfs45TBGa9cOMjq+1YHkVGnJDn3Ark/UOv4RQa6undA=;
        b=JKzbN0fIt5gqF4sDcO/NeWpl9+CDYYDaik8NlS3efsSuDXgyLhzd46axifb0LaQKex
         /Q77UsTREJZAbnxmXOcmvfU7i6fZo+1rwIg5YLwEdtAhuDElbu234nnHGTzx4fQoEBA/
         jLuXfGvU5yD1tFm6jIkH8oGDobOZ2v07Orf6xRmtZHldpe9vk8rm0f8rafU5biAAJL09
         U+TiMJgjBXw/kPkk1s1y5ps1vLgEbPxlgvpeS2y0vtQHPkM0D4oCs5gdY934t/m6frQ5
         audT+gSyGmj4JgWxsPn07XYBmH6cTYTnt1WcaMG7h3NakeSmuDRKgUDNAWMM+kDxO/d8
         QjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738595044; x=1739199844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfs45TBGa9cOMjq+1YHkVGnJDn3Ark/UOv4RQa6undA=;
        b=vpZULhmCHSlLnehdJKSHzv1fFdD3FhaNdywZCYvVKgKJyGsf3rO8jr/Fn2fhqk16RX
         IyLO1GDCZ72Y5y8ceMm8sCWJ9s3ccTYR2J/cek3Yi1pMw8LiWO1fxpApihJlrK7WzwbT
         D+6CbA2qklgSof8ejqBO/la7FsisCMxqLWQlRYKnftWDH3pgz3aWZtI7rsr0jOYrv50u
         WGuavy+IibqCxO65f7WYK23Wti7Dzh/8DmsshjhIPd8Pjd4NmNGramoOZTVzRHOJB0PL
         9guoSm0OM7bs5eoNX6HSQyecRbISZs354ERJ0KAhKFXmvfXaQBxiGMvezfQPS2dt4cF+
         rnpA==
X-Forwarded-Encrypted: i=1; AJvYcCUgAmEBHzozIijRMFrcLxfG9DmamlGPBo+54BmTvoH+LldP9shJAgMib6YcbA8hLyqTIc1pcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJiPh713wyEfRPMnSmGDvMYtAi/FxXnrwFoHes+ytyp7j+uOje
	aqICMigiE05oQHh5BTymtpLdQZgbJ8M1pOeyQIiewz896FE0/Vc+
X-Gm-Gg: ASbGnctOpnp1Q6GcSO3FwLXCTV7qMBHr61KsKNTlr2idyp7/QO2NVrClJBJYhozelm2
	VrITEqCF8TMVlvy9o+Qa7HH4qLsruQlvlSYftL0Ph2SMLAXBc37Ui5J4QNAcOuQPX/KwB7dz7cq
	jKWXTrBiP0sN+DP+H6nuQ1oazhT6WugxZy38q8O/Qx7VGzk4N5liVRiMenN+4tARao8p5X0YK12
	d0g0/OOCA74zY0Pirlnz50+xp/doDra1tzHIyhkMt/PWXZWOmfEijR6dp2aQNJEKI5x8Kpwh5ob
	17xnFWwK0VYfAPVTNOc6kPbuqTswKRmbYKslZeJcMQnd1+Ye2T1ZFya+hCPdMQKz3Nx9p4qLYEX
	pka4vTA==
X-Google-Smtp-Source: AGHT+IEcSkEvwfTpeA1pv4/nxSgMr4TNNL/PIqYjwCQvL7oYKhCCodXASw4imJoTjH5+ZyEo67Tebw==
X-Received: by 2002:a05:620a:4486:b0:7b6:d241:d4ae with SMTP id af79cd13be357-7bffcda58e5mr3118721285a.42.1738595044348;
        Mon, 03 Feb 2025 07:04:04 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bba3csm537156985a.3.2025.02.03.07.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:04:03 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 347401200068;
	Mon,  3 Feb 2025 10:04:03 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 03 Feb 2025 10:04:03 -0500
X-ME-Sender: <xms:4tqgZw27RDo2DWSwkX8QQvipsS3jSSOO1nu_VR6kY02nNDGS1ixaNA>
    <xme:4tqgZ7FuQ41RqdFUlEdoPcjew5tC543mpJ_pOjIRdcdeRotGiJE0DqIa7cDs1gSJk
    5KF8_PiLzu4LAq2cA>
X-ME-Received: <xmr:4tqgZ45_tTvMXR1mis-JOzslWC_koh8jA2iIJYwrWjCBV8SBeN0LH06xFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelvdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:49qgZ51PrHy9Iz19D4BiOKGbl3PHy-_rPSVfFMTwTCB-ly4nd1TceA>
    <xmx:49qgZzG45Kvf0Jm23diF2rjaraoGHQEAob2V6acNif13MrHxIWU8Ow>
    <xmx:49qgZy8P8Xla66m6Gy-Nr0d-V45U0zx9T2jl-pVBzucvl1Qxb7wdnw>
    <xmx:49qgZ4lCObMElZPJmnfP6dQ0bCT6EMyF-PRZ6JcyaI8CkT6uAyf-Wg>
    <xmx:49qgZzE3Je794DxDTsNjZ7QPG62SFAyZD7ePuOfIVwajry1U_aSHXOvP>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Feb 2025 10:04:02 -0500 (EST)
Date: Mon, 3 Feb 2025 07:04:01 -0800
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
Message-ID: <Z6Da4XV5hcTfBiNH@tardis.local>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>

On Sun, Feb 02, 2025 at 10:05:46PM +0900, Asahi Lina wrote:
> Encapsulates the core physical/DMA address types, so they can be used by
> Rust abstractions.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---
>  rust/kernel/addr.rs | 15 +++++++++++++++
>  rust/kernel/lib.rs  |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/rust/kernel/addr.rs b/rust/kernel/addr.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..06aff10a0332355597060c5518d7fd6e114cf630
> --- /dev/null
> +++ b/rust/kernel/addr.rs
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Kernel core address types.
> +
> +use bindings;
> +use core::ffi;

I think we should use crate::ffi here. See:

	d072acda4862 "rust: use custom FFI integer types"

> +
> +/// A physical memory address (which may be wider than the CPU pointer size)
> +pub type PhysicalAddr = bindings::phys_addr_t;
> +/// A DMA memory address (which may be narrower than `PhysicalAddr` on some systems)
> +pub type DmaAddr = bindings::dma_addr_t;
> +/// A physical resource size, typically the same width as `PhysicalAddr`
> +pub type ResourceSize = bindings::resource_size_t;
> +/// A raw page frame number, not to be confused with the C `pfn_t` which also encodes flags.
> +pub type Pfn = ffi::c_ulong;
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index e1065a7551a39e68d6379031d80d4be336e652a3..eb1a80ba8ff83ab2d1b3b1d11fed4fb704c7a4f5 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -29,6 +29,7 @@
>  
>  pub use ffi;
>  
> +pub mod addr;

I want to share my worry on this `pub mod` list in kernel/lib.rs may get
too long ;-)

I was about to suggest putting `addr` and `page` into `mm` after Alice's
patchset merged, however, seems that `mm` mod only cover userspace
memory management (which is not my impression of what "mm" in kernel
development), thoughts? Alice, do you think we should extend `mm` mod to
contain all memory management mods?

Regards,
Boqun

>  pub mod alloc;
>  #[cfg(CONFIG_BLOCK)]
>  pub mod block;
> 
> -- 
> 2.47.1
> 
