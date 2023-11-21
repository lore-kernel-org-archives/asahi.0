Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5122259157
	for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 16:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JTcUarDD"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so16431a12.0
        for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 08:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700582603; x=1701187403; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNQwcfbwd5MPP15HDWRuvMnBXafc9Od52XUUUFOJgh0=;
        b=JTcUarDD//JHyoHA48f3VSGu6Oqi+yh2rUpGHxW09jRKyZ7EWWsujvg0/QPzt6TEa8
         CsdkX4vXx1ADYzVWr1G0mTxmBaxCA4FrBSlAZjvd8pYyMWVJkjvm5cAO1WQnr6a3wVoc
         g38FaXrrAMIBxjsMrGcKYzDeJz7bkI8VtZLZKzCYXS0eWWFDJdgOcE2KXsmXWRDz5C41
         84K06OcEdNIIazA2TciqyC/utnAirbDfljPJINxYbV1UfjY39gy3kjHsp4x7ZYd/rZUb
         lSlfLK455r9TMwQTA9UZJJr9hId5tgsN5QNLw+93Y4o7QTrQ2tF4gYW+dmDoqlNJKQ+l
         lsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582603; x=1701187403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNQwcfbwd5MPP15HDWRuvMnBXafc9Od52XUUUFOJgh0=;
        b=M+yE3TXpIq6bvJ5QKdHBB5LCrRAisFNQlBw+jmt9PdWTRHqo3DtsFtmV17Ty/ovZuc
         unSeIpupRrWruFQhxf9DA/MIBgZBb7iwcttTpWhwjdgUPxUVW5ytkVjDYBMSVuVf7tUy
         AxQZlJWhDrwTfi+kYAfyGKQQxlpd88eCuL418rdZZxVgUxvFdeXcHtjNmxdvC3O2Ocg6
         eLy4nh9fEmgVepG5Ua6CnCbDaUgYRsdDpEDSkP15cDvga+FjH0T3z4V2twigzdExwrbH
         aAHi/pECUIci2FrMPFD7c3HijWh8PyxT5/vnOmb0byKI/m7BQPEVIP3havZZPUE0Q9OU
         wPQA==
X-Gm-Message-State: AOJu0YxNiBWpfmxT0SKmlVYr9OM3VtZWwc2zyDxzs9gDhpBuGh0N8eqb
	Bm8eQpJCZPQPFVcPO7sycA/NyLZoqP+/AnroGd1Ugw==
X-Google-Smtp-Source: AGHT+IGRxcb1DcqNDtN3drDnBT//l5I9g8+kkBz4bUEvVZoz6tz2s2ESfEufGO7M78btFDFcrq3yWt45+h1rGRbPb/k=
X-Received: by 2002:a05:6402:ea1:b0:544:f741:62f4 with SMTP id
 h33-20020a0564020ea100b00544f74162f4mr466676eda.0.1700582603209; Tue, 21 Nov
 2023 08:03:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>
 <86pm03z0kw.wl-maz@kernel.org> <86o7fnyvrq.wl-maz@kernel.org>
 <CAP-5=fWeyorotfVz_y16ibakSwbNa0fapZoxSZ1nbkt1s=uGbw@mail.gmail.com> <ZVzTJhMsgjPw2OE4@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZVzTJhMsgjPw2OE4@FVFF77S0Q05N.cambridge.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 21 Nov 2023 08:03:11 -0800
Message-ID: <CAP-5=fWb+Nbs24+XzqVp_5U+ehwiuojedHfDu8AxP3kFd7B4KA@mail.gmail.com>
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 7:56=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Tue, Nov 21, 2023 at 07:41:17AM -0800, Ian Rogers wrote:
> > Hi Marc,
>
> Hi Ian,
>
> > I'm unclear if you are running a newer perf tool on an older kernel or
> > not. In any case I'll assume the kernel and perf tool versions match.
> > In Linux 6.6 this patch was added to the ARM PMU:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/drivers/perf/arm_pmu.c?id=3D5c816728651ae425954542fed64d21d40cb75a9f
> >
> > My guess is that the apple_icestorm_pmu requires a similar patch.
>
> The apple_icestorm_pmu PMU driver uses the arm_pmu framework, so it's usi=
ng
> that code (since v6.6).
>
> > The perf tool is supposed to not use extended types when they aren't
> > supported:
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/pmus.c?h=3Dperf-tools-next#n532
>
> How does that is_event_supported() check actually work? I suspect that's =
giving
> the wrong answer.

