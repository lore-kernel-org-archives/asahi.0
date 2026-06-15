Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75113F1678
	for <asahi@lists.linux.dev>; Mon, 15 Jun 2026 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528353; cv=none; b=tocmdn0ej0gtbVefs7yQeeyiMxyqolTnmn0nUoNw5ukE71upDQoi7k6Bf3f0l5+zw1Wt16dyWsxEZa3R3HCz0VHWlX9Lej2OLYa7Iq1SRmaYKH4g1DOfFLPat/2p/wbhxSfVO/VFFoT81Cu820R6U3Uv36DO9arot8Ve3/R/M/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528353; c=relaxed/simple;
	bh=3V1Gmj1n3unllfbjwB+8RPBQUMC7k2KfDkhsMXhF9cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOObjUDAzPWl5QcSrNRwgjOXncrDI7GDuCTXMZ+pxy+wXt42xDVgmXSXvOFzLLqqgi3fTCVavs3G+eNljijuRot6v6qF5O4bRm+3jNYg7oHaLJ0e/G3uEzW950TqhJhriM18Jx3NeKPDjoz/6yu2dxpx7soIPmPAQ0jpSgEHHQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIGMkqJ4; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIGMkqJ4"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84275887a3fso2972902b3a.1
        for <asahi@lists.linux.dev>; Mon, 15 Jun 2026 05:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781528351; x=1782133151; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gQCDKBQNearl7mAgYMgRVjkBiOBiur5AJMNVRUQy2q4=;
        b=XIGMkqJ4ScuPAKQCq9baBK7eJWxaGtR5QGvsDDOokvm8pcglpHdjtqdA9Dq3XaxPXD
         HU4hyJDakkLaFu6kCheoet56C9NH2fHZwD0hTDi2QVHQ9zswU3E0Cf3lY5EFfQM3NPdB
         FOCia7E7lHc5E6AdSCR0/uKvDW3lacMZzCOqRvNidFRQ43mqk5rHc5zqkmPGqSjoIELL
         fcbNS/xfa1M/61cZr9xePDp5qtBywf0xPIIaqYEi1kfiQC0Aup3fQbuDEx9WKaEN8umv
         IE5B9bAYYDsHMTl/Bi4ejwlZG6AwfGMMLuRFd0z3JoFwROSb6pxAmGe9lnPi+14avHqW
         ZbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781528351; x=1782133151;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQCDKBQNearl7mAgYMgRVjkBiOBiur5AJMNVRUQy2q4=;
        b=Tpi9dXxsDfQviSqSBRr3BrWU8m5KSf8qU7cxMjSTs3ws/ccWeyGoO/ZpB6GIFdPnYO
         YBEPsTn4ZWbuiSWjODLRV/29c/nJ5tjLkwjcUpumL1qbkyJWmeuY70K8XGYrNrwDq6xq
         JpMXcL2GFzmJ4iTInodCD1eyGM8ficivfTfVziZf2y9abBF1ebjxKnArZd9tSK6U7Mkm
         o3e1r2nlnXVW1oOuNWZYPkaNgKqLMUL0MGXRFaKUoGu0ztOj/yrjdNeSj95TUBR2c1Go
         mDIzlOJXB7pWyQB8gZCa8gvcJ5iFOpBtaZ7s+gPLMDbEjy12iXAZ3jrmtDoNAT/zJFsG
         FV0w==
X-Forwarded-Encrypted: i=1; AFNElJ8Pp6k8347SsAQ1dwDWMY8t7MhcG4NOg4cdomR4yiwBBkJCoYXknN30Kw+M3dsv7WcDJc2avg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLooaoyjtXy9vxHcbBDLdmb5zvHkH0VIcNqkJwOrLEdUGFo9DM
	gNPKlzvKNQB4H2bTS5slDoL0OunnUGsjPgQyg6mOXxNsw8Zpp85KdU4IB/0tWcW0
