Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC167B72
	for <asahi@lists.linux.dev>; Thu, 14 Dec 2023 17:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yH6gZ2GQ"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-35f8865cc32so2305ab.0
        for <asahi@lists.linux.dev>; Thu, 14 Dec 2023 09:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702576706; x=1703181506; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8hhXPzgTkSbGrZlVoxMVSGKEuHWo76SGrFtR2YZpAU=;
        b=yH6gZ2GQWqipCZfoHCvykPA89n7MMF6N6Rxw7mJUTQA6T7VuMS7s6alKyHyQAaKB9D
         FFGeZX/nfQ4P23xLGut3kNRCeOMxCvSoWSL48LluFT5KkKpxmLnW+JV15Yc6TsiC6XZd
         DRGJQXLnaxV3YcrLNhqnmymyRmtzwCW8YgjtULAkInVcLUmUgOAZ2s3vAhABlOmElK4B
         GwEGXYMF8Hr3rAbekjXyqXOxlCFlS0QmsnqKShin3XJILw3N36aWm6EmAhF50tMKcdZx
         Qq7q+4FAo23sYlxWUs2twHbc58qkdmtFebGmJ8QS280VOrX8tKXBemepD+y9YcFY7kxV
         BVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576706; x=1703181506;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8hhXPzgTkSbGrZlVoxMVSGKEuHWo76SGrFtR2YZpAU=;
        b=XXtDWLRwusns7JWTUEfThqMePXYYxEmObihzdSNRVZknh9TZ6SJI7D+y3fVGPI7gli
         SZpxwIH1W/wK+wvp4PB7yCMS0RoSCW10iHfXF3qyssG+YmAeSfM/+Dry+Pf6wxmGqKiH
         KprGAMH5muIGIbOlvS30MfFKj0PTa4yxFNI7iQJf/KrjnkVrrjMLNtDo0u73njz9a6K8
         Ww/EGClRusMB/4xj7hs4kPjUTonKPW/ZhdzYKCk/Ckt6W6/iAtIlNIaSfo/60WbB1Z8T
         wl1EEs/denWvDZKaQs7n96txaMkwnbJx9lT01p+wsF2CLPiKMyyGe41q5wCFSYDQTyWn
         tkaw==
X-Gm-Message-State: AOJu0YwIA34wnomRZ0yODYEGrbu3WOqm/9sKqYm56YyXRUIo6Ci17ACa
	sQLGb7j+/lKa6uW93rt9dD4Eew==
X-Google-Smtp-Source: AGHT+IHmJZOc6yIjryc1hqs+mSoywAgy/Kw7JX+y+PxO7dXRpBhV7x9zJfpibywCzeGN/8UCDSSJcQ==
X-Received: by 2002:a05:6e02:4a3:b0:35f:7497:181a with SMTP id e3-20020a056e0204a300b0035f7497181amr419773ils.2.1702576705658;
        Thu, 14 Dec 2023 09:58:25 -0800 (PST)
Received: from [2620:0:1008:15:740b:4c24:bdb6:a42a] ([2620:0:1008:15:740b:4c24:bdb6:a42a])
        by smtp.gmail.com with ESMTPSA id ba1-20020a170902720100b001d09c539c95sm12769653plb.90.2023.12.14.09.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:58:25 -0800 (PST)
Date: Thu, 14 Dec 2023 09:58:23 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
cc: Andrew Morton <akpm@linux-foundation.org>, alim.akhtar@samsung.com, 
    alyssa@rosenzweig.io, asahi@lists.linux.dev, baolu.lu@linux.intel.com, 
    bhelgaas@google.com, cgroups@vger.kernel.org, corbet@lwn.net, 
    david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
    iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
    joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
    linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
    linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
    mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
    rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
    suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
    thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
    vdumpa@nvidia.com, wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Subject: Re: [PATCH v2 01/10] iommu/vt-d: add wrapper functions for page
 allocations
In-Reply-To: <20231130201504.2322355-2-pasha.tatashin@soleen.com>
Message-ID: <776e17af-ae25-16a0-f443-66f3972b00c0@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-2-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Pasha Tatashin wrote:

> diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
> new file mode 100644
> index 000000000000..2332f807d514
> --- /dev/null
> +++ b/drivers/iommu/iommu-pages.h
> @@ -0,0 +1,199 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023, Google LLC.
> + * Pasha Tatashin <pasha.tatashin@soleen.com>
> + */
> +
> +#ifndef __IOMMU_PAGES_H
> +#define __IOMMU_PAGES_H
> +
> +#include <linux/vmstat.h>
> +#include <linux/gfp.h>
> +#include <linux/mm.h>
> +
> +/*
> + * All page allocation that are performed in the IOMMU subsystem must use one of
> + * the functions below.  This is necessary for the proper accounting as IOMMU
> + * state can be rather large, i.e. multiple gigabytes in size.
> + */
> +
> +/**
> + * __iommu_alloc_pages_node - allocate a zeroed page of a given order from
> + * specific NUMA node.
> + * @nid: memory NUMA node id

NUMA_NO_NODE if no locality requirements?

> + * @gfp: buddy allocator flags
> + * @order: page order
> + *
> + * returns the head struct page of the allocated page.
> + */
> +static inline struct page *__iommu_alloc_pages_node(int nid, gfp_t gfp,
> +						    int order)
> +{
> +	struct page *pages;

s/pages/page/ here and later in this file.

> +
> +	pages = alloc_pages_node(nid, gfp | __GFP_ZERO, order);
> +	if (!pages)

unlikely()?

> +		return NULL;
> +
> +	return pages;
> +}
> +
> +/**
> + * __iommu_alloc_pages - allocate a zeroed page of a given order.
> + * @gfp: buddy allocator flags
> + * @order: page order
> + *
> + * returns the head struct page of the allocated page.
> + */
> +static inline struct page *__iommu_alloc_pages(gfp_t gfp, int order)
> +{
> +	struct page *pages;
> +
> +	pages = alloc_pages(gfp | __GFP_ZERO, order);
> +	if (!pages)
> +		return NULL;
> +
> +	return pages;
> +}
> +
> +/**
> + * __iommu_alloc_page_node - allocate a zeroed page at specific NUMA node.
> + * @nid: memory NUMA node id
> + * @gfp: buddy allocator flags
> + *
> + * returns the struct page of the allocated page.
> + */
> +static inline struct page *__iommu_alloc_page_node(int nid, gfp_t gfp)
> +{
> +	return __iommu_alloc_pages_node(nid, gfp, 0);
> +}
> +
> +/**
> + * __iommu_alloc_page - allocate a zeroed page
> + * @gfp: buddy allocator flags
> + *
> + * returns the struct page of the allocated page.
> + */
> +static inline struct page *__iommu_alloc_page(gfp_t gfp)
> +{
> +	return __iommu_alloc_pages(gfp, 0);
> +}
> +
> +/**
> + * __iommu_free_pages - free page of a given order
> + * @pages: head struct page of the page

I think "pages" implies more than one page, this is just a (potentially 
compound) page?

> + * @order: page order
> + */
> +static inline void __iommu_free_pages(struct page *pages, int order)
> +{
> +	if (!pages)
> +		return;
> +
> +	__free_pages(pages, order);
> +}
> +
> +/**
> + * __iommu_free_page - free page
> + * @page: struct page of the page
> + */
> +static inline void __iommu_free_page(struct page *page)
> +{
> +	__iommu_free_pages(page, 0);
> +}
> +
> +/**
> + * iommu_alloc_pages_node - allocate a zeroed page of a given order from
> + * specific NUMA node.
> + * @nid: memory NUMA node id
> + * @gfp: buddy allocator flags
> + * @order: page order
> + *
> + * returns the virtual address of the allocated page
> + */
> +static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
> +{
> +	struct page *pages = __iommu_alloc_pages_node(nid, gfp, order);
> +
> +	if (!pages)
> +		return NULL;
> +
> +	return page_address(pages);
> +}
> +
> +/**
> + * iommu_alloc_pages - allocate a zeroed page of a given order
> + * @gfp: buddy allocator flags
> + * @order: page order
> + *
> + * returns the virtual address of the allocated page
> + */
> +static inline void *iommu_alloc_pages(gfp_t gfp, int order)
> +{
> +	struct page *pages = __iommu_alloc_pages(gfp, order);
> +
> +	if (!pages)
> +		return NULL;
> +
> +	return page_address(pages);
> +}
> +
> +/**
> + * iommu_alloc_page_node - allocate a zeroed page at specific NUMA node.
> + * @nid: memory NUMA node id
> + * @gfp: buddy allocator flags
> + *
> + * returns the virtual address of the allocated page
> + */
> +static inline void *iommu_alloc_page_node(int nid, gfp_t gfp)
> +{
> +	return iommu_alloc_pages_node(nid, gfp, 0);
> +}
> +
> +/**
> + * iommu_alloc_page - allocate a zeroed page
> + * @gfp: buddy allocator flags
> + *
> + * returns the virtual address of the allocated page
> + */
> +static inline void *iommu_alloc_page(gfp_t gfp)
> +{
> +	return iommu_alloc_pages(gfp, 0);
> +}
> +
> +/**
> + * iommu_free_pages - free page of a given order
> + * @virt: virtual address of the page to be freed.
> + * @order: page order
> + */
> +static inline void iommu_free_pages(void *virt, int order)
> +{
> +	if (!virt)
> +		return;
> +
> +	__iommu_free_pages(virt_to_page(virt), order);
> +}
> +
> +/**
> + * iommu_free_page - free page
> + * @virt: virtual address of the page to be freed.
> + */
> +static inline void iommu_free_page(void *virt)
> +{
> +	iommu_free_pages(virt, 0);
> +}
> +
> +/**
> + * iommu_free_pages_list - free a list of pages.
> + * @pages: the head of the lru list to be freed.

Document the locking requirements for this?

> + */
> +static inline void iommu_free_pages_list(struct list_head *pages)
> +{
> +	while (!list_empty(pages)) {
> +		struct page *p = list_entry(pages->prev, struct page, lru);
> +
> +		list_del(&p->lru);
> +		put_page(p);
> +	}
> +}
> +
> +#endif	/* __IOMMU_PAGES_H */
> -- 
> 2.43.0.rc2.451.g8631bc7472-goog
> 
> 
> 
