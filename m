Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C794ADDAF
	for <asahi@lists.linux.dev>; Mon, 25 Dec 2023 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d4ef21007so4924445e9.0
        for <asahi@lists.linux.dev>; Mon, 25 Dec 2023 01:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703495595; x=1704100395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TrdeMIrGE3u9o6XM57Lyz4hMqa78rVLWqLPMcDlZVQ8=;
        b=PSZGyXr3mZ8BYq2D80x8LNYwBjhXcZznJhwl9J+wZaewWMXSQab2/083wBj96GNO7+
         1Vxu57uGHp/cazdDXThUuVsYB4TacnTYfnqmgdDFp4xoLRWsoDBWpZMs+w7XI7s5ntT3
         Q5BYD5L2JynjXspP91U0lfQVboa/Jtn4ZYbzp/P56UUKyqlufbJ1CwwgFEpH5gnegl9+
         t9JbH+RHJa23/JzvsD9rr0CV3fgrtf7AQZCE4h0jbgRSSY1VJ95zAN2mjj2AVUBUS0L9
         voH81fV1RjD4uuxXbgr1E80GMsyFFew97j9SD/kbQIJJPTq0GTlEehoR1Wjb+gMrG9/l
         35gw==
X-Gm-Message-State: AOJu0YwZO+mRwDkv6DlQpsxMaozK04W8OawqRZWUE4sPb1GpRzRIkYok
	aS9Su0rkTAwusHJBuBeqDjI=
X-Google-Smtp-Source: AGHT+IHg0ozdIbIMnzljlnhHRZn8FtFlKgS6gDIwUNNPT7SQ32rqbzDCTaH5vPnraMmnDS2252LLWA==
X-Received: by 2002:a5d:548c:0:b0:336:6414:4018 with SMTP id h12-20020a5d548c000000b0033664144018mr6518961wrv.4.1703495594996;
        Mon, 25 Dec 2023 01:13:14 -0800 (PST)
Received: from [192.168.64.172] (bzq-219-42-90.isdn.bezeqint.net. [62.219.42.90])
        by smtp.gmail.com with ESMTPSA id e18-20020a056000121200b0033629538fa2sm9869739wrx.18.2023.12.25.01.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Dec 2023 01:13:14 -0800 (PST)
Message-ID: <7100b7dc-25fd-4b4b-a30e-81237208961a@grimberg.me>
Date: Mon, 25 Dec 2023 11:13:11 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: don't set a virt_boundary unless needed
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: marcan@marcan.st, sven@svenpeter.dev, kbusch@kernel.org, axboe@kernel.dk,
 james.smart@broadcom.com, alyssa@rosenzweig.io, asahi@lists.linux.dev,
 linux-nvme@lists.infradead.org, kch@nvidia.com
References: <20231221084853.1175482-1-hch@lst.de>
 <155ec506-ede8-42c7-95f7-e8be32800a8d@grimberg.me>
 <20231221121746.GA17956@lst.de>
 <b4cee1fc-f115-40d6-9a16-3cb00691b98c@grimberg.me>
 <20231221124034.GA21682@lst.de>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20231221124034.GA21682@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


>> Exactly because its odd. Unless there is any benefit of using sgls in
>> admin commands lets not flag it per transport.
> 
> The other transports always and unconditionally use SGLs anyway.  With
> the virt boundary we're just adding extra checks to fail certain
> passthrough admin commands (the kernel will never generate those cases).

I just don't see the point of adding a per-transport flag. Either we
always enforce admin queue virt_boundary in the core because its not
important enough, or we always allow sgls and have pci set this flag
locally (given that only it has this quirk).
