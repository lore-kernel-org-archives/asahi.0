Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1734DD318
	for <asahi@lists.linux.dev>; Thu, 16 Feb 2023 05:29:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id BDDF341F5F;
	Thu, 16 Feb 2023 05:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1676525377;
	bh=e6DAgQRi5MFXTXSKQZA5Z1t1Z/OvapR2NonqZSP/OUw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NU3rs1LqYtg8Hh/lQkJIUmAKRvW2ml0vNJvOELF8xlQqbflM+up8ovJSjPEd6zjoE
	 zd3yVg4cvasPJCorOA6pOMi2H5XFMhEWM2m4cKNXop8FAt2YsM9iXc3UCFENJWd3+J
	 wXua6CiNIQ1z3NZBHyU7fuS13t9DWxO6puuIBJxmJ6z7oL9vNS3LQiI1oJcYIVbR2c
	 on5eln9raV/kdlqgACd4+zXLClEWqxlpvuBEW1jAehPFUdHkwcq6++ASBVlorca9vj
	 F3MmKP0TLOdk0rdgDQU9vyi2iISdiaowsUc0eaD8yTAwW9nsk0gVRkgH2Jh8Q8EiNs
	 2RrBNtKCvh6ig==
Message-ID: <90f3e529-715c-f7b1-da2d-1de7798aa248@asahilina.net>
Date: Thu, 16 Feb 2023 14:29:33 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] arm_pmu: Invert fallback armpmu_filter() return value
 (*6.2 regression*)
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ravi Bangoria <ravi.bangoria@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20230215-arm_pmu_m1_regression-v1-1-f5a266577c8d@jannau.net>
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <20230215-arm_pmu_m1_regression-v1-1-f5a266577c8d@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/02/2023 20.27, Janne Grunau wrote:
> Fixes a regression in "perf: Rewrite core context handling" for arm_pmu
> based drivers without a filter function pointer as the Apple M1 PMU.
> The event is ignored if filter() returns 'true' opposite to
> filter_match(). The refactoring failed to invert the return value if
> arm_pmu has no filter() function pointer of its own.
> 
> Fixes: bd2756811766 ("perf: Rewrite core context handling")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/perf/arm_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 9b593f985805..9cb22f36cf66 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -556,7 +556,7 @@ static bool armpmu_filter(struct pmu *pmu, int cpu)
>  	if (ret && armpmu->filter)
>  		return armpmu->filter(pmu, cpu);
>  
> -	return ret;
> +	return !ret;
>  }
>  
>  static ssize_t cpus_show(struct device *dev,
> 
> ---
> base-commit: ceaa837f96adb69c0df0397937cd74991d5d821a
> change-id: 20230215-arm_pmu_m1_regression-b6dd48d0c792
> 
> Best regards,

Tested-by: Asahi Lina <lina@asahilina.net>

This fixes `perf` being completely broken on 6.2. Adding a note to the
subject, I hope this can get picked up before release...

~~ Lina
