Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A681E8341
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744564387; cv=none; b=nD453QFmSqD/Lx2psgQBB5oztwH4bhn6rl8eXjcg9wcZ9Yn1WRzbz/+ZabIinh3i4eLG6+h0GYE8MJjLJdARGMIBysXnXThbqwmCjD+RT7kAWLXL211179jB9RfWYOcQYAo+JIRzXv+PzbbqupeM4oJf1sIxIaf0jhOfwk1MIAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744564387; c=relaxed/simple;
	bh=aEQzF99LQ0NNvpBhqm+RkEYHYTmZEcGMdv8X4Shek58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=in80eVvyYcn1bRYqUWCXHwTnOGw0/i7mNmV40DF3uVeXI98shmZKRMIM0tSxVlJDtbQu746Ftg8+I1QfimggpwnUBQVO7o1vYGjDMuMsacs0q4/yrscnpKQObOi1OceAcjE5t5GKuh9qy9Sq4itShbPcMNYONfbyfjlaqKhJEW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUOZAfdg; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUOZAfdg"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b03bc416962so2427670a12.0
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 10:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744564385; x=1745169185; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T/+QNJQggYnXDj8WNcyWPPzk0l3SA6QGoTwofzMyuGw=;
        b=iUOZAfdg3Q/tEzYCvQUVhBd3CSlsBF5+GA9mAsCMGMmC0f/LzoIALlV7war4/+aTI0
         R7QBmd1NA7RR2Odth31mRAGpZNE49/Nv+15jdDkt66NPQtT3AA6CNrxJEu/fKcpyfiM9
         uZh3ywIYYbqHCciv8JWdmoDNiVkpusAlUiLRxjNc9rwEb5BPy+EXUhFvgTdP8kDQoFnv
         OLPZCi2yTes1CBdBaYDMs+7SVsImBQfzHr//0v+kOfKcTdBleerSGZdTzaiRCrfyegVA
         IwdFLsnnSy5qwZGAr71eTqq2Vf8uf6iuzMXfpgFjskJzDrnEJ/W+05/y4uzBzPTM1bHD
         I3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744564385; x=1745169185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/+QNJQggYnXDj8WNcyWPPzk0l3SA6QGoTwofzMyuGw=;
        b=PCrO82JIaTOPPpZKYmwmZUFx1wYGIpTb0NYOg0zwxbLo1ioY1bDroh4oL1SSPwKfPr
         vr/z/59GExss1hi5MYCzR7ZcPFmN8TK5cBzDka/LbUWz9wpyauw3cpl5uO4LrcJOrFX2
         9AFpY93wtxWlPHQK02EZC84j3vXcdv207Cv2HDd4c3H0qnWqJjZ/9ZVKaleLXoYmsvS7
         3d65v1/TqX9tZ0VY4RuKIZW+Sz206OUQCSuxUheh4piCEeiEZyTTidRV+kRBE9IEAMNB
         rz3tyHopb+L1Ukb97k6EKJlkLbcLKxSDuTphoitqrgXdvtH2HzjnvfvKXaA4scmniMyu
         yRFA==
X-Forwarded-Encrypted: i=1; AJvYcCWvNBHUti8cTvAC04YKKb8D6eUJKgy8We9RftPRBmeJJdaL4A1nGDR6qo4pgzODTob3v4tmCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKzc1T8Ew4Jd0oMyNEzEyBRFcbiAq0xfHjBShwUILR3VzviiLG
	2Fi9KWmnUreHEeD+bJp2781BJtHLPVc01oiHriGt427HE5kNFu6VBqs7lWZuXw==
X-Gm-Gg: ASbGncsoUnovdPIdCMyoUWWE27ZbZAtWcn5dbHmB3Qkqsf/xhLrcBZB5exSKuaeL9U3
	P84hh26Rol1y/4dSm340HK/mQVW5ZrgsWJ7QR4O0xXqiZWC3MxzZeWpHi6rshaePTZPDZagTkwP
	tkz8db/fN3vbq3tnXjIWJmeo3NgxTjgs9KDMcP8SVWrcKfD9l10wS+IaFn6nLQwJ0T2ew7efJQ4
	IfX4i7AMg8oH/14elkLsDZUcs1b0KmiuZghKNfcrjLhTEKIFVWf4WYkfJMI4QkdSCkzORILImYI
	VNMR4Gq5dRR1/g4NrlAyMd2bT+DrwjBeoz43URc/nEe3uy9PYvig
X-Google-Smtp-Source: AGHT+IFgvRixxj4CWBFzEA4Rqd/cLujQYErvo4nd7qcvFFaJWGEF/g+XbRNPiPM5DyBrqssz2FfknA==
X-Received: by 2002:a17:90b:274e:b0:2f4:434d:c7f0 with SMTP id 98e67ed59e1d1-30823664092mr18167375a91.12.1744564385379;
        Sun, 13 Apr 2025 10:13:05 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10c41fsm10783830a91.8.2025.04.13.10.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:13:04 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:42:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 08/13] PCI: apple: Fix missing OF node reference in
 apple_pcie_setup_port
Message-ID: <bw5hh2mlgaxxxy6rcjksrqfkpencjx36iywy7kp4s65ah5qe6c@ye6dmhzhdlck>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-9-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-9-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:08AM +0100, Marc Zyngier wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> In the success path, we hang onto a reference to the node, so make sure
> to grab one. The caller iterator puts our borrowed reference when we
> return.
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
>  drivers/pci/controller/pcie-apple.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index 6b04bf0b41dcc..23d9f62bd2ad4 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -593,6 +593,9 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
>  	list_add_tail(&port->entry, &pcie->ports);
>  	init_completion(&pcie->event);
>  
> +	/* In the success path, we keep a reference to np around */
> +	of_node_get(np);
> +
>  	ret = apple_pcie_port_register_irqs(port);
>  	WARN_ON(ret);
>  
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
