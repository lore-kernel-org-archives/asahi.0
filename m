Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229883043CE;
	Fri,  6 Feb 2026 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389075; cv=none; b=Gcs1k0/n+gA1N48XAkhd5g1MNpUaTnjm1SRnlO76DH9ja4n58F6gGVto5yE2By8wZN7KMRfG87Ij6e3IQl/jAzuVLFGTCSqJ//lHX6phBkTDi1BhM6wT3uGjwAdA84oMpWB0nxEo6o9LwASIQXta1p2bnFhQgRxcUQdkQsb+EvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389075; c=relaxed/simple;
	bh=WqpH7NpECmNqf7k95aSVChL/z7Nah2bI6O93+EyEo9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUShVqxscCYUmZzZKsH8kAN6JF36QiVfntLX/GtkCpgRL5E8sBuSbqbTG6YNudJA7zTAOtwKo027S9j5vnZl1jE4dodi9I0Bt0EwAkD4W/VkhY/gv/hEgX0TLGKDOweeFH3ELATEO6v2lUdeDu0AjOlKGXqu0Hk5zZxMrNihsJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItY2jYQb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItY2jYQb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1BAC116C6;
	Fri,  6 Feb 2026 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770389074;
	bh=WqpH7NpECmNqf7k95aSVChL/z7Nah2bI6O93+EyEo9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ItY2jYQbzKhJiyfaUgZikEhxeI200qgma2/oQRBED77Nvb/Kwxg743/k0e1o3vpcU
	 Ikh/o8uHonnwZ0wrJGjElk9/PWZlh3yc1YyIvOzD89H9caq2JDJpL8AeDv6LoQAYnZ
	 H7+LtYuc28+rv+C3AoN+dshLZYL8CI1RpcognkYFmyx4ElSZBHMVvjaGsTvYOxIjGY
	 O9Q/agczwnnUeP6i+Cv7nP9Wci1vJPdmsWFn17o6zGvBmmegESyrQlGVkYzsZSbKxy
	 vGDYAuR6Qls8kKQFBp1Vjx8wY8EjsQ7x1obsWxkSt5gchtXRij0n/f87c4c6tFez0C
	 GLoaC1Q+eSnfw==
Message-ID: <0cc9bd0a-958b-4e63-b2ed-959a3ea43440@kernel.org>
Date: Fri, 6 Feb 2026 15:44:30 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: apple,aic2: Add
 AICv3
To: Janne Grunau <j@jannau.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
 <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>
 <20260205-pastoral-magnificent-cuscus-ce58ad@quoll>
 <8f506b2b-1309-4f9e-b8e6-4a73064ea2d0@kernel.org>
 <20260205221918.GA71415@robin.jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260205221918.GA71415@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.02.26 23:19, Janne Grunau wrote:
> On Thu, Feb 05, 2026 at 07:01:51PM +0100, Sven Peter wrote:
>> Hi,
>>
>> On 05.02.26 13:50, Krzysztof Kozlowski wrote:
>>> On Wed, Jan 28, 2026 at 09:57:08AM +0100, Janne Grunau wrote:
>>>> AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
>>>> in its base functionality. It can use the same device tree bindings as
>>>> AICv2 so add it to the AICv2 bindings.
>>>> This interrupt controller is used on all Apple SoCs starting with M3 up
>>>> to at least M5.
>>>> The only apparent difference is the increased IRQ config offset. Apple's
>>>> device tree codes this new offset as property of the "aic" node but the
>>>> value stayed constant for all SoCs with "aic,3". Since the SoC specific
>>>> compatible "apple,t8122-aic3" will be used in the driver this offset can
>>>> remain a driver implementation detail.
>>>>
>>>> Signed-off-by: Janne Grunau <j@jannau.net>
>>>> ---
>>>>    .../bindings/interrupt-controller/apple,aic2.yaml  | 45 +++++++++++++++++-----
>>>>    1 file changed, 36 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>>> index ee5a0dfff437816056bda0de5523bf38be4f49ba..a6e2251fcc111340c0a27ab6912452f6b1255be2 100644
>>>> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>>>> @@ -4,10 +4,10 @@
>>>>    $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
>>>>    $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>    
>>>> -title: Apple Interrupt Controller 2
>>>> +title: Apple Interrupt Controller 2 and 3
>>>>    
>>>>    maintainers:
>>>> -  - Hector Martin <marcan@marcan.st>
>>>> +  - Janne Grunau <j@jannau.net>
>>>>    
>>>>    description: |
>>>>      The Apple Interrupt Controller 2 is a simple interrupt controller present on
>>>> @@ -28,14 +28,24 @@ description: |
>>>>      which do not go through a discrete interrupt controller. It also handles
>>>>      FIQ-based Fast IPIs.
>>>>    
>>>> +  The Apple Interrupt Controller 3 is in its base functionality very similar to
>>>> +  the Apple Interrupt Controller 2 and uses the same device tree bindings. It is
>>>> +  found on Apple ARM SoCs platforms starting with t8122 (M3).
>>>> +
>>>>    properties:
>>>>      compatible:
>>>> -    items:
>>>> -      - enum:
>>>> -          - apple,t8112-aic
>>>> -          - apple,t6000-aic
>>>> -          - apple,t6020-aic
>>>> -      - const: apple,aic2
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - apple,t8112-aic
>>>> +              - apple,t6000-aic
>>>> +              - apple,t6020-aic
>>>
>>> If you are re-shuffling these, you can as well sort alphanumerically.
>>
>> I don't have a strong opinion here but the last time this came up we
>> agreed that we'd go with release order IIRC for consistency since that
>> order is used in every other binding for this platform.
> 
> The intended scheme as documented in some commit messages is first base
> Mx SoCs in release order and then Mx Pro/Max/Ultra SoCs in release
> order. This scheme isn't used consistently though. I think I fixed that
> in one or two bindings already but there are other using a different
> order.
> I think these unecessarily complex rules are guaranteed to lead to
> inconsistencies. I'll resort the entries alphabetically as that's the
> only rule with a chance of consistent use.

Sure, I'm totally fine with just using alphanumeric order everywhere as 
well.


Sven

