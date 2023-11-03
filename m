Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCF423773
	for <asahi@lists.linux.dev>; Fri,  3 Nov 2023 22:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IjQKQhfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699049038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rXpne+78UGenenxYxx9+jLWMRynS8s68tp81l2tHoL4=;
	b=IjQKQhfHYG/clut6BA/jZ88UjhXa3zc/jOw4J3wax4urix6D5I1eJdnpQMvdZAGs/btINo
	HYcO3EjXCmYMwFoa9eo8mpDI5d/nEDsKGIXX3UsHO5D9O6zFc8tqgtPeiEpOg8Ex76nq7r
	SbNOFo5vw9JhjQ59yc0uA6eBm3vSjDM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-n006WvVTO8iwxpJBz_iyqg-1; Fri, 03 Nov 2023 18:03:57 -0400
X-MC-Unique: n006WvVTO8iwxpJBz_iyqg-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-280740f54b9so2089415a91.3
        for <asahi@lists.linux.dev>; Fri, 03 Nov 2023 15:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699049035; x=1699653835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXpne+78UGenenxYxx9+jLWMRynS8s68tp81l2tHoL4=;
        b=peln6dIV+byA8j3TGlkDkpalZWZzEkgwIJO3nyAqixdW4h+UZOGgvYZ2r/L+MEadnW
         IhuEV13blEvyMMC8sBpcerQI5uFTsVC3Xm3fV8PkXrloyuAxg3/lo3ZXm0a1+E3MSBbT
         EhsCF5I0+l1in3G+BBYcZ+s+dLhxqUQyQGx4KZYfqzZlRhSSiYwFRISV5Bq3Cs002zP/
         +9JKLTPKZth0iPYHYKljux5R+F+DR3q9VN1mzaN5ljuzhxm5vVLOL0VIa/StU2NC3YRr
         enovZXn44DGkppP2dH5JyevKZCQZty/mEIHtQBC9+heNLbTy0A91j2aQFDrqjYAqcEuw
         ug7w==
X-Gm-Message-State: AOJu0Yzdg+9cUow5LDV5GMgIKuUKw1Fr8Kvf/zi/qq9Cq1u47IvFhl/B
	XxmTjLjW/Yglfr4n4t8rf9oE+4XTmarlQ+nKLAr+cdiiS/RYPVi+1po9ebbICvV0EFzNzUJXu+H
	xNN1iH16Oh/5E2t178+wXqqvCOA==
X-Received: by 2002:a17:90a:7547:b0:280:2609:6d47 with SMTP id q65-20020a17090a754700b0028026096d47mr15580960pjk.19.1699049035273;
        Fri, 03 Nov 2023 15:03:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS5Dh794kn050Jmor3G/4m9PpE2w1GtTAul8MncDw85TpgTEhPbh0ocZRGWoVXSassV2SO7A==
X-Received: by 2002:a17:90a:7547:b0:280:2609:6d47 with SMTP id q65-20020a17090a754700b0028026096d47mr15580944pjk.19.1699049034936;
        Fri, 03 Nov 2023 15:03:54 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090ad58300b00280976d4ce3sm1815162pju.37.2023.11.03.15.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 15:03:54 -0700 (PDT)
Date: Fri, 3 Nov 2023 15:03:53 -0700
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
Subject: Re: [PATCH RFC 03/17] of: Use -ENODEV consistently in
 of_iommu_configure()
Message-ID: <4iktbjhxkddukf7vywxquz5ffgik73wdw7p7rdqhsbsumhzhsl@y6u7tjbczafc>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <3-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 03, 2023 at 01:44:48PM -0300, Jason Gunthorpe wrote:
> Instead of returning 1 and trying to handle positive error codes just
> stick to the convention of returning -ENODEV. Remove references to ops
> from of_iommu_configure(), a NULL ops will already generate an error code.
> 
> There is no reason to check dev->bus, if err=0 at this point then the
> called configure functions thought there was an iommu and we should try to
> probe it. Remove it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/of_iommu.c | 42 +++++++++++++---------------------------
>  1 file changed, 13 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index e2fa29c16dd758..4f77495a2543ea 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -17,7 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/fsl/mc.h>
>  
> -#define NO_IOMMU	1
> +#define NO_IOMMU	-ENODEV
>  

With this the following can be simplified in of_iommu_configure_dev_id:

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 4f77495a2543..b9b995712029 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -61,7 +61,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 			 "iommu-map-mask", &iommu_spec.np,
 			 iommu_spec.args);
 	if (err)
-		return err == -ENODEV ? NO_IOMMU : err;
+		return err;
 
 	err = of_iommu_xlate(dev, &iommu_spec);
 	of_node_put(iommu_spec.np);


