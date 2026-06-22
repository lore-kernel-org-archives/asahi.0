Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CAA2749F1
	for <asahi@lists.linux.dev>; Mon, 22 Jun 2026 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116751; cv=none; b=hgNc3+8s0WeA5geb+wew8IxzIdx0l/d/Ts7cMMybFJhCuLFa0Rvdh2W0hpAWcO9z9mcI3XVuaDJ/57wufCQlpje7FuDP3Qkt5OF6F+GEUIJdXZAtT0RUR3lIZNMEvAsq8kHjkbtUa0e8lmfxf8nTBF8WGbv6wlWiMthCnXkSC1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116751; c=relaxed/simple;
	bh=hA5oBlxJork1c4h5sHlQY0FI6yyM6hvjSrny1zE1RN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmTOQTMkC9lC3BgboplkS9PhYDpi89RmLXLaYcqF3lDTq8MO06KW2kVficYZ0UiVhYb6wKHEyMCe9sPpmZyzvUKfUb5/Z8UT3GKQsGj3w+UQtQCO8oQZfNkC6/O1Y7T+wLlcjRHK6e5Zzv74Qbh/rd/BiTgWrZGZAes94KQbZwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdsZChOi; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdsZChOi"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so1580286a91.0
        for <asahi@lists.linux.dev>; Mon, 22 Jun 2026 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782116746; x=1782721546; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=urde0H5lw+l0w07oCZ5gmtixK9Wy1aHPm4CdpLxWffg=;
        b=HdsZChOisXlePT+g1MmHnvKBguC6B5PATeaDF6sEJMz3R/JMg//9FyoZLFDzLAtCxc
         OiwzAuhwyq6QiNlCj5r2ReDY+AzdYmvJ2CBHuldXLYUKg9V/LRIjk65qQG5hNCUWz9Kc
         LcU6axtorIBFPDgwE9yvfShhIj8tx5qQ1W21lI6CLrvKxeLTdi+u4PGfsvqXcECnex6k
         aTdIFsJxJ0uQGhN3ElLuAWKw+ReOCwknVEs0RcvurDAOf0RjWXYmG+JZDBa1d+QM2f3E
         /hzaE8NGCuGO+Y1COt6ZafeZOAZVMPY0PqBc/E1bls/lwpguFw6r+u4XfegIv0y0wMBP
         KUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116746; x=1782721546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urde0H5lw+l0w07oCZ5gmtixK9Wy1aHPm4CdpLxWffg=;
        b=BEAOyqyJkak40dy7ujFODAKYfGuAbHWmXDgPneRMVYpw/e9Nl4DFNOc182BTVqlAiR
         Mlm2HTRpcGzFfHXmPs8zl8tQ/T7iBdZ4L8Irbba2D8Wrajkn4uydUJz84R/Bf0Rx3SND
         v+BhjeEJ8tc+kvbSb0RYhk3M+J0mA+8m+L21n7LlENGWk0O9+tP/H7/WhhMdIn6xil+s
         DlHlXCR7dKsvtiz+AzpEf2Rq3RbfzjSP3qxRuJY021/4g5m9R5XB+b6xOI3h7cPpm2mP
         WEFvwKj8/EBiKEHRn5E/PaH+DbQ/ylcaY5mSWmkh+l8sC/wHRNreAqorn1a7h8rnQeTR
         Dzwg==
X-Forwarded-Encrypted: i=1; AHgh+RoafttDFezcqYYb8voUjIC/cOn7f90Z7DKGlg7klk0qzKdGys4rhjyWlzW+nQKsr9KFlNMbcA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0KP56oDhEBOQxX2KGaI6GtL/UrS6ZDsIoG2e8KgXU9C7J62X+
	pJakCs08VsMzLPIysBqYJcb7fQLkacPlZS2YxBoZaKOzj/vz/15KS9aRSQ4qNhjvjiI=
X-Gm-Gg: AfdE7clHjnRrZlXpx8t3SuJUm8pKMYAcfKB44OxTca+L8UOY10ZR68nRbXyP57IW993
	QfEyMbquU4/bTE6Nmi7AqIDi2vIQtKc8eHIOAZy9XJb5EAUswWLsXQ5EdWTMMx9PdqjwkA++a85
	E2bRmKHv6XslU0+qCNUfon83Yh0V9FJghf21CnOX8kk7nyTu4ZTFA43tEfHrSTw2ec9oCr65uQT
	k025TOI4uo9kUdDhrGHXEw7jUdQjdPbxftCUMOAfAYCUa3bc4+h1ukEL1BS3BbyLFti+u3ch1nV
	Za1KRWORgyURp+TR6s85KYMmotHBhLNOrfrKiikSsaTcqmUuNjCPf5VCitUbeetXioK1o6oErCG
	BZ5EKwQfiSngRUGv/AytWWkJOxSTbtN6sE1ggZJP13Ig/uqX3bIffPjE1gRH/Nq2sEMZuh8Qk74
	sLOD5FdlAr7reBX0mdXmrPWtg=
X-Received: by 2002:a17:90b:3d47:b0:37c:18e0:90e4 with SMTP id 98e67ed59e1d1-37d4d71da02mr9453775a91.2.1782116745540;
        Mon, 22 Jun 2026 01:25:45 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af310sm71822885ad.2.2026.06.22.01.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:25:44 -0700 (PDT)
Date: Mon, 22 Jun 2026 13:55:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: sven@kernel.org, j@jannau.net, neal@gompa.dev, rafael@kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: apple-soc: Add missing OPP table cleanup on
 init failure
Message-ID: <p4gog5paa5czqzho6i4chgsncyjxsfau5zu3lkxwtkplk2y2f5@l3sa7gohfnqw>
References: <20260622063148.751787-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622063148.751787-1-haoxiang_li2024@163.com>

On 22-06-26, 14:31, Haoxiang Li wrote:
> apple_soc_cpufreq_init() adds the OPP table with
> dev_pm_opp_of_add_table(), but some later error
> paths can return without removing it.
> 
> Add the missing dev_pm_opp_of_remove_table() call
> to clean up the OPP table on init failure.
> 
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index 9396034167e5..4dae968e84df 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -260,7 +260,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  	ret = apple_soc_cpufreq_find_cluster(policy, &reg_base, &info);
>  	if (ret) {
>  		dev_err(cpu_dev, "%s: failed to get cluster info: %d\n", __func__, ret);
> -		return ret;
> +		goto out_remove_table;
>  	}
>  
>  	ret = dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
> @@ -326,6 +326,8 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  	dev_pm_opp_remove_all_dynamic(cpu_dev);

This driver doesn't add any dynamic (non DT) OPPs, looks like this is incorrect
?

>  out_iounmap:
>  	iounmap(reg_base);
> +out_remove_table:
> +	dev_pm_opp_of_remove_table(cpu_dev);

This is also required to be done in apple_soc_cpufreq_exit() ?

>  	return ret;
>  }

-- 
viresh
