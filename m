Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA57200DB
	for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UsKLGNTU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40837124e1cso84655e9.0
        for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 08:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700584738; x=1701189538; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9XU0AWE1T+1mScmN12mxBP4eAvi45H7i3NBZsgxcv4=;
        b=UsKLGNTUvw5lanjwlKCKYm++aNUAHpAar2TMeWfG7Tc1Sqhkz9dmgs9Tcd33TeFt0U
         omPbJtnT/Su3EJJl/W45j268iBPxTUtTdh1ViXSWiLR8QNivwombJrzWjwNkJvlnTuem
         b6yjVh3GCZX9/SAdsguPz65Z2zI9Dzo5rHZv+YgESYmHcEjVlKzhj85n0r05NEPr1qjc
         n5rPgzgmRiu348AD2RSdYKRTJl50PmloVTa2S0WrWdnUJW5ujU0mo30Y0TxilJCuWIVe
         GOv97PcsB4/oXjFQF3Csxx4/zIsUKpJdeoN4t9cJ6bNT47RXnOcIjnVzXrzvMMq2dqgt
         fSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700584738; x=1701189538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9XU0AWE1T+1mScmN12mxBP4eAvi45H7i3NBZsgxcv4=;
        b=tOq20ah334RDQjn2FXmFI9Y5Ze+kLcMBHXAIUFIs9++3CA0XZTpztiweVJ38U8iVMS
         H1uKoOEdp5m/3vZEXJKh4Tu2L9Kc2DuP+d0wiBClW9bxrboShyHTu0NZo58k0WA/RZyE
         IOyfgfYqZDZ17bnWzUj6V+lqEp4bK7iyV8fdt8D/BTGjJGF2oJ6ejGV3NtO0dx/7aO0T
         T/qeRgVfUIJ22/mAHaZmym8i7KCHCYV4cuv+M+W3pVJJzH6KFOnXjMUtqNJnSQsfmQOt
         Uc37OoPOdtDDc1VYrNWy1kcpDAL9hZXL0AFE4sgAUnFBI10qvCPlIIAwTrffoKjqwZtz
         Tflw==
X-Gm-Message-State: AOJu0YzfqQWdM1jBz0+BTkpnNayLY7vxmoNppHHPyofZLdw9gV1ojfRm
	3ShUDK2HBAVmlgb7CWjerFCA1MzdNBbhL3J2S6/8uQ==
X-Google-Smtp-Source: AGHT+IE9+K6JHLndDS3tEvtsUuc7oTW6oRtoxhqQTPwJjlRDFfWC4mCxRvWnaNpFxeGstLrXoKhDxRluDO+WN0/+E/g=
X-Received: by 2002:a05:600c:c8d:b0:40b:2ec6:2a87 with SMTP id
 fj13-20020a05600c0c8d00b0040b2ec62a87mr8380wmb.5.1700584737994; Tue, 21 Nov
 2023 08:38:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>
 <86pm03z0kw.wl-maz@kernel.org> <86o7fnyvrq.wl-maz@kernel.org>
 <ZVzPUjOiH6zpUlz5@FVFF77S0Q05N.cambridge.arm.com> <CAP-5=fUB75DCL4+8YO62iPVsnxoeXGv5cLmT7eP2bHNs=xoMdg@mail.gmail.com>
 <ZVzUr7TWEYPoZrWX@FVFF77S0Q05N.cambridge.arm.com> <CAP-5=fUWm7efu3xdUBbiifs_KNU1igwAxbXmum=V38SjHQHtXg@mail.gmail.com>
 <ZVzXjz_0nYbmSGPQ@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZVzXjz_0nYbmSGPQ@FVFF77S0Q05N.cambridge.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 21 Nov 2023 08:38:45 -0800
Message-ID: <CAP-5=fWLGOCWv=wp2xsi4AVxfbS8KhkmtkMwOA4yVrz791=Z8Q@mail.gmail.com>
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 8:15=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Tue, Nov 21, 2023 at 08:09:37AM -0800, Ian Rogers wrote:
> > On Tue, Nov 21, 2023 at 8:03=E2=80=AFAM Mark Rutland <mark.rutland@arm.=
com> wrote:
> > >
> > > On Tue, Nov 21, 2023 at 07:46:57AM -0800, Ian Rogers wrote:
> > > > On Tue, Nov 21, 2023 at 7:40=E2=80=AFAM Mark Rutland <mark.rutland@=
arm.com> wrote:
> > > > >
> > > > > On Tue, Nov 21, 2023 at 03:24:25PM +0000, Marc Zyngier wrote:
> > > > > > On Tue, 21 Nov 2023 13:40:31 +0000,
> > > > > > Marc Zyngier <maz@kernel.org> wrote:
> > > > > > >
> > > > > > > [Adding key people on Cc]
> > > > > > >
> > > > > > > On Tue, 21 Nov 2023 12:08:48 +0000,
> > > > > > > Hector Martin <marcan@marcan.st> wrote:
> > > > > > > >
> > > > > > > > Perf broke on all Apple ARM64 systems (tested almost everyt=
hing), and
> > > > > > > > according to maz also on Juno (so, probably all big.LITTLE)=
 since v6.5.
> > > > > > >
> > > > > > > I can confirm that at least on 6.7-rc2, perf is pretty busted=
 on any
> > > > > > > asymmetric ARM platform. It isn't clear what criteria is used=
 to pick
