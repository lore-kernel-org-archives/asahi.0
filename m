Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6536879C5
	for <asahi@lists.linux.dev>; Tue, 28 Mar 2023 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680010604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=38WhB1xhz6iO9xwaGoOJESCsJJ1GMow8wYkaX1OpVf0=;
	b=cznFg6XMfwGXc6k4vXdyQ5Vkq5Z1pzwBSGo/CuLUQ/ihAGv2IVc+CT6O74rsirowiHPYKB
	h3wyUFwDyLxIoZ7niFj0zHklX8diSCmSXmo7Tu7Sck9+rRq85h+xcSRa/l4EiPQnRttvXm
	WixAkV5WPB8LCRd/dJFHQ4AldqbgSgk=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-pW_aliu9Ps-dVl5DbsuOvQ-1; Tue, 28 Mar 2023 09:36:43 -0400
X-MC-Unique: pW_aliu9Ps-dVl5DbsuOvQ-1
Received: by mail-vs1-f72.google.com with SMTP id t22-20020a67d916000000b00425d954c65fso3613079vsj.21
        for <asahi@lists.linux.dev>; Tue, 28 Mar 2023 06:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38WhB1xhz6iO9xwaGoOJESCsJJ1GMow8wYkaX1OpVf0=;
        b=1AsNPKRs9/F6/hZ+ruZy6xHoXou/5QJf4+hIiRL8TWiSgpSfHrS77T5PG0r3PFnw/w
         rR2jSyt6VxSRtZJKQix9xBnPwddnPoEiWAdLR/iPalIvMdDkUH8nFVCVFI+oi4ITd99u
         vPK0S59vtRQyqmGJhBe7lBpk/9Oc2uv20ML45EN9vhSxIgZNqlBnZYn9P2tL6UtpXCMq
         U2xxSxp/RrldY41q2JC+ZfIJahBqxpJV/H9HLSdP+aW1okFxfr83+tYNdDWNYKS8sTrV
         5cPYftP6t2iW3wkYM2PWGbHai+p79yG/UNT0ndpRfVjEGnD3We8vdXYT5URtRL0iGPxG
         iLYA==
X-Gm-Message-State: AAQBX9coPBtxx0xR96FEydKkL01xjRlCcC4djmE5iGMOL9YdPswdEzQr
	bCTTI5SutmkVblQyvQ/O97OOoQAJI6Lvd8QwLPY92JjN3G6GusBI/kpT97o7CiHL6OuPeKUMrMV
	WDc7/d1z6IVE1ke4DoZNEQ3yvjYI3owE=
X-Received: by 2002:a67:d78d:0:b0:425:dd21:acc8 with SMTP id q13-20020a67d78d000000b00425dd21acc8mr8457956vsj.7.1680010602694;
        Tue, 28 Mar 2023 06:36:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350aD49wliP3FptdixB7cu5C7ONZu/9rIPSHjym/CTFrbaUpovBd8LuxZBaGrdm3pSCVMhO5vQdqJWYOKsWvWXH8=
X-Received: by 2002:a67:d78d:0:b0:425:dd21:acc8 with SMTP id
 q13-20020a67d78d000000b00425dd21acc8mr8457942vsj.7.1680010602358; Tue, 28 Mar
 2023 06:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230328-soc-mailbox-v1-0-3953814532fd@marcan.st> <20230328-soc-mailbox-v1-1-3953814532fd@marcan.st>
In-Reply-To: <20230328-soc-mailbox-v1-1-3953814532fd@marcan.st>
From: Eric Curtin <ecurtin@redhat.com>
Date: Tue, 28 Mar 2023 14:36:26 +0100
Message-ID: <CAOgh=Fwur3_aBhKqRW-JaTKXHJaKhCpvA-9d7ZKhMbRmtGYHWQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] soc: apple: rtkit: Get rid of apple_rtkit_send_message_wait
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Mar 2023 at 14:20, Hector Martin <marcan@marcan.st> wrote:
>
> It is fundamentally broken and has no users. Just remove it.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>

Watched the stream

Acked-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/soc/apple/rtkit.c       | 32 --------------------------------
>  include/linux/soc/apple/rtkit.h | 18 ------------------
>  2 files changed, 50 deletions(-)
>
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index d9f19dc99da5..7c9b9f25bbc1 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -641,38 +641,6 @@ int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_send_message);
>
> -int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
> -                                 unsigned long timeout, bool atomic)
> -{
> -       DECLARE_COMPLETION_ONSTACK(completion);
> -       int ret;
> -       long t;
> -
> -       ret = apple_rtkit_send_message(rtk, ep, message, &completion, atomic);
> -       if (ret < 0)
> -               return ret;
> -
> -       if (atomic) {
> -               ret = mbox_flush(rtk->mbox_chan, timeout);
> -               if (ret < 0)
> -                       return ret;
> -
> -               if (try_wait_for_completion(&completion))
> -                       return 0;
> -
> -               return -ETIME;
> -       } else {
> -               t = wait_for_completion_interruptible_timeout(
> -                       &completion, msecs_to_jiffies(timeout));
> -               if (t < 0)
> -                       return t;
> -               else if (t == 0)
> -                       return -ETIME;
> -               return 0;
> -       }
> -}
> -EXPORT_SYMBOL_GPL(apple_rtkit_send_message_wait);
> -
>  int apple_rtkit_poll(struct apple_rtkit *rtk)
>  {
>         return mbox_client_peek_data(rtk->mbox_chan);
> diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
> index fc456f75c131..8c9ca857ccf6 100644
> --- a/include/linux/soc/apple/rtkit.h
> +++ b/include/linux/soc/apple/rtkit.h
> @@ -160,24 +160,6 @@ int apple_rtkit_start_ep(struct apple_rtkit *rtk, u8 endpoint);
>  int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
>                              struct completion *completion, bool atomic);
>
> -/*
> - * Send a message to the given endpoint and wait until it has been submitted
> - * to the hardware FIFO.
> - * Will return zero on success and a negative error code on failure
> - * (e.g. -ETIME when the message couldn't be written within the given
> - * timeout)
> - *
> - * @rtk:            RTKit reference
> - * @ep:             target endpoint
> - * @message:        message to be sent
> - * @timeout:        timeout in milliseconds to allow the message transmission
> - *                  to be completed
> - * @atomic:         if set to true this function can be called from atomic
> - *                  context.
> - */
> -int apple_rtkit_send_message_wait(struct apple_rtkit *rtk, u8 ep, u64 message,
> -                                 unsigned long timeout, bool atomic);
> -
>  /*
>   * Process incoming messages in atomic context.
>   * This only guarantees that messages arrive as far as the recv_message_early
>
> --
> 2.40.0
>
>

