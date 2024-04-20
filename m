Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10F8C127
	for <asahi@lists.linux.dev>; Sat, 20 Apr 2024 12:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713615387; cv=none; b=V0tnKF1chg9dwS6hLoi02IOfvg2mrWADgIZPZx1Cw1CaES2HMgOeV5bovkB+VVTgGLcAwWNuriuNw5+s+bRNUNfUaefkwkjWTzDIpHR/hSxY/o5MwqNez2+p8xEMjcBJIivnMZEwqeKvxYB9x2SHkm/eOP6wibwXfymYR4lDVv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713615387; c=relaxed/simple;
	bh=jpvBQEYsS25X1VkRv0g/8AyCht/4twbVITvDjtY2aY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtKlguFJbm4ALFzDnBYQ54VNcnHTKt1HJ30RuoW5AuNXWTuO5Y8xUuLLDPA0SJkZyC+EJ0edDh6cQAImam3CPc9ndEZM9K/ZvFg2IdDDOE1fl2XzXPi1y9pN6enmC4dGeEQI3LdWSHAeW1qvUi+7UVNT7Y6g+iadulAkNr8wKtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PO0vQcN0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PO0vQcN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713615384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YXJtiOIsyahYNFLD4DF8SJnvbOfVydqND2Xt4V5K7UE=;
	b=PO0vQcN0iSH5emFEyqrZsS4Lwz+54lV+wPX0RVR6MDioM8pvjXtmeKisIkh8vmg5OF0KBP
	Ws4cb44ddgZd4S3Q/avyokm+cGOLdfd5mOmvT1reNelYMWJR9lHtS5/Xgzd5CmuyKw1f2k
	Ze9EYrwOdfoe8B9HOyHPKjZhOaPF0Kg=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-i7G8T8tpObOct5Lf2_onHQ-1; Sat, 20 Apr 2024 08:16:22 -0400
X-MC-Unique: i7G8T8tpObOct5Lf2_onHQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2a2fe3c35a1so3266547a91.0
        for <asahi@lists.linux.dev>; Sat, 20 Apr 2024 05:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713615381; x=1714220181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXJtiOIsyahYNFLD4DF8SJnvbOfVydqND2Xt4V5K7UE=;
        b=Bav0YBx5MIxQDqk6bOC+gO9oA6BGorXIFUyyXCLRi5VrFSo9Id3F/5m8k5HxeY8HHL
         vr/uair+AJ9SbW5GGW7y82ITWsiO52GIdFGh3gDXPZvi+nmIHau2BXyzjo8uBwoDrWPu
         KxySVJbAH7QWafZpkT4M8toLxT49ZPFY4ATM9Yf//WpIoC5iFXE/dMRIrhM+QgSXGb80
         ox1NlcnUspNlJlfr1XEAmJab4otZf2xuKxUZIQS5h62AxoYNGXBUsyjzXBwFlZfoo7na
         wRwSc9fMhiKCroo33wOnRiYiexrHr2Y5ZqHXrCrxrjAqv6MfJVoFyTW30Ylrj1+A9Ifz
         KEZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsqVW4uj378uB19lMHff3rI9IgjtjPJUdbQqpZIGG/6rJMu+uGB2e+t0E5Z2kXSSff7v+HM6VhNN9cwlSCVagXM6uhqek=
X-Gm-Message-State: AOJu0YyJJz5vK0jRUPx03R8TopPPfxjIveO+BtypAvoZv3m+NNzV49QC
	7TAi+oB4eSeEfEFbeNuMPQWK4Pl81nuitct9Exdy9la49WXdQhgIjHePQdqTaTXeXTgOoXpULlU
	EXQAYn/qC2DsYmj6CGga5GFbST52isRUSe4AZfqRXQZVRnxO+GAS0M0TTkf3dfVko+C8kFiDz1p
	Jqj0wYv35kRZx+nqtj9Fynxqht7xA=
X-Received: by 2002:a17:90a:c502:b0:2a4:6c87:7c81 with SMTP id k2-20020a17090ac50200b002a46c877c81mr4272036pjt.22.1713615381369;
        Sat, 20 Apr 2024 05:16:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKewKKOvUWevO6z3GOo8wxJQ6pDHl0v2ODALKgpUBkx51EEZTP4p4zzk7PzkTer6ppIiIbwHCT++nxr+HDdls=
X-Received: by 2002:a17:90a:c502:b0:2a4:6c87:7c81 with SMTP id
 k2-20020a17090ac50200b002a46c877c81mr4272008pjt.22.1713615381009; Sat, 20 Apr
 2024 05:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240411-tso-v1-0-754f11abfbff@marcan.st> <20240411132853.GA26481@willie-the-truck>
 <28ab55b3-e699-4487-b332-f1f20a6b22a1@marcan.st> <20240419165809.GA4020@willie-the-truck>
 <CAOgh=Fykg3Xb8Y59R_tJ7_jXe-ozXRMQjU+qVy5DdmFn3pkcPw@mail.gmail.com>
