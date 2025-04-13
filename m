Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418991E3DE5
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744563464; cv=none; b=dBoDm6FRsZEsa50Lr2YD5incVB8hXAVgnEztDtnj7tNNVpjjy4JzlK4Fnn4Z0ddDIN15m15RN1TtGziO6gse2bfnX3nPYd+QYI63JxUbe1yu2+CDF8hXY3NdvXr+qHx9IDic1V7zpIgnE9AczBpa1Xe+LGn06a3vxwGBeWMtcVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744563464; c=relaxed/simple;
	bh=/7OMVG3YDsHT7VSBN3w3/iys+Aoi2WqcdkbwOgqe87g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poNfIX+MMoPBiBs7tBqG8nzs1BJ5yPqjEEDc0DCTR80oO/fio0zEZWG9XQIpCFW84Rc5JfUxv0RAubPhoqkHLZxLysdwn9PIC4HgesEoRM5+yfap8ZR+TV4lISlwUheycwfoOrOB2Xn7N+bUBaZy7GF/dtn76CUbXZ7Nw+JMPX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ENtogBOY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ENtogBOY"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-225477548e1so33218995ad.0
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744563462; x=1745168262; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RBY58SxSSqyPJrcv2B/68pnLeAE4+ZGyiwdPmLMof5o=;
        b=ENtogBOY4+2KBZ43ptsyBG57Q4phqFA/41pYJr505sTaJDP+P8e3fkNckzMoHA98VJ
         Y3vOM1t6EwdkCDQ2AW2wjUPeKvWrmwfmACHZzCyewXJtVcLW1OuToonjFesn1cX8jEpu
         Q9b7dkiARYQu9gWERYiHYyeumD4onWrfVTyXCFoiam02ujLrBglmRQeXB5ETAk80NRBX
         04fzAKxL1mvIxp3zj6bwlBCsrC+5767pLMiskP7RziXmK1LV6zSulF9B9wmcdg49lB5q
         1/xXIkhUAyU7O88fli2Baq46crJ6zsqDEbwuyG83XUT+wca3eDV92e/vmogrIRUAyIB+
         fETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744563462; x=1745168262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBY58SxSSqyPJrcv2B/68pnLeAE4+ZGyiwdPmLMof5o=;
        b=bgdZNeCgTpjp1CSeAf+gGF4CvIaeJFH4Gp6v9whCO7wg9+Td1FD8dXEBDzoME3ICP2
         w3+0CkMm3NAE2tAqOCTQcWc+fWDYEFos5vM1x8dAKPBorFVJrr5BDAKCNXGwtLXyX7Ke
         BN5kK5wN77ssUTH4pA1oCDwo8fdIMxSIoEVSKhhhe2A0mAlIH75Gs9YEX9a1KcMHsRaE
         Qpzz3HQDNQVjAlYyqn06eTYKVruHsj/5lEjwh8vXwfT0qGsk7trkMmT9nMAF4L9Xkw6S
         GPsCHTK8WoKpWevqMdKluscVvjleDaPxrPXACvo2nnSrrWUvEUjoGnEQuEZafrLEg3Wd
         kwog==
X-Forwarded-Encrypted: i=1; AJvYcCXyyJA4IHOoAJ1aNuBETFHIkS6Q8qxvbDMIeZ0fQMGXhRK5rJxtPfleCEXqGDkEB6J5fwtLNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyri12Qlja2pKgbRjrfJOFGwMo/KUS8wIiu+1w+K8vxiS+XkiwH
	YBaOvY85Z6XLlq7symfrkavTNvhx1pO6kCERPnkgyrwaTvlWm2tRVYWPX/OwxQ==
X-Gm-Gg: ASbGnctH2OCepergAz7FARnADK94HQl8cUL/nr6PKn8m9u40JMg38KgHjqnLQ9k5z1Z
	Xc+hG1z9lEC0J6W9gkyeGDCfaezQDes5usNPEHNR3NlmE6MpBozODH23JckJpleMV23zfU/XWqN
	JypjaRqgZn5P5Af3gK9x+Q6BIQLOxnrpFcevc7ObHUTbz/SP83Bz3ZsGXCh/yqmoh/2d5ihUXol
	iaUtK7AYsrUgszl28r5R2i9KpX/BzQeobRADS87ZiqG/cYwALt+GeHbt2B3YDYy7AWatpmNszgH
	bIvYj4FNDYgBV4imP3j6yIuCaWr5r2rkDVHQ+tB9CH19xVvptD/L
X-Google-Smtp-Source: AGHT+IGJt4v7frYs5ZTIrelHv7KmYlMcRfj04mYpK3QHDu8yhzesA2ae/Fc6/h0nwJZRdeyltFrEww==
X-Received: by 2002:a17:902:ebc2:b0:220:e63c:5b13 with SMTP id d9443c01a7336-22bea4fd043mr132747235ad.46.1744563462265;
        Sun, 13 Apr 2025 09:57:42 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb84bsm84013885ad.236.2025.04.13.09.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:57:41 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:27:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 01/13] PCI: apple: Set only available ports up
Message-ID: <k3wj3wkk3cymyacboalkhe2fa7jvkpuehq4knpsouoyhvoavpl@bafg4oakp4lr>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-2-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-2-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:01AM +0100, Marc Zyngier wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Iterating over disabled ports results in of_irq_parse_raw() parsing
> the wrong "interrupt-map" entries, as it takes the status of the node

'as it doesn't take account'?

> into account.
> 
> This became apparent after disabling unused PCIe ports in the Apple
> Silicon device trees instead of deleting them.
> 
> Switching from for_each_child_of_node() to for_each_available_child_of_node()
> solves this issue.
> 
> Link: https://lore.kernel.org/asahi/20230214-apple_dts_pcie_disable_unused-v1-0-5ea0d3ddcde3@jannau.net/
> Link: https://lore.kernel.org/asahi/1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org/
> Fixes: 1e33888fbe44 ("PCI: apple: Add initial hardware bring-up")
> Fixes: a0189fdfb73d ("arm64: dts: apple: t8103: Disable unused PCIe ports")
> Cc: stable@vger.kernel.org
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-apple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a7e51bc1c2fe8..842f8cee7c868 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,7 +755,7 @@ static int apple_pcie_init(struct pci_config_window *cfg)
>  	if (ret)
>  		return ret;
>  
> -	for_each_child_of_node(dev->of_node, of_port) {
> +	for_each_available_child_of_node(dev->of_node, of_port) {
>  		ret = apple_pcie_setup_port(pcie, of_port);
>  		if (ret) {
>  			dev_err(pcie->dev, "Port %pOF setup fail: %d\n", of_port, ret);
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
