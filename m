Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AE18E756
	for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 14:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724165613; cv=none; b=VMuErCqP6UCyBjLGIhMpNZgTJC3or25TqXGAiLRNxpxpKX/AuGtbae8YVinb5PqjGo9Xp4MpInFOFtuXzGkRzVjwYUi8XRkXxkZvaaQS0LHNQD2Vh0/Rm1j6xqt65uxfyqXTTOt9ZxEaIr9HKl13l/SYk06dkB5KKMfGVWdQuSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724165613; c=relaxed/simple;
	bh=owuVia3Ec8hS4Tzg0YSGZnP3tTpMNFwhZ9EjmnZfm+c=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=NVfy+xbYlkO1cuj4R/x6z9yVTZ7ka+TrCwt7V+sURU8I6DsivrMrmOLMOVjp7u7qiMK/Q0rjSyK3cqT0fbUjYJPEmPYnWJXPimirHB64aT0mqQH6j3SVrewlw3+nQUQNdeQBvQhMFNh8Z96HmMgvYGq/m9u0Ti56ERNoUMSZ1r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=D5Qcyyyp; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="D5Qcyyyp"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7a8caef11fso658372966b.0
        for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1724165609; x=1724770409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6lean+ba5I8okfjRQmm7UZf9YwlE6ssXVcZQnVO7azw=;
        b=D5QcyyypZ0lT0dopTdczKpOq82LH2cP0htzWoZtCPN1AIP6xCZMXu0gQiJpvXMg0Vq
         yrV0zoKxAMkwZmsEn9CORfdZTy80ne0HL1Ccz5++TOgjXxPLBye7xf8o5/8zWvxHhWRR
         j7zbbBHgiGES1r7jRjezunysAJ1IlEWQlWMBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724165609; x=1724770409;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6lean+ba5I8okfjRQmm7UZf9YwlE6ssXVcZQnVO7azw=;
        b=bZk/JIHbvyt8q81lc1HEj/ZnxrJH8zeSiYjssRtNRibFseLwPlgre1L0SqMayunCb2
         30bj8Fm4hS8qbbWLgx7nA2mQ3YRBmeWO3hnXPUYE+rNJD6aO1zc5+obE1t94sOVldNkS
         +BbmXWKzqpIxVY/MeJkRgRGvVN8s6VykckOeztDiy8T+auFbl5CO0oQiKe/s/l1svoCK
         Zw9Mof6zHr3QJlmVIZ5R0Q24CA4Bf56dNpH4jMbE7Enxa+8ernhKEwgdWphTxzTp6zLm
         HeCj2/x9tOlcjuLPPk1CY2icmBCjsBqHrLSl+WPhaC6B2ELaGAHCLfR2IgiAmQYM38Ao
         X2wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy2N3o6Y6H00cDEpM1UK+P7hG/OWwakqYsZJhU+QJPaY2KJ6ZtdmR2nkcSM0mUZeU6G45CyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBD+tWeIjeiUFMdOa+IWDkonBePctK5Q0oVaXhi4Duu5ihxMmC
	iXKlbj8cgG0fbqRKOh1tgW9z+3LjFvyRLkTGmO0c4MqRaQswYDpC9fM/btbHiw==
X-Google-Smtp-Source: AGHT+IFX/h/PLBfDZU8MSLKQU8nyhQrbufsrivLrvdyUAmZSegFOoBiDC+LSNAKDzv39f6JQD1gdSg==
X-Received: by 2002:a17:907:da0:b0:a77:db34:42ca with SMTP id a640c23a62f3a-a8392a03bb6mr1038816866b.49.1724165608691;
        Tue, 20 Aug 2024 07:53:28 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839356e2sm767430566b.105.2024.08.20.07.53.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2024 07:53:28 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Kalle Valo <kvalo@kernel.org>, Hector Martin <marcan@marcan.st>, Krzysztof Kozlowski <krzk+dt@kernel.org>, <devicetree@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <asahi@lists.linux.dev>
Date: Tue, 20 Aug 2024 16:53:28 +0200
Message-ID: <19170474e58.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <6777d425-b27f-43d0-ba81-b36ac0b8f929@broadcom.com>
References: <20240820101216.355012-1-arend.vanspriel@broadcom.com>
 <20240820101216.355012-2-arend.vanspriel@broadcom.com>
 <mbvhz3wosnykejgs65es2sfedxoevysbqu3jxmpgdze2b2tl6o@grx4mxas2bmf>
 <7881c303-bef1-403a-aa70-30d33558f57f@kernel.org>
 <6777d425-b27f-43d0-ba81-b36ac0b8f929@broadcom.com>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [PATCH 1/2] dt-bindings: wireless: restore constraint for brcm,bcm4329-fmac compatible property
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On August 20, 2024 2:50:24 PM Arend van Spriel 
<arend.vanspriel@broadcom.com> wrote:

