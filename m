Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258A117C2
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 03:00:18 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so690590pji.0
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 19:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=toJd/fcNb+uduY98Ks9mGTZ8mQbRZSb6eNy6wEvg3UgkHBUOUdjJRNnI526Df/DijA
         HkjGVQccA5dpg49ZgfBDEglIpTx7x0vUHS+06k9WkBGpCZlkpZwpAVWTvd/iK5KMiYHP
         I8XTedvfbc6jP7r5juFMudjM2qYZTdDIjjFg436auR5uso0duY7qIAE2JaXQndBhPN2r
         fUgFdnkH0bMwfnew2OKEJ7uiKTdgp6UQqqWMrtqEB+JUNt4vMxSaJW38bg53WU6/5fte
         99xyiOwgh3uNJaMkjKBpAG0bPMUHYZwFQKN9mJXgeEpej072F+LCYyXkFMhCE26TVJnc
         BESg==
X-Gm-Message-State: ACrzQf1WmW7gD5sub7jis9AWS0/JPS+0TSwbc3kFkUSegAyKTKTYEKV/
	WLKoeLKdhXYwkWpCBSsMygs=
X-Google-Smtp-Source: AMsMyM4ee/mRlXt+Uwt+fwMqgPDYxoO/bkWtF32UcRS6ftK7eaQ0kAvdAJOBurb5MxTkzqAit8ncrA==
X-Received: by 2002:a17:902:db02:b0:187:4736:f783 with SMTP id m2-20020a170902db0200b001874736f783mr38362682plx.155.1667962817677;
        Tue, 08 Nov 2022 19:00:17 -0800 (PST)
Received: from [172.20.3.206] (69-170-33-158.static-ip.telepacific.net. [69.170.33.158])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902e88500b001885dbe31dfsm7671429plg.178.2022.11.08.19.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 19:00:17 -0800 (PST)
Message-ID: <d4d5317f-8ef9-cec9-9c9e-b05e44232ad5@grimberg.me>
Date: Wed, 9 Nov 2022 05:00:15 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 05/12] nvme-pci: move more teardown work to nvme_remove
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>
Cc: Chaitanya Kulkarni <kch@nvidia.com>, Gerd Bayer <gbayer@linux.ibm.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-6-hch@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221108150252.2123727-6-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
