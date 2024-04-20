Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C152383AE
	for <asahi@lists.linux.dev>; Sat, 20 Apr 2024 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713615263; cv=none; b=oCcgF6ZmMB2Q3fLm9CqvhmX2K6G/5ChxPFRbncMR9EXREfNVdKlHBSyaX8WRYDa5FEUrLwM+wJKOyD9ACbHSH/1Hzo5osumbmItmHW7BnJqEfuXhob5IvOwoGqowQ4NL+AdMhikSbDMCzl6X7FoXImdBXTHScwVRQlURFeplWLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713615263; c=relaxed/simple;
	bh=mLBFQwnGnEbJCwQmCAtkZajQQO0VrrORdBE2V5gqR/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ytz2ey1YJseSglCQjHp8pkTjGaTByi3MSj92GCpNXctDMGSllSplbuAPGRYcLBsh3Cjt9ggURtOCkSYgcxgfvGoMl4QbaY0OezlMWIfw/7X26wLRBtMHm4ZWhwrXAo0fkQQBVVaUiKO5P8+BIwOV9EdLZNDr8kUqw+m5C4WGxoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZXM3wqPo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZXM3wqPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713615260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7/+AXP/+cMsv1gB1pDa+er++RK/74cS8hOJWb41Gq1U=;
	b=ZXM3wqPotzk8S61siAPbpVevVfZo0KX9PgHqMB8VVCqqWmZHJeheKIRGtzY6yH1/K1WAXE
	a4tTLKXFwlKiZBdkk8BdJsiwEXSfuAYc6qMdMPnBPKTD7vS2jO0YMIW7nvRP+1ygq425jd
	A8aGB7XVH1eO8wdo2czO37Wi68jcInM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-QAZSlDZCPKqxDls_qcx0Yw-1; Sat, 20 Apr 2024 08:14:16 -0400
X-MC-Unique: QAZSlDZCPKqxDls_qcx0Yw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2a2fec91d48so3327037a91.2
        for <asahi@lists.linux.dev>; Sat, 20 Apr 2024 05:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713615255; x=1714220055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/+AXP/+cMsv1gB1pDa+er++RK/74cS8hOJWb41Gq1U=;
        b=F1indC+0fehb1gQByCt8xXU/UKZNskjU2teydDcNxf/ze/neeIhoTvNbi8wmWOMGfV
         KpE+wXGFC92BHeNZpq6RUK69I50DNKv/E8Y0simwQRewK37Yb5dWhQ4lI3GiLeRUW7sM
         Il5cV8TL5pxIBunnXs+HTS8e6b7O4qDKg/BdIyxbvX5zKCd426HxV1jY4Uez56ombeQX
         4nRGevGhXcHmx6c7GcHxfb35/kUDt93qe8iXwOds8keKlkbEg0jDepX4B2jApx8PfuUG
         w4LVxTrY7Rm0VrHmiE1GrnkIFEVJlzUIIXLIGgsqjkM4kAIE3Bio2fQvKTlSVwpgjqnh
         bp/w==
X-Forwarded-Encrypted: i=1; AJvYcCUF3eEBz2MMYpKdWAA/Z1C+WQdVDKk4waeMJcE5sLRPyM6Pp0tKaqCV8N1PijVQkxK3b/TqBq7lpYHNClk/AkDw3JU9kCQ=
X-Gm-Message-State: AOJu0Yze+zRHrBZduGJo9ae8K4jITwIxdcNuK7zPv9Ane5AGilzifIbi
	dFGqOYrc+tUNyzGfwPssHLURuIj6CCQP1Yql0ZDJhz5pkNkHdurhfK6ucfDJVjJE5K8bDatPx6n
	8oOFuZYceRDnO/VMRqkT9CXXWW7UK8UIzeilCZyTA2V44RQdLbRIIXjPUp8N3/TH082oWAapdHA
	DVi/wjI/1JdJZMlxy4E8VJQEjXGv4=
X-Received: by 2002:a17:90b:4f8f:b0:2a0:9b66:8e22 with SMTP id qe15-20020a17090b4f8f00b002a09b668e22mr3868935pjb.24.1713615254972;
        Sat, 20 Apr 2024 05:14:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsHuOB/oNQk6rhvlabCIKccBuvsNSSpeF7mDscQ/D/nU4o7qvI+9aQIV6/VOpH63JMXbU3K2Hm1ot18E6cj9A=
X-Received: by 2002:a17:90b:4f8f:b0:2a0:9b66:8e22 with SMTP id
 qe15-20020a17090b4f8f00b002a09b668e22mr3868910pjb.24.1713615254613; Sat, 20
 Apr 2024 05:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411-tso-v1-0-754f11abfbff@marcan.st> <20240411132853.GA26481@willie-the-truck>
 <28ab55b3-e699-4487-b332-f1f20a6b22a1@marcan.st> <20240419165809.GA4020@willie-the-truck>
