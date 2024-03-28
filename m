Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB70131BD3;
	Thu, 28 Mar 2024 19:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711653793; cv=none; b=RxJUHsXVY8KqEYaRlLY0+8smT3UaDXCZJVsrKgsWPFVs3/xbu30dQl0Lg7pQXUKEOKxyAAjf9sI8pq1QLB1ucsx13l2P3jsSPnku9k4GCKs4aAoKJQ4j2kRTy9zlUaDjowauoYZob5CuteRaQwGCSQ/eD/tnACP9CNTSbv2h7Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711653793; c=relaxed/simple;
	bh=Qkh+5aM9AgMrPiE9S446jPnPgfztZdsPallUAN8x3Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIiqTqLtdm/iVzJmAueuII4v9ey6aSD7koYbSy4PZKzywXI+Y2MOisbV/lZY0OlgrBjwjU7itpbyZNLSLn+C7BQUPs1huwEHB4IqTzqyPNZG3mENNaL+IG+X4P8Wbl9pd4mrhbGu0DDJPpUy39xHYHvynVYbe6n1NgVc36I1YIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqIV5CF5; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqIV5CF5"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6e707210ab9so57443a34.2;
        Thu, 28 Mar 2024 12:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711653790; x=1712258590; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GyFGSwdDS+8X5fWOjo2s+K1AMkRQoOt7S254R+rI76g=;
        b=MqIV5CF5VzwEm026X8H1WHr/uMSOsh720LW45xDa0qjEzIlA5s74ahz1U078Fq7Fq6
         EJI1bnS2g0Jc/opZB4jfzE3FKlEFe301xnY3BUQiNPFgkfg7FIFLtBe8FO5uk8dNBHOK
         Aw5waIQ1HhqU3ChLBYkUnLW6dlHhNBtUb6KpN0/DKand0k+UUY9VvmBU0xcA1RC91RXs
         ph0H7aQAS1RY3yChKtQEz6WWp1wr1uxW6hQpd8NG2OQ0Is/1l1GaAv5ylEnS/jAYAyeD
         uSc+MzU8clMHjqWUFf2a9xxBjNMaLBX/CWwoC+DAFdklgqI6wO2k6BzDnpjK4qhA8lIj
         Nu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711653790; x=1712258590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyFGSwdDS+8X5fWOjo2s+K1AMkRQoOt7S254R+rI76g=;
        b=pok1J3JSa2dZmzGEgub3D6iomrGeWLvNTdDGSKM0S2frvlajWVajIXLYaLaDJeDbXW
         va7ML45nd4tFA9bpTZ7utBJgbu0SzoWhnHxg69WuBFWmYERcJSM9rNjj7JMnCjnSOIp7
         ZoX2MqBFqljL7j7ly3NA59KGuABwI33yu9ZMgEJu47Upd4x+XPL/Oa8nAzkS5/XTqrOh
         rxISt+YJfEM+cyiozPIWqtTOFWhieSVg6OBsf0eqklYUSAzvVXZEN8t9GhMcFnnmj7nx
         1fHzhZBpXdQ4xmP7ALL947F3YGuW3uFNIBR3P8j4rkPUhR3PqSqoWq1HROLNVRKoz2df
         9I0g==
X-Forwarded-Encrypted: i=1; AJvYcCV5DELUb069gegrNtjs1fDSiN2aXieFxpForIUXdnqOzyvTmSWm99jPI4gi4qB1MTZbprhLJCcjHAI2y4LZtEufQGr1a79a+cqf5/9Ul3KMBBBui6qVFHDFziXt3wCtIazABkUZyDxmYlJHpWZCxbjedyqRgNrUwg==
X-Gm-Message-State: AOJu0YwT3LO7rwGaraj7q1uG3/5JsJRgKM7HoUPQY6PJZc/Ej8S9OMG7
	f6g9XzxreEK9OoXEGykvlPyREt+VO+HkLeCBTxLAQzdIxWHHOo4=
X-Google-Smtp-Source: AGHT+IEOtLqqAjjYrlHQS8qBEVcSrjCNrCoEQoC8julgRSnyZQ6WZe0wbYQEX2ZQYcLWJzzUoCRR0w==
X-Received: by 2002:a9d:7754:0:b0:6e6:6ea1:9820 with SMTP id t20-20020a9d7754000000b006e66ea19820mr191312otl.14.1711653790323;
        Thu, 28 Mar 2024 12:23:10 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id n9-20020a9d64c9000000b006e6c9a56591sm344956otl.19.2024.03.28.12.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 12:23:09 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:b987:69e:202a:697a])
	by serve.minyard.net (Postfix) with ESMTPSA id A60B1180011;
	Thu, 28 Mar 2024 19:23:08 +0000 (UTC)
