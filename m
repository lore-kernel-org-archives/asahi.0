Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B77399
	for <asahi@lists.linux.dev>; Sat,  4 Nov 2023 00:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qratfzb4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699058885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWMUyNNUnPsRLjoGsaCfd4VrJc7Ffw/kOlF19kCtm60=;
	b=Qratfzb4EZcyY7FahxvVYTAjNz1FIaLCkTwY/FFGs+u/iHbxGXgx0Op0fZ9Z6g1p5P+vPy
	kqElYcIY083bEoDkVXu7+QWaywqJHOwnmFon3Z24tSjLFIDTSJuFpe76CeWn4bXBtPdA3A
	2abHhuXr9IJbR0aHbuOEtPCq/nHKorc=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-xUAuoqz6OIiPb_Wj_D6T1Q-1; Fri, 03 Nov 2023 20:48:04 -0400
X-MC-Unique: xUAuoqz6OIiPb_Wj_D6T1Q-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3b3e82429edso3627848b6e.2
        for <asahi@lists.linux.dev>; Fri, 03 Nov 2023 17:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699058883; x=1699663683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWMUyNNUnPsRLjoGsaCfd4VrJc7Ffw/kOlF19kCtm60=;
        b=qOKEgQiISPTY6ZObdm2IXIkDn8JljtFXzBvnnR7SkupnRQnFZxcjlfCP6sKPm7TT6w
         PzXEb7RwSYH9ohItP/NBArZZNGvumsLfKqJmG9RtDrgaACJy4UHOPcMOvPuOtpi11kLr
         wJF8Lr75dCG3ZMLHkzbrSPY+es0G1+daP2Kw1mAFBsVmccgerDgU0pidD7zJbAiCpq3n
         qqstHQx5wjdeMRVp9yC4e2zh6fMEt5qjT0uA3xKmLL8jOBjK31EJqmSSUPPgO3j3C2ds
         2ysgHTucwmHXAfJxulkKJK48Bo70g43QNotwpyJjgY/1NyAHWSgVvI5lhLxoejOGFpRI
         VTog==
X-Gm-Message-State: AOJu0YxqZ8qU8vJmmFKvfxXUxyaml8vKmRZO5jTNNBu0/rt2v+TfFVh8
	56q7hCOV62BQF/4fDnmzwNCPcKo8HxieO4FfLi9kKEOF9F6gA56h/I6n59I1spVI76bc52oTtYb
	Co+Kd3CHtodjcYwA=
X-Received: by 2002:a05:6808:2e90:b0:3b5:95eb:f76e with SMTP id gt16-20020a0568082e9000b003b595ebf76emr2040002oib.24.1699058883448;
        Fri, 03 Nov 2023 17:48:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbl3cnWwz1S+869RAlRQHhIhHXgs+QsQ+oiCvUWDqrKYbBZJdPrVYEi95zUnZ7fv/l03IwvA==
X-Received: by 2002:a05:6808:2e90:b0:3b5:95eb:f76e with SMTP id gt16-20020a0568082e9000b003b595ebf76emr2039947oib.24.1699058883200;
        Fri, 03 Nov 2023 17:48:03 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id n23-20020a635c57000000b005b458aa0541sm1838143pgm.15.2023.11.03.17.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 17:48:02 -0700 (PDT)
Date: Fri, 3 Nov 2023 17:48:01 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linuxfoundation.org, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev, 
	Lu Baolu <baolu.lu@linux.intel.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org, 
	David Woodhouse <dwmw2@infradead.org>, Frank Rowand <frowand.list@gmail.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Joerg Roedel <joro@8bytes.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hector Martin <marcan@marcan.st>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, 
	Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Sven Peter <sven@svenpeter.dev>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Krishna Reddy <vdumpa@nvidia.com>, 
	Vineet Gupta <vgupta@kernel.org>, virtualization@lists.linux-foundation.org, 
	Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>, 
	Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 04/17] acpi: Do not return struct iommu_ops from
 acpi_iommu_configure_id()
Message-ID: <xvgdxrlcpvafst6qypgwehtleaihsedgoiat6akv6au2j4xrjw@rk4dl4xbnq6o>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <4-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 03, 2023 at 01:44:49PM -0300, Jason Gunthorpe wrote:
> Nothing needs this pointer. Return a normal error code with the usual
> IOMMU semantic that ENODEV means 'there is no IOMMU driver'.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/acpi/scan.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 

...

>  #else /* !CONFIG_IOMMU_API */
> @@ -1623,7 +1624,7 @@ static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
>  int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
>  			  const u32 *input_id)
>  {
> -	const struct iommu_ops *iommu;
> +	int ret;
>  
>  	if (attr == DEV_DMA_NOT_SUPPORTED) {
>  		set_dma_ops(dev, &dma_dummy_ops);
> @@ -1632,10 +1633,15 @@ int acpi_dma_configure_id(struct device *dev, enum dev_dma_attr attr,
>  
>  	acpi_arch_dma_setup(dev);
>  
> -	iommu = acpi_iommu_configure_id(dev, input_id);
> -	if (PTR_ERR(iommu) == -EPROBE_DEFER)
> +	ret = acpi_iommu_configure_id(dev, input_id);
> +	if (ret == -EPROBE_DEFER)
>  		return -EPROBE_DEFER;
>  
                return ret; ?

> +	/*
> +	 * Historically this routine doesn't fail driver probing due to errors
> +	 * in acpi_iommu_configure()

              acpi_iommu_configure_id()

> +	 */
> +
>  	arch_setup_dma_ops(dev, 0, U64_MAX, attr == DEV_DMA_COHERENT);
>  
>  	return 0;
> -- 
> 2.42.0
> 

