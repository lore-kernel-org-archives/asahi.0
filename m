Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9E0AD3C
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 15:57:24 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id e13so20377919edj.7
        for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 07:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zobQoMJQOgDPYr+MKSzRl6L5Jyg4cU9WZMtWqTxs5eU=;
        b=q4sXHesc5/0QCp5Sys2Nanc1+4D1QI7+4OGz5l9v+t0Fbdti7jV60z7G5MA0jGhMmV
         IS/iALbQNO28wISjncpgHzl+dp+v29qS7II7ilHML6v/dCg0so2lgAiJJkUQT3p905hw
         OBxJsc87i9VONCalF3pYzAlJ7tmNR8nZ3h447qh83lT5ntsLLrx55QwwzCAgX9b/F5uM
         QcFmf5Wl+CRz/M5N6bG5wXm2M+gJzR9kY3cLiCsUDayN3gi6Y4JQTz66PDZgPsUbpjKq
         0HZYLOQMTip1gkSQzI/qgjp7pViZNJ2k+ExL5pTtvZoM6kHBjO3/3wMvTz5xYvNWIN2M
         XSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zobQoMJQOgDPYr+MKSzRl6L5Jyg4cU9WZMtWqTxs5eU=;
        b=3Bmrp2o1Eyl/0DHdGCxIQNhBiCEyL6hkDuLRjs7p5Is75B4r2nZwhZ6w4cyw6DyUsa
         O23aAgm2VpRNCc3h1+cWb2qA/dUNgUp5+/ELltk6Y260zpanfeOmpyiUTX/+xRT32sgr
         Ct1QcZEhvlggQhxyD5fdC5twOYAoESBPMjxRUe2A7zgNzhOMqOq5UsR7W9vlN93El8Ol
         S6LJkYZ8jqaUrFey9rw/lJagaeuOOmEKY/iwxPFCwLCC/A0Bg0Rca2+w1a9v20h5Yk2Y
         Owm1CS6opE0kEVhFNqcvW6BB7zGBlkqhHCaTPLusR8Tfce6u0+bHixssRZIxfxaItcIF
         7kcA==
X-Gm-Message-State: ANoB5pmQ11yar86vzF3BDmrMRnFRXBw5HEqAoXTFYWkLzVPbRvPXduVk
	55h+HpSgNFwRbETmo2aLLbo=
X-Google-Smtp-Source: AA0mqf6vbFEl7o2ltRHI4KJ3SsULJ1+ui+hGCwIsaq2gVG0mY2jrS6JOLFxTqQ9mWnLsQH7TbcKGZg==
X-Received: by 2002:a50:fc0b:0:b0:46b:5812:a03a with SMTP id i11-20020a50fc0b000000b0046b5812a03amr6767477edr.91.1669737442779;
        Tue, 29 Nov 2022 07:57:22 -0800 (PST)
Received: from localhost ([194.62.217.57])
        by smtp.gmail.com with ESMTPSA id kv7-20020a17090778c700b007417041fb2bsm6306253ejc.116.2022.11.29.07.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:57:22 -0800 (PST)
Date: Tue, 29 Nov 2022 16:57:18 +0100
From: Pankaj Raghav <pankydev8@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev, linux-nvme@lists.infradead.org,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH 2/9] nvme: use nvme_wait_ready in nvme_shutdown_ctrl
Message-ID: <20221129155718.poqztp4zudt47zmq@quentin>
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-3-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129132208.4337-3-hch@lst.de>

On Tue, Nov 29, 2022 at 02:22:01PM +0100, Christoph Hellwig wrote:
> Refactor the code to wait for CSTS state changes so that it can be reused
> by nvme_shutdown_ctrl.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/nvme/host/core.c | 36 +++++++++++-------------------------
>  1 file changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 02cc8dfc9f0b59..9f20af2406dcc8 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -2260,16 +2260,17 @@ static const struct block_device_operations nvme_bdev_ops = {
>  	.pr_ops		= &nvme_pr_ops,
>  };
>  
> -static int nvme_wait_ready(struct nvme_ctrl *ctrl, u32 timeout, bool enabled)
> +static int nvme_wait_ready(struct nvme_ctrl *ctrl, u32 mask, u32 val,
> +		u32 timeout, const char *op)
>  {
>  	unsigned long timeout_jiffies = ((timeout + 1) * HZ / 2) + jiffies;
The timeout_jiffies calculation in nvme_shutdown_ctrl is:
unsigned long timeout = jiffies + (ctrl->shutdown_timeout * HZ);

Aren't we changing the timeout with this change to something
different compared to what it was before for shutdown?

> -	u32 csts, bit = enabled ? NVME_CSTS_RDY : 0;
> +	u32 csts;
>  	int ret;
>  
>  	while ((ret = ctrl->ops->reg_read32(ctrl, NVME_REG_CSTS, &csts)) == 0) {
>  		if (csts == ~0)
>  			return -ENODEV;
> -		if ((csts & NVME_CSTS_RDY) == bit)
> +		if ((csts & mask) == val)
>  			break;
>  
>  		usleep_range(1000, 2000);
> @@ -2278,7 +2279,7 @@ static int nvme_wait_ready(struct nvme_ctrl *ctrl, u32 timeout, bool enabled)
>  		if (time_after(jiffies, timeout_jiffies)) {
>  			dev_err(ctrl->device,
>  				"Device not ready; aborting %s, CSTS=0x%x\n",
> -				enabled ? "initialisation" : "reset", csts);
> +				op, csts);
>  			return -ENODEV;
>  		}
>  	}
