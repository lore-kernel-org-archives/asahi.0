Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEA91E882F
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 17:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744564201; cv=none; b=E7vVv4bEKCmBcoNr5PCjsyli6wHu1DL3t5ZUTTah1W5uHAFfRPsAH4xF6esZSOGA4ugkCV2XssOROG18W3as2jb+On91SfLcmpir6lc0iTX5MotCeB4227I/4vWnhtLiz78wpv/jvyGPgx1FC4mnfTXum32EPnG3939AJa/GbLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744564201; c=relaxed/simple;
	bh=VIDzddv+o5O40oGIPzcK+uFOnPDJBuCGtbfeOsXTDts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j/r/GvnFIZVRQ0ZDLEKMt6tqop85yUMU2WskNxQprVADlvzZlM1wfmL/Q/7xSrB0DiqZCO3dStVp2UxGLk6I/hi3ABlCTegNWGREn+RD1Vq6JZ2+nUeZwZfh0cDMvHLUPbPpmXldsWFbJP3A2Dqih9k4wxdMn7UiCOHCXgtoK+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YRvwAYt8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YRvwAYt8"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2260c91576aso28997865ad.3
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564198; x=1745168998; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VbsBH030YmmrPLiGCvxSobJgevOjlBmu917XLPcMgfY=;
        b=YRvwAYt8cKvgXq03sgQ0XqAg4R6HGHhWFlRUn23EMsSxHTjJXV4n9hnzo49OUXjamO
         7BQgfLAcA5okHBKwNjL3AD41KXec5QgBjmoZzyAXR1+N6f6EQQvEyiyuzFGjcOQ1O+m2
         IBMb1qw0DyDCNepMg8jhFLWCCvSYZBnC+fKIVTOAKAvwe6Eecmhlmq8T1oSvXFVuvT9l
         PI1gOoh4YsdZV67SMxskaLDxJQqz5TG4A2geUUCi139FuuM4Gisd5tfmeD4yKE3OmXjA
         qupVE3h7JjkzMUagK55QiY6xxku8z9sxgyE8GZTyJWZIvzqcw9jRQOkvHinV2tvs2iy2
         TzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564198; x=1745168998;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VbsBH030YmmrPLiGCvxSobJgevOjlBmu917XLPcMgfY=;
        b=hcCaeyd725t7FZjEuVwg1g25MJeoWoCld12moIKpDECKEXhE2J49B1TefTE74XgYeh
         GKfCoDX4Cvl2XDakjGT38twm5CXNSrPS2iVUCAxaiYrmvoHXjpp/6dPZ+yDndqv1PDmC
         lbKpACnWt9qyDYbHB0wuobq9uuR2Rpk8T8yu3XTpklagHhLnlTi8Hue+4TzEO+d8HrII
         rdCTF36IhCVf/OrfiUp5j+VzmEqqNjAT2AkTtIbZ75ve8/QTStsaP5Rp0u/WRSc1dLes
         ID/jn/I3n42o/WmY6vHTpUm4WFzmmCn07OzCTehe3sQ4O3uJ+cENACr0HMyUw1E6V7in
         Da6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwm1+BgrW/Fi30VcyF6NvogtAAOEeot4wfzOFJ4hmg2eFzj+9+5jJh4r+o4HPctZwWmuPLCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNI0zvvpHYCQSEum9xwiOtw+lGU/XJv8spU1Px3GDWf0l3I8NY
	HyBEaVb3WHqZs2NEzctEk8hRKVpz2YMtiwUTERbll/RCq94+WMhcRu6k0xnZbw==
X-Gm-Gg: ASbGncvRz25M1rmOX8YCh2c48uii9u/jgllo4/2NDfdizo/XJv6gTigTXmNju/40Yyv
	3ULDmR2HqL3uprWVFS9bSvUcyQhmfXuwrais63qJ6MZWUV4a0PGWleRTisNB1UwCSnZlzvHaZlB
	HxnDRkPiyYnJfOE2xsoqaiVm2vhxsTKLpoMYFn/acB5QmN371xmCGN8WCJq4qjmTIQ/kKMBZF2u
	AkUSfSD1Tc2OG2Jx5uX/aacaKjGKQ21N/rYp5KFJK4k/qo9unVkbJSDhw0ospELWPuTTPoWAdRN
	fjTZy5ArtYTVVdGmGJgANAm2qk7TQ8C02Gh3USUxy5Q38niAV7Cr
X-Google-Smtp-Source: AGHT+IEM5JXPlHa/46KPcgwjfAGRbntfwPEeRwa0pOWka95ljamo2KjNfPBab6Whg2HZjCAf5af8bg==
X-Received: by 2002:a17:902:f650:b0:223:37ec:63d3 with SMTP id d9443c01a7336-22bea4adeecmr130822495ad.18.1744564198505;
        Sun, 13 Apr 2025 10:09:58 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95c40sm84845325ad.127.2025.04.13.10.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:09:58 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:39:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 07/13] PCI: apple: Move away from INTMSK{SET,CLR} for
 INTx and private interrupts
Message-ID: <sbudn32sbw6d3z7n2yomlzdsbtumckw4o576zfe5nlvwpt22j4@hf2zpld7tvcb>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-8-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-8-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:07AM +0100, Marc Zyngier wrote:
> T602x seems to have dropped the rather useful SET/CLR accessors
> to the masking register.
> 
> Instead, let's use the mask register directly, and wrap it with
> a brand new spinlock. No, this isn't moving in the right direction.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 6d3aa186d9c5f..6b04bf0b41dcc 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -142,6 +142,7 @@ struct apple_pcie {
>  };
>  
>  struct apple_pcie_port {
> +	raw_spinlock_t		lock;
>  	struct apple_pcie	*pcie;
>  	struct device_node	*np;
>  	void __iomem		*base;
> @@ -261,14 +262,16 @@ static void apple_port_irq_mask(struct irq_data *data)
>  {
>  	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
>  
> -	writel_relaxed(BIT(data->hwirq), port->base + PORT_INTMSKSET);
> +	guard(raw_spinlock_irqsave)(&port->lock);
> +	rmw_set(BIT(data->hwirq), port->base + PORT_INTMSK);
>  }
>  
>  static void apple_port_irq_unmask(struct irq_data *data)
>  {
>  	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
>  
> -	writel_relaxed(BIT(data->hwirq), port->base + PORT_INTMSKCLR);
> +	guard(raw_spinlock_irqsave)(&port->lock);
> +	rmw_clear(BIT(data->hwirq), port->base + PORT_INTMSK);
>  }
>  
>  static bool hwirq_is_intx(unsigned int hwirq)
> @@ -387,7 +390,7 @@ static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
>  		return -ENOMEM;
>  
>  	/* Disable all interrupts */
> -	writel_relaxed(~0, port->base + PORT_INTMSKSET);
> +	writel_relaxed(~0, port->base + PORT_INTMSK);
>  	writel_relaxed(~0, port->base + PORT_INTSTAT);
>  
>  	irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
> @@ -537,6 +540,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	port->pcie = pcie;
>  	port->np = np;
>  
> +	raw_spin_lock_init(&port->lock);
> +
>  	port->base = devm_platform_ioremap_resource(platform, port->idx + 2);
>  	if (IS_ERR(port->base))
>  		return PTR_ERR(port->base);
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
