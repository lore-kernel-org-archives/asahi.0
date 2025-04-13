Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362CA155316
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 17:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744563800; cv=none; b=YiIAFQwl9BszBsXB8MGKJJnrMW0kt732G7T+8rkIPROWeiDW1hqMxOnT37zWIaiEWDvmclAJOG2HeC1ucKmB3I7K/019UGpAv8CfHdiiQU1317VGDEQhsGw/R3fsO74j+VQsXjbe1oq83DcPoje/iPRDNMR/Vn7r6bpZmHVEKb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744563800; c=relaxed/simple;
	bh=zL3lvGzcYuFWV3PVKJI1WXLSGN206sUiu1Zj32cTe2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yy/5nBsYCZG4sc+dJtIBqN6S6VwC1wStD1XJjdsU9c+KjCLbf7tnFq0u24CcyX1YXkJPFFBQtjy0mAESVagP/2RaRmrye9C8lt1Z+JLIeLfzKSo06vn8Zhj1E1fSj3ZGOE5G6QLVbbr5ip6Ybcc8ZQoQPAR7lG9oVHx3RFe524I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mZqNQ+u9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mZqNQ+u9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7399838db7fso3346298b3a.0
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 10:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744563798; x=1745168598; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8KYqWXMPG9QT4+d9/EIsutHTMWrOQHXovJYmJ2amFCQ=;
        b=mZqNQ+u9ugXd+qDZU8ksCvmHoRqGY/A/AYuhSH3h7xKCg0h9Q+uNaRAfJk4ltXHdsd
         QlJbIbQraYitSl8W0zA7yW/YBiXWhfiKTSk0RJx3vTIpyZsAaytU4CP7j/DYxxrztpUg
         Iqy8X4OLnfU4VZys/uothSIHizNFIpY1H9MIuPxzd1Gv/v80nXYs4hPpDqj9ceaYFRGS
         CwUJku6ySa8GuUC5BA8r+I38Tgk7Qt7inSPJ9r6L8ohtq55h0xitsAXzd+L6JVNcTOZ0
         dEU6xslHR2GvsQMDIuva0pvfJ58JXwA2jNzggAaCi3XbgqHrfPkX/1VFSZxZLzq4ZVn3
         C4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744563798; x=1745168598;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KYqWXMPG9QT4+d9/EIsutHTMWrOQHXovJYmJ2amFCQ=;
        b=Gp8a4KvLhL3Ob8Ie/y6Mht1rg7kyNIGqKOTCY2PsL/zsoJGJT7vp4MtcjBKnDTmvRo
         gIdmfnbCFJd/VkgCSL97Kf5Upeq+BtjpVGq4g8kpIrDhpz902eA3XVSdQDHoSVvfrfIO
         WPIsf9CGZS4iiMsfsmtWbm/4kLX5WJw++GqB6Cbfo2/G+g6H+atQD7WAFu7qfBqZK/AS
         y0FXLNBcspBOebEMb+q5mY7WItuLDnbGQ8R6xxDMRSv998IcCHR8vZy+O79ZlPrlj/P5
         yUgVAp8tL0riFYRg2/062nC3/8jb8egP+C5FhamZY2VxPMHj7Kj4v5FnzSGK0gEsTJZO
         bnoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVofpjjKj0QYZO8n1HRch5j1ETOIEbrqPY95YD5An7cokM+YBhzQnm7q+hVqnLIfJO6gy+FyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8MWvhHi/Ik6M6iomAgUxFDJwbU40UDtSEo3dk1sswJOOueEvW
	/xbDdKcleFcvp9ZP4QeG+gzBM3j7SZHTbEpD665aUwJ7kgbXJjr6iLHRI8lKSg==
X-Gm-Gg: ASbGncvN/hVfiwYPkz853K7jJEe+FrClPEIQvRmayqFM2te9XOcoM2T7ngPkoBSDqSq
	3BvHZ2arKef7sF7Mj/RQ3pGNmu+RORvWFS/9pvOsb/ksCjkNLPMtBGVXGxj6hS3Lx5dxA82uo6e
	4LAC4jwNkNPYALqDXipCu2Mxru8IrkuBYl4M3BNrtPs5rQNpYxR91eoaIjDee20GF1+pZqaF0mh
	pgcokO0+MYRGB3jW74rVbbyau8D4TOAL+NebtLnUJfwGxYHPytaz+Kqw3YbrHvDeUcUBPGy2DBH
	9HXgB8u+UZl+XmKRP5V56jU2E96eR3s9WXcL/9Ijp+BPcIKJOpkH
