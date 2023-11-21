Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9465811B
	for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qgn2K4FL"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50931d0bb04so4068e87.0
        for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 07:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700581290; x=1701186090; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vN98iJok04mhFT1AZ9rPESZWqF/tM5+m7RdbYYi9+ZA=;
        b=qgn2K4FLzK+rhpcu7N5o9SnOJGEZ6edfCEWTfM2oqRIoYu3Xkc3KHsX67qBdDsJVr5
         BACjAxwQaSAI0lyllflzaOwCUu+daBe8TQGD8T6xJgmX0g3SdaTD6tf6efaUZExXW1HN
         axR8mBVBLnmjiK5e4rSEbx6QXq9B48rBKQerPv+fAuoY1hgmVpspnEDBzO6iOOFn00xf
         tD5o9C0Z6g5Ap58zVpW/2k+m5/nSXEfke2vJbJP+qUO+Hd8+dnAoyJdaAc0hg5g83+sT
         XCNptW17eJ4OzE8RgDfjXA6k1yiywlXbDlPKtcAsgEELzU/HM8YJIYEmeuHr+QEuWsci
         i1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700581290; x=1701186090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vN98iJok04mhFT1AZ9rPESZWqF/tM5+m7RdbYYi9+ZA=;
        b=JMKrKR/TlP6fNTicVHgHsjuP2duPDztHWCNJVoD6jGtxSm9L5o1jdkOdRzWe0o1Mop
         im1o8LCZqX6TECJ90l3/aK9c2BSWQCh5p7zcMnZOpnrWNjcOxGev5rtkG+VgKk/GpvFZ
         FOh6jjlUt//A0ToR0qfQpUQAqw+RxuFHfcp57tyATtjqr9oIUghIlHbubbP3wVYKwlA/
         gtaGmkfVMivdvCySOO19JLOcNNEaUr0mTWQjnZZPGByfWlPbqx7oEChhxbfyD/KOJQEX
         YF71J5EwuALN7ve06uJ9YU2lIc0cXwqTh/RLMAGrq6M6Tgf6uPCEg8UJo9tTtFrUE6Jx
         ly4Q==
X-Gm-Message-State: AOJu0YyQEnntA5pMF5lR/w7ABU+HBOr+kQCWP2YwHuh0b4OgtKdF+FLj
	TDuQsFRO39PMoN3NmNvGe2z/gSogqr5Iz9urg1sDGg==
X-Google-Smtp-Source: AGHT+IGu1j48aF+XZlxjSyhQug6UEix1rV5nGAX3HW1Tkmz2sD8xsHcA3Z1RsOAFBQnuGQhUyToPgBxzY+suaGlKO8U=
X-Received: by 2002:a05:6512:2390:b0:4fe:ffbc:ac98 with SMTP id
 c16-20020a056512239000b004feffbcac98mr5668lfv.4.1700581289573; Tue, 21 Nov
 2023 07:41:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>
 <86pm03z0kw.wl-maz@kernel.org> <86o7fnyvrq.wl-maz@kernel.org>
In-Reply-To: <86o7fnyvrq.wl-maz@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 21 Nov 2023 07:41:17 -0800
Message-ID: <CAP-5=fWeyorotfVz_y16ibakSwbNa0fapZoxSZ1nbkt1s=uGbw@mail.gmail.com>
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Hector Martin <marcan@marcan.st>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, James Clark <james.clark@arm.com>, linux-perf-users@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 7:24=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Tue, 21 Nov 2023 13:40:31 +0000,
> Marc Zyngier <maz@kernel.org> wrote:
> >
> > [Adding key people on Cc]
> >
> > On Tue, 21 Nov 2023 12:08:48 +0000,
> > Hector Martin <marcan@marcan.st> wrote:
> > >
> > > Perf broke on all Apple ARM64 systems (tested almost everything), and
> > > according to maz also on Juno (so, probably all big.LITTLE) since v6.=
5.
> >
> > I can confirm that at least on 6.7-rc2, perf is pretty busted on any
> > asymmetric ARM platform. It isn't clear what criteria is used to pick
> > the PMU, but nothing works anymore.
> >
> > The saving grace in my case is that Debian still ships a 6.1 perftool
> > package, but that's obviously not going to last.
> >
> > I'm happy to test potential fixes.
>
> At Mark's request, I've dumped a couple of perf (as of -rc2) runs with
> -vvv.  And it is quite entertaining (this is taskset to an 'icestorm'
> CPU):
>
> <quote>
> maz@valley-girl:~/hot-poop/arm-platforms/tools/perf$ sudo taskset -c 0 ./=
perf stat -vvv -e apple_icestorm_pmu/cycles/ -e
>  apple_firestorm_pmu/cycles/ -e cycles ls
> Using CPUID 0x00000000612f0280
> Attempt to add: apple_icestorm_pmu/cycles=3D0/
> ..after resolving event: apple_icestorm_pmu/cycles=3D0/
> Opening: unknown-hardware:HG
> ------------------------------------------------------------
> perf_event_attr:
>   type                             0 (PERF_TYPE_HARDWARE)
>   config                           0xb00000000
>   disabled                         1
> ------------------------------------------------------------
> sys_perf_event_open: pid 0  cpu -1  group_fd -1  flags 0x8
> sys_perf_event_open failed, error -95
> Attempt to add: apple_firestorm_pmu/cycles=3D0/
> ..after resolving event: apple_firestorm_pmu/cycles=3D0/
> Control descriptor is not initialized
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
> sys_perf_event_open: pid 1045843  cpu -1  group_fd -1  flags 0x8 =3D 5
> arch                    builtin-diff.o      builtin-mem.o        common-c=
mds.h    perf-completion.sh
> bench                   builtin-evlist.c    builtin-probe.c      CREDITS =
         perf.h
