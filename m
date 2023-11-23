Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB2D1173D
	for <asahi@lists.linux.dev>; Thu, 23 Nov 2023 04:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CecVgBXV"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-548db776f6cso3643a12.1
        for <asahi@lists.linux.dev>; Wed, 22 Nov 2023 20:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700713996; x=1701318796; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHYFGmfIL28khD5t+/nzZLl2KHtCKuHF6ms78F8Fe70=;
        b=CecVgBXV7cfaGeFTMJ/B94QSF3Vc3elcaBdsEcBeenqp7ZbrGFNpBK0ZJJL5JEoeo1
         2ZpnCASpjiV/zMeeEv+g6fDbdiAGYdn89yIcwBimen3nw+WmIakroT3zseXKSRrISN2/
         ss86aA2V/wC28CEPswruRnMOyrRUyagsp02KfGdYx/X311V0qiD0a3DPBhFoHVls6ruo
         ShC6KHu+7irM3+5Vls+nAVHBzCFG6CEzhcKCUM2xJ9VdHjdtEXPx9o9esJ66+c7IiWs8
         DS6hVpCeDHV/SpfHxaFtdivou6OrDLV6Iq4vRqsh54kK/7v1779ZtWxUTnuvOUMEh+TZ
         X1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700713996; x=1701318796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHYFGmfIL28khD5t+/nzZLl2KHtCKuHF6ms78F8Fe70=;
        b=pP8NxneTmc00Pc+v72/CdjH/PDEl2TKec3cj+3jd/bDC9fS8H6KfJ8Au9/lbUzupZ9
         dhESvqApENd2Ur9+eEL1tSbiUADWxbxI2q8JKBTRyGs7ncxScBWZZi4v5r5l3D9CF9wU
         H5sDsVg6HC8zRBRNACUp9KE9Y5ukw/v2yEJp4ZFlYc33v8SbCM4y+kMpc0TLpaXDUJej
         S2Kg9jk+U5LKRbdOTQ3l1R38SRtSmUrSXH5OiB/n9DIudXjJgpSTVkRK2fhG4ikk9k3K
         KHpBN9LbnymiFK/Plvyrxd/0vDBtvrKND5aoXDI76i2n3Of6OA/8gWO09WrT9i75As2f
         durg==
X-Gm-Message-State: AOJu0YwcsS3UesVwv0/2RcCjTp7m0EBnSReIpAlQ7lf+zAqT0ustpLWw
	LhNT5YysX5ASSLT+d9jXYWs6NvxzZv0UonlvYg8kyw==
X-Google-Smtp-Source: AGHT+IHs5+fqXcXd6ogn/DfeaeTkDYlrlCqReCllXHbGsBBw6ajb2Kavkb8kz1MLsS7u9oYhFeF+v3hNOungmV1z2Y0=
X-Received: by 2002:a05:6402:1cbc:b0:547:3f1:84e0 with SMTP id
 cz28-20020a0564021cbc00b0054703f184e0mr211893edb.7.1700713995667; Wed, 22 Nov
 2023 20:33:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZVzPUjOiH6zpUlz5@FVFF77S0Q05N.cambridge.arm.com>
 <CAP-5=fUB75DCL4+8YO62iPVsnxoeXGv5cLmT7eP2bHNs=xoMdg@mail.gmail.com>
 <ZVzUr7TWEYPoZrWX@FVFF77S0Q05N.cambridge.arm.com> <CAP-5=fUWm7efu3xdUBbiifs_KNU1igwAxbXmum=V38SjHQHtXg@mail.gmail.com>
 <ZVzXjz_0nYbmSGPQ@FVFF77S0Q05N.cambridge.arm.com> <CAP-5=fWLGOCWv=wp2xsi4AVxfbS8KhkmtkMwOA4yVrz791=Z8Q@mail.gmail.com>
 <ZV38ParIEYWOjt6T@FVFF77S0Q05N> <CAP-5=fUxBv4kbXyLrD5G-=wyRh6tKEJMy5qX0_86wQXxT79dJw@mail.gmail.com>
 <ZV4nj-_q4hHaf8Wl@FVFF77S0Q05N> <CAP-5=fWtHYr9J2izkNmTpfKvdEdt0ViELJ1Gsih6H9XBTE83UA@mail.gmail.com>
 <ZV4yd3oz2Ykl/N5Q@kernel.org> <CAP-5=fU==+UoF64AZz5HAwcL2xSDxLfyS1Q+SQ0d2SGwFC8j5A@mail.gmail.com>
