Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E762F5675D
	for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 15:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="05L0nFdM"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-548ae9a5eeaso12846a12.1
        for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 07:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700581629; x=1701186429; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loWXDVajgPYkO7LZXeMa1SN5rgtnUziCWFdSczt5uBo=;
        b=05L0nFdMScqfJOO2s652LexzAA5cuMIfvirI6v/3PK/nXwZXjviTmiLP5vd6SiHWeP
         /j7yjYSsHnWrnQQCFB3v0SbxH2XhSFZL7yinu+KT87StlMNAwVKjcsKnKZeZL7EOtvGk
         PO/wh72C7ZWnl+xndSrSfLOBAXflx8ZfXtXwjHVieTZrM41a50Cif4A90AWGG4z/B2KD
         VqpMd7+/2bW8C36MVfSQlYjNuBa3H2b7Sw0azILvnVLkKvgZ4pGilQ0/NJcD0IKEI1wA
         T7FP8YCx4m/TZb1mMDoOSq2tr/IYsG2lf+euZq6OqK8LCg5MZdN+/f/rNk5Qj7jShbg3
         kL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700581629; x=1701186429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loWXDVajgPYkO7LZXeMa1SN5rgtnUziCWFdSczt5uBo=;
        b=fFMtIfHgjSFbChBprB+W+Ngtc5+vzgCssbFAvuVl03CaCU16cLJ+7ZobzxYDpDIyXg
         SF7wguiCQ59dNVXC1YfuVydTLEEEH2Yi5PchfvI5PziJNu4LOCRMp9CLaA1v+x6UhrqV
         KZX45f3zqxf4NmYHocRpb4I3eX4ulrDkTHq2dNw7jB5sDP74+eMFpw7go10bRwVqDRc8
         ylsRazCw6E3rL8llLS9ieCUaBqqBbGjLbF/k63u2WNQrGD/tgdiHBLj0Xvo7T4dGAkx+
         Ssz9WUk+m1P3VwwQOHxVkrcHjr+xNKxVGWbVBh1SO3T8+8Frn5KLoLT7dKmkRN3c7cqQ
         18PA==
X-Gm-Message-State: AOJu0YzXBExQYDnLy/KBwG9lVz7rJXUZKu9ezdZhH/z7QYvfj4HZTB08
	wbVvIgPkba6iJ+a0kt+lwng9MA7uvZzdaX4acrIusQ==
X-Google-Smtp-Source: AGHT+IEzijGwt7m/Q7MihxYlFOWGwGiGTAMvTK7rA2WceviMTx0qQNIqybnIw6SaahrlHXWJnlCncvk5k+1874tji3s=
X-Received: by 2002:a05:6402:514f:b0:545:94c:862e with SMTP id
 n15-20020a056402514f00b00545094c862emr449767edd.2.1700581628817; Tue, 21 Nov
 2023 07:47:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>
 <86pm03z0kw.wl-maz@kernel.org> <86o7fnyvrq.wl-maz@kernel.org> <ZVzPUjOiH6zpUlz5@FVFF77S0Q05N.cambridge.arm.com>
In-Reply-To: <ZVzPUjOiH6zpUlz5@FVFF77S0Q05N.cambridge.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 21 Nov 2023 07:46:57 -0800
Message-ID: <CAP-5=fUB75DCL4+8YO62iPVsnxoeXGv5cLmT7eP2bHNs=xoMdg@mail.gmail.com>
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5
To: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 7:40=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Tue, Nov 21, 2023 at 03:24:25PM +0000, Marc Zyngier wrote:
> > On Tue, 21 Nov 2023 13:40:31 +0000,
> > Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > [Adding key people on Cc]
> > >
> > > On Tue, 21 Nov 2023 12:08:48 +0000,
> > > Hector Martin <marcan@marcan.st> wrote:
> > > >
> > > > Perf broke on all Apple ARM64 systems (tested almost everything), a=
nd
> > > > according to maz also on Juno (so, probably all big.LITTLE) since v=
6.5.
> > >
> > > I can confirm that at least on 6.7-rc2, perf is pretty busted on any
> > > asymmetric ARM platform. It isn't clear what criteria is used to pick
> > > the PMU, but nothing works anymore.
> > >
> > > The saving grace in my case is that Debian still ships a 6.1 perftool
> > > package, but that's obviously not going to last.
> > >
> > > I'm happy to test potential fixes.
> >
> > At Mark's request, I've dumped a couple of perf (as of -rc2) runs with
> > -vvv.  And it is quite entertaining (this is taskset to an 'icestorm'
> > CPU):
>
> IIUC the tool is doing the wrong thing here and overriding explicit
> ${pmu}/${event}/ events with PERF_TYPE_HARDWARE events rather than events=
 using
