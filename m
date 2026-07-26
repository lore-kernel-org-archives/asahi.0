Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8F533F59D
	for <asahi@lists.linux.dev>; Sun, 26 Jul 2026 11:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785063617; cv=none; b=rThEtmF/wQZzaB8NEghSpwD3mT5EJFPjWGS5khtbYZXsfjUTUf9P9u4G1nJTJgDmDMptDXFa1NBl/8TY/ZDPoiCaBQIEG5YP7VKpfLVeaPuW1bhAPc8UGyuh/IXtSVUHXuXm5N+R9WSvYI9eMB4yLgz+7RskqNL+niP97QlIwCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785063617; c=relaxed/simple;
	bh=byvuZJYZYd2MSiuhVWfo6h4n7bx3BOovOl/DMV0oaKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8OxkfvGwhsrRxORTlre3OUD5BuRNJbWuBeLOyjHim92X5cMrdGrvJ9tFJG+N8tkJR144MAx3iAviE07wTFDcVtLkZrNsgvwtrwnYn+oMREp9G6r4PGNzknk3iKA5IGhHDZ8B/Vm8/uv3EB1/679UjGRTgEyaZuercgLHp5qDH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndSU9Ufj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndSU9Ufj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so16477035e9.2
        for <asahi@lists.linux.dev>; Sun, 26 Jul 2026 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785063614; x=1785668414; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GUYubJZOlyk7ZUcTegsKcSoPhTLrbF/NRujnb44b+Dg=;
        b=ndSU9UfjCz2Ge0/Q1cNa0QFrqxz1Ye/icQyDGITeVK0ECqjQTIIzV1MAgh+8PlYHP9
         qG/AmrfrutojKU6O3QNAN2foW17t4nUyDOi+gmXUcrR3XKvl7J6ynUt9DuXXxBzNvgbP
         Xnn9mctswS1E0PaGnJxaXmdHde7PIz79TznBBFedtBwDkjJcl0MSrR5f480qrDcCMMU0
         vCck6mwAFXSWAqPrroUpjXxu3oVVD8SMr6sIrgV+Te6izB1MiaecuV4dZkVSGmkFNL+M
         MsLnAni0Huu9sRn03RsLOY5DNt+6rqUjXqJqw7iI3fIY/CLPprFh3qW/xs1zOUNkn/9i
         0/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785063614; x=1785668414;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUYubJZOlyk7ZUcTegsKcSoPhTLrbF/NRujnb44b+Dg=;
        b=WidqMq4s9ZZ2Z9+Jw9U9RT4bLa5EJiguXtVcLSSYrvleM0PwcD+swkguh30W69cgck
         7SAFDPSOM6unmExmdJQax/M7XhufLHgRP6+R8BeONUDD7TCcoNoE7z824EJ4xLspvOpq
         1j1IbU+/k0V76B2txFdg7am3/MtTohWqeghhJu2ipq12UynPY+jRtY18F+2jP83ftcID
         27sZjEuOk8dTOTl1lnUfcrXmYMvLMvUhc2hDjsnMIoLi+KOkJ1p7OfqG3FJ6DNIdiJPf
         OM4lOgxaAW1tnWe97RKkU3hAyM+cZ/ZREeGJTmh3tq5PIyH3RVQutE3AO4bdJXW9cGbX
         dCrQ==
X-Gm-Message-State: AOJu0YyhrKtJlaVVkkR7n60Xpr4GtnVU/hvkYuIVdbj/NRy+LqyEzU2O
	/r/sGavV2OIxjFO+YwdzIoTczgeqJO1drsDopytWeIgMt9GpxRoWM62r
X-Gm-Gg: AR+sD12ZmIAx5uKYxrpGtrtsOt7h+xR2o9OxttekfUrWG6eVNmaDoWzgShUavgz+Kpv
	Bbrm6GAOgijG4a0bbtQlUjipX2pDx1RDHIf8EAZFuNWKjCecssCBZpMix/8cKrLQEIyuPHMznrS
	o2+WCOWwedHQGFLqC6ptpoHAhdmAnTuLcQbGlimqddRMqRUUL/seY50RwZEe94DMIhxNnojd05O
	5BKAywTr2StYbLMFuTsHJW6xEngLDRo05+j497L2vbIQlmtyx8V4JnuLpg2OQ7DL7QM3aC4cHGh
	koVJ6anolPs5Ml8mcTZueS42qv+AyFe5RkATHrklAoKE1PN2qF6o+UeSgbjoBvk04H3xINTGOTt
	BlMPuncSZowC/SlTX3WNlA7im9/7u3/kTpe5AVMDhfDjNcQstQObyImI/oEaqb7F3EH+vdy4FqB
	QsXFl+MtjxsN+XDkSuU5wM
X-Received: by 2002:a05:600c:350c:b0:493:f639:9b2f with SMTP id 5b1f17b1804b1-496b5ddd7dfmr62118035e9.39.1785063613640;
        Sun, 26 Jul 2026 04:00:13 -0700 (PDT)
Received: from [192.168.1.110] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee0e91sm132606545e9.4.2026.07.26.04.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 04:00:13 -0700 (PDT)
Message-ID: <2b553c1a-a2d3-44d8-8e98-976835e3d436@gmail.com>
Date: Sun, 26 Jul 2026 19:00:06 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] spmi: apple: use IRQ for RX FIFO if possible
Content-Language: en-MW
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Alba Mendez <me@alba.sh>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
 <20260725-t603x-spmi-v1-6-e1a29fcd2d38@chaosmail.tech>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260725-t603x-spmi-v1-6-e1a29fcd2d38@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Sasha Finkelstein 於 2026/7/25 晚上9:48 寫道:
> From: Alba Mendez <me@alba.sh>
> 
> The IRQ fires as soon as the reply is available, which is usually takes
> a few us instead of the 10ms sleep interval for polling
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index d8509f027df6..d627187b3ac0 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[...]

> @@ -195,6 +277,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
>  
>  	spmi = spmi_controller_get_drvdata(ctrl);
>  	mutex_init(&spmi->fifo_lock);
> +	init_completion(&spmi->fifo_rx);
>  
>  	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(spmi->regs))
> @@ -206,11 +289,23 @@ static int apple_spmi_probe(struct platform_device *pdev)
>  	ctrl->write_cmd = spmi_write_cmd;
>  	ctrl->cmd = spmi_cmd;
>  
> +	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq < 0 && irq != -ENXIO)
> +		return irq;
> +	if (irq >= 0) {
> +		ret = apple_spmi_init_irq(pdev, spmi, irq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "spmi_controller_add failed\n");
>  
> +	dev_dbg(&pdev->dev, irq >= 0 ? "Initialized with IRQ" :
> +			"Initialized without IRQ, falling back to polling");
> +
This does not compile with clang:

drivers/spmi/spmi-apple-controller.c:453:22: error: initializer element is not a compile-time constant
  453 |         dev_dbg(&pdev->dev, irq >= 0 ? "Initialized with IRQ" :
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  454 |                         "Initialized without IRQ, falling back to polling");
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


>  	return 0;
>  }
>  
> 

Best Regards,
Nick Chan

