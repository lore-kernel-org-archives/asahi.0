Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648917C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 03:14:04 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 6so6951171pgm.6
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 19:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJLCoeErP7NGXA7h4mOmQ4Hs15383nqSKzRthhPOXAk=;
        b=WPTvpO5BFUL+tCEawqxoM6o3ruSy9uCUMQuqMTvF833dRRRYsq1cyxEFaHHiBT0Y0z
         Q3G7yO/wW3GudwknmhLFP5sJDvrSCeg7Il9uRdrX9Atk2KoelC5HgmsIEAaya1PMgJ9r
         lx0NJm3BmRXi/8lksyxxL1ojkkcZIAAE172/LHxeeFGBi5iSLyx1dQJR/M3hNrrXqZDg
         KnL84uygbvdsZeS1KttnHwPCYN6znok+U3QRjS7z6GkrOwZkHMtyyYiKXZb/DxZIvwxb
         U2PrmC2mTSKbaJdsc38xFqbsuiENgjDXL6+rLEuS5OB4PoEcXZyj3nxLrpYC1Xrom9Yt
         HUUQ==
X-Gm-Message-State: ACrzQf31mdgNSZksrX6R8p3WPR9pvi1SkvaZsalkHuf+SW4rcvT1XKLN
	ewTHhC8k/QRb7N42OmF78pXUrNjbMsrBNQ==
X-Google-Smtp-Source: AMsMyM6szvJKihNjg88j2zjJ1XUR0EB59+9bt2EAuWUthOMRbmz/p6iONvK2qHLMXcizxFahaO2svg==
X-Received: by 2002:a05:6a00:b4f:b0:56d:a232:6da7 with SMTP id p15-20020a056a000b4f00b0056da2326da7mr45572982pfo.22.1667963643954;
        Tue, 08 Nov 2022 19:14:03 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b0018703bf3ec9sm7661465plb.61.2022.11.08.19.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 19:14:03 -0800 (PST)
Message-ID: <e1225fb6-0cac-ba47-df03-0be84cb3a09b@grimberg.me>
Date: Wed, 9 Nov 2022 05:14:02 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 11/12] nvme-pci: split the initial probe from the rest
 path
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-12-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-12-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Nice

On 11/8/22 17:02, Christoph Hellwig wrote:
> nvme_reset_work is a little fragile as it needs to handle both resetting
> a live controller and initializing one during probe.  Split out the initial
> probe and open code it in nvme_probe and leave nvme_reset_work to just do
> the live controller reset.
> 
> This fixes a recently introduced bug where nvme_dev_disable causes a NULL
> pointer dereferences in blk_mq_quiesce_tagset because the tagset pointer
> is not set when the reset state is entered directly from the new state.
> The separate probe code can skip the reset state and probe directly and
> fixes this.
> 
> To make sure the system isn't single threaded on enabling nvme
> controllers, set the PROBE_PREFER_ASYNCHRONOUS flag in the device_driver
> structure so that the driver core probes in parallel.
> 
> Fixes: 98d81f0df70c ("nvme: use blk_mq_[un]quiesce_tagset")
> Reported-by: Gerd Bayer <gbayer@linux.ibm.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/host/pci.c | 139 ++++++++++++++++++++++++----------------
>   1 file changed, 83 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 1b3c96a4b7c90..1c8c70767cb8a 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -2821,15 +2821,7 @@ static void nvme_reset_work(struct work_struct *work)
>   	result = nvme_pci_enable(dev);
>   	if (result)
>   		goto out_unlock;
> -
> -	if (!dev->ctrl.admin_q) {
> -		result = nvme_pci_alloc_admin_tag_set(dev);
> -		if (result)
> -			goto out_unlock;
> -	} else {
> -		nvme_start_admin_queue(&dev->ctrl);
> -	}
> -
> +	nvme_start_admin_queue(&dev->ctrl);
>   	mutex_unlock(&dev->shutdown_lock);
>   
>   	/*
> @@ -2854,9 +2846,6 @@ static void nvme_reset_work(struct work_struct *work)
>   		 */
>   		memset(dev->dbbuf_dbs, 0, nvme_dbbuf_size(dev));
>   		memset(dev->dbbuf_eis, 0, nvme_dbbuf_size(dev));
> -	} else {
> -		if (dev->ctrl.oacs & NVME_CTRL_OACS_DBBUF_SUPP)
> -			nvme_dbbuf_dma_alloc(dev);
>   	}
>   
>   	if (dev->ctrl.hmpre) {
> @@ -2869,37 +2858,23 @@ static void nvme_reset_work(struct work_struct *work)
>   	if (result)
>   		goto out;
>   
> -	if (dev->ctrl.tagset) {
> -		/*
> -		 * This is a controller reset and we already have a tagset.
> -		 * Freeze and update the number of I/O queues as thos might have
> -		 * changed.  If there are no I/O queues left after this reset,
> -		 * keep the controller around but remove all namespaces.
> -		 */
> -		if (dev->online_queues > 1) {
> -			nvme_start_queues(&dev->ctrl);
> -			nvme_wait_freeze(&dev->ctrl);
> -			nvme_pci_update_nr_queues(dev);
> -			nvme_dbbuf_set(dev);
> -			nvme_unfreeze(&dev->ctrl);
> -		} else {
> -			dev_warn(dev->ctrl.device, "IO queues lost\n");
> -			nvme_mark_namespaces_dead(&dev->ctrl);
> -			nvme_start_queues(&dev->ctrl);
> -			nvme_remove_namespaces(&dev->ctrl);
> -			nvme_free_tagset(dev);
> -		}
> +	/*
> +	 * Freeze and update the number of I/O queues as thos might have
> +	 * changed.  If there are no I/O queues left after this reset, keep the
> +	 * controller around but remove all namespaces.
> +	 */
> +	if (dev->online_queues > 1) {
> +		nvme_start_queues(&dev->ctrl);
> +		nvme_wait_freeze(&dev->ctrl);
> +		nvme_pci_update_nr_queues(dev);
> +		nvme_dbbuf_set(dev);
> +		nvme_unfreeze(&dev->ctrl);
>   	} else {
> -		/*
> -		 * First probe.  Still allow the controller to show up even if
> -		 * there are no namespaces.
> -		 */
> -		if (dev->online_queues > 1) {
> -			nvme_pci_alloc_tag_set(dev);
> -			nvme_dbbuf_set(dev);
> -		} else {
> -			dev_warn(dev->ctrl.device, "IO queues not created\n");
> -		}
> +		dev_warn(dev->ctrl.device, "IO queues lost\n");
> +		nvme_mark_namespaces_dead(&dev->ctrl);
> +		nvme_start_queues(&dev->ctrl);
> +		nvme_remove_namespaces(&dev->ctrl);

Is this needed? isn't nvme_remove coming soon?
In fact, shouldn't all these calls be in nvme_remove?
