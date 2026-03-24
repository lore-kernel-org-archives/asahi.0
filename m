Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033FB3CA4B1
	for <asahi@lists.linux.dev>; Tue, 24 Mar 2026 23:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774396565; cv=none; b=Cmwg+I3MFvD6jck3il5ODLJKXgvmPInUIafKuC6jEdpqb4RbF15rerHacl5PGphSXYiDsj2I6n64+nHdf1W5Mog39v5WyEuvEIzSW9Wj2kHdGTUYfHIP+SxgLxIJoFeexm6k/Pwjj+pGuj69IcMbK+RmQ+wurBZ0SdVBsxYqueU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774396565; c=relaxed/simple;
	bh=UKBJ+kC44eNkvuWbhFlfwNEO1faQhVzHZAchOf3nZhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JuD+jgI5MvqlA6QJqo7fyiOm1YFbSqkgXkT9cu27JiSNrZljHMUCfi44ZPsg/vGtUwKH/FtIQjItBVUUr5fFDPLHDWSyrAvqG67fI7bMij4d9ITvkwh4fsDwZqxMv8c/qxNKTmgcuJQNseQDFAqrodU/VKgtHycYbC1qSpOyNcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZ/f7xWl; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZ/f7xWl"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12a71ade78cso2419935c88.0
        for <asahi@lists.linux.dev>; Tue, 24 Mar 2026 16:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774396562; x=1775001362; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CGb7XwT6dZksneWtItSppfi6d0SJR5kEWJ5U/fM6W/0=;
        b=eZ/f7xWlxn59Ju1jJ6cFnrkRH0lL1Cy5jhRaUVwWZX5VGset9UafipW06JsnKQ0G+S
         MvXvGp6E/GXK5ATkkIUtgS9Scxu1jMp5ePoo4MVEoqz89YGrlrvZ8McGSkv66Hrs59Yz
         UhQYh6elbvsNp0NhHMyN6M9FGVNlVVJ0i4GRiXo+vpj8gLVtoL4YABFwrj7KGEeoq+bc
         M1uOo3JO1R4tdi4vxMw7zvVEyuv0LMQrEV0DVzEcZanWr5WOTy2ACnXxD0rOTFIdt5q9
         bWgY9IaHTW3ufNRxye4tVpKX8KYqFCtTb8VyKi13S04mmPp7Xt3ybM8KiJxhx5bDceV5
         cK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774396562; x=1775001362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGb7XwT6dZksneWtItSppfi6d0SJR5kEWJ5U/fM6W/0=;
        b=br0eEyee+eEs0iI152WI7QtrPPLXXHlzqHtINUIPqaUnRw/wJaMu+xiwCaRcpCai24
         bhKmf7+PVScKOTwVcrh9HZBKNkEI8DE/DkONa4vNiI0g+2Z87gS3AQvVh3phqX52OABm
         z0cMKP+hvxhMLF3bq0y+PRef3NYkvcTsd/i56+Yj4lOeymmE65+rfeOaU+mN1rnfYJCU
         /k4PUe9lwOzl8V9K1mJPBqfZikm2rzGgGC3anDDy7j8MBDrCbymHal78MZ3B/HMprMz8
         sld2D1jcbU8zPvAQOcBSVazAA5x4ZZJBcnNFVyBRf7Pwkh8j+Gw2IWeizyT6SRZk6m9T
         lEEw==
X-Forwarded-Encrypted: i=1; AJvYcCUlHjf67zWNsO/nRbTb34ar45KzLYSti/jJVklqgFUSK7aTWIXbILThttFTp0a/HIuZwjl0yQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2ljoQJuuUxDR2Df4fX7glQ9hM6FKk6JYi3oMr5sqxPey9BtBp
	/6oL1eYdAMUIczJh+Qjtrx1A3XO5d/2hq+ZMbaygjZ9V+iUzddmTPze2
