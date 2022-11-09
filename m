Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FAB17C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 03:03:21 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id g62so15478364pfb.10
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 19:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcdjS5v23NWDIN34HXjSC3sLXETcq7/HOJuYeuBBLvE=;
        b=YvCSkB7Z9zwZ9nds/nEALuivYajYX83JNhDwnaXAegqrDUIsUiiJm1lCljt4mR9Ho3
         KEjFpxz9Ss/zjfwHi8KZ00IJCkWilb6nw6JhxqUuh62ym9nfO4rui+CjVo81cFEMk0DW
         VR/15bCnf6CyQQiYH/opY4CskmcECZx1mAU3J4QA327vBO+rthDxikq3MX9XdXlzHbQP
         t72Wq/jNwppG9zGKP8X64SukWFbKHZ7Y8BwWQaazhvN/0ze7PBDoOa9kFZ+JJaYBakne
         esZG7zkT+w0olU3KYLcy3aCcLh+/+2p8+iqJukE6whPL6YiHefkvQ+9YfShSC3Zn9q2w
         BJzw==
X-Gm-Message-State: ACrzQf2tG7KnSs+xcPgOFDOLbgI9di9b2GPG5SmD8J728iC5SZGWqqXG
	tVokXCD1C+161DprekT6HdQ=
X-Google-Smtp-Source: AMsMyM5+MGdwWFZnw4M/ggM3Igi/BOocV5GwjBEXtUBC9nlJxOgA0sgtfrW4+2f2+RMbxtn+qkJenA==
X-Received: by 2002:a05:6a00:35c9:b0:54c:9e75:ab7 with SMTP id dc9-20020a056a0035c900b0054c9e750ab7mr1114323pfb.82.1667963000957;
        Tue, 08 Nov 2022 19:03:20 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id y27-20020aa79afb000000b0056dc34467b8sm7079932pfp.154.2022.11.08.19.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 19:03:20 -0800 (PST)
Message-ID: <b3cea6d6-f76e-8295-3537-a5b125b74bf4@grimberg.me>
Date: Wed, 9 Nov 2022 05:03:19 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 07/12] nvme-pci: factor out a nvme_pci_alloc_ctrl helper
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-8-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-8-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/8/22 17:02, Christoph Hellwig wrote:
> Add a helper that allocates the nvme_dev structure up to the point where
> we can call nvme_init_ctrl.  This pairs with the free_ctrl method and can
> thus be used to cleanup the teardown path and make it more symmetric.
> 
> Note that this now calls nvme_init_ctrl a lot earlier during probing,
> which also means the per-controller character device shows up earlier.
> Due to the controller state no commnds can be send on it, but it might
> make sense to delay the cdev registration until nvme_init_ctrl_finish.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/host/pci.c | 81 +++++++++++++++++++++++------------------
>   1 file changed, 46 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index f7dab65bf5042..e1f60b1c6918f 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -2777,6 +2777,7 @@ static void nvme_free_tagset(struct nvme_dev *dev)
>   	dev->ctrl.tagset = NULL;
>   }
>   
> +/* pairs with nvme_pci_alloc_ctrl */
>   static void nvme_pci_free_ctrl(struct nvme_ctrl *ctrl)
>   {
>   	struct nvme_dev *dev = to_nvme_dev(ctrl);
> @@ -3090,19 +3091,23 @@ static void nvme_async_probe(void *data, async_cookie_t cookie)
>   	nvme_put_ctrl(&dev->ctrl);
>   }
>   
> -static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +static struct nvme_dev *nvme_pci_alloc_ctrl(struct pci_dev *pdev,
> +		const struct pci_device_id *id)

kinda weird that nvme_pci_alloc_ctrl return struct nvme_dev. Patch looks
fine though...
