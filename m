Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB028D53E
	for <asahi@lists.linux.dev>; Wed, 16 Nov 2022 20:20:43 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-13be3ef361dso21397589fac.12
        for <asahi@lists.linux.dev>; Wed, 16 Nov 2022 12:20:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEQuGcKL75SJczpS8n3Wx3/MDRco2lY+FUfcllX1Fmg=;
        b=PTUn/U4t5IMFb6TiLi3yd8y+QFnRWHhn0hFW5fvhPBaelZ6CL7q8Y7aq+fMOLRMaq+
         GLadcB6VuQyMGzwSAqGCMRXyjQjNooYny54dxToRGgI83WdSg2qSb3Gn1+GIgddk/PTR
         MakkL/mDZvwY+0BT2OjsCPko7UFHB+mWCrWS/6Lm1tWpqNcGUKOGfB9BS/H9aq2DKOSe
         YRpvKpXdkO2Ollb/bREjVHBftKbFfsUrw7CF5ibzLewrj8iP9IUTeWW4J7DCnbgnMPtz
         rnJd56suhvOt14n2DLLMFZNZ2WSEy3ggZiCUrs1opsLzeLUW8iuU1E/QVC/BmLQEcBot
         AmiA==
X-Gm-Message-State: ANoB5pnUvjMCkL06ak7fpGBuTXxuPNP7ZLj6AvldNGS7QaxGP1qeRGWe
	Mceyp4TDHssdZVo9gfAm8w==
X-Google-Smtp-Source: AA0mqf6cJM8UL+owIfHmCPWPItUvIBfxXKxwkUk4EzquvxuK3D23pz6qif7/7Xu0ndIBjdOUngQVhw==
X-Received: by 2002:a05:6870:da0f:b0:13b:ab0d:d3ee with SMTP id go15-20020a056870da0f00b0013bab0dd3eemr2675118oab.207.1668630042753;
        Wed, 16 Nov 2022 12:20:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t9-20020a056870638900b0013c955f64dbsm8461765oap.41.2022.11.16.12.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 12:20:42 -0800 (PST)
Received: (nullmailer pid 823176 invoked by uid 1000);
	Wed, 16 Nov 2022 20:20:44 -0000
Date: Wed, 16 Nov 2022 14:20:44 -0600
From: Rob Herring <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org, marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: pwm: Add Apple PWM controller
Message-ID: <20221116202044.GA817431-robh@kernel.org>
References: <20221111173348.6537-1-fnkl.kernel@gmail.com>
 <20221111173348.6537-2-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111173348.6537-2-fnkl.kernel@gmail.com>

On Fri, Nov 11, 2022 at 08:33:45PM +0300, Sasha Finkelstein wrote:
> Apple SoCs such as the M1 contain a PWM controller used
> among other things to control the keyboard backlight.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Reviewed-by: Krzyszstof Kozlowski <krzyszstof.kozlowski@linaro.org>

I assume you got a bounce on this as you got Krzysztof's name wrong 
(krzysztof.kozlowski@linaro.org). You should have either resent this or 
replied pointing out the typo.

> Acked-by: Sven Peter <sven@svenpeter.dev>
> ---
>  .../bindings/pwm/apple,s5l-fpwm.yaml          | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> new file mode 100644
> index 000000000000..142157bff0cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple FPWM controller
> +
> +maintainers:
> +  - asahi@lists.linux.dev
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description: PWM controller used for keyboard backlight on ARM Macs
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-fpwm
> +          - apple,t6000-fpwm
> +          - apple,t8112-fpwm
> +      - const: apple,s5l-fpwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwm@235044000 {
> +      compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
> +      reg = <0x35044000 0x4000>;
> +      power-domains = <&ps_fpwm1>;
> +      clocks = <&clkref>;
> +      #pwm-cells = <2>;
> +    };
> -- 
> 2.38.1
> 
> 
