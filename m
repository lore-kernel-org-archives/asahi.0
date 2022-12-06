Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD38F1362
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670323150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yf0pg6HyCZe9RGQZhR7ZfKdQUaSK6G751H86Hj4Y1Nw=;
	b=CcsAyNfTWr9O9dA/g63u7d1GdT/T7TfUgUkj1ltlFOn9Xq6ZtEavtyXymZdG1IBWGRdzO9
	iFDKCFWqmo8YuZT1O19UsMaJTFwdNh4g5rRQW0Khq/rZMhmtI5AJPSlBQBVn4Q8ULWfZ1f
	K8lP/XW7v9ZjTkoZgoL6CMRjtd4nkUI=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-350-BzH5nzrpPimEZKLFFFbjlQ-1; Tue, 06 Dec 2022 05:39:09 -0500
X-MC-Unique: BzH5nzrpPimEZKLFFFbjlQ-1
Received: by mail-vs1-f72.google.com with SMTP id 4-20020a671704000000b003af7639515aso5379465vsx.8
        for <asahi@lists.linux.dev>; Tue, 06 Dec 2022 02:39:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yf0pg6HyCZe9RGQZhR7ZfKdQUaSK6G751H86Hj4Y1Nw=;
        b=kz6Jk31SbVeG4Ie+/W1ylY/WKmOKQ6blBhACuMLJYwHMFZNofdHgu7mAC6+FjHmk4o
         lxTrx1R4wyuWyeUzbdMVg7PHkQnUFbhd8LAz6YUdoHlfAYru3dWiZugxM50D2BZamQ9h
         h6ViCDmTnfOpQJD1SpaV51PaSLhObyKTHppPf1TRBo1KQKxVtBBtLiK94pctL98o6aDt
         9cZ1y5C8qB89oxyUg+Myb4juJ7hpzUX+W+ajSEsHP4uvRUxAeASSQaIlDE3WyuLucsBY
         splG69dQ5flTJOE1GJ9XSC/2O17z8ORBY37Zf8/azNk6U1NUbX2RyuBsn1CCIbgc2zZT
         EqBw==
X-Gm-Message-State: ANoB5pmO6hqmMffOEqkhsYC9x+TvxXCN9G8n57BMx6eHtWdk+pTiJafx
	WSX2YP0b1mJmMOVByIbDBvn3EFDAm1Tsy0PlGumxgMY3gRer+8QvU10GeDlcNXDD3ciwDcykq/X
	Lg8yZ+8WIjbVzddrC6pRqgmM54uAHb5Q=
X-Received: by 2002:a67:ce12:0:b0:3ad:9714:5d75 with SMTP id s18-20020a67ce12000000b003ad97145d75mr39536682vsl.77.1670323148955;
        Tue, 06 Dec 2022 02:39:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4cUeNKmGdXVLA6X9buYSxafC1NlN9zBrzcpjrS4ND+WQZsoBpcnv1A1LpypKpiHWopac0rR5uFVRZHCcRQfKY=
X-Received: by 2002:a67:ce12:0:b0:3ad:9714:5d75 with SMTP id
 s18-20020a67ce12000000b003ad97145d75mr39536673vsl.77.1670323148771; Tue, 06
 Dec 2022 02:39:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221129132208.4337-1-hch@lst.de> <20221129132208.4337-5-hch@lst.de>
In-Reply-To: <20221129132208.4337-5-hch@lst.de>
From: Eric Curtin <ecurtin@redhat.com>
Date: Tue, 6 Dec 2022 10:38:52 +0000
Message-ID: <CAOgh=FyTsAgXMOuPhh-YG1Cj3QH6_6vwB9cWrxk6XTchE5P_mg@mail.gmail.com>
Subject: Re: [PATCH 4/9] nvme-pci: remove nvme_disable_admin_queue
To: Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, 
	James Smart <james.smart@broadcom.com>, Chaitanya Kulkarni <kch@nvidia.com>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev, 
	linux-nvme@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Nov 2022 at 13:29, Christoph Hellwig <hch@lst.de> wrote:
>
> nvme_disable_admin_queue has only a single caller, and just calls two
> other funtions, so remove it to clean up the remove path a little more.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

> ---
>  drivers/nvme/host/pci.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 84226dce9b3b92..c6a02210d22b46 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -1496,14 +1496,6 @@ static void nvme_suspend_io_queues(struct nvme_dev *dev)
>                 nvme_suspend_queue(&dev->queues[i]);
>  }
>
> -static void nvme_disable_admin_queue(struct nvme_dev *dev, bool shutdown)
> -{
> -       struct nvme_queue *nvmeq = &dev->queues[0];
> -
> -       nvme_disable_ctrl(&dev->ctrl, shutdown);
> -       nvme_poll_irqdisable(nvmeq);
> -}
> -
>  /*
>   * Called only on a device that has been disabled and after all other threads
>   * that can check this device's completion queues have synced, except
> @@ -2711,7 +2703,8 @@ static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown)
>
>         if (!dead && dev->ctrl.queue_count > 0) {
>                 nvme_disable_io_queues(dev);
> -               nvme_disable_admin_queue(dev, shutdown);
> +               nvme_disable_ctrl(&dev->ctrl, shutdown);
> +               nvme_poll_irqdisable(&dev->queues[0]);
>         }
>         nvme_suspend_io_queues(dev);
>         nvme_suspend_queue(&dev->queues[0]);
> --
> 2.30.2
>
>

