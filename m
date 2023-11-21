Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F6459176
	for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ygZlt4fx"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-507c9305727so3752e87.1
        for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 08:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700582989; x=1701187789; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+g6ZNjZgw0VerAKZgCKQ8Q7O7zLL0RwErGKIZaz9mc=;
        b=ygZlt4fxKOXbaUPDrH8F9W5WaQ+Bfp8GxZx7l/xL+T7HBDZJicLdmoan0WIvxieMXS
         mZ4QFgBHGPuG4ozPE0kX33hSoTbfSVWwM36lkpOxSD6PF7nTh/tsc7rryNinVhpMMTsH
         j3dUUy+Jx38YIZe0mShfwofKHC2doWwdzSVZulIMSZC4sgmDxMkhYjmBNxKxWC37XECk
         U49O+qbRPFTPWuutOvD4lHYRUqACH7bWVMuecnNxyj6lVuiQbPf/3wAe0wBRCwVGC1vL
         hJR+f8Vb3MoJWKFHnOyFCvLsfP8pnMZmxzgrv2tMbJ7eCbbnWWn+K+gB10R7D4mKte0q
         kmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582989; x=1701187789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+g6ZNjZgw0VerAKZgCKQ8Q7O7zLL0RwErGKIZaz9mc=;
        b=hI82UZqXNuFgAlFvlhI13VaQHb2ptcQp4XHhttW5xfSm2YSHPhTXhVpkTya+RB7a/L
         lvFiZKnN5R075TejLcyFwfATWZKJ73LDzomTy0q5eRmCALFu14diO6evUAVC9OGI5kUF
         B4fRAxWVN4LBziRq/OA+xlJ2QlwtDE24bDYbPbw76noQVI63tDVmFrLvexw0Xm1/3yPn
         2nwSG3dzjXEObctuRZRO5o6oyf1FMxAyBfkBF+Qjb+Dtgemhx1HTwPQcLSg8JwcfsQZZ
         zTDEidy9vEwbtDuoaHqOtrC+pe1WDkT9TAxlQ+QqLjlxw6jXw8IKxpnNS0Uwm78SYg/I
         8DuA==
X-Gm-Message-State: AOJu0Yz42QPBiH7uNZSrdV9UwpYcoXuSH1biVPx93XjO/9q0snrEcADt
	wqRQOBqVYsBabjJ9iRdCzKYpeLJpk9gHMfmRKsYxpR57c0TcdOqTb1RHsw==
X-Google-Smtp-Source: AGHT+IG4UtwOil95BJUApTjNEFjH1OGKk15n65KDssZBRHyDiXRZfJ4V4+jne352kKufw9I/IX0Bf73XpvVxe+RlRV4=
X-Received: by 2002:ac2:5635:0:b0:505:6e12:9e70 with SMTP id
 b21-20020ac25635000000b005056e129e70mr289331lff.6.1700582989212; Tue, 21 Nov
 2023 08:09:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>
 <86pm03z0kw.wl-maz@kernel.org> <86o7fnyvrq.wl-maz@kernel.org>
 <ZVzPUjOiH6zpUlz5@FVFF77S0Q05N.cambridge.arm.com> <CAP-5=fUB75DCL4+8YO62iPVsnxoeXGv5cLmT7eP2bHNs=xoMdg@mail.gmail.com>
 <ZVzUr7TWEYPoZrWX@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZVzUr7TWEYPoZrWX@FVFF77S0Q05N.cambridge.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 21 Nov 2023 08:09:37 -0800
