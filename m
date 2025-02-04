Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70C5219E8D
	for <asahi@lists.linux.dev>; Tue,  4 Feb 2025 20:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738702191; cv=none; b=UrPzBUwHpGiQy74nK7RCmO0L9pYNY9IYXBLclOLU0pS9xrk3r485XzmQHeTSRq2aTQfEYslwSURIGEoizt7yORh9ul2EG3utzQyNkDIol+LAtH64n5wdUgMT0GxNuh66UoM2XK/QQ5hyFDiQ3uAy2OX3SZNMBwfRMquFT5j3Cp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738702191; c=relaxed/simple;
	bh=kYb8QeKwfReVJv6+NUbSIbrGBhLB5YTqXzeaokiOXnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFEPa450jR6yTa5CdeV+hyWX/HVEvKWbX35cGKRvf5X3mk/4HAIlY2s3mJCSlxCwaASOUzma/cjAuHsbBJmox4xNS/cnwkVsZq45pTy6+e9BhseX46fCDwpy3b6qBfk9E1t29XE5KJEHBIe7SlwjaikGpV13dkNAkNxkUkEpmKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VAfsHyFU; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VAfsHyFU"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7be8f281714so541084285a.1
        for <asahi@lists.linux.dev>; Tue, 04 Feb 2025 12:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738702188; x=1739306988; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VuMGfHPH8Rgkcs5TNo6U5Y3uMl+k/KNkpfdbRlCt8ps=;
        b=VAfsHyFU7wEqmGk4l/lRcVJEIYalrT/Yp6C7zjaxQcZKJIvxub+/Go+olj7Y5pmm6y
         +3n8TC6u04hHWcH5x7uNxtqJL4JZvhufVIxFfZbag2OtcfK3VgDLYkO6g8kpWRd7OtEc
         7mObD6wsLcXKNQQpzaSiGkFBoQMz8yuVNM8pCGMEZA/mhtJD7Lo9BYz6EeOnNZGHXoo2
         xvzJD20aylDdvSb3+6CoR6pya/3t5RliAIL43qdmKgVSavnX+jQ6DCHZ6Nz16UAnkGWl
         L2s0Q4c3pvUxEfjntZARg0wmEk1gwHbJskDYXFiEBg4taAzAFh7a7tvVa/HAXRk9C79Z
         PpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738702188; x=1739306988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuMGfHPH8Rgkcs5TNo6U5Y3uMl+k/KNkpfdbRlCt8ps=;
        b=p+X6f7aqqERUU/4j4kqmqD/a01hLzlJ7yVpWugkRBlyKeLBBDe23negaWVKrpSyEDD
         p3xhftrSwHqyBZlznypc6RgZkbPxv3Fo5R1t1teLWXOW9mbeW5SRrdishPo7Q2KiCpeM
         whVF1K4O3B09xkuu37Cg2Satmmrr2Xq1lQBBbBRUszS4C9jB+iZHPtGuVV7wmLrblyUu
         HqUCb60mm964uBurqRJXRxBUxOEhcDNvOHyeehxCK4zr6pnfW+F6q5czjz3Kt7uJ0N7J
         XZaTAkzNf2YyJH77Jl0XbUQa9vrlI/whV5G1v6Th8nPdfGiKX6JB9BuKz1izKeBaDiww
         lO1w==
X-Forwarded-Encrypted: i=1; AJvYcCULDpRdmX074pfbr3MKk2YKtfL5SN+/ANBqTST1XsA4NKVQPqqY5lbMxSSxVGQsN4opUwlHpw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwImDQBTqiaTlnZcpBsoQC/zP1gXHMhDwEl6CE78dCc7MCTsn/z
	jeEH4oQMOTe4dPQo4q9MvxGDLb4lFL5STyfrTRbhb57wCUrRReKXVqA17vTG3g4=
X-Gm-Gg: ASbGnctJO+EH9lktPMqz8aJ9rCyaDA1x9CfJY6lPJtUo0Je8cHwgspevcsE1X1EU4kM
	dSmx/Q/6Pp8V2sI4yEDO56t3Kh7dWK36vDw9JpIIaojcMG7CPHRI9JzBtx8hPZBg/XrYHXu2VsO
	AKROhqGlb7jl4QbIkMCE74bZDOOLB/zenqaB7FV+g677RMGlxlOvZO6zNVHdcoig17S4C3sYNer
	D7w+AROwT0Guo6bgHH64z2yx8lvgRqPbxIo/KWGWFwgSNKDHrNB5MPMOl7P8e6lsChIkIMs2kd2
	mnzx5sBXtB4rA9YqgfMpJP/JT2rbkXautp4vhDmhh5JdIxouSuC89oUQ5s82rggl
X-Google-Smtp-Source: AGHT+IFCoy9O2sWsL/DnH3NCL2vtPB/0RnkG362y0xiW+CjQk353JmqEMZQpoug4xTMKjQExIBheCg==
X-Received: by 2002:a05:622a:1993:b0:466:886f:3773 with SMTP id d75a77b69052e-470281859damr1708191cf.1.1738702188666;
        Tue, 04 Feb 2025 12:49:48 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf1728c8sm62847861cf.56.2025.02.04.12.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 12:49:48 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tfPrf-0000000CeMf-150d;
	Tue, 04 Feb 2025 16:49:47 -0400
Date: Tue, 4 Feb 2025 16:49:47 -0400
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
Message-ID: <20250204204947.GM2296753@ziepe.ca>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>
 <20250204183933.GJ2296753@ziepe.ca>
 <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>
 <20250204202656.GL2296753@ziepe.ca>
 <08ce9562-9ded-4d95-a495-b60f90d75490@redhat.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08ce9562-9ded-4d95-a495-b60f90d75490@redhat.com>

On Tue, Feb 04, 2025 at 09:41:29PM +0100, David Hildenbrand wrote:
> On 04.02.25 21:26, Jason Gunthorpe wrote:
> > On Tue, Feb 04, 2025 at 09:05:47PM +0100, David Hildenbrand wrote:
> > > Fully agreed, this is going into the right direction. Dumping what's mapped
> > > is a different story. Maybe that dumping logic could simply be written in C
> > > for the time being?
> > 
> > ?
> > 
> > Isn't dumping just a
> >    decode pte -> phys_to_virt() -> for_each_u64(virt) -> printk?
> > 
> 
> IIUC, the problematic bit is that you might not have a directmap such that
> phys_to_virt() would tell you the whole story.

The phys_to_virt() I mean is on the page table pages themselves, not
on a leaf.

All page table pages came from alloc_pages_node() and you'd do
virt_to_phys() to stick them into a next-table PTE, then
phys_to_virt() to bring them back:

  phys_to_virt(virt_to_phys(page_address(alloc_pages_node())))

Effectively.

The leaf pages could be anything and you should enver phys_to_virt
those, this is what I mean by:

> > Or do you mean trying to decode the leaf entires into some struct page
> > detail? Does a GPU need to do that? Agree that would be better as some
> > C function to take in a KVA instead of a struct page and populate a
> > string with details about that KVA from the struct page.

Though I should have said phys_addr_t not KVA

Jason
