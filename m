Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008996;
	b=tU323nnJkfgY9V0/YxQg2aKRSf3GHJh9Uxp2JSF6b2W0ycddX2pClvZGdTeVQGfk5kER
	 5lFVhc3R+cAjDAN6Doyh7IrbE//ujTmZTCMu5VJZJwRVksXhAsQhEfsI+0618mPgEH1ZI
	 qmcE7GwY5Po0eoheltFPznEjZmtWd/XlrLBFnJTp2WG2z4ayH+weotLE1z5K6+5uQ/Zvc
	 iuYGF8hkPPAYtonpfp+3/2knCdrT+PxnIv+uDGqaV4arNB7ARtZhNcwoVQ1N6upzsdUUL
	 FBqpbDyhvFifI63t+HTpOQbUpsyBZYOuklpxKPYcF+65wjLYAo1i8eAau59O2by9FCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CsF55ZXLDTjTlBBCuvyJQs4EzU3mpk9cWSAc5sBOHaM=;
	b=2uSQLhrpt3wUuF4JLB9fDMAdkQmPbeyfaTtFcuPGLq4AYFzNN30vQpI/kEA6wDwTm3MU
	 TluJLWeq/4qEDIfAp0SiKrh7rUrlwEMyp5JLF0Xdp1R29fnO9N5ljY2uKMS/ofaKKlZNh
	 aUWPDDtXUA6aXURTR2u6gdloljMJM6p3MPsRGKCFYzugwbxcfzAtubTYuR22kLOxvPMG5
	 gnHUGz6y5MM4xZM3LTqI7SvJTWp6a3TgkqeA8+G5ImESKlfcdbfFqHcKhi1VKkFiOpift
	 lV13tPRBzhTxIT8V9eIbmg10ZTWT05+4nkOBTsfR8hzEvW3zShMYqp2BeDejIjnoTXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzikKrYW;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63365606A31C
	for <asahi@lists.linux.dev>; Wed, 18 Nov 2026 13:36:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63365606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzikKrYW
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so761728a91.3
        for <asahi@lists.linux.dev>; Wed, 18 Nov 2026 05:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795008995; x=1795613795; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CsF55ZXLDTjTlBBCuvyJQs4EzU3mpk9cWSAc5sBOHaM=;
        b=fzikKrYW4TgWSv3mmAS7dSjay2pfGwDlaRlbR5kYROv34tqGS8vaVvKCUDk/lkL6sR
         mYjTL9q4Xxr0zllwjuwglzUgWDUxthFEaYrUu8QlPV4Lp6mPFIdwK7M+HGi0YRADkak6
         QIPq/DZ3O7yrnM10AzSbEt78T3m04qZlJKY+8zdvzcYUpBCMudl/nItIfMdkKjgS0nzN
         XYs53BPEObIop3Nhoad94j8Oaj/u8Cof9eQ2vAEK5ibFgAhhCAYNxk76C3ApCryvESis
         73bZ/dAeCDuJDdvt3XLjOjSG+LYyW4I2V81S4MhaNNXk12WBJrDAH1NGGYI+37xm1wsH
         6p1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008995; x=1795613795;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsF55ZXLDTjTlBBCuvyJQs4EzU3mpk9cWSAc5sBOHaM=;
        b=dokYrEPuomQk5wUKOd1C1NlKiMKuzMAapdfEPh7W9Hy0xaO2thLAsYYOdNeXu1ZHEy
         hh2tj1NJs5RbjJZ4IvegSMYCoHjsJhEVJ2OGaIli82E7otqpShoynZ5zZBxaRx/r1tcf
         3KZCn5Jk1ONJmfBmFlQnXqIJHRJBnt/XgbA5Yc4eXjAV8miUnfeIb6RxpDt5U+16iRA1
         fGLf60Fiy9sq2UCI85p+X34kU7R9hwYcIgMrrCRLXPN/MMJwX5H/gFicwmrBhRrzUCbM
         s699vrCAfqOYsw4BZin8+OnLXEyDCJ8FodKz7jfT4Gq88dqhiq23XVCqyAlvHskfA/YH
         nXag==
X-Forwarded-Encrypted: i=1; AL+hErGtlnbhyipXhmyMIlLE8kC+/YBqiBSeXs2C3gGt3RjymbOVceOJZFaRfxFEvE+5uE7feLFYFg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8XCMp7WRsrNOQ/4kDpAaw6nIHuz7b/HBlPwtLM4LU+nja+GcRn
	qb9WblIg/fUisTzO470kxpK45QgoU+SSTpPTCH+/jcllGltvdzDL2tjT
