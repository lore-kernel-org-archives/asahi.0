Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D98B1A76BE
	for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724939297; cv=none; b=irEBF9ER+lxGj9nO05AY1f8K5hR6vCCkpQ8WyzUhFPcXs8f9vUMOlKuA4nz1pO+MJcNpSutIbhlinYtc5GnuZHoyP1QoLou1UDf/u5lPKxFKmLZOBPCxuPXyIsqHkA6vfB7xuPfyPtqof3mo+VAol4k7pdSF3xOXCFhzk4F5JJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724939297; c=relaxed/simple;
	bh=bMd2+0+v0C0vkmvZ0a7gm12/MK8cw71SBn03PAdEUug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7DJD6jgFscx7APGEdeEQYrpPTJLHgLI7B16HeO53gSIJz+YlYuL78CBO1ThQ+YlzCwiOz0SoWVvTKjdnsphsdRmsRQDTnUWrBlo6wMdtkWftn4FrxwJSjdRdbHC707zddrS0bCpVog4SrvedS1Q184B6tO+pIbTJpVzrtjTaNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mj282zOM; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mj282zOM"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5d608060241so429736eaf.1
        for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 06:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724939295; x=1725544095; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fij7bmUZ1BwtygZobmPkPFaBK/SFCbQ/kLne1FVouMA=;
        b=Mj282zOMgz3SU+D4RdhDkoA2FMfnFsYqVJT+cIOE9KV4XzMVYW+AAhSL1SMUFgXDLr
         vs7OBeiUtYPfDllndvqpeRh9BmFnSmu0BQ8CCrxo1+swONSoaZpL9vFf8fGDsxyjpRCj
         0Lf8x5N/VIAo34hAyr4A91Xl5Mr9hfs48ln4wGzMzHX09jnwXDbeagcwhsXuecNRSIYj
         os92YkEwMEEjy2E9lZ3QnpBXKMe0/R1taNLO8GbNVPynrxCWmWJJv10RO7PdC9nGckDs
         dvhMsUYEiol2m7txGttJggbi0KK2/xZHHdAnYTLW681yY4bdgcfislfdEOBTt3vh0Ywn
         BubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724939295; x=1725544095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fij7bmUZ1BwtygZobmPkPFaBK/SFCbQ/kLne1FVouMA=;
        b=Nq3dFmMz0hJZFcrWtohbWnEuxyBbvvqbUtQgTWEoY2Ye1pdK4JBSXv6yCT9gN1I0tZ
         njMCYm1dH+LYG9OC5zAbWbqnbu/l26kc8exQuIA1FH//bJ8YK7hARKwI62v3M0AlS/XK
         CCiAXZRzj0DgCLFJDhslfmILYJbP42ljKhwIK2WzqnBZ11XQNvdBxsoR+yGHJ4KYaRIq
         tICrYsjnF6h9zFbFkWNU7AIDUiOMyfEQxI3p7haruNHaMvcPZ5KrAQOMbOBGUbe/SNAw
         298nS4yUfYllAIF/iMPwl7D0Qv1gwOua0NYHreEjGVtCJ21Y07kdVE8Gss78xZOKFnuV
         BMqw==
X-Forwarded-Encrypted: i=1; AJvYcCUMa78Me7QIQQ/PdMu2IQkH4JWABI5hxWT9CjlqsTbZIf3Q6HJxTu3+3tvLt8Itn6HzcJhETw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIp3AiawedtJUte4zJHf9LVR3OwZMVwD0RkZEpn9VFnwuaP9Hb
	xKecX0aKVe2paVNGCFwb108SOMMTU062zHOxk9EbojZMwN8ZquvK
X-Google-Smtp-Source: AGHT+IGCpp26qT5ACYfhkp4StVnu7Amwf484YTNlNSrglEKytGqqjoOG91Qqwhfb8r2kOPo+eK2/Zw==
X-Received: by 2002:a05:6359:4c10:b0:1a5:6b71:dde6 with SMTP id e5c5f4694b2df-1b603bebb88mr396283355d.3.1724939294686;
        Thu, 29 Aug 2024 06:48:14 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e66d8f4sm1236270a12.0.2024.08.29.06.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 06:48:14 -0700 (PDT)
Message-ID: <18007fe0-cc5d-4887-ab41-ed4cf8217b60@gmail.com>
Date: Thu, 29 Aug 2024 21:48:10 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 2/3] irqchip/apple-aic: Only access IPI sysregs
 when use_fast_ipi is true
Content-Language: en-MW
To: Thomas Gleixner <tglx@linutronix.de>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20240829110436.46052-1-towinchenmi@gmail.com>
 <20240829110436.46052-3-towinchenmi@gmail.com> <87zfova32u.ffs@tglx>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <87zfova32u.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29/8/2024 21:08, Thomas Gleixner wrote:
> On Thu, Aug 29 2024 at 19:02, Nick Chan wrote:
>> Starting from the A11 (T8015) SoC, Apple introuced system registers for
>> fast IPI and UNCORE PMC control. These sysregs do not exist on earlier
>> A7-A10 SoCs and trying to access them results in an instant crash.
>>
>> Restrict sysreg access within the AIC driver to configurations where
>> use_fast_ipi is true to allow AIC to function properly on A7-A10 SoCs.
> 
> use_fast_ipi is an implementation detail and does not mean anything
> here. It's sufficient to say:
> 
>    Only access system registers on SoCs which provide them.
> 
> Hmm?
Seems like a good idea. Will be in v2. Though if the commit message
is that generic, do you think it's correct to squash the third patch
into this commit? It is also preventing sysreg access on SoC that
do not provide them.

> 
>> While at it, remove the IPI-always-ack path on aic_handle_fiq.
> 
> It's not while at it. It's part of handling this correctly.
In v2 it will be mentioned as as part of the sysreg access restriction.

> 
>> If we are able to reach there, we are on an IPI-capable system and
>> should be using one of the IPI-capable compatibles, anyway.
> 
> 'we' can't reach that code ever.
> 
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog
Acked. In v2 the commit message will not impersonate the code anymore.

> 
> 
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> 
> This Signed-off-by chain is invalid. If Konrad authored the patch then
> you need to have a 'From: Konrad ...' line at the top of the change log.
> 
> If you worked together on this then this needs a Co-developed-by
> tag. See Documentation/process/...
This patch was entirely made by Konrad, but now that changes are requested,
it will be a Co-developed-by in v2.

> 
>>  
>> -	if (read_sysreg_s(SYS_IMP_APL_IPI_SR_EL1) & IPI_SR_PENDING) {
>> -		if (static_branch_likely(&use_fast_ipi)) {
>> -			aic_handle_ipi(regs);
>> -		} else {
>> -			pr_err_ratelimited("Fast IPI fired. Acking.\n");
>> -			write_sysreg_s(IPI_SR_PENDING, SYS_IMP_APL_IPI_SR_EL1);
>> -		}
>> +	if (static_branch_likely(&use_fast_ipi) &&
>> +	    (read_sysreg_s(SYS_IMP_APL_IPI_SR_EL1) & IPI_SR_PENDING)) {
>> +		aic_handle_ipi(regs);
>>  	}
>>  
>>  	if (TIMER_FIRING(read_sysreg(cntp_ctl_el0)))
>> @@ -574,8 +571,9 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
>>  					  AIC_FIQ_HWIRQ(irq));
>>  	}
>>  
>> -	if (FIELD_GET(UPMCR0_IMODE, read_sysreg_s(SYS_IMP_APL_UPMCR0_EL1)) == UPMCR0_IMODE_FIQ &&
>> -			(read_sysreg_s(SYS_IMP_APL_UPMSR_EL1) & UPMSR_IACT)) {
>> +	if (static_branch_likely(&use_fast_ipi) &&
>> +	    (FIELD_GET(UPMCR0_IMODE, read_sysreg_s(SYS_IMP_APL_UPMCR0_EL1)) == UPMCR0_IMODE_FIQ) &&
>> +	    (read_sysreg_s(SYS_IMP_APL_UPMSR_EL1) & UPMSR_IACT)) {
>>  		/* Same story with uncore PMCs */
>>  		pr_err_ratelimited("Uncore PMC FIQ fired. Masking.\n");
>>  		sysreg_clear_set_s(SYS_IMP_APL_UPMCR0_EL1, UPMCR0_IMODE,
>> @@ -811,7 +809,8 @@ static int aic_init_cpu(unsigned int cpu)
>>  	/* Mask all hard-wired per-CPU IRQ/FIQ sources */
>>  
>>  	/* Pending Fast IPI FIQs */
>> -	write_sysreg_s(IPI_SR_PENDING, SYS_IMP_APL_IPI_SR_EL1);
>> +	if (static_branch_likely(&use_fast_ipi))
>> +		write_sysreg_s(IPI_SR_PENDING, SYS_IMP_APL_IPI_SR_EL1);
>>  
>>  	/* Timer FIQs */
>>  	sysreg_clear_set(cntp_ctl_el0, 0, ARCH_TIMER_CTRL_IT_MASK);
>> @@ -832,8 +831,9 @@ static int aic_init_cpu(unsigned int cpu)
>>  			   FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_OFF));
>>  
>>  	/* Uncore PMC FIQ */
>> -	sysreg_clear_set_s(SYS_IMP_APL_UPMCR0_EL1, UPMCR0_IMODE,
>> -			   FIELD_PREP(UPMCR0_IMODE, UPMCR0_IMODE_OFF));
>> +	if (static_branch_likely(&use_fast_ipi))
>> +		sysreg_clear_set_s(SYS_IMP_APL_UPMCR0_EL1, UPMCR0_IMODE,
>> +				   FIELD_PREP(UPMCR0_IMODE, UPMCR0_IMODE_OFF));
> 
> Please see the bracket rules in the tip maintainers doc.
Acked. Brackets will be added to function references in commit message
of v2.

> 
> Thanks,
> 
>         tglx

Nick Chan
