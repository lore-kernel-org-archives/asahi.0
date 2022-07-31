Received: from sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B188F17C4
	for <asahi@lists.linux.dev>; Sun, 31 Jul 2022 11:18:32 +0000 (UTC)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
	by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 9daaaf1c;
	Sun, 31 Jul 2022 13:11:50 +0200 (CEST)
Date: Sun, 31 Jul 2022 13:11:50 +0200 (CEST)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Hector Martin <marcan@marcan.st>
Cc: bmeng.cn@gmail.com, sven@svenpeter.dev, kettenis@openbsd.org,
	u-boot@lists.denx.de, asahi@lists.linux.dev, marcan@marcan.st
In-Reply-To: <20220731063131.38271-1-marcan@marcan.st> (message from Hector
	Martin on Sun, 31 Jul 2022 15:31:31 +0900)
Subject: Re: [PATCH] nvme: Do a clean NVMe shutdown
References: <20220731063131.38271-1-marcan@marcan.st>
Message-ID: <d3ce5fbdfc7c2e9b@bloch.sibelius.xs4all.nl>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Hector Martin <marcan@marcan.st>
> Date: Sun, 31 Jul 2022 15:31:31 +0900
> 
> The brute-force controller disable method can end up racing controller
> initilization and causing a crash when we shut down Apple ANS2 NVMe
> controllers. Do a proper controlled shutdown, which does block until
> things are quiesced properly. This is nicer in general for all
> controllers.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>

Tested-by: Mark Kettenis <kettenis@openbsd.org> [firefly-rk3399]

> ---
>  drivers/nvme/nvme.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/nvme/nvme.c b/drivers/nvme/nvme.c
> index a305305885ec..5fd2fb9ed6a6 100644
> --- a/drivers/nvme/nvme.c
> +++ b/drivers/nvme/nvme.c
> @@ -27,9 +27,8 @@
>  #define IO_TIMEOUT		30
>  #define MAX_PRP_POOL		512
>  
> -static int nvme_wait_ready(struct nvme_dev *dev, bool enabled)
> +static int nvme_wait_csts(struct nvme_dev *dev, u32 mask, u32 val)
>  {
> -	u32 bit = enabled ? NVME_CSTS_RDY : 0;
>  	int timeout;
>  	ulong start;
>  
> @@ -38,7 +37,7 @@ static int nvme_wait_ready(struct nvme_dev *dev, bool enabled)
>  
>  	start = get_timer(0);
>  	while (get_timer(start) < timeout) {
> -		if ((readl(&dev->bar->csts) & NVME_CSTS_RDY) == bit)
> +		if ((readl(&dev->bar->csts) & mask) == val)
>  			return 0;
>  	}
>  
> @@ -295,7 +294,7 @@ static int nvme_enable_ctrl(struct nvme_dev *dev)
>  	dev->ctrl_config |= NVME_CC_ENABLE;
>  	writel(dev->ctrl_config, &dev->bar->cc);
>  
> -	return nvme_wait_ready(dev, true);
> +	return nvme_wait_csts(dev, NVME_CSTS_RDY, NVME_CSTS_RDY);
>  }
>  
>  static int nvme_disable_ctrl(struct nvme_dev *dev)
> @@ -304,7 +303,16 @@ static int nvme_disable_ctrl(struct nvme_dev *dev)
>  	dev->ctrl_config &= ~NVME_CC_ENABLE;
>  	writel(dev->ctrl_config, &dev->bar->cc);
>  
> -	return nvme_wait_ready(dev, false);
> +	return nvme_wait_csts(dev, NVME_CSTS_RDY, 0);
> +}
> +
> +static int nvme_shutdown_ctrl(struct nvme_dev *dev)
> +{
> +	dev->ctrl_config &= ~NVME_CC_SHN_MASK;
> +	dev->ctrl_config |= NVME_CC_SHN_NORMAL;
> +	writel(dev->ctrl_config, &dev->bar->cc);
> +
> +	return nvme_wait_csts(dev, NVME_CSTS_SHST_MASK, NVME_CSTS_SHST_CMPLT);
>  }
>  
>  static void nvme_free_queue(struct nvme_queue *nvmeq)
> @@ -904,6 +912,13 @@ free_nvme:
>  int nvme_shutdown(struct udevice *udev)
>  {
>  	struct nvme_dev *ndev = dev_get_priv(udev);
> +	int ret;
> +
> +	ret = nvme_shutdown_ctrl(ndev);
> +	if (ret < 0) {
> +		printf("Error: %s: Shutdown timed out!\n", udev->name);
> +		return ret;
> +	}
>  
>  	return nvme_disable_ctrl(ndev);
>  }
> -- 
> 2.35.1
> 
> 
