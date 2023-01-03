Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D8C2561
	for <asahi@lists.linux.dev>; Tue,  3 Jan 2023 11:24:14 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso22871804wmb.0
        for <asahi@lists.linux.dev>; Tue, 03 Jan 2023 03:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aM19bk+2PSoO6lDFC0lZ/JmQltFQ351Ko7Fkp/8cpJg=;
        b=FvQ2z2GpdrHYPMRbQ7exRNu0TReI7Pd2G2HPrkGzBDACmtFIVcCMpb8ZAVWPAUwTc5
         tFq99Tq4nSj8/0edkuZsgJYewmQ94M7JljTMPSeXZIgh6XMpSyFvDq/GU+wmIJm1RtHl
         AynPkEolxmN0ZqqlYYVZMENvtrRq770f1Mwais801+EZecQvVHgO57gHiOoK1OOBlJbI
         nlYgG8qF1xGloAdsZRIV0lzuYkqsWrTTJlYGyeKqfo9hy5W/XQHCXduhS970HhwTXZNV
         +4oAAdYepQGhIT94dkcLSIcc/ThwVGrjfy9zPLwckVffBO/rvdcW9BiHYVyjWDaOY88W
         ycpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aM19bk+2PSoO6lDFC0lZ/JmQltFQ351Ko7Fkp/8cpJg=;
        b=yzaFgOhyUPfLDdKSFJC1t2HuF5Vbloct6GDh+7Y9kav5oqwMeyUgFb61obWZXmjmSr
         8TH4WDK+bbf8PtWn2U7fCY0KUEa1lzRUbyf+30fa5kgqplbJ3h/IGIy/WJV4+gP645+I
         v1KjlXzcGNzgTuelJjgQM4wccfAnQtG0zZI4HMYkpneQrlzeZGg+QivKePx6m5OohI0C
         Pr/vI0mg2eVpaQ+dLSbYbKZx6VszXTZapu0Oh4NolbQ5nibkdbcq/EJ1CB0voqG6C61i
         evw+kifcg4WUmhDH4CUodpsKfLS8DwbN+MjPUCbk1CxdPhqvOFNHVMRispgqRmjs8QR2
         TdDA==
X-Gm-Message-State: AFqh2kqSdDft2IU04X2AIOtLcEgr3+qYiDUNRDZIWs14cTOHVLFDnN5V
	2p/zV1PlIu1FXY81pl+ftRK9Yg==
X-Google-Smtp-Source: AMrXdXsu4u0wS962KDrqVuRXWqgErsy12KGEqrrdIuV/v8sTQ2HhnIDVP5FKAwi4HI638j+JyW33Lw==
X-Received: by 2002:a05:600c:a10:b0:3d5:64bf:ccb8 with SMTP id z16-20020a05600c0a1000b003d564bfccb8mr30880129wmp.12.1672745053251;
        Tue, 03 Jan 2023 03:24:13 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id r17-20020a05600c425100b003cffd3c3d6csm39874902wmm.12.2023.01.03.03.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 03:24:12 -0800 (PST)
Message-ID: <6b7d1e08-e27e-3f8a-5b08-ba622f206295@linaro.org>
Date: Tue, 3 Jan 2023 11:24:11 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] nvmem: core: Fix race in nvmem_register()
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Russell King <rmk+kernel@armlinux.org.uk>
References: <20221214142952.9372-1-marcan@marcan.st>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221214142952.9372-1-marcan@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Hector for the patch,


On 14/12/2022 14:29, Hector Martin wrote:
> nvmem_register() currently registers the device before adding the nvmem
> cells, which creates a race window where consumers may find the nvmem
> device (and not get PROBE_DEFERred), but then fail to find the cells and
> error out.
> 
> Move device registration to the end of nvmem_register(), to close the
> race.
> 
> Observed when the stars line up on Apple Silicon machines with the (not
> yet upstream, but trivial) spmi nvmem driver and the macsmc-rtc client:
> 
> [    0.487375] macsmc-rtc macsmc-rtc: error -ENOENT: Failed to get rtc_offset NVMEM cell
> 
> Fixes: eace75cfdcf7 ("nvmem: Add a simple NVMEM framework for nvmem providers")
> Signed-off-by: Hector Martin <marcan@marcan.st>

Missing Cc Stable

> ---
>   drivers/nvmem/core.c | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 321d7d63e068..d255feca5e17 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -837,20 +837,16 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
> 
>   	dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
> 
> -	rval = device_register(&nvmem->dev);
> -	if (rval)
> -		goto err_put_device;
> -
>   	if (nvmem->nkeepout) {
>   		rval = nvmem_validate_keepouts(nvmem);
>   		if (rval)
> -			goto err_device_del;
> +			return ERR_PTR(rval);

you can not do this as this will leak ida and nvmem itself.


>   	}
> 
>   	if (config->compat) {
>   		rval = nvmem_sysfs_setup_compat(nvmem, config);
>   		if (rval)
> -			goto err_device_del;
> +			return ERR_PTR(rval);

same here.

>   	}
> 
>   	if (config->cells) {
> @@ -867,19 +863,21 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   	if (rval)
>   		goto err_remove_cells;
> 
> +	rval = device_register(&nvmem->dev);
> +	if (rval)
> +		goto err_put_device;
> +
>   	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
> 
>   	return nvmem;
> 
> +err_put_device:
> +	put_device(&nvmem->dev);

this will free nvmem and further down you are going to de-reference the 
freed pointer.

--srini

>   err_remove_cells:
>   	nvmem_device_remove_all_cells(nvmem);
>   err_teardown_compat:
>   	if (config->compat)
>   		nvmem_sysfs_remove_compat(nvmem, config);
> -err_device_del:
> -	device_del(&nvmem->dev);
> -err_put_device:
> -	put_device(&nvmem->dev);
> 
>   	return ERR_PTR(rval);
>   }
> --
> 2.35.1
> 
