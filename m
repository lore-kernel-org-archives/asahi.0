Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97241917E7
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744564025; cv=none; b=fsn+CJSeBtQkWo1lhZ3jdB92gegl8k76flUn5IW5H3tZ/0BxfcABZXn4ziOd6zaLCVyKRdj6sFyMcya4q0Znz4MAkufXPB9qbwx51MmQkVkVjKXMVHAD8NzmCoCkCHJfW5g+wXvMYlollLPR2z5CZlXiazDscf0DopAYzJCSIsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744564025; c=relaxed/simple;
	bh=nXufBv2d9pq7C949AzMIVQxPJIQqZJ31lPxfJIooLrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pms1f7W4GTF0BgmpG2KOAuUuDz+ThZVsyrb9P7A+sIvIWxHPNcFXWYu3qtDv4O3J+zN+sl1tSPLbQ8imZaKEq0NdArh3VvV1rUttdVY3nv1XQQrX/MgQF7rqgmZipammzwFqGza6FN60U0y+aEdCWD/tMHCq4RzNC8EQJMeXjUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PHZCslBV; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PHZCslBV"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b03bc416962so2426420a12.0
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 10:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564023; x=1745168823; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AEElue2tYW/hBjcRseiSqCB01x22XFA+AuPsh/D6E9s=;
        b=PHZCslBVle1EumLX1zTcCelHwgtOSsiOrr4Aju1YaM18hs8EVR2GOQD2qmDqEKdW1F
         w1HV8x087ECKcdy/E4xbnbMAPdaJpn/Ep1xOdENqsExD8r2R9y7kGl6vydqFcA9asjDZ
         v8BudfvbCZXS9dsHorgXaazE1RYlCnAS/CICLAYCiynKq+92L5kN1fdINqsORy2amypR
         DBb/LgPEFG+Y6miqqdEeNkDD1ZChv4jYANZYJGrtFXYHX8ycgObDP4pAJMOTe1e+uD6R
         kUxkWV3M1PevppgN31cRred1NdOlXxWG6WI5MvrcnU7zMotS0Mw6zfXpV2uNgG5dIs38
         9uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564023; x=1745168823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AEElue2tYW/hBjcRseiSqCB01x22XFA+AuPsh/D6E9s=;
        b=Tek4OULCkt22CpkulQ7UP1NLczMCg4O5vLjaEDVg05iPK2DhSki+7a/6B/lhdEukCr
         Il3JfX/RdKNRBpGFoCH8/A06xW/7uoxddpJDXFkBSzs3zgC71A0DOTBPkswWmLJxqa37
         C4ejVRP+qa3Mr+1ezE4R43If2iobAgvHNcIQKfUvDqFsPlLWKOOFLmzynzc+Bq8wsL1d
         1Jc2XuxBz9wdBv4wmeThZVtkCkoOxcbsuaSVRWwCFGDr2qBMx/w42Vf3FXQV7FNu5Rkh
         OM05rFGDYZxWlpgk7XF18g/b4Bh2QSyMVJ2U1k/DyanEQoipea6RTikPI4qmcV5fXKrU
         XIuw==
X-Forwarded-Encrypted: i=1; AJvYcCWXBspB1QFwVTMcvcIL9vVEhZm4rp2tGPcn8qfYf4P7cpe7kPGoxxF9a5WokfCgH99ePFPasA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOmliCKleluXjYwok/bROD9ej9h8XPcG2R+MTZZocBC+p6krv3
	nXK3mRTpePI7u3WMCYt1ffY2qrEGpBgbjDKwTVio5IEoCtcLJ30MGEwt1SXtdg==
X-Gm-Gg: ASbGncveKmCuW22lBJHnfZgvDsb4RfavJBz78d2i7DHi3tIbSX+WHejYHDVjzXVCsHV
	uXwxYs93DzJi9earKjjpS7B6uM0g+oWgt9wZDVi+wJIsM94yQyo61Xd0YRYmbPJb4D1X7oIxDud
	ZBsjDzRQVX+iU/C8ckklYsHncRxFaSJ/yIfRwVv49S5ywNKF9wJIegDufI1EvHY+k6RpQ1wcStd
	BiS4yKaAQCqZ0rgrL1H2/7aeKk7UIYukvIgQgOsvKP+6xHVa042okzMr8NzHq8A9UG126BYACF9
	d3txAc/VLpg+uu9TB04/rXy48OTtd53DLy3hizXFI++H3MlVoFC2
