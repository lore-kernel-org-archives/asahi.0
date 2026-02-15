Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5A5299923;
	Sun, 15 Feb 2026 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771157264; cv=none; b=TXublMcIXi6o8xArogaVHIqvKBzCePVZMpGSgp7Ga+/Guyx3odwGRtIYP5Dk0yIBSfwGWz30p/Ak474FpXmgSrQxfNl3FHkA6M5LCAT1LIpS1nNchrv3kbwNFOGMhlKQI5rKk7WBTLp5ZYiNWudZmpFhtH4HDuK7KCAZoNLOfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771157264; c=relaxed/simple;
	bh=k7ugLwn3LPki04cTpPzVHBiS+9XSBjUJIw3j6aEaPnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BmLJed8tca86zvEN1NoUJ+E+hU33SLf2A6owJozWJwpMVNmQhC/d+UBNvMRvQ/RmpG2GrFWHMGadev3MxrIWh2+I3Uh0gEJ9SC52wIMSeMJhFG9tD1ysHAKbjp0noWMDZwjWTbw7QKoOpAYo67fhdfNjdW7jfxPS9ZErbOhRmMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wgv7TrLN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wgv7TrLN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94721C4CEF7;
	Sun, 15 Feb 2026 12:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771157263;
	bh=k7ugLwn3LPki04cTpPzVHBiS+9XSBjUJIw3j6aEaPnQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wgv7TrLNr/wvsb7+FXoDuh8GSgUvzKtJ5MoAwGA1HLWdjmW7vF9Nic583ptw3dVZL
	 mqkSJ2wLF6xVyY5Hzh9/oudN88gVtyGSIrkZFlKmPk3xOPySgOQxBr2ffWLdfwgsRz
	 poSC9x3QXCa0zriwJHCeFRcJZBruVGUfn9T1xpdoOL7PnwYrMky3HBzF85tMzIgtXu
	 0bYLjNwft35+Fi8IiPePHTNFuHjEdEMZYf76UkpweTQrh9X8QZtdOUpHzGoi9efhpK
	 duZx64brw6jk34svlJx2LuubG4WmyK0c9uqmNnqZzkR3kePp4TM3s9RN3hMhAJ2jIv
	 qI0rARCh+MZ1g==
Message-ID: <02a35299-a7b9-4a52-abb2-372b19bee8fe@kernel.org>
Date: Sun, 15 Feb 2026 13:07:39 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH phy-next v2] phy: apple: apple: Use local variable for
 ioremap return value
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Dan Carpenter <dan.carpenter@linaro.org>, Vladimir Oltean <olteanv@gmail.com>
References: <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.02.26 09:02, Janne Grunau wrote:
> The indirection through the resources array is unnecessarily complicated
> and resuling in using IS_ERR() and PTR_ERR() on a valid address. A local
> variable for the devm_ioremap_resource() return value is both easier to
> read and matches expectations when reading code.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/asahi/aYXvX1bYOXtYCgfC@stanley.mountain/
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>

> Changes in v2:
> - Use a local variable instead of the complex indirection with the
>    resources array
> - Link to v1: https://lore.kernel.org/r/20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net
> ---
>   drivers/phy/apple/atc.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index dc867f368b68748ea953e594ad998d7f965d8d1d..64d0c3dba1cbb95f867d338da706225ee0bf79f7 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -2202,14 +2202,16 @@ static int atcphy_map_resources(struct platform_device *pdev, struct apple_atcph
>   		{ "pipehandler", &atcphy->regs.pipehandler, NULL },
>   	};
>   	struct resource *res;
> +	void __iomem *addr;
>   
>   	for (int i = 0; i < ARRAY_SIZE(resources); i++) {
>   		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resources[i].name);
> -		*resources[i].addr = devm_ioremap_resource(&pdev->dev, res);
> -		if (IS_ERR(resources[i].addr))
> -			return dev_err_probe(atcphy->dev, PTR_ERR(resources[i].addr),
> +		addr = devm_ioremap_resource(&pdev->dev, res);
> +		if (IS_ERR(addr))
> +			return dev_err_probe(atcphy->dev, PTR_ERR(addr),
>   					     "Unable to map %s regs", resources[i].name);
>   
> +		*resources[i].addr = addr;

This is much easier to understand. I missed return PTR_ERR(..) error in 
the first version and introduced it originally due to the indirection as 
well.



Best,


Sven


