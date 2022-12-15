Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D008568B
	for <asahi@lists.linux.dev>; Thu, 15 Dec 2022 17:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671124274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CqfvPrwDCUsZIW9mE1ST+e7fYO/OE5JE7HWjiLLZSQw=;
	b=MtI92X53USr/CE+0+Nhb/AM9ySwlRpmfIciDOeqWcT7+gFH28QNWSgJoODMDy2EqvGhkoa
	xkmfa2lXSoGksUZyawTHTakleg/OmsVDYmJd5SSidTgYTN9tcu5wFtr9gxRVMzkgkSXwhu
	Z4esqFaW7arIoIIjCeAGHyyUH9ojWss=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-311-M2z4-NzUP0erOhgzbKEcFQ-1; Thu, 15 Dec 2022 12:11:12 -0500
X-MC-Unique: M2z4-NzUP0erOhgzbKEcFQ-1
Received: by mail-vk1-f200.google.com with SMTP id n20-20020a1fa414000000b003bc585c7d50so3854946vke.16
        for <asahi@lists.linux.dev>; Thu, 15 Dec 2022 09:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqfvPrwDCUsZIW9mE1ST+e7fYO/OE5JE7HWjiLLZSQw=;
        b=ZQc7nGEpABed9I79LI/C1KkfonCXfP3/ut4KQFFZ+1jofH4tddeW+qBt3UTiEcX4B9
         Mx6IpvFvfGtXmq1wz0qU1mVGuBMUSUUSB9x1S2LzJ+t4e7K+k8xUf6AIlBUJlxGHNnlo
         wPo5IzMeWQYt/JK3ir/vlH7pAj4DqE3guJ6eNKfrgQODylvCQjwy1OMqeyjJTH3db0rW
         UIVbGsReasmjVKhzW6GOlHtadN2/Eoxcp+l2XsnlI9RF2NuqaiBl8jvFumHP/HHbOBn0
         DVhkt2hE8kSiazCruk9m9cO3+6zT+U7ALaJwmCM/4wSsGCmxIFAcIlHOjPCXNonME2pQ
         vzBw==
X-Gm-Message-State: ANoB5pl4hbDLmukzkpNE1zDjZ3ZZoQy+a/lCUm/R7Yf4bfnAd444sgUT
	GlSNXcJZbk4huZ427FE++L+SaODyp+gea9X+BeUyj9rpQjJaIfTF3byYPl8xXFas2/H+Sw99jsN
	0ZRUheQKCEt2MnYIxzUgNULsA2CGh/xo=
X-Received: by 2002:a1f:9d45:0:b0:3bd:7464:d818 with SMTP id g66-20020a1f9d45000000b003bd7464d818mr15951098vke.11.1671124272272;
        Thu, 15 Dec 2022 09:11:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5DpRvSS1TE6vnCQIy8OtywyRZKjB7AAg3FRM32z2D5CsF6I9GRgKRogkj7PTJRC46YP7KwFVukn8aYZgB9xQ8=
X-Received: by 2002:a1f:9d45:0:b0:3bd:7464:d818 with SMTP id
 g66-20020a1f9d45000000b003bd7464d818mr15951093vke.11.1671124271987; Thu, 15
 Dec 2022 09:11:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221215165523.1920672-1-arnd@kernel.org>
In-Reply-To: <20221215165523.1920672-1-arnd@kernel.org>
From: Eric Curtin <ecurtin@redhat.com>
Date: Thu, 15 Dec 2022 17:10:56 +0000
Message-ID: <CAOgh=Fw4BXvGNV0bsTXfSxy+ks09ed=nbJhkOWE+UrT7LW+r6A@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: apple: remove duplicate intializer
To: Arnd Bergmann <arnd@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Dec 2022 at 17:05, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When -Woverride-init is enabled, gcc notices that the .attr
> field is initialized twice:
>
> drivers/cpufreq/apple-soc-cpufreq.c:331:27: error: initialized field overwritten [-Werror=override-init]
>   331 |         .attr           = apple_soc_cpufreq_hw_attr,
>       |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Remove the first one, since this is not actually used.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index d1801281cdd9..6f26395184c4 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -321,7 +321,6 @@ static struct cpufreq_driver apple_soc_cpufreq_driver = {
>         .flags          = CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
>                           CPUFREQ_NEED_INITIAL_FREQ_CHECK | CPUFREQ_IS_COOLING_DEV,
>         .verify         = cpufreq_generic_frequency_table_verify,
> -       .attr           = cpufreq_generic_attr,
>         .get            = apple_soc_cpufreq_get_rate,
>         .init           = apple_soc_cpufreq_init,
>         .exit           = apple_soc_cpufreq_exit,
> --
> 2.35.1
>
>

