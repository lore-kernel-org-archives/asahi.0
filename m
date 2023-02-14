Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2C07C
	for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 09:39:49 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so11063831wmb.2
        for <asahi@lists.linux.dev>; Tue, 14 Feb 2023 01:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THygiRuxs8VFRu/0SbSjNJKLxf0jtWVPE2Kde3hH/xc=;
        b=IOFRV/edrvwF9c4q81Z4wz4bc1wtIFjlz6Mn0wLQgGk3ErQN0GVVkR/H3EihKO6Okz
         IhP2Q/ubloAkgJCcabD7tnopil56y6JpNh6VbLm1KVVzTj8g6JE7NZ5X5BkapMdCrVio
         NMQS0ZCHyUbnHtPcNVOsybnCV4cMS5rLkbhCCP2tmqb/145duSHPSD+/73UVodcxVChw
         ujTH52MtR8YtCiGXHWCRtDxA0SN8TmGf6thzVdrWZ4aZOMgNMefl7glfemstx2brSQlz
         lDnByTV8InzchXfW43uCElzhmRuqT+dEwvbNSS7fuJMh2Nlk52q6N6uUOB7PITIz4Agq
         c3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THygiRuxs8VFRu/0SbSjNJKLxf0jtWVPE2Kde3hH/xc=;
        b=LpRgTTOJBiMK+CW7CMUcc9L0jN7zRmEfsh3CkrcsLSmtR91wjvdGYjJWeNNGn6cwvi
         m38pupvoHyWdTDeR42ZKp3poKJrNd6AAgjrey/XMbhWf9WWOxwjKzWhuLeRtRky+CmSA
         MQZT3l6WrgOGure5bc3o0bUCuQb6ACzu8WWoH0npQOGyXQH9+6eMzmBdR9u7LEv9x3ie
         8WsDsFLsqV3wBFNvZeXbaQWS8YtpV9XGBPLrYwFO5YNNVvBHC9cCoi+WGVgRvAX5fHKR
         0OIZyXca1y5rBLHmUsaHr9HZ2j98aNGnupP9OUwroqu7Tz2A4Rbg/a4tmTN1AvEeKdoO
         MzoQ==
X-Gm-Message-State: AO0yUKUMkmq4tcEyj/LkjehvM1PWM3JnvqIE1SqRHUO8PbJ+uU778v9s
	CaG6ul3lJ7WcSmtR4c/FRVbUGJaBcxwDSC7R
X-Google-Smtp-Source: AK7set/+iKTim4NOP4D/hREumYohxPZoT4caqB5lh3sHrMC+9HMX/g1IGZQqdbiqnhwVcj4VqC+2GA==
X-Received: by 2002:a05:600c:44c8:b0:3df:30c9:4865 with SMTP id f8-20020a05600c44c800b003df30c94865mr1570277wmo.26.1676367587820;
        Tue, 14 Feb 2023 01:39:47 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f24-20020a05600c491800b003dc0cb5e3f1sm15557691wmp.46.2023.02.14.01.39.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:39:47 -0800 (PST)
Message-ID: <af7fb166-64e3-6fcd-c270-6dd53bbe96c0@linaro.org>
Date: Tue, 14 Feb 2023 10:39:45 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/17] dt-bindings: power: apple,pmgr-pwrstate: Add t8112
 compatible
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-1-cb5442d1c229@jannau.net>
 <3287867a-456c-ddc3-adbf-90001950c926@linaro.org>
 <0a33fa04-039f-9a7e-f2a3-2a1a6abc98d4@marcan.st>
 <5ff55f1c-8f02-abec-2320-c2e0b7db8904@linaro.org>
 <391ae107-8c10-b14e-c1ad-0fac74951432@marcan.st>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <391ae107-8c10-b14e-c1ad-0fac74951432@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2023 09:43, Hector Martin wrote:
> On 14/02/2023 16.50, Krzysztof Kozlowski wrote:
>> On 14/02/2023 03:24, Hector Martin wrote:
>>> On 13/02/2023 20.09, Krzysztof Kozlowski wrote:
>>>> On 12/02/2023 16:41, Janne Grunau wrote:
>>>>> From: Hector Martin <marcan@marcan.st>
>>>>>
>>>>> Add the apple,t8112-pmgr-pwrstate compatible for the Apple M2 SoC.
>>>>>
>>>>> This goes after t8103. The sort order logic here is having SoC numeric
>>>>> code families in release order, and SoCs within each family in release
>>>>> order:
>>>>>
>>>>> - t8xxx (Apple HxxP/G series, "phone"/"tablet" chips)
>>>>>   - t8103 (Apple H13G/M1)
>>>>>   - t8112 (Apple H14G/M2)
>>>>> - t6xxx (Apple HxxJ series, "desktop" chips)
>>>>>   - t6000 (Apple H13J(S)/M1 Pro)
>>>>>   - t6001 (Apple H13J(C)/M1 Max)
>>>>>   - t6002 (Apple H13J(D)/M1 Ultra)
>>>>>
>>>>> Note that t600[0-2] share the t6000 compatible where the hardware is
>>>>> 100% compatible, which is usually the case in this highly related set
>>>>> of SoCs.
>>>>>
>>>>> Signed-off-by: Hector Martin <marcan@marcan.st>
>>>>>
>>>>
>>>> Missing SoB.
>>>>
>>>
>>> I'd rather get an r-b, since this is going back into my tree ;)
>>
>> Please follow Linux process which requires SoB chain.
> 
> A SoB is not an r-b. I do not upstream patches that are unreviewed. I
> wrote the patch. Someone needs to review it.
> 
> The extra SoB is redundant because this is going back into my tree, I
> wrote it, and I will be the committer when I apply it. It's a one-liner
> patch. I know what I wrote. Sure we could record Janne's SoB as a
> technicality, but it feels silly. What matters more is that the patch
> gets reviewed, not that on a patch series technicality it ended up being
> Janne who sent it to the list. I could just pull the patch from my own
> branch and then it didn't go through Janne so it doesn't need his SoB.
> But it does need someone's review (because I absolutely refuse to merge
> my own patches without review, although not every maintainer has that
> policy unfortunately, which means there's lots of unreviewed code in the
> kernel).
> 
> Please. Let's cut down on the silliness. Please. We're trying to get
> stuff done here. I'm tired of having to explain every little thing over
> and over and over again. I really am.

Listen, I have no clue whether Janne changed the patch or not. She might
have rebased it or not. The chain expects that anyone touching the patch
must leave SoB. I am not providing my reviewes for patches breaking the
process we have clearly described. I also do not see any problem in
following the process we have - adding SoB whenever you play with a
patch and send it. Entire discussion is silly indeed, instead of just
following the process.

Best regards,
Krzysztof

