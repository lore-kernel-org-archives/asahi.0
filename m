Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF0F54903
	for <asahi@lists.linux.dev>; Fri, 15 Mar 2024 21:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710538088; cv=none; b=Bq8k2Ug/np/BsmDKGk438EIZPm9/PO5YB5yjGJ6Z2hyY7TXRcrtrp47GzUzkDJ3iuJ8Ja+U3zG+TuuSKd1nP92e4HVu59GJCx4Fxnt6V4Y1PV3EUq6BDi5V4r9g37Ekp1cA4csx0FvrKKk97U+qxnVrBG2xdmFHc3/WhdrLvrsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710538088; c=relaxed/simple;
	bh=Q+XOPMRCM5h9lRk7auaVgXY8II5pi0ZuPsC/JllFwmk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=l+ytvuiPZvIh7vY8kv39Mvo/yv8Zhr1M9RE1y3xq6rZO8Czgsm4HyKZ8KfrkmibtgbNyzUh+h26sJKI0VVZBIrd7IF4jTWny3zhcZFAat5yKpRVj4Z0INZxseos5GjRGfcHXD+Dt9GhekQXswBYEqXKICYsdD0BJP8huHLxqVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VxHo4ROf; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VxHo4ROf"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dddd7d64cdso13905ad.1
        for <asahi@lists.linux.dev>; Fri, 15 Mar 2024 14:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710538085; x=1711142885; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f8xWPRJ3tZZgN10pKFEIYzu9dCAJ11FurTmpvR2gSvg=;
        b=VxHo4ROfVqO4DZl/ZPN65wRvmSmIY7b5r26xtqbmQPv/hT2xckvTgn9j+nykRNdFaL
         eqR3yTlPjiq/q1rR4yCS3O3mDKjL2QsywHBfBNucqgn4hd6fm6RQpzk5zRA6XRfU35zq
         iurrKbv9cyWilNrKsYNLahodHqlMxILLSekJwhYtstuttba/Q3QjMUkj1L0tR04eYubB
         xAq0QiY2rjDSvSFBqf/CsL1Q7uZPIn1gJJwpeTQS5e02JLRUH5S4P8bjEs7/QHmRZhD8
         U/VJGlvJ74wn78qk/lvnwZYK8L4iFjSfnzbJfrvFGpH0L2zHL1OIn2nhLw5jQpBKFoaM
         QP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710538085; x=1711142885;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8xWPRJ3tZZgN10pKFEIYzu9dCAJ11FurTmpvR2gSvg=;
        b=PjXbK1igvInPAO5uq7YLEAgyfkcI44HFcKw9g+h6NdIY6lVynBXK/Q8XCa6mSlZ1v2
         sQ1uKZ4ow7HQu+H4SUHFVUq0fHlAPAfeVyH+Fzrqkf/YBaGMca8xUzMANcvlsUuYyvXW
         VQYI/raWyXJFRa7SES393Xm2nwTov8rbzySQoJBi/uxuuby1FiRnhBY/RtuswiadOtJA
         glXLw/di2pw6i3ipHro0AFL/GQRsr/Df3F8oLpUWy+Y66mGco9RvNiT7v9EtU7BbgqG7
         CWSjrRLWcKzL++rJuzUGnNkOBheTkDLj7xaGVSToMnyZuyJogMzOgNEaK8yPSBVt8CYv
         YBcg==
X-Forwarded-Encrypted: i=1; AJvYcCUk3j9SREgBCx6TYtXhA912QTh7ex82Xcik5FUEIl3S/7Fhv2qqCP+tm8Hzbq1qvw5L3N83G1Gv9bBHzowR34zqyMzslFs=
X-Gm-Message-State: AOJu0YyHXuAoL9vbX4Ji+xTSdbZ+ctNttUR25leYwjOmeOp9Tw1kW5wB
	nef8ZsH6uD0RA5QuRCfaRgN6d1xU+vWLp4dKKSQNhMRuI6usjDe3xZy3nuuOLA==
X-Google-Smtp-Source: AGHT+IFx0V9evEEHTCAL0rngEMSTSxrVQJwAPcZMZ/kTvEYdGlomkmF5ttVwWUPGQnGpzwrxLolHsQ==
X-Received: by 2002:a17:902:ea0b:b0:1dd:96e5:feae with SMTP id s11-20020a170902ea0b00b001dd96e5feaemr291145plg.16.1710538084580;
        Fri, 15 Mar 2024 14:28:04 -0700 (PDT)
Received: from [2620:0:1008:15:59e5:b9a4:a826:c419] ([2620:0:1008:15:59e5:b9a4:a826:c419])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001dddb6c0971sm4396163ple.17.2024.03.15.14.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 14:28:03 -0700 (PDT)
Date: Fri, 15 Mar 2024 14:28:02 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
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
    rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
    suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
    thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
    vdumpa@nvidia.com, wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com, 
    bagasdotme@gmail.com, mkoutny@suse.com
Subject: Re: [PATCH v5 02/11] iommu/dma: use iommu_put_pages_list() to releae
 freelist
In-Reply-To: <20240222173942.1481394-3-pasha.tatashin@soleen.com>
Message-ID: <34b593bb-796b-7657-8971-17d24dea4e99@google.com>
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com> <20240222173942.1481394-3-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Feb 2024, Pasha Tatashin wrote:

> Free the IOMMU page tables via iommu_put_pages_list(). The page tables
> were allocated via iommu_alloc_* functions in architecture specific
> places, but are released in dma-iommu if the freelist is gathered during
> map/unmap operations into iommu_iotlb_gather data structure.
> 
> Currently, only iommu/intel that does that.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: David Rientjes <rientjes@google.com>
