Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73388471
	for <asahi@lists.linux.dev>; Wed, 26 Oct 2022 14:13:09 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id x26so667684qki.0
        for <asahi@lists.linux.dev>; Wed, 26 Oct 2022 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BJkQ2Lvx038FbiNzpk9wcXe4nIQwkZdE8UfXIihqNk=;
        b=QhFXvTvNJUlIUlpQDnzeAFmF6+ln6IFY1BFH21RP3EDt2LD6+1BYjRCN8caiSBm9uE
         CPrOIRLVIOU+Xb1tuA5uzcHXRF7ZgVxAc3k82P8Mz5y9pR/HX2TepOaNrgwIXyEfqtfl
         QsEycG67flPJyLlIIpQxjnPapaGi5xAXZNMh5iU8UZ+zTDI3D5A9QIQQMOFjr9FUJEx5
         ep/+BMxyL5A6mYuUnVqMPJX0r7bnvvrSfWFLqz1HyLxOhEAIlz6nj4ZNidzji5N/SsPi
         fc+x4k16tPOTNEtcw7GO9Dlfd2ijEz1Dxx7dGrYQsJjNfiEKfoRKjwN5btuyQQQnNAfu
         mjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BJkQ2Lvx038FbiNzpk9wcXe4nIQwkZdE8UfXIihqNk=;
        b=vW8ALivL6NYBlFL4+8jJdWEuyY5xmR05cQYOr1nAZBItFysaKT2h8JhAhVx1QSgWE6
         oHskF/uSs+qVUxFEB5f0lUfd2PJHjpVKKDAS3PLfCcJpKQeT6yZKlJw6OfuqHTvpWipz
         hBGo9IMeTtJfDIaaGbqHKc3FxLA6I5vHgZnCU4nF6hXTSIwCpWd/eKjxXBWBXKBAqXjp
         x4lmYtwjKz1Xet7rbUdivwzq6HO+hCJaQgP8gsBksPYcffMGPr94ydAXZzfTwTrD9dTS
         VdOEXPN3vJCucOfDuY0o4Oy3SSdggrF6aWOgJMh8KsxNy0gLiQPYLTXe7s/5dp7Hp8AT
         9XmA==
X-Gm-Message-State: ACrzQf36OViB6XQVD+kvZHKRf66Av0OKzBmtTb841XXF2ygKz/mfSl9x
	5JYgVKCCEPMHHckP2BtJJai38w==
X-Google-Smtp-Source: AMsMyM5HJOoGv/K2f7op+AS1jKZWgMgm9sMjTfvjwWkv3/yGR1lYtHuWo60wwCaoDlDuxiFnqa7Rig==
X-Received: by 2002:a05:620a:28d3:b0:6ee:cffb:21ef with SMTP id l19-20020a05620a28d300b006eecffb21efmr30529027qkp.123.1666793588691;
        Wed, 26 Oct 2022 07:13:08 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id o14-20020a05620a2a0e00b006cbc00db595sm4164494qkp.23.2022.10.26.07.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 07:13:07 -0700 (PDT)
Message-ID: <bcf5ef3c-a17d-e174-2b97-cef4d728cb35@linaro.org>
Date: Wed, 26 Oct 2022 10:13:05 -0400
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 2/5] dt-bindings: cpufreq: apple,soc-cpufreq: Add
 binding for Apple SoC cpufreq
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221024043925.25379-1-marcan@marcan.st>
 <20221024043925.25379-3-marcan@marcan.st>
 <5c3126fb-8fdb-5163-95a8-136a4a7ee2ce@linaro.org>
 <97d3d6d4-b19c-a194-de41-f17e65bf3eb6@marcan.st>
 <21602556-8312-fb7a-1981-cd03a314d904@linaro.org>
 <0f76c1b5-8fe5-e3dc-dc9a-7b0ad9660275@marcan.st>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0f76c1b5-8fe5-e3dc-dc9a-7b0ad9660275@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2022 00:18, Hector Martin wrote:
>>>> With the first one (t8103) - it's an enum.
>>>
>>> This is deliberate. t6000 is compatible with t8103, but t8112 is not
>>> (though all are compatible with what the generic apple,cluster-cpufreq
>>> compatible implies).
>>
>> I was not talking about t6000. I was talking about two entries - first
>> and last - which should be just an enum. There is no compatibility, so
>> what is here deliberate? To not make enum things which are an enum?
> 
> Sorry, I didn't understand what you meant. You mean that the two entries
> should be merged, with an enum for the first item listing both SoCs, right?

Yes

Best regards,
Krzysztof

