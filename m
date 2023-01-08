Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B231859
	for <asahi@lists.linux.dev>; Sun,  8 Jan 2023 21:31:35 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id h10so4974200qvq.7
        for <asahi@lists.linux.dev>; Sun, 08 Jan 2023 13:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=js0w/jb+lh+/4h7Fj3cofK1pNZXgAj1iZs13t0WEx7U=;
        b=GnEEBBoxW10jei/TZ7vqD3g5J7zQsJvcdBQxGz4mBBibnOE4y1OCuQ32L0ArWHAz1B
         vnr1Nc4c/qdg0JxoIYztOJrzNoBrhGw4uXdV4Jn5R8FeY9sVX68iFml8ugWzveIUwWfI
         R6AJ9PNJgp43WcJj7yG8gvn8a5xXBVHltxRMCHG2zjdJJxGC1aQzbMX/3WzaficlK3fT
         pHTdg01VYHGYYbSSSwl/ldnDm4M09StKmh3OKjmUiYtJ1xmxuKixxU4xeT+92m8q36qe
         8ozZ4tmPafoLruPh7GDQs2VCi4XW06RP9J2OtEr+GNFtmiOnszaUnKEvSPaBu7lgF6ix
         whzg==
X-Gm-Message-State: AFqh2kprohNo90EVrpRgNEW3AUOd2KYGsvdxC/WUBbG/QxKjzw4fN4LS
	WcyLgmmML9WQmWQ6AaOERw==
X-Google-Smtp-Source: AMrXdXuBm+J+Rynuin0d2pDwJb7zmpV8C55xdiobHV2KiVZ4+Tky8PsFOPSUUj6AjwE8vmlqoBWtGw==
X-Received: by 2002:a0c:80e4:0:b0:531:91cd:59de with SMTP id 91-20020a0c80e4000000b0053191cd59demr59201574qvb.26.1673213494064;
        Sun, 08 Jan 2023 13:31:34 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80a5:9b51:39ae:24d1:33f3:811e])
        by smtp.gmail.com with ESMTPSA id l23-20020a37f917000000b006fc2b672950sm4256353qkj.37.2023.01.08.13.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 13:31:33 -0800 (PST)
Received: (nullmailer pid 306308 invoked by uid 1000);
	Sun, 08 Jan 2023 21:31:19 -0000
Date: Sun, 8 Jan 2023 15:31:19 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>, devicetree@vger.kernel.org, Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 4/5] spi: dt-bindings: Add hold/inactive CS delay
 peripheral properties
Message-ID: <167321346258.305589.13314015291667781400.robh@kernel.org>
References: <20230104093631.15611-1-marcan@marcan.st>
 <20230104093631.15611-5-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104093631.15611-5-marcan@marcan.st>


On Wed, 04 Jan 2023 18:36:30 +0900, Hector Martin wrote:
> From: Janne Grunau <j@jannau.net>
> 
> These two properties complete the bindings for the Linux spi_device cs
> model, which includes cs_setup, cs_hold and cs_inactive delay values.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
