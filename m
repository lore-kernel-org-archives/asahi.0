Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9440928F4
	for <asahi@lists.linux.dev>; Mon, 10 Oct 2022 12:27:27 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-136b5dd6655so433972fac.3
        for <asahi@lists.linux.dev>; Mon, 10 Oct 2022 05:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XimozxtCM3OTFQP29kmIOvI38zdZ6QInZnUvN9y4CQ=;
        b=ufSEB2JSZ9LVO9s9iZ/2ze+QBVJtcwwmmzX+rqV1xT8D1g1IQsANl5NTZaoZUk1FNt
         9n3j9rFrITUPpvwN5uc/58tuOgf9RFE2sGnqxeJaORkGHjyVQtQbqw/y4O2S5vN8j3ym
         4KA0Uj5mgxQyml4VN1UOp6EOcFOW81lCDhVN8umpj3CPjoy0/LwQh1bMlP/86lcGvdGR
         lQzMIrKAaL4E+OAqHlrN3E/+wm5F27Elm9kmkfK487vNMB0+/bwUs8O/LKrmkV1bg3E8
         jAFUPgZ9/Rt/WYNnd9j4Md8wp+XLx2jNUYghQkuHfhXCAH6aqfPxSiUyUEdf5F4Qch4f
         5LfQ==
X-Gm-Message-State: ACrzQf3TUS4IC4yJvUT5NI8pkYg4lUXEzNMhpv8fWDfkF9su+i2T7ExZ
	YAyXVFeOdmEoqqwM+cPCDw==
X-Google-Smtp-Source: AMsMyM4Wraf8Vgk7cNKGKpmIo2CmacT/qVRhLbZIlf30aykw5iXbY/fXUC23XjS4RuVb6w1V6WP4Ow==
X-Received: by 2002:a05:6870:9a05:b0:132:ebf:dc61 with SMTP id fo5-20020a0568709a0500b001320ebfdc61mr9506149oab.76.1665404846584;
        Mon, 10 Oct 2022 05:27:26 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q13-20020a9d654d000000b0066193fe498bsm2043389otl.28.2022.10.10.05.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 05:27:26 -0700 (PDT)
Received: (nullmailer pid 442613 invoked by uid 1000);
	Mon, 10 Oct 2022 12:27:27 -0000
Date: Mon, 10 Oct 2022 07:27:27 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, martin.botka@somainline.org, angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org, jamipkettunen@somainline.org, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: apple,aic: Document A7-A11
 compatibles
Message-ID: <20221010122727.GA432201-robh@kernel.org>
References: <20221007200022.22844-1-konrad.dybcio@somainline.org>
 <20221007200022.22844-2-konrad.dybcio@somainline.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007200022.22844-2-konrad.dybcio@somainline.org>

On Fri, Oct 07, 2022 at 10:00:21PM +0200, Konrad Dybcio wrote:
> Document the compatibles for Apple A7-A11 SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v3:
> - Bindings: A7-A10+M1 only get SoC compat and generic fallback,
> A11 gets M1 fallback and generic fallback (removed A11 compatible)

I have no idea if that makes sense or not. Do I have to go read the 
rationale in the prior version?

The question to ask on fallbacks, is would s/w that only understands the 
fallback compatible work as-is?

> - Drop Rob's A-b as this is essentially yet another rewrite..
> 
>  .../bindings/interrupt-controller/apple,aic.yaml | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> index e18107eafe7c..1427ea9b04a2 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> @@ -36,9 +36,19 @@ allOf:
>  
>  properties:
>    compatible:
> -    items:
> -      - const: apple,t8103-aic
> -      - const: apple,aic
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,s5l8960x-aic
> +              - apple,s8000-aic
> +              - apple,t7000-aic
> +              - apple,t8010-aic
> +              - apple,t8103-aic
> +          - const: apple,aic
> +      - items:
> +          - const: apple,t8015-aic
> +          - const: apple,t8103-aic
> +          - const: apple,aic
>  
>    interrupt-controller: true
>  
> -- 
> 2.37.3
> 
> 
