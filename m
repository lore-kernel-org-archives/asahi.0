Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F501367
	for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 12:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674389287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OzUQ1IkPAYdsRop+9FhR/pn1TRh9vi4iBxojZGSjAcA=;
	b=BU/7cnxg1tu35pnWOYNiiRealJHNFLGJd+/u/CRBAjzrY8LD8Ylphra2T9DC2P88nw50C6
	UyNgl7iSaHAooKiYC2I4qKVDJO9OzQxyAwvZz1q7oD2YeaZPgT2WehRAgVQygUwoRebAYO
	4QUAOj6NI7kpS8FxrQNnEJae/fgn81I=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-PYjPAJBiPXODa62y39Df4A-1; Sun, 22 Jan 2023 07:08:05 -0500
X-MC-Unique: PYjPAJBiPXODa62y39Df4A-1
Received: by mail-vk1-f197.google.com with SMTP id n131-20020a1f2789000000b003d93a6e6162so3775023vkn.21
        for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 04:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzUQ1IkPAYdsRop+9FhR/pn1TRh9vi4iBxojZGSjAcA=;
        b=hIdd3c72C6FHK8+gLCVtG3kfl6rWd+FsTl+DvYZ9oYQceUOTuQ58AMck039APHiwPh
         cM5ix9h+EBrGLIfWvwCkHAvC18xw46gIh30I72WhVRO6rWk34g2qLlZymCIGdb2ogdHK
         eFOURGsNaJRnszDPEXeGeCwmprIQS6M/naziMT1r3Iw6zMhnZACZ7YZrMclajPJWkNWp
         gsTz+xVjDB6lxDJuVcugNUKbeL8F1I9mMZR+Z41KxG8lu9JudFpReEmpf1WBIsnxr1TX
         44Wzhdfwzn+2iTA2faeDLGjdSwiWjpDmiRwUM2NG7l0HQHQs4cYwEstraCRPfH+iUkjs
         SH1A==
X-Gm-Message-State: AFqh2kqAjyqTA4RvFGk9fcmpMMrIukwt7GavPQDb4+O7Ma70D8u1sKwO
	+LLu6oh90tVhWD83qQCxOaARAmcf3Qf8/iHKB9h1vnAp6pOI3ULttLjgcfvfh+M25zJ0dV218nX
	gdNaEPuFClRYWawxjHLu/hOpXK8+3zEQ=
X-Received: by 2002:a1f:a386:0:b0:3d9:6e23:f2db with SMTP id m128-20020a1fa386000000b003d96e23f2dbmr2789048vke.28.1674389285300;
        Sun, 22 Jan 2023 04:08:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXspC4d9VfafbDNXzL4W89BnXS++Urwf3QLuB3Datz2LORxYulZlK7PQNdVqveWY+hlYOabiqmbWh9Blcw8zKWc=
X-Received: by 2002:a1f:a386:0:b0:3d9:6e23:f2db with SMTP id
 m128-20020a1fa386000000b003d96e23f2dbmr2789044vke.28.1674389285103; Sun, 22
 Jan 2023 04:08:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230121074253.9774-1-lina@asahilina.net>
In-Reply-To: <20230121074253.9774-1-lina@asahilina.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sun, 22 Jan 2023 12:07:49 +0000
Message-ID: <CAOgh=FwrkFsst9sdL54jF=aKZRo6PP+TPwcXad_GN4Fiq_b_8g@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: rtkit: Add a private pointer to apple_rtkit_shmem
To: Asahi Lina <lina@asahilina.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Jan 2023 at 07:53, Asahi Lina <lina@asahilina.net> wrote:
>
> This allows downstream consumers to keep track of private data for shmem
> mappings. In particular, the Rust abstraction will use this to safely
> drop data associated with a mapping when it is unmapped.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Signed-off-by: Eric Curtin <ecurtin@redhat.com>

>  include/linux/soc/apple/rtkit.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
> index 62bfa37b5adb..1a9888a1797a 100644
> --- a/include/linux/soc/apple/rtkit.h
> +++ b/include/linux/soc/apple/rtkit.h
> @@ -22,6 +22,7 @@
>   * @size:      Size of the shared memory buffer.
>   * @iova:      Device VA of shared memory buffer.
>   * @is_mapped: Shared memory buffer is managed by the co-processor.
> + * @private:   Private data pointer for the parent driver.
>   */
>
>  struct apple_rtkit_shmem {
> @@ -30,6 +31,7 @@ struct apple_rtkit_shmem {
>         size_t size;
>         dma_addr_t iova;
>         bool is_mapped;
> +       void *private;
>  };
>
>  /*
> --
> 2.35.1
>
>

