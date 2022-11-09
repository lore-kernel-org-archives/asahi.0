Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7202CA7
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 09:19:40 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id u2so24845245ljl.3
        for <asahi@lists.linux.dev>; Wed, 09 Nov 2022 01:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VyOwHIx2eFYER6svy54TwgyRrhxCzE5HFZfbjyKkFTY=;
        b=D76zlyzf8ZHfHyT+XBBZb6eqdJWPJL2LUpXnJWdG4HrxIKHrGV+vMC4KLANVtRU7Q8
         GvkKLbNz+v0geOE6AfhzelWvsNe0leMER1eq36PMH1eKUMAavWhFxVe+yR08oYHvGwy4
         HCLznAFy6/Xx6e95ZufqZq4lTH9GTHiXD0d+gmQ3nBllkBzqNf7DUWrHy/Fx6WQ2jlrA
         34T4SbQvDOfuYJiIypUaGXkXPk5w4MZWij3G+o8tk8CuW6Wkopj3laQPfvYKOisvoc+y
         4sKLPng89ZCITyS+GJFVq0s1kDXG+afP98vA6Ymtfzbv3mhGOAH1CLFisdw9j96fnteT
         2DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VyOwHIx2eFYER6svy54TwgyRrhxCzE5HFZfbjyKkFTY=;
        b=feYuR7X/BTTlcOEQvap6p5Q7BT4tOSqD127ZAtkM3CXr8CMWVLCr2BSkhuZWlG33ft
         H5xsv7EVHbixUCc1z6rqYSnsX+s449GJEPXxddhjYwZzUWRz5okuQOS5CEH9Ll3xSQkr
         oWmP+LEIevVIM7Yfxs2WA1KSanf8h9pR9mV09YCRuV1p67WWFxldoltD7C6Civ8spuAV
         0lalEPelMM5HdDZPDBKKfgPnD1n6n61uiMoOAoubMauhR2IWlQaEkNuHkds7Z/mgJ4ZV
         i/OWDkD535BlmKf6K3/FTz+Z5ngYZdakN/asmEvfmtjgijnhbcROmGzr2ozN5OdkkY6i
         fh7Q==
X-Gm-Message-State: ACrzQf2nyaHZUXT1NrwmzraLHjdT/Ff2nTgpGNDdui3t15w1fNYQeQxa
	D8p++rtWXrEN+mfjn4GLwk8d5g==
X-Google-Smtp-Source: AMsMyM7uEpQrCQmOl2lKJhvkvbR44SkmDPc+he6Vt7mjd6PxA45ieuuzM/uNpq1Vl1tAhGRH1XAHnw==
X-Received: by 2002:a2e:80da:0:b0:277:34b:1bfe with SMTP id r26-20020a2e80da000000b00277034b1bfemr7779668ljg.8.1667985578370;
        Wed, 09 Nov 2022 01:19:38 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id i26-20020a0565123e1a00b00485caa0f5dfsm2142118lfv.44.2022.11.09.01.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 01:19:37 -0800 (PST)
Message-ID: <85a5d025-e72f-aefa-b748-8c19ff247309@linaro.org>
Date: Wed, 9 Nov 2022 10:19:36 +0100
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
 <aa665829-82db-74de-d802-e01fd52c998d@linaro.org>
 <Y2tu7ptiYXwB2D79@shell.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y2tu7ptiYXwB2D79@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/11/2022 10:12, Russell King (Oracle) wrote:
> On Wed, Nov 09, 2022 at 09:36:12AM +0100, Krzysztof Kozlowski wrote:
>> On 08/11/2022 23:09, Russell King (Oracle) wrote:
>>> On Tue, Nov 08, 2022 at 09:56:40PM +0100, Krzysztof Kozlowski wrote:
>>>> On 08/11/2022 17:33, Russell King (Oracle) wrote:
>>>>> Add the DT binding for the Apple Mac System Management Controller GPIOs.
>>>>>
>>>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>>>> ---
>>>>>  .../bindings/gpio/apple,smc-gpio.yaml         | 37 +++++++++++++++++++
>>>>>  1 file changed, 37 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..1a415b78760b
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
>>>>> @@ -0,0 +1,37 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/gpio/gpio-macsmc.yaml#
>>>>
>>>> Does not look like you tested the bindings. Please run `make
>>>> dt_binding_check` (see
>>>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>>>
>>> Oh ffs. DT bindings are utterly impossible to get correct.
>>
>> Why? You write, you test and then you see the error. Srsly...
> 
> It's utterly impossible for me to remember the dependencies. It's
> utterly impossible for me to remember the make incantation to test
> this bloody things - especially as I need to limit it otherwise it
> takes a very long time to test.

Then this is where I can help - you can test just one, specific binding
or few of them:

make dt_binding_check DT_SCHEMA_FILES=apple,smc-gpio.yaml

make dt_binding_check DT_SCHEMA_FILES=apple,smc

So before you format patches, just do `git rebase -i HEAD~7`, change to
re-word or edit and  go one-by-one testing your bisectability. The same
we are always doing for regular kernel builds when having a big
patchset, right? Each commit must compile, not just the last one in
patchset.

Or push each of the commit to a service which can do it for you. For
example, for kernel building (not yet ready for DT binding check) I am
using something like:
https://github.com/krzk/tools/tree/master/git-build-kernel

> 
> The whole bloody thing is just too sodding difficult.
> 
> I'm not going to bother with this patch set any more. Too frustrated
> with this piecemeal approach and the crappy slow tooling and the
> idiotic incomprehensible error messages it spits out.

Best regards,
Krzysztof

