Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F5256F
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 11:12:29 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id bk16so11745554wrb.11
        for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 03:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vRFquoyZ7W+fz0JtXsoCdIgSKHksw0Z4uRyOB2Z5ZWY=;
        b=Y+hdciEcs6qDtQF8GyfyWrMrEk7YYEUKYjJrN52A324yNunTTuHtFHuiAlw1JEYZFH
         5BzC19DsnBa+BxmH9IuQiKlfi+dk1xdovTrRJBOqTc1AxiwZfjRe2RjPKamHYh7RPo1a
         R0yK6HfYG71Mm1iQCR0CjC9AtQCbp5c9ydmXbOrGskCXD0VIWyTDF8+g7Nb4NVRR8J7n
         q6HPuy/pcNyY2yIlwEGKJGnEC170GhhAfM2xYyMT236cDkJj1SmYXSehFkZPmZZqAm7z
         rHjfRx+PzmXpAkiA+zSjejy6hfRJZzd5yIOHrNwoZT94m5WpVHYtXiW9EhCrt+DQggVX
         mALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vRFquoyZ7W+fz0JtXsoCdIgSKHksw0Z4uRyOB2Z5ZWY=;
        b=1TU5oeVqkRoFgDY/90bOMEhhoXix+cUo9W+gUHdFcq4ys0Dg10Q4E4dK/b1iXbUPxB
         68fdfFmLr6PWdlYIZYjgKt5AYda6qG7YsOddBxhSBh8GaXgTxK7cJVKVVX0CLElQI+Mf
         iWp524g0N4i98+NGNB779f7IKznaZZHZWlVkydoysfGoW9s2doiSoJbzP7YSJElQiM+v
         XdxIywDPGn/sFHRoOn6w2i+yCS4Tj0PH0ndkYhj8DOzUnN2UKEZQUfNqN6AYyDEdfaIn
         6pkQFc5FI3AtPMqHYTisIocP488PSQ03RHCSRJmTc/tcqQFi6X2BYSMIk6Px0BYS8ppS
         XJIA==
X-Gm-Message-State: AO0yUKUQqRmpBviwmLX5gBw477MIoAq5R27EkqQ5R/7n+d5fDWL3almN
	jCpS7z/1Z1D/c91Az+7EtaAyEA==
X-Google-Smtp-Source: AK7set8hVfd+4Hs9+OuZUArQfQii4ry4u07feXt68G8la8Entcc73g7K9OFX7kHRirThVpuPhJxKVg==
X-Received: by 2002:a5d:5005:0:b0:2c5:584b:4f65 with SMTP id e5-20020a5d5005000000b002c5584b4f65mr2426902wrt.32.1676286748229;
        Mon, 13 Feb 2023 03:12:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x10-20020a5d54ca000000b002bfb5ebf8cfsm9987973wrv.21.2023.02.13.03.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:12:27 -0800 (PST)
Message-ID: <2f5a63ba-f4de-da89-7621-3fe1d79cdc94@linaro.org>
Date: Mon, 13 Feb 2023 12:12:25 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/17] dt-bindings: interrupt-controller: apple,aic2: Add
 apple,t8112-aic compatible
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-5-cb5442d1c229@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v1-5-cb5442d1c229@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2023 16:41, Janne Grunau wrote:
> The Apple M2 SoC uses AICv2 and is compatible with the existing driver.
> Add its per-SoC compatible.
> Since multi-die versions of the M2 are not expected decrease
> '#interrupt-cells' to 3 for apple,t8112-aic. This is seamlessly handled
> inside the driver.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> 
> ---
> This trivial dt-bindings update should be merged through the asahi-soc
> tree to ensure validation of the Apple M2 (t8112) devicetrees in this
> series.
> ---
>  .../bindings/interrupt-controller/apple,aic2.yaml  | 23 +++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> index 06948c0e36a5..120e23ff668c 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
> @@ -31,19 +31,22 @@ description: |
>  properties:
>    compatible:
>      items:
> -      - const: apple,t6000-aic
> +      - enum:
> +          - apple,t8112-aic
> +          - apple,t6000-aic
>        - const: apple,aic2
>  
>    interrupt-controller: true
>  
>    '#interrupt-cells':
> -    const: 4
> +    minimum: 3
> +    maximum: 4
>      description: |
>        The 1st cell contains the interrupt type:
>          - 0: Hardware IRQ
>          - 1: FIQ
>  
> -      The 2nd cell contains the die ID.
> +      The 2nd cell contains the die ID (optional).
>  
>        The next cell contains the interrupt number.
>          - HW IRQs: interrupt number
> @@ -98,6 +101,20 @@ properties:
>            - apple,fiq-index
>            - cpus
>  
> +if:

Put it under allOf. After "required:", just like example-schema asks for.

> +  properties:
> +    compatible:
> +      contains:
> +        const: apple,t8112-aic
> +then:
> +  properties:
> +    '#interrupt-cells':
> +      maximum: 3

Shouldn't this be:
const: 3

> +else:
> +  properties:
> +    '#interrupt-cells':
> +      minimum: 4

const: 4


Best regards,
Krzysztof

