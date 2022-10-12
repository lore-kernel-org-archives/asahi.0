Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2364B8F7B
	for <asahi@lists.linux.dev>; Wed, 12 Oct 2022 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665576666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hregpx8t1kAHRsj5KIbt4EVewflLpm3kB0Chk3MbBVo=;
	b=JI5uOKBACpH6RG+ah8iDP24zeut3SN7JR7HS4wUuSiN1AYNC/1Z0fsJ8j31m/k0Vy/esxb
	XsVTqObd61z5b8pHMbUSdCRAiq/zGJbyAcBhCeijGqh9lNf5RdiDV64PuvLavHM0nPAQN8
	XPRb3EA9tVF634nLB43JO3c4OanqS6M=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-222-ViHo598UN8SLEo5-9UKfIw-1; Wed, 12 Oct 2022 08:11:05 -0400
X-MC-Unique: ViHo598UN8SLEo5-9UKfIw-1
Received: by mail-ua1-f70.google.com with SMTP id q9-20020ab04a09000000b003dfecbdc5cdso4668359uae.15
        for <asahi@lists.linux.dev>; Wed, 12 Oct 2022 05:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hregpx8t1kAHRsj5KIbt4EVewflLpm3kB0Chk3MbBVo=;
        b=T819Cvuiqg8M9UyfLQ4KV2iFTgc6N9n7u5UJ1X8wMREeuY1Y12kmHnpBV55oTqMCum
         VjqS1vUgWiqfIEk6JKkr7rMnOz/8zccbxrOyCRa5c0S1qeYcBRo2enhH8BgzAa/TVfYQ
         mKxCqaJ+q3OxNlo0rM3yKpCRyUVA1ZUE84SEMk5UKEYOgmYMlBzhjt6ZPg42kA897SDN
         W4fgFU5ywGWJB0/KlEDwq2hXwX/3U21kZK2tCMIjvKRCh+D7n2y3YnE0qW618xYJFFwq
         yWNYSpZpeOI89lbaSPSQk0cUOC/H5qOcgafjSIme+da7rRAX6bVAIv4iTK7ppegEG/o9
         hEbg==
X-Gm-Message-State: ACrzQf1U/i53CevMrFbnFwMPnWQDw4bAL0UqTiOp05GMEj2JzC8aSEiF
	Ru05GBG2T9sRHgR6pJkgXXiYu2PRviDjykhTKSiTZ8Xry0q47JEU1p7JSAX84Te3zRPRzhEHLOb
	3q+VWk2TZgouExBQwP6hamyQv90lXQlc=
X-Received: by 2002:ab0:7c8f:0:b0:381:c81f:6152 with SMTP id v15-20020ab07c8f000000b00381c81f6152mr14996259uaw.58.1665576663429;
        Wed, 12 Oct 2022 05:11:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6BcAPMB0fOUebVBZrx75XmrZkHjxCDZuCbZ2MEbg+W3PfuUXuBgiCfdkdxsD5PMXfIc/kiYj+v9aXSxNwUOUI=
X-Received: by 2002:ab0:7c8f:0:b0:381:c81f:6152 with SMTP id
 v15-20020ab07c8f000000b00381c81f6152mr14996248uaw.58.1665576663179; Wed, 12
 Oct 2022 05:11:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <E1oiaBa-00Dz7S-SK@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1oiaBa-00Dz7S-SK@rmk-PC.armlinux.org.uk>
From: Eric Curtin <ecurtin@redhat.com>
Date: Wed, 12 Oct 2022 13:10:47 +0100
Message-ID: <CAOgh=FzyV4mVsEujkYKZyZ0m12cnDEuK9GadUqutSFk2Cfj5jQ@mail.gmail.com>
Subject: Re: [PATCH] nvme-apple: fix DMA-API warning
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Oct 2022 at 12:53, Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Fix the following DMA-API warning:
>
> DMA-API: nvme-apple 27bcc0000.nvme: mapping sg segment longer than device claims to support [len=69632] [max=65536]
> WARNING: CPU: 3 PID: 1 at kernel/dma/debug.c:1160 debug_dma_map_sg+0x310/0x3a0
> Modules linked in: tps6598x roles typec rtc_macsmc gpio_macsmc nvme_apple apple_mailbox apple_sart pcie_apple macsmc_rtkit macsmc pinctrl_apple_gpio i2c_apple
> CPU: 3 PID: 1 Comm: init Not tainted 6.0.0+ #1081
> Hardware name: Apple Mac mini (M1, 2020) (DT)
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : debug_dma_map_sg+0x310/0x3a0
> lr : debug_dma_map_sg+0x310/0x3a0
> ...
> Call trace:
>  debug_dma_map_sg+0x310/0x3a0
>  __dma_map_sg_attrs+0x98/0xf4
>  dma_map_sg_attrs+0xc/0x1c
>  apple_nvme_queue_rq+0x218/0x67c [nvme_apple]
>  blk_mq_dispatch_rq_list+0x198/0x81c
>  blk_mq_do_dispatch_sched+0x2b0/0x340
>  __blk_mq_sched_dispatch_requests+0x104/0x154
>  blk_mq_sched_dispatch_requests+0x38/0x70
>  __blk_mq_run_hw_queue+0x80/0x130
>  __blk_mq_delay_run_hw_queue+0x84/0x90
>  blk_mq_run_hw_queue+0x134/0x170
>  blk_mq_sched_insert_requests+0xec/0x300
>  blk_mq_flush_plug_list+0x104/0x430
>  __blk_flush_plug+0xe8/0x130
>  blk_finish_plug+0x30/0x1f0
>  read_pages+0x1ec/0x334
>  page_cache_ra_unbounded+0x158/0x1bc
>  page_cache_ra_order+0x80/0x2c0
>  filemap_fault+0x4bc/0x970
>  __do_fault+0x38/0x144
>  __handle_mm_fault+0x7c4/0xc60
>  handle_mm_fault+0x120/0x2a0
>  do_page_fault+0x130/0x47c
>  do_translation_fault+0xa0/0xb0
>  do_mem_abort+0x40/0x90
>  el0_da+0x2c/0x80
>  el0t_64_sync_handler+0x60/0xb4
>  el0t_64_sync+0x168/0x16c
> ---[ end trace 0000000000000000 ]---
>
> Suggested-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Seems reasonable, the same as nvme_reset_work, wouldn't be the worst
thing in the world if we duplicated the "Don't limit the IOMMU merged
segment size" comment from the generic driver for the apple version
also if there ends up being a v2.

Reviewed-by: Eric Curtin <ecurtin@redhat.com>


> ---
>  drivers/nvme/host/apple.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index 5fc5ea196b40..ff8b083dc5c6 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -1039,6 +1039,8 @@ static void apple_nvme_reset_work(struct work_struct *work)
>                                          dma_max_mapping_size(anv->dev) >> 9);
>         anv->ctrl.max_segments = NVME_MAX_SEGS;
>
> +       dma_set_max_seg_size(anv->dev, 0xffffffff);
> +
>         /*
>          * Enable NVMMU and linear submission queues.
>          * While we could keep those disabled and pretend this is slightly
> --
> 2.30.2
>
>

