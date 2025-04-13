Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28931DDC12
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 17:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744563865; cv=none; b=V55t1yogY059xSWTG1FhUeEYtsKuYmheb6R1e0k/80UUGm0e9MDNsQqGIJMix00Bi9k9AiToaV+21oAeiJHbbW39l8E6IA7jXNM5SI3UBEnvQJ4QfCx/9zbftWaaq01E/Q1+B9/NZUKxSd8h/FI0ShLSNkABX2Syz7IpJLlXLc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744563865; c=relaxed/simple;
	bh=yPwDn54Vac1JGWRY146dwgLEgVTLswU9aEd6LJpURUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dU1R8IzsKlc0cQn0znQwsdnp7q8EncKr4TImY/x8K1ts+u5SVRoiwz6r4DgjkE/VWtw1bjvYv2rbpHgVACcFEjaKUxY/gCUFk4uOAu31bzefEbAkwP/aeuLf6TB/pj3iDpkBlSHVk0+V8DT/620W3H/K7C8jznGqUZpQb6C2jO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BRjvqxoF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRjvqxoF"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736a7e126c7so3023940b3a.3
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 10:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744563863; x=1745168663; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a+u4SfCebi7qvppMaSoUa39+r8AbRqCDUq1wg5V2v3Q=;
        b=BRjvqxoFJn9rjRPht/eulU7NJNdjCz9umjOuYLIO80mZmsuVNkIpQzNkZ3eQIzsko6
         B8LLg21e9pzKWzmfUpEbT2sKw6z5qtfSSYmdg8dAYfC4j7lfa1sg2MnJyY9JBcPlKyn+
         Hf8/0cMEGe+Sb0BHOSSwaJ3YjLLQYj63oRNxWePSgwsPzUSjYkfoJLqDBzfEAS+Pzgtd
         qXRgNPo6Mh/c9ru7KRjlWNmbVl+SrHwqkhpiHUzS15zcDIwfLxCu0oEpRtmx6kSpFrTM
         VXkCnznZpanVbEDAio/9mxyrrQkGq+Q0M8ks6XDniJfgCclu5ms3PN3AQ9/FMqmWwOnW
         8lCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744563863; x=1745168663;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+u4SfCebi7qvppMaSoUa39+r8AbRqCDUq1wg5V2v3Q=;
        b=l/Yeeovo01gxB334xEwUsr62c1IKK4KMnncLwgL/KT8nZHndmh5IwDk1kln61IDgEs
         vZ6wjEhV4oZycxXoy4Vj8/E4C0vMXnyG6irX3CmIx/Fpa9eIx788Vh4Z4BzpEEsz6OsK
         04i1bPQBitzIMuTOMcYD4PM4beNqwdCcoOgVUeEILtoyz6K47/O4IQRwRggfPbpBX08h
         jj8ETYTrcHbzcHj6pbjDei7bLmFOgR9qxvw3/uGLLO51J/JQBMF/dCVNW5UoTNiJVpLR
         UTK8Jp7Z9DZdJ+x4YBuTvd5KUf7CaajTh3OgTEaZrUzHEU16w6tA7W9tzcACs57YtsGA
         SSiw==
X-Forwarded-Encrypted: i=1; AJvYcCVTGHPt58/r//REQR0GL4jG6KzzWPdv4WyiEZSG0kBYkEYQ4XtoDkYytYjMIwSFbXlnwYXJJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YykCxLZ1Jf6nIbmzQRiJTiJPY/CIjOVZK/Hqsa9+V5qnw3BV0Vw
	IB+0Tq5yTAwVp/8YWTvul1IQXTt+cdlePzcYC1yVtx5X6jm9/ltlKB9gm/zSlQ==
X-Gm-Gg: ASbGncvzOAGp3B6K4TZdzflE3vue2MSoWCFkxbF9hO5W0+W4BLdrdSBlf5SBI6p0Cz9
	Av+4tnphsBntk+Az1ASErt4oDT0u/IHDwG8ybNz250dLuBG3vis/PuEZz72fygIS31mEk29bqIb
	7OIZvvteelXoQLLv3zRoIafINIrmqss8KDcszZB36b7m2FpXoGiUqKbx+5CiDcmUZWR+yUinRg3
	UAJIxrazxTbshfE/hUVLo7ePu4MGTOvmBphv6H5Sy21j10r471eMXy2rPUHaKQM4pGpBQk7dA/u
	pHnUPzE2rlj+J9UF4n3ah0YwcBUXVwWIcal+/ZdYXGgAot0SkTsv
X-Google-Smtp-Source: AGHT+IFjyC9Nav51W8D+xJs56DEyrXe47gAj9cOlUzK/cynD/DwixHK7w/Y7LX+u7QpqEKkPzlHNBw==
X-Received: by 2002:a05:6a21:c8c:b0:1fd:f8dc:83f6 with SMTP id adf61e73a8af0-2017999735fmr16680739637.40.1744563863083;
        Sun, 13 Apr 2025 10:04:23 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2199535sm5339872b3a.14.2025.04.13.10.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:04:22 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:34:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 04/13] PCI: ecam: Allow cfg->priv to be pre-populated
 from the root port device
Message-ID: <5nwjlpnpwh4yto6wi4nxcwumpd7iilpq4mblpfqsvdxg2bfdsy@md6ok4btonxz>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-5-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-5-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:04AM +0100, Marc Zyngier wrote:
> In order to decouple ecam config space creation from probing via
> pci_host_common_probe(), allow the private pointer to be populated
> via the device drvdata pointer.
> 
> Crucially, this is set before calling ops->init(), allowing that
> particular callback to have access to probe data.
> 
> This should have no impact on existing code which ignores the
> current value of cfg->priv.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/ecam.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/ecam.c b/drivers/pci/ecam.c
> index 260b7de2dbd57..2c5e6446e00ee 100644
> --- a/drivers/pci/ecam.c
> +++ b/drivers/pci/ecam.c
> @@ -84,6 +84,8 @@ struct pci_config_window *pci_ecam_create(struct device *dev,
>  			goto err_exit_iomap;
>  	}
>  
> +	cfg->priv = dev_get_drvdata(dev);
> +
>  	if (ops->init) {
>  		err = ops->init(cfg);
>  		if (err)
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