X-Gm-Gg: AZFdTZcd+axe8iAPIZj8futwbi3OXuXmfTEmaoL+ciIEhnRvpd37JjsbXqi0Bfitb/c
	I9/KDN44fKzbMzuxJkzSrX/iG8jRruzYI86k06tAVAaO/Y+OJfsIL6TK5pnpqLY1qX+tMECwlm4
	lYlYKLUwOhjBNB3uLOClSoYwkeNYN12jRaTdnlH2BBJCKWUYquX5+9aSdrDxmlLn6dmR44LnrMI
	dy9lqzQa8oeEJ3/pZI6QxtiFxsdZEBG5zuehseTtltBD9AY7ViOVbPE94tlDuT3TPx3DhtevS0K
	v0wodQScJJu5KaRcvQlDEugeMCxnpnIZwQ4vzasjHcdfLwEz+VZU6h8TS32/t/ADkOPt2CdQmWb
	vceads1pI71cpJn26u3WdWTWp8+cPHnHyFKlfnMzvg+Qr+S/SRSj0DK/LzMbcQg0E/5kSswRD6u
	5zGVaYOl3cPw1pi47rnQbqn6cBNGnI8N/mgMR7mtlzewWM//wBR/rYqoDmKSO9NkkFE++qK+bKR
	nFI0iYYUP6gy2CFNXwefU5qqSQZ08OjgKmU0Edg6YbVBjU/J8fnGweA0nyu4YiQl1cjysc28Xxp
	gQQN4am/UEK2Shp6+98/CtNJznEWRlCGB97AtNS1uFDg+K7wuIVM
X-Received: by 2002:a17:90b:314e:b0:3b3:c930:35d1 with SMTP id 98e67ed59e1d1-3b3d07c8421mr3025084a91.51.1795008994528;
        Wed, 18 Nov 2026 05:36:34 -0800 (PST)
