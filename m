Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE5F613D
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 12:19:43 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id f18so23190319wrj.5
        for <asahi@lists.linux.dev>; Tue, 06 Dec 2022 04:19:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=l3mEhLX81dv92wcIKEPJCYK7r3bMKl9Tb2iWQR4tnE6ufbmufY4N9C/KKERx1YYTZh
         FQ0Yww/0BQBeT0e39vxrWTMqTfJaxwpPYTZlLazyJwxLfO5ZlezAjOlUDs4fAT/KUKRB
         Vnwtv2il31OW1F5n3j0z1X2o1fVMp1eMmvG6MzDFqc5yTbERs/ly+R1CfJiepqrsc8Vl
         iokmBWsQ6Rx/Lv7if/DLmGsQxuGKQw1yiHaMJ3Q3hDDs73EV/EcjoHv8K8bByheOpWoD
         6pBQ7EXkrq9jfHWOBDV/niksF11oXM8vrzeDDbD04Vio0xX0mmllSisUYFCOe/SoumGW
         FRbQ==
X-Gm-Message-State: ANoB5pngaNug1/haCOfyIq549bcN2Ro0cgJIP9hUCWT7DmMVOAQbHkSl
	hfZf8OKLyd9cFf47n/xY4/s=
X-Google-Smtp-Source: AA0mqf7v1UlLV4f477x/Ue6nrxzmLBunigzqvak/B5uMV1B6IOIJH0NO3HSYpVXa+hUGQjEmQsYc2g==
X-Received: by 2002:adf:e412:0:b0:242:2cd:259 with SMTP id g18-20020adfe412000000b0024202cd0259mr32671682wrm.718.1670329181963;
        Tue, 06 Dec 2022 04:19:41 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id i10-20020a1c540a000000b003cfc02ab8basm23873992wmb.33.2022.12.06.04.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 04:19:41 -0800 (PST)
Message-ID: <1803f2a6-2846-488f-362b-9d17830d816e@grimberg.me>
Date: Tue, 6 Dec 2022 14:19:39 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/9] nvme-pci: remove nvme_pci_disable
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-6-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221129132208.4337-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
