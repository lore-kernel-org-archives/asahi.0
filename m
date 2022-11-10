Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C429A2
	for <asahi@lists.linux.dev>; Thu, 10 Nov 2022 14:36:23 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id g7so3622270lfv.5
        for <asahi@lists.linux.dev>; Thu, 10 Nov 2022 06:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A69txW9iggSNkdP/nQ5U6dpUNL+jGVuughye7m5si+I=;
        b=TzwBwyFSBp6qkaEkfafIvqSCCZPx5YULBwW9S0b3J+5SfWHYxCnTH8VAaxfWnIkchh
         gT67jqTe4iLpzCjG/AKLmOXon91u5uSHKjC3z57Gf/S5hfoETUMdcfm0Y55Uz7enW7uL
         TnttORDMbW77Al0vidB2llkLkXhczLLl4dp4YI+vVmlo01D1L1RtuV13NP2m30sOCzZo
         0rmMoJyeGSdP05w9GvOZvx9ebhTc7m+TfQGXHQq170yprWRSh8X+jguYFvESGPIX40w5
         MytFPR+/jCEWllShm9nJ4bw4dabv5OdF1puYb4T7ma8aKfUsYdfkv7CpJtb5oDL01OOk
         hlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A69txW9iggSNkdP/nQ5U6dpUNL+jGVuughye7m5si+I=;
        b=l68nKKxaY3pJ+MSSR11Qn60NgKEYbgCLZMgsl4tjPqcvbwx22mG6o96/n3esQowKDa
         cYZAvEMdcKNmef51PdHdB4vzb/Lo/+Ihlg7USjUCZVVxgm/eSf6CktwJPiuJNnpJyr1V
         D7eWAtEcQZKUtiMcG39UqtmmTWFf/6+kfsCQV5NStQtoKbjzAtkDeMtnxwcUD/lMjYto
         2dQC55lMXFJnxuAdQZyg2p5pN6L151olkxh73D2wjdJJKr6cWlEEkod/JO3Y0b6xfScV
         tUFVxxluxj9kga8euiwisM/UUFUmCGZY7cqIyLKVHxI3MeyvGsqg3+t9jbIfrUyRfu+G
         vShQ==
X-Gm-Message-State: ACrzQf1kXOWaXD+S0/HNMETcx0d0VtutBK0y4yQTpIHiPg6N4k5oOahb
	jW4it0JZwvVwr2gUZiiteDJzCg==
X-Google-Smtp-Source: AMsMyM7KGIkty4xZO/9jQRsXxH0v5rDOnPRRVCHh0SQ4GWyXcX+Zd6lGgflOmMs/QVCB2FziHhNHzw==
X-Received: by 2002:a05:6512:210b:b0:4a2:361d:da22 with SMTP id q11-20020a056512210b00b004a2361dda22mr20829878lfr.561.1668090981735;
        Thu, 10 Nov 2022 06:36:21 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id i24-20020a2ea238000000b002770d98151dsm2746981ljm.122.2022.11.10.06.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 06:36:19 -0800 (PST)
Message-ID: <392bec2d-c4aa-f87d-5250-c62760f808e2@linaro.org>
Date: Thu, 10 Nov 2022 15:36:17 +0100
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
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
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
 <bb77e12a-b218-461b-6aa8-10f2b9a67347@linaro.org>
 <Y20HOW8t3wfFott1@shell.armlinux.org.uk>
 <403f372a-6fd1-b5b6-cfd9-b15147bf1caf@linaro.org>
 <Y20Je7quui2iohNR@shell.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y20Je7quui2iohNR@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2022 15:23, Russell King (Oracle) wrote:
>>>
>>> Make up your bloody minds and stop pissing me about. This is why I've
>>> given up trying to get this in.
>>
>> I don't think it is constructive to discuss this with you anymore.
>>
>>>
>>> Getting a consistent message would be nice, but it seems impossible.
>>>
>>
> 
> In which case you CLEARLY didn't read the cover message to that two
> patch series.

I have every day 100-200 new patches, so not every cover letter gets
enough attention. Your did not say this is part of MFD, just mentioned
some build dependency.

Anyway, job of submitter is to make the patch and its context readable
to the reviewers.

There is literally nothing about including in parent MFD node in DT.
Just take a look:

https://lore.kernel.org/all/Y1q5jW8ff0aUdjPd@shell.armlinux.org.uk/

Or maybe you refer to this:
"previously posted before the last merge window."
Yes, so I will go through hundreds of emails from a week or months to
satisfy you?

"this driver is dependent on the
Apple SMC driver in order to be buildable and usable."

The only hint... it's about driver, not MFD. Make it obvious for
readers, not obvious for you.

"It is expected
that this Apple SMC driver will be merged via Lee's MFD tree."

Maybe there is dependency, maybe not, who the heck knows.

> Again, YOU are giving contradictory information.

Best regards,
Krzysztof

