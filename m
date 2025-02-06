Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7C19F111
	for <asahi@lists.linux.dev>; Thu,  6 Feb 2025 17:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864470; cv=none; b=UrBpVk1WdRYeou8msaDanDdPGvzST4f2ZYwlJME2IVhQTrN3hws9Hy5y8bE1E9Zsg7JIbHzns1Zh5WMv9lTw9QxoLfzHuGy3hHBmm2Ek0BmfTQOBjbYkFVTGiluVyB5/re0FFK0IR1PAhVfgnw9WoSx191vSknebhiuqlCtMzvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864470; c=relaxed/simple;
	bh=gn7XItJMDraPdPq3CjAT1TZZRZM0kE5JDG+uOzxZ/4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZUXqG3Oi+8x3EbdV/JQ+eJXmD3e5zC5m0GlDesN4EWYCyC4gp8ibeSEXzfzArE+uuIzg9yHSUd6uA/Qx3TogGVdXMO4SQ1bt4ov0jnWWkEzIuK8J6+MDCJxrtnHKlFQqMVAaE003+UHPX+1OtDFwwpjobaUb3Tze+4OuTU41B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=yb2bZQPM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="yb2bZQPM"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2163dc5155fso25365605ad.0
        for <asahi@lists.linux.dev>; Thu, 06 Feb 2025 09:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738864467; x=1739469267; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Mn+sK8nChOIpeYLnv6IHwIsGNBT4gzyG/mIRD8yp0k=;
        b=yb2bZQPM/FaeIe/69a+TaOu5AniaITsETrjFiUDU9gh4NhD+KYWW325VY5QRsME24U
         d9iDT13NJ2JsxSICFcZFkZGMB943jS8f0dJadLBTpI34RQDNqj04eKxIrUXMoj834wpX
         5hOASkx2CXdV0KWVeMcgs8mqoZ2/kGbfS/uR7dpEornB/X3+zXdzvl3LFGHvn87GPtpb
         CGCX3wq5+U9E37w980SKmAlmmNU75S0AAR5qxsJUE7wzuwoMrZXKASVHm9oCnYWaeRU9
         HjHu43V74KhDp6MBP1Xo3QQ18JM4n/4+vf77ow5dq+bJDqOAXVKrmhxdOe5xrfaJtztf
         h3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738864467; x=1739469267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Mn+sK8nChOIpeYLnv6IHwIsGNBT4gzyG/mIRD8yp0k=;
        b=JFCwFlZFKERPFNSnWA6j0pLiKtc8UZyHyXVKDaDXBTFNGuDSGWQhyr735UYWu0WjKo
         Dt/l5pPlbwtpkBxvL3KmnP1sPLFTDR29s3kDDKwBAAgNV089QNVscyHxWjkd9kGYDpYp
         qpFa9rIL4Bx9JlzWXJsGthGjt3OtLZm4hVPg/Iau4Htlo0ozflOkxE/NRcpMsIeNjw7Z
         WwqK1eoF58wgTNKYK0+IIr3LDMlrbNflo9JAo/puSh0OjELiq5JY1s5MBE1HcmQWCepg
         qD006uXNuSqOivqVHv5j2F0DnKmEC8b2yEL3f257gO6LCSKfD2haycSIVKnOJgdg5Sx2
         MGHg==
X-Forwarded-Encrypted: i=1; AJvYcCVsF1ct+svZSgfkeNDp0l6UdmwTpunIJo5iZ3jAia6rScUYODWxsXTJ/rIsM/eJpSyUDnO4eA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHRT418EGWb4mfVrC8rwDMg1VBY49eAo0ahhWcBFLqzGmbwqiD
	EdG1IG+rO4ztuhiDLiiEogVb4wgNlk4ClNdyi4H/VTpg4SnJyzoh8agoSgWYUuk=
