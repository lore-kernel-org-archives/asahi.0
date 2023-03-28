Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3276F79C5
	for <asahi@lists.linux.dev>; Tue, 28 Mar 2023 13:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680010663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8mx91f8t126xRraGAFvIuB3h+JIDesTPA0Tn6kITRj0=;
	b=PmsbqordYKyIpxmHMscMLwIwL7CJOY/zWGYQtlfqnJpc7mTa/Nzf1cRO1l5j0K0DiYVamR
	RHlSXS1xPs8p24mJ8jQeBC37K42b3NM2Blb0sv8dZ8qA6DjGCqwS/0+91SpwNIsJBwPSmZ
	oAbqGoly0ygXL9bB1xRsgu/4+napGO4=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-jPZCVh0SN2yZfCsTTjkexA-1; Tue, 28 Mar 2023 09:37:42 -0400
X-MC-Unique: jPZCVh0SN2yZfCsTTjkexA-1
Received: by mail-vs1-f70.google.com with SMTP id h25-20020a67c199000000b00426372db235so3723905vsj.10
        for <asahi@lists.linux.dev>; Tue, 28 Mar 2023 06:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mx91f8t126xRraGAFvIuB3h+JIDesTPA0Tn6kITRj0=;
        b=zH+waRCq3+1myP2enRLjjmKlnxQpOrsy1pCtQsKNruzU5haBo6FLebIL4AOnsxAt40
         XvxGD7TCocyfiuzrEJ5zizC3WpbRghggp2Q5ilHoV9Rz8nRCHLM8BNHN0Zmbnm2CHkKT
         hucg/fcdFcKjo4BsV2vvsC1tqGjkRNXhAsgWLQ14btx8Zajvwv2nsxQphvt0QbjfSssA
         HgFfKc0G35YPMWmstHSl/TEoKh5a6BC4m2yVj3G5RIrs2N+NrJFmRd67Uju8AN7mmORM
         6vhFZAXLgpmw0kWS31NtHTh8Iew/V28fI5LuQW7MbSCrbNH0Nx7w2CmtynEIwRmV4psT
         oX1w==
X-Gm-Message-State: AAQBX9duPR63ai7lcBq2cSqdD15laE17vqEmyoOHtJQlulyY1kG6vtq6
	9jMVRnII4HitV0VIGmXgoZEh37mA5NoTitF8DI5UntEdk88wAwq0hqh0EAVmLsnwxzc4LGttHsj
	VGqhhvujFzfoLiDjpGcYWgPhegVwQpahOrFCKrdfi/6jC
X-Received: by 2002:a1f:ab8b:0:b0:43b:ec02:c2e8 with SMTP id u133-20020a1fab8b000000b0043bec02c2e8mr2445230vke.3.1680010661209;
        Tue, 28 Mar 2023 06:37:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yko7tZ8Gv5ilC1vg4NdbfNgUh7EXCu5O2eqwl++YaDbFuhpB/sbudFcbm7n/xd6HAuPQh5mEhsnY482Xn5YOI=
X-Received: by 2002:a1f:ab8b:0:b0:43b:ec02:c2e8 with SMTP id
 u133-20020a1fab8b000000b0043bec02c2e8mr2445206vke.3.1680010660715; Tue, 28
 Mar 2023 06:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230328-soc-mailbox-v1-0-3953814532fd@marcan.st> <20230328-soc-mailbox-v1-3-3953814532fd@marcan.st>
In-Reply-To: <20230328-soc-mailbox-v1-3-3953814532fd@marcan.st>
From: Eric Curtin <ecurtin@redhat.com>
Date: Tue, 28 Mar 2023 14:37:24 +0100
Message-ID: <CAOgh=Fx5gAEFKnmsrgfOQWP13ZTKmwkhvUj0jSbyxhWisCumFA@mail.gmail.com>
Subject: Re: [PATCH 3/5] soc: apple: rtkit: Port to the internal mailbox driver
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Janne Grunau <j@jannau.net>, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Mar 2023 at 14:21, Hector Martin <marcan@marcan.st> wrote:
>
> Now that we have a mailbox driver in drivers/soc/apple, port the RTKit
> code to it. This mostly just entails replacing calls through the mailbox
> subsystem with direct calls into the driver.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>

Watched the stream

