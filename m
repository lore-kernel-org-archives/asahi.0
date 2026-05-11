Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5E43FD14C
	for <asahi@lists.linux.dev>; Mon, 11 May 2026 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778509366; cv=none; b=FEV4Jr+g4spmjb0AkbnreXmYvauCin6+pY5pKnqQnIXd1DAU+I4ATzBiQFrBQR3S1FiVG3XLuzMOhnVCt6naOJzersYKAa2p6TcFINzK6oXprsJNXlzge178khs+7IPFXAG5+XZJy+54NhymXTwGou0w+qmSX+gg70nM+EwovQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778509366; c=relaxed/simple;
	bh=0FlTIhTMu2DTDeACCQiODrRFMSlCXPDergcLpIG34qY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uOrGP/9QCoFI+5Cu0et/c6Ue4YTKCiBcuUcdjydRQKtbcjE/c6ypcrcoFABaBI/8ojZnYcPLy2+CabiwOn4vPiio+oQBVeEcP8GdHeWXIHON8ZuRtYEvVxoC7/Y2RnZCHgYwTLgiKxLJW4s/mgfCzkjmhR9Jhf54Xh+Ogt3d3rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVpdNy/P; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVpdNy/P"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12ddbe104ccso3867416c88.0
        for <asahi@lists.linux.dev>; Mon, 11 May 2026 07:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778509364; x=1779114164; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aO7P1AELULNXLt9xs0Z+M6/B6olysO/VTpw1VPmDiTA=;
        b=lVpdNy/Pnr6Scoz+sc6ZQIMH4o3n3EUQc6xORppqd7YomllDRUdpWnyxPAS072MNlO
         7rMYVqR0wYKZp51E0Kk2j2R3MH21EsDABo77WmCnhSUj2VMGdwzscVxvRvaGyTR6drmu
         C5Sy9izfxWnsJlfQQJo3FCOGcOtn0jBsJyP4WED7B5YW44u/2rz/ZvhrGVapMLJSCScf
         EJ+YZSVvWrQ2zBVpRSU3ZCiZk2yLvUOZmdGVunik0Xj+HQ0+8W0vlgWpOJSCXRnwEhz5
         m1ZBgtuNvJBpeYPAXDYI1WQuPOVepR43Pux+pwfn+v5LQuA9mYBgo9XjTeTZG69GVEfI
         8Vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778509364; x=1779114164;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aO7P1AELULNXLt9xs0Z+M6/B6olysO/VTpw1VPmDiTA=;
        b=JaADdTcau9ps5+iUXRV2ULMadvmg4VKq/M4///ijn75lCkDmEiBJvwWPqvtaTDiPvI
         9MzCAeOLHOYld/vrVzh9At0k+P4aDWXoZZohnzvXkWvWSnxDdsAEPcJmqmshkoo2bDtO
         KnbdKw0UvyXgsaQvvTUP/t5KBZF5Tn0eIf7bOxcXHwFQzNxD1H+6BMLlt1fJxPQLMSI5
         8XppdhaskQEvUiB7L09FYBa4mTudkNkqPyCteC28oWLPNP09jXvnUXzpUH1pSik+YrNF
         0bZsrYMudDZqxZqyMMe/8cXVC8lWh47HeFz+meJRv4Ooug1kRn/xosp7KLup8v3pazEq
         PsGA==
X-Forwarded-Encrypted: i=1; AFNElJ9cYiCQBW8wi8csam5U5HXoaXeq9cWIEWCR6+DUl6J6FdOsMZYrjf4Edrl1jIrtgr3qYxFGTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTjxbITxph0HmCawCQwtIDeh813Vlb7fqaslxygS+Z+U1e2OJK
	g2Kh7FRmycZDe0sHtI/1efjLo2mucBmGOIqW/vHQ0ZtkgpGWs3FjwqS182fmrg==
X-Gm-Gg: Acq92OE1AErFxXvnx3BvQyHHDNf1/k+44WA2d0W6qsHqC5qptQ3oELLtjAERTF05xpz
	J39BWrSQ9CYsaCO/71E3vvg5jsjYuJfBcRO+ehZ5DTY3Gf9qTRQYjG2Cc0PXMSGfJRK8wcKs8FC
	wXhd3nkGyJ9y3LbDflGBlmRWUPdAQlPDrU9q97kzIJxG9wPsBcucg/wdhJfY/qyRzy08vby4L0q
	XBw9+IDYphiRWPdicoLwBNisMg7F3JrZfGjUI+Tun5lRsRlnCMVEr8w03Wz9CS3qDWvQAeFOuv4
	4QlGXAPhgMY448hay6p1jevoeKizJP8pX+iTwlINqUojenXXPCY8ZLm5ur+xZj9EnUPApqf/dX6
	tBs4EqhrI+MZx2JgZ0Aomljz4iPLjOzP9ycbkvQ302tbeLaB+KnH7HXjkJojfkPyiZUxZqTMXft
	m8MXDc7odeaG1MjkO2COzn+qboNcRc86UT+8wbPqvc0Jm9qXrzrw8gd02OeyMlbT5TyW6FBT8c
X-Received: by 2002:a05:7022:6184:b0:130:ac5d:8f69 with SMTP id a92af1059eb24-1318ea1fdd6mr9903404c88.30.1778509362916;
        Mon, 11 May 2026 07:22:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327821fd00sm17932591c88.8.2026.05.11.07.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 07:22:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <50b904dd-3c36-4f1c-b2e7-8727e7923475@roeck-us.net>
Date: Mon, 11 May 2026 07:22:40 -0700
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: apple: Add "apple,t8103-wdt" compatible
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>
 <87766879-ca5e-44cc-a341-87b2afa70910@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <87766879-ca5e-44cc-a341-87b2afa70910@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/11/26 07:04, Guenter Roeck wrote:
> On Wed, Dec 31, 2025 at 01:07:21PM +0100, Janne Grunau wrote:
>> After discussion with the devicetree maintainers we agreed to not extend
>> lists with the generic compatible "apple,wdt" anymore [1]. Use
>> "apple,t8103-wdt" as base compatible as it is the SoC the driver and
>> bindings were written for.
>>
>> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
>>
>> Fixes: 4ed224aeaf66 ("watchdog: Add Apple SoC watchdog driver")
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Neal Gompa <neal@gompa.dev>
>> Signed-off-by: Janne Grunau <j@jannau.net>
> 
> Applied to my hwmon-next branch.
> 

watchdog-next. Sorry for the confusion.

Guenter

> Thanks,
> Guenter
> 
>> ---
>> This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
>> device trees in [2].
>>
>> 2: https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net
>> ---
>>   drivers/watchdog/apple_wdt.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>>
>> ---
>> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
>> change-id: 20251231-watchdog-apple-t8103-base-compat-8a623e9831b6
>>
>> Best regards,
>>
>> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
>> index 66a158f67a712bbed394d660071e02140e66c2e5..6b9b0f9b05cedfd7fc5d0d79ba19ab356dc2a080 100644
>> --- a/drivers/watchdog/apple_wdt.c
>> +++ b/drivers/watchdog/apple_wdt.c
>> @@ -218,6 +218,7 @@ static int apple_wdt_suspend(struct device *dev)
>>   static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
>>   
>>   static const struct of_device_id apple_wdt_of_match[] = {
>> +	{ .compatible = "apple,t8103-wdt" },
>>   	{ .compatible = "apple,wdt" },
>>   	{},
>>   };
> 

