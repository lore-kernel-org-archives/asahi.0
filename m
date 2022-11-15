Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB65AD47
	for <asahi@lists.linux.dev>; Tue, 15 Nov 2022 14:03:14 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z14so24284758wrn.7
        for <asahi@lists.linux.dev>; Tue, 15 Nov 2022 06:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=ltwoALXwDwA9wa9WpJ6jHPX78P/zf2WmC/kCymbip7zjGez2PHmydFc0Xp3c8Kv2W0
         nNoaxMzJ6RO83vc5QroDM6LzI8Onw2mQ4PyYLLOQZTG3j/RjRTVd1tEzKMLa8DZ7MjYp
         GjKjNjb3hC0LOmILuBXvUa6jR0dybCjKtjD/47XCkUprEmX9chSy4FNCgPrefh1PrIcT
         vVzziQ2x0cH+vRmmA1yWXoyTVtzd+//ILiiM8B7AAWcVhzdmFtIiPaKl/Wu748Znr3jM
         GIC8Quvcqvrqgy2ieUN3ZEzvR3EvKDj6oACZE3pK4wkWMG8H7+fy90UvULrewLx5WYwm
         8v0g==
X-Gm-Message-State: ANoB5pnR409IllTy0YtTPtjQdvqh6a1HWbWE1HW1jWNQHL6MvTXRR9Kr
	yJ6rw+6Rd7cy/50G4wLaTlJlTLBNM9k=
X-Google-Smtp-Source: AA0mqf7p6p+ZDfvQqxKvM00NFSk1qyWznv4f0Wq4d8IJjf5nzpY6+H/qJUAFTc9lREV4+ZTPg6+Dmw==
X-Received: by 2002:a05:6000:693:b0:241:8643:af8e with SMTP id bo19-20020a056000069300b002418643af8emr7098662wrb.406.1668520992631;
        Tue, 15 Nov 2022 06:03:12 -0800 (PST)
Received: from [192.168.64.94] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c2f0800b003c701c12a17sm20936606wmn.12.2022.11.15.06.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 06:03:11 -0800 (PST)
Message-ID: <8d8c508e-c1bc-688c-2c2f-39f41aa5ad4c@grimberg.me>
Date: Tue, 15 Nov 2022 16:03:09 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] nvme: rename the queue quiescing helpers
To: Christoph Hellwig <hch@lst.de>, kbusch@kernel.org,
 james.smart@broadcom.com, kch@nvidia.com, marcan@marcan.st,
 sven@svenpeter.dev
Cc: asahi@lists.linux.dev, linux-nvme@lists.infradead.org
References: <20221115102346.1641696-1-hch@lst.de>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221115102346.1641696-1-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
