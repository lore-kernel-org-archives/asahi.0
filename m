Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD96CE56D
	for <asahi@lists.linux.dev>; Mon, 25 Dec 2023 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33678b10a6eso654575f8f.0
        for <asahi@lists.linux.dev>; Mon, 25 Dec 2023 01:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703496038; x=1704100838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RfVrqt2734olqsQiYAdhKFpYTQ8WaXQ2R8q370Ut3XI=;
        b=MSMYUbD8fDB2Tn+oMqEYPzK4O+CiZuKcUpMbskU1eAptf07TrnPiuH1U+XYLRZYYTN
         zMZa9LwynmKgzly0pW2oYLAheE9FHgo0JJ0h5Lb3vSa6DebAx7Aj6+qEbl11zK0Q6BnX
         JIaYqZz34pjK3vmIKkOIKM4WYXA9mTOCvFlaPHH6/Ov3n8i56qRa8ykfLfuqkiV924Mf
         9nnlrB8C0Vfh0QatFUNEH+bjn+Vrt3souDk83ivudqzQuCre1iIQ+4cIfuVtAMVTuZe8
         /W8NnoV7ypAABrfzr3WYvR4sBtn3CtwxRqqmT6hEC/FABIb8Kbzd2DN4ijbHy9CplZDy
         58Ww==
X-Gm-Message-State: AOJu0Yx9PRELTDYCSWmBLXQQQ6bIpCMjKUsUGXFDnjBdblXnhp/smyvC
	GWnjZejUhUTeLOxkL7LyMJc=
X-Google-Smtp-Source: AGHT+IF2vI5ZpST5f3uf4EayUZBIV2vxqzdSbaFVa4+yajOCYOz5QOcmfMOup5POVUYjZuObohk/2g==
X-Received: by 2002:a05:600c:3584:b0:40d:5329:96a3 with SMTP id p4-20020a05600c358400b0040d532996a3mr3586405wmq.0.1703496037765;
        Mon, 25 Dec 2023 01:20:37 -0800 (PST)
Received: from [192.168.64.172] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id f11-20020a05600c154b00b0040d556513d0sm4129139wmg.39.2023.12.25.01.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Dec 2023 01:20:37 -0800 (PST)
Message-ID: <22aa64db-f282-446a-b905-f93b590e6e24@grimberg.me>
Date: Mon, 25 Dec 2023 11:20:35 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: don't set a virt_boundary unless needed
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: marcan@marcan.st, sven@svenpeter.dev, axboe@kernel.dk,
 james.smart@broadcom.com, alyssa@rosenzweig.io, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org, kch@nvidia.com
References: <20231221084853.1175482-1-hch@lst.de>
 <155ec506-ede8-42c7-95f7-e8be32800a8d@grimberg.me>
 <20231221121746.GA17956@lst.de> <ZYRv7Fo6oCHgETyk@kbusch-mbp>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <ZYRv7Fo6oCHgETyk@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>>>> NVMe PRPs are a pain and force the expensive virt_boundary checking on
>>>> block layer, prevent secure passthrough and require scatter/gather I/O
>>>> to be split into multiple commands which is problematic for the upcoming
>>>> atomic write support.
>>>
>>> But is the threshold still correct? meaning for I/Os small enough the
>>> device will have lower performance? I'm not advocating that we keep it,
>>> but we should at least mention the tradeoff in the change log.
>>
>> Chaitanya benchmarked it on the first generation of devices that
>> supported SGLs.  On the only SGL-enabled device I have there is no
>> performance penality for using SGLs on small transfer, but I'd love
>> to see numbers from other setups.
> 
> It's the larger transfers where it gets worse. To exaggerate the
> difference, consider send a 2MB write with virtually aligned but
> discontiguous user buffer: 512 folios.
> 
> PRP fits in 1 prp_page_pool block.
> 
> SGL needs 3 prp_page_pool blocks, tripling the command's memory usage.

My assumption was that in large transfers the memory overhead is
negligible and the controller dma streaming dominates the performance.
The threshold was for minimum transfer to use sgls.

In any event, I think that we are talking about theoretical gains/losses
here. Unless anyone shows a real loss here, we should go with the
simplicity.

Theoretically the driver could add incremental optimizations if the
request buffer can use either prp/sgl, but this is something that
should be explored with real device(s) performance measurements I think.