> that ${pmu}'s type and event namespace.
>
> Regardless of the *new* ABI that allows PERF_TYPE_HARDWARE events to be
> targetted to a specific PMU, it's semantically wrong to rewrite events li=
ke
> this since ${pmu}/${event}/ is not necessarily equivalent to a similarly-=
named
> PERF_COUNT_HW_${EVENT}.

If you name a PMU and an event then the event should only be opened on
that PMU, 100% agree. There's a bunch of output, but when the legacy
cycles event is opened it appears to be because it was explicitly
requested.

Thanks,
Ian

> Mark.
>
> > <quote>
> > maz@valley-girl:~/hot-poop/arm-platforms/tools/perf$ sudo taskset -c 0 =
./perf stat -vvv -e apple_icestorm_pmu/cycles/ -e
> >  apple_firestorm_pmu/cycles/ -e cycles ls
> > Using CPUID 0x00000000612f0280
> > Attempt to add: apple_icestorm_pmu/cycles=3D0/
> > ..after resolving event: apple_icestorm_pmu/cycles=3D0/
> > Opening: unknown-hardware:HG
> > ------------------------------------------------------------
> > perf_event_attr:
> >   type                             0 (PERF_TYPE_HARDWARE)
> >   config                           0xb00000000
> >   disabled                         1
> > ------------------------------------------------------------
> > sys_perf_event_open: pid 0  cpu -1  group_fd -1  flags 0x8
> > sys_perf_event_open failed, error -95
> > Attempt to add: apple_firestorm_pmu/cycles=3D0/
> > ..after resolving event: apple_firestorm_pmu/cycles=3D0/
> > Control descriptor is not initialized
> > Opening: apple_icestorm_pmu/cycles/
> > ------------------------------------------------------------
> > perf_event_attr:
> >   type                             0 (PERF_TYPE_HARDWARE)
> >   size                             136
> >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> >   sample_type                      IDENTIFIER
> >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNIN=
G
> >   disabled                         1
> >   inherit                          1
> >   enable_on_exec                   1
> >   exclude_guest                    1
> > ------------------------------------------------------------
> > sys_perf_event_open: pid 1045843  cpu -1  group_fd -1  flags 0x8 =3D 3
> > Opening: apple_firestorm_pmu/cycles/
> > ------------------------------------------------------------
> > perf_event_attr:
> >   type                             0 (PERF_TYPE_HARDWARE)
> >   size                             136
> >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> >   sample_type                      IDENTIFIER
> >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNIN=
G
> >   disabled                         1
> >   inherit                          1
> >   enable_on_exec                   1
> >   exclude_guest                    1
> > ------------------------------------------------------------
> > sys_perf_event_open: pid 1045843  cpu -1  group_fd -1  flags 0x8 =3D 4
> > Opening: cycles
> > ------------------------------------------------------------
> > perf_event_attr:
> >   type                             0 (PERF_TYPE_HARDWARE)
> >   size                             136
> >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> >   sample_type                      IDENTIFIER
> >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNIN=
G
> >   disabled                         1
> >   inherit                          1
> >   enable_on_exec                   1
> >   exclude_guest                    1
> > ------------------------------------------------------------
> > sys_perf_event_open: pid 1045843  cpu -1  group_fd -1  flags 0x8 =3D 5
> > arch                  builtin-diff.o      builtin-mem.o        common-c=
mds.h    perf-completion.sh
> > bench                 builtin-evlist.c    builtin-probe.c      CREDITS =
         perf.h
> > Build                 builtin-evlist.o    builtin-probe.o      design.t=
xt       perf-in.o
> > builtin-annotate.c    builtin-ftrace.c    builtin-record.c     dlfilter=
s        perf-iostat
> > builtin-annotate.o    builtin-ftrace.o    builtin-record.o     Document=
ation    perf-iostat.sh
> > builtin-bench.c               builtin.h           builtin-report.c     =
FEATURE-DUMP     perf.o
> > builtin-bench.o               builtin-help.c      builtin-report.o     =
include          perf-read-vdso.c
> > builtin-buildid-cache.c  builtin-help.o      builtin-sched.c   jvmti   =
         perf-sys.h
