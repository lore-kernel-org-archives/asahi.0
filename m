Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F321F0E3E
	for <asahi@lists.linux.dev>; Thu, 12 Dec 2024 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734001576; cv=none; b=V9FZb2eEbYAW4w9FoQ04A964eNiOV5UImWioSGrIZQX2s+rabPz5z3plRPyjjd+Vfgj/gj1EgYY53VapZ238cJExL0sfedWxsv9yRQejdlqvhmGglH5WZhZFa31EVa+VDdDZd5AUeRBqk6od9C8wQ85WY4CtjQOT7JU0mIBZZ5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734001576; c=relaxed/simple;
	bh=oML95mrGXOC77mLMvinkJsFpvbyZj1YKqWGARW5kZ1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=b3rHOjtH0H3hhQHhWvJxF5sgqaNssCIqoYjin0ZV/LKi54mYPi/j9UDnOMQ/DTzOK0EVumLZYC1/rVYl/OfDWZKRY4Rsl7dJjt/xHyPIJ3hnncshWXE2xzzwiUDKFYDh3QdepSJ1aPBCzaFn6Psf4guNr3V5iHNkEMlrAz61+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BBC4153B;
	Thu, 12 Dec 2024 03:06:42 -0800 (PST)
Received: from [10.1.37.59] (e127648.arm.com [10.1.37.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 883B53F720;
	Thu, 12 Dec 2024 03:06:11 -0800 (PST)
Message-ID: <df140f26-496d-44ce-8363-ffc908f2effa@arm.com>
Date: Thu, 12 Dec 2024 11:06:09 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] cpufreq: apple-soc: Set fallback transition
 latency to APPLE_DVFS_TRANSITION_TIMEOUT
To: Nick Chan <towinchenmi@gmail.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Asahi Linux <asahi@lists.linux.dev>,
 Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
 Linux power management <linux-pm@vger.kernel.org>,
 Devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
 <20241212070344.3858-7-towinchenmi@gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20241212070344.3858-7-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/24 07:03, Nick Chan wrote:
> The driver already assumes transitions will not take longer than
> APPLE_DVFS_TRANSITION_TIMEOUT in apple_soc_cpufreq_set_target(), so it
> makes little sense to set CPUFREQ_ETERNAL as the transition latency
> when the transistion latency is not given by the opp-table.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Christian Loehle <christian.loehle@arm.com>

> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index 94e57f055a5f..c9f31a3653e2 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -291,7 +291,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	transition_latency = dev_pm_opp_get_max_transition_latency(cpu_dev);
>  	if (!transition_latency)
> -		transition_latency = CPUFREQ_ETERNAL;
> +		transition_latency = APPLE_DVFS_TRANSITION_TIMEOUT * 1000;
>  
>  	policy->cpuinfo.transition_latency = transition_latency;
>  	policy->dvfs_possible_from_any_cpu = true;

