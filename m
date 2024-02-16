Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23B4FC0A
	for <asahi@lists.linux.dev>; Fri, 16 Feb 2024 01:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708045594; cv=none; b=hsASgXvHogmvRVBC/Oy370Vxz2sJCqt3xE6Dj19GdpwFhlC64ynf0NfZD0baDXkK+sbyZaxJqRM0xajreyuTir96oM6ybs5oQQ/N4k8n9cz/dvDHAhBc6LS7C4c4NdMU68+5TrWUhpfXTTgp+34zwwPPXU4b2tJ7OxCx+fhm5wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708045594; c=relaxed/simple;
	bh=pdX4YFmXvkCYJozarbc5NuAljGq2QKgP22r5bHoyo6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PKMXOO8JsG/2JaxSvebfCvGUJ/hY8Y5gyYf2xd6HWV94gQ7UBX6AjV5+pA+p78RpVy44Sz00u+7k7HqC9+UK+2mvlUiKWrL3U9kFYHewVVWxU70nMmYcM+rjdtbj5u4PTwbfLO4FIUjYLN6V+mISSpVhKRFXxgslZ/DoPdgdMxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=P4vHTgN+; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="P4vHTgN+"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-42db60ebcd7so10223511cf.0
        for <asahi@lists.linux.dev>; Thu, 15 Feb 2024 17:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708045592; x=1708650392; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SJOk5GBoNGjtYX6UP2FD6x8pshcgNrZex6zZ50AbGYM=;
        b=P4vHTgN+cwLBgeU3soLk7mORT3HgHxbUiL/mSfqzmy7dC8r3KPZYbb5k1GVMMTKOw0
         9zVnI6OJPVIHKGdXDHNyC5mey1x1WT4jYUC2vE8bNWzYJkq0Yz/Daoom6cJva+6KxA7h
         eXegSuXA6dcryjtLdmKFLGc8D8K4ajKCWrcsqWPAcczVsgFawYQZY8DTvCraTEDLAiIZ
         SgqMfR1rUHAVPfnUH1LH6hK1lnKigbK1k3oNRtIjjXo4OPmCqdEXyhC2AtCBFupbffv4
         kUU7gRqshoRg1xHPycWvCFMM1VdCCCFvfHnsXMSjcgZqhLiyoCZEAwc4C3oFmVzup7sO
         MxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708045592; x=1708650392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJOk5GBoNGjtYX6UP2FD6x8pshcgNrZex6zZ50AbGYM=;
        b=MdML6p+lw2NCAzNHMQ3mKpOApIIDxnH7oKCGJwt8HZA7oKtS296F1BZcCxOd6wji3f
         T/LGIJXZfAPf8rpbOJQacmDoNd5d9Zr+G3rbccHdMRAgrRxbLTIOLrZknLZE6evKeiub
         hiJK+g27xT7DTLc5ma+kv6OyHK20yiiMqgoOn7g/AHG/KUA9ZXR57Xs2BLNEmuB34pv1
         mm3HiqnxSiBhkQZgskkdrO75aoTP1pV5Yi6kKPZGJgxH6zgYpHYJUgThivKt3WFOn62P
         ZKGwOFdQbT4lVoxYgTwvMcqQ0qj/spBYC/9ci0zJOcytm8KUcO52of+JdyxmaM9WyVYf
         jzWw==
X-Forwarded-Encrypted: i=1; AJvYcCWXEPqFPJDwQc4VQQL9Vm/yMi9JmOwkopmlhJDlhT4WEaa56wZHhJ9ZPseDKCathsu1NaKsOZkgIy3Ad6G6HT5tePe4e78=
X-Gm-Message-State: AOJu0Yzu3Hdr62bcnQRQFEvC6a5EcK211+AF4dI7Abea+FVxLzMON5u5
	QsUekUKdLg/DBEfSSHrQ189LRo9CAS2iA4zfmepn0SMli0FbJX83dAhD5JzX4iMuJK3bNPaLx1g
	f49EwfGZJrg0AUodZ9mFifR2l+MB0kGE/7KhM2A==
X-Google-Smtp-Source: AGHT+IFn+h3r/AaoF4MfmIEWnQLUDUmnx1Kec57gXxwxEXHIeMLPIowE5fZkN66KK2rAD8UQkIaND2e8M33sIsMCnhQ=
X-Received: by 2002:a05:622a:1048:b0:42c:798a:a053 with SMTP id
 f8-20020a05622a104800b0042c798aa053mr4373943qte.55.1708045591818; Thu, 15 Feb
 2024 17:06:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240207174102.1486130-1-pasha.tatashin@soleen.com>
 <20240207174102.1486130-2-pasha.tatashin@soleen.com> <8ce2cd7b-7702-45aa-b4c8-25a01c27ed83@arm.com>
 <CA+CK2bC=XyUhoSP9f0XBqEnQ-P5mMT2U=5dfzRSc9C=2b+bstQ@mail.gmail.com> <b008bd2d-a189-481f-917d-bb045c43cb07@arm.com>
In-Reply-To: <b008bd2d-a189-481f-917d-bb045c43cb07@arm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 15 Feb 2024 20:05:55 -0500
Message-ID: <CA+CK2bBTe93nXzY3Qhty+821LrkjBVnQDxro3m7Y-GVihSP18A@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] iommu/vt-d: add wrapper functions for page allocations
To: Robin Murphy <robin.murphy@arm.com>
Cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
	cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
	dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
	iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
	joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
	rdunlap@infradead.org, samuel@sholland.org, suravee.suthikulpanit@amd.com, 
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org, 
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, will@kernel.org, 
	yu-cheng.yu@intel.com, rientjes@google.com, bagasdotme@gmail.com, 
	mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"

> >>> + */
> >>> +static inline void *iommu_alloc_page_node(int nid, gfp_t gfp)
> >>> +{
> >>> +     return iommu_alloc_pages_node(nid, gfp, 0);
> >>> +}
> >>
> >> TBH I'm not entirely convinced that saving 4 characters per invocation
> >> times 11 invocations makes this wrapper worthwhile :/
> >
> > Let's keep them. After the clean-up that you suggested, there are
> > fewer functions left in this file, but I think that it is cleaner to
> > keep these remaining, as it is beneficial to easily distinguish when
> > exactly one page is allocated vs when multiple are allocated via code
> > search.
>
> But is it, really? It's not at all obvious to me *why* it would be
> significantly interesting to distinguish fixed order-0 allocations from
> higher-order or variable-order (which may still be 0) ones. After all,
> there's no regular alloc_page_node() wrapper, yet plenty more callers of
> alloc_pages_node(..., 0) :/

The pages that are allocated with order > 0 cannot be freed using
iommu_put_pages_list(), without messing up refcounts in the tail
pages. I think having a dedicated function that guarantees order = 0
pages allocation makes it easier for the reviewer to follow the code,
and ensures that only these pages are put on the freelist.

Even in the existing code, the order=0 allocation is wrapped in the
*alloc_pgtable_page() function.

Pasha


>
> Thanks,
> Robin.
