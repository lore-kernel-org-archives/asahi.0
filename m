Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2267B175A94;
	Fri, 19 Jun 2026 12:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872827; cv=none; b=QpaIxMaVRnXYin5e59AEE1YN+yWG6WQHd4+GmuuQtZFscGWlArsVDh3NRoHUf5nIRtYEn/Y1TA2AkNwrb4te93MXaO38wvfQ/RFjfjB5BmuB8DQVNYtvx38O0j79coggDWQSAGqhnYtmSB2to9lyF6EMDlgKW/k/dbrqVbDAL1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872827; c=relaxed/simple;
	bh=Cb3ZdyA/Sygb+HYjSu6xZpfCpdsuvwMnjdWRp17jzUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PnrPFIhvzKI35x9RrSigsbcNZoljCMLcJecnC0F1UucPrEcrsdF4X3ZyqjYh9VJ4iaqRC6MnVx+7/AqCpCKJbKF4i/4DPfzXQtjXPH/QX5U9uxf7AzUYDBjmxPxZrvMvavo6U+X2vqbmk3WZ0V14DG/NG8rF7Hm6xPnrwdvqea4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gC9ulqpz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gC9ulqpz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289751F00A3F;
	Fri, 19 Jun 2026 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781872825;
	bh=rOBaUSm33VpCqiY2t4y4oxN3NFma2nf9WA0jw5TShzk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gC9ulqpz0uaCD850OKmHaouCJxZTZ3JKNmvg5he4r4YKSBKv4Shi1dCDP+xGSN4Ez
	 lqZU4COkz48vcwlWGXuIcBEYeFZ9z0vE6cdcgzTkeIuMSi+/lgVmJIgX2ExVRNG2RD
	 bjPyaDsUrkMy9kCCVV7PaSwUqVwwSPi3w2l8/ePbT6hx4KHZgj0pHbBiL2LjJJjoJL
	 MGnz9bixozCSNSXHshyxbxaKevLtVCMVHbTwVJjm+p56hNJgHsAYI8q5VU2Jlbc5Zc
	 baoq1URKHCJu9v6Ig5/oTqlXfrX4lInB6yQQ0b0eHaPHEj1YQN+0wL/x8z17O5rFm1
	 RpWLffNvRt3fQ==
Message-ID: <c13d95d0-911f-48f6-b4ca-8a5e9aacef6c@kernel.org>
Date: Fri, 19 Jun 2026 14:40:22 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
To: Mark Rutland <mark.rutland@arm.com>, Yureka Lilian <yureka@cyberchaos.dev>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>
References: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
 <ajAT9fWgOd9HY7ei@willie-the-truck>
 <e105c7b2-a5eb-4b5d-955f-685058143e9d@cyberchaos.dev>
 <ajUbcv75FuSPPi9o@J2N7QTR9R3>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <ajUbcv75FuSPPi9o@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/19/26 12:38, Mark Rutland wrote:
> On Wed, Jun 17, 2026 at 09:23:03PM +0200, Yureka Lilian wrote:
>> On 6/15/26 17:02, Will Deacon wrote:
>>> On Mon, Jun 15, 2026 at 02:21:36PM +0200, Yureka Lilian wrote:
>>>> Apple Silicon CPUs can lose register state in WFI, leading to crashes
>>>> in the idle loop early in the boot process.
>>>> This applies to any previous Apple Silicon CPUs too, but is worked
>>>> around by configuring the WFI mode in SYS_IMP_APL_CYC_OVRD sysreg
>>>> during m1n1's chickens setup.
>>>> This workaround no longer exists since M4.
> 
> Are we *certain* that there's no equivalent control elsewhere? i.e. this
> hasn't just moved?

We are as certain as we can be short of Apple confirming this which 
isn't going to happen.
XNU has a helper function to "force wfi to use clock gating only" [1] 
which is how we learned about this control originally on M1.
This has been disabled starting with M4 using the "NO_CPU_OVRD" define 
which they describe as "CPU_OVRD register accesses are banned" [2]. If 
there was an equivalent control elsewhere I would expect them to just 
use that one instead.

In addition most non-architectural sysregs are read-only starting with 
M4 in the non-Apple-entitled boot mode so even if there was such a 
control we would likely not be able to access it.


[1] 
https://github.com/apple-oss-distributions/xnu/blob/f6217f891ac0bb64f3d375211650a4c1ff8ca1ea/osfmk/arm64/machine_routines_asm.s#L1129
[2] 
https://github.com/apple-oss-distributions/xnu/blob/f6217f891ac0bb64f3d375211650a4c1ff8ca1ea/pexpert/pexpert/arm64/board_config.h#L197

> 
>>>> Add a workaround capability for replacing wfi and wfit with nop, and
>>>> an erratum to enable it on the affected CPUs if the workaround using the
>>>> sysreg is not already applied. Leave the decision whether the sysreg
[...]
>>>> +	} while (0)
>>> How can you guarantee that we don't run one of these prior to patching?
>>
>> We can't, but there are a few points to our advantage, namely the boot cpu
>> isn't actually affected by this (when the CYC_OVRD bits are not configured
>> or not supported), and first round of patching happens quite early before
>> the other cpus are started.
> 
> I think you're saying that:
> 
> * On the boot CPU, WFI *never* loses register state.
> 
> * On other CPUs, WFI *might* lose register state (and this cannot be
>    inhibited).
> 
> Is that understanding correct, or are there other conditions where a WFI
> on the boot CPU can lose register state?

Those are our current observations, yes. We don't know why the boot CPU 
behaves differently and there no differences in any Apple sysregs that 
would explain it.

But looking at all wfis in the kernel there are bunch in head.S and 
similar for infinite loops where we don't care if register state is 
lost. The only two that currently matter are a wfit in __delay and the 
wfi in the idle loop.
The __delay one gets enabled after arm64_features are found which 
happens just before arm64_errata from setup_boot_cpu_features() and 
there's no __delay call inbetween that and when alternatives are 
applied. If we follow Will's suggestion with an early_param that happens 
much earlier as well.
My understanding is that the idle loop won't be reached before 
sched_init() and that also happens much later.

> 
> IIRC kdump doesn't ensure the new kernel is started on the boot CPU, so
> I think that would be broken. I guess you can't kexec generally due to a
> lack of offlining of secondary CPUs.

Next to that, kexec also runs into issues with all the various 
co-processors which we can't easily reset or shut down once they've been 
brought up once.


Sven

