Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EA6285078
	for <asahi@lists.linux.dev>; Tue, 17 Jun 2025 16:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177746; cv=none; b=RKPPrwSsaxytcpZxOa7B1og/HhxbhvQXatN6D7uOqsTLbJJp/kxBVfvTAFmqV4X3ff+w0sKfRB7iiK0zZzTNr/rmv9RHLXWN5vXSot5WeR7HLuw2uF8Jh1sDCsniBcPqwn6i3xlKp+dRBmVY/CxNkESHjYXzYdSbFWI6SG4ukSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177746; c=relaxed/simple;
	bh=NEFMnlX92eZmddj6ISOAz5HWpkBrZdvzNs6PETlF6C4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aV9Ez11cLSLZTt++CLLkCfIkDviq2IkLL5xv50ahbZxl66kc8ffgPghfPkjAA2wzXNUVLavK1m+iBEVnPEx0iIft5rpQ+9wBD/qBGusQZbTK6P6xl7gKybmkOUTb1WwE3M62UeHJFUbCvO30gkl/qBY/rAfMj1UCDxWQM2DzlFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jTF8odVG; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jTF8odVG"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3ddc10f09easo1195ab.0
        for <asahi@lists.linux.dev>; Tue, 17 Jun 2025 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750177743; x=1750782543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEFMnlX92eZmddj6ISOAz5HWpkBrZdvzNs6PETlF6C4=;
        b=jTF8odVG0KV+9gRgSdXXEAsu567XQzm6CNJE5+8JNQMtTiKj698IXsleZuXti1VTgh
         o8ffDGWK2ppzU1ZwEwU49WRZjT1a+LKMvjVdcjOW0VUwbbfYkbuqUdkxseC3rKSNEoau
         KWOM1+QpiYqx24EmFq8HERcrIUPU3h5DtNTuKnIZykout+VRzgl6GaJ7Axz2j3UI4l3g
         w0ZvZ4G0f5zJRn6u3w9igMR0LBr8M68ONZce/M/g8rNbB8lyqw3B1+/sQxsacuJ/3/kS
         zo8jQKXwkHAu1plu7LYj3JyzKKWnGWdGGsm8BkFOKtdjQCSnXVt7Vw8G3IxxYvuamHwa
         k/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177743; x=1750782543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEFMnlX92eZmddj6ISOAz5HWpkBrZdvzNs6PETlF6C4=;
        b=FwtpCG7geqyqid6cm1u+siBSCdQKd1dVV2mFmJHFlCS/SgkWxhlTLFBgof5TrEhLaN
         yvpmbTfKBmxwaI+rOcz1ailgCVXLvKf2eB/LPvfKOyUJ5qv41CcXTCUv3Wp1WDRRZv68
         xF3mkMGPx757zaSR5i9la4ISopOvvrVQCI9n4KWL9EOCwlwL/pkMv65lTCibjThZwjEN
         OJz8tJhAu0jY5VH4gqtfHcyHdyYgljCbymiSUApG2cyeFn8c1Gga6P7evtcH3EQYeqKm
         2NIZZ1pqCRPstGsQe1Jhun5RTpGyExHos5hr0StIqerID+ljc2J5YyjebxNT6UHNbzPc
         jGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmySYgyjC0Fs3MiR8Qfjy2f3F/ujXFnWUmc+NOKzCCAuz4z9DYZl4DUU+xXHv+YGttw++M1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEfoGk28Rqqb+KLG+fWbWw4IRypOVA5ABJl3dfV7MiGLGOLANM
	DjGtTgy9zXqJJtHycLkryjC7Fc7rtQvQMypRdE94b2HYgtDiOf6Bt9h7BgMLVoNFD2WaPwbUeiv
	VUorQsFYBXo+OtS+4rnNwDw2OCz6rH4rphHlQY3LL
X-Gm-Gg: ASbGncs0BP8HcUNXWgNY9oLunZxqXKCKa5liCOUxphrJQQ6q2W7yp84QPS3VA0xUEHl
	uwmz9aubbR6O4a5QSbwfKVo8dazu7isyfaci+ZEoWzS+p3OmNbS326F8Va173pKDV99lP0I5ugm
	hBIU13mZRgNooNUDHCIzlLV2alaUCVN4kzLmLtVe2zq9FEaS55FEQ1ggb+xp81aVwvLYeYIJLC
