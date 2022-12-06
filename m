Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8779613D
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 12:23:20 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id c65-20020a1c3544000000b003cfffd00fc0so14162933wma.1
        for <asahi@lists.linux.dev>; Tue, 06 Dec 2022 04:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=PUzVcM/l7SlKvKad3H7SMcxOSS/zUAuekB5UG/1HtTPv3fz0gaZZ2M4lD6ZL1FzN+f
         xcvBOwMfbTYAenmii/4XrkFPd28c0yTnZ7ZOD7TowChsvT0I3OtjPV6E8v2VObyPUXJw
         fVGXeHXfUlzPCb4juIeiZFnRFpvpUVZfdlyK6mVhC/d6Xn0Xfkgn/1oOfBsoRb0dkL5P
         2ayoiGEZWqbayDFpwhzStNOLLww9pL7uxaH6GzaS7ZlFBm8L7+uWrPpwuhLc5WyLtckS
         XH2oCzJA4tBzT5oBYjcFlgPIg3sibU6d6hXIDCXmd3/Ue0DoP5t4bq37KKbI1d9T8bUD
         JAAw==
X-Gm-Message-State: ANoB5pkJ73hBqIYR9ImPlRHANtCh7SptS8mBcMCcn+hn9RnRjisUVax+
	VnGd7XkLMyFHdrNjxQhcBAs=
X-Google-Smtp-Source: AA0mqf5ITLhi9uhusEXIn2wTyjQnO8sccPThtAzOeIKsV+VN/4tUw6rGvEuBbijT+WehP2MFbv1vEw==
X-Received: by 2002:a05:600c:1e04:b0:3d0:bda:f20 with SMTP id ay4-20020a05600c1e0400b003d00bda0f20mr58011304wmb.105.1670329399208;
        Tue, 06 Dec 2022 04:23:19 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c190b00b003b47e75b401sm28041370wmq.37.2022.12.06.04.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 04:23:18 -0800 (PST)
Message-ID: <8a6bb3e4-54a5-bdeb-3269-3a2f6d4b1e09@grimberg.me>
Date: Tue, 6 Dec 2022 14:23:17 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 9/9] nvme-pci: split out a nvme_pci_ctrl_is_dead helper
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-10-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221129132208.4337-10-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
