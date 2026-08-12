Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2049402444
	for <asahi@lists.linux.dev>; Wed, 12 Aug 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786526220; cv=none; b=nYPswx4CJcBTCeYIKi4dASwuJgqoa3RGeKuJ121DtSc0pehTtEhnDku7bZhXiIN+bEsJzlCILTWdl8GEZ+hSv4jbCIVY/vi6dTkdhgabdO6lw+2ezRaLsoRXGXrou4VYWMHCA9WT15Kk8ZBWDZhrM5MgUD16NuKIq0i1eku6cn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786526220; c=relaxed/simple;
	bh=52nIbc4C8IUH3GWFN/KqlchQG7sfho9mcq9xNbqX5+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U+3byI4I012O9uIYeFcZJXQuv7d1G/uo6ME0d45x10BqV9Cur+sj5IKN2lobCFw1iD4EAz/3AbiwjsOA1LQ4yhvhnrswqw867VexP285oVeLyrbJZEd5wPOYe8AkaJOjGPQlijnrHLmpFOXdamanvg8D3quJM17sOlaZRsDkZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=4D0qkhwQ; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="4D0qkhwQ"
Message-ID: <87321252-e974-47be-8f93-2adccb0b136e@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1786526215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ON4yX+Syw+jUtr/PaTXfaOXt9C8DXWZkJkHSUgV/U1I=;
	b=4D0qkhwQbpUK+GI/5Xv4UGBGxycC1R2eoVDXyp/KPpUAnNfxlwz2HOKzpH+cqBpywUyzYF
	fcE4ROXvn9TAS+ZWGWuIylNRTghUhAfiXYbHogCxDiT8CijH1FRLyNfkhrHLBTOPNoLloy
	NhQDA6knNs8wWPr8gtBb8keN48bZRuc=
Date: Wed, 12 Aug 2026 11:16:51 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: nvme: Add apple,t8132-nvme-ans2
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Yureka Lilian <yureka@cyberchaos.dev>, Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org
References: <20260811-apple-nvme-t8132-v1-0-865be32e42c3@cyberchaos.dev>
 <20260811-apple-nvme-t8132-v1-1-865be32e42c3@cyberchaos.dev>
 <20260811231121.GA271810-robh@kernel.org>
 <cf6f4732-1122-4381-962d-e18b32ac178d@cyberchaos.dev>
 <1e4b3f04-7367-4651-9cdd-5c95e92e5874@kernel.org>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <1e4b3f04-7367-4651-9cdd-5c95e92e5874@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/12/26 10:46, Krzysztof Kozlowski wrote:
> On 12/08/2026 10:08, Yureka Lilian wrote:
>> Thank you for the quick feedback!
>>
>> On 8/12/26 01:11, Rob Herring wrote:
>>> On Tue, Aug 11, 2026 at 10:49:47PM +0200, Yureka Lilian wrote:
>>>> Add a new base compatible for the ANS2 NVMe on the Apple t8132 (M4) SoC,
>>>> which uses a separate MMIO base for its NVMMU.
>>>>
>>>> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
>>>> ---
>>>>    .../devicetree/bindings/nvme/apple,nvme-ans.yaml   | 77 ++++++++++++++--------
>>>>    1 file changed, 48 insertions(+), 29 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
>>>> index 4c0b1f90aff8..c8a41b268b9c 100644
>>>> --- a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
>>>> +++ b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
>>>> @@ -16,6 +16,7 @@ properties:
>>>>          - items:
>>>>              - const: apple,t6020-nvme-ans2
>>>>              - const: apple,t8103-nvme-ans2
>>>> +      - const: apple,t8132-nvme-ans2
>>>>          - items:
>>>>              - enum:
>>>>                  # Do not add additional SoC to this list.
>>>> @@ -24,16 +25,6 @@ properties:
>>>>                  - apple,t6000-nvme-ans2
>>>>              - const: apple,nvme-ans2
>>>>    
>>>> -  reg:
>>>> -    items:
>>>> -      - description: NVMe and NVMMU registers
>>>> -      - description: ANS2 co-processor control registers
>>>> -
>>>> -  reg-names:
>>>> -    items:
>>>> -      - const: nvme
>>>> -      - const: ans
>>>> -
>>> Keep properties defined at the top level. More below.
>>>
>>>>      resets:
>>>>        maxItems: 1
>>>>    
>>>> @@ -68,25 +59,53 @@ properties:
>>>>    
>>>>          The SART address filter is documented in iommu/apple,sart.yaml.
>>>>    
>>>> -if:
>>>> -  properties:
>>>> -    compatible:
>>>> -      contains:
>>>> -        enum:
>>>> -          - apple,t6000-nvme-ans2
>>>> -          - apple,t6020-nvme-ans2
>>>> -then:
>>>> -  properties:
>>>> -    power-domains:
>>>> -      minItems: 3
>>>> -    power-domain-names:
>>>> -      minItems: 3
>>>> -else:
>>>> -  properties:
>>>> -    power-domains:
>>>> -      maxItems: 2
>>>> -    power-domain-names:
>>>> -      maxItems: 2
>>>> +allOf:
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: apple,t8132-nvme-ans2
>>>> +    then:
>>>> +      properties:
>>>> +        reg:
>>>> +          items:
>>>> +            - description: NVMMU registers
>>>> +            - description: NVMe registers
>>>> +            - description: ANS2 co-processor control registers
>>>> +        reg-names:
>>>> +          items:
>>>> +            - const: nvmmu
>>>> +            - const: nvme
>>>> +            - const: ans
>>> New entries go on the end.
>> Ack
>>> So nvmmu last and defined at the top level.
>> I did read the docs which said the properties should always be
>> introduced at the top-level, however I couldn't figure out how to
>> describe the intended constraints in this way.
>>> Then this is just 'minItems: 3'
>>>
>>>> +    else:
>>>> +      properties:
>>>> +        reg:
>>>> +          items:
>>>> +            - description: NVMe and NVMMU registers
>>>> +            - description: ANS2 co-processor control registers
>>>> +        reg-names:
>>>> +          items:
>>>> +            - const: nvme
>>>> +            - const: ans
>>> And 'maxItems: 2' on these 2.
>> When the three items are defined at the top-level, I can't seem to make
>> the dtbs_check work:
>>
>> [...]
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: nvme@27bcc0000
>> (apple,t8112-nvme-ans2): reg: [[2, 2076966912, 0, 262144], [2,
>> 2000683008, 0, 16384]] is too short
>>       from schema $id: http://devicetree.org/schemas/nvme/apple,nvme-ans.yaml
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: nvme@27bcc0000
>> (apple,t8112-nvme-ans2): reg-names: ['nvme', 'ans'] is too short
>>       from schema $id: http://devicetree.org/schemas/nvme/apple,nvme-ans.yaml
>> [...]
>>
>> despite this compatible falling into the "... else ... maxItems: 2" branch
>>
>> Would it be acceptable to define the reg and reg-names with just
>> minItems: 2, maxItems: 3, but without specific items or descriptions,
>> and then add the compatible-specific items and descriptions in the
>> conditional part below?
> No, because you do workaround for your own introduced problem. If you
> list the entries in top level in correct order, then everything will
> work fine with Rob's answer/comment.
>
> This is your case:
> https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml#L39

I had them in the correct order (nvmmu last), but was missing the 
minItems: 2 in the top-level. Problem solved.

>
> This is not your case:
> https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L127
> Unless you provide arguments why it is.
>
> Best regards,
> Krzysztof


Thanks for the patience,

- Yureka

