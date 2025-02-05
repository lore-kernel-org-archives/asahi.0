Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E7125A649
	for <asahi@lists.linux.dev>; Wed,  5 Feb 2025 07:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738741251; cv=none; b=UcY5olnMTG4/m4xu3avNG8Fb5ArSFY4KAOvuWVINGPId9rR341BpwLdXbK4be2D64kwhOnj04Ma0+RLvl240MC5RpFtLiNy9un1Y+FiouGROwsXLL5RE2o663KtD9l1fqjj7e/AiB1cRpGoVPjTgxua2Zf+esIqJ28ETPG9ha+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738741251; c=relaxed/simple;
	bh=dq8x78xFfxJcyFobGxSkBs6l3zBnCmYDFlTlCt5dNhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ey+yXVtshSWse+tuIhEDZkNF9dfhCqoQGQ0GxTXhXFk7jQe7mo/qQKX4OP1xKlVnluYKF9+rpzOeRA7kvnBRVF8BPCzbibksoNO9mpf9EFTTSKxxOMdzTX4dzstA84njgi0PFu0jipTvZPLh/Wevl8153omO2g6tY1KM/57EjEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=FOS2/hms; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="FOS2/hms"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361815b96cso44564875e9.1
        for <asahi@lists.linux.dev>; Tue, 04 Feb 2025 23:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738741248; x=1739346048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ckp9FvO1OYcctyJmH0f9RK1zPC2wKkspGKnecKorEdQ=;
        b=FOS2/hms6cUNwmJNGNgNxu6Z0bVzzzM5XwoXysgWr6G5G7cnJpIk+FCDvsu3DVCC+7
         8/as5QdOaeRLXkFH3YHOW7FCp9GDahVVh2/nxLSPr9nBRWLtkb5lKw5vWIAAj1O+1A+U
         CVDodnC+7RcnQXcWDNpfpnOWbq6Cp9MLaRdss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738741248; x=1739346048;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ckp9FvO1OYcctyJmH0f9RK1zPC2wKkspGKnecKorEdQ=;
        b=X/HlZ+a3/8s+56GhZbCspF0PFbZg88qXI6e0M45Lutpgf+btbqQclwPGY/tHQ00uyu
         57FX0ErtQ69XIpkaQ/w8ZMcjU4e24aw594c5zqBzvVHzu1hJ7QAXfu27Y/a2sCnRyYqP
         IZfK1fV+WtrA3+xJixWQ0NAS+NFE6/gUYIawvEYBgCNK6mdDjzxTp/nlF3aPKIhaDfDf
         bmuiSEgwYcGK/LZ7QPPkfH69jSJUCtBHCvOFudk2lhVnQwjJW19viQQRH56C3x2oeqgM
         SVUlK/gSTHFmdjnf5vkIGtNDXyHaEl3leJRPFy1DZRpx9TQe8uTTwafb13cQcSV6ENNl
         AMyw==
X-Forwarded-Encrypted: i=1; AJvYcCU9xTfZobO8sXBRI+O3fxQnxFECcGz1+BBEv8haJ1NLoa9uuvWWcDj6eER9bG27zjq6Q4/KuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi0R3ICgUFnEF5B0RV28coDoGAclnrsPem7VCKXIkwNj70UFiu
	Ab7OJZnZ2UroE2Nbev74WcrZBUxEEcH7MghCEr9PmXSofhGHTkyWtXomMX82EMw=
X-Gm-Gg: ASbGnctwujMUTwqmnI06v4teR9pQuJ/2eP3LcqpV+cmNwJpSCTPwj90bMCxC0aui9kJ
	6QSStedZgtQVVyYDgC7ecIxyemFm6Y7r7KiYXU5IvXF9ey35d804QxKpnMugEwoYy0eOBSMxVg4
	zSuM7L1CvxhMk6HOYckP31m4J0WnG1kN0XbHYhEZLFR1mr1EkcByaFWcYsnKCWuDL+qskCjidAi
	uuqI1sNFIQjjTsSeAyDRi3ggbRFhV++nX2ppKGOdZ4/hYAt/XNGQmP8FiZsuOOfqv+Nz85qodjs
	0kxCpn/6HswxNATaxlNVYpp/Oeo=
