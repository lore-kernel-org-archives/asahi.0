Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BB3216E39
	for <asahi@lists.linux.dev>; Tue,  4 Feb 2025 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738694377; cv=none; b=eRV6ff036PJrfzoP2g2E/Xu67lGAsgMMYoGTXkoUKP0tg93vCj7PnHC4XmmKp7VUj31l1CIQaJz2bsu2Bwx4l+WJfJYVUrtdcL94u4mbV2lU3+eq0nIgcH0k/x6YzAV2EK40f7OXRmHm58reSW53GpkuMIi+RWqVko1BDvCuV9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738694377; c=relaxed/simple;
	bh=9h6JJAK4Pu/iYlnPyM0tcNbLTUXHmVjPIFcLtCL7ypk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W59IWPy61/ZwdGf+TrxNxrfrVMnsvyf1EQoZGJazuM8wA+ci9hpWpBjKY/gsETOrOuYN/zBskoPKBu6xOezbWPj3lx5Ddmj3grgf419K6Roga9euydhfHHBPTMfrTGgamdDCJKVzVtP5Qn89TBxXJDFiPVNWxYMZSKndiwDw1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Mq3Hj7jO; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Mq3Hj7jO"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7be8f28172dso305317585a.3
        for <asahi@lists.linux.dev>; Tue, 04 Feb 2025 10:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738694374; x=1739299174; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NIOzsVL38g1sJ/ZUBOZhRNBuZ1s1V6W+JXIpoF2R4YY=;
        b=Mq3Hj7jOv4i9Cd+oXm2ioaUDAOKvRKTl48XmcenKvWpykInyETbCVrh/yKYiyXeKXf
         MKpjpIk8CZuJZgs7A4DEQRPJ1jxpSnAmJjdZTASx4I9GCNO40VUTkJA3zwrN4XStowa+
         utLc7SRKpdYa18EBb43Y8BvGs3iD0ZTvuGpTD+ksnO0Nm02erXCkfqm+fcqYwDfJU60c
         ttO7n1MgIfKCa6U0Gqs1b6Ig9MkvpXDHJhHDjEzNg/V4wAc0DvQ2PRRDt3HoaXGqphnD
         SzfN0mLQ8WqRQl16If0qvCwm/8LYlGtNPGVYg++Bm0JB1+0Ic+91tFR51iapNVYKoyGi
         D8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738694374; x=1739299174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIOzsVL38g1sJ/ZUBOZhRNBuZ1s1V6W+JXIpoF2R4YY=;
        b=NHEdbijl7E7ZiGfDpehC68Kx0Hx0pf0upPtbvtBeS1VH9/F0fQ9ALJVNrPNK12o739
         +BgwGYRFL/1cfvZdFPklun3hPFBXC70+zMGttdsVU8dluRxmtBOnNrUCCsqTbTNUbCf2
         jSM4MibaKfk7M3ojZ4U/bX7ENXQiRrTRkF60TZAx32FsyW4HSuxphM0Rb5mU+tMtQWXs
         CjRDlK4Gxb6VV7s0b/dGjCigJdKkB6ueqJ/rkZTUB0uzJz7BJoXP6UI2RNUOzwhBL0DD
         LE05NsLOvI89xwW+isK8tYLkWo1OJAf/wZ7O41AqjfPAgnpssQdHpLHNknG5s2VtsdrE
         S4KA==
X-Forwarded-Encrypted: i=1; AJvYcCXx9wEvTkA6B2qKwfcX6KgiC3B7OOp3eAGyhJ6Lpn7CHIjdtkfe5GHgX/oWF1UoAgNNMD98OQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvtxVwJnAGPJ8Z6vveyjAHcuo2xfmb23GDb7Ed0iBPQVX/vRDb
	Y8x4eEfvbOhfDZ8wQUdt2UujUnFY7K/uudFJ0wGPSbqMTvcK82XY1l88sIQn8m0=
