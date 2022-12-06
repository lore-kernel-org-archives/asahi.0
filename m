Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B98613D
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 12:18:39 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso14119457wme.5
        for <asahi@lists.linux.dev>; Tue, 06 Dec 2022 04:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=gtzryXUlRcC8RtQMmdxOp8zpVWSnJfVlOxzvW2ymqn8LxUCnK8+EFyihAFr2RVyvIG
         2c5GQDdgvZpuWUDnND4+8scDYoD0wogTnEDg0kvEh3kFqrcq459Ma0ngCTrPRsWq7R0n
         9w+G+ACtIoM3QS7HqKo2YZD3WLaic0BvRNmwSHw4rZS+Y+SE72zSPnU+mUnuEa/asvzC
         WSoR2s9pCpz97H9Wjsef24VaoWTnZtXODk46YDL9XlsAbhkwgd4U8800XJI9mMV+si+M
         FlXqveryTBBQB/NnlcKqEFEv/Jqg0kDDen0Y1MxdxmUIoZojFIYpNhpWDWDPp2TC3bu8
         P3hw==
X-Gm-Message-State: ANoB5pnV5v4T25TP63I44rdfefyF0jECDsbAkFh/0tlUn7UvG+qnTa1L
	ZbFR1kDzYKu71RGSWmHzXFI=
X-Google-Smtp-Source: AA0mqf5ARJzV5nNelgkDuGdxo6D+L1/QK90hI9x+pbOGP1CNLmJW5hSy9dHHorA4abxNVOciNahDxA==
X-Received: by 2002:a05:600c:1d1e:b0:3d0:4720:5293 with SMTP id l30-20020a05600c1d1e00b003d047205293mr36694833wms.176.1670329118296;
        Tue, 06 Dec 2022 04:18:38 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id t67-20020a1c4646000000b003cfa622a18asm23902118wma.3.2022.12.06.04.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 04:18:37 -0800 (PST)
Message-ID: <9e2d614d-5c45-a9c4-8a9b-901d1ea457c9@grimberg.me>
Date: Tue, 6 Dec 2022 14:18:33 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/9] nvme: merge nvme_shutdown_ctrl into nvme_disable_ctrl
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-4-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221129132208.4337-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
