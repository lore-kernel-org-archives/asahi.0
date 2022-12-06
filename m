Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9DC1362
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670323168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EjxcT7s0G6NzdYkLLEMRpVnPO3NSARFPUey6LwGz4bY=;
	b=fZT07vvXny3es16yTqX+nw/W9Pbvlbg7xLV/tIUtknBxgh0cxfP2Km2hFDD8R2jnS/8yO0
	RT/ATqSvdQ54vLfJxt3eFF3Ha6XynWlkTDf07NKAfpX1jjS/+T7PSCKC1WLrjKS/tMZyHy
	znjZ1sq1qVrYdvsiXfs21iGuezKeDTI=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-155--_KZQyEBObqi-HCass7RfQ-1; Tue, 06 Dec 2022 05:39:27 -0500
X-MC-Unique: -_KZQyEBObqi-HCass7RfQ-1
Received: by mail-ua1-f69.google.com with SMTP id y10-20020ab0560a000000b003af33bfa8c4so7468894uaa.21
        for <asahi@lists.linux.dev>; Tue, 06 Dec 2022 02:39:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjxcT7s0G6NzdYkLLEMRpVnPO3NSARFPUey6LwGz4bY=;
        b=HAwSosTIZFjDXMMDBr6/re1f1wRtLjUhM1OYTStaadjSSX37k2WB0xoeav30173/15
         EQz8KLYAMYydkEMlnsjjnLKnHSiyVh0cCMi1kBbgOnvl/F4N/0RiG0Ur6t9Ggfov9Peo
         Yf3tDpE6vboFy2iklQfUlIbTefS/8ENhV7opvKdowEZF4e0rLnQ6OdFtD0I2CIDqW2hI
         0rVnV0zMwibZChKYlYpnOvIkfEAh6hwDrVYJ9T2SJSmSytEI7GeY1+xB2gmCu9CUPGrI
         W8/y84U5JPv+nXfez3Zzh4PVN4KqVgZle83xtj44ExNK+YKraiG8AKXh9T8crMiV8uQK
         gGtQ==
X-Gm-Message-State: ANoB5pk++yAQLhGz3CLm10ymRi4SZEIYgEFybgPrHqmWvkEJASYWu4Mo
	G6j+NDvFH7yqvgNDL+yfIZyq2T15y3oq+67w0QsOq0ml2QQmPlEVwCXUtU/YFjzs09/cJeRDyDU
	yEr75J4XAnmly5KgymOsESy5T3GKOl6c=
X-Received: by 2002:a1f:1b0d:0:b0:3b3:b114:8ff1 with SMTP id b13-20020a1f1b0d000000b003b3b1148ff1mr39568032vkb.17.1670323166703;
        Tue, 06 Dec 2022 02:39:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6yc6cX/hNx5MTrfR2LYsczoNPUfT6CJCiQYSwq0/Hyjhtm5KhZdvPxTDOplcZ1aknwFY5owbiCI3znrOgZZWA=
X-Received: by 2002:a1f:1b0d:0:b0:3b3:b114:8ff1 with SMTP id
 b13-20020a1f1b0d000000b003b3b1148ff1mr39568015vkb.17.1670323166513; Tue, 06
 Dec 2022 02:39:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221129132208.4337-1-hch@lst.de> <20221129132208.4337-6-hch@lst.de>
In-Reply-To: <20221129132208.4337-6-hch@lst.de>
From: Eric Curtin <ecurtin@redhat.com>
Date: Tue, 6 Dec 2022 10:39:10 +0000
Message-ID: <CAOgh=FxeOUAeyY1xZGoWO1OGRRK4Usdx_E_h_C3T22iw4Vut5Q@mail.gmail.com>
Subject: Re: [PATCH 5/9] nvme-pci: remove nvme_pci_disable
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
> nvme_pci_disable has a single caller, fold it into that.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

> ---
>  drivers/nvme/host/pci.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index c6a02210d22b46..c3d9b23699d3f3 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -2657,18 +2657,6 @@ static void nvme_dev_unmap(struct nvme_dev *dev)
>         pci_release_mem_regions(to_pci_dev(dev->dev));
>  }
>
> -static void nvme_pci_disable(struct nvme_dev *dev)
> -{
> -       struct pci_dev *pdev = to_pci_dev(dev->dev);
> -
> -       pci_free_irq_vectors(pdev);
> -
> -       if (pci_is_enabled(pdev)) {
> -               pci_disable_pcie_error_reporting(pdev);
> -               pci_disable_device(pdev);
> -       }
> -}
> -
>  static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown)
>  {
>         bool dead = true, freeze = false;
> @@ -2708,7 +2696,11 @@ static void nvme_dev_disable(struct nvme_dev *dev, bool shutdown)
>         }
>         nvme_suspend_io_queues(dev);
>         nvme_suspend_queue(&dev->queues[0]);
> -       nvme_pci_disable(dev);
> +       pci_free_irq_vectors(pdev);
> +       if (pci_is_enabled(pdev)) {
> +               pci_disable_pcie_error_reporting(pdev);
> +               pci_disable_device(pdev);
> +       }
>         nvme_reap_pending_cqes(dev);
>
>         nvme_cancel_tagset(&dev->ctrl);
> --
> 2.30.2
>
>

