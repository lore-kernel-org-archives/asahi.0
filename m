Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7478F5F
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 15:44:01 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id k3so5070311wrv.5
        for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2n1P+oxHN3aWLMoTlDV1sEh1xrBUj1nJ88KGxvBB7eo=;
        b=GQxiPXdmDktffRQCnppmyv0xFEog6TPxrD2bymnw/uSvXzcoEYBoRfFoJQEgRdPwGW
         /5x93+HS/fjxAeUe7aG1GCWt3OTViEd2o8qTxeBw11eXInsf/nAF5YEa3S0bQEtJ8oXy
         pLF7Op8HU3AU19EtCPFGXhg7GTTzAlIzSyhFbLBYZHc7mfphPdNAgKOhjUFMpl2Mnqp4
         bcAyneP743z3I6CdGGE/GTMGk7EPr6seWsk27jC/gSLBultzTr2IYeKSAVdmzN2L6kn1
         ikj+nFHYXsuuG6QBT3R13WZ9yZ57KvKH4mTZtrBNW1nctKu01Lg9lSivCkn97K8fX0TQ
         VleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2n1P+oxHN3aWLMoTlDV1sEh1xrBUj1nJ88KGxvBB7eo=;
        b=yXkfHC2VxYW8tcpp+1GaEuB3pCApLdxGLfJYK7Zhy66cHfmfo8w25UBOntuKef+y7y
         S6UHcEFbehvNZIcss23Wxc3wFgiUV0fMpG8zhjyWycE7VQvu8ZnLV72YrZWNZlK+ySmE
         c4AHhpL4rZjRsLGZfyZm9AUf/z4NwmTuoExmbtUptQCA9KQftp4w1gmyDes/8TiuAZMm
         PheZ05R3iUU2EZzB8Z8ZAJ4psow/SC28br0ZOJZfEC0HG9gqNjL5cH5PvLzSPfB3ah0r
         sXPWdD2axPO65/+Zk4lixDuHXqKOlkeMXgVv4I303WtmLKBLIgAWV/YTAQRvw4OFE1mg
         fcPg==
X-Gm-Message-State: AO0yUKVASxbg/EoWm7kocJJmwcK/GxNw/xLhV5Ec4cOW0bs85wz0l4Dl
	Aik816Amj1rfDAPKPyJ2XwpUXg==
X-Google-Smtp-Source: AK7set+KF3h1+YGzYPh0y156dCFx+9jGfO3uVnyyofEcfGGK9uX+dB6tZ571mwgmhxAYwQ1kdZTrwg==
X-Received: by 2002:adf:f14f:0:b0:2c5:561e:808e with SMTP id y15-20020adff14f000000b002c5561e808emr3415217wro.12.1676303039995;
        Mon, 13 Feb 2023 07:43:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a1-20020adff7c1000000b002c54a2037d1sm8657866wrq.75.2023.02.13.07.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 07:43:59 -0800 (PST)
Message-ID: <2b67050c-7429-8528-de24-2d923e3c9671@linaro.org>
Date: Mon, 13 Feb 2023 16:43:57 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 17/17] arm64: dts: apple: t8112: Initial t8112 (M2) device
 trees
Content-Language: en-US
To: Janne Grunau <j@jannau.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-17-cb5442d1c229@jannau.net>
 <1ea2107a-bb86-8c22-0bbc-82c453ab08ce@linaro.org>
 <20230213140113.GE17933@jannau.net>
 <16804864-dce2-d68c-ce81-b6fdeb20a527@linaro.org>
 <20230213150823.GF17933@jannau.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213150823.GF17933@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/02/2023 16:08, Janne Grunau wrote:
> On 2023-02-13 15:36:33 +0100, Krzysztof Kozlowski wrote:
>> On 13/02/2023 15:01, Janne Grunau wrote:
>>>>> +
>>>>> +		pmgr: power-management@23b700000 {
>>>>> +			compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
>>>>
>>>> Why this is simple-mfd?
>>>
>>> I suppose because the syscon device is not limited to power domain 
>>> controls. The dt-bindings in arm/apple/apple,pmgr.yaml specify those 
>>> compatibles. See the original discussion in:
>>>
>>> https://lore.kernel.org/linux-devicetree/57991dac-196e-a76d-831a-d4ac166bfe29@marcan.st/  
>>
>> This did not answer my concerns. There are no children here.
> 
> The child nodes are in t8112-pmgr.dtsi

Ahhh, so this is overridden? Then it's fine.

Best regards,
Krzysztof

