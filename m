Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD1C2588
	for <asahi@lists.linux.dev>; Sun, 20 Nov 2022 18:00:32 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-14286d5ebc3so8163186fac.3
        for <asahi@lists.linux.dev>; Sun, 20 Nov 2022 10:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqDV5bEOonkQKcGjRa8rDOkspDvNLwiewUYppvmzsG4=;
        b=sueB+9RkZuRuzcrec65qkhnFCt/eCpJPaa3Fo6xZV+oUKQCjvaGJlh2MN3edEMRqsA
         ahg3z9PkVFml5XiedqwY/27NSR/Lac53zl1P4i6bxAat6c/dOrrVqCjkVL947vnDYlrt
         +SoO6k7RqQJlSQ8amvRt56sShSJzUuHGifl3PflgqdxWvLWM/9djDWew558QuSaxVTzq
         XdTZybDu+QevhjTFpbn52wtUMQwlsoKtN3ds69DSXhtyUOF2KJxJr2qRqrxNQj8TfT4F
         NsFcPf5ERJX5eXqdWvJj00vLFrBOkPTtaneU2KrOLmUkrjoUTm8mdFwpGGU5m1rR53sh
         D7Cg==
X-Gm-Message-State: ANoB5pkjs8yVSuRBQahWenzF5C/7L2PImQptstMNFEUfA7mgpMKJl+F7
	aLyaZd0Y5G3cmMUKq+jkUA==
X-Google-Smtp-Source: AA0mqf59xqJp3I6E88kVPzETemIzIGpnJbqw6uctCutxVSc8VS3ZmMs7qXwBj7/o6UDxxyLKSGwJdQ==
X-Received: by 2002:a05:6870:9688:b0:141:51a8:2d19 with SMTP id o8-20020a056870968800b0014151a82d19mr1637577oaq.187.1668967231043;
        Sun, 20 Nov 2022 10:00:31 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f8:5cb3:df5a:23c3:86fb:15a6])
        by smtp.gmail.com with ESMTPSA id 123-20020aca0781000000b00349a06c581fsm3493232oih.3.2022.11.20.10.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 10:00:30 -0800 (PST)
Received: (nullmailer pid 3265089 invoked by uid 1000);
	Sun, 20 Nov 2022 18:00:30 -0000
Date: Sun, 20 Nov 2022 12:00:30 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sameer Pujar <spujar@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, linux-tegra@vger.kernel.org, Dmitry Osipenko <dmitry.osipenko@collabora.com>, Janne Grunau <j@jannau.net>, Ashish Mhetre <amhetre@nvidia.com>, Lucas Stach <l.stach@pengutronix.de>, devicetree@vger.kernel.org, Krishna Reddy <vdumpa@nvidia.com>, asahi@lists.linux.dev, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Nicolin Chen <nicolinc@nvidia.com>, Rob Herring <robh+dt@kernel.org>, iommu@lists.linux-foundation.org
Subject: Re: [PATCH v12 1/4] of: Introduce of_translate_dma_region()
Message-ID: <166896722896.3265021.2815009340512697667.robh@kernel.org>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
 <20221117185424.2359687-2-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117185424.2359687-2-thierry.reding@gmail.com>


On Thu, 17 Nov 2022 19:54:21 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This function is similar to of_translate_dma_address() but also reads a
> length in addition to an address from a device tree property.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/of/address.c       | 41 ++++++++++++++++++++++++++++++++++++++
>  include/linux/of_address.h |  2 ++
>  2 files changed, 43 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
