Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE13D33D8
	for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 18:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674410763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vcaIEvEw2kQFdDtVG6J3qw3jie84Jdha/erxS3HJUJ4=;
	b=cvaAp5/vbfVffM/AlIrWVY4cbNhu7mVYRRthmrsDjCBlHz378D8/1Zmt8WgV/EELIElXaS
	dyuvn4gmPSX3xtG6CeC4hk65w56yLSJ+6SK9/KwcpMQBZRLwhYk6V+ebcVs7LTlpwiewbc
	Ma+y5JAqUCJJ2VQy7WPGYTvVxfhqJ3c=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-392-DO9OD6jWPXaO8j5xbKz48A-1; Sun, 22 Jan 2023 13:06:02 -0500
X-MC-Unique: DO9OD6jWPXaO8j5xbKz48A-1
Received: by mail-vk1-f197.google.com with SMTP id v11-20020a1fac0b000000b003e1c9576f7aso4081793vke.14
        for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 10:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcaIEvEw2kQFdDtVG6J3qw3jie84Jdha/erxS3HJUJ4=;
        b=o9AZJpazMdtY4+jWASV72L1Nko0JhrBtQ6c+wF3mIjMmLokZtqC4NMIEq1krRjCYRg
         fH9TerqTkS1okoQuCPgbaSxMJStsgpXhw/wNJuSpWaXlF0iZD7lp3HsPT3o/F5LWZLLf
         6jy+4JaIfD6doMUV9gy/bL8rzQU/p9NMWmVbZ5/tZnzDqwyP41gwmBemjC2e1sMq6Id/
         qrhAlsC9pXR9FryNt26puse0OJ2KWmzTj1hSkOI8GcXBDXczI930ABOL4kkuIFOtt+MV
         rh5AUjvQ7p/4rPnytxJkKu2D50txGW9SOxBbUmKUQYw1M529sdh6zmCAKP6Yn4k+RxyP
         3hgw==
X-Gm-Message-State: AFqh2kqdVcdocWaYYxqX5I4rhqrQkaQcSxZes7EFmlezIqW4ndTgYRaj
	0fTUHJ6+857u9BnnrbGFhHrsg+K4d+Y/97P8C+v+vdJ0eG/GDgX/43fulP/NUf8T9LQbBxgG09i
	6/sktV2G1mNtaRKjUHF2IaZCl/4kYluw=
X-Received: by 2002:ab0:39d6:0:b0:5d6:87df:263d with SMTP id g22-20020ab039d6000000b005d687df263dmr2268030uaw.58.1674410761278;
        Sun, 22 Jan 2023 10:06:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7kt+tvJVSdjC7CXhzl7u8uiu/MSmcfTHSlJjAFczq7OXUmYCh4CDD2soj8KhGCdG1oy5hrUxPqUexDaa/k4Y=
X-Received: by 2002:ab0:39d6:0:b0:5d6:87df:263d with SMTP id
 g22-20020ab039d6000000b005d687df263dmr2268026uaw.58.1674410761031; Sun, 22
 Jan 2023 10:06:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230121074135.8629-1-lina@asahilina.net>
In-Reply-To: <20230121074135.8629-1-lina@asahilina.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sun, 22 Jan 2023 18:05:45 +0000
Message-ID: <CAOgh=FwZ0niWu3=tvjYu91Bt0uxyv=6mE449we78X7KWPBPcCw@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: rtkit: Export non-devm init/free functions
To: Asahi Lina <lina@asahilina.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Jan 2023 at 07:48, Asahi Lina <lina@asahilina.net> wrote:
>
> While we normally encourage devm usage by drivers, some consumers (and
> in particular the upcoming Rust abstractions) might want to manually
> manage memory. Export the raw functions to make this possible.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin


>  drivers/soc/apple/rtkit.c       | 15 ++++++++++-----
>  include/linux/soc/apple/rtkit.h | 19 +++++++++++++++++++
>  2 files changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index fa3cda831d2b..bb33f3cd4efd 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -686,7 +686,7 @@ static int apple_rtkit_request_mbox_chan(struct apple_rtkit *rtk)
>         return mbox_start_channel(rtk->mbox_chan);
>  }
>
> -static struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
> +struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
>                                             const char *mbox_name, int mbox_idx,
>                                             const struct apple_rtkit_ops *ops)
>  {
> @@ -739,6 +739,7 @@ static struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
>         kfree(rtk);
>         return ERR_PTR(ret);
>  }
> +EXPORT_SYMBOL_GPL(apple_rtkit_init);
>
>  static int apple_rtkit_wait_for_completion(struct completion *c)
>  {
> @@ -922,10 +923,8 @@ int apple_rtkit_wake(struct apple_rtkit *rtk)
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_wake);
>
> -static void apple_rtkit_free(void *data)
> +void apple_rtkit_free(struct apple_rtkit *rtk)
>  {
> -       struct apple_rtkit *rtk = data;
> -
>         mbox_free_channel(rtk->mbox_chan);
>         destroy_workqueue(rtk->wq);
>
> @@ -936,6 +935,12 @@ static void apple_rtkit_free(void *data)
>         kfree(rtk->syslog_msg_buffer);
>         kfree(rtk);
>  }
> +EXPORT_SYMBOL_GPL(apple_rtkit_free);
> +
> +static void apple_rtkit_free_wrapper(void *data)
> +{
> +       apple_rtkit_free(data);
> +}
>
>  struct apple_rtkit *devm_apple_rtkit_init(struct device *dev, void *cookie,
>                                           const char *mbox_name, int mbox_idx,
> @@ -948,7 +953,7 @@ struct apple_rtkit *devm_apple_rtkit_init(struct device *dev, void *cookie,
>         if (IS_ERR(rtk))
>                 return rtk;
>
> -       ret = devm_add_action_or_reset(dev, apple_rtkit_free, rtk);
> +       ret = devm_add_action_or_reset(dev, apple_rtkit_free_wrapper, rtk);
>         if (ret)
>                 return ERR_PTR(ret);
>
> diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
> index 2d837aa7b91f..62bfa37b5adb 100644
> --- a/include/linux/soc/apple/rtkit.h
> +++ b/include/linux/soc/apple/rtkit.h
> @@ -77,6 +77,25 @@ struct apple_rtkit *devm_apple_rtkit_init(struct device *dev, void *cookie,
>                                           const char *mbox_name, int mbox_idx,
>                                           const struct apple_rtkit_ops *ops);
>
> +/*
> + * Non-devm version of devm_apple_rtkit_init. Must be freed with
> + * apple_rtkit_free.
> + *
> + * @dev:         Pointer to the device node this coprocessor is assocated with
> + * @cookie:      opaque cookie passed to all functions defined in rtkit_ops
> + * @mbox_name:   mailbox name used to communicate with the co-processor
> + * @mbox_idx:    mailbox index to be used if mbox_name is NULL
> + * @ops:         pointer to rtkit_ops to be used for this co-processor
> + */
> +struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
> +                                         const char *mbox_name, int mbox_idx,
> +                                         const struct apple_rtkit_ops *ops);
> +
> +/*
> + * Free an instance of apple_rtkit.
> + */
> +void apple_rtkit_free(struct apple_rtkit *rtk);
> +
>  /*
>   * Reinitialize internal structures. Must only be called with the co-processor
>   * is held in reset.
> --
> 2.35.1
>
>

