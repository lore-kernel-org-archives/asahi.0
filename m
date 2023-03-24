Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6B26118
	for <asahi@lists.linux.dev>; Fri, 24 Mar 2023 14:00:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F4A211FB;
	Fri, 24 Mar 2023 07:01:23 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.55.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9FE53F71E;
	Fri, 24 Mar 2023 07:00:37 -0700 (PDT)
Date: Fri, 24 Mar 2023 14:00:34 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Janne Grunau <j@jannau.net>, Will Deacon <will@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drivers/perf: apple_m1: Add Apple M2 support
Message-ID: <ZB2tAqs/o/QSI4XD@FVFF77S0Q05N>
References: <20230214-apple_m2_pmu-v1-0-9c9213ab9b63@jannau.net>
 <20230214-apple_m2_pmu-v1-2-9c9213ab9b63@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214-apple_m2_pmu-v1-2-9c9213ab9b63@jannau.net>

On Tue, Feb 14, 2023 at 11:38:02AM +0100, Janne Grunau wrote:
> The PMU itself is compatible with the one found on M1. We still know
> next to nothing about the counters so keep using CPU uarch specific
> compatibles/PMU names.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Mark Rutland <mark.rutland@arm.com.

Will, I assume that you'll pick this up.

> ---
>  drivers/perf/apple_m1_cpu_pmu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
> index 979a7c2b4f56..83b74c7fe63f 100644
> --- a/drivers/perf/apple_m1_cpu_pmu.c
> +++ b/drivers/perf/apple_m1_cpu_pmu.c
> @@ -559,7 +559,21 @@ static int m1_pmu_fire_init(struct arm_pmu *cpu_pmu)
>  	return m1_pmu_init(cpu_pmu);
>  }
>  
> +static int m2_pmu_avalanche_init(struct arm_pmu *cpu_pmu)
> +{
> +	cpu_pmu->name = "apple_avalanche_pmu";
> +	return m1_pmu_init(cpu_pmu);
> +}
> +
> +static int m2_pmu_blizzard_init(struct arm_pmu *cpu_pmu)
> +{
> +	cpu_pmu->name = "apple_blizzard_pmu";
> +	return m1_pmu_init(cpu_pmu);
> +}
> +
>  static const struct of_device_id m1_pmu_of_device_ids[] = {
> +	{ .compatible = "apple,avalanche-pmu",	.data = m2_pmu_avalanche_init, },
> +	{ .compatible = "apple,blizzard-pmu",	.data = m2_pmu_blizzard_init, },
>  	{ .compatible = "apple,icestorm-pmu",	.data = m1_pmu_ice_init, },
>  	{ .compatible = "apple,firestorm-pmu",	.data = m1_pmu_fire_init, },
>  	{ },
> 
> -- 
> 2.39.1
> 
