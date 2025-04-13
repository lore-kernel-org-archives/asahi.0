Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42141547EE
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 21:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744579900; cv=none; b=akNV4IU7bk7krb0qy+9Cf7NOOqECGFslMLVkBEhghivSYHeJU+HukJC0xuazAIf61/yCPE82TSX7tiHliPN6M68sAHNEbS8P7VSCmN+75P7W7ppoRn97RhEtzqMyhmnkX+ZJr6tJGT7O196tKulbuiCsxs53P3lSIL6fMLkzAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744579900; c=relaxed/simple;
	bh=mgLxoK4EqdoZNRyJ7vtRt92RimlwlQcHoZsoh3I46Ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B4NG5QtdpI+D4SZD+9m16bjS6RCNEFTkWH3c7QY4LaBHE3VkVWoOt//eflXDb7U6L5y7axEWDDLKb66Oyy2TIRMHZU3QxU5gC2zi4FBzBqq3udgqR1SAVJ5+GJgmXAJodusixvgMunRRP7lsttcywNMwlfo7dh+nDM90KGAiSyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuckwhY8; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuckwhY8"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86ddd80bc00so224959241.2
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 14:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744579898; x=1745184698; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVx7pId+fo+v9AziRU2Xhwn4igyBgC1HT4sAj9Df4U0=;
        b=fuckwhY8DOjpCfGq/MzIpQEHMXW+fGVZfFsewQQF42e6lwrZ9FfwbeBmyz9Guk1P1x
         dQAYuxhq66g2MzGtO/AFvlAIwJYhKjTbmGsx3tx42E/uAv4EoD5Uv3BnegM2Rjo6hLmS
         oQZPSVT6QYuLO2z8bDRx9q+jklOLskfHZi8Qb6K1GLwwZdVVjVMZ295PWZXE3cg7GBB1
         riNZEPj0NYe8kF4YRswiqV6EFP2p/F5qle1kig7ktvBOwZnZ38SwLyH3KdqfjmvArGkY
         RBTlfjWDHj9L1ASF0ZgZx6vG7HtOEuI5+/44STimFbZFATFLoVdTlFxIzX6dmJ2QbFNy
         Dstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744579898; x=1745184698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVx7pId+fo+v9AziRU2Xhwn4igyBgC1HT4sAj9Df4U0=;
        b=lcgo2CNWSpDotj72MSx433XZOJmtUTbTSPLJlisNdWPnqlU7GzTTx71CmyR0r4qiGa
         iNRPv1vZ0YZiobsoqXOZaP5WGjDdh+QcOcN5R8qtegd+xz4das9fPZlnxfPISKrS2RJf
         kID1U8phpilFsV7/83HJ4ZqunVz6pExkMr26za0HE2r+sZQUNC0LEBsjvLML4SMDYCHX
         wsBvOy1q3+FBsUbHzRDrShi6EYWwskglIIdIgGT7RvOhulmOj18iopEx4I3E6XLQdcXl
         sHQ0EQGp/495m6LtZ5jOXXZ+bBkNp1r2VoOh+5h/sMgAMumQGkw9dpTcKV/szRUPStnt
         Wl/A==
X-Forwarded-Encrypted: i=1; AJvYcCWKajEtwEGqEhPJBdXNulhJQwW2MeCDYvaxckgpM6CbDjYvd4qhzItkHzrKT/49RUdTFdQvaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzD0R4ZGNkou0BIsLeoOeLtmSRzLpEDiv3jRPXVIqIIWsVbEaV8
	46PJPJWhMzwlNn1Gp4BGjKYZ5ZgwgM/ql+BodW150k3xx+R7Ul1r/S9hymlAw+gwQgAMkfqraYF
	+LEwFvyrnIqXUAmWIVo54JuqaAA==
X-Gm-Gg: ASbGncta3maDk9LyO5DDUdaoeHEBxIM7SiuxVvK8fVJNwnOp8fVOXhzD4sx1xc33C9n
	7RXTk183SLZDIbxF7jCGNG+pX4ibrwLwuX8B3RO4o2za93VlTKC/A86fdFMGD+ov50xgpS4+Aop
	vM7rRxLwhwucLtmZTRTgNzf9o=
