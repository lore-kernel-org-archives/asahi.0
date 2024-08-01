Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E494D13C832
	for <asahi@lists.linux.dev>; Thu,  1 Aug 2024 19:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722539141; cv=none; b=TS5p2OE4c0TIyyO2rPhmSa7UBJaW/FkYG0okQiMPxRHDUq5GgrBP5z/p8GYA+aqu5ZZnJmRO20nypDPbiPIm+NCVeo0w/+SZ+sIns6hURrUqJ2JXn0oyDrsxA+iwUppcI5tVkLP8VGZx5wCVdQ9HjplJbVOQqp9iKM52q3RcAqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722539141; c=relaxed/simple;
	bh=qLJ5L34m/hDFaymbxoidcHVuYlzirRvv5RrpOcfSt8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLMeeAkZ91sxCk5vmHH26rnfA4YgtcqKIEdf2o9wfIY4k5qK1FnjJ3Z+2ikWFCMdyi8/B/g1I9RvWu0Fft2Hze9dEH4Da1Y7vtCjX4R5zCWBkQbi3TciRP7GvN8OQFPGyaG3NOlZomFxg2cXd+//PprWLe/GaIxDGLw3sMmW/x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Du4wpBjo; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Du4wpBjo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fed726aefcso423875ad.1
        for <asahi@lists.linux.dev>; Thu, 01 Aug 2024 12:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722539139; x=1723143939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLJ5L34m/hDFaymbxoidcHVuYlzirRvv5RrpOcfSt8k=;
        b=Du4wpBjohZHdVq2f3OZ7sU/MXGoRZejcvnUz3hRmxSVAJnwk1y5IMt39C6j2EfbFV/
         x2Rinh8NS3PMbqBRcRBuZYHzoHdy+1OPMjrsZylZi+FB+A1Nbu8AZffjKR8ahCn3v0yZ
         T9Jzxv4dV5ixrhdSW4bbZwPSShV+6frNfGTiFgBNFcZ1/L/tdztGKP4owP1tr7glwMsn
         UOhGP4SwMRS9PyxpNMK+WCGSRd/ESglC6W99zETHQMZCeLA1v/gJdU+ukM4aLHnd/ykf
         mmpAzmMHerTq6BpUSwNawgv0U0jNWI55JM3jno9Bodgn6cKeRIhasddm+adV8jVPrInj
         dZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722539139; x=1723143939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLJ5L34m/hDFaymbxoidcHVuYlzirRvv5RrpOcfSt8k=;
        b=cF8umuNk7cOt78hVndOmeUSEOoziHZRKgXg54xoshXRzI0EwcsV+gQFV6TU9ZA5y9Z
         j62OZYzwe09s4Ty6+kdO1eHf3yJvzJ5aJvMAHGJjeLn0ctUSU2dQfP+lLWCPcK0JRFrz
         zf0/SvH86oByf4wLNz1z/4T846HyxU8JJ3QjDZDHEf/looC5c8GN2tNC7uiQvfzSo9Qv
         N2RUYaO3DdH/DYdkIFfTgQJVgP/rGHZwypIgynDsvsZ2GZykI7lfkokqUCHyb/XcAk8E
         HjSs3a4RLK8NATDDxgD0vdqO9EqxDXoClKi1R/V8VwDaha9+/HDN/y1qVzuzCdGUTR6S
         AICA==
X-Forwarded-Encrypted: i=1; AJvYcCWWlhk/qb+T37oyT0YstVmai65dpyqT8BDr9GLVs50pxQJ3igEWJ+8yCgKlfRMZMyCK0C0zo3i5A5xb7rFTFNvDRgVCzQ4=
X-Gm-Message-State: AOJu0YxxObHzhmwhC4fRyjVeexCfEJVsIKoac5QYJV9VcfMOKs6D4u8j
	dB8rHyOGGGFd2LnqkPU93B3/0yQCnaFUSTMp8d1LUx6MZ2hKQjLsjH2+ntBZtZRzqEH04BW4nAi
	GzD/bGi4UgAi9zJWIp/7xDB5uM8aiQgBdPblo
X-Google-Smtp-Source: AGHT+IH5gl/Q1rzqHjQTr5aMEvKhR4tZEBFmlt3ipoX2Gur/J079ohFRNbLWktgdCJ8jGqV1lw0RjS5xWfmRyNlmBsQ=
X-Received: by 2002:a17:902:ce8f:b0:1ff:3b0f:d61d with SMTP id
 d9443c01a7336-1ff5a47d480mr363295ad.24.1722539138858; Thu, 01 Aug 2024
 12:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>
 <ZV1AnNB2CSbAUFVg@archie.me> <a9c14dfd-3269-4758-9174-4710bef07088@leemhuis.info>
