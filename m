Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D043502A8;
	Tue, 11 Aug 2026 23:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786489883; cv=none; b=d8BIZCB5Kl67apax5U3ubekuC8WQbnIGnML141LauADaRkxFKmi2vHd4ZHft5f1CscqHQDrEQ5tMlNU2Mi+eU5EzX6QHRlL6kM412O9QBR1L4yuy8DwmQshKE29dkcbeJ4Dp8Zava4BMZMhyMAS6odH28Ldgc8nnBO4uoYTDJ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786489883; c=relaxed/simple;
	bh=qx7WHh5PDY96/SwEo2Y4XDeSrY1cClhCqngsjDf2LOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFv80wRTM1SxljXkb7fFmFkHxGsO8avhJw+H7HU8SZWGHEXG9wn+e3GbPXdc8lRzYbNUm5fTJzFD+Y2EK1Wfj/jv4f5b7HcF6sKMwBghLwTS+gusPOJvb/RUSg1PUfn5hCCKLm6T2kGKh8X84OKNAk746yalWEoSTeI9p4NISN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ghr9OGG0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ghr9OGG0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856C31F000E9;
	Tue, 11 Aug 2026 23:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786489881;
	bh=a1Qc4t1sKMfE9AWA3aPgD1xYl+DO2MyYkWPuNL/ZCng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ghr9OGG05qlPjUggALEtkyE5b+GM7qpO4c51ZCG0KTcJ5XtJCjYOKuo+J7TdCzw3Q
	 9oH4pUlnU326LvYyYlS25XM4e8g3JWhtyAXJLVDnS2+3D7fJA7vQm2EhNs29BJ2hzG
	 5igv69JDygLHU7MZpp46rJeVYVa21NNl/znFRLqOTC1nSIzD/CFG8vUSdWUNX6PPyl
	 QzxfPAoEwR+AHgW5PFf3Z0WSHYyzpSGTt4hDLZaPlRJf5uyLJTQG9137Ob3dk++wd8
	 34V6mAEINb4a1+MGZRl78UP1jzE1f8LCnPa+FIaOhRQUOv2bF4bADCU6e7MHj680Lx
	 OnwxxB4v6xv2Q==
Date: Tue, 11 Aug 2026 18:11:21 -0500
From: Rob Herring <robh@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: nvme: Add apple,t8132-nvme-ans2
 compatible
Message-ID: <20260811231121.GA271810-robh@kernel.org>
References: <20260811-apple-nvme-t8132-v1-0-865be32e42c3@cyberchaos.dev>
 <20260811-apple-nvme-t8132-v1-1-865be32e42c3@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-apple-nvme-t8132-v1-1-865be32e42c3@cyberchaos.dev>

On Tue, Aug 11, 2026 at 10:49:47PM +0200, Yureka Lilian wrote:
> Add a new base compatible for the ANS2 NVMe on the Apple t8132 (M4) SoC,
> which uses a separate MMIO base for its NVMMU.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  .../devicetree/bindings/nvme/apple,nvme-ans.yaml   | 77 ++++++++++++++--------
>  1 file changed, 48 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
> index 4c0b1f90aff8..c8a41b268b9c 100644
> --- a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
> +++ b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
> @@ -16,6 +16,7 @@ properties:
>        - items:
>            - const: apple,t6020-nvme-ans2
>            - const: apple,t8103-nvme-ans2
> +      - const: apple,t8132-nvme-ans2
>        - items:
>            - enum:
>                # Do not add additional SoC to this list.
> @@ -24,16 +25,6 @@ properties:
>                - apple,t6000-nvme-ans2
>            - const: apple,nvme-ans2
>  
> -  reg:
> -    items:
> -      - description: NVMe and NVMMU registers
> -      - description: ANS2 co-processor control registers
> -
> -  reg-names:
> -    items:
> -      - const: nvme
> -      - const: ans
> -

Keep properties defined at the top level. More below.

>    resets:
>      maxItems: 1
>  
> @@ -68,25 +59,53 @@ properties:
>  
>        The SART address filter is documented in iommu/apple,sart.yaml.
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - apple,t6000-nvme-ans2
> -          - apple,t6020-nvme-ans2
> -then:
> -  properties:
> -    power-domains:
> -      minItems: 3
> -    power-domain-names:
> -      minItems: 3
> -else:
> -  properties:
> -    power-domains:
> -      maxItems: 2
> -    power-domain-names:
> -      maxItems: 2
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: apple,t8132-nvme-ans2
> +    then:
> +      properties:
> +        reg:
> +          items:
> +            - description: NVMMU registers
> +            - description: NVMe registers
> +            - description: ANS2 co-processor control registers
> +        reg-names:
> +          items:
> +            - const: nvmmu
> +            - const: nvme
> +            - const: ans

New entries go on the end. So nvmmu last and defined at the top level. 
Then this is just 'minItems: 3'

> +    else:
> +      properties:
> +        reg:
> +          items:
> +            - description: NVMe and NVMMU registers
> +            - description: ANS2 co-processor control registers
> +        reg-names:
> +          items:
> +            - const: nvme
> +            - const: ans

And 'maxItems: 2' on these 2.

Rob
