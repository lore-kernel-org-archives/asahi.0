Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265432F3C3A;
	Thu,  5 Feb 2026 18:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770314516; cv=none; b=PnCU5Ag2FGW2YI5dEFcg2TZW2u868hWbVpvZL3AE3AmslDYktH12r6xZbDkp9FhTEXtDOFNUWpeRk7REO2FA1+2KFHwmJ6+CB/dCLiR6XaMtnDM6CzfHuJr4BZOrqWg2GErcETf4UO9/hsR5o40Efm2ZDqiZvhpVAO+uD9h1L4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770314516; c=relaxed/simple;
	bh=Jfw7DB/NVA9J+9D9HNJnpKypCog0AebKB2y5FR+C5Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOkX7hwDqrnZ7d259nWMtvADJPXIdjT0o/TvhyL2yjJpiJCDnOBhJI+on0KOMhFzNQeO9hTa3Kj4Gmt0uRJewInO3twmG3W0k1bFGRGaswQvzsbuMl4LavAzjeeE2w013gsNds1W5n6U8eEDDZpDf70EkKEKJFbVozDBtu9z91I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPLjrAke; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPLjrAke"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7733AC116D0;
	Thu,  5 Feb 2026 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770314515;
	bh=Jfw7DB/NVA9J+9D9HNJnpKypCog0AebKB2y5FR+C5Go=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LPLjrAke8ush1zNg4q3/Ec1O4OAmeODrMUvL3D2HNorgziz1PEO1r7W7IH9abYzv1
	 Wom2spzpKHHQQq+QHkNraJ3QymAPTUI5TmNYJWi3AAAyjYcD40ASAUDdmZ+PN/yosc
	 Z8+N+Ug1K/IoEbsnBI8l7kIEC92sla5iHxM3W+KbdiQid4lsm7LnsVEXA+LPynyAy7
	 IjMdWlY5bhewwXkdnMswdLBM3xs3tgQStBJr9i18hnFRcD2JCxfabcwgELMs6SYe0Z
	 Rp1fGRn4cYGIsWDuhU5kyszWQ8ojr1yKxX7YalIiG0vHlKztpQM80oGyiESvdEjiuK
	 9ZwUvuYopI8PQ==
Message-ID: <8f506b2b-1309-4f9e-b8e6-4a73064ea2d0@kernel.org>
Date: Thu, 5 Feb 2026 19:01:51 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: apple,aic2: Add
 AICv3
To: Krzysztof Kozlowski <krzk@kernel.org>, Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
 <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>
 <20260205-pastoral-magnificent-cuscus-ce58ad@quoll>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260205-pastoral-magnificent-cuscus-ce58ad@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05.02.26 13:50, Krzysztof Kozlowski wrote:
> On Wed, Jan 28, 2026 at 09:57:08AM +0100, Janne Grunau wrote:
>> AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
>> in its base functionality. It can use the same device tree bindings as
>> AICv2 so add it to the AICv2 bindings.
>> This interrupt controller is used on all Apple SoCs starting with M3 up
>> to at least M5.
>> The only apparent difference is the increased IRQ config offset. Apple's
>> device tree codes this new offset as property of the "aic" node but the
>> value stayed constant for all SoCs with "aic,3". Since the SoC specific
>> compatible "apple,t8122-aic3" will be used in the driver this offset can
>> remain a driver implementation detail.
>>
>> Signed-off-by: Janne Grunau <j@jannau.net>
>> ---
>>   .../bindings/interrupt-controller/apple,aic2.yaml  | 45 +++++++++++++++++-----
>>   1 file changed, 36 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>> index ee5a0dfff437816056bda0de5523bf38be4f49ba..a6e2251fcc111340c0a27ab6912452f6b1255be2 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
>> @@ -4,10 +4,10 @@
>>   $id: http://devicetree.org/schemas/interrupt-controller/apple,aic2.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>   
>> -title: Apple Interrupt Controller 2
>> +title: Apple Interrupt Controller 2 and 3
>>   
>>   maintainers:
>> -  - Hector Martin <marcan@marcan.st>
>> +  - Janne Grunau <j@jannau.net>
>>   
>>   description: |
>>     The Apple Interrupt Controller 2 is a simple interrupt controller present on
>> @@ -28,14 +28,24 @@ description: |
>>     which do not go through a discrete interrupt controller. It also handles
>>     FIQ-based Fast IPIs.
>>   
>> +  The Apple Interrupt Controller 3 is in its base functionality very similar to
>> +  the Apple Interrupt Controller 2 and uses the same device tree bindings. It is
>> +  found on Apple ARM SoCs platforms starting with t8122 (M3).
>> +
>>   properties:
>>     compatible:
>> -    items:
>> -      - enum:
>> -          - apple,t8112-aic
>> -          - apple,t6000-aic
>> -          - apple,t6020-aic
>> -      - const: apple,aic2
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - apple,t8112-aic
>> +              - apple,t6000-aic
>> +              - apple,t6020-aic
> 
> If you are re-shuffling these, you can as well sort alphanumerically.

I don't have a strong opinion here but the last time this came up we 
agreed that we'd go with release order IIRC for consistency since that 
order is used in every other binding for this platform.

> 
>> +          - const: apple,aic2
>> +      - items:
>> +          - enum:
>> +              - apple,t6030-aic3
>> +          - const: apple,t8122-aic3
>> +      - const: apple,t8122-aic3
> 
> Hm? How so this is not aic or aic2? We asked not to use generic compatibles
> for aic/aic2 - for all your early upstreamings. Our advice and request
> was in general rejected, although I could make a long term bet that we
> will be right. And here we are.
> 
> Does this patch mean you finally agree with DT maintainers and abandon
> the generic compatible fiasko?

Yeah, see 
https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/


Best,

Sven