In-Reply-To: <CAP-5=fU==+UoF64AZz5HAwcL2xSDxLfyS1Q+SQ0d2SGwFC8j5A@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 22 Nov 2023 20:33:03 -0800
Message-ID: <CAP-5=fVE-GayAsg0PVf+WZuLh_KJAd2ErG2qvNROjhQOLYp=4w@mail.gmail.com>
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since v6.5
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Arnaldo Carvalho de Melo <acme@redhat.com>, James Clark <james.clark@arm.com>, 
	linux-perf-users@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Asahi Linux <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 8:59=E2=80=AFAM Ian Rogers <irogers@google.com> wro=
te:
>
> On Wed, Nov 22, 2023 at 8:55=E2=80=AFAM Arnaldo Carvalho de Melo
> <acme@kernel.org> wrote:
> >
> > Em Wed, Nov 22, 2023 at 08:29:58AM -0800, Ian Rogers escreveu:
> > > I can look at doing an event parser change like:
> > >
> > > ```
> > > diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-e=
vents.c
> > > index aa2f5c6fc7fc..9a18fda525d2 100644
> > > --- a/tools/perf/util/parse-events.c
> > > +++ b/tools/perf/util/parse-events.c
> > > @@ -986,7 +986,8 @@ static int config_term_pmu(struct perf_event_attr=
 *attr,
> > >                                                           err_str,
> > > /*help=3D*/NULL);
> > >                        return -EINVAL;
> > >                }
> > > -               if (perf_pmu__supports_legacy_cache(pmu)) {
> > > +               if (perf_pmu__supports_legacy_cache(pmu) &&
> > > +                   !perf_pmu__have_event(pmu, term->val.str)) {
> > >                        attr->type =3D PERF_TYPE_HW_CACHE;
> > >                        return
> > > parse_events__decode_legacy_cache(term->config, pmu->type,
> > >                                                                 &attr=
->config);
> > > @@ -1004,10 +1005,15 @@ static int config_term_pmu(struct perf_event_=
attr *attr,
> > >                                                           err_str,
> > > /*help=3D*/NULL);
> > >                        return -EINVAL;
> > >                }
> > > -               attr->type =3D PERF_TYPE_HARDWARE;
> > > -               attr->config =3D term->val.num;
> > > -               if (perf_pmus__supports_extended_type())
> > > -                       attr->config |=3D (__u64)pmu->type << PERF_PM=
U_TYPE_SHIFT;
> > > +               if (perf_pmu__have_event(pmu, term->val.str)) {
> > > +                       /* If the PMU has a sysfs or json event prefe=
r
> > > it over legacy. ARM requires this. */
> > > +                       term->term_type =3D PARSE_EVENTS__TERM_TYPE_U=
SER;
> > > +               } else {
> > > +                       attr->type =3D PERF_TYPE_HARDWARE;
> > > +                       attr->config =3D term->val.num;
> > > +                       if (perf_pmus__supports_extended_type())
> > > +                               attr->config |=3D (__u64)pmu->type <<
> > > PERF_PMU_TYPE_SHIFT;
> > > +               }
> > >                return 0;
> > >        }
> > >        if (term->type_term =3D=3D PARSE_EVENTS__TERM_TYPE_USER ||
> > > ```
> > > (note: this is incomplete as term->val.str isn't populated for
> > > PARSE_EVENTS__TERM_TYPE_HARDWARE)
> >
> > Yeah, I had to apply manually as your MUA mangled it, then it didn't
> > build, had to remove some consts, then there was a struct member
> > mistake, after all fixed I get to the patch below, but it now segfaults=
,
> > probably what you mention...
> >
> > root@roc-rk3399-pc:~# strace -e perf_event_open taskset -c 4,5 perf sta=
t -v -e cycles,armv8_cortex_a53/cycles/,armv8_cortex_a72/cycles/ echo
> > Using CPUID 0x00000000410fd082
> > perf_event_open({type=3DPERF_TYPE_HARDWARE, size=3D0 /* PERF_ATTR_SIZE_=
??? */, config=3D0x7<<32|PERF_COUNT_HW_CPU_CYCLES, sample_period=3D0, sampl=
e_type=3D0, read_format=3D0, disabled=3D1, precise_ip=3D0 /* arbitrary skid=
 */, ...}, 0, -1, -1, PERF_FLAG_FD_CLOEXEC) =3D -1 ENOENT (No such file or =
directory)
> > --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSEGV_MAPERR, si_addr=3DNULL}=
 ---