> Build                   builtin-evlist.o    builtin-probe.o      design.t=
xt       perf-in.o
> builtin-annotate.c      builtin-ftrace.c    builtin-record.c     dlfilter=
s        perf-iostat
> builtin-annotate.o      builtin-ftrace.o    builtin-record.o     Document=
ation    perf-iostat.sh
> builtin-bench.c         builtin.h           builtin-report.c     FEATURE-=
DUMP     perf.o
> builtin-bench.o         builtin-help.c      builtin-report.o     include =
         perf-read-vdso.c
> builtin-buildid-cache.c  builtin-help.o      builtin-sched.c     jvmti   =
         perf-sys.h
> builtin-buildid-cache.o  builtin-inject.c    builtin-script.c    libapi  =
 PERF-VERSION-FILE
> builtin-buildid-list.c  builtin-inject.o    builtin-script.o     libperf =
         perf-with-kcore
> builtin-buildid-list.o  builtin-kallsyms.c  builtin-stat.c       libsubcm=
d        pmu-events
> builtin-c2c.c           builtin-kallsyms.o  builtin-stat.o       libsymbo=
l        python
> builtin-c2c.o           builtin-kmem.c      builtin-timechart.c  Makefile=
         python_ext_build
> builtin-config.c        builtin-kvm.c       builtin-top.c        Makefile=
.config  scripts
> builtin-config.o        builtin-kvm.o       builtin-top.o        Makefile=
.perf    tests
> builtin-daemon.c        builtin-kwork.c     builtin-trace.c      MANIFEST=
         trace
> builtin-daemon.o        builtin-list.c      builtin-version.c    perf    =
         ui
> builtin-data.c          builtin-list.o      builtin-version.o    perf-arc=
hive     util
> builtin-data.o          builtin-lock.c      check-headers.sh     perf-arc=
hive.sh
> builtin-diff.c          builtin-mem.c       command-list.txt     perf.c
> apple_icestorm_pmu/cycles/: -1: 0 873709 0
> apple_firestorm_pmu/cycles/: -1: 0 873709 0
> cycles: -1: 0 873709 0
> apple_icestorm_pmu/cycles/: 0 873709 0
> apple_firestorm_pmu/cycles/: 0 873709 0
> cycles: 0 873709 0
>
>  Performance counter stats for 'ls':
>
>      <not counted>      apple_icestorm_pmu/cycles/                       =
                       (0.00%)
>      <not counted>      apple_firestorm_pmu/cycles/                      =
                       (0.00%)
>      <not counted>      cycles                                           =
                       (0.00%)
>
>        0.000002250 seconds time elapsed
>
>        0.000000000 seconds user
>        0.000000000 seconds sys
> </quote>
>
> If I run the same thing on another CPU cluster (firestorm), I get
> this:
>
> <quote>
> maz@valley-girl:~/hot-poop/arm-platforms/tools/perf$ sudo taskset -c 2 ./=
perf stat -vvv -e apple_icestorm_pmu/cycles/ -e
>  apple_firestorm_pmu/cycles/ -e cycles ls
> Using CPUID 0x00000000612f0280
> Attempt to add: apple_icestorm_pmu/cycles=3D0/
> ..after resolving event: apple_icestorm_pmu/cycles=3D0/
> Opening: unknown-hardware:HG
> ------------------------------------------------------------
> perf_event_attr:
>   type                             0 (PERF_TYPE_HARDWARE)
>   config                           0xb00000000
>   disabled                         1
> ------------------------------------------------------------
> sys_perf_event_open: pid 0  cpu -1  group_fd -1  flags 0x8
> sys_perf_event_open failed, error -95
> Attempt to add: apple_firestorm_pmu/cycles=3D0/
> ..after resolving event: apple_firestorm_pmu/cycles=3D0/
> Control descriptor is not initialized
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
> sys_perf_event_open: pid 1045925  cpu -1  group_fd -1  flags 0x8 =3D 3
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
> sys_perf_event_open: pid 1045925  cpu -1  group_fd -1  flags 0x8 =3D 4
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
> sys_perf_event_open: pid 1045925  cpu -1  group_fd -1  flags 0x8 =3D 5
> arch                    builtin-diff.o      builtin-mem.o        common-c=
mds.h    perf-completion.sh
> bench                   builtin-evlist.c    builtin-probe.c      CREDITS =
         perf.h
