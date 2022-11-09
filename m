Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6AA17C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 03:15:33 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id b185so15508306pfb.9
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 19:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PiOpBEd9eTlXYSjfI73oUvNaAmf160IGkOO7gJdLzlQ=;
        b=VtYkNZnSKjpykxV3NI8LnqX9Q//GCPDxGKlB1qAJY7lym78WD91hyVbQXvjTTClkyY
         LMQxg8f8QHjEgZxatd4LuykNu2nN2aGPF/Gk5hKG+7/nMzWAB5SYHfDyx4JZ8Jx1NU+I
         RQeDUqXyrcBCM83f84kMCzxExmcloIZM4teIzT5Z/XCBd39v0d3VoLxIVQywJLcStMuS
         h70UnlAd6xd/vlTe1u1H59UfYvTpjxaiJXBBe+EHATg4omt7VqOilxwbv8rXrP4eqHyh
         bpO2Zs9blGDFAQuUofk02JRb3TQsH1p8FeVIpDO/+MPUYqUKF0UNm8pbEwcO7ose1Rcl
         nSXQ==
X-Gm-Message-State: ACrzQf0hQj3usluzaLnzKHtLsAh2bY4gokZII94jUgtNT9uT/BRW69wj
	GitsGDA7As2NO8XatWJuxxm5QH+vBkxaUg==
X-Google-Smtp-Source: AMsMyM6vW2Nm886FOvXuvNBItj8TuK/IQ5WJuWfhUHATOwxAXqxiWgCBAbdr6QsQAFhTP3VXIduZeA==
X-Received: by 2002:a65:4d4b:0:b0:46e:c389:75ef with SMTP id j11-20020a654d4b000000b0046ec38975efmr1106709pgt.108.1667963732834;
        Tue, 08 Nov 2022 19:15:32 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id f30-20020aa79d9e000000b0056bbd286cf4sm7065837pfq.167.2022.11.08.19.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 19:15:32 -0800 (PST)
Message-ID: <64a3cc1c-20f0-ed3f-4f5f-001bf063cb36@grimberg.me>
Date: Wed, 9 Nov 2022 05:15:30 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 12/12] nvme-pci: don't unbind the driver on reset failure
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-13-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-13-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


> Unbind a device driver when a reset fails is very unusual behavior.
> Just disable the controller and leave it in dead state if we fail to
> reset it.

OK, that is fine by me.

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
