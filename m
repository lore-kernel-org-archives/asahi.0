Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E104403EBE;
	Mon, 15 Jun 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781537284; cv=none; b=uVFKHcQlNUw4qQuhFKgYBkf3fWTMx1cy6LZDWlniwIoLuGH4cCgWaHVtWqGnTqXwPQd+QIOZHtuOXnSafL5us+Xu/GRXLR3PiZ6X5edBLBe/nHe4S23iggyKlcOYH0O9Cgis070xHAKdqzVks10IIb2h2oKbr3x6g5kwVjK8Zm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781537284; c=relaxed/simple;
	bh=ztP9n10+REOMsguNxHAiAEwIdcpv6F777s03Mce9vF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSwcvDqZTY7SYflbMG9OUj1qIYNZHundAFM/F9DG4IN9/tPWGnVCFUGfht+kzA8uxe2ZWIBcU+J4lWomLROzu8bNdEMkEI5EsTrXsqBk0O5ir4y4wenIZEIYiCKM+0MNipAVX4sjec/xDWGtsUi4giKHrQpenxCkMgSBBSRq2lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j98OzfUM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j98OzfUM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33221F00A3A;
	Mon, 15 Jun 2026 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781537283;
	bh=rwEtHSfL9+M1JoHBDck2NmycQ9jDd8imR/CJrjIJ+SI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=j98OzfUMnY8KLCN2dMb90EVO5432sPP+SqVCwD9qQfBhtE2f/i5MFB2Ylhn7+LK5I
	 e/Ok1zgZaiW2gxv6QEYyjfFhVvk2QqXADb59/K9Q0pAMjUT9T0ajn5dipxJj2kOdfD
	 2+WZm4uOu1Plb0lZ822Kqrnpo5exKIakB26MgNHYENkUb4UfPfm2hcH6Ids6/QdXtN
	 p76ysY6Hv+/Rv6Bt4UH/6J1d7j/cE1wJmqRMAhd2hUyvEzHSrK24xGqXUXxfqFDisP
	 P41anJDMTQuu7Rm3efBqS1ISXFfsFnU3nlayWMfGeR71XtmQdrSqi6SP8uYhLjTfYO
	 gaI3QEGXhjRWA==
Message-ID: <99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org>
Date: Mon, 15 Jun 2026 17:27:59 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
To: Will Deacon <will@kernel.org>, Yureka Lilian <yureka@cyberchaos.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>
References: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
 <ajAT9fWgOd9HY7ei@willie-the-truck>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <ajAT9fWgOd9HY7ei@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.06.26 17:02, Will Deacon wrote:
> On Mon, Jun 15, 2026 at 02:21:36PM +0200, Yureka Lilian wrote:
>> Apple Silicon CPUs can lose register state in WFI, leading to crashes
>> in the idle loop early in the boot process.
>> This applies to any previous Apple Silicon CPUs too, but is worked
>> around by configuring the WFI mode in SYS_IMP_APL_CYC_OVRD sysreg
>> during m1n1's chickens setup.
>> This workaround no longer exists since M4.
>>
>> Add a workaround capability for replacing wfi and wfit with nop, and
>> an erratum to enable it on the affected CPUs if the workaround using the
>> sysreg is not already applied. Leave the decision whether the sysreg
>> workaround can be used up to the earlier parts of the boot chain which
>> already configure the Apple Silicon chicken bits.
>>
>> This alternative has to be applied in early boot, since otherwise some
>> cores might enter the idle loop before apply_alternatives_all() is run.
>>
>> Reviewed-by: Sasha Finkelstein <k@chaosmail.tech>
>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>> ---
>> Changes since v1:
>> Restricted the erratum to EL2 only, since in EL1 we'd expect the
>> hypervisor to trap WFI and handle the erratum.
>>
>> Tested on M4 and M4 Pro (which now sometimes nondeterministically
>> crash later during boot).
>> Successfully booted on M3 Max with the SYS_IMP_APL_CYC_OVRD
>> workaround disabled in the bootloader, as well as A18 Pro (which,
>> like M4 / M4 Pro, doesn't have SYS_IMP_APL_CYC_OVRD).
>>
>> There is probably a better place for the SYS_IMP_APL_CYC_OVRD
>> defines, which I currently put in the middle of cpu_errata.c, but I
>> wouldn't know where.
>> ---
>>   arch/arm64/Kconfig               | 12 ++++++++++++
>>   arch/arm64/include/asm/barrier.h | 19 ++++++++++++++++---
>>   arch/arm64/kernel/cpu_errata.c   | 21 +++++++++++++++++++++
>>   arch/arm64/tools/cpucaps         |  1 +
>>   4 files changed, 50 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index b3afe0688919..8c8ff069856f 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -453,6 +453,18 @@ config AMPERE_ERRATUM_AC04_CPU_23
>>   
>>   	  If unsure, say Y.
>>   
>> +config APPLE_ERRATUM_WFI_STATE
>> +	bool "Apple Silicon: WFI loses state"
>> +	default y
>> +	help
>> +	  This option adds an alternative code sequence to work around some
>> +	  Apple Silicon CPUs losing register state during wfi and wfit
>> +	  instructions.
>> +
>> +	  As a workaround, the wfi and wfit instructions are replaced with nop
>> +	  operations via the alternative framework if an affected CPU is
>> +	  detected.
>> +
>>   config ARM64_WORKAROUND_CLEAN_CACHE
>>   	bool
>>   
>> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
>> index 9495c4441a46..f72eddc7c434 100644
>> --- a/arch/arm64/include/asm/barrier.h
>> +++ b/arch/arm64/include/asm/barrier.h
>> @@ -20,9 +20,22 @@
>>   #define wfe()		asm volatile("wfe" : : : "memory")
>>   #define wfet(val)	asm volatile("msr s0_3_c1_c0_0, %0"	\
>>   				     : : "r" (val) : "memory")
>> -#define wfi()		asm volatile("wfi" : : : "memory")
>> -#define wfit(val)	asm volatile("msr s0_3_c1_c0_1, %0"	\
>> -				     : : "r" (val) : "memory")
>> +#define wfi()							\
>> +	do {							\
>> +		asm volatile(					\
>> +		ALTERNATIVE("wfi",				\
>> +			    "nop",				\
>> +			    ARM64_WORKAROUND_WFI_STATE)		\
>> +		: : : "memory");				\
>> +	} while (0)
>> +#define wfit(val)						\
>> +	do {							\
>> +		asm volatile(					\
>> +		ALTERNATIVE("msr s0_3_c1_c0_1, %0",		\
>> +			    "nop",				\
>> +			    ARM64_WORKAROUND_WFI_STATE)		\
>> +		: : "r" (val) : "memory");			\
>> +	} while (0)
> 
> How can you guarantee that we don't run one of these prior to patching?
> 
> I wonder if we're better off doing something like x86 and having an "idle="
> cmdline option. which could choose between e.g. nop, wfe, wfi and yield, for
> example? In fact, would wfe be a better choice than nop for you?

I think that should also solve the issue of detecting if we're running 
on bare metal and need this or if there's something that mitigates the 
issue (e.g. M1-M3 where we can still enable that chicken bit or a 
hypervisor that just traps wfi): Just let the bootloader decide and 
inject that cmdline option.


Best,


Sven