Acked-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
>  drivers/soc/apple/Kconfig          |   2 +-
>  drivers/soc/apple/rtkit-internal.h |   8 +--
>  drivers/soc/apple/rtkit.c          | 101 ++++++++++---------------------------
>  3 files changed, 31 insertions(+), 80 deletions(-)
>
> diff --git a/drivers/soc/apple/Kconfig b/drivers/soc/apple/Kconfig
> index caa2cf09ff7a..d0e29bbd8c6f 100644
> --- a/drivers/soc/apple/Kconfig
> +++ b/drivers/soc/apple/Kconfig
> @@ -33,7 +33,7 @@ config APPLE_MBOX
>
>  config APPLE_RTKIT
>         tristate "Apple RTKit co-processor IPC protocol"
> -       depends on MAILBOX
> +       depends on APPLE_MBOX
>         depends on ARCH_APPLE || COMPILE_TEST
>         default ARCH_APPLE
>         help
> diff --git a/drivers/soc/apple/rtkit-internal.h b/drivers/soc/apple/rtkit-internal.h
> index 24bd619ec5e4..27c9fa745fd5 100644
> --- a/drivers/soc/apple/rtkit-internal.h
> +++ b/drivers/soc/apple/rtkit-internal.h
> @@ -7,18 +7,17 @@
>  #ifndef _APPLE_RTKIT_INTERAL_H
>  #define _APPLE_RTKIT_INTERAL_H
>
> -#include <linux/apple-mailbox.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitmap.h>
>  #include <linux/completion.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> -#include <linux/mailbox_client.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/soc/apple/rtkit.h>
>  #include <linux/workqueue.h>
> +#include "mailbox.h"
>
>  #define APPLE_RTKIT_APP_ENDPOINT_START 0x20
>  #define APPLE_RTKIT_MAX_ENDPOINTS 0x100
> @@ -28,10 +27,7 @@ struct apple_rtkit {
>         const struct apple_rtkit_ops *ops;
>         struct device *dev;
>
> -       const char *mbox_name;
> -       int mbox_idx;
> -       struct mbox_client mbox_cl;
> -       struct mbox_chan *mbox_chan;
> +       struct apple_mbox *mbox;
>
>         struct completion epmap_completion;
>         struct completion iop_pwr_ack_completion;
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index 7c9b9f25bbc1..e6d940292c9f 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -72,11 +72,6 @@ enum {
>  #define APPLE_RTKIT_MIN_SUPPORTED_VERSION 11
>  #define APPLE_RTKIT_MAX_SUPPORTED_VERSION 12
>
> -struct apple_rtkit_msg {
> -       struct completion *completion;
> -       struct apple_mbox_msg mbox_msg;
> -};
> -
>  struct apple_rtkit_rx_work {
>         struct apple_rtkit *rtk;
>         u8 ep;
> @@ -550,12 +545,12 @@ static void apple_rtkit_rx_work(struct work_struct *work)
>         kfree(rtk_work);
>  }
>
> -static void apple_rtkit_rx(struct mbox_client *cl, void *mssg)
> +static void apple_rtkit_rx(struct apple_mbox *mbox, struct apple_mbox_msg msg,
> +                          void *cookie)
>  {
> -       struct apple_rtkit *rtk = container_of(cl, struct apple_rtkit, mbox_cl);
> -       struct apple_mbox_msg *msg = mssg;
> +       struct apple_rtkit *rtk = cookie;
>         struct apple_rtkit_rx_work *work;
> -       u8 ep = msg->msg1;
> +       u8 ep = msg.msg1;
>
>         /*
>          * The message was read from a MMIO FIFO and we have to make
> @@ -571,7 +566,7 @@ static void apple_rtkit_rx(struct mbox_client *cl, void *mssg)
>
>         if (ep >= APPLE_RTKIT_APP_ENDPOINT_START &&
>             rtk->ops->recv_message_early &&
> -           rtk->ops->recv_message_early(rtk->cookie, ep, msg->msg0))
> +           rtk->ops->recv_message_early(rtk->cookie, ep, msg.msg0))
>                 return;
>
>         work = kzalloc(sizeof(*work), GFP_ATOMIC);
> @@ -580,30 +575,18 @@ static void apple_rtkit_rx(struct mbox_client *cl, void *mssg)
>
>         work->rtk = rtk;
>         work->ep = ep;
> -       work->msg = msg->msg0;
> +       work->msg = msg.msg0;
>         INIT_WORK(&work->work, apple_rtkit_rx_work);
>         queue_work(rtk->wq, &work->work);
>  }
>
> -static void apple_rtkit_tx_done(struct mbox_client *cl, void *mssg, int r)
> -{
> -       struct apple_rtkit_msg *msg =
> -               container_of(mssg, struct apple_rtkit_msg, mbox_msg);
> -
> -       if (r == -ETIME)
> -               return;
> -
> -       if (msg->completion)
> -               complete(msg->completion);
> -       kfree(msg);
> -}
> -
>  int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
>                              struct completion *completion, bool atomic)
>  {
> -       struct apple_rtkit_msg *msg;
> -       int ret;
> -       gfp_t flags;
> +       struct apple_mbox_msg msg = {
> +               .msg0 = message,
> +               .msg1 = ep,
> +       };
>
>         if (rtk->crashed)
>                 return -EINVAL;
> @@ -611,19 +594,6 @@ int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
>             !apple_rtkit_is_running(rtk))
>                 return -EINVAL;
>
> -       if (atomic)
> -               flags = GFP_ATOMIC;
> -       else
> -               flags = GFP_KERNEL;
> -
> -       msg = kzalloc(sizeof(*msg), flags);
> -       if (!msg)
> -               return -ENOMEM;
> -
> -       msg->mbox_msg.msg0 = message;
> -       msg->mbox_msg.msg1 = ep;
> -       msg->completion = completion;
> -
>         /*
>          * The message will be sent with a MMIO write. We need the barrier
>          * here to ensure any previous writes to buffers are visible to the
> @@ -631,19 +601,13 @@ int apple_rtkit_send_message(struct apple_rtkit *rtk, u8 ep, u64 message,
>          */
>         dma_wmb();
>
> -       ret = mbox_send_message(rtk->mbox_chan, &msg->mbox_msg);
> -       if (ret < 0) {
> -               kfree(msg);
> -               return ret;
> -       }
> -
> -       return 0;
> +       return apple_mbox_send(rtk->mbox, msg, atomic);
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_send_message);
>
>  int apple_rtkit_poll(struct apple_rtkit *rtk)
>  {
> -       return mbox_client_peek_data(rtk->mbox_chan);
> +       return apple_mbox_poll(rtk->mbox);
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_poll);
>
> @@ -665,20 +629,6 @@ int apple_rtkit_start_ep(struct apple_rtkit *rtk, u8 endpoint)
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_start_ep);
>
> -static int apple_rtkit_request_mbox_chan(struct apple_rtkit *rtk)
> -{
> -       if (rtk->mbox_name)
> -               rtk->mbox_chan = mbox_request_channel_byname(&rtk->mbox_cl,
> -                                                            rtk->mbox_name);
> -       else
> -               rtk->mbox_chan =
> -                       mbox_request_channel(&rtk->mbox_cl, rtk->mbox_idx);
> -
> -       if (IS_ERR(rtk->mbox_chan))
> -               return PTR_ERR(rtk->mbox_chan);
> -       return 0;
> -}
> -
>  struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
>                                             const char *mbox_name, int mbox_idx,
>                                             const struct apple_rtkit_ops *ops)
> @@ -704,13 +654,18 @@ struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
>         bitmap_zero(rtk->endpoints, APPLE_RTKIT_MAX_ENDPOINTS);
>         set_bit(APPLE_RTKIT_EP_MGMT, rtk->endpoints);
>
> -       rtk->mbox_name = mbox_name;
> -       rtk->mbox_idx = mbox_idx;
> -       rtk->mbox_cl.dev = dev;
> -       rtk->mbox_cl.tx_block = false;
> -       rtk->mbox_cl.knows_txdone = false;
> -       rtk->mbox_cl.rx_callback = &apple_rtkit_rx;
> -       rtk->mbox_cl.tx_done = &apple_rtkit_tx_done;
> +       if (mbox_name)
> +               rtk->mbox = apple_mbox_get_byname(dev, mbox_name);
> +       else
> +               rtk->mbox = apple_mbox_get(dev, mbox_idx);
> +
> +       if (IS_ERR(rtk->mbox)) {
> +               ret = PTR_ERR(rtk->mbox);
> +               goto free_rtk;
> +       }
> +
> +       rtk->mbox->rx = apple_rtkit_rx;
> +       rtk->mbox->cookie = rtk;
>
>         rtk->wq = alloc_ordered_workqueue("rtkit-%s", WQ_MEM_RECLAIM,
>                                           dev_name(rtk->dev));
> @@ -719,7 +674,7 @@ struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
>                 goto free_rtk;
>         }
>
> -       ret = apple_rtkit_request_mbox_chan(rtk);
> +       ret = apple_mbox_start(rtk->mbox);
>         if (ret)
>                 goto destroy_wq;
>
> @@ -750,7 +705,7 @@ static int apple_rtkit_wait_for_completion(struct completion *c)
>  int apple_rtkit_reinit(struct apple_rtkit *rtk)
>  {
>         /* make sure we don't handle any messages while reinitializing */
> -       mbox_free_channel(rtk->mbox_chan);
> +       apple_mbox_stop(rtk->mbox);
>         flush_workqueue(rtk->wq);
>
>         apple_rtkit_free_buffer(rtk, &rtk->ioreport_buffer);
> @@ -774,7 +729,7 @@ int apple_rtkit_reinit(struct apple_rtkit *rtk)
>         rtk->iop_power_state = APPLE_RTKIT_PWR_STATE_OFF;
>         rtk->ap_power_state = APPLE_RTKIT_PWR_STATE_OFF;
>
> -       return apple_rtkit_request_mbox_chan(rtk);
> +       return apple_mbox_start(rtk->mbox);
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_reinit);
>
> @@ -930,7 +885,7 @@ EXPORT_SYMBOL_GPL(apple_rtkit_wake);
>
>  void apple_rtkit_free(struct apple_rtkit *rtk)
>  {
> -       mbox_free_channel(rtk->mbox_chan);
> +       apple_mbox_stop(rtk->mbox);
>         destroy_workqueue(rtk->wq);
>
>         apple_rtkit_free_buffer(rtk, &rtk->ioreport_buffer);
>
> --
> 2.40.0
>
>

