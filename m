Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D473717C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 03:00:47 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id h14so15501653pjv.4
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 19:00:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=KhwgiHjxwJzCtH6p8Hw6DKfiwj6S16gNzDXqOqVpp+r8puYUnXoK8wSJo3IpGHuj4T
         VsxD1sKybPF5jP1/Jc5Sgsaw8fAO2BsjZz19P4MFFSvNJ/nC5ccH04Hx1r7P5pN5FAYr
         1WD0VNl7En8K+iVOGjHMLTR+5v1kFpH/cF7ICUIoNuBe9xPbSs1fNvaozsoy2YjqTMdj
         4j0ryojXGf0Nflf1wG7zqgiEpJSFTk7SS63KjQzlgHhj6sjH953Bah59/WgovcEI38cA
         D3NM5egEl2VQ39J4lo/NeD2Od5g9dQcN4I8XNgFRyZsD3DyEA4Fy2+/EqCux6cw+OlNo
         Wnhg==
X-Gm-Message-State: ACrzQf1OjKD6uM5g2RG8AdLj6y/nYUb1iMF2MlcaMFpYHmHiVCfVqXJg
	KMzORQ2fbJqpfix22SMNkWc=
X-Google-Smtp-Source: AMsMyM4MjyYJm3A0lRMAig+9KBrkTTzQIX469ghRDQr5mOQe+122nwCSZxkAk0Sj/83VH4yL3hvuFg==
X-Received: by 2002:a17:902:d4cc:b0:186:f57d:ba61 with SMTP id o12-20020a170902d4cc00b00186f57dba61mr58745464plg.97.1667962847373;
        Tue, 08 Nov 2022 19:00:47 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id f143-20020a623895000000b0056b6d31ac8asm7299069pfa.178.2022.11.08.19.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 19:00:46 -0800 (PST)
Message-ID: <3e8c78a4-d50b-efc5-d66a-8e90dc37a86b@grimberg.me>
Date: Wed, 9 Nov 2022 05:00:45 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 06/12] nvme-pci: factor the iod mempool creation into a
 helper
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-7-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-7-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