In-Reply-To: <20240419165809.GA4020@willie-the-truck>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sat, 20 Apr 2024 13:13:38 +0100
Message-ID: <CAOgh=Fykg3Xb8Y59R_tJ7_jXe-ozXRMQjU+qVy5DdmFn3pkcPw@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: Support the TSO memory model
To: Will Deacon <will@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Zayd Qumsieh <zayd_qumsieh@apple.com>, Justin Lu <ih_justin@apple.com>, 
	Ryan Houdek <Houdek.Ryan@fex-emu.org>, Mark Brown <broonie@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Miguel Luis <miguel.luis@oracle.com>, Joey Gouly <joey.gouly@arm.com>, 
	Christoph Paasch <cpaasch@apple.com>, Kees Cook <keescook@chromium.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Baoquan He <bhe@redhat.com>, 
	Joel Granados <j.granados@samsung.com>, Dawei Li <dawei.li@shingroup.cn>, 
	Andrew Morton <akpm@linux-foundation.org>, Florent Revest <revest@chromium.org>, 
	David Hildenbrand <david@redhat.com>, Stefan Roesch <shr@devkernel.io>, Andy Chiu <andy.chiu@sifive.com>, 
	Josh Triplett <josh@joshtriplett.org>, Oleg Nesterov <oleg@redhat.com>, Helge Deller <deller@gmx.de>, 
	Zev Weiss <zev@bewilderbeest.net>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Asahi Linux <asahi@lists.linux.dev>, 
	Sergio Lopez Pascual <slp@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Apr 2024 at 18:08, Will Deacon <will@kernel.org> wrote:
>
> On Thu, Apr 11, 2024 at 11:19:13PM +0900, Hector Martin wrote:
> > On 2024/04/11 22:28, Will Deacon wrote:
> > >   * Some binaries in a distribution exhibit instability which goes away
> > >     in TSO mode, so a taskset-like program is used to run them with TSO
> > >     enabled.
> >
> > Since the flag is cleared on execve, this third one isn't generally
> > possible as far as I know.
>
> Ah ok, I'd missed that. Thanks.
>
> > > In all these cases, we end up with native arm64 applications that will
> > > either fail to load or will crash in subtle ways on CPUs without the TSO
> > > feature. Assuming that the application cannot be fixed, a better
> > > approach would be to recompile using stronger instructions (e.g.
> > > LDAR/STLR) so that at least the resulting binary is portable. Now, it's
> > > true that some existing CPUs are TSO by design (this is a perfectly
> > > valid implementation of the arm64 memory model), but I think there's a
> > > big difference between quietly providing more ordering guarantees than
> > > software may be relying on and providing a mechanism to discover,
> > > request and ultimately rely upon the stronger behaviour.
> >
> > The problem is "just" using stronger instructions is much more
> > expensive, as emulators have demonstrated. If TSO didn't serve a
> > practical purpose I wouldn't be submitting this, but it does. This is
> > basically non-negotiable for x86 emulation; if this is rejected
> > upstream, it will forever live as a downstream patch used by the entire
> > gaming-on-Mac-Linux ecosystem (and this is an ecosystem we are very
> > explicitly targeting, given our efforts with microVMs for 4K page size
> > support and the upcoming Vulkan drivers).
>
> These microVMs sound quite interesting. What exactly are they? Are you
> running them under KVM?

It's the magic of libkrun. This is one of the git repos in the family
of libkrun, it has a wide array of use cases, which I personally won't
do much justice explaining all then, this is just one
repo/tool/usecases:

https://github.com/containers/krunvm

https://sinrega.org/running-microvms-on-m1/

CC'ing @Sergio Lopez Pascual the lead of krun in general.

Is mise le meas/Regards,

Eric Curtin

>
> Ignoring the mechanism for the time being, would it solve your problem
> if you were able to run specific microVMs in TSO mode, or do you *really*
> need the VM to have finer-grained control than that? If the whole VM is
> running in TSO mode, then my concerns largely disappear, as that's
> indistinguishable from running on a hardware implementation that happens
> to be TSO.
>
> > That said, I have a pragmatic proposal here. The "fixed TSO" part of the
> > implementation should be harmless, since those CPUs would correctly run
> > poorly-written applications anyway so the API is moot. That leaves Apple
> > Silicon. Our native kernels are and likely always will be 16K page size,
> > due to a bunch of pain around 16K-only IOMMUs (4K kernels do boot
> > natively but with very broken functionality including no GPU
> > acceleration) plus performance differences that favor 16K. How about we
> > gate the TSO functionality to only be supported on 4K kernel builds?
> > This would make them only work in 4K VMs on Asahi Linux. We are very
> > explicitly discouraging people from trying to use the microVMs to work
> > around page size problems (which they can already do, another
> > fragmentation problem, anyway); any application which requires the 4K VM
> > to run that isn't an emulator is already clearly broken and advertising
> > that fact openly. So, adding TSO to this should be only a marginal risk
> > of further fragmentation, and it wouldn't allow apps to "sneakily" "just
> > work" on Apple machines by abusing TSO.
>
> I appreciate that you're trying to be constructive here, but I don't think
> we should tie this to the page size. It's an artifical limitation and I
> don't think it really addresses the underlying concerns that I have.
>
> Will
>

