Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF13D527
	for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 19:47:34 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id z6so4142694qtv.5
        for <asahi@lists.linux.dev>; Fri, 28 Oct 2022 12:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SuLQ4LGhTb9iEJLwlybh7NzL9tVrunJow2oZoFj99dQ=;
        b=Pjxp64dtv0DecR/RobHlhnBssFPkJpiIYdP9pzvHpW8KX1urKw17Q3/hVzO6xZuWU0
         ZEBP7vT3vkOpmYLoHdriGyrmvzZ7BkZmOWgPP3PV7bczMOcHweuS0/lffViCJIt/zuTh
         GQvoM9yVvq8QtBvga4RIfbp7cvVeoRvDUlevsM7b1/SnTgFsY/w9vPdcH/utytuS3kty
         Kx7tCElNtSa8/P9Rxw0cqhW4GGO0QGqALG5Zca8cMOvmrsjNKC7wqSTPQinjgA5BZ49S
         VYzbWWiza4Z/UtvQt2tUN89m0uFwB8WeQwLBW7M9W2qD4bih9ojfGr/pBjHHrpNO1ygV
         S4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SuLQ4LGhTb9iEJLwlybh7NzL9tVrunJow2oZoFj99dQ=;
        b=YC0xUXXal5pMDFCTJIHvSbXN3ksqw532Qrvdhex0vYxAloLx+pVwikaQDacqJmuFrl
         9rfDwi6Eqnnzcl2hk+rFeEkWzoUa+vduwOBShRm9facRm0zR1vgwZ/Y8JfDOsQcZptVp
         smrgQPBfqGVePuH3Vz9lzmVA55KAuxt9IU6ThwCFk1vgPTuC/2sWvoE/jeBYqpaYkaWq
         Y+TBVh0du6Bi/ba60dURk+VdWISgq8gR1z57cbn1GzrNC5ClDT3esd83UvQgzrgpG6DH
         ztOcP69L6XERIKZqOjc6Gd12qjre3JsOgL+MvbsS6w03nkxTz5WhL8ihv1iXeamoEiYq
         sOvg==
X-Gm-Message-State: ACrzQf3LayQ+HrWRFuTO1WWLuzzwAKIT21fROG1XisAOVBxJ4YZ1Dwke
	+98x8WSfDG/JKfjgb/GZshk/iuhRoCaoug==
X-Google-Smtp-Source: AMsMyM6lrikoLcv6eLHGa7lpzNLbaHvBXJP/FuXl58MVeVcQpzV+fNRBVO9OTj27uH/gzSL/lvnmwQ==
X-Received: by 2002:ac8:5b81:0:b0:39c:b735:6b8b with SMTP id a1-20020ac85b81000000b0039cb7356b8bmr1011547qta.416.1666986453067;
        Fri, 28 Oct 2022 12:47:33 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id h24-20020ac85498000000b00399b73d06f0sm2842518qtq.38.2022.10.28.12.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 12:47:32 -0700 (PDT)
Message-ID: <498e6e3a-6391-c220-f7db-211aa415dde8@linaro.org>
Date: Fri, 28 Oct 2022 15:47:30 -0400
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

Missing blank line.

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
> +      compatible = "apple,s5l-fpwm";

As Rob's bot pointed out, this does not match the bindings so you did
not test them before sending :(

Best regards,
Krzysztof

