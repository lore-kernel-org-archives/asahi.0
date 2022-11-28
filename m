Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECAA2F43
	for <asahi@lists.linux.dev>; Mon, 28 Nov 2022 11:35:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 1725841A36;
	Mon, 28 Nov 2022 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1669635334; bh=hyXKx7HbZbh1OMSF3dvWjbd4fGzY2Zym/5MX5O6YN6A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=iyCBNUfWw/lnVrg+wWFY5MRR/h/yEvOV9LAVVDjisiySPrhMaGasVJf4oNVnmy/T6
	 K8PmhIuJLsGNziyfAlzmFtsrZMXb5dOvLF1Yh7F/HQZoGz1sTX71vJcWucmwDPYbek
	 I/uJeLXioIJQgG0awpj0SB8ei/kjNEZxH/wB19ZaAuXZ1N4pgJctdGM6r6AO5qN+PA
	 fXa8TSUQzk/dn34mLozKSfCqCR7cWknGc3GS90d+PVfRvrpmIOw1b6sbWnpBM5v6Ww
	 lC+XfLRO2Y8cjFg88JLxmZdainrXQ/IR8glkLkoQtxx9Vi4cU8Qf3BHkhI2rNw3vjJ
	 AqvOzIQC1pFqw==
Message-ID: <19ef6b09-678c-cf9d-7f91-684e6d00e6a9@marcan.st>
Date: Mon, 28 Nov 2022 20:35:29 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] soc: apple: rtkit: Stop casting function pointer
 signatures
Content-Language: en-US
To: Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20221104154153.79373-1-sven@svenpeter.dev>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20221104154153.79373-1-sven@svenpeter.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/11/2022 00.41, Sven Peter wrote:
> Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/soc/apple/rtkit.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index ecc1a818b23d..fa3cda831d2b 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -922,8 +922,10 @@ int apple_rtkit_wake(struct apple_rtkit *rtk)
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_wake);
>  
> -static void apple_rtkit_free(struct apple_rtkit *rtk)
> +static void apple_rtkit_free(void *data)
>  {
> +	struct apple_rtkit *rtk = data;
> +
>  	mbox_free_channel(rtk->mbox_chan);
>  	destroy_workqueue(rtk->wq);
>  
> @@ -946,8 +948,7 @@ struct apple_rtkit *devm_apple_rtkit_init(struct device *dev, void *cookie,
>  	if (IS_ERR(rtk))
>  		return rtk;
>  
> -	ret = devm_add_action_or_reset(dev, (void (*)(void *))apple_rtkit_free,
> -				       rtk);
> +	ret = devm_add_action_or_reset(dev, apple_rtkit_free, rtk);
>  	if (ret)
>  		return ERR_PTR(ret);
>  

Applied to asahi-soc/soc, thanks!

- Hector
