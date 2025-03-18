Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50682080E9
	for <asahi@lists.linux.dev>; Tue, 18 Mar 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294788; cv=none; b=qBFs9kz0tZRye/xlKZDj4HUM619sXhQDjtiYiVYA8W9z8UlCHjQNxWRxb4OLR+8rZIGqbGG3qQawlHiCifiVWQNQrfHOj7fnZMZu/lEeIHVSbvh+lcSOocFISW8wInOz/JMLfF1MbDnMocBWyIk8xbwdPenW0igNrwrgH0WxsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294788; c=relaxed/simple;
	bh=BH/02l/7jfK62esHmL2nQqidEObr1IPIfhlBILiTzRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBYljF/Arm/OXb8Cp/PRdArqi3wZSQfZBkA1zoBziZLev4nPmlwfXMolvfQi0iTe67rVuTWNDYCZGodl9oOva7sppb8vovp85r3TO4OWNJbO/lZdE9qKGPve6ZUXg3hbtvKCq17frnPUTqLOxJ2qK53j1QW53kl0FwL+muzWyJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MXe/Cxhg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MXe/Cxhg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso32975e9.1
        for <asahi@lists.linux.dev>; Tue, 18 Mar 2025 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742294784; x=1742899584; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/+Q9jlO5xuM+dGNN5vOy/zKLThOd0aux5Q2kg9METOQ=;
        b=MXe/CxhgR4YPfXnkNhk2z1cK8G0CgjsERaz3ggQJR5D2FaqIqvXWsvhlq7E/6DNwvA
         2+ZxFFk8DQ5cHnp+wakfRu6aYQ872X0ek9Z5uNkyTUwnlKuaTM+4nIugNOw0f4u0B81/
         iq4JIFDWZM0sx6kE4pIcVmmXuyOUcPIiIgtfCAsw7AxD7SYST9J681V6497UfSJj4BIa
         24Xz91uTgLT+AlyNTYqWYFQgap9ggxyie0F+8lesgl99E3OTpbSnszc4Xl+vv+2UyqY/
         qpZxRd4qJJv1kTZ2XZ4P4Gs8GOorU5QrO8pWVbJsNcTYABRcrTWHSm0bP2uGcN/A7rom
         MC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294784; x=1742899584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+Q9jlO5xuM+dGNN5vOy/zKLThOd0aux5Q2kg9METOQ=;
        b=r7+bEHQO739zT/4Jk2FzAV10wVA901SCSaMyo0FiRbatlXPS7PyPlxETgs97lNitaY
         GXM617Dys0+O+Lnff0dPQa7tY/q4dx5KAXDXfYdXcSSAbMlz2rdJ6MJhEmQWXcFIOfDp
         uudi9yLNFsFtevAZO8C97vsnEeDQg0yOjeIoXJg5H4AR4knIEBp2l5Lkdoe/hlIHhayS
         JOKQqryG0DfTKrSgrSZ8L+zbXdT2zknZgeBPt2g7soF+8sei9G5+fuPTebkXY6P9lFYe
         ZwM1hdldEtpc++q8txu/mEvkiKacxICW+/eqOq8iaCiDmz/pzrqoJSg+mvBDyBlVf6IU
         JQow==
X-Forwarded-Encrypted: i=1; AJvYcCUVNiAeKLbTJIBqCO+8iTF/xW0TGwkh+VixmQupb6uQRCVGENn4F70AlN09vTlOqLgwMZ8laQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzR1p4NgGLm8pz2AeV0SSI14NNWxPOSB4sX2Y5JzJBJV+B5i9LW
	y0N590VoY4B7aiXmHuqx9j3u59x4g9nbnsh8hoO17BrqQWlShvTEpaaVvxPwZg==
X-Gm-Gg: ASbGnct2OrUGwQuoncwlwvqcjYaOxabnSykARj3vGmDEirNPNjdWipOtOKFh37/79Wq
	SzBmwGDBlG/hugDe0oOdrhM8uaM/MXoLDSHSACTFm2LEbdoL+5ZYHL8wIu5oQvphn1XEJ9hRCe5
	ko2B4UaQ/xEDcGVGgRG3E5be1zsmYT9D+n9U2PfvfRkd26qjp76DcDWKyoFjqrT2SUPrQMuIWf2
	r7ReZot25LA46yAey6ZcpddmJxYRBOZf9FrgfpeeTMUF5ILT51wdQnc0Y9Gu0Rd7u4u9RCPFavk
	57qYRhYD0pzvoBc+Eb6Fq+gvoGd1a9B6fSufSRDpEOM9I8hrmT/6C7YydQz505avTJ8ZYTtbWlT
	gkSEB
X-Google-Smtp-Source: AGHT+IHJJJKc86lCeSfkPHpB/CtXXs0Prp3Nz9+7FXSfTlHmKZ30/6jEnzkR0iwoq3j3jwsYbn5hfA==
X-Received: by 2002:a05:600c:1d20:b0:439:4a76:c246 with SMTP id 5b1f17b1804b1-43d3e14f871mr474575e9.6.1742294783884;
        Tue, 18 Mar 2025 03:46:23 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbcf00sm129988595e9.10.2025.03.18.03.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 03:46:23 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:46:18 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 20/23] iommu: Update various drivers to pass in lg2sz
 instead of order to iommu pages
Message-ID: <Z9lO-viudk9YGakl@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <20-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <Z9GFFBvUFg7a9WEg@google.com>
 <20250317133500.GC9311@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317133500.GC9311@nvidia.com>

On Mon, Mar 17, 2025 at 10:35:00AM -0300, Jason Gunthorpe wrote:
> On Wed, Mar 12, 2025 at 12:59:00PM +0000, Mostafa Saleh wrote:
> > > --- a/drivers/iommu/io-pgtable-arm.c
> > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > @@ -263,14 +263,13 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
> > >  				    void *cookie)
> > >  {
> > >  	struct device *dev = cfg->iommu_dev;
> > > -	int order = get_order(size);
> > >  	dma_addr_t dma;
> > >  	void *pages;
> > >  
> > >  	if (cfg->alloc)
> > >  		pages = cfg->alloc(cookie, size, gfp);
> > >  	else
> > > -		pages = iommu_alloc_pages_node(dev_to_node(dev), gfp, order);
> > > +		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, size);
> > 
> > Although, the current implementation of iommu_alloc_pages_node_sz() would round
> > the size to order, but this is not correct according to the API definition
> > "The returned allocation is round_up_pow_two(size) big, and is physically aligned
> > to its size."
> 
> Yes.. The current implementation is limited to full PAGE_SIZE only,
> the documentation imagines a future where it is not. Drivers should
> ideally not assume the PAGE_SIZE limit during this conversion.
> 
> > I'd say we can align the size or use min with 64 bytes before calling the
> > function would be enough (or change the API to state that allocations
> > are rounded to order)
> 
> OK, like this:
> 
> 	if (cfg->alloc) {
> 		pages = cfg->alloc(cookie, size, gfp);
> 	} else {
> 		/*
> 		 * For very small starting-level translation tables the HW
> 		 * requires a minimum alignment of at least 64 to cover all
> 		 * cases.
> 		 */
> 		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp,
> 						  max(size, 64));
> 	}

Yes, that looks good.

Thanks,
Mostafa

> 
> Thanks,
> Jason