X-Gm-Gg: ASbGncu9wmVjxK8xJ2CEhako/OIipveEIYUAWzYPxIfmV4dxoagM4J143LxwBzsvDvO
	FPiSjXSz1Ots5lGFa3ljseMLsfyR8nZ8LWL2zpNbphIg6zLYtAdKMFpPnTh5lGsScMwLjRZeMmr
	dZbV6t3dfd1gTbAKyDD4/yKnnvYKQNyAme5dEabtYmszchxpTMOAXmLKzZ0A+esU0yTRZqO3DgH
	UAPJx7mtNFUEIQE/9LqIGTBR9W/VcPrabMo/GV5pZDwvle8y5zcLV61bU3deumLaRSgfmQH727u
	dae3yPDN4lybMRV9OcZ0PcNrMjC+ypcw6w==
X-Google-Smtp-Source: AGHT+IEz4awpqkJi/c9nNKxcLNj0HJ/bkNdjww1eQVi1trMS3Hp0zWEssHNhp45gp9A4Jt7vw68l1Q==
X-Received: by 2002:a05:6a00:882:b0:725:c8ea:b320 with SMTP id d2e1a72fcca58-7305d498d3amr215704b3a.14.1738864467255;
        Thu, 06 Feb 2025 09:54:27 -0800 (PST)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048adb10csm1636427b3a.66.2025.02.06.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 09:54:26 -0800 (PST)
Date: Thu, 6 Feb 2025 09:54:24 -0800
From: Tomasz Jeznach <tjeznach@rivosinc.com>
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
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 17/19] iommu/riscv: Update to use
 iommu_alloc_pages_node_lg2()
Message-ID: <Z6T3UCK1FI44pg7z@tjeznach.ba.rivosinc.com>
References: <0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
 <17-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
 <Z6RI3ftJTrm3UxoO@tjeznach.ba.rivosinc.com>
 <20250206131721.GF2960738@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206131721.GF2960738@nvidia.com>

On Thu, Feb 06, 2025 at 09:17:21AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 05, 2025 at 09:30:05PM -0800, Tomasz Jeznach wrote:
> > > @@ -161,9 +163,8 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
> > >  	} else {
> > >  		do {
> > >  			const size_t queue_size = entry_size << (logsz + 1);
> > > -			const int order = get_order(queue_size);
> > >  
> > > -			queue->base = riscv_iommu_get_pages(iommu, order);
> > > +			queue->base = riscv_iommu_get_pages(iommu, queue_size);
> > >  			queue->phys = __pa(queue->base);
> > 
> > All allocations must be 4k aligned, including sub-page allocs.
> 
> Oh weird, so it requires 4k alignment but the HW can refuse to support
> a 4k queue length?
> 

Spec allows that. Also, hardware accepts only physical page number (so far PAGE_SIZE == 4K
for riscv) of the base address, ignoring page offset.

> I changed it to this:
> 
> +                       queue->base = riscv_iommu_get_pages(
> +                               iommu, max(queue_size, SZ_4K));
> 

LGTM

> > >  		} while (!queue->base && logsz-- > 0);
> > >  	}
> > > @@ -618,7 +619,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
> > >  				break;
> > >  			}
> > >  
> > > -			ptr = riscv_iommu_get_pages(iommu, 0);
> > > +			ptr = riscv_iommu_get_pages(iommu, PAGE_SIZE);
> > >  			if (!ptr)
> > >  				return NULL;
> > >  
> > > @@ -698,7 +699,7 @@ static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
> > >  	}
> > >  
> > >  	if (!iommu->ddt_root) {
> > > -		iommu->ddt_root = riscv_iommu_get_pages(iommu, 0);
> > > +		iommu->ddt_root = riscv_iommu_get_pages(iommu, PAGE_SIZE);
> > >  		iommu->ddt_phys = __pa(iommu->ddt_root);
> > >  	}
> 
> Should these be SZ_4K as well or PAGE_SIZE?
> 

SZ_4K. For now iommu/risc-v hardware always assumes PAGE_SIZE == 4K.

> Thanks,
> Jason

Thanks,
- Tomasz
