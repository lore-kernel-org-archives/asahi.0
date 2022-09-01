Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18826AA9
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 15:15:49 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id z6so24890580lfu.9
        for <asahi@lists.linux.dev>; Thu, 01 Sep 2022 08:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gyNVCFkaWNsKBaoIpibBhspi5hxPuuG/Dvrr/wS3a7I=;
        b=wAubuwLzKPR6GV1qetXH4QaFJMWXbtjhYc0Kcr1CE6SfUMgea1gpwtfh1Y4ECyT54/
         JX3Rpmt/dIf+WxH7n5FGocI+2bTUXw8EWWWki6+085uECpswC1nrlriZh1BcgRtUGstf
         KGKqkZmuaK6XNYEXXL2BQNAQRJlYAh6K58+dDWeyHmbO2XXXfI/A3VWoEq/fDfZk2A/Z
         +PUbJ7tKuL4krb8xJCjXQ7OSP+Gj/TzC0djScgtRqVAchUR2PwlBF8HCoVDCHjMiuM6q
         48Evdh8MLPgTCQKgsTnfIAsBEgdwq/5vP4SJIpwxzvQOqZYMDgV+04LgPeT6fEK+n2Tk
         c3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gyNVCFkaWNsKBaoIpibBhspi5hxPuuG/Dvrr/wS3a7I=;
        b=m5i/S0PXIsBOleBnEorYUQ4IcsF4xsPah3abp/BPijQsyc7JSJ2tfSXYFh8ywjOQ17
         IvAIBC3bxTCJzDiuFwpOULr3nQ2g9JCYEj1nUj64We4JrDOfHo1d2x3G/j9FTLp1tcpE
         oNZrWRJJIRi/a48JcLh4N6ObO0vSDGs3wAwO48cUsmZDmUrwR+MJ+RIRDe7tpx6/vDAS
         K8Ts7ksMaJXWMoTbrUHV/Xl7Fm4+nbKEY9tTBJ0PLOvoPz4ZXBQNLriwCX5h7UFlNOof
         jeOim3XHTzhltycHH4KmA+3ezNZbBrPEUF92ukQvi4xUrmI0NsJCsDha3jYQlTGLmB+5
         KFXw==
X-Gm-Message-State: ACgBeo2ICHcewBJHWBVZR6Sx6XE2cp6IqpocvywO1K6rnJNFizNBSr0P
	3ko169iZS/ui6/6RA3rTLkSp3A==
X-Google-Smtp-Source: AA6agR5MpbukT/Tca+4lJmUDLkrqlKDBqgbUDBrUrfiqS8yHyVFbox6z5ZZ4tGsdTDAnNdH/MCg4zg==
X-Received: by 2002:a05:6512:1312:b0:492:e14d:54d4 with SMTP id x18-20020a056512131200b00492e14d54d4mr10205963lfu.469.1662045347897;
        Thu, 01 Sep 2022 08:15:47 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id h1-20020a05651c124100b0026181a42284sm2059267ljh.88.2022.09.01.08.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:15:47 -0700 (PDT)
Message-ID: <928ddeff-efac-920c-7bbf-dda35a942b93@linaro.org>
Date: Thu, 1 Sep 2022 18:15:46 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 Bartosz Golaszewski <brgl@bgdev.pl>, Hector Martin <marcan@marcan.st>,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 Sven Peter <sven@svenpeter.dev>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
 <E1oTkeH-003t9A-3K@rmk-PC.armlinux.org.uk>
 <426469c1-13cc-178b-4904-09439d7788e8@linaro.org>
 <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxDL+cAx9kkZRL8K@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/09/2022 18:12, Russell King (Oracle) wrote:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +        - apple,t8103-smc
>>
>> You miss two spaces of indentation on this level.
> 
> Should that be picked up by the dt checker?

I think yamllint complains about it. It is not a hard-dependency, so
maybe you don't have it installed.

> 
>>> +        - apple,t8112-smc
>>> +        - apple,t6000-smc
>>
>> Bring some order here - either alphabetical or by date of release (as in
>> other Apple schemas). I think t6000 was before t8112, so it's none of
>> that orders.
> 
> Ok.
> 
>>> +      - const: apple,smc
>>> +
>>> +  reg:
>>> +    description: Two regions, one for the SMC area and one for the SRAM area.
>>
>> You need constraints for size/order, so in this context list with
>> described items.
> 
> How do I do that? I tried maxItems/minItems set to 2, but the dt checker
> objected to it.

One way:
reg:
  items:
    - description: SMC area
    - description: SRAM area

but actually this is very similar what you wrote for reg-names - kind of
obvious, so easier way:

reg:
  maxItems: 2


> 
>>> +  reg-names:
>>> +    items:
>>> +      - const: smc
>>> +      - const: sram
>>> +
>>> +  mboxes:
>>> +    description:
>>> +      A phandle to the mailbox channel
>>
>> Missing maxItems
> 
> Ok. Would be helpful if the dt checker identified that.

Patches are welcomed :)

Best regards,
Krzysztof
