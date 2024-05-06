Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44A39FF4
	for <asahi@lists.linux.dev>; Mon,  6 May 2024 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714994507; cv=none; b=jtpXs1olt62psa1lb2J43TBO8J7hFLO7jMLcktre+GhdK0UdtXJDzlJCDhP05Qr/V1hVmw9q2ZIGQnBWPfdztOk1K8b/VN5BI8ISNxPE3oQo/2t01AIMrhxF+mlQe/WOD2xOc5xVx6PoYVZrlIMmlt8e2kD53wy51VF5eCqDOmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714994507; c=relaxed/simple;
	bh=zrGpFO2KzYviJ12Uk4Knk0nbSHFeCLommmFFiBekSWk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKAJ18zzpjzepTlunvCmpzPjhZXDnzbUItJslhpfVN3sYdaEUDLEc52PgFzZ/KUp5QswHuDRzOBTb1d74bMO+bA1KtEl2/Mt+9BlRr0TlXAb2+mo14yyaATgeD3uTQpTkJth8yNVl7C3fWasBW2OfNJaxnYuIS8OTviFvo+m13A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i4War9FW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i4War9FW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714994505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lfElTg3P9yi4mhZjKlr5avBuN2og+ERzX6xGJyg7hQg=;
	b=i4War9FW54mBIDAle4hO45El4RmhB8PT20ToNVHIwgTgE1qj0DSAV/XFgy+/jkvCig0Lpg
	56A63dRLlly3Sxh4CR7aVwCfideGg/6cQQ+WmirwF5kS8HorvYnN9zHoDJ9+IDFevJkuWh
	JQByVpWGCzLQqtxrTGTIunDj2gyzodU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-UM5K7QtBMrq-NH5nj3lTvA-1; Mon, 06 May 2024 07:21:43 -0400
X-MC-Unique: UM5K7QtBMrq-NH5nj3lTvA-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6f449ea6804so2371077b3a.2
        for <asahi@lists.linux.dev>; Mon, 06 May 2024 04:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714994503; x=1715599303;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfElTg3P9yi4mhZjKlr5avBuN2og+ERzX6xGJyg7hQg=;
        b=ok7M51nN/ge2FOhCkUBl2lbAFoMs9nJpT3tcZ7GNhlbRGTXeb5ragXA0EdRD7mZa/6
         QgzC3Z0eFkRkjMpDXOYCouqydcs9KAxCTVXBwtea4OFV/bb7KGNcpiulQshMNIH8NDSD
         jb6ACtQfNOL2azJMrsodil8OcjCqp1hVnbjv04WEy5I2oTa62Ye56eaZdktFr6uZjhy9
         j276dpzSrEf2xJnPlmTReJ4sxv2UFiyPZsioZtqAyyx7zwuo1lA6uMIbX7w0TDthUuo3
         a6yiNaZxTS/eixgm7SMnvX8GL4MCTbNeR7doAlZoCcrK16iyxAYwlWn7Foe5NDyFvmxN
         GWIw==
X-Forwarded-Encrypted: i=1; AJvYcCVM8DD+DBV3EEHuoxFjn1SMWs+rzvIjM28jDqvQ+8adnd9HzX84Jss2tg8F2/ymky4/8pLM2bMVUvfpOdb68XiE5LZHbMQ=
X-Gm-Message-State: AOJu0YygFW209LfYQK0j9i/wGtdcZKunBoIPXWD5FjC2L4JhG2c9HhqG
	yDCwn1dJuySmckEYD1lNA/5lVvWslaytcxxWKumPgaitXTmxUr3UF6hQNtw7070HtZ9r6lUVKv3
	rpFmz07OVPIBQsiw/cwJ8XB25uEU2t7FE81/Mr63hJx8nrUt+MI1US/5/HmzvJ699o46pbpQsIw
	r+FTfbJOmPSzHvij+Gwwkz1aXxV5s=
X-Received: by 2002:a05:6a20:da8b:b0:1a7:2ceb:e874 with SMTP id iy11-20020a056a20da8b00b001a72cebe874mr12710496pzb.37.1714994502749;
        Mon, 06 May 2024 04:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhyhi7dIVf2+C7OigQZMKNCF9fVW9NM5SSt+qz9BQl1HVEbaT1IXprTHrmUqzyshtiWvHl0EwlK+4i/EV8NvU=