> > builtin-buildid-cache.o  builtin-inject.c    builtin-script.c  libapi  =
 PERF-VERSION-FILE
> > builtin-buildid-list.c        builtin-inject.o    builtin-script.o     =
libperf          perf-with-kcore
> > builtin-buildid-list.o        builtin-kallsyms.c  builtin-stat.c       =
libsubcmd        pmu-events
> > builtin-c2c.c         builtin-kallsyms.o  builtin-stat.o       libsymbo=
l        python
> > builtin-c2c.o         builtin-kmem.c      builtin-timechart.c  Makefile=
         python_ext_build
> > builtin-config.c      builtin-kvm.c       builtin-top.c        Makefile=
.config  scripts
> > builtin-config.o      builtin-kvm.o       builtin-top.o        Makefile=
.perf    tests
> > builtin-daemon.c      builtin-kwork.c     builtin-trace.c      MANIFEST=
         trace
> > builtin-daemon.o      builtin-list.c      builtin-version.c    perf    =
         ui
> > builtin-data.c                builtin-list.o      builtin-version.o    =
perf-archive     util
> > builtin-data.o                builtin-lock.c      check-headers.sh     =
perf-archive.sh
> > builtin-diff.c                builtin-mem.c       command-list.txt     =
perf.c
> > apple_icestorm_pmu/cycles/: -1: 0 873709 0
> > apple_firestorm_pmu/cycles/: -1: 0 873709 0
> > cycles: -1: 0 873709 0
> > apple_icestorm_pmu/cycles/: 0 873709 0
> > apple_firestorm_pmu/cycles/: 0 873709 0
> > cycles: 0 873709 0
> >
> >  Performance counter stats for 'ls':
> >
> >      <not counted>      apple_icestorm_pmu/cycles/                     =
                         (0.00%)
> >      <not counted>      apple_firestorm_pmu/cycles/                    =
                         (0.00%)
> >      <not counted>      cycles                                         =
                         (0.00%)
> >
> >        0.000002250 seconds time elapsed
> >
> >        0.000000000 seconds user
> >        0.000000000 seconds sys
> > </quote>
> >
> > If I run the same thing on another CPU cluster (firestorm), I get
> > this:
> >
> > <quote>
> > maz@valley-girl:~/hot-poop/arm-platforms/tools/perf$ sudo taskset -c 2 =
./perf stat -vvv -e apple_icestorm_pmu/cycles/ -e
> >  apple_firestorm_pmu/cycles/ -e cycles ls
> > Using CPUID 0x00000000612f0280
> > Attempt to add: apple_icestorm_pmu/cycles=3D0/
> > ..after resolving event: apple_icestorm_pmu/cycles=3D0/
> > Opening: unknown-hardware:HG
> > ------------------------------------------------------------
> > perf_event_attr:
> >   type                             0 (PERF_TYPE_HARDWARE)
> >   config                           0xb00000000
> >   disabled                         1
> > ------------------------------------------------------------
> > sys_perf_event_open: pid 0  cpu -1  group_fd -1  flags 0x8
> > sys_perf_event_open failed, error -95
> > Attempt to add: apple_firestorm_pmu/cycles=3D0/
> > ..after resolving event: apple_firestorm_pmu/cycles=3D0/
> > Control descriptor is not initialized
> > Opening: apple_icestorm_pmu/cycles/
> > ------------------------------------------------------------
> > perf_event_attr:
> >   type                             0 (PERF_TYPE_HARDWARE)
> >   size                             136
> >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> >   sample_type                      IDENTIFIER
> >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNIN=
G
> >   disabled                         1
> >   inherit                          1
> >   enable_on_exec                   1
> >   exclude_guest                    1
> > ------------------------------------------------------------
> > sys_perf_event_open: pid 1045925  cpu -1  group_fd -1  flags 0x8 =3D 3
> > Opening: apple_firestorm_pmu/cycles/
> > ------------------------------------------------------------
> > perf_event_attr:
> >   type                             0 (PERF_TYPE_HARDWARE)
> >   size                             136
> >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> >   sample_type                      IDENTIFIER
> >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNIN=
G
> >   disabled                         1
> >   inherit                          1
> >   enable_on_exec                   1
> >   exclude_guest                    1
> > ------------------------------------------------------------
> > sys_perf_event_open: pid 1045925  cpu -1  group_fd -1  flags 0x8 =3D 4
> > Opening: cycles
> > ------------------------------------------------------------
> > perf_event_attr:
> >   type                             0 (PERF_TYPE_HARDWARE)
> >   size                             136
> >   config                           0 (PERF_COUNT_HW_CPU_CYCLES)
> >   sample_type                      IDENTIFIER
> >   read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNIN=
G
> >   disabled                         1
> >   inherit                          1
> >   enable_on_exec                   1
> >   exclude_guest                    1
> > ------------------------------------------------------------
> > sys_perf_event_open: pid 1045925  cpu -1  group_fd -1  flags 0x8 =3D 5
> > arch                  builtin-diff.o      builtin-mem.o        common-c=
mds.h    perf-completion.sh
> > bench                 builtin-evlist.c    builtin-probe.c      CREDITS =
         perf.h
