Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F3F2F43
	for <asahi@lists.linux.dev>; Mon, 28 Nov 2022 11:35:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 82A7441A36;
	Mon, 28 Nov 2022 11:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1669635313; bh=xEcdu2K4hzKmkxDaxzkREF8TV43gjY/bcXwdVMPfj68=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PZmkBXVrpKuTJU1t5EVAMYQhiS9ett2X1MmRMlV70pD8tl+mngDQjbUG/s4xwC/8y
	 Y5VedcKvLHHP895+VJXn1bkLfaT9vguZ/02IyLnhg9snhAh4JIEt9D1GWGtDYu/DIU
	 QtjQF6GbXVkkjBQ+aDNv5AocZ9Nn4AgP12NmGUkrFMyJ1pC17k928vrTe7FquHP6vL
	 cbjp1qKuQlaKK+0lLNKvdvGbHiLzEPiIzIQlHSgCmNGtegODAr2Og9UsDVbdp3sXy6
	 VN/uAOo/MSKFZOSD2uN625+YRRYG8xxLW9ZGrvqnxtyq6QtiWDDPJfQc3YKH3wHr3f
	 x1toAkfhdw6Gg==
Message-ID: <d2ff74cc-9835-1573-73ca-d5eebf8f824c@marcan.st>
Date: Mon, 28 Nov 2022 20:35:08 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] soc: apple: sart: Stop casting function pointer
 signatures
Content-Language: en-US
To: Sven Peter <sven@svenpeter.dev>, Arnd Bergmann <arnd@arndb.de>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20221104153902.78999-1-sven@svenpeter.dev>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20221104153902.78999-1-sven@svenpeter.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/11/2022 00.39, Sven Peter wrote:
> Fixes: b170143ae111 ("soc: apple: Add SART driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/soc/apple/sart.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/apple/sart.c b/drivers/soc/apple/sart.c
> index 83804b16ad03..afa111736899 100644
> --- a/drivers/soc/apple/sart.c
> +++ b/drivers/soc/apple/sart.c
> @@ -164,6 +164,11 @@ static int apple_sart_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static void apple_sart_put_device(void *dev)
> +{
> +	put_device(dev);
> +}
> +
>  struct apple_sart *devm_apple_sart_get(struct device *dev)
>  {
>  	struct device_node *sart_node;
> @@ -187,7 +192,7 @@ struct apple_sart *devm_apple_sart_get(struct device *dev)
>  		return ERR_PTR(-EPROBE_DEFER);
>  	}
>  
> -	ret = devm_add_action_or_reset(dev, (void (*)(void *))put_device,
> +	ret = devm_add_action_or_reset(dev, apple_sart_put_device,
>  				       &sart_pdev->dev);
>  	if (ret)
>  		return ERR_PTR(ret);

Applied to asahi-soc/soc, thanks!

- Hector