X-Received: by 2002:a05:6a20:da8b:b0:1a7:2ceb:e874 with SMTP id
 iy11-20020a056a20da8b00b001a72cebe874mr12710445pzb.37.1714994502125; Mon, 06
 May 2024 04:21:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 May 2024 13:21:41 +0200
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <CAOgh=Fykg3Xb8Y59R_tJ7_jXe-ozXRMQjU+qVy5DdmFn3pkcPw@mail.gmail.com>
References: <20240411-tso-v1-0-754f11abfbff@marcan.st> <20240411132853.GA26481@willie-the-truck>
 <28ab55b3-e699-4487-b332-f1f20a6b22a1@marcan.st> <20240419165809.GA4020@willie-the-truck>
 <CAOgh=Fykg3Xb8Y59R_tJ7_jXe-ozXRMQjU+qVy5DdmFn3pkcPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 6 May 2024 13:21:40 +0200
Message-ID: <CAAiTLFW8DWH-ejNgcXgr2tQxxF4pp7BNUFGyUq99BfrYx1kScQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: Support the TSO memory model
To: Eric Curtin <ecurtin@redhat.com>, Will Deacon <will@kernel.org>
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
	linux-kernel@vger.kernel.org, Asahi Linux <asahi@lists.linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Eric Curtin <ecurtin@redhat.com> writes:

> On Fri, 19 Apr 2024 at 18:08, Will Deacon <will@kernel.org> wrote:
>>
>> On Thu, Apr 11, 2024 at 11:19:13PM +0900, Hector Martin wrote:
>> > On 2024/04/11 22:28, Will Deacon wrote:
>> > >   * Some binaries in a distribution exhibit instability which goes away
>> > >     in TSO mode, so a taskset-like program is used to run them with TSO
>> > >     enabled.
>> >
>> > Since the flag is cleared on execve, this third one isn't generally
>> > possible as far as I know.
>>
>> Ah ok, I'd missed that. Thanks.
>>
>> > > In all these cases, we end up with native arm64 applications that will
>> > > either fail to load or will crash in subtle ways on CPUs without the TSO
>> > > feature. Assuming that the application cannot be fixed, a better
>> > > approach would be to recompile using stronger instructions (e.g.
>> > > LDAR/STLR) so that at least the resulting binary is portable. Now, it's
>> > > true that some existing CPUs are TSO by design (this is a perfectly
>> > > valid implementation of the arm64 memory model), but I think there's a
>> > > big difference between quietly providing more ordering guarantees than
>> > > software may be relying on and providing a mechanism to discover,
>> > > request and ultimately rely upon the stronger behaviour.
>> >
>> > The problem is "just" using stronger instructions is much more
>> > expensive, as emulators have demonstrated. If TSO didn't serve a
>> > practical purpose I wouldn't be submitting this, but it does. This is
>> > basically non-negotiable for x86 emulation; if this is rejected
>> > upstream, it will forever live as a downstream patch used by the entire
>> > gaming-on-Mac-Linux ecosystem (and this is an ecosystem we are very
>> > explicitly targeting, given our efforts with microVMs for 4K page size
>> > support and the upcoming Vulkan drivers).

In addition to the use case Hector exposed here, there's another,
potentially larger one, which is running x86_64 containers on aarch64
systems, using a combination of both Virtualization and emulation.

In this scenario, both not being able to use TSO for emulation
and having to enable it all the time for the whole VM have a very large
impact on performance (~25% on some workloads).

I understand the concern about the risk of userspace fragmentation, but
I was wondering if we could minimize it to an acceptable level by
narrowing down the context. For instance, since both use cases we're
bringing to the table imply the use of Virtualization, we should be able
to restrict PR_SET_MEM_MODEL to only be accepted when running on EL1
(and not in nVHE nor pKVM), returning EINVAL otherwise. This would
heavily discourage users from relying on this feature for native
applications that can run on arbitrary contexts, hence drastically
reducing the fragmentation risk.

We would still need a way to ensure the trap gets to the VMM and for
the VMM to operate on the impdef ACTLR_EL12, but that should be dealt on
a different series.

Thanks,
Sergio.

