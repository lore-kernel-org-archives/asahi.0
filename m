Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E34E219A67
	for <asahi@lists.linux.dev>; Tue,  4 Feb 2025 20:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700820; cv=none; b=KpammifsrmHnpKCIIFnfGf9+19ESLLYR+/O4zdDnmeZ5Zxx5Z5L5Ch/9LJxhrh9ZkKlkue5ghJsU1xnGd0ValxNKFGZmmxq0q0VGQvSdLnRXxzilobeUiM2sG0WoMPFeSF9Uqf3oRSStHUvUKkYuRasNDDlcvIrvqRDr0K+Igow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700820; c=relaxed/simple;
	bh=4OVHg9lS9y7hgZNNmxGr15YLES80pi29+1rMKHfcSfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVknUATvaxkvS7gvuQGWs+FcA5DD/TnK6pubwmdM0eK/YWZ2J5Ojt5cm1Vfzw1GtWgZkdn8zG14+awTGCAxFHDJBHVOLkXte5UGJq8XNeUPB0i0F9bTKCwbTWTevuhOFttmvxYw5JQzjy1Kqa1gy3MxcGuMeXKDi0FGen+T5zF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XdTwQG76; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XdTwQG76"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467a37a2a53so70161291cf.2
        for <asahi@lists.linux.dev>; Tue, 04 Feb 2025 12:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738700817; x=1739305617; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XKfHXyy6Lxo2g0AOAumrKv9sTaQK4qw2WswIObaTPeM=;
        b=XdTwQG76MN92icpFuO4O1laGIJWZjFn+jOkyG7ANiR6aj5Yyd7owAjeKkrsCzyxpGk
         eE8N69+rl2thZyzTByceVSbzWYKYka0ndWXOahr2d58P8aNkRcwpZBacesTPZBV7myEp
         VX2/0dBQK23Xilon087cqx774WTz3kjo6KSmEOdK+nMsDoCEKi2bnjZy7whankqAI8y4
         4XRpiKJkpbyCCY2+BJFyUTuXHCOgJ8B8WzbiaUPSr15G88x4yZbunCbMs+xfdhkKeA3P
         sBncRc72HrNCHtVGlPHFwwKoTaG3KiJim7g/oOwTsbXZsmRBpAZR3d3QgnFdvNdTRlkQ
         0VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738700817; x=1739305617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKfHXyy6Lxo2g0AOAumrKv9sTaQK4qw2WswIObaTPeM=;
        b=pM6RLm64LJfmwIifE5Y3PwEEm5OavTK82mJjchFhwDGeMOdxvsXNH92PpVb1ytjKk0
         9GBYj1E4ToCYGhiKzVyumGBM7B7Ptq1wXR3AD7qTwSSxuvY/Fmcqzm7aQIIppzy17eTU
         1S079ZQ3/rGv9ezH55cMNGrDsDTdeaMBblf2qREhOJOynZDPMQmq84Nwz/rgy+3ZpIbK
         iKYcrvalr26hW1CAIOslJgNQ6YTlKplcsDUg5jXBVEBFT+vEnyDnX30zmlxFX1cEk0oU
         VEP4rnJ4L2Z1GWW6Ttge+NMtDpdQ4kFgP1GBqz5ZaEvPcbPexsTiwrLQscJbaKZmLY9i
         4Pdg==
X-Forwarded-Encrypted: i=1; AJvYcCV4S/HyuvNy50N7X1qzKYG0337gOE3QqRrXitlehudFM/kBWtE36LO/8xbQkxFfaz4NctsAAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJx41A3KOzCu6KHc5PsHq4FIJyIOec2zOVrnUMcF8xbnqDIS3p
	u3CmINQIsBAsn5JIqDzS/1YKtLEXkADX4fSkpWBhPo4rqNylygcZk0BJ6OU/3RE=
X-Gm-Gg: ASbGncsACTOhYLZRXIqUKPyRrz/e/2ilWy5pHpWdDvZdc8WTFiqXeGFjvU3lSgPeOHN
	mNEHwan5xDGYeCudGOqb+Ohije0Ru/7phhJSUs8OGTdxUo5F+/jilHRyxNfVPubUnMpyid79Nfu
	Yz8JYUdrcyMSJh5WNRFaxXBpc12G43q+zDbPQ9hSTZhMCo4VfqgFkwGzJKtA8zPYIXuPX1wTF6+
	tCw0OYlJvjYspOm3YOAHs2uaaSCr18DrJTMsvAZ2PRENDmsoVWlIW1VkjuSodZTPoYQfPcFTjnW
	dZH3MDuNTI0M4meuxT03ls3ISaKRVc2T/PwCLZa1BOrQtCYTfPsen5J29wOMbqHN
X-Google-Smtp-Source: AGHT+IEsHxW8JLcluvuP8S+KAnuCNS+p1UBsZQIkGSJDtHpddXcm+6eR6EfbSxlm/LewurR5/XZ3Xg==
X-Received: by 2002:ad4:5c46:0:b0:6d8:af2d:2a44 with SMTP id 6a1803df08f44-6e42fc54742mr2065826d6.32.1738700817497;
        Tue, 04 Feb 2025 12:26:57 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254922538sm65650296d6.84.2025.02.04.12.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 12:26:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tfPVY-0000000CYY9-1RWN;
	Tue, 04 Feb 2025 16:26:56 -0400
Date: Tue, 4 Feb 2025 16:26:56 -0400
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
Message-ID: <20250204202656.GL2296753@ziepe.ca>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>
 <20250204183933.GJ2296753@ziepe.ca>
 <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>

On Tue, Feb 04, 2025 at 09:05:47PM +0100, David Hildenbrand wrote:
> Fully agreed, this is going into the right direction. Dumping what's mapped
> is a different story. Maybe that dumping logic could simply be written in C
> for the time being?

?

Isn't dumping just a
  decode pte -> phys_to_virt() -> for_each_u64(virt) -> printk?

If you can populate the page table in rust you have to be able to dump
it, surely.

Or do you mean trying to decode the leaf entires into some struct page
detail? Does a GPU need to do that? Agree that would be better as some
C function to take in a KVA instead of a struct page and populate a
string with details about that KVA from the struct page.

Jason
