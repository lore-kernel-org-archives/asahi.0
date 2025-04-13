Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D66414A0A8
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 17:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744564070; cv=none; b=COn4NxaEM79B+7alVnom2DCvaJAAGAHLCGyUWLI2DjXracrYqTtWfLi4E+WohmePdfTq/VUmADwVHXKRD/VtC10x+iMI0svYQ/oKNtQV027qWqc3IVgmKf7WSrRitdVejyYNHWBs2g5VsJMhp4tUl942ZVC4PlPJtM3UWoQV9K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744564070; c=relaxed/simple;
	bh=6VKODufV55CPHRL6gMi2vT4BTwQXo0hYnnyL4Ta01nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GeavcvgHjgTTqJ2e1SyXi80/s484/uKqSBlO6mm8abfySfTcyxA3LHT3/nHxeyijx9dWQzRIGhXMfvyfvLf7jLRYx64Dqc8rINvKFs3XqgTqtc+pm6KwrEdp393PURZlS6kRSj82DOcDOE8vR2VjtKGsZ5W0tdFcyh3ITpmvnaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIHY0mo6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIHY0mo6"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227914acd20so36633635ad.1
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564067; x=1745168867; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+nVktb2oUewrSNZef7Xp2RVx4/SYPTQmZKEvKujre58=;
        b=UIHY0mo6EEDLSqVaA+X0JTeA9U5czzz/1tsmFIV9Q9RzEciWLmwU2i9TjHWJ1dkfXB
         +1DgvVxuqgmtN3b1H/kXhWWL6pZ+b+Dtprsko9Ysd0JRpZHW90puV9OSPC8kvuAgDP1n
         /r7jrOyLvnnN1CbpiIvpfsbaZl4go1vvrRXq7y/mcg59ZjMmy8pdG4OSSfVWEZmxIOj2
         AM4SFKNUU/dLA6rZvUE2ISgcg3NfsCKIcAMt4AsawT8NzTRpJDrl0qA8W08WsrFD+iS7
         XaX3YUxcvzk+z5yaAEmtmvxyQo5/7bGVhUAzevZ6eIg9wGa8Twgb/QJqkyJT3AX2+r9g
         rAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564067; x=1745168867;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nVktb2oUewrSNZef7Xp2RVx4/SYPTQmZKEvKujre58=;
        b=rqJMCzPlSSbz12dUf3U31qzzjUUNup2epIJNqGNWumhC3UaoUSLcD8Xjg8m3vGY7On
         POeA6qZBeh80djjwTAn1K07q4Vi69siZXx5dFBnvuqPZPrBdeNj/Nz5mBIxjM8VPWstY
         DGTJRR73cQVEPbDPYlfqVAaWmdD/HYOgbIMhiVhKKNl+aRixVU2DemQEqDvMFQXGN5rM
         WcvZenoUJfzB3UUVR6CX1UdvW6EkBI6xY6npj47BriMHwnSTE8yiIt+Qz1Ps5jZcDMeP
         QSXNR8V8IFCecLuAd7Tyss8sZx7aLDZ7RhBtxZkDNYQZjPxPBGR5O1iVyTFVxkqSm8yP
         LvLA==
X-Forwarded-Encrypted: i=1; AJvYcCU61CRR/+v5Yb1gg7fnfpW1HYTstaYSMBHU4JVpAoSM8Gop1Z2iMEd/EeqSqj36oKeyvA0s9A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw85GmN10FcaiamChuDAcMgd+Lxk/Kmzt/J4AV1aZsfOuDUdImF
	ifmW9nFmbH5KrzWLbgp6+lD48L/WMqfDIjhzwfeZGjRubmiZkuiaThO/CaSvyg==
X-Gm-Gg: ASbGncuYG78j2VpVhclMJ4JozWd6j4gv7gt0j8UJCG/vbiCrbXgH4di1bZ0hRw26UtJ
	t9qiVpynJLS6va303n1VxNZGSMmbLVcgd9XRvujGxEu/Mx9VfuMvs2m3hBFfpbnyylkagnLb63F
	41ovxUZrZDP+AdJzvt6X3cHezufo66vFS5A9BVvY85vOVSD2iPa83/xxLsrZ8TTrS5F1GulAt4M
	nCDPPfWUfFeHzqzM8aVqQHmHlIhJButiEk8EiW4SoFAIWZOfkLZ+k+pI9EAqToTAQ9ZPKVltAih
	AQ31KDxW8mRLOEf9bNqwODL8oSA4ChoZ7gmwllqQk4zZNviVVdNr
X-Google-Smtp-Source: AGHT+IE+gbJeUC8MORyPLq+yv1/hRBnQsVunUtWyIkSWfGWZQvtHnS9GTR0o+MdzAbYHUke6iYn5sA==
X-Received: by 2002:a17:903:1c9:b0:21f:5063:d3ca with SMTP id d9443c01a7336-22b7eaa3209mr205867575ad.16.1744564066784;
        Sun, 13 Apr 2025 10:07:46 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cbasm84608565ad.133.2025.04.13.10.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:07:46 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:37:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 06/13] PCI: apple: Dynamically allocate RID-to_SID
 bitmap
Message-ID: <vcoczq6foe3mikun3o5oqhawbu6ixfjfljnare32olmwxw63xj@zznl6iefhhxu>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-7-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-7-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:06AM +0100, Marc Zyngier wrote:
> As we move towards supporting SoCs with varying RID-to-SID mapping
> capabilities, turn the static SID tracking bitmap into a dynamically
> allocated one. The current allocation size is still the same, but
> that's about to change.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index d07e488051290..6d3aa186d9c5f 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -147,7 +147,7 @@ struct apple_pcie_port {
>  	void __iomem		*base;
>  	struct irq_domain	*domain;
>  	struct list_head	entry;
> -	DECLARE_BITMAP(sid_map, MAX_RID2SID);
> +	unsigned long		*sid_map;
>  	int			sid_map_sz;
>  	int			idx;
>  };
> @@ -524,6 +524,10 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	if (!port)
>  		return -ENOMEM;
>  
> +	port->sid_map = devm_bitmap_zalloc(pcie->dev, MAX_RID2SID, GFP_KERNEL);
> +	if (!port->sid_map)
> +		return -ENOMEM;
> +
>  	ret = of_property_read_u32_index(np, "reg", 0, &idx);
>  	if (ret)
>  		return ret;
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
