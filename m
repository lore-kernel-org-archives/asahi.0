Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70F9210B;
	Sun,  5 Nov 2023 19:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kt4wvrDK"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so2966101a12.1;
        Sun, 05 Nov 2023 11:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699211089; x=1699815889; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aO8B5quC/11QSm14MuwPeLJeguSut/5d3FqyrObYeMM=;
        b=Kt4wvrDKf2oFoHU24Vy9lrV4E6yVFZwDSiDx9DioeR85BzO61WnPoQb0mIeWrKswWp
         mFUpH8b/wfBFHpLSTTojZnhiTYP0bQVFi5uf+D9vLGyrfZREuWnWZF7tj+0HyWvn0Kyy
         uKsR/l3lalW7hgpryldq6310woBv2XOmxTNERb7Fg782QmG8DBCC2IW05J6R6Sz3jhzI
         sfD2o1SYC8X1PkXSSc7G+J3uM+x8otz2KgElmrKfYxS2eXnT4E8EARQX6ioixuX2C/iF
         FzAolBcltGHXl1YYhHv7cUwfbTzCIbVHimTCic5hms8cU2QGHgWCJ8K31epx5QWEl0TC
         iwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699211089; x=1699815889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aO8B5quC/11QSm14MuwPeLJeguSut/5d3FqyrObYeMM=;
        b=myMzfOeuVG75qgdG8UY70p6hsbHdhz+r0EgiSdicnJRCi2+CH9cgNmMDMvQetmCcGh
         UlVjw18J45q3Q+no0ZZRJvveNqNmgL+n6965j12yk/YsoLccugHs0xyXRQ2SKaAum9od
         //tlw5symayrGHPW0vVrsP4jQRriOEXREV04vzgvrzQmnlmZenj/OaLrRVN4mxwI5pQy
         C3yMA4VmUb6vY3gICdClY/NDCGmvBXPpL6vXlHP1CTwrYrOyBRL/bxC9ZhwGU2J2YsCo
         h5u1fPolNT/mJV57eRturg98vNXR/lXiPUvl0UoUauAf5WaEsEG1TrCoKTV12TfLy6on
         E+Pw==
X-Gm-Message-State: AOJu0Yy08nCoIZHNm5QFVzQiYX2gitmlo2BKTVfM3b0CKpDuPnSaOPoN
	mjacabTd9L5bloVpqSrAQo4=
X-Google-Smtp-Source: AGHT+IFoPm0Mv0Ciyr9HDZnFczApZU31y8PP80japS05XzH0EgDa7iuXk+2mZ+qAQG3pjJ7WjmBEPA==
X-Received: by 2002:a17:902:ec84:b0:1cc:4cb0:d273 with SMTP id x4-20020a170902ec8400b001cc4cb0d273mr24468221plg.56.1699211088814;
        Sun, 05 Nov 2023 11:04:48 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b001c61bde04a7sm4457615plg.276.2023.11.05.11.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Nov 2023 11:04:48 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b73c2fa3-0366-4f7f-ae27-a8b5dab1a28f@roeck-us.net>
Date: Sun, 5 Nov 2023 11:04:45 -0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: re-order entries to match
 coding convention
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 Oleksij Rempel <linux@rempel-privat.de>, Justin Chen
 <justinpopo6@gmail.com>, =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>,
 Baruch Siach <baruch@tkos.co.il>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Jamie Iles <jamie@jamieiles.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20231105184154.43700-1-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231105184154.43700-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/23 10:41, Krzysztof Kozlowski wrote:
