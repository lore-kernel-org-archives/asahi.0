Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455E53ED113
	for <asahi@lists.linux.dev>; Mon, 11 May 2026 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508427; cv=none; b=tDKI0N8XIABeXkxwSujbc2J0A/w5/pi3rP6wCsjKkx5kK/6J42ubGWxw//qsslReUpqBjNJLwx0F62YBXtNfQxZARUzoeRU6H6bJA3auwy6ih8/oXqnD7JWaNVxHj1z/7/MqoG1/diMPUABFZHJk9fWx2eSr4SgL/LV/nWopCLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508427; c=relaxed/simple;
	bh=c00x+tDayDK3Kt1FSHj2HYahT1APb/2S+xJqWZhIrn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKkNHyqmPXhxxrYJFYZzTsFpkH9PxnT8mdAhtMYKJp4MuT8XWGYy0r5weu5SQ+Q5OcYfJCp73CSUqZYDY+8eWqTXfE51zO92twJqLgH+V9dStnLxqJmiu2S9ei+NpMuOQW827PkB1YP8MZEZMvQovnXew8g1ZNqP+2pYK9ykXms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rgpf1/uX; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rgpf1/uX"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ee1054627bso3824097eec.1
        for <asahi@lists.linux.dev>; Mon, 11 May 2026 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778508425; x=1779113225; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IIRmX8yvWOE0keIC88cl37prTEp8JFShOTj497UPSeU=;
        b=rgpf1/uXLXF/XwMwmPeYRcSR/h3JnZoZ2eSVPLlHQOmFRJgNn3v5OYqomYbCY1CzrP
         MzxmQ/bh3keD8T5xLM/cmlwgvGQXkMCjPU7xzfdVzc205X54KReODixg5TLkbhxnXuDN
         jtJeheg7H1C4lu61iWJnj2vB/ykuSMTHEfv7GM1A1PYIVuViqnaDH7hebtqh4cAmROef
         /dRCcJGGqiRX3/XNDFuDpcHkcXQrXxLRpAUd87RU9AJeDfjzFlGDVu+aQYrhRKLXsDIf
         w1XXr+FGyi51PvHzFo13v5WqbBLp9IbU+T6P2Vpax67pqqpX2yKn1csefwBpXv4EqWwA
         uUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778508425; x=1779113225;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIRmX8yvWOE0keIC88cl37prTEp8JFShOTj497UPSeU=;
        b=ZkfPOdXjyK2q/etN/T7tT0OarOemVbv3S07oxjn2cnZ/B4rekKC4DrqZn/IK9WDf03
         n4cwRqIUFZhsGvrdUSqS+0AkaNVBE1k6sfIsHjs11m2jwJmPLNThgNQsG9BT8PbaXGFJ
         WCfCmY01cIYFYKESrb0dQ4HyTscfnJfx3NMWE47ZbLqPzmyEu8AMpST4WRgOXNswjRi1
         Lizb+RuNsmP5w1cli2IuLFTNhEi0XSrJHjjXQAS2jUpOhwGFeUU06aBQiAzFnn9NjTaX
         bX9pF58F5STaxIM3TNjVONxCkw/BXel8tm/SMMT0sUoycKWbUYHtH2QbtP1NZT7uSuh6
         ms5w==
X-Forwarded-Encrypted: i=1; AFNElJ+ASNX9BumA68Ag/hRO6uNEm8VxcVM2Ip/Y9FaLbnIc0s38JqsU/DPlH5r4HvDLJ54G+Cf/IQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOUBxqcO74qaG9A6oh7U3BNOqmsyvGE8GBcAOKQ+nJClqttIr6
	JwRKFUGZjZeX/A6hHO9mZwH3hZj9vvLzxstezhgRlbZW5a6szudWlHM1
X-Gm-Gg: Acq92OEO8d6Uc8rf2DXPTLEIKaCpdMTnSvleEaZ0Zyp+9XY++1obacf1UDruX95b7vI
	j1dHWd7d59AlUiu898beY225TTRRqxpY2M91FfB8122B4nRbOGPbvsGYWsMG3XVo2Y6Ux3afuRS
	tRy6NF1QUOI4WvGeNyD8NAUgEr1O6SMLPDjAt9/zdAmPAJzsrjWneL+JLvRVDGGH28TvbnLzJjJ
	0NXtThdppqllXnsZ/FRdZ0jg40qqhNr3wzzJBGHbxV2LU89va+KDMAi64hR9z8caCkBv7KCi7Ju
	w/i+hjrpZkGTshnOVmFnLjT+1/r9h9izJ8lAw30IGcVR8nxSyi15g4bVI+Uto2x9ji6srmLBMJE
	IXPXHUcJhqqyvCmIHBU9IQWJ19TTz7sVk5je5ytUzTz2W4I9oxjDkpfZBHal6JkPup990hZuZyD
	ulZGwgwWA9+BrFGfnx03NU3N9C+PbyTlOJ+pHOb6lunhAKbFV1lGUz96Iodaf+X52ONFkKKzWM
X-Received: by 2002:a05:7301:4593:b0:2df:498e:811b with SMTP id 5a478bee46e88-2f6e25fb074mr8270299eec.7.1778508425153;
        Mon, 11 May 2026 07:07:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm13979264eec.2.2026.05.11.07.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 07:07:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2b53f8ed-bfd5-47c0-a7da-146726fba593@roeck-us.net>
Date: Mon, 11 May 2026 07:07:03 -0700
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Mark Kettenis <kettenis@openbsd.org>, Sasha Finkelstein <k@chaosmail.tech>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
 Joshua Peisach <jpeisach@ubuntu.com>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
 <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
 <85ea46a7-1136-4ea0-9eec-7dfa465df20b@roeck-us.net>
 <20260511085028.GA192358@robin.jannau.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260511085028.GA192358@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/11/26 01:50, Janne Grunau wrote:
> On Sun, May 10, 2026 at 08:29:39AM -0700, Guenter Roeck wrote:
>> On Thu, May 07, 2026 at 09:33:08AM +0200, Janne Grunau wrote:
>>> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
>>> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
>>> "apple,t8103-wdt" used by the driver.
>>
>> '"apple,t8103-wdt" used by the driver' is not true. The watchdog driver
>> only supports "apple,wdt".
> 
> It slipped my mind that
> https://lore.kernel.org/linux-watchdog/20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net/
> wasn't picked up yet.
> 

Me too. Applied both.

Thanks,
Guenter


>>
>>>
>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
>>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>>> Signed-off-by: Janne Grunau <j@jannau.net>
>>> ---
>>>   Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>>> index 05602678c070..845b5e8b5abc 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
>>> @@ -16,7 +16,9 @@ properties:
>>>     compatible:
>>>       oneOf:
>>>         - items:
>>> -          - const: apple,t6020-wdt
>>> +          - enum:
>>> +              - apple,t6020-wdt
>>> +              - apple,t8122-wdt
>>>             - const: apple,t8103-wdt
>>>         - items:
>>>             - enum:
>>
>> I second Sashiko's findings that the driver will fail to bind because it
>> only supports "apple,wdt". I would not mind and apply the patch anyway,
>> but the statement in the description is just plain wrong and thus
>> misleading. Please fix.
> 
> I would prefer if the addition of the "apple,t8103-wdt" to the driver is
> picked.
> 
> Thanks,
> 
> Janne
> 

