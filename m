Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553C4122AD
	for <asahi@lists.linux.dev>; Mon,  7 Nov 2022 19:30:35 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso7134239otb.6
        for <asahi@lists.linux.dev>; Mon, 07 Nov 2022 11:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt/BtquzOdnr+gVhVyK9tm9VLIWqhBtKkDfzPK2GzW4=;
        b=AzsPqh8hRV2/kdq3rlyaCUi2uUgUItfKEHL5sgjuToXmBX0wyvWS5bIQPnpD7qk6D2
         pLrC3g4TKQtTcGQhddXhbifYqUoAd2kAjFUsykIahNO01z1l08EMok/rR+WSkQbwvGwj
         iLpJczAz1vZl7PswMMbGAkg/vDdFRAJAVEQVKxt1wmkVRnxCJInELIX2nJ2qUQjEObk1
         2M71f1kTmgp8FTp3l/Av9GQImlDZOFpTspg9zwbhZWHXu3/NS7f+hIQFgB78i1A1MLm8
         OUu6l93+hzU1wk2+HW+wS2PQxJ9iyD667VJ9nLDAQZL4xWQvgjWdPu6YfU4bObHXFOQ8
         62ZA==
X-Gm-Message-State: ACrzQf3hsNPqQoAXeXSWLzwdKIsUJ24i29/SbD2VtMr7jdSyrwYGX1u4
	6XJV/k7R8nDiA7WDpEyrhA==
X-Google-Smtp-Source: AMsMyM4fsk5AFdpe5yRB9WUh3yq1GTsaBKphE1jwQ0VIvogXtXU/3O96k6V2XgCyNwjYQ2nARL+U8A==
X-Received: by 2002:a05:6830:90c:b0:66c:7109:bb5e with SMTP id v12-20020a056830090c00b0066c7109bb5emr16481607ott.231.1667849434121;
        Mon, 07 Nov 2022 11:30:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j24-20020a056808057800b00342ded07a75sm2730214oig.18.2022.11.07.11.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 11:30:33 -0800 (PST)
Received: (nullmailer pid 1459973 invoked by uid 1000);
	Mon, 07 Nov 2022 19:30:35 -0000
Date: Mon, 7 Nov 2022 13:30:35 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Krishna Reddy <vdumpa@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>, devicetree@vger.kernel.org, iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v10 2/5] of: Stop DMA translation at last DMA parent
Message-ID: <20221107193035.GA1394942-robh@kernel.org>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
 <20221103133900.1473855-3-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103133900.1473855-3-thierry.reding@gmail.com>

On Thu, Nov 03, 2022 at 02:38:57PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> DMA parent devices can define separate DMA busses via the "dma-ranges"
> and "#address-cells" and "#size-cells" properties. If the DMA bus has
> different cell counts than its parent, this can cause the translation
> of DMA address to fails (e.g. truncation from 2 to 1 address cells).

My assumption in this case was that the parent cell sizes should be 
increased to 2 cells. That tends to be what people want to do anyways 
(64-bit everywhere on 64-bit CPUs).

> Avoid this by stopping to search for DMA parents when a parent without
> a "dma-ranges" property is encountered. Also, since it is the DMA parent
> that defines the DMA bus, use the bus' cell counts instead of its parent
> cell counts.

We treat no 'dma-ranges' as equivalent to 'dma-ranges;'. IIRC, the spec 
even says that because I hit that case.

