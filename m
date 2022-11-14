Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B211864
	for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 06:29:03 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g12so16141708wrs.10
        for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 22:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dMd5rJEBZEVbaApbw7z+cWXb3j6zwwXbX0R+pjxh1NI=;
        b=Z6L0MUw+Bm8jGMwhIduBN7pyzTj069vaGXWFp7OKVsQwYB1/V8EO4N/ZSuUmPLQedx
         9MHlQ01XaON8HmZiD4Uutq5lEMJO6+QylMr+XhIQiKGbyk+DH61snbpx1Ietz80u6isc
         Bfno4Z0fiJ0Bft2/yMLaN/J/A4lO2W8eqzZTzFLumtImW1QzL3SuYUw9WzhHfJ+ILe/w
         39jIrg9bkSz7DFZd3y3XSPH5OEsHsrDTKHlPISu1fLIHa9GUZ0638j91721CZdpDWlZx
         RlZ9oSRZdH6pCY7osSv7sAlvzruYyl52cGzSg63S6FKPKbVL8wRrZyt3eFsRhds41kPd
         aIlQ==
X-Gm-Message-State: ANoB5pnVfbDMHCIc7rf6clqH65BUOMEgRblyMZf6BGcAehzByPXO51AJ
	qxLmh2Lb2tTUjoD8K9vS2Pc=
X-Google-Smtp-Source: AA0mqf4M9bEIzkIUpuGch87/aZzw1Ezif3JQzv37SgmUM3YcRqmgI29TR7qjPufowzErEhlUviQf+w==
X-Received: by 2002:a5d:42c7:0:b0:22e:35c9:fce5 with SMTP id t7-20020a5d42c7000000b0022e35c9fce5mr6512162wrr.534.1668407341694;
        Sun, 13 Nov 2022 22:29:01 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c3b1000b003a3170a7af9sm12205379wms.4.2022.11.13.22.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Nov 2022 22:29:01 -0800 (PST)
Message-ID: <c4d05cbf-f647-b05c-7c58-fa8620077956@grimberg.me>
Date: Mon, 14 Nov 2022 08:28:59 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 10/13] nvme-pci: simplify nvme_dbbuf_dma_alloc
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-nvme@lists.infradead.org
References: <20221113161138.883195-1-hch@lst.de>
 <20221113161138.883195-11-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221113161138.883195-11-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Move the OACS check and the error checking into nvme_dbbuf_dma_alloc so
> that an upcoming second caller doesn't have to duplicate this boilerplate
> code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/host/pci.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index c2e3a87237da8..4da339690ec67 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -239,10 +239,13 @@ static inline unsigned int nvme_dbbuf_size(struct nvme_dev *dev)
>   	return dev->nr_allocated_queues * 8 * dev->db_stride;
>   }
>   
> -static int nvme_dbbuf_dma_alloc(struct nvme_dev *dev)
> +static void nvme_dbbuf_dma_alloc(struct nvme_dev *dev)
>   {
>   	unsigned int mem_size = nvme_dbbuf_size(dev);
>   
> +	if (!(dev->ctrl.oacs & NVME_CTRL_OACS_DBBUF_SUPP))
> +		return;
> +

I usually dislike functions that may or may not operate based on
caps check inside them. Even if there are more than one call-site.
But that is a personal taste.

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