X-Google-Smtp-Source: AGHT+IG9wKRslTcLxM9q7tpMRQI/mhbwKzUGyEOxhppyXztbkL0YRlXLXEUw54yO2pT5NLjqWPcDZQ==
X-Received: by 2002:a05:600c:1d1e:b0:436:faeb:2a1b with SMTP id 5b1f17b1804b1-4390d43e579mr9940605e9.13.1738741247972;
        Tue, 04 Feb 2025 23:40:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d933a4bsm12876465e9.6.2025.02.04.23.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 23:40:47 -0800 (PST)
Date: Wed, 5 Feb 2025 08:40:45 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: Asahi Lina <lina@asahilina.net>, Zi Yan <ziy@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
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
	asahi@lists.linux.dev, Oscar Salvador <osalvador@suse.de>,
	Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
Message-ID: <Z6MV_Y9WRdlBYeRs@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	Asahi Lina <lina@asahilina.net>, Zi Yan <ziy@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
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
	asahi@lists.linux.dev, Oscar Salvador <osalvador@suse.de>,
	Muchun Song <muchun.song@linux.dev>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <41ca3445-80cd-43c1-8f9e-634c195c9187@asahilina.net>
 <37A0729B-A711-4D45-B9F0-328FDB9ADD28@nvidia.com>
 <0e19e1c3-293b-4740-93f3-2c410893288b@redhat.com>
 <82047858-480a-45e3-b826-3a46fbebe842@asahilina.net>
 <f1498b22-0bc1-489a-8c2c-35aa48c7fe7d@redhat.com>
 <1e9ae833-4293-4e48-83b2-c0af36cb3fdc@asahilina.net>
 <026c1a0c-e53a-4a5e-92da-6e4f18ce0fee@redhat.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <026c1a0c-e53a-4a5e-92da-6e4f18ce0fee@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Feb 04, 2025 at 03:38:17PM +0100, David Hildenbrand wrote:
> > > It can still race with memory offlining, and it refuses ZONE_DEVICE
> > > pages. For the latter, we have a different way to check validity. See
> > > memory_failure() that first calls pfn_to_online_page() to then check
> > > get_dev_pagemap().
> > 
> > I'll give it a shot with these functions. If they work for my use case,
> > then it's good to have extra checks and I'll add them for v2. Thanks!
> 
> Let me know if you run into any issues.
> 
> > 
> > > 
> > > > 
> > > > If the answer is "no" then that's fine. It's still an unsafe function
> > > > and we need to document in the safety section that it should only be
> > > > used for memory that is either known to be allocated and pinned and will
> > > > not be freed while the `struct page` is borrowed, or memory that is
> > > > reserved and not owned by the buddy allocator, so in practice correct
> > > > use would not be racy with memory hot-remove anyway.
> > > > 
> > > > This is already the case for the drm/asahi use case, where the pfns
> > > > looked up will only ever be one of:
> > > > 
> > > > - GEM objects that are mapped to the GPU and whose physical pages are
> > > > therefore pinned (and the VM is locked while this happens so the objects
> > > > cannot become unpinned out from under the running code),
> > > 
> > > How exactly are these pages pinned/obtained?
> > 
> > Under the hood it's shmem. For pinning, it winds up at
> > `drm_gem_get_pages()`, which I think does a `shmem_read_folio_gfp()` on
> > a mapping set as unevictable.
> 
> Thanks. So we grab another folio reference via
> shmem_read_folio_gfp()->shmem_get_folio_gfp().
> 
> Hm, I wonder if we might end up holding folios residing in
> ZONE_MOVABLE/MIGRATE_CMA longer than we should.
> 
> Compared to memfd_pin_folios(), which simulates FOLL_LONGTERM and makes sure
> to migrate pages out of ZONE_MOVABLE/MIGRATE_CMA.
> 
> But that's a different discussion, just pointing it out, maybe I'm missing
> something :)

Good GPU Drivers (tm) are supposed to have a shrinker so we can at least
nuke some of them again. Some folks even looked into hooking up a migrate
callback through the address_space (or wherever that hook was, this is
from memory) so we can make this somewhat reliable. So yeah we're hogging
ZONE_MOVEABLE unduly still.

The other side is that there's about 2-3 good drivers (msm, i915, xe
should have a shrinker now too but I didn't check). The others all fall
various levels of short, or still have 3 times cargo-culted versions of
i915's pin-as-a-lock design and get it completely wrong.

So yeah I'm aware this isn't great, and we're at least glacially slowly
moving towards a common shrinker infrastructure that maybe in a glorious
future gets all this right. I mean it took us 15+ years to get to a
cgroups controller after all too, and that was also a well known issue of
just being able to hog memory with no controls and potentially cause
havoc.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