X-Google-Smtp-Source: AGHT+IFzcTIcJAVCdciwF5W12Gs6hhpKts4y4tqwIfl35r96ytiQ8WM9loQM2BZkZ8y249PrujZoeg==
X-Received: by 2002:a17:90b:5245:b0:2ff:796b:4d05 with SMTP id 98e67ed59e1d1-308236640a9mr15187310a91.11.1744564022954;
        Sun, 13 Apr 2025 10:07:02 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95c35sm85022145ad.143.2025.04.13.10.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:07:02 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:36:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 05/13] PCI: apple: Move over to standalone probing
Message-ID: <mcb56cuupmguo3eeinj5b2bk67aki4optle5ht2hu7a5eskpxu@qmngxpm2lmrn>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-6-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-6-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:05AM +0100, Marc Zyngier wrote:
> Now that we have the required infrastructure, split the Apple PCIe
> setup into two categories:
> 
> - stuff that has to do with PCI setup stays in the .init() callback
> 
> - stuff that is just driver gunk (such as MSI setup) goes into a
>   probe routine, which will eventually call into the host-common
>   code
> 
> The result is a far more logical setup process.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 54 ++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 842f8cee7c868..d07e488051290 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -730,35 +730,15 @@ static void apple_pcie_disable_device(struct pci_host_bridge *bridge, struct pci
>  
>  static int apple_pcie_init(struct pci_config_window *cfg)
>  {
> +	struct apple_pcie *pcie = cfg->priv;
>  	struct device *dev = cfg->parent;
> -	struct platform_device *platform = to_platform_device(dev);
>  	struct device_node *of_port;
> -	struct apple_pcie *pcie;
>  	int ret;
>  
> -	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> -	if (!pcie)
> -		return -ENOMEM;
> -
> -	pcie->dev = dev;
> -
> -	mutex_init(&pcie->lock);
> -
> -	pcie->base = devm_platform_ioremap_resource(platform, 1);
> -	if (IS_ERR(pcie->base))
> -		return PTR_ERR(pcie->base);
> -
> -	cfg->priv = pcie;
> -	INIT_LIST_HEAD(&pcie->ports);
> -
> -	ret = apple_msi_init(pcie);
> -	if (ret)
> -		return ret;
> -
>  	for_each_available_child_of_node(dev->of_node, of_port) {
>  		ret = apple_pcie_setup_port(pcie, of_port);
>  		if (ret) {
> -			dev_err(pcie->dev, "Port %pOF setup fail: %d\n", of_port, ret);
> +			dev_err(dev, "Port %pOF setup fail: %d\n", of_port, ret);
>  			of_node_put(of_port);
>  			return ret;
>  		}
> @@ -778,14 +758,40 @@ static const struct pci_ecam_ops apple_pcie_cfg_ecam_ops = {
>  	}
>  };
>  
> +static int apple_pcie_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct apple_pcie *pcie;
> +	int ret;
> +
> +	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> +	if (!pcie)
> +		return -ENOMEM;
> +
> +	pcie->dev = dev;
> +	pcie->base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(pcie->base))
> +		return PTR_ERR(pcie->base);
> +
> +	mutex_init(&pcie->lock);
> +	INIT_LIST_HEAD(&pcie->ports);
> +	dev_set_drvdata(dev, pcie);
> +
> +	ret = apple_msi_init(pcie);
> +	if (ret)
> +		return ret;
> +
> +	return pci_host_common_init(pdev, &apple_pcie_cfg_ecam_ops);
> +}
> +
>  static const struct of_device_id apple_pcie_of_match[] = {
> -	{ .compatible = "apple,pcie", .data = &apple_pcie_cfg_ecam_ops },
> +	{ .compatible = "apple,pcie" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, apple_pcie_of_match);
>  
>  static struct platform_driver apple_pcie_driver = {
> -	.probe	= pci_host_common_probe,
> +	.probe	= apple_pcie_probe,
>  	.driver	= {
>  		.name			= "pcie-apple",
>  		.of_match_table		= apple_pcie_of_match,
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