Message-ID: <CAP-5=fUWm7efu3xdUBbiifs_KNU1igwAxbXmum=V38SjHQHtXg@mail.gmail.com>
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 8:03=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Tue, Nov 21, 2023 at 07:46:57AM -0800, Ian Rogers wrote:
> > On Tue, Nov 21, 2023 at 7:40=E2=80=AFAM Mark Rutland <mark.rutland@arm.=
com> wrote:
> > >
> > > On Tue, Nov 21, 2023 at 03:24:25PM +0000, Marc Zyngier wrote:
> > > > On Tue, 21 Nov 2023 13:40:31 +0000,
> > > > Marc Zyngier <maz@kernel.org> wrote:
> > > > >
> > > > > [Adding key people on Cc]
> > > > >
> > > > > On Tue, 21 Nov 2023 12:08:48 +0000,
> > > > > Hector Martin <marcan@marcan.st> wrote:
> > > > > >
> > > > > > Perf broke on all Apple ARM64 systems (tested almost everything=
), and
> > > > > > according to maz also on Juno (so, probably all big.LITTLE) sin=
ce v6.5.
> > > > >
> > > > > I can confirm that at least on 6.7-rc2, perf is pretty busted on =
any
> > > > > asymmetric ARM platform. It isn't clear what criteria is used to =
pick
> > > > > the PMU, but nothing works anymore.
> > > > >
> > > > > The saving grace in my case is that Debian still ships a 6.1 perf=
tool
> > > > > package, but that's obviously not going to last.
> > > > >
> > > > > I'm happy to test potential fixes.
> > > >
> > > > At Mark's request, I've dumped a couple of perf (as of -rc2) runs w=
ith
> > > > -vvv.  And it is quite entertaining (this is taskset to an 'icestor=
m'
> > > > CPU):
> > >
> > > IIUC the tool is doing the wrong thing here and overriding explicit
> > > ${pmu}/${event}/ events with PERF_TYPE_HARDWARE events rather than ev=
ents using
> > > that ${pmu}'s type and event namespace.
> > >
> > > Regardless of the *new* ABI that allows PERF_TYPE_HARDWARE events to =
be
> > > targetted to a specific PMU, it's semantically wrong to rewrite event=
s like
> > > this since ${pmu}/${event}/ is not necessarily equivalent to a simila=
rly-named
> > > PERF_COUNT_HW_${EVENT}.
> >
> > If you name a PMU and an event then the event should only be opened on
> > that PMU, 100% agree. There's a bunch of output, but when the legacy
> > cycles event is opened it appears to be because it was explicitly
> > requested.
>
> I think you've missed that the named PMU events are being erreously trans=
formed
> into PERF_TYPE_HARDWARE events. Look at the -vvv output, e.g.
>
>   Opening: apple_firestorm_pmu/cycles/
>   ------------------------------------------------------------
>   perf_event_attr:
>     type                             0 (PERF_TYPE_HARDWARE)
>     size                             136
>     config                           0 (PERF_COUNT_HW_CPU_CYCLES)
>     sample_type                      IDENTIFIER
>     read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNIN=
G
>     disabled                         1
>     inherit                          1
>     enable_on_exec                   1
>     exclude_guest                    1
>   ------------------------------------------------------------
>   sys_perf_event_open: pid 1045843  cpu -1  group_fd -1  flags 0x8 =3D 4
>
> ... which should not be PERF_TYPE_HARDWARE && PERF_COUNT_HW_CPU_CYCLES.
>
> Marc said that he bisected the issue down to commit:
>
>   5ea8f2ccffb23983 ("perf parse-events: Support hardware events as terms"=
)
>
> ... so it looks like something is going wrong when the events are being p=
arsed,
> e.g. losing the HW PMU information?

Ok, I think I'm getting confused by other things. This looks like the issue=
.

I think it may be working as intended, but not how you intended :-) If
a core PMU is listed and then a legacy event, the legacy event should
be opened on the core PMU as a legacy event with the extended type
set. This is to allow things like legacy cache events to be opened on
a specified PMU. Legacy event names match with a higher priority than
those in sysfs or json as they are hard coded. Presumably the
expectation was that by advertising a cycles event, presumably in
sysfs, then this is what would be matched.

Thanks,
Ian

