Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BDC17C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 03:03:48 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id u6so15857601plq.12
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 19:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=X4eSlq3mnUJ/3tBYtt/AaVzsqSABgo0nMoVpf+ZuPCmBZuBXs/b/DASnG5Ysgh6dOa
         YJsUzXAYOv1bvLPb7rdccGjNmgPBClI81ObhUR+QIxa6Op8Un//bZtbxHwHfG6qFELLd
         DZQWk7Q83bNb3KsXukIkEBSZEKbeGq+AUhyMiqBLTm+Rqd5ZBhF5j2dfDvHG2bOL6gXU
         6va518EmNvx+FfmWkmjLTg2IbNv5qutMW+7eE9uGPryTI5hMVnkEtDuLf169CUo9jDzS
         8oCUD/Xa/z3VV0dzDclxgpvlti5SZjTZ5XS/zGj0s/4pV3ZtReFOvPcqFQwF7vLOX1IT
         aN1A==
X-Gm-Message-State: ACrzQf1BEuDfgXCW3MYMHKKCZG802IB424Fiq/D1HbgBFfgx7pe3TU5S
	295NkHoJX+4kgcjfaQLbX5o=
X-Google-Smtp-Source: AMsMyM5yH2lXzn7VDF5ie3+YZm15wjHVwD7Sey0dHpgdbcKem0aRVJ+LlPHaX/kg0Jic1Vga8GzBtw==
X-Received: by 2002:a17:902:7408:b0:186:88be:1cca with SMTP id g8-20020a170902740800b0018688be1ccamr58712921pll.155.1667963028452;
        Tue, 08 Nov 2022 19:03:48 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id t7-20020a635f07000000b0046a1c832e9fsm6458683pgb.34.2022.11.08.19.03.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 19:03:47 -0800 (PST)
Message-ID: <0431e3ef-f2ee-be44-d1c6-3c600dc143f0@grimberg.me>
Date: Wed, 9 Nov 2022 05:03:46 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 08/12] nvme-pci: set constant paramters in
 nvme_pci_alloc_ctrl
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-9-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
