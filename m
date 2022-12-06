Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E72613D
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 12:20:30 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id d1so23169273wrs.12
        for <asahi@lists.linux.dev>; Tue, 06 Dec 2022 04:20:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=AvkKHNBeFGovi+J+TZ0PQ+LksbdCiyAlqS/d83xHBtDxUHSxbPU0yaF3VCX+JH9Bmd
         qSXtXq1m99f1YNhN+72YOA2eFEKTbCBqpKPs6KRqLoR3FDQdysK/zXJF5l8L5zsIDEJ6
         PaY9srbkXxioalZeOdTj7iP+Jh2+GFfsAjqdXu/TA5a+OoyZxo3/tZPh/Dk4GqTCOPMX
         Zo7x3gHtJHCWeChkPzeCujRte72zFJcA+0HqFzOczibYLdePGlTWDyt0SpsWThxpzWJZ
         Dzm8+pwHmYHWHIkitoBd22BX9645/hKLlVTOpdPG/kQ0yTGBurbN+bCCPNFcGLaPLCeT
         X+Ew==
X-Gm-Message-State: ANoB5pmLiD2mmqxqcJ1SECCxrj2l0+Y3B8Saud++Ec7tY7bAmf8RCidq
	7gmZx54Hh8NkJlhWdFHNFNk=
X-Google-Smtp-Source: AA0mqf4DeYYo5jtHzv+j3gyj2Dk/Mm3VU3jhVIWae99nnFsFgr83kGM4uI56v150OWkGp7+0Va052Q==
X-Received: by 2002:a05:6000:137a:b0:242:5b1f:3dd0 with SMTP id q26-20020a056000137a00b002425b1f3dd0mr7079667wrz.633.1670329228695;
        Tue, 06 Dec 2022 04:20:28 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id h20-20020a05600c351400b003b47ff307e1sm23303488wmq.31.2022.12.06.04.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 04:20:28 -0800 (PST)
Message-ID: <c263f818-844a-d417-69b9-4be6ae6d031a@grimberg.me>
Date: Tue, 6 Dec 2022 14:20:26 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/9] nvme-pci: cleanup nvme_suspend_queue
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-7-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221129132208.4337-7-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
