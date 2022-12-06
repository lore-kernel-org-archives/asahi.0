Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742AE613D
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 12:21:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso12537592wmo.1
        for <asahi@lists.linux.dev>; Tue, 06 Dec 2022 04:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=8RCUKmwxvMA+SMEz1g1IxPwbkqTJsA0ecRPhL2/5U9XZ9frYlG0vf6KU9QemAdebaN
         /ssNWD8YSCQC+VaxHbYO9WSwR4h456UXSCIOLdJwWMRcX0/ZbYAglR6o+ICmwSHbuHkx
         LTBy4V1xuWvvsnXD1WCICU0s0qiHP3dpBB6Kbf26EWD8/VKyN5M2p7J/TQR6ubijyIbW
         6FqO9GRFIwvNPReMGxB2+IBQsJtwLXKj8DxMNLzHW2RHOEXhKl8YnvMeLmyIUNm/zpEf
         jxGCJ/RgLKlvYPWtu0g3hV2+7sJhsDe9JCSYcpbpuGR34ixYuNros5W3VaD1zXQRGkhr
         FvGw==
X-Gm-Message-State: ANoB5pl6jKSy8nKsS1vkl1RXkblkC6ADeFouBR6yCG1iEnpYN4qRZitq
	GM7fHYoSMu+GBja4NqVB1B4=
X-Google-Smtp-Source: AA0mqf4Bl+rqYD9EYc6bbxa2BG4H3CYghtZvSoCuTmKz00sJ1FWy1XysOb+B7/Ws9XTIjA0z4gk05g==
X-Received: by 2002:a1c:f401:0:b0:3c7:84d:72d with SMTP id z1-20020a1cf401000000b003c7084d072dmr49355206wma.181.1670329265740;
        Tue, 06 Dec 2022 04:21:05 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id m42-20020a05600c092a00b003c6c4639ac6sm19927679wmp.34.2022.12.06.04.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 04:21:05 -0800 (PST)
Message-ID: <6e2806f9-ae0d-1c23-57d0-8cecf611a7a8@grimberg.me>
Date: Tue, 6 Dec 2022 14:21:03 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 7/9] nvme-pci: rename nvme_disable_io_queues
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-8-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221129132208.4337-8-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