In-Reply-To: <CAOgh=Fykg3Xb8Y59R_tJ7_jXe-ozXRMQjU+qVy5DdmFn3pkcPw@mail.gmail.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sat, 20 Apr 2024 13:15:45 +0100
Message-ID: <CAOgh=FyPda1H9NVsTAdqJ_iGqxX=TV-djG-tB0g+LQo-U4qreQ@mail.gmail.com>
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

On Sat, 20 Apr 2024 at 13:13, Eric Curtin <ecurtin@redhat.com> wrote:
>
> On Fri, 19 Apr 2024 at 18:08, Will Deacon <will@kernel.org> wrote:
> >
> > On Thu, Apr 11, 2024 at 11:19:13PM +0900, Hector Martin wrote:
> > > On 2024/04/11 22:28, Will Deacon wrote:
> > > >   * Some binaries in a distribution exhibit instability which goes away
> > > >     in TSO mode, so a taskset-like program is used to run them with TSO
> > > >     enabled.
> > >
> > > Since the flag is cleared on execve, this third one isn't generally
> > > possible as far as I know.
> >
> > Ah ok, I'd missed that. Thanks.
> >
> > > > In all these cases, we end up with native arm64 applications that will
> > > > either fail to load or will crash in subtle ways on CPUs without the TSO
> > > > feature. Assuming that the application cannot be fixed, a better
> > > > approach would be to recompile using stronger instructions (e.g.
> > > > LDAR/STLR) so that at least the resulting binary is portable. Now, it's
> > > > true that some existing CPUs are TSO by design (this is a perfectly
> > > > valid implementation of the arm64 memory model), but I think there's a
> > > > big difference between quietly providing more ordering guarantees than
> > > > software may be relying on and providing a mechanism to discover,
> > > > request and ultimately rely upon the stronger behaviour.
> > >
> > > The problem is "just" using stronger instructions is much more
> > > expensive, as emulators have demonstrated. If TSO didn't serve a
> > > practical purpose I wouldn't be submitting this, but it does. This is
> > > basically non-negotiable for x86 emulation; if this is rejected
> > > upstream, it will forever live as a downstream patch used by the entire
> > > gaming-on-Mac-Linux ecosystem (and this is an ecosystem we are very
> > > explicitly targeting, given our efforts with microVMs for 4K page size
> > > support and the upcoming Vulkan drivers).
> >
> > These microVMs sound quite interesting. What exactly are they? Are you
> > running them under KVM?
>
> It's the magic of libkrun. This is one of the git repos in the family
> of libkrun, it has a wide array of use cases, which I personally won't
> do much justice explaining all then, this is just one
> repo/tool/usecases:
>
> https://github.com/containers/krunvm
>
> https://sinrega.org/running-microvms-on-m1/

Sorry for the double post, meant to share this one for the Asahi
emulator usecase. Sergio's blogs are great in general:

https://sinrega.org/2023-10-06-using-microvms-for-gaming-on-fedora-asahi/

Is mise le meas/Regards,

Eric Curtin

>
> CC'ing @Sergio Lopez Pascual the lead of krun in general.
>
> Is mise le meas/Regards,
>
> Eric Curtin
>
> >
> > Ignoring the mechanism for the time being, would it solve your problem
> > if you were able to run specific microVMs in TSO mode, or do you *really*
> > need the VM to have finer-grained control than that? If the whole VM is
> > running in TSO mode, then my concerns largely disappear, as that's
> > indistinguishable from running on a hardware implementation that happens
> > to be TSO.
> >
> > > That said, I have a pragmatic proposal here. The "fixed TSO" part of the
> > > implementation should be harmless, since those CPUs would correctly run
> > > poorly-written applications anyway so the API is moot. That leaves Apple
> > > Silicon. Our native kernels are and likely always will be 16K page size,
> > > due to a bunch of pain around 16K-only IOMMUs (4K kernels do boot
> > > natively but with very broken functionality including no GPU
> > > acceleration) plus performance differences that favor 16K. How about we
> > > gate the TSO functionality to only be supported on 4K kernel builds?
> > > This would make them only work in 4K VMs on Asahi Linux. We are very
> > > explicitly discouraging people from trying to use the microVMs to work
> > > around page size problems (which they can already do, another
> > > fragmentation problem, anyway); any application which requires the 4K VM
> > > to run that isn't an emulator is already clearly broken and advertising
> > > that fact openly. So, adding TSO to this should be only a marginal risk
> > > of further fragmentation, and it wouldn't allow apps to "sneakily" "just
> > > work" on Apple machines by abusing TSO.
> >
> > I appreciate that you're trying to be constructive here, but I don't think
> > we should tie this to the page size. It's an artifical limitation and I
> > don't think it really addresses the underlying concerns that I have.
> >
> > Will
> >

