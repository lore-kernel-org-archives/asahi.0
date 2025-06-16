Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97E22641C3
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070124; cv=none; b=vBWPGcXFATf67LrpUDfx8gWsIIJr4ftU4y8zDEloccQTwRCdYnCCFQ7MhQcsn3ZuQFpfJw9knRRN4712uKjCFJATht0ERryp8yeS0oF57mtXDjKRMHzgj/FjcTcbZ2bUmmmSIbSyP7okmR5M2rcntxKD7VKtVRZacw1zLn+sM94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070124; c=relaxed/simple;
	bh=tCl2CCqSLeN+qCH95sifJaz4OfHJ2wMdp+GPdk1+BwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VF3zT49U7bk0KHMBKa4axOeGVMlV6zooAfCDLtFg6kbAIvaNUag+DfORqn5GZDQ1iRGQJhyeS8HKPA6q7i2T8vF8iP1ToTKnFlyZAppRbI+MxmLuh8GIoh+vLVZWjjKUyhCha52+FA4fM06LdcK5T8nz+x4LAtccGd0cVjir8NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmE4wdCw; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmE4wdCw"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b3192eab3c9so1757773a12.3
        for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750070122; x=1750674922; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmJJ47Yl2sCB6HxmNoBfzW8fAWTLqNnW7h4ybZSA7aU=;
        b=UmE4wdCwaPgiAcFaOX8miWci5wwuD8OfiOdQpMXxln315BEZsrPxrmOMQ7IWK0JHhj
         /bzDQWr96DOGG6/AItNY2AyXToncTU5TBjZH9GyOlflYgL4qEsIwYWE8bZHMxDYa4kdE
         /vdQv9HVqlVGfuMRdB8MyPMTPVPjSjgjZa53M4jysyx7X/GmC3hMmSdm4NYouHeoKhY6
         E7YzGToyxQlo8NCbMqCXjfgiTXFU1YgNHKWry7QT7XLoQhsp1IHnD/jDQnRt1526ncbP
         UjPTXrehJfnApOpkn7LzOuK5F/1q/wVvklDfhV9akXz+O1D+eJBqsjw8ePoRxYA1w4Pf
         DICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070122; x=1750674922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmJJ47Yl2sCB6HxmNoBfzW8fAWTLqNnW7h4ybZSA7aU=;
        b=C0znATa1gCA/IakiN5MfHDJvdKULIcdzXC3mFD+wlARefHCxNyxkRYWRcNGbFMpV0r
         1UlMzPvq1s9TCh8wjTiPmyCehfq30uePe/f/JprWXV0Ek9PCbqz/F4cHkS17ujMznrGT
         fmff/44PMmuob/SAMnthwQY26IeyvPTWJcpU58+GOpgqbr/4trtyZTvURCE0jCy1mhBP
         cTu4DvyqMzShSVgfrXc++/9qofF+VtMYV9ciNotNS0mI68v1xX5ByG8i3C/jMvp4iDGl
         sKdQoXstekNHImM0lcnySRJRnE/cFCJ2KUg0Nae9UTdjF2xM3xpK1z6LanUfUnsctthJ
         9STg==
X-Forwarded-Encrypted: i=1; AJvYcCWAIEm3WO5YnKPwOaOTAvwpnM2n4wlyfmADl4ax/effKM7SoURa4+7bU7W4HuKj/q0klP7ZCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzIQxMd8x4Mk/9oiGHxC/c20/6EbPhuDjtJRkdteuHVcDFnLzE
	kN2kvmSZ+fgS4rbG0D1RHVFqGRUAe9mYJks6DeunWRHYVyDi0iBiHvqx
X-Gm-Gg: ASbGncvPOIO0JUNVmbCHlX0KGJVYirTQMVO/EMGonRiNKdkLYtGt/y7KUGr9+TIfrK1
	G4sJULNu+/noWben89YpXW96HkOfgrRcr2S3Ontl3GaEQgSNGuZvDZ3iFCvsxMoOSpbys/RJQGC
	k+KU+IEBw+w8GjLXSzWREOiJ68tNskroJZ1b756C+ugz++wiVaVw/I2SDIfafnVtSXmqHYXaBLB
	Is0Pphta91TersGOx/ftlZuoxIIH64EOATwlkykVDI4CN8L0ShjF70BY4n8zCxy1BOXcyedc7N8
	94rb263XBQ+veSkEF8lTwa0GRmPnjU42a8I8ZMgWzPu5/IQOBP8mOOT+j0/pxZqee2Yhqj7yB0k
	a5ifW3UZxNcUEKgI=
X-Google-Smtp-Source: AGHT+IEEAuoXtSS/8Y8cVnpfenEz5Q4fubnneoioJ3zpvJgndsWQBvsGH4ZDCuve092zaFDawuwG1g==
X-Received: by 2002:a05:6a20:734d:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-21fbd475bc7mr14187903637.8.1750070122101;
        Mon, 16 Jun 2025 03:35:22 -0700 (PDT)
Received: from [192.168.0.118] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1639e4bsm5525498a12.7.2025.06.16.03.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 03:35:21 -0700 (PDT)
Message-ID: <efa79e01-fb73-4808-8506-677ba45e43a1@gmail.com>
Date: Mon, 16 Jun 2025 18:35:16 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Ian Rogers <irogers@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Sven Peter <sven@kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 devicetree@vger.kernel.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Ian Rogers 於 2025/6/16 下晝5:36 寫道:
> On Sun, Jun 15, 2025 at 6:32 PM Nick Chan <towinchenmi@gmail.com> wrote:
>> This series adds support for the CPU PMU in the older Apple A7-A11, T2
>> SoCs. These PMUs may have a different event layout, less counters, or
>> deliver their interrupts via IRQ instead of a FIQ. Since some of those
>> older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
>> be enabled by the driver where applicable.
>>
>> Patch 1 adds the DT bindings.
>> Patch 2-7 prepares the driver to allow adding support for those
>> older SoCs.
>> Patch 8-12 adds support for the older SoCs.
>> Patch 13-21 are the DT changes.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> Hi Nick,
>
> This is substantial work and it looks good to me. Do you know why
> there's been little progress on landing these patches? Buggy Apple ARM
> PMU support in the kernel has led to reworking the perf tool. It seems
> best that we can have the best drivers possible.

