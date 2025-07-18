Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62601990A7
	for <asahi@lists.linux.dev>; Fri, 18 Jul 2025 20:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752871566; cv=none; b=MVrf5gZpnOw8JG7Big8ydYyxjqdtAanw9AN9w/GYr44uoKpUJVd75ktEZk+4pbfCFRTwPPXr6ja1dYOKIpYKHLEi4SeXg/MzkFXv0YAtwrgeKM6H4rQHfMt0R6fgQopJTpb/s+VPlQytlyOMtva1lp6QRqUtWvycfsRryLSvGZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752871566; c=relaxed/simple;
	bh=uXAK2LcN+D1aB2LwqkwZRyXZHRbBhvjT7o6KbAa+ppk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GY0HganyK4cEcXLq2FdEuR7eixw3bjYmgA844XVYm6ec74kzw4nYnyFscPiKq/i5T6ZOE9du3yVrU/0yhsTWtbXDIdvm5jbIUFZkRoZVGnKvqzE2oDtEKv/A+o8xbW2WQvdMIOZjY4TK7fcv957vyQlCf2QDUT6fcUg3NpExBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3a/0Xr5; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3a/0Xr5"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so2073795a91.2
        for <asahi@lists.linux.dev>; Fri, 18 Jul 2025 13:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752871564; x=1753476364; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uXAK2LcN+D1aB2LwqkwZRyXZHRbBhvjT7o6KbAa+ppk=;
        b=M3a/0Xr5h3S8ePMDqJiXxdPC6Z6W7kbyRt6pUHIqytVlauHj/v850MeU261bzkVb4H
         8Zys6/XBlSAiwd7g8wqSFJglHWWrW7bxiM97cIs1ZNSkBpYhRBlvYibRZRpUFq29Zk2G
         w06cM1I7rhapCIWH53S11yodVrpDP8W0LbtoUiNyeWEqoqsNxPAW4rDrNYS4Vr862FQi
         VDyExPyNLbDB/EifR8yoKuQIvQzD9MIm6UexoZIZ22rM7zDW6nmilagsQzdjq1OFYcF2
         QXwWoqRFr/Lh3DrfcayX443GJo6jRgkOBLcMZ0dQu+b5ngcXEgkcNdYKAnOpV/32cIYw
         Likg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752871564; x=1753476364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXAK2LcN+D1aB2LwqkwZRyXZHRbBhvjT7o6KbAa+ppk=;
        b=HLrORULy16CvDixYks2eeplZR0VBBI6MCJk9CIzz2Z4L1nvKpSUkPS3CyzLjSCPuID
         JYevBtTI7kck7ckQ1aed1pqkuY8j6Qs2laRyufx3oOLDvrt8GAPDefsxgexD8/aahgcO
         0161xsjFvLH57Ok43U6YgRLXeJg3zXUBYt4ws8bF4KTLnmQnUdW0an/6IQ9oaAVIkZ28
         n8sLL46M0+rVC15vYJ2gGxvpjAw3KaQPp/0eGz1Bxw0FXoy2Wkyu8gIrQ9+yKSbh9+Lg
         tdJS9VNgti12HguRR5KoCAO+Ob2cOMZif3B0PGM1rt3Fl78r06wz85UB2JdhvZSrHUxy
         jnag==
X-Forwarded-Encrypted: i=1; AJvYcCVZsgQfRXCh7ekQ+pxDPp2cgHOj8mmhCNyx+EJmIZbjpWQl26EUZ/OpHgbsmRkdjSMmv1tSIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ+G38mBn38Nh2UAUtKW0egMTqz8eB1R736ieDeQIpk/RSJpff
	5TJrfHtX8DChrw16RSGGz8ykeS/JGqp0vL7WuFngmypQRGGkQnPSywiZ
X-Gm-Gg: ASbGncuihoD/VI6JjyiaDl1s9hvjIUfO6Duw0BbhSpCgLyrH2nfRKOj9V6NwJTwr6Fy
	Vxplt5hoiB2BQgrJxEaq5uToof3HW6HmoujW6on4wqNbUGcBJ0yxLK+jvAZ4bs40OkfzxM2CRHY
	XmdJJHO8IhUgnqo4gad5/mwWz2Ee10EmNrBSZZb+S66/MlBPXlNiXl4RW34W202cq4ShKbqawcE
	ECNKoHNKiIofxu5lySf/ub10eMfc4JDnlVFwfMaWzKwTYQ0b8Y2mT6mkQKhdwUgVhwsu6RPfCy0
	wPFUys/2EMvAIiMal9jQh48wlA+sGQoXV51ijsz1Jkh2RvKNSNLlVSb7UI0dxILaFP5yuhqFVGm
	ZphKli+nlxre5xEyyjwWSGkvdBqUj9f/iLq8omCEJRHKkYrk8bcmicAU94N3JB/U=
