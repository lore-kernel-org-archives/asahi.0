Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECFD264627
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740080155; cv=none; b=DLD7IS/0nGodBdTPPhSxyzQpQffPBNcXstfUVNSkn/KjPVeSwoYd+KHywoDTk7VhxmycyF4waqLXmBWx2rFjLciO7BN90glNI+D57chl2o3j85nsPgFVN+eMzRewAeqhsZiWUgyNgMdnCJ15Q3OyZ8JQyUHSxQnW+QIRLlPJ0ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740080155; c=relaxed/simple;
	bh=Cn4+MbGF93ZPciRW8w9henqPO1354AGpPKF7B/F7T8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwLz3ImZPjMlydg3du1a56wPtzbaKilSVHH3pxMhnT3lcdl/lZWSCS5jdES/UWVh6bBN0DWFCVSrV4u/UmZcVrpXU64yunMSDwPTBBIFtv/KgCepKLxR5ZXFyD3h///wIcD1gNMnp3kpD37bbyTzjehblH9ShjaezUVY0KAhIyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=GG+eyqn7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="GG+eyqn7"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22101839807so27993825ad.3
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 11:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740080152; x=1740684952; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2bN/NPVn1vKfJddb+/MWowQ/DYT7KXXiFwwxB/L9OIQ=;
        b=GG+eyqn75BtOV3Rg0EYz2+gUe8k+GwvY+uIItjWCLD4kx0IQ75FJAjQc+r+T4+ysC6
         Odq1nxQE+lBES0Ewk11E4KhYdiDGJGgXkp3dgkSNz0OkkO2PqJmQJ1UgnAIHi9k95ACU
         b/VbuH6kcf28WUuPRxA6vw6N/xt9PIsPvl+hxAOZhNC7wAgIXQn3WbMjXjUJJejaK2cG
         E28VZwvw/ZLLSzR9U1Bj/2fKFaPk6RsMIjeyZWNYfxI+I2TEg9FHZ9BDljaUdRmHXxRo
         dD6kG4L/aBB4Y9rzZCcIP4aB8bkcYAd5FQ71EXup4e9CZKlFO3wWcjWFKLWPWGc/CCve
         kzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740080152; x=1740684952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bN/NPVn1vKfJddb+/MWowQ/DYT7KXXiFwwxB/L9OIQ=;
        b=V8i3pXaWqmgBI6HcARZW82EQarZmDmjuWChLHP5tkNbbfpIplmaClGJKn0ob4LEYR+
         Vl4yMjEFbqt/EThplF0c9eiE6apicmnpECwvOm8r+G/kdmBmTeucw2YvnsfBciUfixxF
         ErzDAYSfv+FvlPllp13I9GF2UkZLC0RjjirF7aGw1cuPAl9+3A7Wmi44gRw9OQOXKuwV
         jigYjSap2OGO40tWlUV5+5LG4i7QXjmnEKQHwoesxaVo9moVvs4qY/NecJpiHb853GXt
         izUD8e66DDXUEgnQR824QPBdHJa9Wt3LOvOe2N53Sb5sMsUdTHG2uCwGCYeT1QA0Sd+3
         ROjg==
X-Forwarded-Encrypted: i=1; AJvYcCX1fThq/gnbUQ1ps6D6vzFIPNs37AqYiaWSXytRuFpD5mK3JAiqBNKmniRgDdmpJtM11l9DQw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzac3I60uUFXRp/5Vmi9m6a6M4Kbx6dZA8ptqaACsuA4bXWTFUT
	ScEbxv2M51SPWniHLzVRXuxNbUgfJd70gxlhePjPb5fpta1SIw+4fq8QSICdbj4=