> Thanks,
> Mark.
>
> >
> >
> > Thanks,
> > Ian
> >
> > > Mark.
> > >
> > > > <quote>
> > > > maz@valley-girl:~/hot-poop/arm-platforms/tools/perf$ sudo taskset -=
c 0 ./perf stat -vvv -e apple_icestorm_pmu/cycles/ -e
> > > >  apple_firestorm_pmu/cycles/ -e cycles ls
> > > > Using CPUID 0x00000000612f0280
> > > > Attempt to add: apple_icestorm_pmu/cycles=3D0/
> > > > ..after resolving event: apple_icestorm_pmu/cycles=3D0/
> > > > Opening: unknown-hardware:HG
> > > > ------------------------------------------------------------
> > > > perf_event_attr:
> > > >   type                             0 (PERF_TYPE_HARDWARE)
> > > >   config                           0xb00000000
> > > >   disabled                         1
> > > > ------------------------------------------------------------
> > > > sys_perf_event_open: pid 0  cpu -1  group_fd -1  flags 0x8
> > > > sys_perf_event_open failed, error -95
> > > > Attempt to add: apple_firestorm_pmu/cycles=3D0/
> > > > ..after resolving event: apple_firestorm_pmu/cycles=3D0/
> > > > Control descriptor is not initialized
> > > > Opening: apple_icestorm_pmu/cycles/
> > > > ------------------------------------------------------------
> > > > perf_event_attr:
> > > >   type                             0 (PERF_TYPE_HARDWARE)
> > > >   size                             136
> > > >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> > > >   sample_type                      IDENTIFIER
> > > >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RU=
NNING
> > > >   disabled                         1
> > > >   inherit                          1
> > > >   enable_on_exec                   1
> > > >   exclude_guest                    1
> > > > ------------------------------------------------------------
> > > > sys_perf_event_open: pid 1045843  cpu -1  group_fd -1  flags 0x8 =
=3D 3
> > > > Opening: apple_firestorm_pmu/cycles/
> > > > ------------------------------------------------------------
> > > > perf_event_attr:
> > > >   type                             0 (PERF_TYPE_HARDWARE)
> > > >   size                             136
> > > >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> > > >   sample_type                      IDENTIFIER
> > > >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RU=
NNING
> > > >   disabled                         1
> > > >   inherit                          1
> > > >   enable_on_exec                   1
> > > >   exclude_guest                    1
> > > > ------------------------------------------------------------
> > > > sys_perf_event_open: pid 1045843  cpu -1  group_fd -1  flags 0x8 =
=3D 4
> > > > Opening: cycles
> > > > ------------------------------------------------------------
> > > > perf_event_attr:
> > > >   type                             0 (PERF_TYPE_HARDWARE)
> > > >   size                             136
> > > >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> > > >   sample_type                      IDENTIFIER
> > > >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RU=
NNING
> > > >   disabled                         1
> > > >   inherit                          1
> > > >   enable_on_exec                   1
> > > >   exclude_guest                    1
> > > > ------------------------------------------------------------
> > > > sys_perf_event_open: pid 1045843  cpu -1  group_fd -1  flags 0x8 =
=3D 5
> > > > arch                  builtin-diff.o      builtin-mem.o        comm=
on-cmds.h    perf-completion.sh
> > > > bench                 builtin-evlist.c    builtin-probe.c      CRED=
ITS          perf.h
> > > > Build                 builtin-evlist.o    builtin-probe.o      desi=
gn.txt       perf-in.o
> > > > builtin-annotate.c    builtin-ftrace.c    builtin-record.c     dlfi=
lters        perf-iostat
> > > > builtin-annotate.o    builtin-ftrace.o    builtin-record.o     Docu=
mentation    perf-iostat.sh
> > > > builtin-bench.c               builtin.h           builtin-report.c =
    FEATURE-DUMP     perf.o
> > > > builtin-bench.o               builtin-help.c      builtin-report.o =
    include          perf-read-vdso.c
> > > > builtin-buildid-cache.c  builtin-help.o      builtin-sched.c   jvmt=
i            perf-sys.h
> > > > builtin-buildid-cache.o  builtin-inject.c    builtin-script.c  liba=
pi   PERF-VERSION-FILE
> > > > builtin-buildid-list.c        builtin-inject.o    builtin-script.o =
    libperf          perf-with-kcore
> > > > builtin-buildid-list.o        builtin-kallsyms.c  builtin-stat.c   =
    libsubcmd        pmu-events