X-Gm-Gg: Acq92OFNqceE7uiODSUVpmREcXVuxtWxXhRykjPJHvC3m42wfnctGi6d7vK5vEglmib
	kduqUTHzoyQ3X3Gza6vLo/mX1Myu9aET51AX/cMmkfJUe+PSjNn1rlnoY0GXiRl6MvO0bjFPlSK
	D9k1+EIYe5GufcURg202wASsksTBOURNoumCOf92qBokOjNp5EP1WFm9E/aMWjh27tnjJO0u/L4
	6umz5Dync48AySZRq0o88yXuHDFVsP7N4NEAmPMVPu/QNw74p+tFnBXqBoGmvF2TDaAITqNbed4
	0HQQUgGsofjTDy8F/ofmcta4Rc9RCH1ChfDE1Dp1n0rfFK3pBE/F1J7i6PaG4ODvqYUeLmKi1F3
	B/VBwGvfobvyFkh8nTE2OtIHDFviFR+oKwV9vOiA3c1npfqJ9ziYXJl1RPA9UH9lrexnimQaGi5
	mVoEenKPkA20L76xdj1KwGsnHXfbhwiHY=
X-Received: by 2002:a05:6a00:4b55:b0:842:307b:b9d0 with SMTP id d2e1a72fcca58-843497c819dmr11672053b3a.30.1781528350979;
        Mon, 15 Jun 2026 05:59:10 -0700 (PDT)
