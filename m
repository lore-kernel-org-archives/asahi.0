Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A3D2F37
	for <asahi@lists.linux.dev>; Wed, 10 May 2023 08:23:36 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-965fc25f009so957763466b.3
        for <asahi@lists.linux.dev>; Wed, 10 May 2023 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683707014; x=1686299014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCtlG5oNLfTNjucw+rVtjHVln976pj7FRJKPu1vOWCU=;
        b=stvWBTx3heDqYc8aSgTI3BHDQux4v2TvX7ePqr7TWy2oIwonjSsmQIMNrxBcmC3z4e
         BS4k/8AWHGaveRJIUw40CJS8WtuwF7UK9jyKzYf5lDNpjykNLco9iQAlUMW1jzbZHQus
         4Z1wnrGMRNce020lZ7Jh2Oz06Quqe6UasRv48FZHGCtYb9nzgDNLTRvpD6xEIID6lFFm
         sezv0XEvautL4bFo/dCUFiITpubUrH6Y3pvwek4R6TBZwZwASqGRF3WZLNL3+/jeBiAF
         n/iTdlisi6g6ypd/IgkQ5KNXl2YjQRCbKvhqCuLWTjwoSd4yCy5uDpIskty2xPlCoZZE
         HQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683707014; x=1686299014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCtlG5oNLfTNjucw+rVtjHVln976pj7FRJKPu1vOWCU=;
        b=Gthw//9MCzJlO/fksx5saPG75VSsKVnDvBLeZ42RvSzOZ5y4LUD4TM3+3Tse4Biz8j
         PQGdsNXfZAqd04YYMAGGJ7is2KbcDTnp2cOKi8hIYm5p5rADsHw8ZaNBZgM94qHb2Zc1
         hbndn0cw5jtz3PEe9qZ6qqzpXvWsyyRPHRVcGRPgKZSCZ1cyeifwp2WE92T67au7qDfH
         oq2YZtIYA8SMmbCz+oVs4Ry2w11mVsX3ZzVEzeS5NRrdO/yu59/HDVU7Jgmn4fm8Tueo
         x00B0EDZnxz/UNjhFvfUsaaT+kuu+4pik9evwuwW4PNpvs/xQZ7Q14c/NdGvqKCuZu2A
         YB3A==
X-Gm-Message-State: AC+VfDzRSf7NSt6DrHCMk0xsnsn5+IBoRexy5J2Om7iTtoS9PVz1j6qs
	PBtoubxNq4GD9/cd8sy2t7vqzw==
X-Google-Smtp-Source: ACHHUZ5xP/23S+hpnC77/OrnFL6X6B7uO0M1ffqlHOOjvrKIowK3CPXhhGvAtmsSBTpG8NGiLLs0jw==
X-Received: by 2002:a17:907:971d:b0:966:d59a:4ba6 with SMTP id jg29-20020a170907971d00b00966d59a4ba6mr10431771ejc.43.1683707014305;
        Wed, 10 May 2023 01:23:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id la26-20020a170906ad9a00b00967a18df1easm2375908ejb.117.2023.05.10.01.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 01:23:33 -0700 (PDT)
Message-ID: <627f1739-98b4-9576-4b11-887c8f7e0c52@linaro.org>
Date: Wed, 10 May 2023 10:23:32 +0200
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <04BB0158-6C7B-400C-A87A-6E9B2835FDC7@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/05/2023 10:15, Martin Povišer wrote:
> 
>> On 10. 5. 2023, at 9:51, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 09/05/2023 18:38, Martin Povišer wrote:
>>> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
>>> mono amplifier with digital input.
>>>
>>> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
>>
>>
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  adi,ana-gain:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [0, 1, 2, 3]
>>> +    description: |
>>> +      The value to be set in the ANA_GAIN register field on the codec. This determines
>>> +      the full voltage span of the codec's analog output.
>>> +
>>> +      To quote the datasheet on the available options:
>>> +
>>> +        00: 8.4 V Full-Scale Gain Mapping
>>> +        01: 12.6 V Full-Scale Gain Mapping
>>> +        10: 14 V Full-Scale Gain Mapping
>>> +        11: 15 V Full-Scale Gain Mapping
>>> +
>>> +  '#sound-dai-cells':
>>> +    const: 0
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - adi,ana-gain
>>> +
>>> +additionalProperties: true
>>
>> uinevaluatedProperties: false instead, so users can have name-prefix.
> 
> I actually tweaked this to have the example passing, which has sound-name-prefix,

true is not allowed anyway - it makes your schema simply not effective
almost at all as it allows anything...

> which I guess is what you have in mind. Not that I exactly understand what these
> options do (both additionalProperties and unevaluatedProperties), the schema docs
> didn’t enlighten me right away when I looked into it.

The way to go and to start always is to look at example-schema. It tells
you explicitly to use additionalProperties:false and switch to
unevaluated "If and only if another schema is referenced".


Best regards,
Krzysztof

