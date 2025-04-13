Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38671F192E
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744565052; cv=none; b=sQSRpmvWh/2YTHgQWsokHDFi+ubSC2cfYC3vt3T6eYnB046sh8el7jrke4l79/r0htJ043pj+eJFi7IW0E/2shh6a4Ke86qawZh0HOU8GehR3UPXDxRhhcuJ4AOrhHAMPUjqqaa/1+OE2jnj4WvPeJNuaJ845Briams0WGUd3bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744565052; c=relaxed/simple;
	bh=6mpwTBXDtKtOWzvRXUOm2Kslk7WOSmE7W5jFMnQJFso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHm2LipHc52fYzFQoNNAfDZnjsAUZuiW4u7mO3NqWVc4kxByCx8s3whFuJB9YDC96YN1U/CN5L11D/wpRPks4lDmedHulZLUbkOOf+C3csUrSN1VdWA3bo/USCrAAD77Vg/CXolC/Xa9jHCguIr70HpKHdEz1H/LfnhYcWgg11I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XZlsQsFE; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZlsQsFE"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7369ce5d323so2807137b3a.1
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 10:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744565050; x=1745169850; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C1v1jpUQBgB0UDZI3nApqVs2lUM02dJl8JbpTG+9uNg=;
        b=XZlsQsFEOfhTfGw7CN1gSoa+AhHFO5HNGMowx3HEki1HnDStXiBFkRORUnW9owx+hV
         HDauNcEKJo8XmsysHZ41Js6WgrCP6EouOYB1EMh6uGAIfWR5zQpWpubjK0h3aCnktXaZ
         /t4deIJfzUJ+nC6pkmRkTd6JlfyT9tfRU1XwBHfc8eludFd2tbdh57KDpY2dP8+iNrns
         S4dh1ClpM9fLjqY6pHA2a6W+qRSQ6z7eR4lG0sD/Q9/Fdmwub3VNDa6DCyuN7WfO9tma
         0dnjyMJ1BEHuGy38bmkwJH84PfAC7xAZj1BB767V2VYbqka5h9N1Utk6lnYCuZ4UhbEs
         ja5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744565050; x=1745169850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1v1jpUQBgB0UDZI3nApqVs2lUM02dJl8JbpTG+9uNg=;
        b=KEHmBG5qJet5rM6Odj7SjiKob5CjgS3o25M7ZxtQ75APUgn5YI0NVAAS1VnmcoOIDo
         pIJVy26nzPrk3wkqWx3w8frDBczbeXwgWZKHk8lIP+n9tHibqcGX7TOJFhclY+yIYipE
         9Ep/SB5re5nn2C4MChVWgNXTAZXgVcJrFmKa2kZreXaXKeb+nuLR+zKOj9t0Sboxo6Vw
         0v8wotIEkY275rAUR4YVS5ayZX57bxXHammq+d6tF4iz3/Jq1U7GLjQ5d5C+3ZA6EUa/
         1N249xaabbqU5d/Ar0AeYYOwoCt6u9oTulsoyBBqGb7rewR0Kc/chFJhqjMfkCqOqMm9
         EYqA==
X-Forwarded-Encrypted: i=1; AJvYcCX3/mCAPrqGzQboi+WrfNCVkLFOuP7GroQq04WAH9613O53BvbCzSAvKirMD/ffvwYrTXIGoA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr6oRrsYE9GvN5tG8CfEZvTniAFLQkLlImCstdoAbYhH6WY9q8
	h8ls3OjEmzw2RqLOXsNcOUotNcvYb6zZ14SIYykMoCt0R95L7tpzo6TmuywiYw==
X-Gm-Gg: ASbGncsrHj7HbBvZCt8Zgf7EumqjJxrb2M/d98HewTHZolzLLJ4r1uRtHRNlLSLKQci
	NpaqxBvyz9lYGNRBDaJ4WLATtjZKyWVRuiiDgFqx6J+Jgo5AYsdVn2Ckx6Wwz/1y6VpcvWVe042
	CzXfs6Eh8XNALKK961L6M2TYd9tq9QXq5NcOU3U2wMwvWi/fd8lrbrXYCjJyjLMb5j7HQB7HlKx
	ut3bu/UrOyZLR+T+a2PKRY2y1ZjryCx8jAklD5V/W7+kaiwUuMjBv8QrnqfGt1IFcTsffEMtLQn
	R7QunNT6fBUkdSzLovIL2Q3y5qYZ4mGVrJfPmzyw1Wvn7h/5ZDfl
X-Google-Smtp-Source: AGHT+IFM+YdieMiL9r0SStfI5t0k0rConT5oK7CRUa4UafAiZdqdwpgSv57rF8TAB6+nr1CsWpsXWQ==
X-Received: by 2002:a05:6a00:2e27:b0:736:53c5:33ba with SMTP id d2e1a72fcca58-73bd12657e3mr11703409b3a.16.1744565049844;
        Sun, 13 Apr 2025 10:24:09 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2328435sm5153419b3a.157.2025.04.13.10.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:24:09 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:54:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 13/13] PCI: apple: Add T602x PCIe support
Message-ID: <3mwdadqtt7733nq2okj47a5rsztgxuip3ukfsy44l7hhh2z7o5@njrv5c5l5fh7>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-14-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-14-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:13AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This version of the hardware moved around a bunch of registers, so we
> avoid the old compatible for these and introduce register offset
> structures to handle the differences.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 847cba753d28d..5b85d9497070c 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -124,6 +124,13 @@
>  #define   PORT_TUNSTAT_PERST_ACK_PEND	BIT(1)
>  #define PORT_PREFMEM_ENABLE		0x00994
>  
> +/* T602x (M2-pro and co) */
> +#define PORT_T602X_MSIADDR	0x016c
> +#define PORT_T602X_MSIADDR_HI	0x0170
> +#define PORT_T602X_PERST	0x082c
> +#define PORT_T602X_RID2SID	0x3000
> +#define PORT_T602X_MSIMAP	0x3800
> +
>  #define PORT_MSIMAP_ENABLE	BIT(31)
>  #define PORT_MSIMAP_TARGET	GENMASK(7, 0)
>  
> @@ -158,6 +165,18 @@ static const struct hw_info t8103_hw = {
>  	.max_rid2sid		= 64,
>  };
>  
> +static const struct hw_info t602x_hw = {
> +	.phy_lane_ctl		= 0,
> +	.port_msiaddr		= PORT_T602X_MSIADDR,
> +	.port_msiaddr_hi	= PORT_T602X_MSIADDR_HI,
> +	.port_refclk		= 0,
> +	.port_perst		= PORT_T602X_PERST,
> +	.port_rid2sid		= PORT_T602X_RID2SID,
> +	.port_msimap		= PORT_T602X_MSIMAP,
> +	/* 16 on t602x, guess for autodetect on future HW */
> +	.max_rid2sid		= 512,
> +};
> +
>  struct apple_pcie {
>  	struct mutex		lock;
>  	struct device		*dev;
> @@ -425,6 +444,7 @@ static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
>  	/* Disable all interrupts */
>  	writel_relaxed(~0, port->base + PORT_INTMSK);
>  	writel_relaxed(~0, port->base + PORT_INTSTAT);
> +	writel_relaxed(~0, port->base + PORT_LINKCMDSTS);
>  
>  	irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
>  
> @@ -865,6 +885,7 @@ static int apple_pcie_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id apple_pcie_of_match[] = {
> +	{ .compatible = "apple,t6020-pcie",	.data = &t602x_hw },
>  	{ .compatible = "apple,pcie",		.data = &t8103_hw },
>  	{ }
>  };
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