Is this going to work for 'dma-device' with something like this?:

  bus@0 {
    dma-ranges = <...>;
    child-bus@... {
      dma-device@... {
      };
    };
  };

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v10:
> - new patch to avoid address truncation when traversing a bus hierarchy
>   with mismatching #address-cells properties
> 
> Example from Tegra194 (redacted for clarity):
> 
> 	reserved-memory {
> 		#address-cells = <2>;
> 		#size-cells = <2>;
> 		ranges;
> 
> 		framebuffer@0,0 {
> 			compatible = "framebuffer";
> 			reg = <0x2 0x57320000 0x0 0x00800000>;
> 			iommu-addresses = <&dc0 0x2 0x57320000 0x0 0x00800000>;
> 		};
> 	};
> 
> 	bus@0 {
> 		/* truncation happens here */
> 		#address-cells = <1>;
> 		#size-cells = <1>;
> 		ranges = <0x0 0x0 0x0 0x40000000>;
> 
> 		mc: memory-controller@2c00000 {
> 			#address-cells = <2>;
> 			#size-cells = <2>;

I think this is wrong. The parent should have more or equal number of 
cells.


> 			/*
> 			 * memory controller provides access to 512 GiB
> 			 * of system RAM (root of the DMA bus)
> 			 */
> 			dma-ranges = <0x0 0x0 0x0 0x80 0x0>;
> 		};
> 
> 		host1x@13e00000 {
> 			display-hub@15200000 {
> 				display@15200000 {
> 					interconnect-names = "dma-mem", ...;
> 					interconnects = <&mc ...>;
> 					memory-region = <&fb>;
> 				};
> 			};
> 		};
> 	};
> 
> During DMA address translation, the framebuffer address (0x257320000)
> will first be translated to the DMA parent's DMA bus, which yields the
> same value. After that, the current translation code will switch to the
> control bus of bus@0 and then the address will be truncated to
> 0x57320000 due to #address-cells = <1>.
> 
> The idea of this patch is to interrupt DMA address translation at &mc
> because it is the root of the DMA bus (i.e. its parent does not have a
> dma-ranges property) so that the control bus' #address-cells doesn't
> truncate the DMA address.
> 
>  drivers/of/address.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 14f137a21b0c..e2f45bdbc41a 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -475,6 +475,7 @@ static u64 __of_translate_address(struct device_node *dev,
>  				  const __be32 *in_addr, const char *rprop,
>  				  struct device_node **host)
>  {
> +	bool dma = rprop && !strcmp(rprop, "dma-ranges");
>  	struct device_node *parent = NULL;
>  	struct of_bus *bus, *pbus;
>  	__be32 addr[OF_MAX_ADDR_CELLS];
> @@ -494,7 +495,12 @@ static u64 __of_translate_address(struct device_node *dev,
>  	bus = of_match_bus(parent);
>  
>  	/* Count address cells & copy address locally */
> -	bus->count_cells(dev, &na, &ns);
> +	if (dma) {
> +		na = of_bus_n_addr_cells(parent);
> +		ns = of_bus_n_size_cells(parent);
> +	} else {
> +		bus->count_cells(dev, &na, &ns);
> +	}
>  	if (!OF_CHECK_COUNTS(na, ns)) {
>  		pr_debug("Bad cell count for %pOF\n", dev);
>  		goto bail;
> @@ -515,7 +521,7 @@ static u64 __of_translate_address(struct device_node *dev,
>  		parent = get_parent(dev);
>  
>  		/* If root, we have finished */
> -		if (parent == NULL) {
> +		if (parent == NULL || (dma && !of_get_property(parent, "dma-ranges", NULL))) {
>  			pr_debug("reached root node\n");
>  			result = of_read_number(addr, na);
>  			break;
> @@ -536,7 +542,12 @@ static u64 __of_translate_address(struct device_node *dev,
>  
>  		/* Get new parent bus and counts */
>  		pbus = of_match_bus(parent);
> -		pbus->count_cells(dev, &pna, &pns);
> +		if (dma) {
> +			pna = of_bus_n_addr_cells(parent);
> +			pns = of_bus_n_size_cells(parent);
> +		} else {
> +			pbus->count_cells(dev, &pna, &pns);
> +		}
>  		if (!OF_CHECK_COUNTS(pna, pns)) {
>  			pr_err("Bad cell count for %pOF\n", dev);
>  			break;
> -- 
> 2.38.1
> 
> 
