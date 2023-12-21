Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA174B5B4
	for <asahi@lists.linux.dev>; Thu, 21 Dec 2023 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3367a52c676so55770f8f.1
        for <asahi@lists.linux.dev>; Thu, 21 Dec 2023 01:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703151041; x=1703755841;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVZKStYUL3aqr2H+ry9zP6Hg8QuXRhbNdAiPhAUSJ4o=;
        b=dEXrzsu0KckLUkboyRZl87sL1gxs7zHhNuCUsGw9rsyBJ5M1vWzabv7haYBh56K4dd
         zLUJPCZiYNi7v6r/tud3jehrvpjU2ZvKNQ8A1bcGt3v42Ihh15318phUBMqi6KcbwbOh
         50WC7UwS1ZN7TPJHRnX8zFJwIFYkjCUIX0Q0P1G++MkRfGp5+ktZhqrsCNy2ZttV402d
         89DmTscRaBdXXV9w3Fg0QSPEeBs/GdAhTCTyNolYBub3Hkd8lBc27x2qq2ZeDgnVMABz
         Ddd9XVxEh/uBTvqLoKTiEhKdOLuhtqnnQdZz599uEHzUee1NNtIoXVl+SQ3PrUKhzqmU
         LBQg==
X-Gm-Message-State: AOJu0YycJGNxc9z3jcrXLaDDbn7n+XEhq28carP4zPvmpIHOplp6kcca
	QYid9AV3KBqVOrhl6RSG01s=
X-Google-Smtp-Source: AGHT+IHLDiO7/uwT2ZAKPKCBOOfAp8nLkWIijpamp6Px6NuUd74pq9hyNGpjPJP5jDZXjl0HY0nmpQ==
X-Received: by 2002:adf:f20a:0:b0:336:4355:bb46 with SMTP id p10-20020adff20a000000b003364355bb46mr15397073wro.1.1703151040998;
        Thu, 21 Dec 2023 01:30:40 -0800 (PST)
Received: from [10.100.102.14] (46-117-87-214.bb.netvision.net.il. [46.117.87.214])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d53d2000000b0033671314440sm1587217wrw.3.2023.12.21.01.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 01:30:40 -0800 (PST)
Message-ID: <155ec506-ede8-42c7-95f7-e8be32800a8d@grimberg.me>
Date: Thu, 21 Dec 2023 11:30:38 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: don't set a virt_boundary unless needed
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, marcan@marcan.st, sven@svenpeter.dev,
 kbusch@kernel.org, axboe@kernel.dk, james.smart@broadcom.com
Cc: alyssa@rosenzweig.io, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org, kch@nvidia.com
References: <20231221084853.1175482-1-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20231221084853.1175482-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> NVMe PRPs are a pain and force the expensive virt_boundary checking on
> block layer, prevent secure passthrough and require scatter/gather I/O
> to be split into multiple commands which is problematic for the upcoming
> atomic write support.

But is the threshold still correct? meaning for I/Os small enough the
device will have lower performance? I'm not advocating that we keep it,
but we should at least mention the tradeoff in the change log.

> Fix the NVMe core to require an opt-in from the drivers for it.
> 
> For nvme-apple it is always required as the driver only supports PRPs.
> 
> For nvme-pci when SGLs are supported we'll always use them for data I/O
> that would require a virt_boundary.
> 
> For nvme-rdma the virt boundary is always required, as RMDA MRs are just
> as dumb as NVMe PRPs.

That is actually device dependent. The driver can ask for a pool of
mrs with type IB_MR_TYPE_SG_GAPS if the device supports IBK_SG_GAPS_REG.

See from ib_srp.c:
--
        if (device->attrs.kernel_cap_flags & IBK_SG_GAPS_REG)
                 mr_type = IB_MR_TYPE_SG_GAPS;
         else
                 mr_type = IB_MR_TYPE_MEM_REG;
--

> 
> For nvme-tcp and nvme-fc I set the flags for now because I don't
> understand the drivers fully, but I suspect the flags could be lifted.

tcp can absolutely omit virt boundaries.

> For nvme-loop the flag is never set as it doesn't have any requirements
> on the I/O format.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/nvme/host/apple.c |  6 +++++
>   drivers/nvme/host/core.c  | 11 ++++++++-
>   drivers/nvme/host/fc.c    |  3 +++
>   drivers/nvme/host/nvme.h  |  4 +++
>   drivers/nvme/host/pci.c   | 52 ++++++++++++++++++++++-----------------
>   drivers/nvme/host/rdma.c  |  6 +++++
>   drivers/nvme/host/tcp.c   |  3 +++
>   7 files changed, 61 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index 596bb11eeba5a9..a1afb54e3b4da8 100644
> --- a/drivers/nvme/host/apple.c
> +++ b/drivers/nvme/host/apple.c
> @@ -1116,6 +1116,12 @@ static void apple_nvme_reset_work(struct work_struct *work)
>   		goto out;
>   	}
>   
> +	/*
> +	 * nvme-apple always uses PRPs and thus needs to set a virt boundary.
> +	 */
> +	set_bit(NVME_CTRL_VIRT_BOUNDARY_IO, &anv->ctrl.flags);
> +	set_bit(NVME_CTRL_VIRT_BOUNDARY_ADMIN, &anv->ctrl.flags);
> +

Why two flags? Why can't the core just always set the blk virt boundary
on the admin request queue?

>   	ret = nvme_init_ctrl_finish(&anv->ctrl, false);
>   	if (ret)
>   		goto out
