Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767729A8
	for <asahi@lists.linux.dev>; Tue, 25 Oct 2022 18:56:52 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id t16so9375036qvm.9
        for <asahi@lists.linux.dev>; Tue, 25 Oct 2022 11:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2qLSpogfW3OQu3eVlGO6LKpsYjIV1r1MhY4lvAzTskc=;
        b=KX4Mi+BLarTQIYnjBPsFf/oCYyAVBxh0ePagIS0BJ2Wbo7g7d//418+ayy+2I8rARM
         s3FCaqvCsNzcaKfHSPBiOjG1a/AkPSHHXqh9lqymOWXRLoY8Hxu8ZLzFBsFMAi7XT5w3
         D4e2wLoajRDUFOpl6Z0Hq4VN+d5WWMVNcx26Bn60ZLQR5kHqgdNWqIGIjjHcTIDhiKpr
         AKN/8YO23QXoQEssPmhql5yGZkzekKpDM/u0SYRfBAFntru/bZriZoTBptZHp1ZWVqw+
         IzdwdTMm9R3E0idMrn0gqrSdX9/+2h0nALoD/VrnkI0rC3BzIXan0vDWTceceWLuiLT1
         +CZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2qLSpogfW3OQu3eVlGO6LKpsYjIV1r1MhY4lvAzTskc=;
        b=6t+WC27xR1A4j3jqjND2pNl0+uTpCCVIrabG1O2tt9E0sD4Aph37ivSDG78sJFvg/G
         a8tIKLHBlWzgdqXjHa22qQDOzk4CM3IzXXgD3CZN3FjVud6aFJw18XVRt1rAkeWswBks
         fCnfV13C10Y7QC4RXiIDEF/OzzMLKhov5HEyTHdXX1x96Bi69H277/Odu/Q/53pzwEUm
         uMPAtcT63AfTlSHz2how0EU4xASk/lHztCGOiQYnbcjBjXCGFPqFqpzGdGKg6MALlUQb
         EoIbj1A9zneXcN9W6n+Rq0WIC4jHhQHfETDKF3+F+z9FOEvH8IlmlontKvayd2pqRs8L
         xA1Q==
X-Gm-Message-State: ACrzQf2Vv0lhxjzsrXE5eKwwYlP9B9C1tgpuz1gwRtxr0VUZnevdNzqO
	vvJk+Aice2uhbPfYybvduTfUpA==
X-Google-Smtp-Source: AMsMyM4bCIbXwBiHy/Q3UOvNd8jZjJ7e5ZS+wJwzwYzIb8/YnaoXKvANkVRVKcLnP84ZJQ4p7ieKbA==
X-Received: by 2002:ad4:5dc6:0:b0:4bb:798f:5272 with SMTP id m6-20020ad45dc6000000b004bb798f5272mr8134448qvh.131.1666724211165;
        Tue, 25 Oct 2022 11:56:51 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id b23-20020ac87557000000b003a4ec43f2b5sm195614qtr.72.2022.10.25.11.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 11:56:50 -0700 (PDT)
Message-ID: <21602556-8312-fb7a-1981-cd03a314d904@linaro.org>
Date: Tue, 25 Oct 2022 14:56:48 -0400
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <97d3d6d4-b19c-a194-de41-f17e65bf3eb6@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/10/2022 13:22, Hector Martin wrote:
> On 26/10/2022 01.01, Krzysztof Kozlowski wrote:
>> On 24/10/2022 00:39, Hector Martin wrote:
>>> This binding represents the cpufreq/DVFS hardware present in Apple SoCs.
>>> The hardware has an independent controller per CPU cluster, and we
>>> represent them as unique nodes in order to accurately describe the
>>> hardware. The driver is responsible for binding them as a single cpufreq
>>> device (in the Linux cpufreq model).
>>>
>>> Signed-off-by: Hector Martin <marcan@marcan.st>
>>> ---
>>>  .../cpufreq/apple,cluster-cpufreq.yaml        | 119 ++++++++++++++++++
>>>  1 file changed, 119 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>>> new file mode 100644
>>> index 000000000000..b11452f91468
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>>> @@ -0,0 +1,119 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Apple SoC cluster cpufreq device
>>
>> Few nits, in general looks fine to me.
>>
>>> +
>>> +maintainers:
>>> +  - Hector Martin <marcan@marcan.st>
>>> +
>>> +description: |
>>> +  Apple SoCs (e.g. M1) have a per-cpu-cluster DVFS controller that is part of
>>> +  the cluster management register block. This binding uses the standard
>>> +  operating-points-v2 table to define the CPU performance states, with the
>>> +  opp-level property specifying the hardware p-state index for that level.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>> +          - const: apple,t8103-cluster-cpufreq
>>> +          - const: apple,cluster-cpufreq
>>> +      - items:
>>> +          - const: apple,t6000-cluster-cpufreq
>>> +          - const: apple,t8103-cluster-cpufreq
>>> +          - const: apple,cluster-cpufreq
>>> +      - items:
>>> +          - const: apple,t8112-cluster-cpufreq
>>
>> With the first one (t8103) - it's an enum.
> 
> This is deliberate. t6000 is compatible with t8103, but t8112 is not
> (though all are compatible with what the generic apple,cluster-cpufreq
> compatible implies).

I was not talking about t6000. I was talking about two entries - first
and last - which should be just an enum. There is no compatibility, so
what is here deliberate? To not make enum things which are an enum?

Best regards,
Krzysztof

