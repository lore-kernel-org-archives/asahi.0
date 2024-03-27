Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5709B14E2DC;
	Wed, 27 Mar 2024 17:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562309; cv=none; b=ZOtJRDppQ8rpL3/Dgy3hzF+gfVjwNXb9TJjpM1/Izt4hwJ/iu6Rg7w4E7X3IW82io5/phZlWLaOPiGzvZMETp6uuW+n3Zg2WHB9tB8SetwJXs+/sqq5eksjuUlMjaZFk01K2eZ6DdB6VbXCKLMtZ0IWf1/5r7t+I7PJ+//Y+J+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562309; c=relaxed/simple;
	bh=/LAfZ8Nb5/IISyxpsj9ues9JEim1UydvELJxBBntuTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gyGMfLASXFa+bBBHqJudNMYrwVHkV9reJT4pkRODxKyQnjkj/Eh6LuaRy+5xr1dNFNTbDohz5jNBuymEbyIr4lKym/IFsrVH9IwwuID2xLgKoN4UnKkJtyCaywc7DukvpyeMPScD+alJN0bDt6tGJLZqNC1U83kvM0dBBz33Lfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hi0/fQOx; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hi0/fQOx"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c3d58cbdbbso79394b6e.2;
        Wed, 27 Mar 2024 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711562306; x=1712167106; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWR/88ZuStiYrDMS5UWD0VLDt0J6Sqyii5LmdWwCGKc=;
        b=hi0/fQOxUwpGksQV7ozowOX4x7rvgDIFN5WJhDwFQ+yFyCBLZbpAa53HNTorSdeb0X
         2gt0qE8kQgkJ9DtS/VKSMepI3yNrXxnOe6h//8o4kXC5qhB1DyUmh0B7y+rnn4hY/ypQ
         yFxCQ3VjT85b7MVJy2X1jiwtm/SMwBeOTl3a72x59BF6hsO221hKeQlWbIvavjq+Q7B5
         39sTV/USzpEe5G3pB6FJdq+zs6dM6BRhojqir/Hc5lnwtK3vzziXX/zfNx0BGqUcVOVo
         ZpGxnBZniqipaQCmcdc6oDNv+jyDBV05cVDvdU2km6RmflasYyo4QeujgKCYnezvQf1x
         RZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562306; x=1712167106;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yWR/88ZuStiYrDMS5UWD0VLDt0J6Sqyii5LmdWwCGKc=;
        b=P3pXTahTYkQHiiQ2CQ9VMtp6pfC+4dbAUmKybPdn4IDN57v9c12CQifK3VY8BtqfQR
         VnMN8yv104S72W3KYkQbKE98bgZFuMuMHExKEI+zL4l48ILs6FpjCcut00RcAplAb0ro
         kF0CRboQkGeUtR03GnOP6kuFGxRPbu4znzqkCEkOpvOgoPRZf8o511ZQnJWInw+HM1ps
         3bKtb9hyly2Dho4SdMrgnwiX7trw0lDfvV97o6H8sTT5SM9XfYXIpTOPnq1UaUxs07uK
         4A/AvBSRMIMjjeGgb5PTXydlerwkJQjKRIcGJvkO2uBfdGtZ6RAH/DnNkP/L++1eJDtQ
         9uNA==
X-Forwarded-Encrypted: i=1; AJvYcCWGl15v+zb4fZBvOjun4Yj8ZtmJrawMQEFzUugpf5HB1mSVboGb33nVUpmjqbAJ3RS76+zxiyc+4HMmM5d+fuKlA+txIyaKuTI1tSf4ShfYZFB16wo51JNQ2ZK5HaW6g3uPakStDmJAsVuefOoFMpiz10iXqMvo+g==
X-Gm-Message-State: AOJu0YxC+Amu32OG5b2/ZAXAuHcrgVSMJbiVSgqhnwCK5ljUxnXgwMiz
	+Jg91Rsit1xsB741pTnK/CePHJC08vX5IvGKie4pTM7pG0wSrkg=
X-Google-Smtp-Source: AGHT+IGIuqcpUfq3tRIl3Tp+ivSdarRw1h1Pz+NBzSyS6B+Wv1klEWD1UlLYSK6t5b6FwD/aGF7AqA==
X-Received: by 2002:a05:6808:16a8:b0:3c3:7e7a:8236 with SMTP id bb40-20020a05680816a800b003c37e7a8236mr846136oib.18.1711562306195;
        Wed, 27 Mar 2024 10:58:26 -0700 (PDT)
Received: from serve.minyard.net ([47.184.181.2])
        by smtp.gmail.com with ESMTPSA id bl16-20020a056808309000b003c3ca856452sm1579224oib.55.2024.03.27.10.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 10:58:25 -0700 (PDT)
Sender: Corey Minyard <tcminyard@gmail.com>
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:ac74:4d5d:21e4:a88a])
	by serve.minyard.net (Postfix) with ESMTPSA id 6CA7D1800B9;
	Wed, 27 Mar 2024 17:58:24 +0000 (UTC)
Date: Wed, 27 Mar 2024 12:58:23 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen Pais <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, tj@kernel.org, keescook@chromium.org,
	vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev,
	florian.fainelli@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, paul@crapouillou.net,
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
Message-ID: <ZgRePyo2zC4A1Fp4@mail.minyard.net>
Reply-To: minyard@acm.org
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327160314.9982-7-apais@linux.microsoft.com>

On Wed, Mar 27, 2024 at 04:03:11PM +0000, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.