Received: from [192.168.1.111] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b009e67sm12056399b3a.42.2026.06.15.05.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:59:10 -0700 (PDT)
Message-ID: <7d9eef31-2193-4593-8976-7c7659843bf2@gmail.com>
Date: Mon, 15 Jun 2026 20:59:06 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
Content-Language: en-MW
To: Yureka Lilian <yureka@cyberchaos.dev>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>
References: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Yureka Lilian 於 2026/6/15 晚上8:21 寫道:
> Apple Silicon CPUs can lose register state in WFI, leading to crashes
> in the idle loop early in the boot process.
> This applies to any previous Apple Silicon CPUs too, but is worked
> around by configuring the WFI mode in SYS_IMP_APL_CYC_OVRD sysreg
> during m1n1's chickens setup.
> This workaround no longer exists since M4.
> 
> Add a workaround capability for replacing wfi and wfit with nop, and
> an erratum to enable it on the affected CPUs if the workaround using the
> sysreg is not already applied. Leave the decision whether the sysreg
> workaround can be used up to the earlier parts of the boot chain which
> already configure the Apple Silicon chicken bits.
> 
> This alternative has to be applied in early boot, since otherwise some
> cores might enter the idle loop before apply_alternatives_all() is run.
> 
> Reviewed-by: Sasha Finkelstein <k@chaosmail.tech>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Changes since v1:
> Restricted the erratum to EL2 only, since in EL1 we'd expect the
> hypervisor to trap WFI and handle the erratum.
> 
> Tested on M4 and M4 Pro (which now sometimes nondeterministically
> crash later during boot).
> Successfully booted on M3 Max with the SYS_IMP_APL_CYC_OVRD
> workaround disabled in the bootloader, as well as A18 Pro (which,
> like M4 / M4 Pro, doesn't have SYS_IMP_APL_CYC_OVRD).
> 
> There is probably a better place for the SYS_IMP_APL_CYC_OVRD
> defines, which I currently put in the middle of cpu_errata.c, but I
> wouldn't know where.
> ---
>  arch/arm64/Kconfig               | 12 ++++++++++++
>  arch/arm64/include/asm/barrier.h | 19 ++++++++++++++++---
>  arch/arm64/kernel/cpu_errata.c   | 21 +++++++++++++++++++++
>  arch/arm64/tools/cpucaps         |  1 +
>  4 files changed, 50 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b3afe0688919..8c8ff069856f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -453,6 +453,18 @@ config AMPERE_ERRATUM_AC04_CPU_23
>  
>  	  If unsure, say Y.
>  
> +config APPLE_ERRATUM_WFI_STATE
> +	bool "Apple Silicon: WFI loses state"
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around some
> +	  Apple Silicon CPUs losing register state during wfi and wfit
> +	  instructions.
> +
> +	  As a workaround, the wfi and wfit instructions are replaced with nop
> +	  operations via the alternative framework if an affected CPU is
> +	  detected.
> +
>  config ARM64_WORKAROUND_CLEAN_CACHE
>  	bool
>  
> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index 9495c4441a46..f72eddc7c434 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h
> @@ -20,9 +20,22 @@
>  #define wfe()		asm volatile("wfe" : : : "memory")
>  #define wfet(val)	asm volatile("msr s0_3_c1_c0_0, %0"	\
>  				     : : "r" (val) : "memory")
> -#define wfi()		asm volatile("wfi" : : : "memory")
> -#define wfit(val)	asm volatile("msr s0_3_c1_c0_1, %0"	\
> -				     : : "r" (val) : "memory")
> +#define wfi()							\
> +	do {							\
> +		asm volatile(					\
> +		ALTERNATIVE("wfi",				\
> +			    "nop",				\
> +			    ARM64_WORKAROUND_WFI_STATE)		\
> +		: : : "memory");				\
> +	} while (0)
> +#define wfit(val)						\
> +	do {							\
> +		asm volatile(					\
> +		ALTERNATIVE("msr s0_3_c1_c0_1, %0",		\
> +			    "nop",				\
> +			    ARM64_WORKAROUND_WFI_STATE)		\
> +		: : "r" (val) : "memory");			\
> +	} while (0)
>  
>  #define isb()		asm volatile("isb" : : : "memory")
>  #define dmb(opt)	asm volatile("dmb " #opt : : : "memory")
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 1995e1198648..8c9a194eddc4 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -309,6 +309,19 @@ static void cpu_enable_impdef_pmuv3_traps(const struct arm64_cpu_capabilities *_
>  	sysreg_clear_set_s(SYS_HACR_EL2, 0, BIT(56));
>  }
>  
> +#ifdef CONFIG_APPLE_ERRATUM_WFI_STATE
> +static bool has_apple_erratum_wfi_state(const struct arm64_cpu_capabilities *entry, int scope)
> +{
> +#define SYS_IMP_APL_CYC_OVRD   sys_reg(3, 5, 15, 5, 0)
> +#define CYC_OVRD_WFI_MODE_MASK GENMASK(26, 24)
> +	if (read_cpuid_implementor() != ARM_CPU_IMP_APPLE)
> +		return false;
> +	if ((read_sysreg(CurrentEL) >> 2) != 2)
> +		return false;

Nested vitrualization exists, and may be supported by KVM or macOS HVF.
Additionally, presumably the workaround should be applied under m1n1 hypervisor.

The solution is less clear. A reliable way to detect bare metal or
"almost bare metal" is checking for "apple,arm-platform" using
of_machine_is_compatible(), but that involves performing a non-CPU check inside a
CPU errata function, so that do not feel right to me.

Best Regards,
Nick Chan


> +	return FIELD_GET(CYC_OVRD_WFI_MODE_MASK, read_sysreg_s(SYS_IMP_APL_CYC_OVRD)) != 2;
> +}
> +#endif
> +
>  #ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
>  static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
>  #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1009
> @@ -1009,6 +1022,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  		.matches = has_impdef_pmuv3,
>  		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
>  	},
> +#ifdef CONFIG_APPLE_ERRATUM_WFI_STATE
> +	{
> +		.desc = "Apple WFI loses state",
> +		.capability = ARM64_WORKAROUND_WFI_STATE,
> +		.type = ARM64_CPUCAP_SCOPE_BOOT_CPU | ARM64_CPUCAP_OPTIONAL_FOR_LATE_CPU,
> +		.matches = has_apple_erratum_wfi_state,
> +	},
> +#endif
>  	{
>  	}
>  };
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 9b85a84f6fd4..bbf8c15d79b0 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -128,3 +128,4 @@ WORKAROUND_REPEAT_TLBI
>  WORKAROUND_SPECULATIVE_AT
>  WORKAROUND_SPECULATIVE_SSBS
>  WORKAROUND_SPECULATIVE_UNPRIV_LOAD
> +WORKAROUND_WFI_STATE
> 
> ---
> base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
> change-id: 20260614-wfi-erratum-7a9f305f601f
> 
> Best regards,
> --  
> Yureka Lilian <yureka@cyberchaos.dev>
> 
> 

