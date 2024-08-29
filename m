Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0E81AE850
	for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 14:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940423; cv=none; b=sAo+yPyCpFmYyKvD9ZiMmoh8Cx/n8vvjyvvt1f3oJLBuLz828hzt7Ue752K17cBOIMLQN0PgbJlMFNr7SfBYbs3qeiI2f+LHYv6nhOdDPkgJGDKZlFFCurDG2Fu7MiuUwq3SAippBom1F+vh9v3nRM/NJNADzX3jT/lvzwZyc10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940423; c=relaxed/simple;
	bh=Dnc97RZIVh4Cs30Qnu+fHSGTdzuC4rmOQI0ZaXzgC7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwA+SZvuood/xL1o1Q8PjUWpzaDb1C3/n+vlOjFa9+e0LXraumGWrhhIAzAkCvw4CPMDxRLFO82GXDoZEu2aADZ+iPj2zvC2fCtiyRnbhqm12Ml10drg2oqX0zIyVHkVPi5rDEpZ5CP4gozvwz3YZORkrRWPdVhBc6RJHZ9Gsmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/O14l/0; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/O14l/0"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7142e002aceso575597b3a.2
        for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724940421; x=1725545221; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iK1IVOMJIxyZnFgv4BStIpf1YlI4C67hPRkMhKa7i/g=;
        b=F/O14l/05a32YELpsFWDdFQAvPQ94WZY4flxbRWlJ7gRKgTmZPzFSs2trxfV19emxV
         ExyLdheKIlRRdvKFL8WEKoPwAZX//yyE64iP2hSQUQqwMwY39pfCVtVT2PhG10omdnrV
         mG/JVXY/0fm4REuySgfGvUcpRavCJ4t6wVVHZW2FvWoEPMUGHRz1Bd1A7nNZifPtu7XC
         WqLB1xtY1psHPKkSfHxMEznQuQBcYI09SlYvVxi8oSjPkHjENbowPvqcMdLImxjUsAWS
         Ex0BHSWuBeiWbLiOjOIcFHD9cR+TFQovS8thCxnqCpoa+cnPzGbZUx9NsWKNr4i3pWJP
         g+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724940421; x=1725545221;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iK1IVOMJIxyZnFgv4BStIpf1YlI4C67hPRkMhKa7i/g=;
        b=sSeSnwLUzpPLCPcmE5wGKZXwBaqX7pyBcTqijr7KM4WOQeXLKuQ+5Cnc/pmJDbe+WR
         rCS9RJoUP04RRJmafl4sqOIcNHWsvlTvF4TSOhPiqp+7pUEBl+xSzugZFtzGOS1K6J6s
         ClN1vz9ZFsYwq+6+N363dnIQVL3E/ftXxoy1XG6FsJ+xWYG8P5Ei7AdoZ2jv7WSfZjfY
         OpOGyupFJQbE2ZLye8sMrot2sC/eo+SEJGWBAeGIWXY27QtEQKD0kCP387GrdQwlIVhj
         pouOt7P2r28jx0nqXyLnMlmILF9Ban8VDfY/i9+fv9aeoQKbE8ogi0wRXI5i+Acw9JcR
         16ow==
X-Forwarded-Encrypted: i=1; AJvYcCX64NBfi/QQepb2aRYSISorHYryl4+3JrV84ijrRCXXHT6jd4eqOM4iskQ/pSpeg/uW2+/B8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YypAuo8wsFqVjL9X4u4HyR79FUGrjgK+P9BqdFfysX1bPJWyiWn
	6+br/tgTPM1ZeHpdc1xvt4+svRfjN+YK5NezhNcs1VOhA3LTnpEN
X-Google-Smtp-Source: AGHT+IG2CyT+7KwKUd+VOi3UxpXYONelmRV4w2rkII4YQ8l9bIrb2V+UgLmErP8YyjI2/5thiSzKwQ==
X-Received: by 2002:a05:6a00:1798:b0:70e:91ca:32ab with SMTP id d2e1a72fcca58-715dfaea829mr3436412b3a.6.1724940420644;
        Thu, 29 Aug 2024 07:07:00 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55b9c4esm1192104b3a.92.2024.08.29.07.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 07:07:00 -0700 (PDT)