X-Gm-Gg: ATEYQzymYuRfJD9H8zyRIAZlbcrcY/OvrsOYAUlDgp/8y8ejQVE7u248+JjhlGs7PSb
	EiZ6ByH3Swrw1kor5kIcUsWZ6ZO2DSXocxzVc789MdE+yZE0JjQv/vSVfUNU+6DeTJuDzd3AAWS
	apHz1hE1fXIkfXZf0X8/xcrRE0bjm0GmIOwIB9tNMzdqV7g/Su9HIIha6Re0Vi/C3o8IqEe9r5h
	QlcgWPlPoGQo6ykuGcl4GQjvlVKVpP4G/6JUumzoZQAZR5Ij9PUYzr8+IMu6IGLIQA/B3pfOOdV
	cW+t/1h3vj7WAvQIkDCOfxPRnfYKlI9qeYUQ8UYo1GzTh44A/B7aD/5sgUNc9dDYY5kISBMy/VY
	jETi6ejEJpMjU9CgIA1NKSjohRVO3iDwLlItYOp1bhKQIoO7ilTORYNpvR4nHi5FaZFIXPUiZ0W
	qcPoEMFg5CGcFruK2TLdj+NiT2yAdnWtU9YUtYpaEBnHtU7hxEuTRGV8DeUNHk4t9/s/Fg9bwT
X-Received: by 2002:a05:7022:688e:b0:123:3488:899c with SMTP id a92af1059eb24-12a96eff7c7mr646452c88.40.1774396562027;
        Tue, 24 Mar 2026 16:56:02 -0700 (PDT)
Received: from [10.69.65.75] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm11716427c88.0.2026.03.24.16.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 16:56:01 -0700 (PDT)
Message-ID: <945a3e98-ee75-453c-ae80-f3c9e3e57e58@gmail.com>
Date: Tue, 24 Mar 2026 16:55:29 -0700
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: Move nvme_setup_cmd before hot_pathing
To: hmi.jeon@samsung.com, "kbusch@kernel.org" <kbusch@kernel.org>,
 "axboe@kernel.dk" <axboe@kernel.dk>
Cc: "sven@kernel.org" <sven@kernel.org>, "j@jannau.net" <j@jannau.net>,
 "neal@gompa.dev" <neal@gompa.dev>, "hch@lst.de" <hch@lst.de>,
 "sagi@grimberg.me" <sagi@grimberg.me>,
 "justin.tee@broadcom.com" <justin.tee@broadcom.com>,
 "nareshgottumukkala83@gmail.com" <nareshgottumukkala83@gmail.com>,
 "paul.ely@broadcom.com" <paul.ely@broadcom.com>,
 "kch@nvidia.com" <kch@nvidia.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <CGME20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
 <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
Content-Language: en-US
From: Justin Tee <justintee8345@gmail.com>
In-Reply-To: <20260320052101epcms2p42ae135da60b36685e9b7fca6849b57a6@epcms2p4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Minsik,

 > diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
 > index e1bb4707183c..8ea37102a836 100644
 > --- a/drivers/nvme/host/fc.c
 > +++ b/drivers/nvme/host/fc.c
 > @@ -2762,14 +2762,14 @@ nvme_fc_queue_rq(struct blk_mq_hw_ctx *hctx,
 >         u32 data_len;
 >         blk_status_t ret;
 >
 > -       if (ctrl->rport->remoteport.port_state != FC_OBJSTATE_ONLINE ||
 > -           !nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
 > -               return nvme_fail_nonready_command(&queue->ctrl->ctrl, 
rq);
 > -
 >         ret = nvme_setup_cmd(ns, rq);
 >         if (ret)
 >                 return ret;
 >
 > +       if (ctrl->rport->remoteport.port_state != FC_OBJSTATE_ONLINE ||
 > +           !nvme_check_ready(&queue->ctrl->ctrl, rq, queue_ready))
 > +               return nvme_fail_nonready_command(&queue->ctrl->ctrl, 
rq);
 > +

__nvme_check_ready() checks for (nvme_req(req)->flags & 
NVME_REQ_USERCMD).  In nvme_setup_cmd(), nvme_clear_nvme_request() 
clears the nvme_req(req)->flags when RQF_DONTPREP is not set.

Is it possible that this patch would have nvme_setup_cmd() erase a 
nvme_req(req)’s NVME_REQ_USERCMD flag before __nvme_check_ready() is 
called for each respective .queue_rq?

Regards,
Justin Tee
