Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0D81367
	for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 12:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674389805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=brAkpxNNFoW2Z58ovept6ujrU4B664Hnu1EZEFyhAcY=;
	b=W16SwGcbLfK0PWdZVAlT+T7VPuWrKJGInSJluy2mofLG63iGE4gbGZbdO7zmxqOTxyXgQg
	oT7Z2/w1TmurJrsjCE+XnEUwPZ1t2+wJPpBxuOwC7z6Lg01iEKShz1UGx98Kpr1yXWNKN6
	AFPFcgAlQ53BdGelhypqirul4TACEVE=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-_Pg-2xfHNQm3ldr6otvm1g-1; Sun, 22 Jan 2023 07:16:44 -0500
X-MC-Unique: _Pg-2xfHNQm3ldr6otvm1g-1
Received: by mail-vk1-f198.google.com with SMTP id b72-20020a1fb24b000000b003d58fdc33fcso3788746vkf.10
        for <asahi@lists.linux.dev>; Sun, 22 Jan 2023 04:16:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brAkpxNNFoW2Z58ovept6ujrU4B664Hnu1EZEFyhAcY=;
        b=N/B6xVl2IGdUAfXpYaGjBCzg03P5UIWKB9drGU9yjJ/TqGkET27gQPLrojrIl6fhvK
         FC46yK71pT5ZiAeOHdUwKeyuYiHMMIp7JwL9olh73w3YAw+MG7EL4GjOE3flQzmQPIe2
         yeq4atxG6UvTVaoI/xAhKGI04K1W7lHSWu8A/jsUkiXpsUj3dbprgBqh+SjPnEl9PytB
         Zu8OUlPetozdyHj5+2xnfyzOLZP1QUutmMa7gh0ERGPLZfp3ynq5RCyVWyJfQUFcJmhX
         kSkWiYTYyVZFeIrbZQWUCEOmABwO0RvcvaS3gt9J/06CCAyditZHWHJt5SvDeytwu7bw
         /ZVw==
X-Gm-Message-State: AFqh2kqiilv+nCYNlf6x+1vGvBWx8q7epWX0b4SlWTJJ1KPgrdA73yks
	yhOd2pRiozT5RY2zMLwkPUlLaEMAAqfbJMYo6CHfz1Q5d22nX76w9TTbyVJ/LYLtMA1NWpxh7Sm
	Wt+ZxwsYOJ2jtQVFvnZkxrWl/+row9lw=
X-Received: by 2002:a67:ea04:0:b0:3d3:ec78:1d72 with SMTP id g4-20020a67ea04000000b003d3ec781d72mr3367185vso.13.1674389803899;
        Sun, 22 Jan 2023 04:16:43 -0800 (PST)
X-Google-Smtp-Source: AMrXdXstqJIXMudqh70EtyFZQyQrExJwlFEQoxbce+hMZ9zA7g8JYZZgFJ19R51I66UXYr8raWky+/W1qdTceGVyFcI=
X-Received: by 2002:a67:ea04:0:b0:3d3:ec78:1d72 with SMTP id
 g4-20020a67ea04000000b003d3ec781d72mr3367179vso.13.1674389803666; Sun, 22 Jan
 2023 04:16:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230121074135.8629-1-lina@asahilina.net>
In-Reply-To: <20230121074135.8629-1-lina@asahilina.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Sun, 22 Jan 2023 12:16:28 +0000
Message-ID: <CAOgh=FwPCJ3pDk0EUgekzdE+Y=OpyWHiWW5bo7qoX21trbMV7Q@mail.gmail.com>
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

Signed-off-by: Eric Curtin <ecurtin@redhat.com>

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

