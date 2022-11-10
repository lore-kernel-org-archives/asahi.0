Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C2B20FA
	for <asahi@lists.linux.dev>; Thu, 10 Nov 2022 14:00:20 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id u2so1224936ljl.3
        for <asahi@lists.linux.dev>; Thu, 10 Nov 2022 06:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aakPR3dWnHZ7TJ/BvrMDtVquKUqYTA3FX1Ppr5XxP6E=;
        b=sQx8rce3EU7mc+tcadjx5gzUT5NEJJbzw9+g4og/Vnby8E/d5Q65slZTjobXMRE849
         P2OZofC6cY85ViMLNB09JTg+HuSZclCKjYCx/eWf5s95CY5sGiUSMa5SrAuBENjZFzG6
         rjR6eamNtrFJcyw+/yh0WuX0zAjF/gLiktWKYOQ4VHN5jDf9oVyRFk0ejp8Xk8fqTWJT
         4Iqb0k+ZskuEdioxuwqfXtHw3v+fIDevnVoU5Bjws9ZZcF2gb7fqcvGIR2CwBTkCfyxL
         Gpca6YSRbEmtNSJThjtqkq68tLeTBFYe94H9h/xN+OgQD+hRjQp4YkRBovqymtw7Lga7
         CeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aakPR3dWnHZ7TJ/BvrMDtVquKUqYTA3FX1Ppr5XxP6E=;
        b=DuJYNkWbroEFnUARdl1fXpW0sDOBFqr0OV9TceHhmw8ep90A1tKFpAgqm+ryf4+OzD
         B3UMGYZPCSl25mxAQOvuDUCMUVtCx5bZN+DXvm12zfxzKaVjHRRO4jrkR50461/5saab
         9KTNv1X/z5Lw+H9UWbA1CCMwcCoQN6oblteW4a9zYAc8t41HVlIXmCJxXdLyJGFGS6+p
         myiWp9qdzpotmRZlA4mH0g7W08wkZ7t69cv1YFKRC5uKVz7Ongc4VkY5HLnXylNyLAnu
         XymPbkIhfhd72D1IoFnmq+yUsdVHAIFTGeyUFgxDAaQotE98KHIeY3ICxVAZcRLzZnr3
         yGVA==
X-Gm-Message-State: ACrzQf1oO8ZJ20YZJJbys1wcbhYX4WFUUT7jj87nTFj7FVwCOWJdpP6b
	ZSl8RBILM1yqcovTBW/2L9rzPQ==
X-Google-Smtp-Source: AMsMyM7pPePktg3CUd0McZdKiuqGEjTHZ0GgmJ3lARf6Sl0KyG3WkpYFRErg4CMKl+Vq5cAsRd2Xgg==
X-Received: by 2002:a2e:2417:0:b0:277:13a5:806f with SMTP id k23-20020a2e2417000000b0027713a5806fmr8456285ljk.144.1668088818420;
        Thu, 10 Nov 2022 06:00:18 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id w1-20020a19c501000000b004b177293a8dsm2746429lfe.210.2022.11.10.06.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 06:00:17 -0800 (PST)
Message-ID: <bb77e12a-b218-461b-6aa8-10f2b9a67347@linaro.org>
Date: Thu, 10 Nov 2022 15:00:16 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 3/7] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
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
 <E1osRXT-002mw3-JR@rmk-PC.armlinux.org.uk>
 <531d88b8-75db-1d8f-1384-b8d05594e7b3@linaro.org>
 <Y2rWp4wasbflS/0y@shell.armlinux.org.uk>
 <20221109221723.GA2948356-robh@kernel.org>
 <Y2zlA8RpOqD/7TrM@shell.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y2zlA8RpOqD/7TrM@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2022 12:48, Russell King (Oracle) wrote:
> On Wed, Nov 09, 2022 at 04:17:23PM -0600, Rob Herring wrote:
>> On Tue, Nov 08, 2022 at 10:22:31PM +0000, Russell King (Oracle) wrote:
>>> On Tue, Nov 08, 2022 at 09:55:58PM +0100, Krzysztof Kozlowski wrote:
>>>> On 08/11/2022 17:33, Russell King (Oracle) wrote:
>>>>> Add a DT binding for the Apple Mac System Management Controller.
>>>>
>>>> Drop the second, redundant "binding" from subject. It's already in prefix.
>>>
>>> Yet another thing that's been there from the start... how many more
>>> things are you going to pick up in subsequent versions of the patch?
>>> When does this stop?
>>>
>>> In any case, taking your comment literally,
>>>
>>> "dt-bindings: mfd: add for Apple Mac System Management Controller"
>>>
>>> makes no sense, so presumably you want something more than that.
>>>
>>> In any case, I see several recent cases already merged which follow
>>> the pattern that I've used and that you've reviewed.
>>>
>>>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>>>> ---
>>>>>  .../devicetree/bindings/mfd/apple,smc.yaml    | 67 +++++++++++++++++++
>>>>>  1 file changed, 67 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/apple,smc.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..014eba5a1bbc
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
>>>>> @@ -0,0 +1,67 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/mfd/apple,smc.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Apple Mac System Management Controller
>>>>> +
>>>>> +maintainers:
>>>>> +  - Hector Martin <marcan@marcan.st>
>>>>> +
>>>>> +description:
>>>>> +  Apple Mac System Management Controller implements various functions
>>>>> +  such as GPIO, RTC, power, reboot.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - apple,t6000-smc
>>>>> +          - apple,t8103-smc
>>>>> +          - apple,t8112-smc
>>>>> +      - const: apple,smc
>>>>> +
>>>>> +  reg:
>>>>> +    items:
>>>>> +      - description: SMC area
>>>>> +      - description: SRAM area
>>>>> +
>>>>> +  reg-names:
>>>>> +    items:
>>>>> +      - const: smc
>>>>> +      - const: sram
>>>>> +
>>>>> +  mboxes:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  gpio:
>>>>> +    $ref: /schemas/gpio/gpio-macsmc.yaml
>>>>
>>>> So this depends on other patch, so:
>>>> 1. You need mention the dependency in cover letter (nothing there),
>>>> 2. Re-order patches.
>>>>
>>>> The GPIO cannot go separate tree and this must be explicitly communicated.
>>>
>>> Sigh, getting an order that is sensible is really bloody difficult.
>>
>> It's not. Sub-devices before the MFD. The only time that doesn't work is 
>> when the sub-devices put the parent MFD in their example. The solution 
>> there is don't do that. Just 1 complete example in the MFD schema and no 
>> examples in the sub-devices.
> 
> Meanwhile, I was told by Krzysztof that DT schemas must always have an
> example. So, different person, different story.

Hm, where do you see a message I told you to always have examples? Maybe
in some discussion I mentioned that examples are desired, but not
always. There is no point in having example in MFD child device schema
if it is already part of the parent MFD binding, where it is actually
required for complete picture.

Best regards,
Krzysztof

