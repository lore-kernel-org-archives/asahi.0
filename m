Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C45383BF
	for <asahi@lists.linux.dev>; Fri, 23 Aug 2024 21:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724449583; cv=none; b=duhAEtO0iOjhbV9yOB+fei7jXZzA6sR1F2UfIGyhkIdtlGNEt2voHk4WII2ROGo3QGlcdlkGjTE04cSE+RKUee5f0/LCcqZzbWnwTWjAnCGR4E/Tn14xt2HTwRQ/rrpqUQQqEaLOgtkNMJmnkvlUWQmR2lk/JsdC19HEuWHe3tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724449583; c=relaxed/simple;
	bh=3pfZ1sPmNUvyG7TVwFvR3Rqz69rwliQPJGBAVEOGrUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pYgCXl/FBVtjxVzMoLPxMXlzDwF2Zg5RZ40DlwII3zJ4133IxyjNsB7bK9pRmCaXe0FOkow/hg3xX+KTTcgORJDtpi7NOYDLWVnG7RzkF9aN51UpWPcEaBuVPf4UzsOgzasM8aPt4dcNd/f2WE1pabGE+FvXOw94DFVsb7pTs4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3edb2d908so25015551fa.2
        for <asahi@lists.linux.dev>; Fri, 23 Aug 2024 14:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724449579; x=1725054379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pfZ1sPmNUvyG7TVwFvR3Rqz69rwliQPJGBAVEOGrUE=;
        b=fQMrs8dEYYlns54pVMQUiW/PCOvee0lXsXSzwet86fnHU0Ak6KXoHu3NRTc/OnHae+
         czTCqBKW2gw5Kls3umFBcTODaj3zkUrtKKjxdJ7Y861Z328cM1KVrKM/RiOKCUyVJefA
         FBYN3kxGDhbI5hGpjjPCfLa3O7HgQkTNwALrUW5GjEq1inZAlh+RbD8GLuZjvjdolken
         IrIXxl7XK/H8vpTCiyW6s6K6AvTaGAmgCaz/ZdXRc81OecM++NYbCeAMmb58YgQzYW1/
         dGGKLSe5tkqUiJNr1fgA64paTlee+TPd1pCL0XADfQxg1kmXTSeE3pdeRpBUQo8199fA
         YXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWckiEQ/jvpizIm98fFptDI9ohWPMeAuoQk7HpShV2wX1xRs4Ff5fx5vXKlC0u/+/OG0Zmhqg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh2XXDI+BPk4aNpqKaJ4epqRt164dCFFBfOUs3icMsoZUvWZmO
	GROxdcL0scSutW7lQTeuocXdq/lmnT/C75FsLZkwsNCL+xE4NTxEEWkrXGdD/sU=
X-Google-Smtp-Source: AGHT+IF+uokIT5erfrSSDL+rKsMuUze2j/KiPpSj1qqDYuVU1AqDui4YO68YVvm4lDh/La8VAGWe6w==
X-Received: by 2002:a2e:4e1a:0:b0:2f3:e2f0:f76 with SMTP id 38308e7fff4ca-2f4f493f270mr25589591fa.38.1724449578846;
        Fri, 23 Aug 2024 14:46:18 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f40487f7afsm5600331fa.117.2024.08.23.14.46.18
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Aug 2024 14:46:18 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3edb2d908so25015361fa.2
        for <asahi@lists.linux.dev>; Fri, 23 Aug 2024 14:46:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+XQydc0/OV++8c+rvjdoy7+Sr/w9VxXqblqF777gV5qlzR2CfU2mwjQRFpt80dI4eIIieYg==@lists.linux.dev
X-Received: by 2002:a2e:bc1b:0:b0:2f5:2ba:2c99 with SMTP id
 38308e7fff4ca-2f502ba2f21mr1927371fa.9.1724449578174; Fri, 23 Aug 2024
 14:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEg-Je8=t_cXKsWL0XSx3vF1gsArSWpychfbEf+yjM6wVz3Mjw@mail.gmail.com>
 <CAM22NNBrXSUbrpFAKv8jrREKTBYx_aW0cibtDE5AZ_kTijUrPA@mail.gmail.com>