Date: Thu, 28 Mar 2024 14:23:07 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen <allen.lkml@gmail.com>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	tj@kernel.org, keescook@chromium.org, vkoul@kernel.org,
	marcan@marcan.st, sven@svenpeter.dev, florian.fainelli@broadcom.com,
	rjui@broadcom.com, sbranden@broadcom.com, paul@crapouillou.net,
	Eugeniy.Paltsev@synopsys.com, manivannan.sadhasivam@linaro.org,
	vireshk@kernel.org, Frank.Li@nxp.com, leoyang.li@nxp.com,
	zw@zh-kernel.org, wangzhou1@hisilicon.com, haijie1@huawei.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	afaerber@suse.de, logang@deltatee.com, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
	andersson@kernel.org, konrad.dybcio@linaro.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	patrice.chotard@foss.st.com, linus.walleij@linaro.org,
	wens@csie.org, jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, jassisinghbrar@gmail.com, mchehab@kernel.org,
	maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
	ulf.hansson@linaro.org, manuel.lauss@gmail.com,
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu,
	duncan.sands@free.fr, stern@rowland.harvard.edu, oneukum@suse.com,
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
Message-ID: <ZgXDmx1HvujsMYAR@mail.minyard.net>
Reply-To: minyard@acm.org
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com>
 <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>

On Thu, Mar 28, 2024 at 10:52:16AM -0700, Allen wrote:
> On Wed, Mar 27, 2024 at 11:05 AM Corey Minyard <minyard@acm.org> wrote:
> >
> > I believe that work queues items are execute single-threaded for a work
> > queue, so this should be good.  I need to test this, though.  It may be
> > that an IPMI device can have its own work queue; it may not be important
> > to run it in bh context.
> 
>   Fair point. Could you please let me know once you have had a chance to test
> these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> workqueue.
> 
>  Thanks for taking time out to review.

After looking and thinking about it a bit, a BH context is still
probably the best for this.

I have tested this patch under load and various scenarios and it seems
to work ok.  So:

Tested-by: Corey Minyard <cminyard@mvista.com>
Acked-by: Corey Minyard <cminyard@mvista.com>

Or I can take this into my tree.

-corey

