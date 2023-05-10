Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A680C
	for <asahi@lists.linux.dev>; Wed, 10 May 2023 07:42:53 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50b8d2eed3dso10529156a12.0
        for <asahi@lists.linux.dev>; Wed, 10 May 2023 00:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683704571; x=1686296571;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSvYi8ezsl6O/bO/+mRMMF1WJ2AcmYFcBwK0eCs1+B0=;
        b=V8UM4jVtflYukiqfJ9daE7lswh754lFdgNUeJFumYN1MiTcH0SS1tuszj9z6OqTP5b
         A52iwYjsInfhvrPyXZ4alUPGF4Q09JHJTVs3oTSEndjj53IGVxAa7P+UlVfN+lAk1LgW
         YWXH6QfQ1bzUBh90SIxOfUMirK2FY2iOQzgqlLlIwtAsnkOYm4N0M8NOUHOfD54DcBjY
         ZdZc68E1E6SJJP0orv0ToU97w7MgeDKLrUan+VEmzqUEsP/WqqyOAvACYrIlbRRjY3TT
         q5rKnDlmNTm0GxS5mkr+NxSTP0ad/7bEQHEOS3/84+G7pKQgWaSmsTV3oHdwYF0kQVrK
         3DAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683704571; x=1686296571;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LSvYi8ezsl6O/bO/+mRMMF1WJ2AcmYFcBwK0eCs1+B0=;
        b=cDBazjz6IlBqWYuro3sIjkhxSa+dgPDxU3n7dUc7SNurGcgb/5MnYiya5JwTncVtNH
         2tkGJRlLrbwlZJuo6X6PIyYn7vleZJhRQtwWrOC6r6xYObW7zfzIsIXCLyzFebz3R0kI
         TG3buTUkvWe79QKoL3aslMlL7iDIrf94TAQvL/WdLcspNxr+npxsYO7YPEtl4L691yVq
         XKQv9KkdE9ZMorryZfq0BDHZCQhcouOMNkcDSSHtIA8yWuO+LaVELuL0fPzCuekg21hz
         MlluUF9JT9SBxBjwWSpq2Na8HJ6EKHupJ5oDps9+p8r82UsZ2YKgCWG9XcojQP8VB8iS
         iUkA==
X-Gm-Message-State: AC+VfDwDn7dA5id+CmlXJefEVDkJjtHPdUvrsh6eeXlve/9S1+W4XyJv
	exoJidAkwIb2MR4t5wqPyZXRGA==
X-Google-Smtp-Source: ACHHUZ58UJ91o2BbbMuSuhkpixMMpyByW/Dt7rOLTp6FTQzWMvixrA/vIOCJ6JTen0nmU64qgRX5Lg==
X-Received: by 2002:aa7:c68c:0:b0:50b:d495:106c with SMTP id n12-20020aa7c68c000000b0050bd495106cmr13720697edq.8.1683704571368;
        Wed, 10 May 2023 00:42:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id s24-20020aa7d798000000b0050bc37ff74asm1626913edq.44.2023.05.10.00.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:42:50 -0700 (PDT)
Message-ID: <f40daf65-ac65-5df6-828b-c5ded00c4c8a@linaro.org>
Date: Wed, 10 May 2023 09:42:49 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: dt-bindings: Adjust #sound-dai-cells on TI's
 single-DAI codecs
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
 Shi Fu <shifu0704@thundersoft.com>, Shenghao Ding <shenghao-ding@ti.com>,
 kevin-lu@ti.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
References: <20230509153412.62847-1-povik+lin@cutebit.org>
 <baf338a7-1e63-4842-32a1-8f63f850bd2d@linaro.org>
 <A8647EF5-566A-4B99-9020-772810CB2BF7@cutebit.org>
 <F12DE31C-E167-47F0-BAE0-C09538C5C3C8@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <F12DE31C-E167-47F0-BAE0-C09538C5C3C8@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/05/2023 09:33, Martin Povišer wrote:
> 
>> On 10. 5. 2023, at 9:30, Martin Povišer <povik+lin@cutebit.org> wrote:
>>
>>> On 10. 5. 2023, at 9:17, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>> On 09/05/2023 17:34, Martin Povišer wrote:
>>>> A bunch of TI's codecs have binding schemas which force #sound-dai-cells
>>>> to one despite those codecs only having a single DAI. Allow for bindings
>>>> with zero DAI cells and deprecate the former non-zero value.
>>>>
>>>> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
>>>> ---
> 
>>>>  '#sound-dai-cells':
>>>> -    const: 1
>>>> +    # The codec has a single DAI, the #sound-dai-cells=<1>; case is left in for backward
>>>> +    # compatibility but is deprecated.
>>>> +    enum: [0, 1]
>>>
>>> Does it? I see playback and capture.
>>
>> I think so. Playback and capture are not separate DAIs.
>>
>> Martin
> 
> I double checked, I am pretty sure. There’s a single snd_soc_dai_driver,
> which becomes a single DAI.

Indeed, I see now one entry... Ehh... -ENOTENOUGHCOFFEE

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