In-Reply-To: <a9c14dfd-3269-4758-9174-4710bef07088@leemhuis.info>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 Aug 2024 12:05:27 -0700
Message-ID: <CAP-5=fXqx_k1miPTkcAmS3z2GBPt2KeDtP5fknmdDghZqxXPew@mail.gmail.com>
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5
To: Linux regressions mailing list <regressions@lists.linux.dev>, "to: Mark Rutland" <mark.rutland@arm.com>
Cc: Linux perf Profiling <linux-perf-users@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Clark <james.clark@arm.com>, 
	"cc: Marc Zyngier" <maz@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 4:09=E2=80=AFAM Linux regression tracking #update
(Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>
> [TLDR: This mail in primarily relevant for Linux kernel regression
> tracking. See link in footer if these mails annoy you.]
>
> On 22.11.23 00:43, Bagas Sanjaya wrote:
> > On Tue, Nov 21, 2023 at 09:08:48PM +0900, Hector Martin wrote:
> >> Perf broke on all Apple ARM64 systems (tested almost everything), and
> >> according to maz also on Juno (so, probably all big.LITTLE) since v6.5=
.
>
> #regzbot fix: perf parse-events: Make legacy events lower priority than
> sysfs/JSON
> #regzbot ignore-activity

Note, this is still broken. The patch changed the priority in the case
that you do something like:

$ perf stat -e 'armv8_pmuv3_0/cycles/' benchmark

but if you do:

$ perf stat -e 'cycles' benchmark

then the broken behavior will happen as legacy events have priority
over sysfs/json events in that case. To fix this you need to revert:
4f1b067359ac Revert "perf parse-events: Prefer sysfs/JSON hardware
events over legacy"

This causes some testing issues resolved in this unmerged patch series:
https://lore.kernel.org/lkml/20240510053705.2462258-1-irogers@google.com/

There is a bug as the arm_dsu PMU advertises an event called "cycles"
and this PMU is present on Ampere systems. Reverting the commit above
will cause an issue as the commit 7b100989b4f6 ("perf evlist: Remove
__evlist__add_default") to fix ARM's BIG.little systems (opening a
cycles event on all PMUs not just 1) will cause the arm_dsu event to
be opened by perf record and fail as the event won't support sampling.

The patch https://lore.kernel.org/lkml/20240525152927.665498-1-irogers@goog=
le.com/
fixes this by only opening the cycles event on core PMUs when choosing
default events.

Rather than take this patch the revert happened as Linus runs the
command "perf record -e cycles:pp" (ie using a specified event and not
defaults) and considers it a regression in the perf tool that on an
Ampere system to need to do "perf record -e
'armv8_pmuv3_0/cycles/pp'". It was pointed out that not specifying -e
will choose the cycles event correctly and with better precision the
pp for systems that support it, but it was still considered a
regression in the perf tool so the revert was made to happen. There is
a lack of perf testing coverage for ARM, in particular as they choose
to do everything in a different way to x86. The patch in question was
in the linux-next tree for weeks without issues.

ARM/Ampere could fix this by renaming the event from cycles to
cpu_cycles, or by following Intel's convention that anything uncore
uses the name clockticks rather than cycles. This could break people
who rely on an event called arm_dsu/cycles/ but I imagine such people
are rare. There has been no progress I'm aware of on renaming the
event.

Making perf not terminate on opening an event for perf record seems
like the most likely workaround as that is at least something under
the tool maintainers control. ARM have discussed doing this on the
lists:
https://lore.kernel.org/lkml/f30f676e-a1d7-4d6b-94c1-3bdbd1448887@arm.com/
but since the revert in v6.10 no patches have appeared for the v6.11
merge window. Feature work like coresight improvements and ARMv9 are
being actively pursued by ARM, but feature work won't resolve this
regression.

I'm keen to see such patches as there are perf stat fixes reliant on
the stacked parse event fixes that are consequently not merged
affecting more than just ARM.

There is a related discussion that events specified without PMUs
should inherently only mean core PMUs. Unfortunately such a change
would break uncore events specified without a PMU, for example `perf
stat -e data_read -a sleep 1` gathers read memory bandwidth on uncore
memory controllers on recent Intel devices. Not specifying a PMU for
uncore events is also assumed by perf metrics, so a large number of
metrics would need updating to make such a change work. Many existing
JSON uncore events specify a PMU in their name like
UNC_M2HBM_CMS_CLOCKTICKS and it feels somewhat redundant to have to
make that h2hbm/UNC_M2HBM_CMS_CLOCKTICKS/. It is unclear who would
pursue fixing all of this, and so it seems not specifying a PMU with
an event for perf will keep meaning trying to open the event on all
PMUs that advertise such an event.

Thanks,
Ian

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.
>
