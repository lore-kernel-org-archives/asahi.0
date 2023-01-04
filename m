Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44724810
	for <asahi@lists.linux.dev>; Wed,  4 Jan 2023 10:47:22 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id g16so25838337plq.12
        for <asahi@lists.linux.dev>; Wed, 04 Jan 2023 02:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lo4CbDWH5rQIwpDKpsT7Ko0Jf4o5yka9XgE6kGYtScY=;
        b=QiaBnuPeKkJBwYIjMzCNBowVDp8QgcjrjJ0KT+pW6LV5/CS8tCnNRqgnlLp+gXFdR/
         M8oXnauTZunIjGN2ptjb6ww/O/ydLR91IXactsTfOPuoAqNPJmw2B3ZiC93kVJPPithR
         S8VGSnw663Qv2wL/4rDPAgPYU2nLc7CJVhbMnZXDZ9uyjORCNQhDRhSarCjFoKkStLhV
         SKxvUmz9mAd5PSvo8OHqIlQDq6IbFAQZ+lbauxnXf3XpF7rFznrmqqz838W7Amcznpj8
         ZnebbemQwRBp3WJbZ0DIrrOxpPcukbcd+DYjzssy2yAXyPsw2HlXnH+CxOd+naQdTxC+
         lzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lo4CbDWH5rQIwpDKpsT7Ko0Jf4o5yka9XgE6kGYtScY=;
        b=Ljb1DrxWTvJgepGA0xg6T78teafVUfbWBihITh9jNab3itePE7nxLdAGgwE+8d8IN6
         1fsaUdJe5DgaGKkQS/efWB8S2r65JL53gSy7vsvcQBh8Hzn/Morb9VEJD9gz6NczuD2O
         BFI/VOA6iJvxaKH219Y3uoWX/+fBODR3lv9FQC/ye9UlI9718PIDkFT+v/jj8UMHLR27
         9rEal5v8S9gdCbTT7WOELr+/mmNU2gFoYMhU0V/EqrbB2I+VPMarDwbTHjPgKd8nMx0S
         QHU0HHVY/g+LjqYXp2oMFr6CHG7bnHPyXMNs7PeJKPI+9WVch75v4yfpDVeIlVpYJofi
         SqLQ==
X-Gm-Message-State: AFqh2kqvU0MaWtzM0o2yLlRbSGI66no8oPiHnA1u4vYrMEKiQ5GyTnlK
	pU0NDKloTc8wHOfLFlsvt3Frlg==
X-Google-Smtp-Source: AMrXdXs014YVXe/+fLfw+3f/kxOmWHIqGfpYnT+l5UhGAonPccuJD2WCMQ2+m+0wITEw4Q4lq+N1gQ==
X-Received: by 2002:a17:90a:cc0b:b0:219:5955:7570 with SMTP id b11-20020a17090acc0b00b0021959557570mr21849868pju.46.1672829241744;
        Wed, 04 Jan 2023 02:47:21 -0800 (PST)
Received: from localhost ([122.172.82.107])
        by smtp.gmail.com with ESMTPSA id z3-20020a17090a6d0300b00225daca646csm17289384pjj.34.2023.01.04.02.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 02:47:21 -0800 (PST)
Date: Wed, 4 Jan 2023 16:17:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Martin <marcan@marcan.st>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: apple-soc: Switch to the lowest frequency on
 suspend
Message-ID: <20230104104718.ppvvly4jpuufmknf@vireshk-i7>
References: <20230104102149.16263-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104102149.16263-1-marcan@marcan.st>

On 04-01-23, 19:21, Hector Martin wrote:
> Without this, the CPUs are left in a random pstate. Since we don't
> support deep idle yet (which powers down the CPUs), this results in
> significantly increased idle power consumption in suspend.
> 
> Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index d1801281cdd9..1b4e6c701860 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -280,6 +280,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  	policy->cpuinfo.transition_latency = transition_latency;
>  	policy->dvfs_possible_from_any_cpu = true;
>  	policy->fast_switch_possible = true;
> +	policy->suspend_freq = freq_table[0].frequency;
>  
>  	if (policy_has_boost_freq(policy)) {
>  		ret = cpufreq_enable_boost_support();
> @@ -329,6 +330,7 @@ static struct cpufreq_driver apple_soc_cpufreq_driver = {
>  	.fast_switch	= apple_soc_cpufreq_fast_switch,
>  	.register_em	= cpufreq_register_em_with_opp,
>  	.attr		= apple_soc_cpufreq_hw_attr,
> +	.suspend	= cpufreq_generic_suspend,
>  };
>  
>  static int __init apple_soc_cpufreq_module_init(void)

Applied. Thanks.

-- 
viresh
