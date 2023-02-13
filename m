Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EC22914
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 11:15:58 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so10989541wmb.4
        for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 03:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zJs6Gt++hrpS7gh9EARbw7HtjPFCDbsklb+H/wB5MFo=;
        b=JKDUwkCjofjgMZMYkBWtNOCg5aMMoCrZnfhgJVFwZSHEiDoI98z+QqLh+QFEjEkVJq
         y+eaXlPZnBWcnl7qDBoDPsUwjNvAM4DSO92kJfnI3viu14lWeXaZX9i5z3q8HQNnF2AW
         tAhZMmsO+RoFiur7KhJsAXlRCH0xJ2Uu3wQ6Qq+tHQa0b9TFzM2ptZDTuvRvjG3hQ+kQ
         GwRiVoVKFedOp95ginUfbBpWT1cpklEZmqSC/jhgjKZWPKkMR/D58hmEBU9AQ7tXOAeq
         8oy+J9OOmsiS+uTca1gm21eqYyarTEijXDPUZqyCeVwBJDg251m20uGKVvpVpYlYOCQx
         F1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJs6Gt++hrpS7gh9EARbw7HtjPFCDbsklb+H/wB5MFo=;
        b=b1NiNRGvYf7VtrVhTCvfGPwiY5ktx0ZOWLaH7fxxq0DncPstgnr+JBS7Mpbvc02MKS
         FEqc//gHhQoOLdbweMjUocJi+SGqfpMXdWE8uPtz40I+cSrquqINN2u5Rp4EtT2W/BPJ
         DFe5tR7pnBRqffnuW7QgBeRcHMPIiyfB6wcDKK0cibsO4lSmYNqfuUEJoPGP12Czl1U/
         6OcXmhafLyxBcPBzKfdYXtGurmvaHtGdmixR7kAlbpcIFFmHScnpqz0GT2P+W5iUTtnN
         /Kn9e4ikcsoCmYUoM/ouMKDpnXIvdH6p99s6YcVxgxQiNDOxB1g97g4I5z2LVnsdrBp7
         82RQ==
X-Gm-Message-State: AO0yUKWvqwQCdy7RxySOgGSPlGjblMMggoj653kdwVC5TabXdrwet4uz
	HIOeBbhz8pHVuj3U3vXsoTTQ/w==
X-Google-Smtp-Source: AK7set+s64baFyGBQVgb5rzFpUON8705cwSgi6aZvdBhFxJO4XPBTc9OoP7M4IJNWcG4kS+WqboUvA==
X-Received: by 2002:a05:600c:4910:b0:3e0:c97:f1d0 with SMTP id f16-20020a05600c491000b003e00c97f1d0mr19060412wmp.20.1676286957408;
        Mon, 13 Feb 2023 03:15:57 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e1-20020a05600c4e4100b003dc49e0132asm17166681wmq.1.2023.02.13.03.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:15:57 -0800 (PST)
Message-ID: <101940e8-c149-dd81-4abc-2a1479c19a9f@linaro.org>
Date: Mon, 13 Feb 2023 12:15:55 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 16/17] dt-bindings: arm: apple: Add t8112 j413/j473/j493
 compatibles
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-16-cb5442d1c229@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202-asahi-t8112-dt-v1-16-cb5442d1c229@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2023 16:41, Janne Grunau wrote:
> This adds the following apple,t8112 platforms:
> 
> - apple,j413 - MacBook Air (M2, 2022)
> - apple,j473 - Mac mini (M2, 2023)
> - apple,j493 - MacBook Pro (13-inch, M2, 2022)
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/arm/apple.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
> index da78c69774f2..883fd67e3752 100644
> --- a/Documentation/devicetree/bindings/arm/apple.yaml
> +++ b/Documentation/devicetree/bindings/arm/apple.yaml
> @@ -19,6 +19,12 @@ description: |
>    - MacBook Air (M1, 2020)
>    - iMac (24-inch, M1, 2021)
>  
> +  Devices based on the "M2" SoC:
> +
> +  - MacBook Air (M2, 2022)
> +  - MacBook Pro (13-inch, M2, 2022)
> +  - Mac mini (M2, 2023)

Aren't you now repeating exactly what is in the schema? Keep only one...

> +
>    And devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
>  
>    - MacBook Pro (14-inch, M1 Pro, 2021)
> @@ -70,6 +76,15 @@ properties:
>            - const: apple,t8103
>            - const: apple,arm-platform
>  
> +      - description: Apple M2 SoC based platforms
> +        items:
> +          - enum:
> +              - apple,j413 # MacBook Air (M2, 2022)
> +              - apple,j473 # Mac mini (M2, 2023)
> +              - apple,j493 # MacBook Pro (13-inch, M2, 2022)


Best regards,
Krzysztof

