Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280D57C
	for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 11:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676461232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bP0bXUiaDH/boozQCsBpj6Xk/aGxK9UqogMEXux8y/Y=;
	b=SiEaUKOBjHu6psXC+seCjpgOGybdzmRxBz7qIUAJ9Nhmb8LnNZg1f/btXLv606Wdz/kr6f
	L5vN9Z8YNlyyhk6R5Bo15H5iTJrl+3rgXk+QdK1ercjY/455rmN7usbp85J+2GCokYohQS
	/xYDkLxWtYIYLOPkdHD2YtqSAka80OQ=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-DSWkJSMMNnaR31Dgthh5wA-1; Wed, 15 Feb 2023 06:40:31 -0500
X-MC-Unique: DSWkJSMMNnaR31Dgthh5wA-1
Received: by mail-vk1-f198.google.com with SMTP id 13-20020a056122168d00b004014e127279so4370259vkl.20
        for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 03:40:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP0bXUiaDH/boozQCsBpj6Xk/aGxK9UqogMEXux8y/Y=;
        b=UBTREq/Tia855RR0i9n708YbaNLPt6wijUZAmyKLsIX4wzbQsJmAx6TS7BJkaEoX+/
         2+YOclxHD0wn+GW0BeI1QBBx7ouWfwOM37DvXHiDcc8WFaVg7QEWweVKMBKf01mNBaKg
         cyoNvHezMnaMlAg36CdQf1jq1ECfF5Ctpa8VdrIZ+olxL33xER7vTmyPCnaJWVX9iOIH
         b35Kl8L3U7AcSitQwiqWfikahmClo5nZmFemipghFp8H1NGM5+b43lbAelZcK9vLOvoc
         ntTqjej54EYsQWUrAlE/MSCOytMxKI03SbUFp0hA3ALexaq4Z9mieY6SVLKOwWBHHRFS
         YWwQ==
X-Gm-Message-State: AO0yUKUEJh4L1bOq1xShm5mxjdgalDso7V3sw1qq+H7J7RYV1l2QiGoW
	Q6QPdML04OpGk3UPA1MIbpkX2IrXfWuqUcz/NG35PfrFOpgpLtm3CsmTunhYhGRtECLuX/ez/DP
	qZv7+ik4dR8XscTMlPTwI+z75js/kZQY=
X-Received: by 2002:a05:6102:34c7:b0:411:bd2e:11ac with SMTP id a7-20020a05610234c700b00411bd2e11acmr286379vst.75.1676461231215;
        Wed, 15 Feb 2023 03:40:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/ec/Q3TOlkRzgnxVJ/+TUUmx2nTPikt2SH7K2yD2bJse3Fds41BApWtp1vT1H9cn99iNHGJGfx8IKaZowROyE=
X-Received: by 2002:a05:6102:34c7:b0:411:bd2e:11ac with SMTP id
 a7-20020a05610234c700b00411bd2e11acmr286371vst.75.1676461230930; Wed, 15 Feb
 2023 03:40:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230215-arm_pmu_m1_regression-v1-1-f5a266577c8d@jannau.net>
In-Reply-To: <20230215-arm_pmu_m1_regression-v1-1-f5a266577c8d@jannau.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Wed, 15 Feb 2023 11:40:15 +0000
Message-ID: <CAOgh=FwCk1qMUAqkv+aih_=6vJ0SjqyzS9-gW+v+YjEse6V0Yw@mail.gmail.com>
Subject: Re: [PATCH] arm_pmu: Invert fallback armpmu_filter() return value
To: Janne Grunau <j@jannau.net>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Feb 2023 at 11:36, Janne Grunau <j@jannau.net> wrote:
>
> Fixes a regression in "perf: Rewrite core context handling" for arm_pmu
> based drivers without a filter function pointer as the Apple M1 PMU.
> The event is ignored if filter() returns 'true' opposite to
> filter_match(). The refactoring failed to invert the return value if
> arm_pmu has no filter() function pointer of its own.
>
> Fixes: bd2756811766 ("perf: Rewrite core context handling")
> Signed-off-by: Janne Grunau <j@jannau.net>

Makes sense we return the inverse of armpmu_filter everywhere else in the code.

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/perf/arm_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index 9b593f985805..9cb22f36cf66 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -556,7 +556,7 @@ static bool armpmu_filter(struct pmu *pmu, int cpu)
>         if (ret && armpmu->filter)
>                 return armpmu->filter(pmu, cpu);
>
> -       return ret;
> +       return !ret;
>  }
>
>  static ssize_t cpus_show(struct device *dev,
>
> ---
> base-commit: ceaa837f96adb69c0df0397937cd74991d5d821a
> change-id: 20230215-arm_pmu_m1_regression-b6dd48d0c792
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>
>