> > > > builtin-c2c.c         builtin-kallsyms.o  builtin-stat.o       libs=
ymbol        python
> > > > builtin-c2c.o         builtin-kmem.c      builtin-timechart.c  Make=
file         python_ext_build
> > > > builtin-config.c      builtin-kvm.c       builtin-top.c        Make=
file.config  scripts
> > > > builtin-config.o      builtin-kvm.o       builtin-top.o        Make=
file.perf    tests
> > > > builtin-daemon.c      builtin-kwork.c     builtin-trace.c      MANI=
FEST         trace
> > > > builtin-daemon.o      builtin-list.c      builtin-version.c    perf=
             ui
> > > > builtin-data.c                builtin-list.o      builtin-version.o=
    perf-archive     util
> > > > builtin-data.o                builtin-lock.c      check-headers.sh =
    perf-archive.sh
> > > > builtin-diff.c                builtin-mem.c       command-list.txt =
    perf.c
> > > > apple_icestorm_pmu/cycles/: -1: 0 873709 0
> > > > apple_firestorm_pmu/cycles/: -1: 0 873709 0
> > > > cycles: -1: 0 873709 0
> > > > apple_icestorm_pmu/cycles/: 0 873709 0
> > > > apple_firestorm_pmu/cycles/: 0 873709 0
> > > > cycles: 0 873709 0
> > > >
> > > >  Performance counter stats for 'ls':
> > > >
> > > >      <not counted>      apple_icestorm_pmu/cycles/                 =
                             (0.00%)
> > > >      <not counted>      apple_firestorm_pmu/cycles/                =
                             (0.00%)
> > > >      <not counted>      cycles                                     =
                             (0.00%)
> > > >
> > > >        0.000002250 seconds time elapsed
> > > >
> > > >        0.000000000 seconds user
> > > >        0.000000000 seconds sys
> > > > </quote>
> > > >
> > > > If I run the same thing on another CPU cluster (firestorm), I get
> > > > this:
> > > >
> > > > <quote>
> > > > maz@valley-girl:~/hot-poop/arm-platforms/tools/perf$ sudo taskset -=
c 2 ./perf stat -vvv -e apple_icestorm_pmu/cycles/ -e
> > > >  apple_firestorm_pmu/cycles/ -e cycles ls
> > > > Using CPUID 0x00000000612f0280
> > > > Attempt to add: apple_icestorm_pmu/cycles=3D0/
> > > > ..after resolving event: apple_icestorm_pmu/cycles=3D0/
> > > > Opening: unknown-hardware:HG
> > > > ------------------------------------------------------------
> > > > perf_event_attr:
> > > >   type                             0 (PERF_TYPE_HARDWARE)
> > > >   config                           0xb00000000
> > > >   disabled                         1
> > > > ------------------------------------------------------------
> > > > sys_perf_event_open: pid 0  cpu -1  group_fd -1  flags 0x8
> > > > sys_perf_event_open failed, error -95
> > > > Attempt to add: apple_firestorm_pmu/cycles=3D0/
> > > > ..after resolving event: apple_firestorm_pmu/cycles=3D0/
> > > > Control descriptor is not initialized
> > > > Opening: apple_icestorm_pmu/cycles/
> > > > ------------------------------------------------------------
> > > > perf_event_attr:
> > > >   type                             0 (PERF_TYPE_HARDWARE)
> > > >   size                             136
> > > >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> > > >   sample_type                      IDENTIFIER
> > > >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RU=
NNING
> > > >   disabled                         1
> > > >   inherit                          1
> > > >   enable_on_exec                   1
> > > >   exclude_guest                    1
> > > > ------------------------------------------------------------
> > > > sys_perf_event_open: pid 1045925  cpu -1  group_fd -1  flags 0x8 =
=3D 3
> > > > Opening: apple_firestorm_pmu/cycles/
> > > > ------------------------------------------------------------
> > > > perf_event_attr:
> > > >   type                             0 (PERF_TYPE_HARDWARE)
> > > >   size                             136
> > > >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> > > >   sample_type                      IDENTIFIER
> > > >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RU=
NNING
> > > >   disabled                         1
> > > >   inherit                          1
> > > >   enable_on_exec                   1
> > > >   exclude_guest                    1
> > > > ------------------------------------------------------------
> > > > sys_perf_event_open: pid 1045925  cpu -1  group_fd -1  flags 0x8 =
=3D 4
> > > > Opening: cycles
> > > > ------------------------------------------------------------
> > > > perf_event_attr:
> > > >   type                             0 (PERF_TYPE_HARDWARE)
> > > >   size                             136
> > > >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> > > >   sample_type                      IDENTIFIER
> > > >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RU=
NNING
> > > >   disabled                         1
> > > >   inherit                          1
> > > >   enable_on_exec                   1
> > > >   exclude_guest                    1
> > > > ------------------------------------------------------------
> > > > sys_perf_event_open: pid 1045925  cpu -1  group_fd -1  flags 0x8 =
=3D 5
> > > > arch                  builtin-diff.o      builtin-mem.o        comm=
on-cmds.h    perf-completion.sh
> > > > bench                 builtin-evlist.c    builtin-probe.c      CRED=
ITS          perf.h
> > > > Build                 builtin-evlist.o    builtin-probe.o      desi=
gn.txt       perf-in.o
> > > > builtin-annotate.c    builtin-ftrace.c    builtin-record.c     dlfi=
lters        perf-iostat
> > > > builtin-annotate.o    builtin-ftrace.o    builtin-record.o     Docu=
mentation    perf-iostat.sh
> > > > builtin-bench.c               builtin.h           builtin-report.c =
    FEATURE-DUMP     perf.o