> > Build                 builtin-evlist.o    builtin-probe.o      design.t=
xt       perf-in.o
> > builtin-annotate.c    builtin-ftrace.c    builtin-record.c     dlfilter=
s        perf-iostat
> > builtin-annotate.o    builtin-ftrace.o    builtin-record.o     Document=
ation    perf-iostat.sh
> > builtin-bench.c               builtin.h           builtin-report.c     =
FEATURE-DUMP     perf.o
> > builtin-bench.o               builtin-help.c      builtin-report.o     =
include          perf-read-vdso.c
> > builtin-buildid-cache.c  builtin-help.o      builtin-sched.c   jvmti   =
         perf-sys.h
> > builtin-buildid-cache.o  builtin-inject.c    builtin-script.c  libapi  =
 PERF-VERSION-FILE
> > builtin-buildid-list.c        builtin-inject.o    builtin-script.o     =
libperf          perf-with-kcore
> > builtin-buildid-list.o        builtin-kallsyms.c  builtin-stat.c       =
libsubcmd        pmu-events
> > builtin-c2c.c         builtin-kallsyms.o  builtin-stat.o       libsymbo=
l        python
> > builtin-c2c.o         builtin-kmem.c      builtin-timechart.c  Makefile=
         python_ext_build
> > builtin-config.c      builtin-kvm.c       builtin-top.c        Makefile=
.config  scripts
> > builtin-config.o      builtin-kvm.o       builtin-top.o        Makefile=
.perf    tests
> > builtin-daemon.c      builtin-kwork.c     builtin-trace.c      MANIFEST=
         trace
> > builtin-daemon.o      builtin-list.c      builtin-version.c    perf    =
         ui
> > builtin-data.c                builtin-list.o      builtin-version.o    =
perf-archive     util
> > builtin-data.o                builtin-lock.c      check-headers.sh     =
perf-archive.sh
> > builtin-diff.c                builtin-mem.c       command-list.txt     =
perf.c
> > apple_icestorm_pmu/cycles/: -1: 1035101 469125 469125
> > apple_firestorm_pmu/cycles/: -1: 1035035 469125 469125
> > cycles: -1: 1034653 469125 469125
> > apple_icestorm_pmu/cycles/: 1035101 469125 469125
> > apple_firestorm_pmu/cycles/: 1035035 469125 469125
> > cycles: 1034653 469125 469125
> >
> >  Performance counter stats for 'ls':
> >
> >          1,035,101      apple_icestorm_pmu/cycles/
> >          1,035,035      apple_firestorm_pmu/cycles/
> >          1,034,653      cycles
> >
> >        0.000001333 seconds time elapsed
> >
> >        0.000000000 seconds user
> >        0.000000000 seconds sys
> > </quote>
> >
> > which doesn't make any sense either. I really don't understand what
> > this PERF_TYPE_HARDWARE does here (the *real* types are 10 and 11),
> > nor what this 'cycle=3D0' stuff is.
> >
> > /puzzled
> >
> >       M.
> >
> > --
> > Without deviation from the norm, progress is not possible.
