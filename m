Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC0017C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 02:58:49 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so604003pjc.3
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 18:58:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jo4xR/pUNsKnj3WjKfoigi4Co6csB1ZmrHFREpcuF1s=;
        b=18RnppQn4Y69Hy7zCT27Xjrfe9WHyuVwdYfFujEiQTEeJL0hFQPllttYIBwQp7Q1Q9
         fnLbIIeVT5+Ut1o4t+5Ho6dPanWC4X4POalB3WCpOGgkC1I0TYPbuRBOrlBQbO7jN+D2
         87XET580tFMu2+KvEFgY+IrlE5L6eGPn+Da8OUH8WiX9bnHCLZLSllTuH7z+dkRlnjjA
         dmZH7CqMGDUpjUso097aMK8t+ojNA2x62o6PbkUgTLnAheHljDePcNaYvL7wsYeSOKbJ
         ZeXhz3VBzhxXiAuLE8aTBYCZFSWFYXQNN80sdryyH+SxKAf06/Bshi65Oh4LLOE5JmjX
         BrbA==
X-Gm-Message-State: ACrzQf1YXwv9Cb/1xCn6ygXYISRDNTNLdr1Wrh/rTdlbITz4dQSKmeVQ
	gZu7NnaA8QQc+oW96f+61Yk=
X-Google-Smtp-Source: AMsMyM7nNKpM2sqfnSpNiB1PxHaW474pn/nGKUEXugWnJj0STNbTE3okVoUAy3CfZb/aYCmV3NyTvA==
X-Received: by 2002:a17:902:eccc:b0:186:5f09:f9 with SMTP id a12-20020a170902eccc00b001865f0900f9mr58623695plh.6.1667962729090;
        Tue, 08 Nov 2022 18:58:49 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id pv3-20020a17090b3c8300b001fd6066284dsm44220pjb.6.2022.11.08.18.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 18:58:48 -0800 (PST)
Message-ID: <679cf80b-3e30-e393-d5c4-d3941e853bfb@grimberg.me>
Date: Wed, 9 Nov 2022 04:58:46 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 04/12] nvme-pci: put the admin queue in
 nvme_dev_remove_admin
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-5-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Once the controller is shutdown no one can access the admin queue.  Tear
> it down in nvme_dev_remove_admin, which matches the flow in the other
> drivers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/host/pci.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index c8f6ce5eee1c2..f526ad578088a 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -1747,6 +1747,7 @@ static void nvme_dev_remove_admin(struct nvme_dev *dev)
>   		 */
>   		nvme_start_admin_queue(&dev->ctrl);
>   		blk_mq_destroy_queue(dev->ctrl.admin_q);
> +		blk_put_queue(dev->ctrl.admin_q);
>   		blk_mq_free_tag_set(&dev->admin_tagset);
>   	}
>   }
> @@ -2774,8 +2775,6 @@ static void nvme_pci_free_ctrl(struct nvme_ctrl *ctrl)
>   
>   	nvme_dbbuf_dma_free(dev);
>   	nvme_free_tagset(dev);
> -	if (dev->ctrl.admin_q)
> -		blk_put_queue(dev->ctrl.admin_q);

Is the check here valid? meaning can we get here with
a NULL admin_q?

In any event, looks good
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
