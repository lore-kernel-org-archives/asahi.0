Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F249B33D8
	for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 18:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674410731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tG4L0cEQEIn10iWcKsfL/igQPD1Vyt3atHFmU9xgaeA=;
	b=ElZtuDI0FWFAlQD69BfAqCZjGOeCotA4y/URMcKxBJ6/wShgP9ZtgcrYw3ip22B1RU8dG3
	XBALsf7xILtaOYJccKNFNvD/pHvmEw+CnMO1SW74QYYm1L1xt7e94A8cLJnbGMKMn+jQU3
	f4cRwprlITg0UTDwfOC9Y2zAj/FcSu4=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-LyP4xDZMPmeGp85XExncfg-1; Sun, 22 Jan 2023 13:05:30 -0500
X-MC-Unique: LyP4xDZMPmeGp85XExncfg-1
Received: by mail-vk1-f200.google.com with SMTP id f123-20020a1f9c81000000b003e1a7591524so4030045vke.1
        for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 10:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tG4L0cEQEIn10iWcKsfL/igQPD1Vyt3atHFmU9xgaeA=;
        b=dTE5z97bAXfhc7DqeSq78wM/xGZ4mm7buin61JF8Ri1Q2/1fM+a+VQahBlMyHIiDmX
         w1HYsYK4IkAz5dJioc4IvUo2f/wYs8CFmz7gxjWcP7hrC7pNiY+QmOFcERk/t2pUTwqM
         l+neUkC+FMU/t+kI8LpOM+zgeswV3yoIZiAbHlz3SxjfUucHMdNY1vzhich8eJBbJV09
         XN2b3nSrgzH+qN4caeg/iFtimSukOv7Lbs/Ajx4pbPkTYaeeFYOoA1w3Sqhe0+NFtu/c
         YwGq9wYOpguXXn2KEOmxrXfTzcCAfQ7LSdUHbzlQjMwlfpnfJnKsvCAF2dDKURVoy3WZ
         6UBA==
X-Gm-Message-State: AFqh2koSbbeoCcl9oCoXbYGsfuSkI0CMUy5zCfFRYdokT7oLe0LTctoT
	WwFjCpjoUP3l8iuAkMk68noI7UXKnTc+NiQ1zu4zZUQj5A70FyiOrCSmrKrwWXTRpWJieOSMkZT
	fa52XdQlyUiFipb1vZ9BrubOSs1hTTNo=
X-Received: by 2002:a67:e992:0:b0:3d2:e26a:d76f with SMTP id b18-20020a67e992000000b003d2e26ad76fmr2649137vso.41.1674410730088;
        Sun, 22 Jan 2023 10:05:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt6xqNFnzcOFl095OFpFyj/GiNxL1ARJlGscYK+I56jVRXdls7GoEtq0uv2D1H4GUbYVv7Yy5Y5IyHwPhmIbco=
X-Received: by 2002:a67:e992:0:b0:3d2:e26a:d76f with SMTP id
 b18-20020a67e992000000b003d2e26ad76fmr2649136vso.41.1674410729838; Sun, 22
 Jan 2023 10:05:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230121074253.9774-1-lina@asahilina.net>
In-Reply-To: <20230121074253.9774-1-lina@asahilina.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sun, 22 Jan 2023 18:05:14 +0000
Message-ID: <CAOgh=FxP_Zf7uD0QYej=0ULTNFDGHg0OHbAQV4L9bjsG4myT1g@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: rtkit: Add a private pointer to apple_rtkit_shmem
To: Asahi Lina <lina@asahilina.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Is mise le meas/Regards,

Eric Curtin


On Sat, 21 Jan 2023 at 07:53, Asahi Lina <lina@asahilina.net> wrote:
>
> This allows downstream consumers to keep track of private data for shmem
> mappings. In particular, the Rust abstraction will use this to safely
> drop data associated with a mapping when it is unmapped.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Sorry Lina, these were obviously supposed to not be signed off tags, but:

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

that's what you get, when you copy a tag from somewhere else!

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