Message-ID: <e6377027-c4e5-4fd2-abf4-63cf6282542d@gmail.com>
Date: Thu, 29 Aug 2024 22:06:56 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 3/3] irqchip/apple-aic: Add a new "Global fast IPIs
 only" feature level
Content-Language: en-MW
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht
References: <20240829110436.46052-1-towinchenmi@gmail.com>
 <20240829110436.46052-4-towinchenmi@gmail.com>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20240829110436.46052-4-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/8/2024 19:02, Nick Chan wrote:
> Starting with the A11 (T8015) SoC, Apple began using arm64 sysregs for
> fast IPIs. However, on A11, there is no such things as "Local" fast IPIs,
> as the SYS_IMP_APL_IPI_RR_LOCAL_EL1 register does not seem to exist.
> 
> Add a new feature level, used by the compatible "apple,t8015-aic",
> controlled by a static branch key named use_local_fast_ipi. When
> use_fast_ipi is true and use_local_fast_ipi is false, fast IPIs are used
> but all IPIs goes through the register SYS_IMP_APL_IPI_RR_GLOBAL_EL1, as
> "global" IPIs.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/irqchip/irq-apple-aic.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
> index 626aaeafa96c..1640074af2e1 100644
> --- a/drivers/irqchip/irq-apple-aic.c
> +++ b/drivers/irqchip/irq-apple-aic.c
> @@ -236,6 +236,8 @@ enum fiq_hwirq {
>  
>  /* True if UNCORE/UNCORE2 and Sn_... IPI registers are present and used (A11+) */
>  static DEFINE_STATIC_KEY_TRUE(use_fast_ipi);
> +/* True if SYS_IMP_APL_IPI_RR_LOCAL_EL1 exists (M1+) */
> +static DEFINE_STATIC_KEY_TRUE(use_local_fast_ipi);
>  
>  struct aic_info {
>  	int version;
> @@ -253,6 +255,7 @@ struct aic_info {
>  
>  	/* Features */
>  	bool fast_ipi;
> +	bool local_fast_ipi;
>  };
>  
>  static const struct aic_info aic1_info __initconst = {
> @@ -271,6 +274,16 @@ static const struct aic_info aic1_fipi_info __initconst = {
>  	.fast_ipi	= true,
>  };
>  
> +static const struct aic_info aic1_local_fipi_info __initconst = {
> +	.version	= 1,
> +
> +	.event		= AIC_EVENT,
> +	.target_cpu	= AIC_TARGET_CPU,
> +
> +	.fast_ipi	= true,
> +	.local_fast_ipi = true,
> +};
> +
>  static const struct aic_info aic2_info __initconst = {
This patch is incorrectly disabling local fast IPI on aic2, it will be
corrected in v2.

>  	.version	= 2,
>  
> @@ -282,6 +295,10 @@ static const struct aic_info aic2_info __initconst = {
>  static const struct of_device_id aic_info_match[] = {
>  	{
>  		.compatible = "apple,t8103-aic",
> +		.data = &aic1_local_fipi_info,
> +	},
> +	{
> +		.compatible = "apple,t8015-aic",
>  		.data = &aic1_fipi_info,
>  	},
>  	{
> @@ -748,7 +765,8 @@ static void aic_ipi_send_fast(int cpu)
>  	u64 cluster = MPIDR_CLUSTER(mpidr);
>  	u64 idx = MPIDR_CPU(mpidr);
>  
> -	if (MPIDR_CLUSTER(my_mpidr) == cluster)
> +	if (static_branch_likely(&use_local_fast_ipi) &&
> +	    MPIDR_CLUSTER(my_mpidr) == cluster)
>  		write_sysreg_s(FIELD_PREP(IPI_RR_CPU, idx),
>  			       SYS_IMP_APL_IPI_RR_LOCAL_EL1);
>  	else
> @@ -992,6 +1010,11 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
>  	else
>  		static_branch_disable(&use_fast_ipi);
>  
> +	if (irqc->info.local_fast_ipi)
> +		static_branch_enable(&use_local_fast_ipi);
> +	else
> +		static_branch_disable(&use_local_fast_ipi);
> +
>  	irqc->info.die_stride = off - start_off;
>  
>  	irqc->hw_domain = irq_domain_create_tree(of_node_to_fwnode(node),

Nick Chan
