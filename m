Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5B21EF370
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 17:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744564666; cv=none; b=ZpgaG5RldB4k+1JEpYz4g5R3z1NrwoaPs1x29SzH9cI8Emdz38yv/wxPfTNS/VyOmFXSGc2frMe0N1e8hHWM1wWkA+V4qOMNrEhaLGWooqjQUYyn6qIknv127DMQjrM1YaaeyJ3VZ0MdxW//GMExtWG5ggK3bFA0Rr373GfZBdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744564666; c=relaxed/simple;
	bh=8BO3fdOcQT0WqsO1kMIDe2VATzrdhyw9yVBK+2+M+Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyJ0KRgs+bNm0py7Q2IC5f4Z+7ucJnvwoZIJlpVt8CyRjoT//yJL0DdknxAwgkJtdT6J097fYAT1q5vrnHHLfJD6S4049mdE4YPKf3p8KBkTPbw9MjDYMCR4IIebAReEzXVbykanuCiv0mA1UXUv4Z/FGNLmVCEg2C61WhAcb6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u5VrcYcY; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u5VrcYcY"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7394945d37eso2984935b3a.3
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 10:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564664; x=1745169464; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tvo1AqLyr+P74wryzNC2MhPCbinbOghs0H5a0GVjRKI=;
        b=u5VrcYcYjv6oo35VCTEoR3tFhAtTZ4lj6OeXxTSVI1At6wAOtlJ69H3/DSN31K9Dc9
         yKG9IcVRCeVCWdNzwPYuv0bLqE9ZGBMos39sdXxc27Q5C7pMeV4EyhhHgS9BMu6Oea1l
         bsDwSh7zpaywwyjNlUpLBiMideK8BAQdb+v2vYMo1sXYU+0uwNfv9VYa6nHCIDL7ZSEr
         AnKBV4bIx4ScAT+5Qln3FX3SyViGkd0pO2DFjP8nHWkXYv7aUhE9vt7f7CWca2eFaK7P
         GYzWFbmZsFXbelM8JTYzx9rdATDt5ltuNfiF6H+c4CICoC4Hy7tuwW9EuN975Y1okuSo
         eC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564664; x=1745169464;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tvo1AqLyr+P74wryzNC2MhPCbinbOghs0H5a0GVjRKI=;
        b=HispthT5strOR0HfULC8ptt/ujWmzHqTY5qwNE92AaN3mtZ+EEEEvznhC22jSS3bGd
         jE/hwQ7BuP4bvJvckJQWxTv0DVAatKJCSI8C9lTrgFIKqFCjNIfYCl7mXoJk4mU4f4eC
         ITzXomeAsvAfOOzYb1mNef4imPIkAtzaTnIEyh21l1Yn02//QZyMBbYdQpjEMCs8RSPX
         SOOW5HwBurkSylcXj8pYxx1FR2Lz+kFIuUr/mwYXWPIJ4fCZ0VIRw18XwDSY9j4FHZWv
         h4BKwUnBZUrDx8yjt/8O3QV5If7fe3cdVyaNsF2XcVynF+eyV490D6SMnPn+hiImJwr2
         EJUg==
X-Forwarded-Encrypted: i=1; AJvYcCWf7ml1JYXREsXb2J3mgPbaWHvY8PKJd5iB8X8yCgEIAiXh9uikTwE/esBxsxYmI58lj2Lu/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfpRctLqzyohVsxdHmNtRoeD3H6lNmDiTOu5j6gvgJWe4i2Lka
	a1D/8i/X16Z7mf7P60KibaEF1SeycO2v5zhaW4ys89GXaNact1CDWj333vZmIQ==
X-Gm-Gg: ASbGncuj2QIQP6hIK9kcjnQGWG/i4GJbT/kqBtX3ZI7D/UHwfRlg/4MMeQYLC+RPOGu
	m8S0RcCH5f/Fcb9k+rsUnN31HAu8SX0BpBKR4I6VENtchGnVOVnXzFtFyFhJA6JSOKxAS/bFdXT
	9U/KSM2nNYYzIFXaogggUOdTvdfZpB4kOIs36nrA0jLOzzVi31EZsX1QBidCi6oSAa26J7zmtLc
	xaUtobxE8EixqC7m0vETgloJ5SfMXu8nvbu0P6zpmV9KJ3B9J/LqoK8TzXP02bYz3kHCUYDRSi8
	S1KZ6iqMLMpfCwUHJ/dbvsmIGV7pLeRUL3o4n/xoY8WrgKweN7FBmozkTESuhEE=
X-Google-Smtp-Source: AGHT+IGEF9tHk5qwg4OxLxK6w9YLSpLNHAhgJxvCUsO1Pirx8TGENW/hAM/zxwUCHFP7Xw61cGiCug==
X-Received: by 2002:a05:6a20:9f07:b0:1f5:a577:dd1b with SMTP id adf61e73a8af0-2017978f12cmr13438249637.1.1744564664334;
        Sun, 13 Apr 2025 10:17:44 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a325sm6721497a12.60.2025.04.13.10.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:17:43 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:47:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 11/13] PCI: apple: Use gpiod_set_value_cansleep in
 probe flow
Message-ID: <gljevi2izxszizvwm4yzpbzraxhjf47vm2lg7jrmm6d3ae62xu@cbqtbvw7miah>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-12-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-12-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:11AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> We're allowed to sleep here, so tell the GPIO core by using
> gpiod_set_value_cansleep instead of gpiod_set_value.
> 
> Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index c00ec0781fabc..505adf64bd66d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -562,7 +562,7 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	rmw_set(PORT_APPCLK_EN, port->base + PORT_APPCLK);
>  
>  	/* Assert PERST# before setting up the clock */
> -	gpiod_set_value(reset, 1);
> +	gpiod_set_value_cansleep(reset, 1);
>  
>  	ret = apple_pcie_setup_refclk(pcie, port);
>  	if (ret < 0)
> @@ -573,7 +573,7 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  
>  	/* Deassert PERST# */
>  	rmw_set(PORT_PERST_OFF, port->base + PORT_PERST);
> -	gpiod_set_value(reset, 0);
> +	gpiod_set_value_cansleep(reset, 0);
>  
>  	/* Wait for 100ms after PERST# deassertion (PCIe r5.0, 6.6.1) */
>  	msleep(100);
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