> On 8/20/2024 1:39 PM, Krzysztof Kozlowski wrote:
>> On 20/08/2024 13:27, Krzysztof Kozlowski wrote:
>>> On Tue, Aug 20, 2024 at 12:12:15PM +0200, Arend van Spriel wrote:
>>>> When extending the bindings for Apple PCIe devices the compatible property
>>>> specification was changed. However, it was changed such that for these
>>>> devices it was no longer necessary to have "brcm,bcm4329-fmac" listed as
>>>> string in the compatible list property as it was before that extension.
>>>
>>> Apart that this was never tested... That statement is not true. Look at
>>> "fixed" commit - it is not doing like that at all.
>>>
>>> I don't understand the reasoning.
>>>
>>>> This patch restores that constraint.
>>>>
>>>> Fixes: e2e37224e8b3 ("dt-bindings: net: bcm4329-fmac: Add Apple properties 
>>>> & chips")
>>>> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
>>>> ---
>>>> .../net/wireless/brcm,bcm4329-fmac.yaml       | 19 ++++++++++---------
>>>> 1 file changed, 10 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git 
>>>> a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml 
>>>> b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
>>>> index e564f20d8f41..47f90446322f 100644
>>>> --- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
>>>> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
>>>> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> title: Broadcom BCM4329 family fullmac wireless SDIO/PCIE devices
>>>>
>>>> maintainers:
>>>> -  - Arend van Spriel <arend@broadcom.com>
>>>> +  - Arend van Spriel <arend.vanspriel@broadcom.com>
>>>>
>>>> description:
>>>> The Broadcom Single chip MAC part for the BCM4329 family and
>>>> @@ -27,7 +27,6 @@ properties:
>>>>          - brcm,bcm4341b0-fmac
>>>>          - brcm,bcm4341b4-fmac
>>>>          - brcm,bcm4341b5-fmac
>>>> -              - brcm,bcm4329-fmac
>>>>          - brcm,bcm4330-fmac
>>>>          - brcm,bcm4334-fmac
>>>>          - brcm,bcm43340-fmac
>>>> @@ -46,13 +45,15 @@ properties:
>>>>          - cypress,cyw43012-fmac
>>>>          - infineon,cyw43439-fmac
>>>>      - const: brcm,bcm4329-fmac
>>>> -      - enum:
>>>> -          - brcm,bcm4329-fmac
>>>> -          - pci14e4,43dc  # BCM4355
>>>> -          - pci14e4,4464  # BCM4364
>>>> -          - pci14e4,4488  # BCM4377
>>>> -          - pci14e4,4425  # BCM4378
>>>> -          - pci14e4,4433  # BCM4387
>>>> +    - items:
>>>> +          - enum:
>>>> +              - pci14e4,43dc  # BCM4355
>>>> +              - pci14e4,4464  # BCM4364
>>>> +              - pci14e4,4488  # BCM4377
>>>> +              - pci14e4,4425  # BCM4378
>>>> +              - pci14e4,4433  # BCM4387
>>>> +          - const: brcm,bcm4329-fmac
>>>> +    - const: brcm,bcm4329-fmac
>>>
>>> And this does not make sense... You claim that some constrained was
>>> droppped and you re-add it, but in fact you still add the same code as
>>> it was before.
>>>
>>> NAK.
>>
>> Ah, the last "const" actually makes sense, I missed that.
>>
>> Commit still however lacks rationale why these devices are compatible.
>> Plus existing rationale that e2e37224e8b3 changed something is entirely
>> WRONG. It changed nothing. ZERO. It only added new devices, which was
>> claimed are not compatible with brcm,bcm4329-fmac.
>
> So is that claim true? What does it mean that these new devices are not
> compatible. If they are they should be in a separate binding or the
> applicable properties for these devices should be made conditional.
>
>> Now if you claim that original commit which said "these devices are not
>> compatible with brcm,bcm4329-fmac", then please provide arguments, not
>> just say "other commit did something". It did nothing...
>
> Not entirely true. Indeed new devices were added for which no
> "brcm,bcm4329-fmac" string is required in the compatible property. Also
> the commit added new properties for these new devices. Now in my opinion
> a driver should not use these properties without a "compatible" check.
> Hope we can agree to that. However, the driver patch for supporting the
> binding change does no such thing. So if we leave the binding as it
> currently is the driver will have to check if compatible has any of the
> listed PCI IDs before processing the properties. As all properties old
> and new are marked as optional I can not come up with an argument that
> these new devices are *not* compatible with brcm,bcm4329-fmac.

Looking at the commit in patchwork I see no claim in the commit message 
that the new devices are not compatible. The patch even adds enum with the 
PCI IDs *and* brcm,bcm4329-fmac. It is anyone's guess what the intent was 
for doing that. My take is that this was a mistake worth fixing.

Regards,
Arend

>
> Regards,
> Arend
>
>> Best regards,
>> Krzysztof