> > > > builtin-bench.o               builtin-help.c      builtin-report.o =
    include          perf-read-vdso.c
> > > > builtin-buildid-cache.c  builtin-help.o      builtin-sched.c   jvmt=
i            perf-sys.h
> > > > builtin-buildid-cache.o  builtin-inject.c    builtin-script.c  liba=
pi   PERF-VERSION-FILE
> > > > builtin-buildid-list.c        builtin-inject.o    builtin-script.o =
    libperf          perf-with-kcore
> > > > builtin-buildid-list.o        builtin-kallsyms.c  builtin-stat.c   =
    libsubcmd        pmu-events
> > > > builtin-c2c.c         builtin-kallsyms.o  builtin-stat.o       libs=
ymbol        python
> > > > builtin-c2c.o         builtin-kmem.c      builtin-timechart.c  Make=
file         python_ext_build
> > > > builtin-config.c      builtin-kvm.c       builtin-top.c        Make=
file.config  scripts
> > > > builtin-config.o      builtin-kvm.o       builtin-top.o        Make=
file.perf    tests
> > > > builtin-daemon.c      builtin-kwork.c     builtin-trace.c      MANI=
FEST         trace
> > > > builtin-daemon.o      builtin-list.c      builtin-version.c    perf=
             ui
> > > > builtin-data.c                builtin-list.o      builtin-version.o=
    perf-archive     util
> > > > builtin-data.o                builtin-lock.c      check-headers.sh =
    perf-archive.sh
> > > > builtin-diff.c                builtin-mem.c       command-list.txt =
    perf.c
> > > > apple_icestorm_pmu/cycles/: -1: 1035101 469125 469125
> > > > apple_firestorm_pmu/cycles/: -1: 1035035 469125 469125
> > > > cycles: -1: 1034653 469125 469125
> > > > apple_icestorm_pmu/cycles/: 1035101 469125 469125
> > > > apple_firestorm_pmu/cycles/: 1035035 469125 469125
> > > > cycles: 1034653 469125 469125
> > > >
> > > >  Performance counter stats for 'ls':
> > > >
> > > >          1,035,101      apple_icestorm_pmu/cycles/
> > > >          1,035,035      apple_firestorm_pmu/cycles/
> > > >          1,034,653      cycles
> > > >
> > > >        0.000001333 seconds time elapsed
> > > >
> > > >        0.000000000 seconds user
> > > >        0.000000000 seconds sys
> > > > </quote>
> > > >
> > > > which doesn't make any sense either. I really don't understand what
> > > > this PERF_TYPE_HARDWARE does here (the *real* types are 10 and 11),
> > > > nor what this 'cycle=3D0' stuff is.
> > > >
> > > > /puzzled
> > > >
> > > >       M.
> > > >
> > > > --
> > > > Without deviation from the norm, progress is not possible.
