Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DA13368A7
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 19:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781724197; cv=none; b=VmZo9Dk1mNwsqp6MWCvCRtFy6XK/Kkfjh3t42R8ShFxjEIWlPRb4nh9nLSC7MEFI4vyarKiZ7DYGFulg+yTwXWjE7+EnvHJle5xY7MbLlgC6TkCPaXWRFl3868figSG/gDLeVPaG4yrExfZufn5LFzTQe5JKMeDzagiFhNhr2Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781724197; c=relaxed/simple;
	bh=sylUrKe46saGnhLfpr867FeGJbONgmD7qOHzkUWpTIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FhPH5tTdbtnsZk/mf9ebI7m8LgfJBf5zqGMo2jQ9SGHcGfEVUzoonh/G+zNeleluZCxTkFPU3sc/LdaZq1/QLZIO0ipMLODvb6z77UzN0XbwRmFHWrrOjGqeoB6fFoTgpczhhwtyJgI9BJvCq68XyR2++JfrcPRHMQuj5mzuakU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=tqd/kfqH; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="tqd/kfqH"
Message-ID: <e105c7b2-a5eb-4b5d-955f-685058143e9d@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1781724186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q95z5sSwV0dy1C5J3NyKld/x09FNzHMWpBLFQlV9hHw=;
	b=tqd/kfqH3RdtyPcHKJDRPI47WkWqqfGkXsX0OKIGPHYKTOg5o0f7Bx+cfN/3JNunA2dQeM
	QHKAK6m6G3oNIsVh6YHi9VVb41N0zM7N2f5waMA32xcjXLGNi5c3mRhuIgnDVLrDKMdUwR
	PipDFusEt8zDAHXc4maOVOKI6uav9Z8=
Date: Wed, 17 Jun 2026 21:23:03 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
To: Will Deacon <will@kernel.org>, Yureka Lilian <yureka@cyberchaos.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>
References: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
 <ajAT9fWgOd9HY7ei@willie-the-truck>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <ajAT9fWgOd9HY7ei@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/26 17:02, Will Deacon wrote:
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
> How can you guarantee that we don't run one of these prior to patching?

We can't, but there are a few points to our advantage, namely the boot 
cpu isn't actually affected by this (when the CYC_OVRD bits are not 
configured or not supported), and first round of patching happens quite 
early before the other cpus are started.

>
> I wonder if we're better off doing something like x86 and having an "idle="
> cmdline option. which could choose between e.g. nop, wfe, wfi and yield, for
> example?

This is a good idea.

We also considered using nohlt, however this doesn't disable the use of 
wfit in __delay (which I confirmed to also lose register state with 
sufficiently long timeout values), and it would prevent us from enabling 
a psci based idle later. So it seems a new parameter is needed.

> In fact, would wfe be a better choice than nop for you?

Regarding wfe: Simply replacing the wfi with wfe on these particular 
machines leads to them getting stuck in the boot process (entering wfe 
on the boot core and never waking up again), maybe because some kinds of 
interrupts do not count as as events for the wfe wake-up?

>
> Will


Best regards,
--
Yureka Lilian<yureka@cyberchaos.dev>


