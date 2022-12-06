Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864C613D
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 12:15:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id o5so23204105wrm.1
        for <asahi@lists.linux.dev>; Tue, 06 Dec 2022 04:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=0ySQbkSreu/o4LKch+y/kG/pmMACNWkp0dBF4FOaWtPWZabRnsGxfcXoUZfRB8qfJO
         6H4zgxTNsOFi+lcX5mvmav2lgSLN233Rl/0MV3OJHVUCxFTuWfgTsYPWVxMEvUJObB7r
         TCus4Faoqls9BuMFvJrcgcfB+SkUBv47a5Nb3g0WqiKEqijorTLpiWAhsKurEDd7paIL
         7w5zFbmPY+7/dfdNRUR1PzOjPxL096s61e1oAGMcQLLuaB93eypZRsDLOZXUTtLtl0lL
         jhDaRmNbJAqMVE5iVlDqQJQk1xFRh2TQ26VMyP0LYub1oJyWXHYyckqZwSo74FV6Ch30
         KcRg==
X-Gm-Message-State: ANoB5plfIua7egP+xQkR0elZsZtC5VchFvn0SvIvKivo6oNFAPKtDw89
	i5znK/6Ly+4WncXKwmCaTa4=
X-Google-Smtp-Source: AA0mqf5vnMke5iP0dUngAq2ItZpKcfdOhKPZ1a6dxhMgKyIK84HTvZS9FvB2xL8d8jmlABpJmIw/cw==
X-Received: by 2002:adf:ef06:0:b0:242:73cd:1107 with SMTP id e6-20020adfef06000000b0024273cd1107mr2301812wro.250.1670328913637;
        Tue, 06 Dec 2022 04:15:13 -0800 (PST)
Received: from [10.100.102.14] (46-116-236-159.bb.netvision.net.il. [46.116.236.159])
        by smtp.gmail.com with ESMTPSA id v7-20020adfe287000000b00241fea203b6sm16567634wri.87.2022.12.06.04.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 04:15:13 -0800 (PST)
Message-ID: <532fe3d8-391c-afee-13c0-b957eba409ab@grimberg.me>
Date: Tue, 6 Dec 2022 14:15:11 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] nvme-apple: fix controller shutdown in
 apple_nvme_disable
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: James Smart <james.smart@broadcom.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-2-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221129132208.4337-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
