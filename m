Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7A01D2C0
	for <asahi@lists.linux.dev>; Wed, 10 May 2023 08:30:53 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9659f452148so1221499866b.1
        for <asahi@lists.linux.dev>; Wed, 10 May 2023 01:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683707452; x=1686299452;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ycVbFDvJKMn/ZQ/Sjxa4EA026DOMmlduluDtzGBRPK8=;
        b=jbw+ByzEda9BliMbGY9HEq5I/RrhS6mjA5ZAszCbu34H0KfK6/qm14nYYc69sxKGej
         ssRbmkfsRxyavVVVyzETV+5pgOSh0hUmgMeT48fZcT8jXCsOHozyMdUcLJtSnwdDmC7x
         9at0/CMH10PidpH9LSeZkOnhtYZ4PQVtS1vBT3rMwY2FdGixiur9vygWFs2E3hcpZC8m
         2GUmcFx0P1Z5fOPxPVIJ/WaBT8kTAMc0Z7zXnnMyV4X5VoWBZNx/Br3hHiGP5Rl4/5q6
         8OKF3GKxh+yRYeg/HoPC7J6EI1F/Ul2imJkcZbmV1smSuAljge7u10FJbDt8iqlLc73H
         Z2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683707452; x=1686299452;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycVbFDvJKMn/ZQ/Sjxa4EA026DOMmlduluDtzGBRPK8=;
        b=YcEX2OhPL0P935xRXslUVVtjUh9jpopv85HgVDb/uONh3WPLELQnIX7YEi1iKYCpQH
         5EXL8TaU3UBWyzHQcF/+dzzpjlOmYhBApR6j7+MSgyjFvpudfA2vghNxoVHeS56cQt3m
         F0WNe4FMZudpKiye9qA/t7bVzWPunW++NCKZ4hFf6JYDUvfuhj2g+DbR2A542dDaVes4
         pm7feYof8bBdETqkzakYqaldgpSYyxNqYgR4/8Jc4GXBFST3We3AmPIVNcyJ53iSFST3
         KNH7udsP/R2iDV9t9bqaxWB5t3li5+YdE7zoJL2tBXeKmr4ItpCZ/m1d0kl8HFWP1lxk
         sp9A==
X-Gm-Message-State: AC+VfDzKOEQlzQrOnHslDoiWDhdI0tW5ChPHP5jH0vNQVnRhF9PmcojU
	sREc6FQzEI1aGH9U7ajX6gB/mg==
X-Google-Smtp-Source: ACHHUZ7F+ZXWaQdztu2Ta5OaQNG0xil5uAK5Tm4AyA6F7SoxpLJulLwH2YMvCEfUBS6Yo/M4ELlyOQ==
X-Received: by 2002:a17:906:fd8e:b0:961:a67:28d with SMTP id xa14-20020a170906fd8e00b009610a67028dmr14295990ejb.22.1683707451838;
        Wed, 10 May 2023 01:30:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709060a4400b0095ed3befbedsm2379116ejf.54.2023.05.10.01.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 01:30:51 -0700 (PDT)
Message-ID: <0fcc4617-e706-8743-e65d-1ff99f38ddac@linaro.org>
Date: Wed, 10 May 2023 10:30:50 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>, asahi@lists.linux.dev,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <7b8c22e3-75c1-8803-fb32-097d12fbde78@linaro.org>
 <04BB0158-6C7B-400C-A87A-6E9B2835FDC7@cutebit.org>
 <627f1739-98b4-9576-4b11-887c8f7e0c52@linaro.org>
 <5FC57F67-CC16-4DA4-9A0D-9F9A0539EE67@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5FC57F67-CC16-4DA4-9A0D-9F9A0539EE67@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/05/2023 10:29, Martin Povišer wrote:
> 
> 
>> On 10. 5. 2023, at 10:23, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 10/05/2023 10:15, Martin Povišer wrote:
>>>
>>>> On 10. 5. 2023, at 9:51, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 09/05/2023 18:38, Martin Povišer wrote:
>>>>> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
>>>>> mono amplifier with digital input.
>>>>>
>>>>> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> 
>>>>> +additionalProperties: true
>>>>
>>>> uinevaluatedProperties: false instead, so users can have name-prefix.
>>>
>>> I actually tweaked this to have the example passing, which has sound-name-prefix,
>>
>> true is not allowed anyway - it makes your schema simply not effective
>> almost at all as it allows anything...
> 
> That makes sense.
> 
>>> which I guess is what you have in mind. Not that I exactly understand what these
>>> options do (both additionalProperties and unevaluatedProperties), the schema docs
>>> didn’t enlighten me right away when I looked into it.
>>
>> The way to go and to start always is to look at example-schema. It tells
>> you explicitly to use additionalProperties:false and switch to
>> unevaluated "If and only if another schema is referenced".
> 
> OK. While I have you on the line, what does unevaluated do? In what sense are props
> unevaluated?

Properties can be evaluated by some other referenced schema (e.g.
dai-common.yaml). If nothing evaluated them, they are unevaluated, thus
unknown and not allowed.

Best regards,
Krzysztof

