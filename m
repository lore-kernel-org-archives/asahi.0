Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA20437D10C
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 06:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783060057; cv=none; b=dQ6G96KPODKKJnwgmcbRAiM2GG12e100XsknhkaLgKe8dicqgx2RW/oedVhXVvtlnMMlFOWiv4JB+7Ya2fWKSmp2Cx57SDGgDY6SgHUpDK7Cvtp2gnAsaztfqvR/52uslGqJrUAxf2aNMd9KUcXH0na8VCGavz6BVaFmHPP8xLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783060057; c=relaxed/simple;
	bh=EWc1b5nXZoq0OiHRf8WoqYanyHC84gIAhCmWZlWUj4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pav8wY+6ieyF21N28r0mIfqXfClS4EB5hXmPvy8/nN5xc15BwvjPicwYTDfFYHQ4utwRz9bsIQKXBOEAUXIqQaUuP0cbqPvomyNlhO+xAU/+f9YjPHan5v7SxrmwdTNRLa51wC4qJmX3fa8y09Gxwu94GcAz9jSwb/1UxzAWpz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F4XCy3jv; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4XCy3jv"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-37df416c44bso198266a91.2
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 23:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783060051; x=1783664851; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aQ7ByzFqI/4JyRD3MlNQLQW2E98MhssCvFL4d65wbGM=;
        b=F4XCy3jvHT6g749yMkSLry/1Pc1WNBOKgsGqMbaEeJhYcndxRMFJEUd3mTkP97Uyd+
         hHkOjNEUHIJYiHjCKFyvsLE5lLW70ZfR+uDjcKlNosb/WtU98YV4+pqGd6ahOPBZlddJ
         zHCuSrAEazgnyoKVGkdsL+CkMMuKeCFpASLTC9IGH4GXIOBgqbKuPe+8svWbM0l1O5Gg
         smOkwYDU9eQHuMldVGDfMiADWutB0gRc/3tLLCZAfxwU+kxlssvfS3+c3jVTlMtzrZWc
         sAUIAnn5+bbhm4DIPFhs9stkC045P6ZHlBUsKc5wvEqV/XJFUW6oreNULFIf1S7oO/UI
         EO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783060051; x=1783664851;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQ7ByzFqI/4JyRD3MlNQLQW2E98MhssCvFL4d65wbGM=;
        b=BR7RdnQHFNc413qHzdw8oLzr1K23ISc4Z4brvURXiULgyeEeYbRD4D0R2Myob90Ob+
         uQ6szc+2fFk65cC4Ut8VOiOKckj+pI3IJbPFdxctQqfvOQ9HeRAEeM+35gjFPxanXIye
         uR7bYgnItsu0Qm5jjTlJ4+Qs89AtFHtk+ryx8bxDSShpIgxHEshll8w9nKENa/IOKpVX
         OnH6DmxYdxrbXV4GQO5jZq2Ri6B0kAbfSWsBgjR3K8b8yExB6oGhSjugC6OL/+UQmVIB
         qsx1fPnhqybjWy+7vXvF4uYOJUlyYIHiQ+mrvin/QhzPsxQ8aXruKpFcX6172eqL8Ms0
         BmyA==
X-Forwarded-Encrypted: i=1; AHgh+RqQG6dOHYgwERaF13llo7Nh2nL1BGcTSagIERgvhQiPytcOaLRuAfNIymBI34PihimWWmrZuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyBhmwB5DhS8L5AKS6h+Hb0yJYbB2vXUN0Wk+6+qUYnbKIseXZ8
	Ds+TyZ69LTIn7SCARpjR/svlSdri6C/LaCtafp5uHwSQ4SXkU1u5pEHsMDFfJDOxELo=
X-Gm-Gg: AfdE7cme7zO3AjDmrHdWA3Z363MRPxwWx3589W4zgqUOMLAb5tt9IbHCgORSOKXrP5Z
	t6nZIcgZEJtrFL+DUkrfyuKIvelgsCAuREN2XW8ahq7P6TXH3ok6IHve5GHmm89wQAmOuZDqGgn
	+xVMegN7YAklhuH0UTYRTg+O2vtJFJBugNsq67QwWDBu3NHzPPY0I/D8nEfbCQYEQ4qfeb6/oED
	S3HbVdK2xOAj1OybuKlEnN1udy2XLE4BEvKS3RBf8hCoydOM4nPE1uEShSZYNKeSsiFE/cTc0b0
	SF0kM5ekOWFM+SrxQvYDMUeZaLTR98zjClSC8MkH+49/nWDi7wXe7JSIFrvtalNcLLAaHSAXZOV
	MJn+gKLkHg0R5SHo82EYbjKtV3TxQDelCw0mWqeDYqNI+olUyXpzJiFEDmDOs9rrBSP85lccAq+
	FuwXg+nDPKVZeR
X-Received: by 2002:a17:90b:3943:b0:37f:b447:def8 with SMTP id 98e67ed59e1d1-380baa8eaf9mr8701638a91.25.1783060050885;
        Thu, 02 Jul 2026 23:27:30 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b813cd9sm15733594eec.8.2026.07.02.23.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:27:29 -0700 (PDT)
Date: Fri, 3 Jul 2026 11:57:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: sven@kernel.org, j@jannau.net, neal@gompa.dev, rafael@kernel.org, 
	marcan@marcan.st, maz@kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3] cpufreq: apple-soc: Fix OPP table cleanup
Message-ID: <ng7qv3vtfyhzklpbsghkiqezkq2foklddd6huusb5bfsd2xksd@u5hgcjtwnac4>
References: <20260703062049.1459175-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703062049.1459175-1-haoxiang_li2024@163.com>

On 03-07-26, 14:20, Haoxiang Li wrote:
> apple_soc_cpufreq_init() adds OPP tables from firmware, but
> some failure paths do not remove them. The driver also uses
> dev_pm_opp_remove_all_dynamic(), which is not the right cleanup
> helper for OPP tables loaded from firmware.
> 
> Use the cpumask OPP helper after the policy CPU mask has been
> populated. Pair it with the matching cpumask remove helper on
> failure paths and in apple_soc_cpufreq_exit(). This also removes
> the separate dev_pm_opp_set_sharing_cpus() call, as the cpumask
> helper loads the DT OPP tables for all CPUs in the policy.
> 
> Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
> Changes in v2:
>  - Remove unnecessary cleanup calls.
>  - Remove OPP table from apple_soc_cpufreq_exit(). Thanks, Viresh!
> Changes in v3:
>  - Add Fixes and Cc stable tags.
>  - Use cpumask OPP helpers.
>  - Reorder init and failure cleanup. Thanks, Viresh!
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 36 +++++++++++------------------
>  1 file changed, 14 insertions(+), 22 deletions(-)

Applied. Thanks.

-- 
viresh