Received: from macbookair ([187.40.224.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6214565sm13741965ad.42.2026.11.18.05.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:36:34 -0800 (PST)
Date: Thu, 19 Nov 2026 00:36:23 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	Yuvan Shen <yuvanshen09@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v2 03/15] drivers/perf: apple_m1: Support
 per-implementation event tables
Message-ID: <av2p17j8AglpTSAz@macbookair>
References: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
 <20261107-m3-plus-pmu-events-v2-3-acf1e78da039@gmail.com>
 <864ide1hb1.wl-maz@kernel.org>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864ide1hb1.wl-maz@kernel.org>

On Wed, Nov 18, 2026 at 11:59:30AM +0000, Marc Zyngier wrote:
> On Sat, 07 Nov 2026 10:48:50 +0000,
> Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org> wrote:
> > 
> > From: Nick Chan <towinchenmi@gmail.com>
> > 
> > Use per-implementation event tables to allow supporting implementations
> > with a different list of events and event affinities.
> > 
> > Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> > Co-developed-by: Myria Sarvay <myrialsarvay@gmail.com>
> > Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> > ---
> >  drivers/perf/apple_m1_cpu_pmu.c | 113 ++++++++++++++++++++++++----------------
> >  1 file changed, 69 insertions(+), 44 deletions(-)
> > 
> > diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
> > index de4026c63afd..2ff0c2e0b737 100644
> > --- a/drivers/perf/apple_m1_cpu_pmu.c
> > +++ b/drivers/perf/apple_m1_cpu_pmu.c
> > @@ -43,9 +43,6 @@
> >   * moment, we don't really need to distinguish between the two because we
> >   * know next to nothing about the events themselves, and we already have
> >   * per cpu-type PMU abstractions.
> > - *
> > - * If we eventually find out that the events are different across
> > - * implementations, we'll have to introduce per cpu-type tables.
> >   */
> >  enum m1_pmu_events {
> >  	M1_PMU_PERFCTR_RETIRE_UOP				= 0x1,
> > @@ -167,7 +164,7 @@ static const u16 m1_pmu_event_affinity[M1_PMU_PERFCTR_LAST + 1] = {
> >  	[M1_PMU_PERFCTR_UNKNOWN_fd]				= ONLY_2_4_6,
> >  };
> >  
> > -static const unsigned m1_pmu_perf_map[PERF_COUNT_HW_MAX] = {
> > +static const unsigned int m1_pmu_perf_map[PERF_COUNT_HW_MAX] = {
> >  	PERF_MAP_ALL_UNSUPPORTED,
> >  	[PERF_COUNT_HW_CPU_CYCLES]		= M1_PMU_PERFCTR_CORE_ACTIVE_CYCLE,
> >  	[PERF_COUNT_HW_INSTRUCTIONS]		= M1_PMU_PERFCTR_INST_ALL,
> > @@ -486,11 +483,12 @@ static void m1_pmu_write_counter(struct perf_event *event, u64 value)
> >  	isb();
> >  }
> >  
> > -static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
> > -				struct perf_event *event)
> > +static int apple_pmu_get_event_idx(struct pmu_hw_events *cpuc,
> > +				   struct perf_event *event,
> > +				   const u16 event_affinities[])
> >  {
> >  	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
> > -	unsigned long affinity = m1_pmu_event_affinity[evtype];
> > +	unsigned long affinity = event_affinities[evtype];
> >  	int idx;
> >  
> >  	/*
> > @@ -509,6 +507,12 @@ static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
> >  	return -EAGAIN;
> >  }
> >  
> > +static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
> > +				struct perf_event *event)
> > +{
> > +	return apple_pmu_get_event_idx(cpuc, event, m1_pmu_event_affinity);
> > +}
> > +
> >  static void m1_pmu_clear_event_idx(struct pmu_hw_events *cpuc,
> >  				   struct perf_event *event)
> >  {
> > @@ -536,44 +540,52 @@ static void m1_pmu_stop(struct arm_pmu *cpu_pmu)
> >  	__m1_pmu_set_mode(PMCR0_IMODE_OFF);
> >  }
> >  
> > +static int apple_pmu_map_event(struct perf_event *event,
> > +			       const unsigned int (*perf_map)[],
> > +			       unsigned int flags)
> > +{
> > +	event->hw.flags |= flags;
> > +	return armpmu_map_event(event, perf_map, NULL, M1_PMU_CFG_EVENT);
> > +}
> > +
> > +/*
> > + * Apple PMU counters have been observed to be either 48 or
> > + * 64 bits wide, depending on the SoC. However, the MSB is
> > + * what triggers an overflow interrupt, so we advertise the
> > + * counters as being 1-bit smaller than hardware so as to
> > + * mimick ARM PMU behaviour
> > + */
> >  static int m1_pmu_map_event(struct perf_event *event)
> >  {
> > -	/*
> > -	 * Although the counters are 48bit wide, bit 47 is what
> > -	 * triggers the overflow interrupt. Advertise the counters
> > -	 * being 47bit wide to mimick the behaviour of the ARM PMU.
> > -	 */
> > -	event->hw.flags |= ARMPMU_EVT_47BIT;
> > -	return armpmu_map_event(event, &m1_pmu_perf_map, NULL, M1_PMU_CFG_EVENT);
> > +	return apple_pmu_map_event(event, &m1_pmu_perf_map, ARMPMU_EVT_47BIT);
> >  }
> >  
> >  static int m2_pmu_map_event(struct perf_event *event)
> >  {
> > -	/*
> > -	 * Same deal as the above, except that M2 has 64bit counters.
> > -	 * Which, as far as we're concerned, actually means 63 bits.
> > -	 * Yes, this is getting awkward.
> > -	 */
> > -	event->hw.flags |= ARMPMU_EVT_63BIT;
> > -	return armpmu_map_event(event, &m1_pmu_perf_map, NULL, M1_PMU_CFG_EVENT);
> > +	return apple_pmu_map_event(event, &m1_pmu_perf_map, ARMPMU_EVT_63BIT);
> >  }
> >  
> > -static int m1_pmu_map_pmuv3_event(unsigned int eventsel)
> > +static int apple_pmu_map_pmuv3_event(unsigned int eventsel, const u16 pmceid_map[])
> >  {
> > -	u16 m1_event = HW_OP_UNSUPPORTED;
> > +	u16 apple_event = HW_OP_UNSUPPORTED;
> 
> nit: s/apple_event/hw_event/.

Thanks!
> 
> >  
> >  	if (eventsel < ARMV8_PMUV3_MAX_COMMON_EVENTS)
> > -		m1_event = m1_pmu_pmceid_map[eventsel];
> > +		apple_event = pmceid_map[eventsel];
> >  
> > -	return m1_event == HW_OP_UNSUPPORTED ? -EOPNOTSUPP : m1_event;
> > +	return apple_event == HW_OP_UNSUPPORTED ? -EOPNOTSUPP : apple_event;
> >  }
> >  
> > -static void m1_pmu_init_pmceid(struct arm_pmu *pmu)
> > +static int m1_pmu_map_pmuv3_event(unsigned int eventsel)
> > +{
> > +	return apple_pmu_map_pmuv3_event(eventsel, m1_pmu_pmceid_map);
> > +}
> > +
> > +static void apple_pmu_init_pmceid(struct arm_pmu *pmu)
> >  {
> >  	unsigned int event;
> >  
> >  	for (event = 0; event < ARMV8_PMUV3_MAX_COMMON_EVENTS; event++) {
> > -		if (m1_pmu_map_pmuv3_event(event) >= 0)
> > +		if (pmu->map_pmuv3_event(event) >= 0)
> >  			set_bit(event, pmu->pmceid_bitmap);
> >  	}
> >  }
> > @@ -616,33 +628,22 @@ static int m1_pmu_set_event_filter(struct hw_perf_event *event,
> >  	return 0;
> >  }
> >  
> > -static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
> > +static int apple_pmu_init(struct arm_pmu *cpu_pmu)
> >  {
> >  	cpu_pmu->handle_irq	  = m1_pmu_handle_irq;
> >  	cpu_pmu->enable		  = m1_pmu_enable_event;
> >  	cpu_pmu->disable	  = m1_pmu_disable_event;
> >  	cpu_pmu->read_counter	  = m1_pmu_read_counter;
> >  	cpu_pmu->write_counter	  = m1_pmu_write_counter;
> > -	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
> >  	cpu_pmu->clear_event_idx  = m1_pmu_clear_event_idx;
> >  	cpu_pmu->start		  = m1_pmu_start;
> >  	cpu_pmu->stop		  = m1_pmu_stop;
> > -
> > -	if (flags & ARMPMU_EVT_47BIT)
> > -		cpu_pmu->map_event = m1_pmu_map_event;
> > -	else if (flags & ARMPMU_EVT_63BIT)
> > -		cpu_pmu->map_event = m2_pmu_map_event;
> > -	else
> > -		return WARN_ON(-EINVAL);
> > -
> >  	cpu_pmu->reset		  = m1_pmu_reset;
> >  	cpu_pmu->set_event_filter = m1_pmu_set_event_filter;
> >  
> > -	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
> > -	m1_pmu_init_pmceid(cpu_pmu);
> > +	apple_pmu_init_pmceid(cpu_pmu);
> >  
> >  	bitmap_set(cpu_pmu->cntr_mask, 0, M1_PMU_NR_COUNTERS);
> > -	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
> >  	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_FORMATS] = &m1_pmu_format_attr_group;
> >  	return 0;
> >  }
> > @@ -651,25 +652,49 @@ static int m1_pmu_init(struct arm_pmu *cpu_pmu, u32 flags)
> >  static int m1_pmu_ice_init(struct arm_pmu *cpu_pmu)
> >  {
> >  	cpu_pmu->name = "apple_icestorm_pmu";
> > -	return m1_pmu_init(cpu_pmu, ARMPMU_EVT_47BIT);
> > +	cpu_pmu->get_event_idx	  = m1_pmu_get_event_idx;
> > +	cpu_pmu->map_event	  = m1_pmu_map_event;
> > +
> > +	cpu_pmu->map_pmuv3_event  = m1_pmu_map_pmuv3_event;
> > +
> > +	cpu_pmu->attr_groups[ARMPMU_ATTR_GROUP_EVENTS] = &m1_pmu_events_attr_group;
> > +	return apple_pmu_init(cpu_pmu);
> >  }
> >
> 
> Looking at the following patches, I feel that this series is taking
> the long route to get to a relatively clear point: most of the
> invariant that we relied on for M1, slightly relaxed for M2 (counter
> width), are even more relaxed for M3+ (event width). We therefore need
> to indirect things. The way you do it is to mirror the current setup,
> with a whole set of callbacks per implementation and a bunch of
> additional helpers.
> 
> But instead of having a set of helper functions, one per
> implementation, with an ever increasing set of parameters, it really
> feels like we could do with a more data-centric approach where we have
> a single data structure describing an implementation, containing all
> the relevant data (pointer to the event mapping table, flags, bit
> indices for the user/kernel/guest/host attributes, and so on. We could
> then have a single set of callbacks that work on everything.
> 
> You could convert M1/M2 to that, then just add the relevant
> descriptions for M3+, which should just add data and the init
> functions, nothing else.
> 
> Does this make sense to you?

Hi Marc,

It does make sense, and should reduce duplicated code, I'm just not
confident I have the right idea as to how to implement it. I don't want
to duplicate a lot of the generic arm_pmu code, so it looks like it'd
probably have to be modified to allow passing a hardware specific detail
struct to all the callbacks, likely stored as a new field (void *) in
the arm_pmu struct itself. Does that vaguely sound right to you?

Also, with this rewrite, if we're going to make the code a whole lot
more generic, and take hardware specific data from a static struct,
would it make sense to rename the driver/all the callbacks while we're
at it, now that we're adding a lot more than just M1/M2 pmu events?

Thanks,
Myria

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
