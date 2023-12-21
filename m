Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D657317D
	for <asahi@lists.linux.dev>; Thu, 21 Dec 2023 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d377bd169so2132325e9.1
        for <asahi@lists.linux.dev>; Thu, 21 Dec 2023 04:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703161958; x=1703766758;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrurWDGMmLR3dnLwQACh6+frV3vciSUTYPCCJ8/Kc0k=;
        b=JO2Beng3P1or45K0yFzaifCwhsgeg4Tia7oyWrKVC/u3NheJsDRWuer8eZvhsrvNUR
         BG1tZstyMBUeOvrJ82NNFXioYdQG0FPIBfEz/kVXZ91F1qUTyyvbzy+NWTbHN+85iP0s
         bRreJ7w42PBSI3xs3bMPSUKEqJrizN4ib3OYOz4VNbzRH7F0rVgA6FwcPaiteEyrT4M9
         bnCg6G95HHn54cgyeOzgzprbiOOD3cTqLlNQ7G9Fx7cCiUuxenrXxkG4AkNg6mNK49t4
         Oua5IYkNzHHz9o0Z2nmBw6YnApQTP0Al8NpIgiOR6YgEHcAZaJlCUujXkdOtLdiu4T/J
         ZW5g==
X-Gm-Message-State: AOJu0Yw/IwRN19JIGPLzQX7QXI4hJ4NheZZvWkJLCZf0NvFhkPszVEaR
	DStL8QF1V+2NFqWYrxqjjFY=
X-Google-Smtp-Source: AGHT+IFl/jEU/tdq7o+jCw21MkqQ59VO8sv+tOGDk/IQsgycNY3bxHNL1CruchdLAhWYppv43kALgQ==
X-Received: by 2002:a05:600c:1c9d:b0:408:3836:525f with SMTP id k29-20020a05600c1c9d00b004083836525fmr26159648wms.1.1703161958244;
        Thu, 21 Dec 2023 04:32:38 -0800 (PST)
Received: from [10.100.102.14] (46-117-87-214.bb.netvision.net.il. [46.117.87.214])
        by smtp.gmail.com with ESMTPSA id g19-20020a05600c4ed300b0040c517d090esm11062143wmq.15.2023.12.21.04.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 04:32:37 -0800 (PST)
Message-ID: <b4cee1fc-f115-40d6-9a16-3cb00691b98c@grimberg.me>
Date: Thu, 21 Dec 2023 14:32:35 +0200
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
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20231221121746.GA17956@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/21/23 14:17, Christoph Hellwig wrote:
> On Thu, Dec 21, 2023 at 11:30:38AM +0200, Sagi Grimberg wrote:
>>
>>> NVMe PRPs are a pain and force the expensive virt_boundary checking on
>>> block layer, prevent secure passthrough and require scatter/gather I/O
>>> to be split into multiple commands which is problematic for the upcoming
>>> atomic write support.
>>
>> But is the threshold still correct? meaning for I/Os small enough the
>> device will have lower performance? I'm not advocating that we keep it,
>> but we should at least mention the tradeoff in the change log.
> 
> Chaitanya benchmarked it on the first generation of devices that
> supported SGLs.  On the only SGL-enabled device I have there is no
> performance penality for using SGLs on small transfer, but I'd love
> to see numbers from other setups.

Someone that cares should speak up I assume.
Still the change log should indicate that there is no threshold for
sgl/prp anymore.

>>> For nvme-rdma the virt boundary is always required, as RMDA MRs are just
>>> as dumb as NVMe PRPs.
>>
>> That is actually device dependent. The driver can ask for a pool of
>> mrs with type IB_MR_TYPE_SG_GAPS if the device supports IBK_SG_GAPS_REG.
>>
>> See from ib_srp.c:
>> --
>>         if (device->attrs.kernel_cap_flags & IBK_SG_GAPS_REG)
>>                  mr_type = IB_MR_TYPE_SG_GAPS;
>>          else
>>                  mr_type = IB_MR_TYPE_MEM_REG;
>> --
> 
> For that we'd need to support IB_MR_TYPE_SG_GAPS gaps first, which can
> be done as an incremental improvement.

You actually don't need anything afair, you just add this code and
stop setting the virt boundary.

>>>    +	/*
>>> +	 * nvme-apple always uses PRPs and thus needs to set a virt boundary.
>>> +	 */
>>> +	set_bit(NVME_CTRL_VIRT_BOUNDARY_IO, &anv->ctrl.flags);
>>> +	set_bit(NVME_CTRL_VIRT_BOUNDARY_ADMIN, &anv->ctrl.flags);
>>> +
>>
>> Why two flags? Why can't the core just always set the blk virt boundary
>> on the admin request queue?
> 
> It could, and given that the admin queue isn't performance critical it
> probably won't hurt in reality.  But why enforce a really weird limit
> on the queue if there is no reason for it?  The only transport that
> treats the admin queue different is PCIe, and that's just a spec
> oddity.

Exactly because its odd. Unless there is any benefit of using sgls in
admin commands lets not flag it per transport.