> Build                   builtin-evlist.o    builtin-probe.o      design.t=
xt       perf-in.o
> builtin-annotate.c      builtin-ftrace.c    builtin-record.c     dlfilter=
s        perf-iostat
> builtin-annotate.o      builtin-ftrace.o    builtin-record.o     Document=
ation    perf-iostat.sh
> builtin-bench.c         builtin.h           builtin-report.c     FEATURE-=
DUMP     perf.o
> builtin-bench.o         builtin-help.c      builtin-report.o     include =
         perf-read-vdso.c
> builtin-buildid-cache.c  builtin-help.o      builtin-sched.c     jvmti   =
         perf-sys.h
> builtin-buildid-cache.o  builtin-inject.c    builtin-script.c    libapi  =
 PERF-VERSION-FILE
> builtin-buildid-list.c  builtin-inject.o    builtin-script.o     libperf =
         perf-with-kcore
> builtin-buildid-list.o  builtin-kallsyms.c  builtin-stat.c       libsubcm=
d        pmu-events
> builtin-c2c.c           builtin-kallsyms.o  builtin-stat.o       libsymbo=
l        python
> builtin-c2c.o           builtin-kmem.c      builtin-timechart.c  Makefile=
         python_ext_build
> builtin-config.c        builtin-kvm.c       builtin-top.c        Makefile=
.config  scripts
> builtin-config.o        builtin-kvm.o       builtin-top.o        Makefile=
.perf    tests
> builtin-daemon.c        builtin-kwork.c     builtin-trace.c      MANIFEST=
         trace
> builtin-daemon.o        builtin-list.c      builtin-version.c    perf    =
         ui
> builtin-data.c          builtin-list.o      builtin-version.o    perf-arc=
hive     util
> builtin-data.o          builtin-lock.c      check-headers.sh     perf-arc=
hive.sh
> builtin-diff.c          builtin-mem.c       command-list.txt     perf.c
> apple_icestorm_pmu/cycles/: -1: 1035101 469125 469125
> apple_firestorm_pmu/cycles/: -1: 1035035 469125 469125
> cycles: -1: 1034653 469125 469125
> apple_icestorm_pmu/cycles/: 1035101 469125 469125
> apple_firestorm_pmu/cycles/: 1035035 469125 469125
> cycles: 1034653 469125 469125
>
>  Performance counter stats for 'ls':
>
>          1,035,101      apple_icestorm_pmu/cycles/
>          1,035,035      apple_firestorm_pmu/cycles/
>          1,034,653      cycles
>
>        0.000001333 seconds time elapsed
>
>        0.000000000 seconds user
>        0.000000000 seconds sys
> </quote>
>
> which doesn't make any sense either. I really don't understand what
> this PERF_TYPE_HARDWARE does here (the *real* types are 10 and 11),
> nor what this 'cycle=3D0' stuff is.

Hi Marc,

I'm unclear if you are running a newer perf tool on an older kernel or
not. In any case I'll assume the kernel and perf tool versions match.
In Linux 6.6 this patch was added to the ARM PMU:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/perf/arm_pmu.c?id=3D5c816728651ae425954542fed64d21d40cb75a9f

My guess is that the apple_icestorm_pmu requires a similar patch. The
perf tool is supposed to not use extended types when they aren't
supported:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/pmus.c?h=3Dperf-tools-next#n532
So I share your confusion as to why something broke.

PERF_TYPE_HARDWARE is a legacy type where there are hardcoded type and
config values that correspond to an event. The PMU driver turns legacy
events into the real types. On BIG.little systems if the legacy events
are monitoring a task a different event is needed for each PMU (ie >1
event). In your example you are monitoring 'ls', a task, and so
different cycles events are necessary. In the high 32-bits (the
extended type) the PMU is identified.

Thanks for reporting the issue,
Ian

> /puzzled
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
