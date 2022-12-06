Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B16B613D
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 12:19:06 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id u12so22230645wrr.11
        for <asahi@lists.linux.dev>; Tue, 06 Dec 2022 04:19:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=VK/YHqMlY83eHtkxOGm3a8z5082e/wkdU7jYcjcM87xGC0Kf5kV+zoIFqskG7ziC6I
         uni3VlmXWwzH7jl8lrIO+4FGIIt7Rf+bSQ6kj1islnCOU13ZD7rlnQZzaxTfhU6INiWz
         q0Xts1OwGYDzDitAKsRuX4enyqbz0YsaAvMT6EjcAT1j/iksiI7XfiaExXkFVwR5Qjk7
         7Uxuhhb/H4W5mRQup4hftgf9TrWSbgELLE83FEOlKBXIgPlMrAqIaoyEtKVGLeRlRd8C
         iKIohMg/2s/5I+bKPnmuk6XYU8HHNAayDFphj8J/7cavZTgfLQ9wcCF7tf/1Icz6sSkG
         MQpg==
X-Gm-Message-State: ANoB5pl0dI6sY5KCkDcl9ceN8H8sLTMFzOujZwbRRMvvB1AUOWet4XfQ
	4in4Nc9PxYqrW8X88NebPzk=
X-Google-Smtp-Source: AA0mqf5/hl54vbFT6Zl2CG+Nfe03WGhQudppSorZmXqGBUYlUiNUArWbN3xilUmURzwcxYVZm602xA==
X-Received: by 2002:adf:eb81:0:b0:236:4ba1:fb2d with SMTP id t1-20020adfeb81000000b002364ba1fb2dmr54575444wrn.570.1670329144456;
        Tue, 06 Dec 2022 04:19:04 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c4f8500b003d1da8c7854sm5401422wmq.45.2022.12.06.04.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 04:19:03 -0800 (PST)
Message-ID: <92cc81ce-ccca-c6e2-9c3e-669319cdf8b1@grimberg.me>
Date: Tue, 6 Dec 2022 14:18:54 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/9] nvme-pci: remove nvme_disable_admin_queue
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-5-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221129132208.4337-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
