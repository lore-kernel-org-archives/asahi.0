Received: from sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D725381
	for <asahi@lists.linux.dev>; Tue,  6 Sep 2022 14:04:18 +0000 (UTC)
Received: from localhost (bloch.sibelius.xs4all.nl [local])
	by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 81783d33;
	Tue, 6 Sep 2022 16:04:14 +0200 (CEST)
Date: Tue, 6 Sep 2022 16:04:14 +0200 (CEST)
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: arnd@arndb.de, lee@kernel.org, linus.walleij@linaro.org,
	alyssa@rosenzweig.io, andriy.shevchenko@linux.intel.com,
	asahi@lists.linux.dev, brgl@bgdev.pl,
	devicetree@vger.kernel.org, marcan@marcan.st, corbet@lwn.net,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	pmladek@suse.com, linux@rasmusvillemoes.dk,
	robh+dt@kernel.org, senozhatsky@chromium.org,
	rostedt@goodmis.org, sven@svenpeter.dev
In-Reply-To: <E1oVYUD-005Cm5-3Z@rmk-PC.armlinux.org.uk>
	(rmk+kernel@armlinux.org.uk)
Subject: Re: [PATCH 1/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk> <E1oVYUD-005Cm5-3Z@rmk-PC.armlinux.org.uk>
Message-ID: <d3ced06b04394f98@bloch.sibelius.xs4all.nl>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Date: Tue, 06 Sep 2022 14:19:29 +0100
> 
> Add a DT binding for the Apple Mac System Management Controller.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> ---
>  .../devicetree/bindings/mfd/apple,smc.yaml    | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> new file mode 100644
> index 000000000000..168f237c2962
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description:
> +  Apple Mac System Management Controller implements various functions
> +  such as GPIO, RTC, power, reboot.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t6000-smc
> +          - apple,t8103-smc
> +          - apple,t8112-smc
> +      - const: apple,smc
> +
> +  reg:
> +    items:
> +      - description: SMC area
> +      - description: SRAM area
> +
> +  reg-names:
> +    items:
> +      - const: smc
> +      - const: sram
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      A phandle to the mailbox channel
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - mboxes
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      smc@23e400000 {
> +        compatible = "apple,t8103-smc", "apple,smc";
> +        reg = <0x2 0x3e400000 0x0 0x4000>,
> +               <0x2 0x3fe00000 0x0 0x100000>;
> +        reg-names = "smc", "sram";
> +        mboxes = <&smc_mbox>;
> +      };
> +    };
> -- 
> 2.30.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