X-Google-Smtp-Source: AGHT+IGuaQHH5RnvKvS2kE5LJtsJIfjqrig7FhB3Xp0nL8VkPKaJwzzxDGo5xtnO5/xq+BKzkzCl2ghHE6EtLjDojGk=
X-Received: by 2002:a05:6e02:1aa5:b0:3da:7c33:5099 with SMTP id
 e9e14a558f8ab-3de09fa7317mr8962435ab.13.1750177743269; Tue, 17 Jun 2025
 09:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com>
 <20250616102945.GA17431@willie-the-truck> <CAP-5=fVjJyV2eA1aDnk6cqAhJGc9FZVyHhP7-f=1OyWmzxjN8w@mail.gmail.com>
 <20250617141649.GA19021@willie-the-truck>
In-Reply-To: <20250617141649.GA19021@willie-the-truck>
From: Ian Rogers <irogers@google.com>
Date: Tue, 17 Jun 2025 09:28:51 -0700
X-Gm-Features: AX0GCFtUDjpPo9TijhacurqPBZmSpa7o8vMtplPwxsLKffdst7807Hbk9NO-1jU
Message-ID: <CAP-5=fXn_mr4k=fTYEuK7cCty4n8sofQaz1jNsrTn8U2icm_pg@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Will Deacon <will@kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 7:16=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Mon, Jun 16, 2025 at 03:44:49AM -0700, Ian Rogers wrote:
> > On Mon, Jun 16, 2025 at 3:29=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Mon, Jun 16, 2025 at 02:36:18AM -0700, Ian Rogers wrote:
> > > > On Sun, Jun 15, 2025 at 6:32=E2=80=AFPM Nick Chan <towinchenmi@gmai=
l.com> wrote:
> > > > >
> > > > > This series adds support for the CPU PMU in the older Apple A7-A1=
1, T2
> > > > > SoCs. These PMUs may have a different event layout, less counters=
, or
> > > > > deliver their interrupts via IRQ instead of a FIQ. Since some of =
those
> > > > > older SoCs support 32-bit EL0, counting for 32-bit EL0 also need =
to
> > > > > be enabled by the driver where applicable.
> > > > >
> > > > > Patch 1 adds the DT bindings.
> > > > > Patch 2-7 prepares the driver to allow adding support for those
> > > > > older SoCs.
> > > > > Patch 8-12 adds support for the older SoCs.
> > > > > Patch 13-21 are the DT changes.
> > > > >
> > > > > Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> > > >
> > > > Hi Nick,
> > > >
> > > > This is substantial work and it looks good to me. Do you know why
> > > > there's been little progress on landing these patches? Buggy Apple =
ARM
> > > > PMU support in the kernel has led to reworking the perf tool. It se=
ems
> > > > best that we can have the best drivers possible.
> > >
> > > You reworked the perf tool to support these things? Why? These change=
s
> > > are targetting chips in old iPhones afaict (as opposed to "Apple Sili=
con").
> > > I think that (a) most people don't particularly care about them and (=
b)
> > > they're not fully supported _anyway_ because of crazy stuff like [1].
> >
> > I was meaning that we reworked the perf tool to work around the Apple
> > ARM PMU driver expecting to work as if it were an uncore rather than a
> > core PMU driver. More context here:
> > "[REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5"
> > https://lore.kernel.org/lkml/08f1f185-e259-4014-9ca4-6411d5c1bc65@marca=
n.st/
> > But in general it would be nice Apple ARM PMU support were well loved.
> > I think we went 2 or 3 minor releases with the perf tool not working,
> > threats of substantial reverts to avoid the PMU driver bug being
> > exposed, etc.
>
> It's unfortunate that you've had a torrid time with the Apple PMU driver,
> but I think it's important to realise that it's both unmaintained (it
> ends up with me via the catch-all for drivers/perf/) and was written
> based off whatever reverse-engineering people could be bothered to do in
> their spare time. It's frankly remarkable that it works as well as it
> does.
>
> Despite all of that, I still don't think that your concerns apply to the
> patches in _this_ series, which is about adding support for older Apple
> chips.
>
> > As for which Apple ARM devices should have perf support, it seems the
> > more the merrier.
>
> Easy to say when you don't have to maintain the driver!

Well I do send patches ([1] is based on a patch I sent and James
reworked), but yeah. It is a bit strange in this case that we have
something that is both unmaintained but not taking a patch series due
to the cost of maintenance :-) Hopefully it can land.

Thanks,
Ian

[1] https://lore.kernel.org/lkml/20230710122138.1450930-2-james.clark@arm.c=
om/

>
> Will