> The Devicetree bindings coding convention, as used in most of the files
> and expressed in Documentation/devicetree/bindings/example-schema.yaml,
> expects:
> 1. "allOf:" block just before "properties:" (or after "required:" for
>     more complex cases),
> 2. additionalProperties/unevaluatedProperties at the end of the file,
>     just before the examples section.
> 
> Re-order few schemas to match the convention to avoid repeating review
> comments for new patches using existing code as template.  No functional
> changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   .../bindings/watchdog/allwinner,sun4i-a10-wdt.yaml     |  6 +++---
>   .../bindings/watchdog/alphascale,asm9260-wdt.yaml      |  6 +++---
>   .../devicetree/bindings/watchdog/apple,wdt.yaml        |  6 +++---
>   .../devicetree/bindings/watchdog/arm-smc-wdt.yaml      |  6 +++---
>   .../devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml | 10 +++++-----
>   .../devicetree/bindings/watchdog/cnxt,cx92755-wdt.yaml |  6 +++---
>   .../devicetree/bindings/watchdog/maxim,max63xx.yaml    |  8 ++++----
>   .../devicetree/bindings/watchdog/snps,dw-wdt.yaml      | 10 +++++-----
>   8 files changed, 29 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> index 274519fc24fd..64c8f7393809 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
> @@ -6,13 +6,13 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Allwinner A10 Watchdog
>   
> -allOf:
> -  - $ref: watchdog.yaml#
> -
>   maintainers:
>     - Chen-Yu Tsai <wens@csie.org>
>     - Maxime Ripard <mripard@kernel.org>
>   
> +allOf:
> +  - $ref: watchdog.yaml#
> +
>   properties:
>     compatible:
>       oneOf:
> diff --git a/Documentation/devicetree/bindings/watchdog/alphascale,asm9260-wdt.yaml b/Documentation/devicetree/bindings/watchdog/alphascale,asm9260-wdt.yaml
> index fea84f5b7e6d..6425fe51d20c 100644
> --- a/Documentation/devicetree/bindings/watchdog/alphascale,asm9260-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/alphascale,asm9260-wdt.yaml
> @@ -6,12 +6,12 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Alphascale asm9260 Watchdog timer
>   
> -allOf:
> -  - $ref: watchdog.yaml#
> -
>   maintainers:
>     - Oleksij Rempel <linux@rempel-privat.de>
>   
> +allOf:
> +  - $ref: watchdog.yaml#
> +
>   properties:
>     compatible:
>       const: alphascale,asm9260-wdt
> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> index 929681127df0..21872e15916c 100644
> --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> @@ -6,12 +6,12 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Apple SoC Watchdog
>   
> -allOf:
> -  - $ref: watchdog.yaml#
> -
>   maintainers:
>     - Sven Peter <sven@svenpeter.dev>
>   
> +allOf:
> +  - $ref: watchdog.yaml#
> +
>   properties:
>     compatible:
>       items:
> diff --git a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
> index b5573852ef5a..8e9d0b7e8244 100644
> --- a/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
> @@ -6,12 +6,12 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: ARM Secure Monitor Call based watchdog
>   
> -allOf:
> -  - $ref: watchdog.yaml#
> -
>   maintainers:
>     - Julius Werner <jwerner@chromium.org>
>   
> +allOf:
> +  - $ref: watchdog.yaml#
> +
>   properties:
>     compatible:
>       enum:
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> index 526ff908d134..e898167ef628 100644
> --- a/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm7038-wdt.yaml
> @@ -6,14 +6,14 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: BCM63xx and BCM7038 watchdog timer
>   
> -allOf:
> -  - $ref: watchdog.yaml#
> -
>   maintainers:
>     - Florian Fainelli <f.fainelli@gmail.com>
>     - Justin Chen <justinpopo6@gmail.com>
>     - Rafał Miłecki <rafal@milecki.pl>
>   
> +allOf:
> +  - $ref: watchdog.yaml#
> +
>   properties:
>     compatible:
>       enum:
> @@ -29,11 +29,11 @@ properties:
>         The clock running the watchdog. If no clock is found the driver will
>         default to 27000000 Hz.
>   
> -unevaluatedProperties: false
> -
>   required:
>     - reg
>   
> +unevaluatedProperties: false
> +
>   examples:
>     - |
>       watchdog@f040a7e8 {
> diff --git a/Documentation/devicetree/bindings/watchdog/cnxt,cx92755-wdt.yaml b/Documentation/devicetree/bindings/watchdog/cnxt,cx92755-wdt.yaml
> index 1844d7e026fe..13236ee61f6f 100644
> --- a/Documentation/devicetree/bindings/watchdog/cnxt,cx92755-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/cnxt,cx92755-wdt.yaml
> @@ -12,12 +12,12 @@ description: |
>     timer counters. The first timer (called "Timer A") is the only one that can be
>     used as watchdog.
>   
> -allOf:
> -  - $ref: watchdog.yaml#
> -
>   maintainers:
>     - Baruch Siach <baruch@tkos.co.il>
>   
> +allOf:
> +  - $ref: watchdog.yaml#
> +
>   properties:
>     compatible:
>       const: cnxt,cx92755-wdt
> diff --git a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> index 1a6490c43d89..442c21f12a3b 100644
> --- a/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> @@ -6,14 +6,14 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Maxim 63xx Watchdog Timers
>   
> -allOf:
> -  - $ref: watchdog.yaml#
> -  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
> -
>   maintainers:
>     - Marc Zyngier <maz@kernel.org>
>     - Linus Walleij <linus.walleij@linaro.org>
>   
> +allOf:
> +  - $ref: watchdog.yaml#
> +  - $ref: /schemas/memory-controllers/mc-peripheral-props.yaml#
> +
>   properties:
>     compatible:
>       enum:
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index 76eceeddd150..c7aab0418a32 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -6,12 +6,12 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Synopsys Designware Watchdog Timer
>   
> -allOf:
> -  - $ref: watchdog.yaml#
> -
>   maintainers:
>     - Jamie Iles <jamie@jamieiles.com>
>   
> +allOf:
> +  - $ref: watchdog.yaml#
> +
>   properties:
>     compatible:
>       oneOf:
> @@ -73,13 +73,13 @@ properties:
>       minItems: 16
>       maxItems: 16
>   
> -unevaluatedProperties: false
> -
>   required:
>     - compatible
>     - reg
>     - clocks
>   
> +unevaluatedProperties: false
> +
>   examples:
>     - |
>       watchdog@ffd02000 {