Maybe, the implementation is to check using perf_event_open:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/print-events.c?h=3Dperf-tools-next#n232

This is recycling logic from perf list where many legacy cache events
are elided due to a lack of support.

> Regardless, I think the tool is doing something semantically wrong, see b=
elow.
>
> > So I share your confusion as to why something broke.
> >
> > PERF_TYPE_HARDWARE is a legacy type where there are hardcoded type and
> > config values that correspond to an event. The PMU driver turns legacy
> > events into the real types. On BIG.little systems if the legacy events
> > are monitoring a task a different event is needed for each PMU (ie >1
> > event). In your example you are monitoring 'ls', a task, and so
> > different cycles events are necessary. In the high 32-bits (the
> > extended type) the PMU is identified.
>
> I think the interesting thing here is that the tool is mapping events wit=
h an
> explicit PMU into legacy PERF_TYPE_HARDWARE events, which is the opposite
> direction than intended. Regardless of whether PERF_TYPE_HARDWARE events =
can be
> targetted to a specific PMU, if the user has requested to use a specific =
PMU we
> should be using that PMU and related event namespace.
>
> Marc's command line was:
>
>         sudo taskset -c 0 ./perf stat -vvv \
>                 -e apple_icestorm_pmu/cycles/ \
>                 -e apple_firestorm_pmu/cycles/ \
>                 -e cycles \

-e cycles here is a direct request for the legacy cycles event. It
will match in the parser here:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/parse-events.l?h=3Dperf-tools-next#n301

which goes to:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/parse-events.y?h=3Dperf-tools-next#n397

and as this is a hardware event there is wildcard expansion on each core PM=
U.

Thanks,
Ian

>         ls
>
> ... and so the apple_*_pmu events should target their respective PMUs, an=
d the
> plain 'cycles' event could legitimately be opened as a single
> PERF_TYPE_HARDWARE event, or split into two directed PERF_TYPE_HARDWARE e=
vents
> targetting the two PMUs.
>
> However, thwe tool opens three (undirected?) PERF_TYPE_HARDWARE events:
>
> Opening: apple_icestorm_pmu/cycles/
> ------------------------------------------------------------
> perf_event_attr:
>   type                             0 (PERF_TYPE_HARDWARE)
>   size                             136
>   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
>   sample_type                      IDENTIFIER
>   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING
>   disabled                         1
>   inherit                          1
>   enable_on_exec                   1
>   exclude_guest                    1
> ------------------------------------------------------------
> sys_perf_event_open: pid 1045843  cpu -1  group_fd -1  flags 0x8 =3D 3
> Opening: apple_firestorm_pmu/cycles/
> ------------------------------------------------------------
> perf_event_attr:
>   type                             0 (PERF_TYPE_HARDWARE)
>   size                             136
>   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
>   sample_type                      IDENTIFIER
>   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING
>   disabled                         1
>   inherit                          1
>   enable_on_exec                   1
>   exclude_guest                    1
> ------------------------------------------------------------
> sys_perf_event_open: pid 1045843  cpu -1  group_fd -1  flags 0x8 =3D 4
> Opening: cycles
> ------------------------------------------------------------
> perf_event_attr:
>   type                             0 (PERF_TYPE_HARDWARE)
>   size                             136
>   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
>   sample_type                      IDENTIFIER
>   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING
>   disabled                         1
>   inherit                          1
>   enable_on_exec                   1
>   exclude_guest                    1
> ------------------------------------------------------------
>
> Mark.
