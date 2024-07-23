Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B671581E9
	for <asahi@lists.linux.dev>; Tue, 23 Jul 2024 16:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721752112; cv=none; b=Nym6j7I3xJzZlGk3WWv/li/rCftF6azvInpgLJVTSvRxDo6sXzqWBIUzsg3txwtHE/TLkd+LAPy3s99ilTG2lsvK+ydk/il97fUxNbe1TSp+T+0FJcV/616Xgz1LfksXB0Ig5IVAyj6QwgQPZGNLjfEeA3fNnnVNj9nQFu1sed4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721752112; c=relaxed/simple;
	bh=/gSJutKx3HynlVdUOpttVICI3mk9PZE/4lHNjoI0+rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qp2TU/IjBR9NCn5EtWdExWUIFu+bsPJ3JYHRW7trG5N+MiRtTWpHchYTNDPQmTaFqOQngSJcb47ZXJMsPiAcLBF5IKjT1jMrh1LM+IVlflElBBe2sIlrQuRRxjBECh5QnIEdLRT+LgrV3YMjTvsmMtVAyGVHm0P/ZDSYkXw3LHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzROSsI2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzROSsI2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 930A4C4AF0F
	for <asahi@lists.linux.dev>; Tue, 23 Jul 2024 16:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721752110;
	bh=/gSJutKx3HynlVdUOpttVICI3mk9PZE/4lHNjoI0+rw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XzROSsI2ja0hy5r/njAj1KXTgIh9v2P1FNMf0MYkF33nKpB0DRzhnITGHw2dAe8MV
	 2Nhwr/dLOCHe0jEYkpyYcbX4SRB6m2hO7uRAapBegRDWt3IPgeo75g4AWCx6OGMwPk
	 oyTp+zCJKOsuCbzyyzRISU0nzzUhfElBBkJ3NqunEhDllvx57h+960wOK7sdJfmXXZ
	 IqO8CtrwvkaAXREXMt96QP8t/SkQu38WzPx+ec2urnu9ybOGL3zyHNb1gY3v343Zf5
	 5Sj2JQjcEl4S/Mo8nTduhMsgirqJ4OIj9ZapY5sCQ2g9lePHZsrrPxlNSm7KMmnSks
	 2B0lsOuXCNUtg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso28472211fa.1
        for <asahi@lists.linux.dev>; Tue, 23 Jul 2024 09:28:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzovxn8rOOLhEis/Nj1Tp0a/xqk7FgLq/D+qBkXMVF81gdZ5fmxfsX6T1sxs9ENI+FCgEG6fT6FG//FtZ1W1Hl0I5iMVw=
X-Gm-Message-State: AOJu0YwFUHHXvaNwpcm7ZtAAHv6N0Wt/ErmBHVBMQQMWWehxgd8RAEf5
	85nPcO5raIkBclFULyDNiQrI10v4+wvmc7PWLDpUGj1PA9m7o0ntVxnj42ezdlPiNEW7Abk1M/G
	eMBp1HzKS7I2vjo+Nk+qGH4WGB3A=
X-Google-Smtp-Source: AGHT+IEIZXkfujE7Kig6KzsuO0P0XYuDOqb7EP3O8/OuBFcMK1MWPhPRHD5+2nR8Vrq8QlBUgPO41D6glPniR07mTlc=
X-Received: by 2002:a2e:a30d:0:b0:2f0:1bb6:dbce with SMTP id
 38308e7fff4ca-2f01bb6e96emr33131481fa.41.1721752108819; Tue, 23 Jul 2024
 09:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <50360968-13fb-4e6f-8f52-1725b3177215@asahilina.net>
 <20240718131428.GA21243@willie-the-truck> <CAMj1kXFi0sRVMRNhMVEnYBrLT4DycPoDMUa9VkP8wqqdf59eeA@mail.gmail.com>
 <20240723145214.GA26403@willie-the-truck> <CAMj1kXEkHKtFKFS3ejeDsg1Q+2NY1JibzurzqgwVGqb+1=XrRg@mail.gmail.com>
 <20240723160543.GA26546@willie-the-truck>