In-Reply-To: <CAM22NNBrXSUbrpFAKv8jrREKTBYx_aW0cibtDE5AZ_kTijUrPA@mail.gmail.com>
From: Neal Gompa <ngompa@fedoraproject.org>
Date: Fri, 23 Aug 2024 17:45:41 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_9r_96j-un6TS7Dm_kJ3m7Q6y_RDEs9NTvxjNJM-zEvQ@mail.gmail.com>
Message-ID: <CAEg-Je_9r_96j-un6TS7Dm_kJ3m7Q6y_RDEs9NTvxjNJM-zEvQ@mail.gmail.com>
Subject: Re: Weird failure with bpftool when building 6.11-rc4 with clang+rust+lto
To: Matthew Maurer <matthew.r.maurer@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, bpf@vger.kernel.org, 
	"Justin M. Forbes" <jforbes@fedoraproject.org>, Davide Cavalca <dcavalca@fedoraproject.org>, 
	Janne Grunau <jannau@fedoraproject.org>, Hector Martin <marcan@fedoraproject.org>, 
	Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Matthew,

The current thinking is that maybe the culprit is dwarves. We've
backported a fix in Fedora that may help, I'm waiting to find out if
it does. Apparently all test runs with Clang+LTO are broken right now
with dwarves 1.27, so it wasn't just unique to my merge request.


On Tue, Aug 20, 2024 at 12:49=E2=80=AFPM Matthew Maurer
<matthew.r.maurer@gmail.com> wrote:
>
> Sorry that this isn't a solution, but I can tell you some background:
>
> Linux currently relies on the `--lang_exclude` flag to `pahole` to
> filter Rust debugging information out of the output BTF. This is done
> because various downstream tools (for example, bpftool) do not handle
> Rust types correctly. The `--lang_exclude` flag works by checking the
> language flag on the compilation unit the type is referenced in. Once
> LTO is enabled however, things can migrate from one compilation unit
> to another, leading to C code having Rust code and types referenced
> inside them. The resulting type will be considered C-language type by
> `pahole`, but is actually a Rust type. Even if you fixed bpftool,
> without additional patches/hacks, once the kernel boots it would
> likely fail to parse its own BTF debugging information, and disable
> BPF loading.
>
> The most confusing part to me here is that I only encountered this
> issue with x-lang LTO enabled, which is not available in the kernel
> you're building from. If this is happening without x-lang LTO enabled,
> it likely means that there's another way for debug symbols to leak
> across CUs during LTO. That's where I'd start looking - use `pahole`
> to dump the contents of `vmlinux.o` and see if you can find a
> C-language CU referencing a Rust type. Then, try to figure out how
> that's possible. With x-lang LTO it was obvious, inlining caused a
> bunch of issues.
>
> The last possibility I can think of is that somehow in your build
> configuration `pahole` is not being invoked with the `--lang_exclude`
> flag when building `vmlinux`. I don't know why that would be, but it
> might be worth double checking.
>
> On Tue, Aug 20, 2024 at 5:13=E2=80=AFAM Neal Gompa <ngompa@fedoraproject.=
org> wrote:
> >
> > Hey all,
> >
> > While working on enabling Rust in the Fedora kernel[1], we've managed
> > to get the setup almost completely working, but we have a build
> > failure with the clang+lto build variant[2][3].
> >
> > Based on the build failure log[4][5], it looks like there's some
> > random mixing of Rust inside of C code or something of the sort (which
> > obviously would be invalid).
> >
> > Can someone help with this?
> >
> > Thanks in advance and best regards,
> >
> > [1]: https://gitlab.com/cki-project/kernel-ark/-/merge_requests/3295
> > [2]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/index.html=
?prefix=3Dtrusted-artifacts/1419488480/build_x86_64/7618803903/artifacts/
> > [3]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/index.html=
?prefix=3Dtrusted-artifacts/1419488480/build_aarch64/7618803917/artifacts/
> > [4]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/trusted-ar=
tifacts/1419488480/build_x86_64/7618803903/artifacts/build-failure.log
> > [5]: https://s3.amazonaws.com/arr-cki-prod-trusted-artifacts/trusted-ar=
tifacts/1419488480/build_aarch64/7618803917/artifacts/build-failure.log
> >
> >
> > --
> > Neal Gompa (FAS: ngompa)
> >



--
Neal Gompa (FAS: ngompa)