I have no idea why the patches are taking so long. As for the buggy part I think only notable bug
has been M2's performance counter length increase from 48 to 64 (which for linux's purposes
is from 47 to 63) being overlooked[1], and I don't think there have been regressions.

It is not so much bugs, but rather lack of features. For the longest time we knew almost nothing
about the PMU events, and it is not until someone managed to extract the event names from
macOS and Apple's Apple Silicon CPU Optimization Guide[2] that we know quite a bit more
about the PMU. The event names are then added when it was determined that it is okay from
a copyright perspective[3] (it's the same as being allowed to use registers names from proprietary
ARM ARM). As for the  description the guide does have descriptions, but descriptions are more
doubtful than names from a copyright perspective so I do not know if they could be ever be added
to the userspace perf tool.

[1]: https://lore.kernel.org/all/20230528080205.288446-1-maz@kernel.org/
[2]: https://github.com/cyyself/m1-pmu-gen
[3]: https://lore.kernel.org/all/tencent_C5DA658E64B8D13125210C8D707CD8823F08@qq.com/


Best regards,
Nick Chan

>
> Thanks,
> Ian
>
>> ---
>> Changes in v7:
>> - Fix a W=1 compile warning in apple_pmu_get_event_idx() as appearently using GENMASK()
>> in a function prototype causes a warning in GCC.
>> - Link to v6: https://lore.kernel.org/r/20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com
>>
>> Changes in v6:
>> - Rebased on top of v6.15-rc1 (Conflict with FEAT_PMUv3 support for KVM on Apple Hardware)
>> - Add patch to skip initialization of PMUv3 remap in EL1 even though not strictly needed
>> - Include DT patches
>> - Link to v5: https://lore.kernel.org/r/20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com
>>
>> Changes in v5:
>> - Slightly change "drivers/perf: apple_m1: Add Apple A11 Support", to keep things in
>> chronological order.
>> - Link to v4: https://lore.kernel.org/r/20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com
>>
>> Changes in v4:
>> - Support per-implementation event attr group
>> - Fix Apple A7 event attr groups
>> - Link to v3: https://lore.kernel.org/r/20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com
>>
>> Changes in v3:
>> - Configure PMC8 and PMC9 for 32-bit EL0
>> - Remove redundant _common suffix from shared functions
>> - Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b361932e88@gmail.com
>>
>> Changes in v2:
>> - Remove unused flags parameter from apple_pmu_init_common()
>> - Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com
>>
>> ---
>> Nick Chan (21):
>>       dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
>>       drivers/perf: apple_m1: Only init PMUv3 remap when EL2 is available
>>       drivers/perf: apple_m1: Support per-implementation event tables
>>       drivers/perf: apple_m1: Support a per-implementation number of counters
>>       drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
>>       drivers/perf: apple_m1: Support per-implementation PMU startup
>>       drivers/perf: apple_m1: Support per-implementation event attr group
>>       drivers/perf: apple_m1: Add Apple A7 support
>>       drivers/perf: apple_m1: Add Apple A8/A8X support
>>       drivers/perf: apple_m1: Add A9/A9X support
>>       drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
>>       drivers/perf: apple_m1: Add Apple A11 Support
>>       arm64: dts: apple: s5l8960x: Add CPU PMU nodes
>>       arm64: dts: apple: t7000: Add CPU PMU nodes
>>       arm64: dts: apple: t7001: Add CPU PMU nodes
>>       arm64: dts: apple: s800-0-3: Add CPU PMU nodes
>>       arm64: dts: apple: s8001: Add CPU PMU nodes
>>       arm64: dts: apple: t8010: Add CPU PMU nodes
>>       arm64: dts: apple: t8011: Add CPU PMU nodes
>>       arm64: dts: apple: t8012: Add CPU PMU nodes
>>       arm64: dts: apple: t8015: Add CPU PMU nodes
>>
>>  Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
>>  arch/arm64/boot/dts/apple/s5l8960x.dtsi        |   8 +
>>  arch/arm64/boot/dts/apple/s800-0-3.dtsi        |   8 +
>>  arch/arm64/boot/dts/apple/s8001.dtsi           |   8 +
>>  arch/arm64/boot/dts/apple/t7000.dtsi           |   8 +
>>  arch/arm64/boot/dts/apple/t7001.dtsi           |   9 +
>>  arch/arm64/boot/dts/apple/t8010.dtsi           |   8 +
>>  arch/arm64/boot/dts/apple/t8011.dtsi           |   9 +
>>  arch/arm64/boot/dts/apple/t8012.dtsi           |   8 +
>>  arch/arm64/boot/dts/apple/t8015.dtsi           |  24 +
>>  arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
>>  drivers/perf/apple_m1_cpu_pmu.c                | 807 +++++++++++++++++++++++--
>>  12 files changed, 871 insertions(+), 35 deletions(-)
>> ---
>> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>> change-id: 20250211-apple-cpmu-5a5a3da39483
>>
>> Best regards,
>> --
>> Nick Chan <towinchenmi@gmail.com>
>>
>>
