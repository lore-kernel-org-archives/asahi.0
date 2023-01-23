Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841067C
	for <asahi@lists.linux.dev>; Mon, 23 Jan 2023 11:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674472279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLW1zu/uqNqiNzxwf0pUEyEiwMB4MNxJjb70gD496nc=;
	b=R6acrYWAvPCbclKzRJK5prqFLBgh5Zhx/nBiXk/fv/K2txibtsumwoGfru1GnLHMfwU6xX
	EjoBJQHhoRKZxlGcCkp9BrOl7BqCkinxHdI2/JafgU+HhVOo71v9PU1KZTbBTjFBT5ahWe
	WtdjzVUUPUG7NfXvgZCwZLhIk3B6/D4=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-l23PdHmvPlWzaU2yCpMGkQ-1; Mon, 23 Jan 2023 06:11:17 -0500
X-MC-Unique: l23PdHmvPlWzaU2yCpMGkQ-1
Received: by mail-vs1-f71.google.com with SMTP id s62-20020a675e41000000b003cefb1730d9so2807196vsb.0
        for <asahi@lists.linux.dev>; Mon, 23 Jan 2023 03:11:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLW1zu/uqNqiNzxwf0pUEyEiwMB4MNxJjb70gD496nc=;
        b=oTq8HuBvHC/G+KttJesgjtPzFAL68OkoJ9+HJht5JlYZkjwit7pdVskDClIx67zMpf
         tqb9VtdWVa5HFc/FYPrFv14ija/qz0x8mpuJb3xVekWp5ImWzWCrjyuKDF8pQhDpYkbr
         ErSqhunthBXdhppuCGYPpk6Wdoumfjq3dh0eTUQZ938sHkz7rNnf6zrkj4+Pinp4x64H
         Z5J/9aK5/2MzKKFiIswXDhliOAvZoqZf+SyR5t8pFkxANyDKmqdiwyshvz/TpVfIJXDA
         Q8yYIb/KZSyomEg5X2NUQ8/wq3jA9qPFtfn6Q0Zflh0iaKJgQxuuSjEB/By/FlOF15fo
         BFCg==
X-Gm-Message-State: AFqh2kp/fMfbXxUN1QZ1oywbNgcQTRBzc2SUMdl3BABW5wR3yyUuSPXG
	RAnhSsVIeOxJmlyuZDATDV8luDS4j60JZ+yLeAUKcP3cqpHd7HqLRQ7Rvb/JHUXiolAIBJXrR1P
	X6P0SiLPOBpTEJ2rQkYXWLk5hboz8xCE=
X-Received: by 2002:ab0:25d1:0:b0:419:23:73b5 with SMTP id y17-20020ab025d1000000b00419002373b5mr2625765uan.17.1674472276859;
        Mon, 23 Jan 2023 03:11:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvNuFzf3awsJRX31iM/Ic/uH+uRpF3B1E+2FTOiZ733WSjUePPEahunKZ6rWi5dytte8R/Rn1vNjkVBRgkYvIw=
X-Received: by 2002:ab0:25d1:0:b0:419:23:73b5 with SMTP id y17-20020ab025d1000000b00419002373b5mr2625759uan.17.1674472276610;
 Mon, 23 Jan 2023 03:11:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230123065354.28179-1-marcan@marcan.st>
In-Reply-To: <20230123065354.28179-1-marcan@marcan.st>
From: Eric Curtin <ecurtin@redhat.com>
Date: Mon, 23 Jan 2023 11:11:00 +0000
Message-ID: <CAOgh=FxQLtA3OaQOq=tTGzTwod-BOSu+CP5QpgR2z4iFmoCX3w@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: rtkit: Add apple_rtkit_idle() function
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Jan 2023 at 07:03, Hector Martin <marcan@marcan.st> wrote:
>
> This is yet another low power mode, used by DCP.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---

New power state, nice

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

>  drivers/soc/apple/rtkit.c       | 21 +++++++++++++++++++++
>  include/linux/soc/apple/rtkit.h |  5 +++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index ceb4516e442c..509b050cf040 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -9,6 +9,7 @@
>  enum {
>         APPLE_RTKIT_PWR_STATE_OFF = 0x00, /* power off, cannot be restarted */
>         APPLE_RTKIT_PWR_STATE_SLEEP = 0x01, /* sleeping, can be restarted */
> +       APPLE_RTKIT_PWR_STATE_IDLE = 0x201, /* sleeping, retain state */
>         APPLE_RTKIT_PWR_STATE_QUIESCED = 0x10, /* running but no communication */
>         APPLE_RTKIT_PWR_STATE_ON = 0x20, /* normal operating state */
>  };
> @@ -882,6 +883,26 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
>
> +int apple_rtkit_idle(struct apple_rtkit *rtk)
> +{
> +       int ret;
> +
> +       /* if OFF is used here the co-processor will not wake up again */
> +       ret = apple_rtkit_set_ap_power_state(rtk,
> +                                            APPLE_RTKIT_PWR_STATE_IDLE);
> +       if (ret)
> +               return ret;
> +
> +       ret = apple_rtkit_set_iop_power_state(rtk, APPLE_RTKIT_PWR_STATE_IDLE);
> +       if (ret)
> +               return ret;
> +
> +       rtk->iop_power_state = APPLE_RTKIT_PWR_STATE_IDLE;
> +       rtk->ap_power_state = APPLE_RTKIT_PWR_STATE_IDLE;
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(apple_rtkit_idle);
> +
>  int apple_rtkit_quiesce(struct apple_rtkit *rtk)
>  {
>         int ret;
> diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
> index 2a0edb5fa6fe..f8d9cc0691de 100644
> --- a/include/linux/soc/apple/rtkit.h
> +++ b/include/linux/soc/apple/rtkit.h
> @@ -132,6 +132,11 @@ int apple_rtkit_wake(struct apple_rtkit *rtk);
>   */
>  int apple_rtkit_shutdown(struct apple_rtkit *rtk);
>
> +/*
> + * Put the co-processor into idle mode
> + */
> +int apple_rtkit_idle(struct apple_rtkit *rtk);
> +
>  /*
>   * Checks if RTKit is running and ready to handle messages.
>   */
> --
> 2.35.1
>
>

