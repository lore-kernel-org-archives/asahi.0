Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB825CA6
	for <asahi@lists.linux.dev>; Wed,  7 Sep 2022 15:38:25 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id h20-20020a056830165400b00638ac7ddba5so10533306otr.4
        for <asahi@lists.linux.dev>; Wed, 07 Sep 2022 08:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=KSoB0G6pzRD9DIaWPNDedKDIgG6tTjWjaUw36ufPm4w=;
        b=jGfAP7eak4sbXXl3ReexIdg4oq4c53XI0kBaHkJtwDS6QZRB3//18SEoDHXFTWHiXr
         taG0ZGfHp4v2K2AtqGTyNP19vfyTMFOwzHhnEc1c4pR8L4heQZFYW94M1hiHr584Y4HA
         +Cvdg3UPLtT3nkZtnkdicbnzFvyGG7B3B9BDrSwfVM/OHAfYzN6TKXfl4hgCaULPHBFY
         ikFlmG+K15t6C5OOURjAOA0gZ/XV5NwLFcEy/0gOxWQEA5xJJ++vQY3ZS+dGFEj9/LGJ
         ZKwwqguWLvbrvx3VyEFNZmeMUZew65XTb8ExBOY3hEzmkTAtkW6s4H2Ia3RoYt8wDuhx
         +r6w==
X-Gm-Message-State: ACgBeo2MjuGjBM/XAbshr2kIZ/6Vbp27Ub638aaTmoNRLzDDt+OytB2s
	rH8Vdnx1Q/kCbRnxfnS+nA==
X-Google-Smtp-Source: AA6agR7cHntWzuv22mM6yjZi+6RNKL5IJKl5pY/iSsPF1rL/uA/vWpzkdCz2m1iQhfyCAPlQWPYbhw==
X-Received: by 2002:a9d:5508:0:b0:636:ee02:ff7c with SMTP id l8-20020a9d5508000000b00636ee02ff7cmr1745217oth.249.1662565104411;
        Wed, 07 Sep 2022 08:38:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bm23-20020a0568081a9700b0034480f7eec4sm6550747oib.12.2022.09.07.08.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 08:38:23 -0700 (PDT)
Received: (nullmailer pid 3498322 invoked by uid 1000);
	Wed, 07 Sep 2022 15:38:23 -0000
Date: Wed, 7 Sep 2022 10:38:22 -0500
From: Rob Herring <robh@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>, Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 2/7] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Message-ID: <20220907153822.GA3492530-robh@kernel.org>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUI-005CmB-84@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1oVYUI-005CmB-84@rmk-PC.armlinux.org.uk>

On Tue, Sep 06, 2022 at 02:19:34PM +0100, Russell King (Oracle) wrote:
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

Please move the example to the mfd schema. One complete example rather 
than piecemeal examples.

> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> index 168f237c2962..47e3cd58bf19 100644
> --- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -37,6 +37,10 @@ title: Apple Mac System Management Controller
>      description:
>        A phandle to the mailbox channel
>  
> +patternProperties:
> +  gpio:
> +    $ref: /schemas/gpio/gpio-macsmc.yaml
> +

Reorder the patches such that the MFD binding is last and this hunk can 
be part of it.

Rob
