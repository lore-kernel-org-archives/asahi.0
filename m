Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9CC1EF08D
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744564633; cv=none; b=ReKC1lVJHRkPP5a10cVoL+JLEozPxyDYXo02x0ezTICLTxZgbbZ2QGdi9btcNJwQq4+AAx0os8doGaN0fkAnLIYaH7C66X/snnJbvvMRk0s9EsJ2bOLBnPdLPyyvD0wHcMwF50Ov7k0d9Hx1iBtH0LX21/jkDPzkHkeC6dzGIiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744564633; c=relaxed/simple;
	bh=yzmYr4JLOS40LoDlK4MgPp+nJ9KhGdxaumE41jBjK4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVrdMGv2DoYjoZSlICF6KDf6cSymt9HLU0rhQZFXbXd2OJI2VRzy4PsfQFD8khTfepqasrzMw5szoHokU2XxQ6vjKoiRi+j/PpVbg/nb+CK215k94NtzI67gHrSM3wdsYjOr56JubbfALXv2mSTalANehUzh0we9sNuKa8iy9pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y1O8ke1n; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y1O8ke1n"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224100e9a5cso38266855ad.2
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564631; x=1745169431; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvXB1Wjux2MAoUVYX6W6dWHZg8CiYEv8//Po5T1hVMY=;
        b=y1O8ke1nkJQhKfBQIGXObVIKz161h86sai6xJkoZTltLtsmuQTt7ppZRebM+h0jRP+
         YcIsRkVVbofhInAKIlXBC4eKaNUIbZtATaxTWNlPhBeAh6TeAsEK7nRErB6R1ltKX/7r
         UtPTkZ+i6L2AogOq+v4rLnCBlRBJ3NS0mMM/YF+Zo/N4fx36z/dwzIb4WmbnS0PiX5eN
         95DXg1ybgLKvQrzVhzIepkvyQKS6+pEm+xI0KA7LwOT5dAxPlbmY7XoA+XVl80g3OPFM
         RANbEDqy7wZhn2rM1OFnv0ofLY6Ok+ZqrIJuY3TguwyjdR0P0/5svrTfEvVmP/m8XKNN
         LKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564631; x=1745169431;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fvXB1Wjux2MAoUVYX6W6dWHZg8CiYEv8//Po5T1hVMY=;
        b=MiyWpqgvIC9Gk4+8gFrUQy1Hc0f9p/0VjnY2ih6UKPhCPDFLvMEXWzxAg87Q+sibPv
         2q6yk+HZk41YZXD02cOVpt8JfeJB1TF05XSVc6znnCUn6rCZLBzllGKpnDlpTO7jt2xu
         XA1CRtmQNIqMZUHb30CiuZHAXPzrI96yAt33Nnsy2D0ISu2dTlMhbCX/biKK2OXEkKdE
         o0cw61uNqUx4FxdNjRzNkdGrEdWw7rWWeiXnd0Fru2YC0IrWWzbANXG4fydE3OT86owP
         lB9msN42wVpqfGWpMa5h9eoQSafEofdU9mGF/pyH09P+fcGfPK0MRdAlgVAJGq1oCASa
         uxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKHfl3M1X35kGG7zqeAorbgGlsxbWc8X5FdtobKqvYUGfn7Oi2cx7XPsuEdqm9K89++D7FKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwndDUiAm9NFnCVFIf+R7AFKsmclUnR/JnACiv9jn9U5ZmmlbLr
	VxyDF1PTlaKjxjLEFQZrwq5dqTvDlWeatKL6h+tfu89e4VhHlYizo8KvZUb9OA==
X-Gm-Gg: ASbGncuESMRdtRp3PkvQS2RLmxgoVwl9w/YUDLdE4GzkupnCpISX2r1zUIYl715y0sl
	W7H7OdV+TUmnfkOpPlSlzwp+uQSd20qc2CmNPKR0YLtNlvQuU8g0S2WmI2ahxwtk5KjjYBt5r8w
	WPUw5BjePdKWAUuWjMgGOKNaCHZjSyr95EoJXhFvu+yThUYjP/xzo3KiDrf8RHudM0hN0vPJFsX
	vaoSTRC4bHTWunn8NPq96rHFGDs0bfOOoEfk+ZaQg9PNhhPcVoX/U4L59beUjr09ptaK6E7Mzgy
	Tik792uTeOa0KA8YeNsOWhZ2QV4hcRfShq07gjohBEAcSNvk7RLw
X-Google-Smtp-Source: AGHT+IEtOLc2J65A5BztfZy5lJCUWgfZuua8Ed0F/wWmVQ49XJn2NKHTr6y3ixbdHzeiNIvZR7HI/w==
X-Received: by 2002:a17:902:e5c9:b0:21f:1549:a563 with SMTP id d9443c01a7336-22bea4954bfmr127432855ad.2.1744564630883;
        Sun, 13 Apr 2025 10:17:10 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97228sm84677405ad.128.2025.04.13.10.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:17:10 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:47:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 10/13] PCI: apple: Drop poll for
 CORE_RC_PHYIF_STAT_REFCLK
Message-ID: <rzrouiqucgtdpapcqwf6pbdrbsrxeii6khx3h2q26etu3772tb@qxxdjuv5uias>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-11-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-11-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:10AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This is checking a core refclk in per-port setup which doesn't make a
> lot of sense, and the bootloader needs to have gone through this anyway.
> 
> It doesn't work on T602x, so just drop it across the board.
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
>  drivers/pci/controller/pcie-apple.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 94c49611b74df..c00ec0781fabc 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -475,12 +475,6 @@ static int apple_pcie_setup_refclk(struct apple_pcie *pcie,
>  	u32 stat;
>  	int res;
>  
> -	res = readl_relaxed_poll_timeout(pcie->base + CORE_RC_PHYIF_STAT, stat,
> -					 stat & CORE_RC_PHYIF_STAT_REFCLK,
> -					 100, 50000);
> -	if (res < 0)
> -		return res;
> -
>  	rmw_set(PHY_LANE_CTL_CFGACC, port->phy + PHY_LANE_CTL);
>  	rmw_set(PHY_LANE_CFG_REFCLK0REQ, port->phy + PHY_LANE_CFG);
>  
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
