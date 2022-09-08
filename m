Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D8B7C
	for <asahi@lists.linux.dev>; Thu,  8 Sep 2022 12:17:57 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id q7so27424789lfu.5
        for <asahi@lists.linux.dev>; Thu, 08 Sep 2022 05:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ck7V+o7JPb3N5t8+G9G1surewJtHGKQZMAePo7SGqo0=;
        b=tsj1pSYdiYyvTqNXt1FY72ZnSGTTMGm06Sjc41bCQjYjInVfeyel2iFXOt6E+H9emc
         SU3kqTMCgQkdj6nNYUzlQIgw5WFWS6c3tCDG1L0b16AY9i7knwFTHrMazizbhgqmAjRi
         N0NmnHNfoK0PqU1a1t5+wuj5uAJbDNqXGU2V6rO8dWDWKuMz43SLhEUpedh05irJ9/c6
         8sWQC7U/KaVWxtmOV8Awy4AxC+n7HOCISDks/Yy6xpkb5MrTBBoHox2iaIwMuc508y1x
         VG5N+/ivUVZ/qQZKn5X87Z2XPJCaKjWCZzu+CNb0YNWCrRpzuCOSzS6CdfXQvh+RjRZL
         e1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ck7V+o7JPb3N5t8+G9G1surewJtHGKQZMAePo7SGqo0=;
        b=x9rqd0kOex2WBH0NpRDtEYRZjCMiKb8mLtO1vSJ0AyOG1I5uGDD9jTROdgsh3OJenw
         aClE/Vc5QXpHVAksq0p3LG3CxvCi3qWp3ybmU82nfI/jlaTKytmWS1pQgIFeAZctHZcN
         45e/D5qxuGBsANZpzxVv8os6DtsIERtQ5OQAbmc5ohigXSkud6yn+G7SZ8iovFS7U0rE
         Sg68XQ86gtOO1ZstntnJFFmNUawtiIlmZSGaRc9mUY75eX5JLQ9pkwtmhvLuOtDpr0A5
         qETa7kpeQ6K4MmSic0dBocn0JeViOrCpL+kqznN1Y1afzOK/JofMkacyatqFSZrqs0tK
         QNCQ==
X-Gm-Message-State: ACgBeo1lL6QDQjLRN9OuNXj3GvVOMdmtqnZkru9W3+ls3YBmPTdfDUue
	rd2VP/NFUv22nIXW+GQDaJ7bxw==
X-Google-Smtp-Source: AA6agR4Fg7IVq6RMZ+ReLSyWao9EV+xIdPoQuu5k0CpfePwRxeHRwu9dpM1o9cmvXOsvUpU4oYiO/w==
X-Received: by 2002:a19:5e5e:0:b0:497:a26d:89ef with SMTP id z30-20020a195e5e000000b00497a26d89efmr2937764lfi.555.1662639475896;
        Thu, 08 Sep 2022 05:17:55 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 12-20020ac25f0c000000b00497a41b3a39sm1179754lfq.93.2022.09.08.05.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 05:17:55 -0700 (PDT)
Message-ID: <39b08217-b939-d188-12ce-ce6006282e1e@linaro.org>
Date: Thu, 8 Sep 2022 14:17:54 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/7] dt-bindings: gpio: add binding for the GPIO block for
 Apple Mac SMC
Content-Language: en-US
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, asahi@lists.linux.dev,
 Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Rob Herring
 <robh+dt@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Steven Rostedt <rostedt@goodmis.org>, Sven Peter <sven@svenpeter.dev>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUI-005CmB-84@rmk-PC.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <E1oVYUI-005CmB-84@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/09/2022 15:19, Russell King (Oracle) wrote:
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

This is not a pattern. Should be in properties.

Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).


Best regards,
Krzysztof
