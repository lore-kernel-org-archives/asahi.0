Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BB92E627
	for <asahi@lists.linux.dev>; Wed, 25 Oct 2023 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BxnfYtrD"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5840fe01176so3531486eaf.1
        for <asahi@lists.linux.dev>; Wed, 25 Oct 2023 08:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1698249514; x=1698854314; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xh9TIQAzLGtY8IKnRXxYUTC8KDsKOaw81BBkG/qg5HY=;
        b=BxnfYtrDJt72LZuOQ+cVPe5JP1mQ844xJBN9dhFUjUAtutDVs/BOL3e5F0WzHcpn0n
         879RicYYh8lfjRqiIS+7MfKh4FlLWMbR/khacvAtNhkPw0T5k7JZaOt2v7LWZl6yzbjx
         4F+DkWajeXyre6InyaG71905X9ggu2lJGiICu+PoNoQwXNkcE9/RJrO4RzpKY5RoMTuh
         uUgS4RiPQaiZ5oTeO727vzvC8RmbYaJPCX+WcuR9W4MRfe/go+m1GTeijbpljT8ZdiaW
         9DsARHvWIWH8Hq8Sc+SETpRZZcISfPjy9bmcTCb2qDZ7f43szKtFlwkpsSBhxVV7ZNNk
         bcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698249514; x=1698854314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xh9TIQAzLGtY8IKnRXxYUTC8KDsKOaw81BBkG/qg5HY=;
        b=btqS/vKtKNvOjRVqtJPQyTdK3DEsPPn1EVvXP1ExH78tLeWsRW5E+IpQ3JpLH9w7vJ
         U6fjqZaLkV/UwGPqCuCleWtf1lfQBi6v3PKLqhhK6O2mZ5c9NPbnPbZ2Jy9ZvP5SH9f/
         lEQdjHovehdckbPmsUH2rKxus5XhObcuk04S8jE//KRppNjbQe/EzlD5o/uHw8G5V/VZ
         pJptoGrFiik70MtSEFSU/BW28QMpp5IB84OnK6Wm0lAsZQPSKxN3OVDVRz8X2LnfO+1n
         YKrIUM8ExoUb+RL6q0WWvSOUYbQDOjPBfZ2hpJGg6UjkOfUBS5aUMr8FJgcgbKn7S/4f
         ecTw==
X-Gm-Message-State: AOJu0YzITmtlZAYz5U1zlD2njhU7hZccuAT3URcY03wehd6MkzWhj1F9
	XPp7r5A+YKhGgKjTcoGVM0fXMw==
X-Google-Smtp-Source: AGHT+IFzIsrHLnoP3SfHHNSS732Byz8xbCh6I9WGwH1qvCmSKAsaFlHdvXIydQDBYtQoTuLU7GaqVw==
X-Received: by 2002:a4a:bd05:0:b0:581:ff09:62e4 with SMTP id n5-20020a4abd05000000b00581ff0962e4mr15571716oop.2.1698249513815;
        Wed, 25 Oct 2023 08:58:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id y4-20020a4aaa44000000b0057e66fa004dsm26569oom.47.2023.10.25.08.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 08:58:33 -0700 (PDT)
From: jgg@ziepe.ca
X-Google-Original-From: Jason Gunthorpe <jgg@nvidia.com>, Joerg Roedel <joro@8bytes.org>
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qvgHA-004tcE-CG;
	Wed, 25 Oct 2023 12:58:32 -0300
Date: Wed, 25 Oct 2023 12:58:32 -0300
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux.dev,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Hector Martin <marcan@marcan.st>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sven Peter <sven@svenpeter.dev>, Will Deacon <will@kernel.org>
Cc: Lu Baolu <baolu.lu@linux.intel.com>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 0/9] iommu: Convert dart & iommufd to the new
 domain_alloc_paging()
Message-ID: <20231025155832.GA1167025@nvidia.com>
References: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>

On Wed, Sep 27, 2023 at 08:47:30PM -0300, Jason Gunthorpe wrote:
> Continue converting drivers to the new interface. Introduce
> ops->blocked_domain to hold the global static BLOCKED domain and convert
> all drivers supporting BLOCKED to use it.
> 
> This makes it trivial for dart and iommufd to convert over to
> domain_alloc_paging().
> 
> There are six drivers remaining:
> 
> drivers/iommu/amd/iommu.c:      .domain_alloc = amd_iommu_domain_alloc,
> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:    .domain_alloc           = arm_smmu_domain_alloc,
> drivers/iommu/arm/arm-smmu/arm-smmu.c:  .domain_alloc           = arm_smmu_domain_alloc,
> drivers/iommu/fsl_pamu_domain.c:        .domain_alloc   = fsl_pamu_domain_alloc,
> drivers/iommu/intel/iommu.c:    .domain_alloc           = intel_iommu_domain_alloc,
> drivers/iommu/virtio-iommu.c:   .domain_alloc           = viommu_domain_alloc,
> 
> v2:
>  - Rebase to Joerg's for-next
>  - New patch to remove force_bypass, as discussed with Janne
>  - Move some hunks between patches to accommodate Robin's change to the
>    attach_dev switch
> v1: https://lore.kernel.org/r/0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com
> 
> Jason Gunthorpe (9):
>   iommu: Move IOMMU_DOMAIN_BLOCKED global statics to ops->blocked_domain
>   iommu/vt-d: Update the definition of the blocking domain
>   iommu/vt-d: Use ops->blocked_domain
>   iommufd: Convert to alloc_domain_paging()

Joerg can you grab these for this cycle please

>   iommu/dart: Use static global identity domains
>   iommu/dart: Move the blocked domain support to a global static
>   iommu/dart: Convert to domain_alloc_paging()
>   iommu/dart: Call apple_dart_finalize_domain() as part of
>     alloc_paging()
>   iommu/dart: Remove the force_bypass variable

I will poke more dart related people to get a tested-by, maybe next
cycle.

The arm patches at least need this

Thanks,
Jason
