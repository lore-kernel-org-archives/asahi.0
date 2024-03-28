Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61B6BA53;
	Thu, 28 Mar 2024 17:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711648461; cv=none; b=LOhpPtTylkfOV/Ba1HJbpCJpQPo0NVUPIxQQgw4P+u0L2ct5VzYe8XjAsPblAklx8XxN9pdA4EmCJg8VlvQlwLHkOfqsKBMjlb3PpPtUYRuODY1o/z5X6I6dTInA27IOnm13ZTNZOyKSjBr4l/K5om0bDI4+h8ZZ5bUoqQZZQLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711648461; c=relaxed/simple;
	bh=8O7B4ndnzZYI74uzyfTuc1Y0kP3Ph8Ksu/YsD5/bHbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDwbcnk/NVZGHopHF+9E6a5ACd6/3Xwq2U9uPUPD2edyS1a8ZF6Npz9r38DhbblNEoPp0nKnGWM4dErg/h7rHauieLOr53c3SJCoCN3oOXnn5gQbZiKFNUmaiMLE8PXUHubXAUn5BJL1OicNxMGvnRo9diz+UOkmqTZ4MoeCuJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OflFp/9p; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OflFp/9p"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4766e56ccccso458663137.0;
        Thu, 28 Mar 2024 10:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648458; x=1712253258; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nG7pFQ9K9R/mz80FNkdLLBY0bbfjalJJC6HLc51WLAE=;
        b=OflFp/9pDM0jp7tdlNaV8X2fFSW2vMEuu1gh1h0uCbrLjGzNm54Bt8VK51G+Icc5o6
         UTeW1wNmRykWKNVopumyctPWJk2aM2QBq9K/O1o6gNldd9ttaiAY0nuX9zpB51pTMb5q
         CK2MBFL7A0ls2vDWmW3FDYJ2W+cJ2UPRA1peQuT++cq4SBVeQ3tneLy3aMp7UCfgmuiF
         2gAycGD3vev5BxKLzVEIJDph25KxJMyZ6JLkLyc6JoVDY1zRcr4+PTySTfNpXbXjWH1e
         2JDiiMiB2sY6Knv1G6xgb/vMBvH5SYQuYR9C20fMDJHP68r/qyiPkU7yBjmB5iTCzfA0
         YeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648458; x=1712253258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nG7pFQ9K9R/mz80FNkdLLBY0bbfjalJJC6HLc51WLAE=;
        b=j6KgnYPH7A/eeTHCyKWfReK6qWwG/fn1p1kC+xLlYRcIDAEJOe3UbjKxgN8i2Cs32u
         qOXnF94mh1i99CVtAhYBVUvLYIkAPdoXZhftxSYyemskyOS2b4+b7cLrGUeE1PzwlAYQ
         UXnYA+4yralJPcIMu1lIpL8PWgd7oPOASN9ccit9gSJKBPSgHlYewAWUanzV0ausEgwi
         BbBTdT8cY3hAHCfQP69vSyzJg9taRT5DVfz7I79RwatcgC28PJPFuGNz6TGVym3u5P3j
         2iw2qfn1U6ilVjt7w8zCIVT9cJsf+JudPlQoT+6ToBo6ldqKqT9mpQfJqqG5BHwqbBPA
         uYVg==
X-Forwarded-Encrypted: i=1; AJvYcCX4nfUz2MaVImHyqgmjJko5K/F0PHXnsqPSEuSDIoX/EaqUIhd174Fz62Fj/RCEcQo+Wt2mK4P/quSQzyg5dOwITQ6fBXzKUeicEHKmmIesRN56X6pivQQgYos3RwDccg42D98/EHdnUfOLooaAGBcsOYsYIJiSHQ==
X-Gm-Message-State: AOJu0YxHhYSGMWEht2ciNrJLeXeNy/rP7PiOEiro8HLEP/gB+ZATks9v
	QIuEgV0mMs1qpbpb/jQXEsaF/vZZy2zEMNSGASXiRLdPTJH4f7mV/KhFd5hlg4cLJ/QS0dBO95f
	FWcT8ZpvZ8tSLo6Im14Abjh9N9mI=
X-Google-Smtp-Source: AGHT+IGBQCwISe8ItG/2YCXarhKnEHlwL8nEFQuoDJ++KAY35MV4NPvZiqYz3quZfRGkQvsUcmc8+OZbNMhL2JCbvQY=
X-Received: by 2002:a67:b64d:0:b0:476:fc98:c73e with SMTP id
 e13-20020a67b64d000000b00476fc98c73emr4018043vsm.34.1711648458714; Thu, 28
 Mar 2024 10:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-5-apais@linux.microsoft.com> <42c445b4-a156-4c43-bf98-bd2a9ac7a4fa@rowland.harvard.edu>
In-Reply-To: <42c445b4-a156-4c43-bf98-bd2a9ac7a4fa@rowland.harvard.edu>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:54:07 -0700
Message-ID: <CAOMdWS+4T7rw577q9iW_oin8bbVF4m6Mpx-L2riqno5QX_L=WQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] USB: Convert from tasklet to BH workqueue
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, tj@kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	oneukum@suse.com, openipmi-developer@lists.sourceforge.net, 
	dmaengine@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >
> > This patch converts drivers/infiniband/* from tasklet to BH workqueue.
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
>
> > diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> > index c0e005670d67..88d8e1c366cd 100644
> > --- a/drivers/usb/core/hcd.c
> > +++ b/drivers/usb/core/hcd.c
>
> > @@ -1662,10 +1663,9 @@ static void __usb_hcd_giveback_urb(struct urb *urb)
> >       usb_put_urb(urb);
> >  }
> >
> > -static void usb_giveback_urb_bh(struct work_struct *work)
> > +static void usb_giveback_urb_bh(struct work_struct *t)
> >  {
> > -     struct giveback_urb_bh *bh =
> > -             container_of(work, struct giveback_urb_bh, bh);
> > +     struct giveback_urb_bh *bh = from_work(bh, t, bh);
> >       struct list_head local_list;
> >
> >       spin_lock_irq(&bh->lock);
>
> Is there any reason for this apparently pointless change of a local
> variable's name?

 No, it was done just to keep things consistent across the kernel.
I can revert it back to *work if you'd prefer.

Thanks.

>
> Alan Stern
>


-- 
       - Allen
