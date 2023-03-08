Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E9A36D
	for <asahi@lists.linux.dev>; Wed,  8 Mar 2023 23:15:49 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-17683b570b8so454611fac.13
        for <asahi@lists.linux.dev>; Wed, 08 Mar 2023 15:15:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678317348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYN1mGvw+BesOGmjKnVjW5qaCYL2NLcUZN6bNj4hymY=;
        b=B6HM8Onb80UzmTgznebBd92kJ5Jc9euxCqe7mBh0g3u5+0JvDL+zopsSpKc7P+DGNe
         lRIaWvKWBQiooF3FfPCzL031Zi2AMumCgJOSLccGKxUon7kOZN3mOBZUtBb7xc9KmyIk
         4CsFsuOvvt2TvyxnXxGYOKpxIEu/1lhz6mCSmy9b+M1pXpf011fwhx2zha1LVkfzT3iv
         vJc0/cyuct2uGsu6zhGnsBuYKB7fgtS+MXTtDuSMX9zYKIQdEAytZ+i/U7Bi2GIPm3eV
         ou+MkuCADVk9smFJArQMgJJMkd8VTmY5HNVzOlKIszIkxImLYlGt+QzY7YndLroPwYam
         NGZg==
X-Gm-Message-State: AO0yUKWt2sJIWdDVHieN09a5/3hYYZBpebWkLELh06Vn4FQleHBlGvFs
	1p4GB5ZKhjn3fHJ31AZeuA==
X-Google-Smtp-Source: AK7set+3Y1yRqQD4GNMNIxwBax8DMgnGF3zYCmHgGncdqoy23QFMf9depa6oFnXU7lhmUYbk+ssRow==
X-Received: by 2002:a05:6870:a118:b0:172:4d60:d4ef with SMTP id m24-20020a056870a11800b001724d60d4efmr12164922oae.14.1678317348534;
        Wed, 08 Mar 2023 15:15:48 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id zq41-20020a0568718ea900b0017703cd8ff6sm2080703oab.7.2023.03.08.15.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:15:48 -0800 (PST)
Received: (nullmailer pid 4055139 invoked by uid 1000);
	Wed, 08 Mar 2023 23:15:47 -0000
Date: Wed, 8 Mar 2023 17:15:47 -0600
From: Rob Herring <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, devicetree@vger.kernel.org, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, Mark Kettenis <kettenis@openbsd.org>, linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v3 05/15] dt-bindings: interrupt-controller: apple,aic2:
 Add apple,t8112-aic compatible
Message-ID: <167831734698.4055079.137179018203660288.robh@kernel.org>
References: <20230202-asahi-t8112-dt-v3-0-d1a5f6383d95@jannau.net>
 <20230202-asahi-t8112-dt-v3-5-d1a5f6383d95@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202-asahi-t8112-dt-v3-5-d1a5f6383d95@jannau.net>


On Tue, 07 Mar 2023 13:10:11 +0100, Janne Grunau wrote:
> The Apple M2 SoC uses AICv2 and is compatible with the existing driver.
> Add its per-SoC compatible.
> Since multi-die versions of the M2 are not expected decrease
> '#interrupt-cells' to 3 for apple,t8112-aic. This is seamlessly handled
> inside the driver.
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  .../bindings/interrupt-controller/apple,aic2.yaml  | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

