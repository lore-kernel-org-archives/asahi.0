Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145DB264FB1
	for <asahi@lists.linux.dev>; Wed,  9 Apr 2025 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744203142; cv=none; b=Lcxbvgz4ocjlSzzsMe7QimcEXd6BXltgwmDNStjqnaJ01d5fzdw8QNAzBcXmvHp7kaDSlS2zh4thpvCF1B+PnJUMfZ5/pa8kbC0wO2d3rQQDt//vcp4hmm88Xpk/Vs7A/ctuqrLOVkUHQJzcEnBS16nOFh1bsqWsVMO+Eh0BO3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744203142; c=relaxed/simple;
	bh=9j3BQXuTcVLq021FDJpbkiN8Ic00H5PJHGa7XG4Be3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPa06Xfbm0PVUviEnam/Iq/BCOFBp+hdTw1+/co0yMeYreIjQmrSK0t22gAT6dyCqmkHl2PEAK0HqBkE5A3qM+chHE2GRB/lCdNCLiKMWu5SaIDNtnAZKoUbQ/+SdkrYoVuFLi7OvSLqpN7xm3QU6DFWMbqCO5CPRI+kpL7/BMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGqxpTUK; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGqxpTUK"
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso59253581fa.2
        for <asahi@lists.linux.dev>; Wed, 09 Apr 2025 05:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744203139; x=1744807939; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnbe48AO71vHxLIqa6wKoIQjII3SgOedEce7jQxnB1c=;
        b=VGqxpTUKA6CaAsM9QkW4DlNOTXvPpaqTecwWRI/j0DcqdV7lH3UURmFQo94RcMuQiS
         fm1JwzJ+wh/AwCLJ7DVUNvamBa3jhg9PVkGhD/DvCpljzgBNqQBN00s19ngizC9DYkwd
         bGuBqLqnu69p6NoS3+4YtC85r2y8LxpzEQVu3s1SyC33WQgYfcEeK5yYlW1XQcwloNVX
         nRznZYSvdz3eDhvQ3WmPMPnsy+DksBW/22hwYAoqE3QBB3YD/1V9QHP1ns9VdOFTHxAF
         LW8Ez/CD4NBLSBOKIvDTw6yqS2zFO4ENrD5ikohoBRu9n7EuVKmQrSP+609Pf955wLaM
         LhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744203139; x=1744807939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnbe48AO71vHxLIqa6wKoIQjII3SgOedEce7jQxnB1c=;
        b=szxUOOo8tZ4GHuZ/giyVdP4qRmU9RhGsixMKypA1Hra9XtlE1QqF0G4ro7Ux08UQT+
         HpJ49Q3Nxr7FgIQJbL6yZ1EbnE6hEB/wzDYwGQ5TeX6Sv0BQ0P2WGxu4EXsdlw0AEoXV
         f0w7sWqknIN3rdMcNrJBmxx9yf9Lj9J/XvdUv+oxefIFw3pWDvjZJvL7R5MSLwhjmXan
         b40ZHAZuDEY8BanOUqY/7j7/tZzFzcHUJdFY5jc7CoQuEjnlwDuAbtpTBX3PyjZLIAg6
         4IuwHcfPvSrHJccuwbF5GkSWEbTLhb88pqfTanrueLpL6Rgz1wVygpKt+SQyva/hdoAD
         0cHw==
X-Gm-Message-State: AOJu0YyRpJEm7XSe/hBbgvFMpUsMQJI30n9U72CjQgi13KS/qPViE/iI
	OgL/Yhp0nUzj6azWDXJoXmhD4y4FbN4HsP+84S+DhiO3P4osEmtGn2C+9Grr2SSf96EOvcKQ6Jv
	ZXwzQ95ab6zUwpXv/5fmCzrqXeWk=
X-Gm-Gg: ASbGncuwFNHP/4YtvrUFkGQwhstkn+6m2g2Rda3UdNJjdXTw5sODN24qipy+SZolaO3
	sWWSWMonmkl80HWDy79jlAvO8NoQ0hLADsLayERb+0tpGIvqoiIUO9YcJ5NXSu7kDFPGfnoAD/n
	rkziyX8S4tdALuuL31VvpOnQ==
X-Google-Smtp-Source: AGHT+IGdHNOtvdCerY9pg8Q3eWXZ6Xsli0U3CirBEEFOA4oaaLZ/9WuOnbKqs9UCWS6SuAwXiGwGa9XbIxRoeJv+6i8=
X-Received: by 2002:a05:651c:54f:b0:30d:e104:a942 with SMTP id
 38308e7fff4ca-30f45078046mr7055251fa.38.1744203138983; Wed, 09 Apr 2025
 05:52:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250409124542.47166-1-bsdhenrymartin@gmail.com>
In-Reply-To: <20250409124542.47166-1-bsdhenrymartin@gmail.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Wed, 9 Apr 2025 20:52:08 +0800
X-Gm-Features: ATxdqUHAqov07ZrNPtI7qo4io2YYdsdoXQrB8Z46RMN6AaIBAh08vSDcMkMStwY
Message-ID: <CAEnQdOoMBvm_T813t_1uuNsQxqro=zXwM6d2b=NOiihicUNHcg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
To: sven@svenpeter.dev, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev, 
	rafael@kernel.org, viresh.kumar@linaro.org
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the noise - please disregard this patch as it was sent in error.

Henry Martin <bsdhenrymartin@gmail.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=889=
=E6=97=A5=E5=91=A8=E4=B8=89 20:45=E5=86=99=E9=81=93=EF=BC=9A
>
> cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
> in the policy->cpus mask. scpi_cpufreq_get_rate() does not check for
> this case, which results in a NULL pointer dereference.
>
> Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> ---
> V1 -> V2: Use `if (unlikely(!policy))` instead of `if (!policy)`
>
>  drivers/cpufreq/scpi-cpufreq.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufre=
q.c
> index 17cda84f00df..dcbb0ae7dd47 100644
> --- a/drivers/cpufreq/scpi-cpufreq.c
> +++ b/drivers/cpufreq/scpi-cpufreq.c
> @@ -29,9 +29,16 @@ static struct scpi_ops *scpi_ops;
>
>  static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
>  {
> -       struct cpufreq_policy *policy =3D cpufreq_cpu_get_raw(cpu);
> -       struct scpi_data *priv =3D policy->driver_data;
> -       unsigned long rate =3D clk_get_rate(priv->clk);
> +       struct cpufreq_policy *policy;
> +       struct scpi_data *priv;
> +       unsigned long rate;
> +
> +       policy =3D cpufreq_cpu_get_raw(cpu);
> +       if (unlikely(!policy))
> +               return 0;
> +
> +       priv =3D policy->driver_data;
> +       rate =3D clk_get_rate(priv->clk);
>
>         return rate / 1000;
>  }
> --
> 2.34.1
>