I think you mean drivers/char/ipmi/* here.

I believe that work queues items are execute single-threaded for a work
queue, so this should be good.  I need to test this, though.  It may be
that an IPMI device can have its own work queue; it may not be important
to run it in bh context.

-corey

> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 30 ++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index b0eedc4595b3..fce2a2dbdc82 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -36,12 +36,13 @@
>  #include <linux/nospec.h>
>  #include <linux/vmalloc.h>
>  #include <linux/delay.h>
> +#include <linux/workqueue.h>
>  
>  #define IPMI_DRIVER_VERSION "39.2"
>  
>  static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
>  static int ipmi_init_msghandler(void);
> -static void smi_recv_tasklet(struct tasklet_struct *t);
> +static void smi_recv_work(struct work_struct *t);
>  static void handle_new_recv_msgs(struct ipmi_smi *intf);
>  static void need_waiter(struct ipmi_smi *intf);
>  static int handle_one_recv_msg(struct ipmi_smi *intf,
> @@ -498,13 +499,13 @@ struct ipmi_smi {
>  	/*
>  	 * Messages queued for delivery.  If delivery fails (out of memory
>  	 * for instance), They will stay in here to be processed later in a
> -	 * periodic timer interrupt.  The tasklet is for handling received
> +	 * periodic timer interrupt.  The work is for handling received
>  	 * messages directly from the handler.
>  	 */
>  	spinlock_t       waiting_rcv_msgs_lock;
>  	struct list_head waiting_rcv_msgs;
>  	atomic_t	 watchdog_pretimeouts_to_deliver;
> -	struct tasklet_struct recv_tasklet;
> +	struct work_struct recv_work;
>  
>  	spinlock_t             xmit_msgs_lock;
>  	struct list_head       xmit_msgs;
> @@ -704,7 +705,7 @@ static void clean_up_interface_data(struct ipmi_smi *intf)
>  	struct cmd_rcvr  *rcvr, *rcvr2;
>  	struct list_head list;
>  
> -	tasklet_kill(&intf->recv_tasklet);
> +	cancel_work_sync(&intf->recv_work);
>  
>  	free_smi_msg_list(&intf->waiting_rcv_msgs);
>  	free_recv_msg_list(&intf->waiting_events);
> @@ -1319,7 +1320,7 @@ static void free_user(struct kref *ref)
>  {
>  	struct ipmi_user *user = container_of(ref, struct ipmi_user, refcount);
>  
> -	/* SRCU cleanup must happen in task context. */
> +	/* SRCU cleanup must happen in work context. */
>  	queue_work(remove_work_wq, &user->remove_work);
>  }
>  
> @@ -3605,8 +3606,7 @@ int ipmi_add_smi(struct module         *owner,
>  	intf->curr_seq = 0;
>  	spin_lock_init(&intf->waiting_rcv_msgs_lock);
>  	INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
> -	tasklet_setup(&intf->recv_tasklet,
> -		     smi_recv_tasklet);
> +	INIT_WORK(&intf->recv_work, smi_recv_work);
>  	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
>  	spin_lock_init(&intf->xmit_msgs_lock);
>  	INIT_LIST_HEAD(&intf->xmit_msgs);
> @@ -4779,7 +4779,7 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
>  			 * To preserve message order, quit if we
>  			 * can't handle a message.  Add the message
>  			 * back at the head, this is safe because this
> -			 * tasklet is the only thing that pulls the
> +			 * work is the only thing that pulls the
>  			 * messages.
>  			 */
>  			list_add(&smi_msg->link, &intf->waiting_rcv_msgs);
> @@ -4812,10 +4812,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
>  	}
>  }
>  
> -static void smi_recv_tasklet(struct tasklet_struct *t)
> +static void smi_recv_work(struct work_struct *t)
>  {
>  	unsigned long flags = 0; /* keep us warning-free. */
> -	struct ipmi_smi *intf = from_tasklet(intf, t, recv_tasklet);
> +	struct ipmi_smi *intf = from_work(intf, t, recv_work);
>  	int run_to_completion = intf->run_to_completion;
>  	struct ipmi_smi_msg *newmsg = NULL;
>  
> @@ -4866,7 +4866,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
>  
>  	/*
>  	 * To preserve message order, we keep a queue and deliver from
> -	 * a tasklet.
> +	 * a work.
>  	 */
>  	if (!run_to_completion)
>  		spin_lock_irqsave(&intf->waiting_rcv_msgs_lock, flags);
> @@ -4887,9 +4887,9 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
>  		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
>  
>  	if (run_to_completion)
> -		smi_recv_tasklet(&intf->recv_tasklet);
> +		smi_recv_work(&intf->recv_work);
>  	else
> -		tasklet_schedule(&intf->recv_tasklet);
> +		queue_work(system_bh_wq, &intf->recv_work);
>  }
>  EXPORT_SYMBOL(ipmi_smi_msg_received);
>  
> @@ -4899,7 +4899,7 @@ void ipmi_smi_watchdog_pretimeout(struct ipmi_smi *intf)
>  		return;
>  
>  	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 1);
> -	tasklet_schedule(&intf->recv_tasklet);
> +	queue_work(system_bh_wq, &intf->recv_work);
>  }
>  EXPORT_SYMBOL(ipmi_smi_watchdog_pretimeout);
>  
> @@ -5068,7 +5068,7 @@ static bool ipmi_timeout_handler(struct ipmi_smi *intf,
>  				       flags);
>  	}
>  
> -	tasklet_schedule(&intf->recv_tasklet);
> +	queue_work(system_bh_wq, &intf->recv_work);
>  
>  	return need_timer;
>  }
> -- 
> 2.17.1
> 
> 