> > +++ killed by SIGSEGV +++
> > Segmentation fault
> > root@roc-rk3399-pc:~#
>
> Right, I have something further along that fails tests. I'll try to
> send out an RFC today, but given the Intel behavior change =C2=AF\_(=E3=
=83=84)_/=C2=AF
> But Intel don't appear to have an issue having two things called, for
> example, cycles and them both being a cycles event so they may not
> care. It is only ARM's PMUs that appear broken in this way.

To workaround the PMU bug posted:
https://lore.kernel.org/lkml/20231123042922.834425-1-irogers@google.com/

Thanks,
Ian

> Thanks,
> Ian
>
> > - Arnaldo
> >
> > diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-eve=
nts.c
> > index aa2f5c6fc7fc..1e648454cc49 100644
> > --- a/tools/perf/util/parse-events.c
> > +++ b/tools/perf/util/parse-events.c
> > @@ -976,7 +976,7 @@ static int config_term_pmu(struct perf_event_attr *=
attr,
> >                            struct parse_events_error *err)
> >  {
> >         if (term->type_term =3D=3D PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE=
) {
> > -               const struct perf_pmu *pmu =3D perf_pmus__find_by_type(=
attr->type);
> > +               struct perf_pmu *pmu =3D perf_pmus__find_by_type(attr->=
type);
> >
> >                 if (!pmu) {
> >                         char *err_str;
> > @@ -986,7 +986,8 @@ static int config_term_pmu(struct perf_event_attr *=
attr,
> >                                                            err_str, /*h=
elp=3D*/NULL);
> >                         return -EINVAL;
> >                 }
> > -               if (perf_pmu__supports_legacy_cache(pmu)) {
> > +               if (perf_pmu__supports_legacy_cache(pmu) &&
> > +                   !perf_pmu__have_event(pmu, term->val.str)) {
> >                         attr->type =3D PERF_TYPE_HW_CACHE;
> >                         return parse_events__decode_legacy_cache(term->=
config, pmu->type,
> >                                                                  &attr-=
>config);
> > @@ -994,7 +995,7 @@ static int config_term_pmu(struct perf_event_attr *=
attr,
> >                         term->type_term =3D PARSE_EVENTS__TERM_TYPE_USE=
R;
> >         }
> >         if (term->type_term =3D=3D PARSE_EVENTS__TERM_TYPE_HARDWARE) {
> > -               const struct perf_pmu *pmu =3D perf_pmus__find_by_type(=
attr->type);
> > +               struct perf_pmu *pmu =3D perf_pmus__find_by_type(attr->=
type);
> >
> >                 if (!pmu) {
> >                         char *err_str;
> > @@ -1004,10 +1005,15 @@ static int config_term_pmu(struct perf_event_at=
tr *attr,
> >                                                            err_str, /*h=
elp=3D*/NULL);
> >                         return -EINVAL;
> >                 }
> > -               attr->type =3D PERF_TYPE_HARDWARE;
> > -               attr->config =3D term->val.num;
> > -               if (perf_pmus__supports_extended_type())
> > -                       attr->config |=3D (__u64)pmu->type << PERF_PMU_=
TYPE_SHIFT;
> > +               if (perf_pmu__have_event(pmu, term->val.str)) {
> > +                       /* If the PMU has a sysfs or JSON event prefer =
it over legacy. ARM requires this. */
> > +                       term->type_term =3D PARSE_EVENTS__TERM_TYPE_USE=
R;
> > +               } else {
> > +                       attr->type =3D PERF_TYPE_HARDWARE;
> > +                       attr->config =3D term->val.num;
> > +                       if (perf_pmus__supports_extended_type())
> > +                           attr->config |=3D (__u64)pmu->type << PERF_=
PMU_TYPE_SHIFT;
> > +               }
> >                 return 0;
> >         }
> >         if (term->type_term =3D=3D PARSE_EVENTS__TERM_TYPE_USER ||
