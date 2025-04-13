Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15801EE7A3
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744564570; cv=none; b=T34IDoDMqp2kxGQX+XVNMsF3L+lsXkUz3EDqm0HF4nz0TZEpMH9wKthEULSquZ8Tl6RUag1xuVwrv8zX2OIdFyUJC87a9rze9/OCZyQiqDuxLX5vencyM/BpFf9DjJobxZ+UAbg3B8A1SzJ/hw6DigGYm2uYz5Udh1L3vCaI+G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744564570; c=relaxed/simple;
	bh=ld04x8HZmKs9LHeWQuSl48zpWswhRqtdxOsfETxkkJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NY+8l6zQoKj3ZL8SvcBfZ2TfNvRlY14FH8ExEK251zIoqytktksOHPCf5wj8+WLf9AduHeumKvfJ8m5ihLt12vy3I55qzes3hoxsfSgAFonPPUnbA5Hv11mQVP+BYWoe8RiKhovqGTGoWT64kQKM3xOOYxtwGYadKi1Lo65aSM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ain0q+dm; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ain0q+dm"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-879d2e419b9so2916958a12.2
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564568; x=1745169368; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F4okzS3ojN6lnY5RLqGdFM+gAcZSW3E4D3okjWrQCtE=;
        b=ain0q+dm481LdPGO9EswgFxLc6fUALbewfQDe9dDjDCUm+bbQRzKHAbI0Ty/Zeb1kf
         bXzv/EghnwyfDYWSxUFxEE4VED4+HWdXfutjG2JkGPsmab06VDx4MNU2jd62IGdTwNvP
         KByUZf+JamfImF9Y4zBPaCttcjCdiXFQURNKnXilyqEjwsWqVoTS6E+aks5zIzuyYTUi
         InzphdAPgAauUy3tFdcKc5U9sjZiC85Igo5rEwbbqYQXqiBLvG/YdctzTyRrqMPuez/C
         81KnCUNvkvWPuGqf2MUxM2hoSnqPFpin6gOEBtdfAFk+k9e4JZ6ZiffwebHmTIDIWBEV
         ghHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564568; x=1745169368;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4okzS3ojN6lnY5RLqGdFM+gAcZSW3E4D3okjWrQCtE=;
        b=IJUV0xXz0/XCzjvLdXYu1MN7qr59BuxVcMGD4Qq9913l3aQbwQ++itxil1Uqx0MXo1
         08AMWxY77U9bl3YLV2F7beBcQeM2DjX0CnrRjjKyLBmYGGFxRlU+uZQxaQ+r6+xPMK2B
         nddQvQGe1ynCAhT3CuGzav3COZe7OsMtFvF7Zpa3A4m4ekWWEpCA5YUh9vFM5ekwH9hf
         qi2i5Bteaq27U1LZ0Stpfxcg+37ort54LCF+BNAL8vosy3s+dgTT7lCWZcp2j9NwLxwi
         6Q0meQKM6bd/L6MwtiguC2s0BPFyvNknfZwFRlH8qtvq7qyIWMmOyIehLoFOD6eYTbjd
         ALnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMyr6Ajno0tLYrN04b4fiub+ZUkmH18RpQ6TfiW1KNJPqUfklx7DkaEewf5fURWe2POsA9aA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOxPqrByz2BGkPlZdUCpFEOlgk95Or7a63zAI7Kqze49jG6Grk
	BaIc9rmp/yxoifk91VOwK0h0pyFucitjxi8oWkjdQAZ3vMwxkAUoB0XfT3211w==
X-Gm-Gg: ASbGnctdbvzlJQ4uS5qpZnNBY9Ok0Z+5gJZzmkXjBgG79CpKbTLHz4zjHYO2rOoLQ/H
	oUnUlPsT1NZyKBBIxQejuntO6gNrwxNt4LdLvEe/riLodaWIYmNHB26ZKr+1fdLsSSFTBUIJRLV
	rtK9jW+R8D4Wua8Zla/cAXKPqx8RM4JdRIspQahFnG+YBS7zd+Myb2jNAGHGefDE8C3umvSjPPA
	0fWALvhEqg72m6golFO102BalwcH1p8QcisvxY0yw7dJWsAWYKkHAADv4kK5PRSRoaju19/Dj9p
	FonkoZ4MulfC2JDkVVpVEdMsdcLrmLg7IbVDE2PViaA/MDFne/aYHQEgl8i6K1s=
