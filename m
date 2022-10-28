Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA23209
	for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 17:53:30 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id t25so3928504qkm.2
        for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 10:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4sSUMxC+XoR1FPr8npnNSTCNLao0xyHEAmVsF1JSBMw=;
        b=L9PXBLBok6GO/WjEyWHwQpjkaqr5A4I+OdiQZ9eXtj4tjjSw+v++H2W2TZpzKrKmnR
         m848j5p8APXRGHG8A/QGKtjCpobD6gHUUUOeABDqTtlo/dGxC2/tjXCAWyXfAGEsyKf6
         ZRl5rhOIkTScMsw2xhk89iWGNeTPIDp+AzBwHruICZnP5dcXiL65OHjhQA4eyqdiTmHD
         KtJ9I4hz7pCTfko4I5PH9ha4Q+yDYJSc2CagTchuHz2/pSyaQZ7OTPvOcUXK0UQA5uyK
         BSJV/q6b045d9HZOqbts5HpSheJflGhipXQaVeD0l/l8x+z5K6/lhMhnUOzYfvOO8TBF
         Xn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sSUMxC+XoR1FPr8npnNSTCNLao0xyHEAmVsF1JSBMw=;
        b=MLgKeAPJS8nh/dMPtbczqAwSmko7KbNnyFNsgTe4AkQrhFijiIYCKCwUjw4OfZ7FU/
         ZlskJi7Xl52hZsbFgECMPso3Rb1Ocp/A+B/eKWq6/WacPnE9MFKeJ7QEwk83oYQ+8I6H
         acpoPAY8/sClAaoubTMIMdI5kTpurkfVldE/rNpEgWkaNaQkLfryS1Kpkkuselo2RTSu
         TA1kO5r7pnFmOT55NrGIhoQiJH8YqCsZYOUx+Qe3ISbwmiPYOrflB+qmn8x4RhCopUbq
         NzwEXkAxelBWi63IGmEQHjidLwKXl2cRK2IpOVEHb23oYAXFXD9ws97SUGVI+jKSe/Z6
         +PXQ==
X-Gm-Message-State: ACrzQf1py1F4B/JckY8kc1X4n7p9+P+m5X6zjAJVTEMIBQBS0GSHe15T
	Gq04I/7wU9W2qrOQOQg8OSD/XA==
X-Google-Smtp-Source: AMsMyM4WPfiepokFOhnKcfOJr85HYlGFsNw/KONl4h2U9SmIK533puCOo9utatMjhaQcmut8ayM6Ig==
X-Received: by 2002:a05:620a:284a:b0:6ab:9cc5:cb4c with SMTP id h10-20020a05620a284a00b006ab9cc5cb4cmr319450qkp.609.1666979609475;
        Fri, 28 Oct 2022 10:53:29 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id w17-20020a05620a425100b006cec8001bf4sm3438042qko.26.2022.10.28.10.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 10:53:28 -0700 (PDT)
Message-ID: <5b194c93-48df-055a-f532-abd98657dc41@linaro.org>
Date: Fri, 28 Oct 2022 13:53:22 -0400
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/4] dt-bindings: pwm: Add Apple PWM controller
Content-Language: en-US
To: Sasha Finkelstein <fnkl.kernel@gmail.com>, thierry.reding@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: marcan@marcan.st, sven@svenpeter.dev, alyssa@rosenzweig.io,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221028165215.43662-1-fnkl.kernel@gmail.com>
 <20221028165215.43662-2-fnkl.kernel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028165215.43662-2-fnkl.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/10/2022 12:52, Sasha Finkelstein wrote:
> Apple SoCs such as the M1 contain a PWM controller used
> among other things to control the keyboard backlight.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../devicetree/bindings/pwm/pwm-apple.yaml    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-apple.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-apple.yaml b/Documentation/devicetree/bindings/pwm/pwm-apple.yaml
> new file mode 100644
> index 000000000000..39dc32e00a3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-apple.yaml

Filename matching compatible, so apple,s5l-fpwm.yaml

> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/pwm-apple.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple FPWM controller
> +
> +maintainers:
> +  - asahi@lists.linux.dev
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +description: |+

Drop |+

> +  PWM controller used for keyboard backlight on ARM Macs
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-fpwm
> +          - apple,t6000-fpwm
> +          - apple,t8112-fpwm
> +      - const: apple,s5l-fpwm

Is it then derived from Samsung platform? If yes, it is candidate for
merging.

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
> +    pwm: fpwm@235044000 {

Generic node name, so just "pwm". Drop also label - it's not used in the
example.


Best regards,
Krzysztof

