Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE3022370D
	for <asahi@lists.linux.dev>; Thu,  6 Feb 2025 05:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738819812; cv=none; b=sTTnnfxCYnDRWRe/mmynw3MHbKAeS37EoVcVuJqM1WTRvcfABL2Seh95crc1QRBj1rl7+nKGv/bwxrEa/zRmaygkHguORSKjOkAAXHgX3JVOhGHjIAUO58eKGI45ZkGckX5i7sgxIZNU2mb5nTZDyvzd7LNunjMRUn0irZYhdc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738819812; c=relaxed/simple;
	bh=tNOsQ8XTPAWYz9ImmrEJwRpNQeju67/8X20L+ujIqzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hu+xGiIRaj6mJ51ZKPknPw9EXRrvkOdPH0gKIDHwxmBhTA6P6xDgBNgbB3hW5wXtA7YUfjeSxphzwz+JHblQTfszInLiyVhEc0Zsbr8w3i2XW/dBznYscDxLezWcJ3Ccum7/rmUkszAtRyfGJLqmjxoDFOqKpJybpEvU0QcNPgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=q5MsBWCV; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="q5MsBWCV"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2163dc5155fso10121185ad.0
        for <asahi@lists.linux.dev>; Wed, 05 Feb 2025 21:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738819809; x=1739424609; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pRoJEJRUPVObRh6bcpNHZcCJSeUoo6qbmkVpHeNteUs=;
        b=q5MsBWCVuNC2F3hHvNX2toyzdzN7weOFg9ToelHKL9D+M46XGiWQ5XNJP8TZygo/2l
         /VMaRugfGhGMjFZ11jr5lpc8xbiffVjrUG9UuDirKIosba0GyRvc35TZOtFyAekc2kpD
         hkwUwp3prQsqP62LeAeeKlBgQkWbM8Hm5/37sUCLmboL2iyjX85QTdX/PlXw7ZBTGijG
         kctxyjz+dWKNVW8lc0dDM3m3U+EuYAPwAp5sjKEetlI33t4h6eIY3wL+zkFiXex8lvjV
         o8W5wVJfEjHcKOrVxVZuENQLV5/YYvGW2V5E7xLy/VDk4ERqnx5OMUORDVuF+t3JSwFn
         6NpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738819809; x=1739424609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRoJEJRUPVObRh6bcpNHZcCJSeUoo6qbmkVpHeNteUs=;
        b=DUfT9RdOLn+VM+ShUavQuCiuAqE9iwdrMyBrCNuPVTf1bChVlJtGrQl9a8mQW9GkzC
         YOkv93ywq6fOkMgFo48KSgPOd0J1JVYqG4giKq/43domOCh4gy5a+pFy0eB0l5/wCh3U
         jLalRLg/gPyh27K0H18Cf6Z4t+NBoWwTDVwffH6Le60MH5BsavIHs56Puoocz5PKjJok
         WI7r0WEAE6yWf8M/fdfaxBNMJy3B0fXFmBQ0Omd4ANc+M6aUHqzMZDvBIQY6WCn6NX7N
         nWxwJFXDtgOEJBBgNFilIcaSC6pcMMdf4JkWtzOGGejmP+IAGP3h2qOX7Of2NgP13oqk
         Jm+A==
X-Forwarded-Encrypted: i=1; AJvYcCWYA7v4LFNC1TTUPfCDTkCazCuxse7FHQlXnxu5wnB2MAJRruWqFxn72awnHgds5/BuDG8N6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOtQxrRYAJkBl1hfykuOmfTwjzjDS1GVWxAxfOh9EUiWYtnaXD
	Ai/w/CusNxjUB0XmQrjuposVo6vwWzIiSJQBAbHCCg1KXKp18p34hAD8JvKyfC8=