In-Reply-To: <20240723160543.GA26546@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 23 Jul 2024 18:28:16 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGPc5k-+CK=CQ=UDTzggtZ+r5aKSzBhvWLh7aY4BxuW+Q@mail.gmail.com>
Message-ID: <CAMj1kXGPc5k-+CK=CQ=UDTzggtZ+r5aKSzBhvWLh7aY4BxuW+Q@mail.gmail.com>
Subject: Re: LPA2 on non-LPA2 hardware broken with 16K pages
To: Will Deacon <will@kernel.org>
Cc: Asahi Lina <lina@asahilina.net>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, ryan.roberts@arm.com, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jul 2024 at 18:05, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Jul 23, 2024 at 05:02:15PM +0200, Ard Biesheuvel wrote:
> > On Tue, 23 Jul 2024 at 16:52, Will Deacon <will@kernel.org> wrote:
> > > On Fri, Jul 19, 2024 at 11:02:29AM -0700, Ard Biesheuvel wrote:
...
> > > >
> > > > We might add
> > > >
> > > > if (pgtable_l4_enabled())
> > > >     pgdp = &pgd;
> > > >
> > > > here to preserve the existing 'lockless' behavior when PUDs are not
> > > > folded.
> > >
> > > The code still needs to be 'lockless' for the 5-level case, so I don't
> > > think this is necessary.
> >
> > The 5-level case is never handled here.
>
> Urgh, yes, sorry. I've done a fantasticly bad job of explaining myself.
>
> > There is the 3-level case, where the runtime PUD folding needs the
> > actual address in order to recalculate the descriptor address using
> > the correct shift. In this case, we don't dereference the pointer
> > anyway so the 'lockless' thing doesn't matter (afaict)
> >
> > In the 4-level case, we want to preserve the original behavior, where
> > pgd is not reloaded from pgdp. Setting pgdp to &pgd achieves that.
>
> Right. What I'm trying to get at is the case where we have folding. For
> example, with my patch applied, if we have 3 levels then the lockless
> GUP walk looks like:
>
>
> pgd_t pgd = READ_ONCE(*pgdp);
>
> p4dp = p4d_offset_lockless(pgdp, pgd, addr);
>         => Returns pgdp
> p4d_t p4d = READ_ONCE(*p4dp);
>
> pudp = pud_offset_lockless(p4dp, p4d, addr);
>         => Returns &p4d, which is again the pgdp
> pud_t pud = READ_ONCE(*pudp);
>
>
> So here we're reloading the same pointer multiple times and my argument
> is that if we need to add logic to avoid this for the
> pgtable_l4_enabled() case, then we have bigger problems.
>

The 3-level case is not relevant here. My suggestion only affects the
4-level case:

if (pgtable_l4_enabled())
   pgdp = &pgd;

which prevents us from evaluating *pgdp twice, which seems to me to be
the reason these routines exist in the first place. Given that the
3-level runtime-folded case is the one we are trying to fix here, I'd
argue that keeping the 4-level case the same as before is important.

> > > Yes, we'll load the same entry multiple times,
> > > but it should be fine because they're in the context of a different
> > > (albeit folded) level.
> > >
> >
> > I don't understand what you are saying here. Why is that fine?
>
> I think it's fine because (a) the CPU guarantees same address
> read-after-read ordering and (b) We only evaluate the most recently read
> value. It would be a problem if we mixed data from different reads but,
> because the use is confined to that 'level', we don't end up doing that.
>
> Dunno, am I making any sense?
>

So what is the point of p?d_offset_lockless()? Is it a performance
optimization that we don't care about on arm64? Or does this reasoning
still only apply to the folded case?
