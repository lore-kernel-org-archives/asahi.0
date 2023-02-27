Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F3F79EF
	for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 19:51:41 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-172b0ba97b0so8604341fac.4
        for <asahi@lists.linux.dev>; Mon, 27 Feb 2023 11:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2w9C/mXgb39nbWWzCANJLsyjZIuLsO8IPSpBBNMA04=;
        b=BY0AXoVdQPgTIJO6hKq2wqIKOTAOvRmIQ093dw5ydaVSLuyDVaT/hIY15byegjLXjU
         AyksXIVlFvlu2yeEEXnl5KmVLvkyZofVgms67IZWnpXYcEyn3h4clDtFUX0UPIkzSh48
         zy1FKtEVqI/WfNBN2kNUluHlH7sOdzFXr6R0LvOH6KsZYIIH3O9gfbk8b8JouuYkpPZF
         zxiKoAmkSJts8x2JBROGUu5ZcmWmn/2SaHtSepxSA1Y/U9FUiBy2DkTxcaGEuWH7Ek5H
         +g1uvebxt0eQJqTQ9OqoTGu9LwQZ3BAmyBVEFz/SmmUkiIHpPxtvUbPpAZrz7ym0graI
         0GRQ==
X-Gm-Message-State: AO0yUKXqMZb+QUS/u674++fVxWYgBpMh+atnNzw16msAdxqOmzycXEq9
	EBWGjzc20HMo4IWC35Pv6A==
X-Google-Smtp-Source: AK7set8+QjpptCrKzerYds+IQtpA5ahwHgQ9R+U8uqnkDEbcdthD+ZZB5YTwTiygb3cfDhitheANoA==
X-Received: by 2002:a05:6871:586:b0:172:64f3:8430 with SMTP id u6-20020a056871058600b0017264f38430mr11660397oan.28.1677527500430;
        Mon, 27 Feb 2023 11:51:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m2-20020a056870194200b001727c3bf124sm2578392oak.31.2023.02.27.11.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 11:51:39 -0800 (PST)
Received: (nullmailer pid 749238 invoked by uid 1000);
	Mon, 27 Feb 2023 19:51:39 -0000
Date: Mon, 27 Feb 2023 13:51:39 -0600
From: Rob Herring <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, - <asahi@lists.linux.dev>, Henrik Rydberg <rydberg@bitmath.org>, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] dt-bindings: input: touchscreen: Add Z2
 controller bindings.
Message-ID: <20230227195139.GA677578-robh@kernel.org>
References: <20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com>
 <20230223-z2-for-ml-v1-1-028f2b85dc15@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223-z2-for-ml-v1-1-028f2b85dc15@gmail.com>

On Fri, Feb 24, 2023 at 11:20:06AM +0100, Sasha Finkelstein wrote:
> Add bindings for touchscreen controllers attached using the Z2 protocol.
> Those are present in most Apple devices.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../input/touchscreen/apple,z2-touchscreen.yaml    | 81 ++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/apple,z2-touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-touchscreen.yaml
> new file mode 100644
> index 000000000000..695594494b1e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/apple,z2-touchscreen.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/apple,z2-touchscreen.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple touchscreens attached using the Z2 protocol.
> +
> +maintainers:
> +  - asahi@lists.linux.dev
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description: A series of touschscreen controllers used in Apple products.
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: apple,z2-touchscreen

Is 'z2' anything other than a touchscreen? If not, '-touchscreen' is 
redundant. If so, then what else is there? You should be describing 
physical devices, not just a protocol for touchscreen.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:

Just 'interrupts' here. 'interrupts-extended' is implicitly supported.

> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  cs-gpios:

There is a standard way to do GPIO based chip-selects. It happens to be 
'cs-gpios', but this is in the wrong place. It goes in the SPI 
controller node.

> +    maxItems: 1
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  apple,z2-device-name:
> +    description: The name to be used for the input device
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  spi-max-frequency: true
> +
> +required:
> +  - compatible
> +  - interrupts-extended
> +  - reset-gpios
> +  - cs-gpios
> +  - firmware-name
> +  - apple,z2-device-name
> +  - touchscreen-size-x
> +  - touchscreen-size-y
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;

4 space indentation is preferred here.

> +
> +            touchscreen@0 {
> +                    compatible = "apple,z2-touchscreen";
> +                    reg = <0>;
> +                    spi-max-frequency = <11500000>;
> +                    reset-gpios = <&pinctrl_ap 139 0>;
> +                    cs-gpios = <&pinctrl_ap 109 0>;
> +                    interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
> +                    firmware-name = "apple/dfrmtfw-j293.bin";
> +                    touchscreen-size-x = <23045>;
> +                    touchscreen-size-y = <640>;
> +                    apple,z2-device-name = "MacBookPro17,1 Touch Bar";

Why do we need this string? If you want a human consumed label for 
some identification, we have a property for that purpose. It's called 
'label'. But when there is only 1 instance, I don't really see the 
point.

Rob
