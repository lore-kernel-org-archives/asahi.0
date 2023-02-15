Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984B87C
	for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 11:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676461371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4kbdKU98/vo3fMtB/dos++x3HLoxdm3oQAZqZchHYs0=;
	b=er0FUyHHTA31jO4i/7/5YK/mzqUEyiCTYp2ZiqZp+o6HKOp27jQH7FmKEvzn+LiyX6cbB5
	w1M8xXRa1HDnn1LIK5V2wCr/ciRebAhKuXCja+G/RrTU7/yar/3QE4zFb+q+KKQYemg3sy
	aWoLus2zuVia9RrCiDeSvSaVg6WMPs4=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-oir9KrVzOwq_DktOQbdNJw-1; Wed, 15 Feb 2023 06:42:50 -0500
X-MC-Unique: oir9KrVzOwq_DktOQbdNJw-1
Received: by mail-vs1-f72.google.com with SMTP id p25-20020a0561020e5900b003eb2e441471so4434736vst.13
        for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 03:42:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kbdKU98/vo3fMtB/dos++x3HLoxdm3oQAZqZchHYs0=;
        b=GDG3abhfs0zSBPfUnl5B3YeuIClyEtVyeYjOhSVmXT4JB+VTO8j24/FNp5HsXyGYcw
         MZUyWvD4Ko6SmBrlw/bYgWhqVZUZgOcu2Q5WOzQaP67ChdlIya6dATt+E04XquIf9mxr
         qTpVKVi7El9Fu9wwDYu1sLVKaqt8+LDwAHlpVL0AFZcum5Ia8g954STPG3EoU2G97UWW
         v2gJUfLCuO4T++H+7CWwxy+iyTyEvGcFHp0bZHE3jbAJ+5et1Nqwejo6y0x+vFqHNfkv
         ClkkqEyPQ4jw9CJj9jJxdVQTYtDg1B3x3aQlxVcT2jlJV5IoaTflZYZSwYr0Wj4EzJlH
         iQGQ==
X-Gm-Message-State: AO0yUKWe7QgP8cil3L7f/POv1sN8skaQneY9sjMmFPfmvb0V1Bkn4eoR
	hBBYwGkFRreJ2Nb5RPtw+4oMX1u5pPYaYZoGWs2PSpYZXlqp2i4AizxlTZgwUBB9ulIIeAfc0b+
	O6vBxOB5Iln2x/EOftj0nRau5hlhQCZM=
X-Received: by 2002:a05:6102:34c7:b0:411:bd2e:11ac with SMTP id a7-20020a05610234c700b00411bd2e11acmr287370vst.75.1676461369788;
        Wed, 15 Feb 2023 03:42:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+kUPt7gGzhiQgVyz2CNApAZCVfBk6sZ3Tsubo9kL7OIwxXKmGLrqpTGKjxBr7zf81hSPv+GO0q1wH37PJfvTc=
X-Received: by 2002:a05:6102:34c7:b0:411:bd2e:11ac with SMTP id
 a7-20020a05610234c700b00411bd2e11acmr287362vst.75.1676461369540; Wed, 15 Feb
 2023 03:42:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230215-arm_pmu_m1_regression-v1-1-f5a266577c8d@jannau.net> <CAOgh=FwCk1qMUAqkv+aih_=6vJ0SjqyzS9-gW+v+YjEse6V0Yw@mail.gmail.com>
In-Reply-To: <CAOgh=FwCk1qMUAqkv+aih_=6vJ0SjqyzS9-gW+v+YjEse6V0Yw@mail.gmail.com>
From: Eric Curtin <ecurtin@redhat.com>
Date: Wed, 15 Feb 2023 11:42:33 +0000
Message-ID: <CAOgh=Fx_i87_9gGpfPGJ2uNfEK8W=bH=40Dy8J5yYz53qPeRSQ@mail.gmail.com>
Subject: Re: [PATCH] arm_pmu: Invert fallback armpmu_filter() return value
To: Janne Grunau <j@jannau.net>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Feb 2023 at 11:40, Eric Curtin <ecurtin@redhat.com> wrote:
>
> On Wed, 15 Feb 2023 at 11:36, Janne Grunau <j@jannau.net> wrote:
> >
> > Fixes a regression in "perf: Rewrite core context handling" for arm_pmu
> > based drivers without a filter function pointer as the Apple M1 PMU.
> > The event is ignored if filter() returns 'true' opposite to
> > filter_match(). The refactoring failed to invert the return value if
> > arm_pmu has no filter() function pointer of its own.
> >
> > Fixes: bd2756811766 ("perf: Rewrite core context handling")
> > Signed-off-by: Janne Grunau <j@jannau.net>
>
> Makes sense we return the inverse of armpmu_filter everywhere else in the code.

or we return the inverse of cpumask_test_cpu rather... copy/paste
error on my part.

>
> Reviewed-by: Eric Curtin <ecurtin@redhat.com>
>
> Is mise le meas/Regards,
>
> Eric Curtin
>
> > ---
> >  drivers/perf/arm_pmu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> > index 9b593f985805..9cb22f36cf66 100644
> > --- a/drivers/perf/arm_pmu.c
> > +++ b/drivers/perf/arm_pmu.c
> > @@ -556,7 +556,7 @@ static bool armpmu_filter(struct pmu *pmu, int cpu)
> >         if (ret && armpmu->filter)
> >                 return armpmu->filter(pmu, cpu);
> >
> > -       return ret;
> > +       return !ret;
> >  }
> >
> >  static ssize_t cpus_show(struct device *dev,
> >
> > ---
> > base-commit: ceaa837f96adb69c0df0397937cd74991d5d821a
> > change-id: 20230215-arm_pmu_m1_regression-b6dd48d0c792
> >
> > Best regards,
> > --
> > Janne Grunau <j@jannau.net>
> >
> >