> > > > > > > the PMU, but nothing works anymore.
> > > > > > >
> > > > > > > The saving grace in my case is that Debian still ships a 6.1 =
perftool
> > > > > > > package, but that's obviously not going to last.
> > > > > > >
> > > > > > > I'm happy to test potential fixes.
> > > > > >
> > > > > > At Mark's request, I've dumped a couple of perf (as of -rc2) ru=
ns with
> > > > > > -vvv.  And it is quite entertaining (this is taskset to an 'ice=
storm'
> > > > > > CPU):
> > > > >
> > > > > IIUC the tool is doing the wrong thing here and overriding explic=
it
> > > > > ${pmu}/${event}/ events with PERF_TYPE_HARDWARE events rather tha=
n events using
> > > > > that ${pmu}'s type and event namespace.
> > > > >
> > > > > Regardless of the *new* ABI that allows PERF_TYPE_HARDWARE events=
 to be
> > > > > targetted to a specific PMU, it's semantically wrong to rewrite e=
vents like
> > > > > this since ${pmu}/${event}/ is not necessarily equivalent to a si=
milarly-named
> > > > > PERF_COUNT_HW_${EVENT}.
> > > >
> > > > If you name a PMU and an event then the event should only be opened=
 on
> > > > that PMU, 100% agree. There's a bunch of output, but when the legac=
y
> > > > cycles event is opened it appears to be because it was explicitly
> > > > requested.
> > >
> > > I think you've missed that the named PMU events are being erreously t=
ransformed
> > > into PERF_TYPE_HARDWARE events. Look at the -vvv output, e.g.
> > >
> > >   Opening: apple_firestorm_pmu/cycles/
> > >   ------------------------------------------------------------
> > >   perf_event_attr:
> > >     type                             0 (PERF_TYPE_HARDWARE)
> > >     size                             136
> > >     config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> > >     sample_type                      IDENTIFIER
> > >     read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RU=
NNING
> > >     disabled                         1
> > >     inherit                          1
> > >     enable_on_exec                   1
> > >     exclude_guest                    1
> > >   ------------------------------------------------------------
> > >   sys_perf_event_open: pid 1045843  cpu -1  group_fd -1  flags 0x8 =
=3D 4
> > >
> > > ... which should not be PERF_TYPE_HARDWARE && PERF_COUNT_HW_CPU_CYCLE=
S.
> > >
> > > Marc said that he bisected the issue down to commit:
> > >
> > >   5ea8f2ccffb23983 ("perf parse-events: Support hardware events as te=
rms")
> > >
> > > ... so it looks like something is going wrong when the events are bei=
ng parsed,
> > > e.g. losing the HW PMU information?
> >
> > Ok, I think I'm getting confused by other things. This looks like the i=
ssue.
> >
> > I think it may be working as intended, but not how you intended :-) If
> > a core PMU is listed and then a legacy event, the legacy event should
> > be opened on the core PMU as a legacy event with the extended type
> > set. This is to allow things like legacy cache events to be opened on
> > a specified PMU. Legacy event names match with a higher priority than
> > those in sysfs or json as they are hard coded.
>
> That has never been the case previously, so this is user-visible breakage=
, and
> it prevents users from being able to do the right thing, so I think that'=
s a
> broken design.

So the problem was caused by ARM and Intel doing two different things.
Intel did at least contribute to the perf tool in support for their
BIG.little/hybrid, so that's why the semantics match their approach.

> > Presumably the expectation was that by advertising a cycles event, pres=
umably
> > in sysfs, then this is what would be matched.
>
> I expect that if I ask for ${pmu}/${event}/, that PMU is used, and the ev=
ent
> *in that PMU's namespace* is used. Overriding that breaks long-establishe=
d
> practice and provides users with no recourse to get the behavioru they ex=
pect
> (and previosuly had).

On ARM but not Intel.

> I do think that (regardless of whther this was the sematnic you intended)
> silently overriding events with legacy events is a bug, and one we should=
 fix.
> As I mentioned in another reply, just because the events have the same na=
me
> does not mean that they are semantically the same, so we're liable to giv=
e
> people the wrong numbers anyhow.
>
> Can we fix this?

So I'd like to fix this, some things from various conversations:

1) we lack testing. Our testing relies on the sysfs of the machine
being run on, which is better than nothing. I think ideally we'd have
a collection of zipped up sysfs directories and then we could have a
test that asserts on ARM you get the behavior you want.

2) for RISC-V they want to make the legacy event matching something in
user land to simplify the PMU driver.

3) I'd like to get rid of the PMU json interface. My idea is to
convert json events/metrics into sysfs style files, zip these up and
then link them into the perf binary. On Intel the json is 70% of the
binary (7MB out of 10MB) and we may get this down to 3MB with this
approach. The json lookup would need to incorporate the cpuid matching
that currently exists. When we look up an event I'd like the approach
to be like unionfs with a specified but configurable order. Users
could provide directories of their own events/metrics for various
PMUs, and then this approach could be used to help with (1).

Those proposals are not something to add as a -rc fix, so what I think
you're asking for here is a "if ARM" fix somewhere in the event
parsing. That's of course possible but it will cause problems if you
did say:

perf stat -e arm_pmu/LLC-load-misses/ ...

as I doubt the PMU driver is advertising this legacy event in sysfs
and the "if ARM" logic would presumably be trying to disable legacy
events in the term list for the ARM PMU.

Given all of this, is anything actually broken and needing a fix for 6.7?

Thanks,
Ian

> Mark.