X-Google-Smtp-Source: AGHT+IF3vhmu+FLpO8zsp8cPRlhnO7CmvXQvRW7kWOQy1JPST9WHz5upmUYj9aLgD93hoRV5zqzCaQ==
X-Received: by 2002:a17:90b:2b44:b0:2ff:6e72:b8e2 with SMTP id 98e67ed59e1d1-308237f2b39mr14281049a91.31.1744564567714;
        Sun, 13 Apr 2025 10:16:07 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd18580esm9724031a91.46.2025.04.13.10.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:16:07 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:46:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 09/13] PCI: apple: Move port PHY registers to their
 own reg items
Message-ID: <fvjlxc2gwhhs2sv5mbag7m43s5cbmuyygjvlynpkq2jd43bqlm@pcgwo3usbdyf>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-10-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-10-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:09AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> T602x PCIe cores move these registers around. Instead of hardcoding in
> another offset, let's move them into their own reg entries. This matches
> what Apple does on macOS device trees too.
> 
> Maintains backwards compatibility with old DTs by using the old offsets.
> 
> Note that we open code devm_platform_ioremap_resource_byname() to avoid
> error messages on older platforms with missing resources in the pcie
> node. ("pcie-apple 590000000.pcie: invalid resource (null)" on probe)
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 55 +++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 23d9f62bd2ad4..94c49611b74df 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -39,14 +39,18 @@
>  #define   CORE_RC_STAT_READY		BIT(0)
>  #define CORE_FABRIC_STAT		0x04000
>  #define   CORE_FABRIC_STAT_MASK		0x001F001F
> -#define CORE_LANE_CFG(port)		(0x84000 + 0x4000 * (port))
> -#define   CORE_LANE_CFG_REFCLK0REQ	BIT(0)
> -#define   CORE_LANE_CFG_REFCLK1REQ	BIT(1)
> -#define   CORE_LANE_CFG_REFCLK0ACK	BIT(2)
> -#define   CORE_LANE_CFG_REFCLK1ACK	BIT(3)
> -#define   CORE_LANE_CFG_REFCLKEN	(BIT(9) | BIT(10))
> -#define CORE_LANE_CTL(port)		(0x84004 + 0x4000 * (port))
> -#define   CORE_LANE_CTL_CFGACC		BIT(15)
> +
> +#define CORE_PHY_DEFAULT_BASE(port)	(0x84000 + 0x4000 * (port))
> +
> +#define PHY_LANE_CFG			0x00000
> +#define   PHY_LANE_CFG_REFCLK0REQ	BIT(0)
> +#define   PHY_LANE_CFG_REFCLK1REQ	BIT(1)
> +#define   PHY_LANE_CFG_REFCLK0ACK	BIT(2)
> +#define   PHY_LANE_CFG_REFCLK1ACK	BIT(3)
> +#define   PHY_LANE_CFG_REFCLKEN		(BIT(9) | BIT(10))
> +#define   PHY_LANE_CFG_REFCLKCGEN	(BIT(30) | BIT(31))
> +#define PHY_LANE_CTL			0x00004
> +#define   PHY_LANE_CTL_CFGACC		BIT(15)
>  
>  #define PORT_LTSSMCTL			0x00080
>  #define   PORT_LTSSMCTL_START		BIT(0)
> @@ -146,6 +150,7 @@ struct apple_pcie_port {
>  	struct apple_pcie	*pcie;
>  	struct device_node	*np;
>  	void __iomem		*base;
> +	void __iomem		*phy;
>  	struct irq_domain	*domain;
>  	struct list_head	entry;
>  	unsigned long		*sid_map;
> @@ -476,26 +481,26 @@ static int apple_pcie_setup_refclk(struct apple_pcie *pcie,
>  	if (res < 0)
>  		return res;
>  
> -	rmw_set(CORE_LANE_CTL_CFGACC, pcie->base + CORE_LANE_CTL(port->idx));
> -	rmw_set(CORE_LANE_CFG_REFCLK0REQ, pcie->base + CORE_LANE_CFG(port->idx));
> +	rmw_set(PHY_LANE_CTL_CFGACC, port->phy + PHY_LANE_CTL);
> +	rmw_set(PHY_LANE_CFG_REFCLK0REQ, port->phy + PHY_LANE_CFG);
>  
> -	res = readl_relaxed_poll_timeout(pcie->base + CORE_LANE_CFG(port->idx),
> -					 stat, stat & CORE_LANE_CFG_REFCLK0ACK,
> +	res = readl_relaxed_poll_timeout(port->phy + PHY_LANE_CFG,
> +					 stat, stat & PHY_LANE_CFG_REFCLK0ACK,
>  					 100, 50000);
>  	if (res < 0)
>  		return res;
>  
> -	rmw_set(CORE_LANE_CFG_REFCLK1REQ, pcie->base + CORE_LANE_CFG(port->idx));
> -	res = readl_relaxed_poll_timeout(pcie->base + CORE_LANE_CFG(port->idx),
> -					 stat, stat & CORE_LANE_CFG_REFCLK1ACK,
> +	rmw_set(PHY_LANE_CFG_REFCLK1REQ, port->phy + PHY_LANE_CFG);
> +	res = readl_relaxed_poll_timeout(port->phy + PHY_LANE_CFG,
> +					 stat, stat & PHY_LANE_CFG_REFCLK1ACK,
>  					 100, 50000);
>  
>  	if (res < 0)
>  		return res;
>  
> -	rmw_clear(CORE_LANE_CTL_CFGACC, pcie->base + CORE_LANE_CTL(port->idx));
> +	rmw_clear(PHY_LANE_CTL_CFGACC, port->phy + PHY_LANE_CTL);
>  
> -	rmw_set(CORE_LANE_CFG_REFCLKEN, pcie->base + CORE_LANE_CFG(port->idx));
> +	rmw_set(PHY_LANE_CFG_REFCLKEN, port->phy + PHY_LANE_CFG);
>  	rmw_set(PORT_REFCLK_EN, port->base + PORT_REFCLK);
>  
>  	return 0;
> @@ -515,6 +520,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	struct platform_device *platform = to_platform_device(pcie->dev);
>  	struct apple_pcie_port *port;
>  	struct gpio_desc *reset;
> +	struct resource *res;
> +	char name[16];
>  	u32 stat, idx;
>  	int ret, i;
>  
> @@ -542,10 +549,22 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  
>  	raw_spin_lock_init(&port->lock);
>  
> -	port->base = devm_platform_ioremap_resource(platform, port->idx + 2);
> +	snprintf(name, sizeof(name), "port%d", port->idx);
> +	res = platform_get_resource_byname(platform, IORESOURCE_MEM, name);
> +	if (!res)
> +		res = platform_get_resource(platform, IORESOURCE_MEM, port->idx + 2);
> +
> +	port->base = devm_ioremap_resource(&platform->dev, res);
>  	if (IS_ERR(port->base))
>  		return PTR_ERR(port->base);
>  
> +	snprintf(name, sizeof(name), "phy%d", port->idx);
> +	res = platform_get_resource_byname(platform, IORESOURCE_MEM, name);
> +	if (res)
> +		port->phy = devm_ioremap_resource(&platform->dev, res);
> +	else
> +		port->phy = pcie->base + CORE_PHY_DEFAULT_BASE(port->idx);
> +
>  	rmw_set(PORT_APPCLK_EN, port->base + PORT_APPCLK);
>  
>  	/* Assert PERST# before setting up the clock */
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
