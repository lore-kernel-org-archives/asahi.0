Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8AC613D
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 12:21:58 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id n9-20020a05600c3b8900b003d0944dba41so7849468wms.4
        for <asahi@lists.linux.dev>; Tue, 06 Dec 2022 04:21:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=hYzS/OMXecDtgPvZGDPaPA5h41Mh8F18z1fY2Z+L/uFUvt4/ePXZpo60RVtGksuOa4
         qP/lDDiHXLK3g4dwy7lyuDQ5fm6PIhIQnDHMmRsPlUS4UNONk7OtCW8bZygHFIQf2+6r
         al5w5sEVoDl3jRLKdehRSZAkY1PHGYKcjkKD+DBM+D0uVqHzu+aTN30NRVQtGxeXXPCr
         55uGjKdHkk8NGIzJexjBnuQdpNOK2EahSyZM5ugOByIl05ytR0c2TK14Nw4r9LBq//uP
         UruqwI2U6R5O7RxK+FjbNynmHPcimm3KG84eBiBpfgUlFn+l0uxuChxAcFIAPJ95ckar
         bsEw==
X-Gm-Message-State: ANoB5pmOEHiCnfc3HM36/eeAyBM6jWMEt/u9DEG+anck11FBKyylHvFv
	X152TlRCZJvTR6ymcjI+/5M=
X-Google-Smtp-Source: AA0mqf68e+lFerscgOPTEuwnVJdgBwJ9UgxtDAQqa3B+6CVSqPeb4LFarfB/x6DgnRfbAiczlXhI/A==
X-Received: by 2002:a05:600c:43c5:b0:3d1:eea7:e13d with SMTP id f5-20020a05600c43c500b003d1eea7e13dmr1349437wmn.74.1670329316505;
        Tue, 06 Dec 2022 04:21:56 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b003c65c9a36dfsm20497217wmb.48.2022.12.06.04.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 04:21:56 -0800 (PST)
Message-ID: <2d8804dd-def8-9599-4b57-4e2c3bb3a1f5@grimberg.me>
Date: Tue, 6 Dec 2022 14:21:54 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 8/9] nvme-pci: return early on ctrl state mismatch in
 nvme_reset_work
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-9-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221129132208.4337-9-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
