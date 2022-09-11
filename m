Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC297F
	for <asahi@lists.linux.dev>; Sun, 11 Sep 2022 11:27:59 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id f11so10383201lfa.6
        for <asahi@lists.linux.dev>; Sun, 11 Sep 2022 04:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wODXrUGa3xJje0kIbd8qZg/z/wc1dTw39zG2Qx5AyhI=;
        b=AkNi3/z9b9CHqnJdIfnIBVDDMABspoLSeuVjYlbR5LJn7OoLnkReI5eVApXBhxQD++
         BhRUBswOj2pgzEAfLQsiwAbTtVPs+nIoxM3nLwrOI7K4s58D4N/PUhHrvjWyhjzkJnrd
         0kU/zGfsf3UoSVxYCToP69gSe0n7Hmcy8moTgbE+0WxvdjlExnPsvvFdZOCb98B09HbX
         baoKiktVRdbWQVfrNqQ6t+ndzbGfPmau2hvJVYMpzvH2k79I4rxGITYm0IrcHrE5B43N
         tdfZ7JJI9zQNWZQk1EDARNlERktOHp+EXvJ91rKFaS8yFhHxys+BnCpjuke8PNE0vAQM
         QXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wODXrUGa3xJje0kIbd8qZg/z/wc1dTw39zG2Qx5AyhI=;
        b=seRnwQ0FHCAfCqfhYIB6qAI2CLTAuYjILlFy6Uc/fChucYR34VlW9PEO7oQMgFuGso
         9fyuMNDXmpt0H09p3I4ehlg2k9wRUcysrEpexFlwriSSexrKBtub5lC4D5AnVf4GdtPL
         wuyXrCV9FjjQbDdYcah9fMofyLdzek/7F52L+xkt1/3TnnZAqGrf++1D86vshRR2ngLy
         hFSlfpHwUQXsV7VdpClYLNu1p+rLZfXDRJYxnEj+bAZ6nXtlpE/Vr3RkLR7uBtcg4UFj
         CBL80qktH6kC6hinEO051zB2pGQsifnDpyJPF5oy3V5IsWkV+rlEalvOkB3uqxGngXEN
         Facg==
X-Gm-Message-State: ACgBeo1XS7Ke6gPUSwi8Ro3EhBGubcJiGCycnsDwUPIq/aVeI3Rzh02r
	hbcpVaGIvTEm4wgnI6UumJ5oiQ==
X-Google-Smtp-Source: AA6agR7+C80U63XwG32U92syOxTjw9Jp4ccOZIjl5T+WYcwHZ2T0df7+gpCmPXCVRBqqVz2H4iE9TQ==
X-Received: by 2002:a05:6512:11f1:b0:497:adc5:629a with SMTP id p17-20020a05651211f100b00497adc5629amr5928383lfs.419.1662895677571;
        Sun, 11 Sep 2022 04:27:57 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d23-20020a194f17000000b00492e69be4d6sm585484lfb.27.2022.09.11.04.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 04:27:57 -0700 (PDT)
Message-ID: <834eafc7-adb8-4977-a8c0-e34c44a583f3@linaro.org>
Date: Sun, 11 Sep 2022 13:27:56 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 04/10] dt-bindings: arm: apple: Add t6001/t6002 Mac
 Studio compatibles
Content-Language: en-US
To: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220909135103.98179-1-j@jannau.net>
 <20220909135103.98179-5-j@jannau.net>
 <25b42684-1bee-b7f6-a89d-ed0b0ea7428b@linaro.org>
 <20220910113714.GC4024@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910113714.GC4024@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/09/2022 13:37, Janne Grunau wrote:
>>>    The compatible property should follow this format:
>>>  
>>> @@ -79,8 +81,15 @@ properties:
>>>            - enum:
>>>                - apple,j314c # MacBook Pro (14-inch, M1 Max, 2021)
>>>                - apple,j316c # MacBook Pro (16-inch, M1 Max, 2021)
>>> +              - apple,j375c # Mac Studio (M1 Max, 2022)
>>>            - const: apple,t6001
>>>            - const: apple,arm-platform
>>
>> Blank line.
> 
> Added. The other entries in this list are not separated by blank lines.  
> What would preferred to fix this? A whitespace only patch or can just 
> add those additional blank lines in this change?

Both would work for me.

Best regards,
Krzysztof
