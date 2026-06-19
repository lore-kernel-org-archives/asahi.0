Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EE9367B85
	for <asahi@lists.linux.dev>; Fri, 19 Jun 2026 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781865533; cv=none; b=BjDq8H5r08Q9tCEKSXn0xlDzqtKOFG4JoeQcQfhoWeljxpr+g2keyQJHs1502BB4+ff9NaVxtlldEi09EYeN5lh4ydSVICLEqJVc3UNV8Iy/vk/RxNCQidBEEh5EFk3p6Z7pOxqHSHmQiQz9kLWBBLJl/h5xFa0y+TjaUE/OjTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781865533; c=relaxed/simple;
	bh=t11mBFRTz90Zla5G7n2blBq+Ez2hOwWd2lYJC6xdYPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5OPgCc6tPK2jRkSeoAdoWTbz2SjgGr3Dn1RLxGiO+EFmLch8uwL8p8QEXZB7+0L3mBUAtJ11gh33RLUpWn9OQwKTbRjPtqhEEwCnk1PzDpXKivd0zO8ScTZUlP+bviGSsce4pfnZDMhq2gSyHOMvdUJ/RHw6Hm7CfGxpPUlDx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NE8H2ry4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NE8H2ry4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7BFE293F;
	Fri, 19 Jun 2026 03:38:46 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D90E3F62B;
	Fri, 19 Jun 2026 03:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781865531; bh=t11mBFRTz90Zla5G7n2blBq+Ez2hOwWd2lYJC6xdYPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NE8H2ry47HVj9GGcAtbh7MNdLemZl0UawKslCZtkX057kggI7H5ErtnFej6E5n+jS
	 chRgH2ytKdIshceZaA9iB5G6XrUjux8kMuT7ZWzlp6QZuzKK3OdFyozGXc+uB2mkFe
	 aT9sBylO4KYP2W1CsUxm+jEFfJdJhA69vPu/xMwM=
Date: Fri, 19 Jun 2026 11:38:41 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
Message-ID: <ajUbcv75FuSPPi9o@J2N7QTR9R3>
References: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
 <ajAT9fWgOd9HY7ei@willie-the-truck>
 <e105c7b2-a5eb-4b5d-955f-685058143e9d@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e105c7b2-a5eb-4b5d-955f-685058143e9d@cyberchaos.dev>

On Wed, Jun 17, 2026 at 09:23:03PM +0200, Yureka Lilian wrote:
> On 6/15/26 17:02, Will Deacon wrote:
> > On Mon, Jun 15, 2026 at 02:21:36PM +0200, Yureka Lilian wrote:
> > > Apple Silicon CPUs can lose register state in WFI, leading to crashes
> > > in the idle loop early in the boot process.
> > > This applies to any previous Apple Silicon CPUs too, but is worked
> > > around by configuring the WFI mode in SYS_IMP_APL_CYC_OVRD sysreg
> > > during m1n1's chickens setup.
> > > This workaround no longer exists since M4.

Are we *certain* that there's no equivalent control elsewhere? i.e. this
hasn't just moved?

> > > Add a workaround capability for replacing wfi and wfit with nop, and
> > > an erratum to enable it on the affected CPUs if the workaround using the
> > > sysreg is not already applied. Leave the decision whether the sysreg
> > > workaround can be used up to the earlier parts of the boot chain which
> > > already configure the Apple Silicon chicken bits.
> > > 
> > > This alternative has to be applied in early boot, since otherwise some
> > > cores might enter the idle loop before apply_alternatives_all() is run.
> > > 
> > > Reviewed-by: Sasha Finkelstein <k@chaosmail.tech>
> > > Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> > > ---
> > > Changes since v1:
> > > Restricted the erratum to EL2 only, since in EL1 we'd expect the
> > > hypervisor to trap WFI and handle the erratum.

The KVM portion doesn't seem to be implemented in this patch, so we
can't rely on that as-is.

[...]

> > >   #define wfe()		asm volatile("wfe" : : : "memory")
> > >   #define wfet(val)	asm volatile("msr s0_3_c1_c0_0, %0"	\
> > >   				     : : "r" (val) : "memory")
> > > -#define wfi()		asm volatile("wfi" : : : "memory")
> > > -#define wfit(val)	asm volatile("msr s0_3_c1_c0_1, %0"	\
> > > -				     : : "r" (val) : "memory")
> > > +#define wfi()							\
> > > +	do {							\
> > > +		asm volatile(					\
> > > +		ALTERNATIVE("wfi",				\
> > > +			    "nop",				\
> > > +			    ARM64_WORKAROUND_WFI_STATE)		\
> > > +		: : : "memory");				\
> > > +	} while (0)
> > > +#define wfit(val)						\
> > > +	do {							\
> > > +		asm volatile(					\
> > > +		ALTERNATIVE("msr s0_3_c1_c0_1, %0",		\
> > > +			    "nop",				\
> > > +			    ARM64_WORKAROUND_WFI_STATE)		\
> > > +		: : "r" (val) : "memory");			\
> > > +	} while (0)
> > How can you guarantee that we don't run one of these prior to patching?
> 
> We can't, but there are a few points to our advantage, namely the boot cpu
> isn't actually affected by this (when the CYC_OVRD bits are not configured
> or not supported), and first round of patching happens quite early before
> the other cpus are started.

I think you're saying that:

* On the boot CPU, WFI *never* loses register state.

* On other CPUs, WFI *might* lose register state (and this cannot be
  inhibited).

Is that understanding correct, or are there other conditions where a WFI
on the boot CPU can lose register state?

IIRC kdump doesn't ensure the new kernel is started on the boot CPU, so
I think that would be broken. I guess you can't kexec generally due to a
lack of offlining of secondary CPUs.

Mark.