X-Google-Smtp-Source: AGHT+IFfAzmfpnYky0WJeFj+PkACVQRkUKSaLnIxhEt/NV8Uzws4ecq5iTsonExxyL5PHW/z3ZTr5A==
X-Received: by 2002:a17:90b:3cc6:b0:30a:4874:5397 with SMTP id 98e67ed59e1d1-31c9e6fbb09mr17031670a91.9.1752871563843;
        Fri, 18 Jul 2025 13:46:03 -0700 (PDT)
Received: from [192.168.0.109] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b61566bsm17746325ad.81.2025.07.18.13.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 13:46:03 -0700 (PDT)
Message-ID: <2b69fbd1-067e-4ff4-8ea4-88e32763209a@gmail.com>
Date: Sat, 19 Jul 2025 04:45:58 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <aHUeUMmn_19EayL1@willie-the-truck>
 <be327242-ad55-476a-bed4-44c33c263962@gmail.com>
 <aHkRJdAuvhS2mNQj@J2N7QTR9R3>
 <705f1dfb-7e1b-4930-a1a9-c763299a4305@gmail.com>
 <aHph5u4-b6mfggPv@J2N7QTR9R3>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <aHph5u4-b6mfggPv@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Mark Rutland 於 2025/7/18 夜晚11:01 寫道:
> On Fri, Jul 18, 2025 at 01:00:45AM +0800, Nick Chan wrote:
>> On 17/7/2025 23:05, Mark Rutland wrote:
>>> On Mon, Jul 14, 2025 at 11:59:36PM +0800, Nick Chan wrote:
>>>> Will Deacon 於 2025/7/14 夜晚11:12 寫道:
>>>>> On Mon, Jun 16, 2025 at 09:31:49AM +0800, Nick Chan wrote:
>>>>>> Patch 8-12 adds support for the older SoCs.
>>>>> ... but I'm not sure if anybody actually cares about these older SoCs
>>>>> and, even if they do, what the state of the rest of Linux is on those
>>>>> parts. I recall horror stories about the OS being quietly migrated
>>>>> between CPUs with incompatible features, at which point I think we have
>>>>> to question whether we actually care about supporting this hardware.
>>>> The "horror" story you mentioned is about Apple A10/A10X/T2, which
>>>> has a big little switcher integrated into the cpufreq block, so when the
>>>> cpufreq driver switch between states in the same way as on other
>>>> SoCs, on these SoCs that would silently cause a CPU migration. There
>>>> is only one incompatible feature that I am aware of which is 32-bit EL0
>>>> support.
>>> Surely the MIDR/REVIDR/AIDR also change?
>> They do not change. ID_AA64PFR0_EL1 also does not change (fixed 0x12).
>> What *does* change however is MPIDR. (P-cores has bit 16 set while
>> E-cores do not)
> The MPIDR changing isn't ok either. You might get away with that today,
> but that's not supposed to change behind the back of the kernel.
>
> Is there anything else that can change, or are we absolutley certain
> that *only* MPIDR changes?

Only MPIDR changes, and the state of bit 16 in MPIDR is consistent across all PEs. (At any
given moment, either all PEs are backed by efficiency cores, or all backed by performance
cores)

>
>>>> As mentioned above, it does all work fine when CONFIG_EXPERT is not
>>>> enabled, and if it is enabled, then 32-bit process may crash with illegal
>>>> instruction but everything else will still works fine.
>>> I don't think that's quite true, unless these parts are also violating
>>> the architecture.
>>>
>>> If the CPU doesn't implement AArch32, then an ERET to AArch32 is
>>> illegal. The way illegal exception returns are handled means that this
>>> will result in a (fatal) illegal execution state exception being taken
>>> from the exception return code in the kernel, not an UNDEF being taken
>>> from userspace that would result in a SIGILL.
>> Speaking from experience, when testing with the userspace cpufreq governor,
>> trying to run AArch32 code on the ecores really does result in illegal
>> instruction for that process while everything else remains fine.
>>
>> Referencing ID_AA64PFR0_EL1, the E-cores does claim to support
>> AArch32 EL0, even though they could not execute it for real.
> Ok, so that's a clear violation of the architecture, and doesn't fill me
> with confidence about anything else.

Regarding this, the hardware also needs to handle the case where the PE is already in AArch32
EL0 and migration to E-cores is attempted. In this case there is no exception return happening so
the behavior of the hardware is not as bad as it sounds.


>
>>> I do not think that we should pretend to support hardware with silent
>>> microarchitectural migration. So at the very least, we do not care about
>>> A10/A10X/T2.
>> As explained above, what actually happens on the hardware is different
>> from what you believed, so please do reconsider.
> Different certainly, but still problematic.
>
> I maintain that we should not pretend to support this hardware.
>
> Mark.
>
Nick Chan