X-Google-Smtp-Source: AGHT+IHJl9qy9zlA671Ghf76u4hAfg8o0WkGbqOTRDuANRuFVtoUszAvnmcGPP3MsPAP/4ftUIljgw==
X-Received: by 2002:a05:6a20:c995:b0:1f0:e2b9:d163 with SMTP id adf61e73a8af0-2016a1cfeacmr20268545637.12.1744563798241;
        Sun, 13 Apr 2025 10:03:18 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a08180e2sm8053734a12.14.2025.04.13.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:03:17 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:33:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 03/13] PCI: host-generic: Extract an ecam bridge
 creation helper from pci_host_common_probe()
Message-ID: <bgawumksxn3dbiwu6oeifte4wxcwqed63x5kkvgyeg4emtfqmz@biaouwkqsag5>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-4-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-4-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:03AM +0100, Marc Zyngier wrote:
> pci_host_common_probe() is an extremely userful helper, as it
> abstracts away most of the gunk that a "mostly-ECAM-compliant"
> device driver needs.
> 
> However, it is structured as a probe function, meaning that a lot
> of the driver-specific setup has to happen in a .init() callback,
> after the bridge and config space have been instantiated.
> 
> This is a bit awkward, and results in a number of convolutions
> that could be avoided if the host-common code was more like
> a library.
> 
> Introduce a pci_host_common_init() helper that does exactly that,
> taking the platform device and a struct pci_ecam_op as parameters.
> 
> This can then be called from the probe routine, and a lot of the
> code that isn't relevant to PCI setup moved away from the .init()
> callback. This also removes the dependency on the device match
> data, which is an oddity.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pci-host-common.c | 24 ++++++++++++++++--------
>  include/linux/pci-ecam.h                 |  2 ++
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index f441bfd6f96a8..466a1e6a7ffcd 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -49,23 +49,17 @@ static struct pci_config_window *gen_pci_init(struct device *dev,
>  	return cfg;
>  }
>  
> -int pci_host_common_probe(struct platform_device *pdev)
> +int pci_host_common_init(struct platform_device *pdev,
> +			 const struct pci_ecam_ops *ops)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct pci_host_bridge *bridge;
>  	struct pci_config_window *cfg;
> -	const struct pci_ecam_ops *ops;
> -
> -	ops = of_device_get_match_data(&pdev->dev);
> -	if (!ops)
> -		return -ENODEV;
>  
>  	bridge = devm_pci_alloc_host_bridge(dev, 0);
>  	if (!bridge)
>  		return -ENOMEM;
>  
> -	platform_set_drvdata(pdev, bridge);
> -
>  	of_pci_check_probe_only();
>  
>  	/* Parse and map our Configuration Space windows */
> @@ -73,6 +67,8 @@ int pci_host_common_probe(struct platform_device *pdev)
>  	if (IS_ERR(cfg))
>  		return PTR_ERR(cfg);
>  
> +	platform_set_drvdata(pdev, bridge);
> +
>  	bridge->sysdata = cfg;
>  	bridge->ops = (struct pci_ops *)&ops->pci_ops;
>  	bridge->enable_device = ops->enable_device;
> @@ -81,6 +77,18 @@ int pci_host_common_probe(struct platform_device *pdev)
>  
>  	return pci_host_probe(bridge);
>  }
> +EXPORT_SYMBOL_GPL(pci_host_common_init);
> +
> +int pci_host_common_probe(struct platform_device *pdev)
> +{
> +	const struct pci_ecam_ops *ops;
> +
> +	ops = of_device_get_match_data(&pdev->dev);
> +	if (!ops)
> +		return -ENODEV;
> +
> +	return pci_host_common_init(pdev, ops);
> +}
>  EXPORT_SYMBOL_GPL(pci_host_common_probe);
>  
>  void pci_host_common_remove(struct platform_device *pdev)
> diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
> index 3a10f8cfc3ad5..bc2ca2c72ee23 100644
> --- a/include/linux/pci-ecam.h
> +++ b/include/linux/pci-ecam.h
> @@ -97,6 +97,8 @@ extern const struct pci_ecam_ops loongson_pci_ecam_ops; /* Loongson PCIe */
>  #if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
>  /* for DT-based PCI controllers that support ECAM */
>  int pci_host_common_probe(struct platform_device *pdev);
> +int pci_host_common_init(struct platform_device *pdev,
> +			 const struct pci_ecam_ops *ops);
>  void pci_host_common_remove(struct platform_device *pdev);
>  #endif
>  #endif
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