> 
> - Allen
> 
> >
> > -corey
> >
> > >
> > > Based on the work done by Tejun Heo <tj@kernel.org>
> > > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-610
> > >
> > > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > > ---
> > >  drivers/char/ipmi/ipmi_msghandler.c | 30 ++++++++++++++---------------
> > >  1 file changed, 15 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> > > index b0eedc4595b3..fce2a2dbdc82 100644
> > > --- a/drivers/char/ipmi/ipmi_msghandler.c
> > > +++ b/drivers/char/ipmi/ipmi_msghandler.c
> > > @@ -36,12 +36,13 @@
> > >  #include <linux/nospec.h>
> > >  #include <linux/vmalloc.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/workqueue.h>
> > >
> > >  #define IPMI_DRIVER_VERSION "39.2"
> > >
> > >  static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
> > >  static int ipmi_init_msghandler(void);
> > > -static void smi_recv_tasklet(struct tasklet_struct *t);
> > > +static void smi_recv_work(struct work_struct *t);
> > >  static void handle_new_recv_msgs(struct ipmi_smi *intf);
> > >  static void need_waiter(struct ipmi_smi *intf);
> > >  static int handle_one_recv_msg(struct ipmi_smi *intf,
> > > @@ -498,13 +499,13 @@ struct ipmi_smi {
> > >       /*
> > >        * Messages queued for delivery.  If delivery fails (out of memory
> > >        * for instance), They will stay in here to be processed later in a
> > > -      * periodic timer interrupt.  The tasklet is for handling received
> > > +      * periodic timer interrupt.  The work is for handling received
> > >        * messages directly from the handler.
> > >        */
> > >       spinlock_t       waiting_rcv_msgs_lock;
> > >       struct list_head waiting_rcv_msgs;
> > >       atomic_t         watchdog_pretimeouts_to_deliver;
> > > -     struct tasklet_struct recv_tasklet;
> > > +     struct work_struct recv_work;
> > >
> > >       spinlock_t             xmit_msgs_lock;
> > >       struct list_head       xmit_msgs;
> > > @@ -704,7 +705,7 @@ static void clean_up_interface_data(struct ipmi_smi *intf)
> > >       struct cmd_rcvr  *rcvr, *rcvr2;
> > >       struct list_head list;
> > >
> > > -     tasklet_kill(&intf->recv_tasklet);
> > > +     cancel_work_sync(&intf->recv_work);
> > >
> > >       free_smi_msg_list(&intf->waiting_rcv_msgs);
> > >       free_recv_msg_list(&intf->waiting_events);
> > > @@ -1319,7 +1320,7 @@ static void free_user(struct kref *ref)
> > >  {
> > >       struct ipmi_user *user = container_of(ref, struct ipmi_user, refcount);
> > >
> > > -     /* SRCU cleanup must happen in task context. */
> > > +     /* SRCU cleanup must happen in work context. */
> > >       queue_work(remove_work_wq, &user->remove_work);
> > >  }
> > >
> > > @@ -3605,8 +3606,7 @@ int ipmi_add_smi(struct module         *owner,
> > >       intf->curr_seq = 0;
> > >       spin_lock_init(&intf->waiting_rcv_msgs_lock);
> > >       INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
> > > -     tasklet_setup(&intf->recv_tasklet,
> > > -                  smi_recv_tasklet);
> > > +     INIT_WORK(&intf->recv_work, smi_recv_work);
> > >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
> > >       spin_lock_init(&intf->xmit_msgs_lock);
> > >       INIT_LIST_HEAD(&intf->xmit_msgs);
> > > @@ -4779,7 +4779,7 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
> > >                        * To preserve message order, quit if we
> > >                        * can't handle a message.  Add the message
> > >                        * back at the head, this is safe because this
> > > -                      * tasklet is the only thing that pulls the
> > > +                      * work is the only thing that pulls the
> > >                        * messages.
> > >                        */
> > >                       list_add(&smi_msg->link, &intf->waiting_rcv_msgs);
> > > @@ -4812,10 +4812,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
> > >       }
> > >  }
> > >
> > > -static void smi_recv_tasklet(struct tasklet_struct *t)
> > > +static void smi_recv_work(struct work_struct *t)
> > >  {
> > >       unsigned long flags = 0; /* keep us warning-free. */
> > > -     struct ipmi_smi *intf = from_tasklet(intf, t, recv_tasklet);
> > > +     struct ipmi_smi *intf = from_work(intf, t, recv_work);
> > >       int run_to_completion = intf->run_to_completion;
> > >       struct ipmi_smi_msg *newmsg = NULL;
> > >
> > > @@ -4866,7 +4866,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> > >
> > >       /*
> > >        * To preserve message order, we keep a queue and deliver from
> > > -      * a tasklet.
> > > +      * a work.
> > >        */
> > >       if (!run_to_completion)
> > >               spin_lock_irqsave(&intf->waiting_rcv_msgs_lock, flags);
> > > @@ -4887,9 +4887,9 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> > >               spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
> > >
> > >       if (run_to_completion)
> > > -             smi_recv_tasklet(&intf->recv_tasklet);
> > > +             smi_recv_work(&intf->recv_work);
> > >       else
> > > -             tasklet_schedule(&intf->recv_tasklet);
> > > +             queue_work(system_bh_wq, &intf->recv_work);
> > >  }
> > >  EXPORT_SYMBOL(ipmi_smi_msg_received);
> > >
> > > @@ -4899,7 +4899,7 @@ void ipmi_smi_watchdog_pretimeout(struct ipmi_smi *intf)
> > >               return;
> > >
> > >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 1);
> > > -     tasklet_schedule(&intf->recv_tasklet);
> > > +     queue_work(system_bh_wq, &intf->recv_work);
> > >  }
> > >  EXPORT_SYMBOL(ipmi_smi_watchdog_pretimeout);
> > >
> > > @@ -5068,7 +5068,7 @@ static bool ipmi_timeout_handler(struct ipmi_smi *intf,
> > >                                      flags);
> > >       }
> > >
> > > -     tasklet_schedule(&intf->recv_tasklet);
> > > +     queue_work(system_bh_wq, &intf->recv_work);
> > >
> > >       return need_timer;
> > >  }
> > > --
> > > 2.17.1
> > >
> > >
> >
> 
> 
> -- 
>        - Allen
> 