X-Gm-Gg: ASbGncswPfj9T8ULt44PZmFQ5tJ0iqjqx9fq/zC53tlaXSNB23zidPufxTDYqD4RMD9
	4FPgbKEIf/GpzYuJWMVJ5glbgt2haxOF86hPWCkec+d+/nOnVm9NTzux6Kndh289dogai4R5d/3
	mlTsyGL5dFgnCH+Ck4A9o4Nae0hlEjQMoYXQzjcRvY+g7dehRW0s1GVLp2Lnn743gePDoG6QTXo
	H/IhCAWLXsZl/TC84nZHEJKASOdlz+iNKVFPCHFd3SCPaP4XytwOlKh69QjpT+SUHtDSKhbG7iJ
	t0lk7nTwIIHcjQI82nxdV0lRANgxlSwzHA==
X-Google-Smtp-Source: AGHT+IE1tNZkBLKVThcpOUcjJPjEE6LeUB5SuPAtY9c/ZHJbnXa2ZNVKpzCci8Lb0vwwFKWpOtSe+Q==
X-Received: by 2002:a17:902:d28b:b0:216:410d:4c53 with SMTP id d9443c01a7336-21f17ebba71mr74788475ad.41.1738819809035;
        Wed, 05 Feb 2025 21:30:09 -0800 (PST)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653c997sm3459215ad.78.2025.02.05.21.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 21:30:08 -0800 (PST)
Date: Wed, 5 Feb 2025 21:30:05 -0800
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
Subject: Re: [PATCH 17/19] iommu/riscv: Update to use
 iommu_alloc_pages_node_lg2()
Message-ID: <Z6RI3ftJTrm3UxoO@tjeznach.ba.rivosinc.com>
References: <0-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
 <17-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17-v1-416f64558c7c+2a5-iommu_pages_jgg@nvidia.com>

On Tue, Feb 04, 2025 at 02:34:58PM -0400, Jason Gunthorpe wrote:
> One part of RISCV already has a computed size, the other part seems to use
> PAGE_SIZE (which is probably SZ_4K?). Convert the call.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/riscv/iommu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index 549bd8d0615d75..b7cee3d651b179 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -65,13 +65,15 @@ static int riscv_iommu_devres_pages_match(struct device *dev, void *res, void *p
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
> +	addr = iommu_alloc_pages_node_lg2(dev_to_node(iommu->dev),
> +					  GFP_KERNEL_ACCOUNT,
> +					  order_base_2(size));
>  	if (unlikely(!addr))
>  		return NULL;
>  
> @@ -161,9 +163,8 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
>  	} else {
>  		do {
>  			const size_t queue_size = entry_size << (logsz + 1);
> -			const int order = get_order(queue_size);
>  
> -			queue->base = riscv_iommu_get_pages(iommu, order);
> +			queue->base = riscv_iommu_get_pages(iommu, queue_size);
>  			queue->phys = __pa(queue->base);

All allocations must be 4k aligned, including sub-page allocs.

Note from IOMMU/RISC-V spec:

"If the command-queue has 256 or fewer entries then the base address of the
queue is always aligned to 4-KiB."

I can't find this to be guaranteed with new allocation API.

>  		} while (!queue->base && logsz-- > 0);
>  	}
> @@ -618,7 +619,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
>  				break;
>  			}
>  
> -			ptr = riscv_iommu_get_pages(iommu, 0);
> +			ptr = riscv_iommu_get_pages(iommu, PAGE_SIZE);
>  			if (!ptr)
>  				return NULL;
>  
> @@ -698,7 +699,7 @@ static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
>  	}
>  
>  	if (!iommu->ddt_root) {
> -		iommu->ddt_root = riscv_iommu_get_pages(iommu, 0);
> +		iommu->ddt_root = riscv_iommu_get_pages(iommu, PAGE_SIZE);
>  		iommu->ddt_phys = __pa(iommu->ddt_root);
>  	}
>  
> -- 
> 2.43.0
> 

best,
- Tomasz
