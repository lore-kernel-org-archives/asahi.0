Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CC128E3
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 08:36:15 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id g7so24640634lfv.5
        for <asahi@lists.linux.dev>; Wed, 09 Nov 2022 00:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vK9IxPdoGJuzbrNJGX/e/RWzrnoujHXpyqaM+pgnBbM=;
        b=cPeGKQAvMgayPYCiGKtAPK1gPNYzPZwICN8Kp8lpnQbMw9TA24s+JGqbmrtZycyCpx
         CNZWJCbJ9c7H+M+cpY50NHAPPcmwI8765qLBKDeCMgSKer3NxNYW3ttI7WgZ36oQV/tf
         0CEqyWg9bMJz023zU2okJTy7TpLk6AsbQh34AMG0cj5gNSqWmg+pHKE3ZSJfvgjZkXYj
         XrSdLkvtNV5jHrV387kxzUwP45ks+ZttxGdD+vGektVuTDhcDS9N0NZ78+q3uiTv65R4
         t3eykadFZzIwbGxgi6plsNSTQFAHF3G5Sya6mtEfUF3KXaVo036vRFhZvkXxN828tDiP
         Zhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vK9IxPdoGJuzbrNJGX/e/RWzrnoujHXpyqaM+pgnBbM=;
        b=nQ1vMSprYjT/5uThBIRbt8nprZjHQNmUiKZVDzZXTyP38+34xnOnunAWcXhDvwIPBC
         OER1fAYFpYOarcgZY80qodyA9v6lgQ+1dsTYaZQDFakEg/27Ryh1Q9kV4nYxE1W1iQGo
         qsC6GMdpUyQfLv1GmwRgqaseCusg6a/Ye6H3h7BRUREC0R9fVUHAdvBc9yJYRHQdUgw/
         QCGXo5AQBJTx7EiR6ueEydJDQ8WGv38OpuEOPZH3DmZTwhTOh8wfIQN+cv1ZsGvFLG33
         6sQyfFkkg9OoFB+gdpNt2qLupFndO8BzjMjccGw7C0Zhd+U/Hm5eDwJ2f1goYLoaQBNq
         U/NQ==
X-Gm-Message-State: ACrzQf3GKnu6fFX0aV196eaqluQIlTNb3FgVPM6OScmaxGVZ9HW34wIw
	qJlocpbgVIsfO34y/Rlgy5vJnw==
X-Google-Smtp-Source: AMsMyM68uv63wK0EbNnQkmuEMH+CrM4l78TeZm/qeYXZACgfuIZbAJ+torxeLvUDplUslWBZiew3Jg==
X-Received: by 2002:a19:5015:0:b0:4b0:3544:d4ae with SMTP id e21-20020a195015000000b004b03544d4aemr23039219lfb.475.1667982973491;
        Wed, 09 Nov 2022 00:36:13 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id 17-20020ac25f51000000b004abc977ad7fsm2111833lfz.294.2022.11.09.00.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 00:36:13 -0800 (PST)
Message-ID: <aa665829-82db-74de-d802-e01fd52c998d@linaro.org>
Date: Wed, 9 Nov 2022 09:36:12 +0100
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
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
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
 <3d51c0e2-1e59-5767-4be1-5754ca8dc902@linaro.org>
 <Y2rTmS/gEdtU66b0@shell.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y2rTmS/gEdtU66b0@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2022 23:09, Russell King (Oracle) wrote:
> On Tue, Nov 08, 2022 at 09:56:40PM +0100, Krzysztof Kozlowski wrote:
>> On 08/11/2022 17:33, Russell King (Oracle) wrote:
>>> Add the DT binding for the Apple Mac System Management Controller GPIOs.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>> ---
>>>  .../bindings/gpio/apple,smc-gpio.yaml         | 37 +++++++++++++++++++
>>>  1 file changed, 37 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>> new file mode 100644
>>> index 000000000000..1a415b78760b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>> @@ -0,0 +1,37 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
>>
>> Does not look like you tested the bindings. Please run `make
>> dt_binding_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> 
> Oh ffs. DT bindings are utterly impossible to get correct.

Why? You write, you test and then you see the error. Srsly...

Best regards,
Krzysztof