X-Gm-Gg: ASbGnctgcmslJWYLjPM4iGVDwZqa1PxRiTFZKKZb0ddWJONq2g9SotByZoM6ygw99xK
	MMOXXKHZfIVPpiB8Nipi2WS+QaZaGzDMwBja71BJKDYrLLVmXFayCG34hIN/ImILH2PGltpwdGf
	L0n08WqDGa1dbPZ55DMhDaQ8aZodU8wqSvh01kkUCUYNkrgt+IyYSAc/3WCEsKvSRTKXiAlYlaD
	inqHFiaWPQ29N2uVgx7zHcqc+JfTDRt7O4ZM9VNhzRPOFNAJfVb6UxtXUWnBPU2t/LCku3eR+ea
	doewkBPCgaU4jab9hZu//7UF/zRibdXR1Q==
X-Google-Smtp-Source: AGHT+IFLUZkJqTzzZT+I/M3yqbHhvCV9FHZfFsSF+/uPg4tVfA/GlpswgR4SI57hCH58PcrddckVtQ==
X-Received: by 2002:a17:902:db07:b0:216:73f0:ef63 with SMTP id d9443c01a7336-2219fff4377mr5157465ad.49.1740080152564;
        Thu, 20 Feb 2025 11:35:52 -0800 (PST)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c9bbsm123012805ad.127.2025.02.20.11.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 11:35:52 -0800 (PST)
Date: Thu, 20 Feb 2025 11:35:49 -0800
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 19/23] iommu/riscv: Update to use
 iommu_alloc_pages_node_lg2()
Message-ID: <Z7eEFagK3xugrkKH@tjeznach.ba.rivosinc.com>
References: <0-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
 <19-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>

On Fri, Feb 14, 2025 at 01:07:52PM -0400, Jason Gunthorpe wrote:
> One part of RISCV already has a computed size, however the queue
> allocation must be aligned to 4k. The other objects are 4k by spec.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/riscv/iommu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 2750f2e6e01a2b..8835c82f118db4 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -65,13 +65,14 @@ static int riscv_iommu_devres_pages_match(struct device *dev, void *res, void *p
>  	return devres->addr == target->addr;
>  }
>  
> -static void *riscv_iommu_get_pages(struct riscv_iommu_device *iommu, int order)
> +static void *riscv_iommu_get_pages(struct riscv_iommu_device *iommu,
> +				   unsigned int size)
>  {
>  	struct riscv_iommu_devres *devres;
>  	void *addr;
>  
> -	addr = iommu_alloc_pages_node(dev_to_node(iommu->dev),
> -				      GFP_KERNEL_ACCOUNT, order);
> +	addr = iommu_alloc_pages_node_sz(dev_to_node(iommu->dev),
> +					 GFP_KERNEL_ACCOUNT, size);
>  	if (unlikely(!addr))
>  		return NULL;
>  
> @@ -161,9 +162,9 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
>  	} else {
>  		do {
>  			const size_t queue_size = entry_size << (logsz + 1);
> -			const int order = get_order(queue_size);
>  
> -			queue->base = riscv_iommu_get_pages(iommu, order);
> +			queue->base = riscv_iommu_get_pages(
> +				iommu, max(queue_size, SZ_4K));
>  			queue->phys = __pa(queue->base);
>  		} while (!queue->base && logsz-- > 0);
>  	}
> @@ -618,7 +619,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
>  				break;
>  			}
>  
> -			ptr = riscv_iommu_get_pages(iommu, 0);
> +			ptr = riscv_iommu_get_pages(iommu, SZ_4K);
>  			if (!ptr)
>  				return NULL;
>  
> @@ -698,7 +699,7 @@ static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
>  	}
>  
>  	if (!iommu->ddt_root) {
> -		iommu->ddt_root = riscv_iommu_get_pages(iommu, 0);
> +		iommu->ddt_root = riscv_iommu_get_pages(iommu, SZ_4K);
>  		iommu->ddt_phys = __pa(iommu->ddt_root);
>  	}
>  
> -- 
> 2.43.0
> 

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com>


Thanks,
- Tomasz
