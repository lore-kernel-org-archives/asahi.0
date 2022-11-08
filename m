Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9787A471
	for <asahi@lists.linux.dev>; Tue,  8 Nov 2022 20:56:43 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id j4so22945274lfk.0
        for <asahi@lists.linux.dev>; Tue, 08 Nov 2022 12:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ad8MM775MX8kkZmKXPWgGcns6ayg4q9MzIVD+G5PmQg=;
        b=goi2RTkINNq3mhzzDvlkafzAxaDL67ZVh9LTbILuCJ9C5o32QH/23LZKjbOLvgDNh3
         EJQEyP/6abyTw5NMK3rcVvLbCNkGPefbeG2p9yYx5JE8xJTz/ZnmqjuCiScTy5fIse9z
         n0vAFBf9Oz5qfGWOT3xGaCnqK2wnlD7Llg5FAZlkiCxJICTDO2qpFLwbLmS87w1ayHlT
         A//wV5GT85S8x+8CuMB5/s9Qnj9A3OUDmwi3Gi9otijYsLGGSru+vleBzv5uOI0DYSgt
         JdMqwX7MO3a9Wz4iLf5DD+VUHP/JrgROgS6MKrDPwNdBzJdjUiV0Ftu8TkyzcaXCY1+q
         TZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ad8MM775MX8kkZmKXPWgGcns6ayg4q9MzIVD+G5PmQg=;
        b=fryXAI05oIeJp1Qj5u1EYqRdcYZXeTsHg054JiAuzdrqbTsZEZyn/buir29lQHg7OT
         aJhcj/q4XrHolTTfTtYXrEnfTuqCGvD5PqxAf6drpSo61eDavzK1rzOEqgdD+2dzQ38z
         B6RHPXzuGnlFq31GJ56qmcDXc1DRHh+FpwI6OL6Q01kVf4iHJqcL7GMjlYvCgZl1GPlM
         w+tTFCnSa8gRzNZHVpV8out6rUEjXk/CkF+riQOeUdGvcTWwkOeIMF0lipo85ozz4Tjs
         VF2OQD3rX3wOuCnoombzfjCjznRqoEF/MrnNBN/2/4psyhY2tqxKUKL5slcjuOio9xAn
         Hbmg==
X-Gm-Message-State: ACrzQf3t0aAwQxe+Nnm/1Bmk3yWCUB4iSs6M5RQ6VKM2Y210QILg1TmC
	ffztUbzUdWJ1ytVtyCU0qpoYyw==
X-Google-Smtp-Source: AMsMyM4hu9OiiCewvDU7A8lsXIdopQmxVX5urSunLwOwa3m+oe93nVaD5+oSBQfFSD8aFdv4exQGkQ==
X-Received: by 2002:a05:6512:2821:b0:4a1:e97e:5025 with SMTP id cf33-20020a056512282100b004a1e97e5025mr19317061lfb.41.1667941001742;
        Tue, 08 Nov 2022 12:56:41 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id a11-20020ac2520b000000b004b1892aa5c8sm1932148lfl.56.2022.11.08.12.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 12:56:41 -0800 (PST)
Message-ID: <3d51c0e2-1e59-5767-4be1-5754ca8dc902@linaro.org>
Date: Tue, 8 Nov 2022 21:56:40 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 6/7] dt-bindings: gpio: add binding for the GPIO block
 for Apple Mac SMC
Content-Language: en-US
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, asahi@lists.linux.dev,
 devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Sven Peter <sven@svenpeter.dev>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <E1osRXi-002mwL-UB@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2022 17:33, Russell King (Oracle) wrote:
> Add the DT binding for the Apple Mac System Management Controller GPIOs.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../bindings/gpio/apple,smc-gpio.yaml         | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> new file mode 100644
> index 000000000000..1a415b78760b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Mac System Management Controller GPIO
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description:
> +  Apple Mac System Management Controller GPIO block.
> +

Best regards,
Krzysztof

