Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B3C7C
	for <asahi@lists.linux.dev>; Mon,  5 Dec 2022 14:05:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34A9F23A;
	Mon,  5 Dec 2022 06:05:09 -0800 (PST)
Received: from [10.57.71.118] (unknown [10.57.71.118])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 222003F71A;
	Mon,  5 Dec 2022 06:05:00 -0800 (PST)
Message-ID: <71dbee25-8b93-a306-d7a1-abc17d1d7273@arm.com>
Date: Mon, 5 Dec 2022 14:04:57 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] iommu: dart: Add suspend/resume support
Content-Language: en-GB
To: Hector Martin <marcan@marcan.st>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221205100907.10230-1-marcan@marcan.st>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20221205100907.10230-1-marcan@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-12-05 10:09, Hector Martin wrote:
> We need to save/restore the TCR/TTBR registers, since they are lost
> on power gate.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>   drivers/iommu/apple-dart.c | 50 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 4f4a323be0d0..ed524765ad87 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -121,6 +121,9 @@ struct apple_dart {
>   
>   	struct iommu_group *sid2group[DART_MAX_STREAMS];
>   	struct iommu_device iommu;
> +
> +	u32 save_tcr[DART_MAX_STREAMS];
> +	u32 save_ttbr[DART_MAX_STREAMS][DART_MAX_TTBR];
>   };
>   
>   /*
> @@ -932,6 +935,50 @@ static const struct apple_dart_hw apple_dart_hw_t6000 = {
>   	.fmt = APPLE_DART2,
>   };
>   
> +#ifdef CONFIG_PM_SLEEP

Between DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr(), I think we should 
be able to allow full coverage without any explicit #ifdefs or other 
annotations now.

Cheers,
Robin.

> +static int apple_dart_suspend(struct device *dev)
> +{
> +	struct apple_dart *dart = dev_get_drvdata(dev);
> +	unsigned int sid, idx;
> +
> +	for (sid = 0; sid < DART_MAX_STREAMS; sid++) {
> +		dart->save_tcr[sid] = readl_relaxed(dart->regs + DART_TCR(sid));
> +		for (idx = 0; idx < DART_MAX_TTBR; idx++)
> +			dart->save_ttbr[sid][idx] =
> +				readl_relaxed(dart->regs + DART_TTBR(sid, idx));
> +	}
> +
> +	return 0;
> +}
> +
> +static int apple_dart_resume(struct device *dev)
> +{
> +	struct apple_dart *dart = dev_get_drvdata(dev);
> +	unsigned int sid, idx;
> +	int ret;
> +
> +	ret = apple_dart_hw_reset(dart);
> +	if (ret) {
> +		dev_err(dev, "Failed to reset DART on resume\n");
> +		return ret;
> +	}
> +
> +	for (sid = 0; sid < DART_MAX_STREAMS; sid++) {
> +		for (idx = 0; idx < DART_MAX_TTBR; idx++)
> +			writel_relaxed(dart->save_ttbr[sid][idx],
> +				       dart->regs + DART_TTBR(sid, idx));
> +		writel_relaxed(dart->save_tcr[sid], dart->regs + DART_TCR(sid));
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops apple_dart_pm_ops = {
> +	.suspend	= apple_dart_suspend,
> +	.resume		= apple_dart_resume,
> +};
> +#endif
> +
>   static const struct of_device_id apple_dart_of_match[] = {
>   	{ .compatible = "apple,t8103-dart", .data = &apple_dart_hw_t8103 },
>   	{ .compatible = "apple,t6000-dart", .data = &apple_dart_hw_t6000 },
> @@ -944,6 +991,9 @@ static struct platform_driver apple_dart_driver = {
>   		.name			= "apple-dart",
>   		.of_match_table		= apple_dart_of_match,
>   		.suppress_bind_attrs    = true,
> +#ifdef CONFIG_PM_SLEEP
> +		.pm			= &apple_dart_pm_ops,
> +#endif
>   	},
>   	.probe	= apple_dart_probe,
>   	.remove	= apple_dart_remove,
