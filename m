Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B8F17C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 03:05:59 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 130so15496349pfu.8
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 19:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=cNrvy6ykJ3KtyV8RqzENfhNfaoiGVEaiwHrAJ896gRbhx4spIinlpx2obm1Qf29lJ/
         TdQOoFN8RTT11nxsi9aoCdtSnMdxVVVxpd3r27z5BESXV0U0Sb3xJqBG+b7TPhF3Qo6d
         M+pCK2xBrCkVb7+Ro85j9WjdxWXT35v4SHavXN42CRsdemj4O58lV1elIgiEjVqesAm3
         k15mWDvFnP8sEgSuakLiE6Saoddpql6iU8Pf+D6/uQVHfBtSoU/JxJUjOwZVwEv/S02z
         jkxl9i5c+R8yM7LKHxhOONTbfgYXlxGrZaUyxFXsQjm/Prg33B2rwdoYuQhJYJO4u//P
         b7aA==
X-Gm-Message-State: ACrzQf33nYXRIN9Od1MVsBYBRMXX+4fTCEwEsDpz8cWhtsT8COZA3peR
	90ey9szc7rWjo/FAmdq8t7RYgWnjUXcBfg==
X-Google-Smtp-Source: AMsMyM57OKpQMbsW3NhV1pSD0OMtat4fCxDW83AGrmkwXeT5xW/owjlrSsb81CU3Ql/LXdTA5e03Jg==
X-Received: by 2002:a05:6a02:28b:b0:439:19d6:fad5 with SMTP id bk11-20020a056a02028b00b0043919d6fad5mr51783961pgb.591.1667963159323;
        Tue, 08 Nov 2022 19:05:59 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id i184-20020a6254c1000000b0053e468a78a8sm7042290pfb.158.2022.11.08.19.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 19:05:58 -0800 (PST)
Message-ID: <618f001b-2435-a195-9c9d-907cf1f93ece@grimberg.me>
Date: Wed, 9 Nov 2022 05:05:57 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 10/12] nvme-pci: split nvme_dbbuf_dma_alloc
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-11-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-11-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
