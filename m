Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556EBECE
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 10:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677493598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ORysGkdK/Pguqa6KzjHxllcwhbHEv5qK0Wn8PNtiKpA=;
	b=fq83vbvrGJB3LZ4t98xZfuvnnU/P+zPLqjbm/XBlXjn/vRH9eJgkeo1dF6o8tZxHYoQP2q
	3Xne85ZRZdX8kO5YiG093/92Famd4KGa8axFcI5eiWBUsh/D/jq98nIeFygiB1nx3EoblD
	ci4J2PhhtrmY5EhJIcW2rwz0oz9Q+f4=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-597-1M5fobOhNP-Y2WuxUR1RCg-1; Mon, 27 Feb 2023 05:26:36 -0500
X-MC-Unique: 1M5fobOhNP-Y2WuxUR1RCg-1
Received: by mail-vs1-f69.google.com with SMTP id b10-20020a67b34a000000b0041f71775311so4792345vsm.23
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 02:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORysGkdK/Pguqa6KzjHxllcwhbHEv5qK0Wn8PNtiKpA=;
        b=nbbBvjqBkB5/Zd13fOdHMXys339bMuy3Eb3fUPdb0RG64QfBMJazdBYanhUGByuyI8
         n4SWpe2WMGDdXGj624R6uJQ4B4sRw+O3AYToSaos01FBWIq0uHvMNynRgZx4wlpc62TH
         mrBKFDGIc+g1jxt+1mFAxqt/dJuQXm5YqF3CDWH+a5oBFZS793xGTYSDi78ApaQATsQR
         ksUdwgfo58T00VBMKh+c+if1LtyT598Bbb0wkoQFc8l7Q7oKwRCH9b2qXmrv5Okpp4Pz
         KCvXZK679k6z02tdBaZ/27sJNp4D16Y0oP6Cl5K+LTS1pM4fuyrkt2Lpsg83Pv5lWc6W
         fpxQ==
X-Gm-Message-State: AO0yUKWNO5ysSmIi+73NtoYOesPj4kTgynTqvNCqMANC4Ljt6mlRhBwU
	XlzimWdZz8ejeG+WC1yAdBdnLjaC3YEU0i3tkdDl9VhiCasp4Q80/xjqEFk9M+3AAX/mjVvENKW
	xRJVR8qN4BiLChYSjvtcR7vBXOkWC8F0=
X-Received: by 2002:a1f:bf16:0:b0:413:1498:e843 with SMTP id p22-20020a1fbf16000000b004131498e843mr7165644vkf.0.1677493596353;
        Mon, 27 Feb 2023 02:26:36 -0800 (PST)
X-Google-Smtp-Source: AK7set992JZJfczXidh5nXBnsu5o2gkRvL073x6tl2UuRSKy8og8GT5X66IeGe+wctC68z1nH/ku6NujpNQ8OHcKkJ8=
X-Received: by 2002:a1f:bf16:0:b0:413:1498:e843 with SMTP id
 p22-20020a1fbf16000000b004131498e843mr7165626vkf.0.1677493596036; Mon, 27 Feb
 2023 02:26:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y/yAzR6sWvPedLej@kili>
In-Reply-To: <Y/yAzR6sWvPedLej@kili>
From: Eric Curtin <ecurtin@redhat.com>
Date: Mon, 27 Feb 2023 10:26:20 +0000
Message-ID: <CAOgh=FyxFuENe6SgJB7aUwPS-ZB_51q6a=zWEcZSAsGqX034hA@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: apple-soc: Fix an IS_ERR() vs NULL check
To: Dan Carpenter <error27@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Marc Zyngier <maz@kernel.org>, asahi@lists.linux.dev, 
	linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Feb 2023 at 10:16, Dan Carpenter <error27@gmail.com> wrote:
>
> The of_iomap() function returns NULL if it fails.  It never returns
> error pointers.  Fix the check accordingly.
>
> Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---

Nice catch!

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

>  drivers/cpufreq/apple-soc-cpufreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index c11d22fd84c3..021f423705e1 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -189,8 +189,8 @@ static int apple_soc_cpufreq_find_cluster(struct cpufreq_policy *policy,
>         *info = match->data;
>
>         *reg_base = of_iomap(args.np, 0);
> -       if (IS_ERR(*reg_base))
> -               return PTR_ERR(*reg_base);
> +       if (!*reg_base)
> +               return -ENOMEM;
>
>         return 0;
>  }
> --
> 2.39.1
>
>