X-Gm-Gg: ASbGncu/K6TIgEQRNAMpqkGsPf3h+XOFo8lHwgUytwom80/b+K6nGfHmwtEqPqTis6C
	T2icdhY1n8iFGCRMRkPDcMzTvIccvqdcXWgGmw0NC5tHCvjOnY+0ObPKb6mvvI49IPrHtLakNwb
	RLpKQifKw3V83eIu4zbackrwgbqrJR7Kv808fsU2wWAAbh/yI7JP8pa2Swlye5luE6eItmREE8M
	+5zX6xMsIBK/yzd8WpFLXEF4AmNumeKsKc54wfTSHl8DP03Bb733iXB7sPM+MK8vrkDRCsKoW/8
	pzl06QcPOAddrn5bgA4D16NahSWkpPn0I55hfWvDrz+0zVdInbnvPmsNUZ2KttM0
X-Google-Smtp-Source: AGHT+IGe86LJbhfodbSk2b2jGfTFxFUtn8so+wGv/gOJaU4HL5gvynsh/jzDxiFtVbtWWBBV/9+02A==
X-Received: by 2002:a05:6214:2385:b0:6d4:22fc:ce3e with SMTP id 6a1803df08f44-6e243c7e125mr344942586d6.44.1738694374325;
        Tue, 04 Feb 2025 10:39:34 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2548141b5sm64420416d6.39.2025.02.04.10.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:39:33 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tfNpd-0000000CBTB-0Jbn;
	Tue, 04 Feb 2025 14:39:33 -0400
Date: Tue, 4 Feb 2025 14:39:33 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
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
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
Message-ID: <20250204183933.GJ2296753@ziepe.ca>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>

On Tue, Feb 04, 2025 at 11:33:24AM +0100, David Hildenbrand wrote:
> On 03.02.25 10:58, Simona Vetter wrote:
> > On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
> > > This series refactors the existing Page wrapper to support borrowing
> > > `struct page` objects without ownership on the Rust side, and converting
> > > page references to/from physical memory addresses.
> > > 
> > > The series overlaps with the earlier submission in [1] and follows a
> > > different approach, based on the discussion that happened there.
> > > 
> > > The primary use case for this is implementing IOMMU-style page table
> > > management in Rust. This allows drivers for IOMMUs and MMU-containing
> > > SoC devices to be written in Rust (such as embedded GPUs). The intended
> > > logic is similar to how ARM SMMU page tables are managed in the
> > > drivers/iommu tree.
> > > 
> > > First, introduce a concept of Owned<T> and an Ownable trait. These are
> > > similar to ARef<T> and AlwaysRefCounted, but are used for types which
> > > are not ref counted but rather have a single intended owner.
> > > 
> > > Then, refactor the existing Page support to use the new mechanism. Pages
> > > returned from the page allocator are not intended to be ref counted by
> > > consumers (see previous discussion in [1]), so this keeps Rust's view of
> > > page ownership as a simple "owned or not". Of course, this is still
> > > composable as Arc<Owned<Page>> if Rust code needs to reference count its
> > > own Page allocations for whatever reason.
> > 
> > I think there's a bit a potential mess here because the conversion to
> > folios isn't far enough yet that we can entirely ignore page refcounts and
> > just use folio refcounts. But I guess we can deal with that oddity if we
> > hit it (maybe folio conversion moves fast enough), since this only really
> > starts to become relevant for hmm/svm gpu stuff.
> 
> I'll note that in the future only selected things will be folios (e.g.,
> pagecache, anonymous memory). Everything else will either get a separate
> memdesc (e.g., ptdesc), or work on bare pages.
> 
> Likely, when talking about page tables, "ptdesc" might be what you want to
> allocate here, and not "folios".

I just posted a series to clean up the iommu code that this is
cribbing the interface from: add an ioptdesc, remove all the struct
page from the API and so forth:

https://lore.kernel.org/all/0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com/

I strongly suggest that rust not expose these old schemes that will
need another cleanup like the above. Page tables just need an
allocator using simple void *, kmalloc is good enough for simple
cases.

Drivers should not be exposing or touching struct page just to
implement a page table.

Jason
