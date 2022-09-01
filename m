Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0FB6AA9
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 15:11:33 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id v26so14639303lfd.10
        for <asahi@lists.linux.dev>; Thu, 01 Sep 2022 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Ns5DU1nOfngp2+7giOu7t5+idfy4C3d8IqsGOFXmUks=;
        b=qs4Pv/jPOG27EPrTtcvWNOKNnbfrLo6Aw9McLhC5oHtI4egYvTBcREOdjcSplah8jh
         lzXxie+rxnziunZanrrAAkdjYVCAz2aAmVR+wlsAWplfgdlpwyFT7Y377hZRl4fLrtZz
         L/K4IrA7jAj3NuY1jOkCEoZ+NBJL9+46pOHdUjS02J8zkXuAsFZeNqG8nJ4inAwywNPH
         LnMTqZyfCxbqooKkNHGxIPI5MTb/koENgLx5XmTGw4R18RKo7LteRkrLBfJ7tu5Qv9VP
         iV8Hcj97sEWTAKOMO1hsjnAbjNhcknguZFI7GPn3L6Oz+tOy6ZrWRL7YZy/2DH82hwJD
         WwNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Ns5DU1nOfngp2+7giOu7t5+idfy4C3d8IqsGOFXmUks=;
        b=ujSTdOk4dokrziMZntjfMUhwXv7bEaAXx+R2p2RRpA6n2Fpo6c9+h9B5XpnI2ZXCMD
         MwXrb72Vx1P4C1f+bW3iM9+xPqGqndQj0bFSGAzzXGKW6Jit89d8umclksPfiQuYDLYh
         Vbef8IwO/4+T7rPbpHlHiVO5wZY1zvyoMOAdfwIMDSmWveRT3ygXYDHDpGcSTcBoX7j/
         /rt1C6GkoXJPd/7N2f6PTX2imtfZi0LEDoiuq+3eAfUSUfAglciMRgUmPYbNXHDpoxaU
         oGh+2KKQmZx+1nTsvzMLFL/UbTw/UbzbwZhEwjWSuZP96U+j0nzfBL30zE3phEM+X/Ay
         GnuA==
X-Gm-Message-State: ACgBeo09Y8WG98Qs9hukIoh1VVuzTXnI5PwISjgf/kno4lmNNUadQtC3
	ZUIZwNGJu+TcsDUbRDhnT+FB6Q==
X-Google-Smtp-Source: AA6agR6IuPNoybT1QM6ZvPT+EzZ7MbGZbMoz+EYsaE+0RKePK2D7gBiB5KtdC+0rly55i7aUrgmDeg==
X-Received: by 2002:a05:6512:402a:b0:494:9bb5:820 with SMTP id br42-20020a056512402a00b004949bb50820mr1018259lfb.175.1662045091971;
        Thu, 01 Sep 2022 08:11:31 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id i3-20020a2ea223000000b00262fa7bae79sm2102476ljm.81.2022.09.01.08.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:11:31 -0700 (PDT)
Message-ID: <5ad90366-e7ac-1cae-77ee-cc084e5a69d3@linaro.org>
Date: Thu, 1 Sep 2022 18:11:30 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/6] dt-bindings: gpio: add binding for the GPIO block for
 Apple Mac SMC
Content-Language: en-US
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 Sven Peter <sven@svenpeter.dev>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeM-003t9G-7S@rmk-PC.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <E1oTkeM-003t9G-7S@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/09/2022 16:54, Russell King (Oracle) wrote:
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../devicetree/bindings/gpio/gpio-macsmc.yaml | 28 +++++++++++++++++++
>  .../devicetree/bindings/mfd/apple,smc.yaml    |  4 +++
>  2 files changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> new file mode 100644
> index 000000000000..ee620fe50ca8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-macsmc.yaml
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#

filename based on the compatible... which is missing here, so this leads
to the question - why this is separate device/child node? It won't bind
to anything, won't be populated, right?

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller GPIO
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description:
> +  This describes the binding for the Apple Mac System Management Controller
> +  GPIO block.
> +
> +properties:
> +  gpio-controller: true
> +  '#gpio-cells':
> +    const: 2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    smc_gpio: gpio {
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +    };
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> index 794d3a6eb04a..bb799a27638d 100644
> --- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -34,6 +34,10 @@ title: Apple Mac System Management Controller
>      description:
>        A phandle to the mailbox channel
>  
> +patternProperties:

This is not a pattern, so "gpio" goes to "properties:".

> +  gpio:
> +    $ref: /schemas/gpio/gpio-macsmc.yaml
> +
>  additionalProperties: false
>  
>  required:


Best regards,
Krzysztof
