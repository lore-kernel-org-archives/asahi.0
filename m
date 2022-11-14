Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8F5748D
	for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 16:37:51 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id hh9so7075632qtb.13
        for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 08:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IgOId39Xocm9Vje1a/ep3OwWov96m12G3JQ8Ar6j2js=;
        b=Qa0GsT/naRuPhIF14456ovieRdsJ6XhHibA8b+89NOw+mpNSYiGJk7qmuj4n1ZqVKX
         2Cen0kxU499y3PryQOrfNo2eAz6rHw0oTz8m/tRrEdSXhz5UBZoIIEPGzMcSO37IrJdY
         jxF8tN3DwETde2iItJ3zcfAEqahYTKwCcfatc40qIi2FcibQ8OcovAvYZbONiZg63arX
         GQxDgXXsQgNNYz7QAWqAmjjhMvzrjhsLM3rNAqXNqfsyvjBaUIi+r528SoPSE4hEDe/4
         Q0L4P3APqywasdFmVG3ykAtabAt2NIsYnxg+7X57cRG5UCD4YebtfhUJZOD12LfB4ilP
         b4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IgOId39Xocm9Vje1a/ep3OwWov96m12G3JQ8Ar6j2js=;
        b=TXX86myEHWYLAJn9MpkFud7pbv+x/Uti2HUtSdh8OU1smKK0yo600hXqdoiVWdDMsG
         0say1qP0msMPtKto67gCvZDfPlxt06zRtByhc8sqLM47QVAIRDVtHOAC3232j312GGr4
         J6Oo2Ej9rEx+d3paLREVhKZC+mIv6nAQZcRQTgRv35y4sLPXNdY8YFiOPo+P6RkwrWap
         d/mhyvqXFV/+uxLa7C0pJgqfSbasCGw/F8ADoD/pFDhpjeQk/1xuUPWo1M2PtHBEtjXC
         u0lzEOWAt24NC6u+GmV8eHfB3T8c50i5azvHs4NqHDAVC+teg5Lc0up0+bjVFCwuFhY9
         d+dg==
X-Gm-Message-State: ANoB5pngFxypbycuimFUjBdGMl42ml2oG9sK0hti0ErUruutrXUuRPYf
	6qs9GDxB3cb1P+TN4rZbvfA=
X-Google-Smtp-Source: AA0mqf7/arSHjVFS1kNgX1Efe4XIdrBRJm6BAMzr6Q8VwiwhFqT1+N9tnQyNPsPf4v4c0rfLijiRcQ==
X-Received: by 2002:a05:622a:1a1f:b0:3a5:42f9:de64 with SMTP id f31-20020a05622a1a1f00b003a542f9de64mr12853008qtb.685.1668443870917;
        Mon, 14 Nov 2022 08:37:50 -0800 (PST)
Received: from [192.168.50.208] (ip68-109-79-27.oc.oc.cox.net. [68.109.79.27])
        by smtp.gmail.com with ESMTPSA id he31-20020a05622a601f00b00397b1c60780sm5861555qtb.61.2022.11.14.08.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 08:37:50 -0800 (PST)
Message-ID: <8ff1226e-d38c-67ee-7c8f-771cad7f99d7@gmail.com>
Date: Mon, 14 Nov 2022 08:37:48 -0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/13] nvme: move OPAL setup from PCIe to core
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
 Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20221113161138.883195-1-hch@lst.de>
 <20221113161138.883195-3-hch@lst.de>
From: James Smart <jsmart2021@gmail.com>
In-Reply-To: <20221113161138.883195-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2022 8:11 AM, Christoph Hellwig wrote:
> Nothing about the TCG Opal support is PCIe transport specific, so move it
> to the core code.  For this nvme_init_ctrl_finish grows a new
> was_suspended argument that allows the transport driver to tell the OPAL
> code if the controller came out of a suspend cycle.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Keith Busch <kbusch@kernel.org>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> Tested-by Gerd Bayer <gbayer@linxu.ibm.com>
> ---
>   drivers/nvme/host/apple.c  |  2 +-
>   drivers/nvme/host/core.c   | 25 ++++++++++++++++++++++---
>   drivers/nvme/host/fc.c     |  2 +-
>   drivers/nvme/host/nvme.h   |  5 +----
>   drivers/nvme/host/pci.c    | 14 +-------------
>   drivers/nvme/host/rdma.c   |  2 +-
>   drivers/nvme/host/tcp.c    |  2 +-
>   drivers/nvme/target/loop.c |  2 +-
>   8 files changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
> index 24e224c279a41..a85349a7e938c 100644

Reviewed-by: James Smart <jsmart2021@gmail.com>

-- james