X-Google-Smtp-Source: AGHT+IFllKurmSafw9kTIxLu4ahAC8hkWzQYIgTlQSqJgaGokd0Bp/EPGcbx+9emTi0vCWUUQt+rhYiuzmyqBQu3x3o=
X-Received: by 2002:a05:6102:511f:b0:4c1:966a:3c4e with SMTP id
 ada2fe7eead31-4c9e50a7c13mr2151657137.9.1744579897520; Sun, 13 Apr 2025
 14:31:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250412160518.1824538-1-chenyuan0y@gmail.com> <86bjt0l6q4.wl-maz@kernel.org>
In-Reply-To: <86bjt0l6q4.wl-maz@kernel.org>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Sun, 13 Apr 2025 16:31:26 -0500
X-Gm-Features: ATxdqUH1BeMQrQPrFwdsiZdU6msIr6wxehKc7O712r23xRkqjsP-yQUpqJTGusA
Message-ID: <CALGdzurneK24t3AF2z5U6CoxrGYMEWUzmPn8-Qp0tToKwQV8RA@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: apple-soc: Fix possible null pointer dereference
To: Marc Zyngier <maz@kernel.org>
Cc: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev, 
	rafael@kernel.org, viresh.kumar@linaro.org, marcan@marcan.st, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 5:02=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote=
:
>
> On Sat, 12 Apr 2025 17:05:18 +0100,
> Chenyuan Yang <chenyuan0y@gmail.com> wrote:
> >
> > Check if policy is NULL before dereferencing it.
> >
> > This is similar to the commit cf7de25878a1
> > ("cppc_cpufreq: Fix possible null pointer dereference").
> >
>
> No, it's not similar. The patch you refer to actually introduces bugs
> by returning -ENODEV in functions that have an unsigned return type.
>
> > This is found by our static analysis tool KNighter.
>
> I'm surprised that your tool hasn't found the above, because it should
> be a pretty easy thing to do.
>
> Irrespective of this, it would be good to describe under which
> circumstances this can occur, because I can't see *how* this can
> trigger. The policy is directly provided by the core code and provide
> its association with a cpu, and is never NULL at the point of init.

Our tool currently identifies bug patterns by analyzing patches. For
example, in the similar function cppc_cpufreq_get_rate(),
a patch was applied to add a null check for the policy. Therefore, we
assume that a similar check should be implemented here

> And if it can trigger, why only fix this one particular case?
> Dereferences of policy are all over the map, and would be just as
> wrong.

It appears that similar checks are implemented in other areas=E2=80=94such =
as
in acpi-cpufreq.c, cppc_cpufreq.c, drivers/cpufreq/cpufreq_ondemand.c,
and drivers/cpufreq/cpufreq.c.
However, I'm not sure if apple_soc should adopt the same checking style.

> >
> > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control App=
le SoC CPU P-states")
> > ---
> >  drivers/cpufreq/apple-soc-cpufreq.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/appl=
e-soc-cpufreq.c
> > index 4994c86feb57..3de9bb2b0f22 100644
> > --- a/drivers/cpufreq/apple-soc-cpufreq.c
> > +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> > @@ -135,10 +135,14 @@ static const struct of_device_id apple_soc_cpufre=
q_of_match[] __maybe_unused =3D {
> >  static unsigned int apple_soc_cpufreq_get_rate(unsigned int cpu)
> >  {
> >       struct cpufreq_policy *policy =3D cpufreq_cpu_get_raw(cpu);
> > -     struct apple_cpu_priv *priv =3D policy->driver_data;
> > +     struct apple_cpu_priv *priv;
> >       struct cpufreq_frequency_table *p;
> >       unsigned int pstate;
> >
> > +     if (!policy)
> > +             return 0;
> > +     priv =3D policy->driver_data;
> > +
> >       if (priv->info->cur_pstate_mask) {
> >               u32 reg =3D readl_relaxed(priv->reg_base + APPLE_DVFS_STA=
TUS);
> >
>
> So while this is not wrong, I don't think this serves any real
> purpose.
>
> Thanks,
>
>         M.
>
> --

Thanks so much for your reply and comments!

-Chenyuan
