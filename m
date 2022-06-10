Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0C1636
	for <asahi@lists.linux.dev>; Fri, 10 Jun 2022 11:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6415FC34114;
	Fri, 10 Jun 2022 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654861579;
	bh=7EK7ta1CkGJt773OIwydlghYrh/L9WFuMuPQS/2Y14s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JsOjQGai86yOkS6mIA51g/YFuQDFIaHXM2D7o6CPg0DnsX50uCLTtOfVsQWhAdZK3
	 CcAZkOiNngSEiC/fsCTvXAqOrsRgD5rxxfp/COhW1SpwjPtjAxtkFig8TSGGD0fw+7
	 SIgDAQuAe/ckZmXiL643RpeEf1xzUfYZOa7Nww8s5oWns3BJfKSPUqOtHHu5FsKJYI
	 ova3/B/gC3hG2dXl90zTBFaXQ872eB2Bgo9+ow0+0eRmC1gHr2h4reFY12nQ6Jsq4U
	 EgW1XtnGGyBFo+jAwcJ267jQPKz89E0+1KJsQWea3oQEJAZikCGrst2BsjdDApmjZ0
	 r29NwKppHnhYw==
Date: Fri, 10 Jun 2022 17:16:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH] dmaengine: apple-admac: Fix compile warning
Message-ID: <YqMvBhoMRuLcO0lN@matsya>
References: <20220609184301.8242-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609184301.8242-1-povik+lin@cutebit.org>

On 09-06-22, 20:43, Martin Povišer wrote:
> Fix a warning of bad format specifier:

Patch title should describe the change and not the effect..
> 
>   drivers/dma/apple-admac.c: In function 'admac_cyclic_write_one_desc':
>   drivers/dma/apple-admac.c:209:26: warning: format '%x' expects argument of type 'unsigned int', but argument 7 has type 'long unsigned int' [-Wformat=]
>       209 |         dev_dbg(ad->dev, "ch%d descriptor: addr=0x%pad len=0x%zx flags=0x%x\n",
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---
> 
> Follow-up to the recent ADMAC series, feel free to squash:
> https://lore.kernel.org/asahi/20220531213615.7822-1-povik+lin@cutebit.org/T/#t
> 
>  drivers/dma/apple-admac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 2425069c186d..c502f8c3aca7 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -206,7 +206,7 @@ static void admac_cyclic_write_one_desc(struct admac_data *ad, int channo,
>  	/* If happens means we have buggy code */
>  	WARN_ON_ONCE(addr + tx->period_len > tx->buf_end);
>  
> -	dev_dbg(ad->dev, "ch%d descriptor: addr=0x%pad len=0x%zx flags=0x%x\n",
> +	dev_dbg(ad->dev, "ch%d descriptor: addr=0x%pad len=0x%zx flags=0x%lx\n",
>  		channo, &addr, tx->period_len, FLAG_DESC_NOTIFY);
>  
>  	writel_relaxed(addr,             ad->base + REG_DESC_WRITE(channo));
> -- 
> 2.33.0

-- 
~Vinod
