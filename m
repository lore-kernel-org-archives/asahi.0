Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C335814D2B9
	for <asahi@lists.linux.dev>; Mon, 16 Sep 2024 14:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498046; cv=none; b=rOSb2lV6siHxHS4WWG3Ue8x8yzDiyOHPS46BDEmNda/PF5SsqOuEQp//kdqkUDIy7jPIOxqDbh/ZBBNlpx06C6EmcHeVCuXdOSltpO21lQA6XUKGaT4xdHckUttSB69GbjD+dh5dVQ8MLCvrWcZbsQ0XTPgbLp3iIhKtvag1TKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498046; c=relaxed/simple;
	bh=r28B7KOlyk0USWch3chI75N3jUpy9XYDxZu7HjFeA6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQuDVEL6lSyDIPOyIPiGBAm5xTpul+kCWRQXoEXcyOrOWtZGjEGBvyyhBGMOQsb/4jATmvzmSoUHIlK0pYo37d21ooTthDltA2ZXSHclOmg2ANMoooQaiKrCsI5JjJTKTShi1LNG2d1RMFOazmyQx9w7kGeY0dRoQnOdKyqd8DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg8QnlVa; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg8QnlVa"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7d666fb3fb9so2184471a12.0
        for <asahi@lists.linux.dev>; Mon, 16 Sep 2024 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726498044; x=1727102844; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJ8ddh1mE+rZEVPh4FlUNjjQ/3bZOvBuJzK+R3GghbU=;
        b=hg8QnlVam2NFwpWAHCMyXnHM2/ZCECU5rYGDIyfll1qPBw6zfuaRqLxnFpJ4zPC+R+
         00ZTUDZx56no7T7yPFTiYioleLF2zqqT/FnZdJ96l7iHUaTGPL+bVb7sWETXkborqf0V
         gTlvgi0CCWloCrlTn1rYseU5U+eDicJq2x54M98weg2p7ib6Zht9KHvDnbykprxAR1p0
         56f8hpuZD7K3Sjy46XkRELGo5VV9cmDItvEne5uA5vQnwruQ5OUKAN99a2X4I4DY6Y62
         XqCcWDeo9M8gb+K1CkQEwY4EFpAyuDmgl7ZtGQo5LjKuWyyygrw3oEdRGVG4g2J6faeu
         Fi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726498044; x=1727102844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ8ddh1mE+rZEVPh4FlUNjjQ/3bZOvBuJzK+R3GghbU=;
        b=R0i6+0QZOiz76+6OjJv3WWk6vfTOPykacddc1Wcbds/r77PQKtg7RYvWjdipMHH8Kz
         y3cyQrlVhF10RjBQ3U9O3fstkcpqDIeCcxb9xH7mKczO/r9sWHmhORwdqEZGcuio2rIX
         WoWO5sygQ2PglaA6A2+4I+llDdRyxdj8Htvit7SOAbmzDZo2nM9zZ1aogZYXiVr+6GfG
         ybma+RhF43oh9ChrNZE586upz9HkrODBzUXqfxm95XTvNBeVRT7Xac6b5YN2+RGEOa8N
         Ppk8reM+NkbWo4Ai694IRkX2Ca5fF8o/2kcg1suWya3i0OatTql4HegesaasABSlGZhg
         ZwNg==
X-Forwarded-Encrypted: i=1; AJvYcCWTS9pECEtSkBvLN0/vKk++ygAhgPiRyl3xjRYBVqSlexMYzBmLwNvnkaaE3ON/ovSIQGLQXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNbowVq110ioFN1oYJWQaCCrVchEOVup9PQZfczHfVjO2tlSaG
	jg19pGmtn7R5dFNJP09uZAWxAB1HjU5N6RpxbY1YOJk/qs8weGB0
X-Google-Smtp-Source: AGHT+IG1wHKbJb2JdItsRdO+p6aWLUSqzhZx/7SQGfo5/vw1/UAnjlLHgs8oWzTV5MspFfN72B9h4g==
X-Received: by 2002:a05:6a21:3993:b0:1cf:4ed:ffc0 with SMTP id adf61e73a8af0-1cf7559895dmr22944550637.4.1726498043924;
        Mon, 16 Sep 2024 07:47:23 -0700 (PDT)
Received: from [172.20.10.2] ([182.153.8.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7b301sm3795675b3a.107.2024.09.16.07.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 07:47:23 -0700 (PDT)
Message-ID: <c5407291-a799-4b41-aa84-4717a476b661@gmail.com>
Date: Mon, 16 Sep 2024 22:47:16 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/20] dt-bindings: arm: cpus: Add Apple A7-A11 CPU
 cores
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20240915080733.3565-1-towinchenmi@gmail.com>
 <20240915080733.3565-2-towinchenmi@gmail.com>
 <m4hw6wt2xcsgt23fvu7okump62bqhugpyecp3hqlj37x6m4gno@tmui7wdzhs3h>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <m4hw6wt2xcsgt23fvu7okump62bqhugpyecp3hqlj37x6m4gno@tmui7wdzhs3h>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/9/2024 22:34, Krzysztof Kozlowski wrote:
> On Sun, Sep 15, 2024 at 03:58:46PM +0800, Nick Chan wrote:
>> Add the following CPU cores:
>>
>> - apple,cyclone: A7 cores
>> - apple,typhoon: A8 cores
>> - apple,twister: A9 cores
>> - apple,hurricane-zephyr: A10 logical cores
>> - apple,monsoon: A11 performance cores
>> - apple,mistral: A11 efficiency cores
>>
>> In the Apple A10, there are physical performance-efficiency cores that
>> forms logical cores to software depending on the current p-state, and
>> only one type of core may be active at one time.
>>
>> This follows the existing newest-first order.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/arm/cpus.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
>> index f308ff6c3532..3959e022079f 100644
>> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
>> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
>> @@ -89,6 +89,12 @@ properties:
>>        - apple,blizzard
>>        - apple,icestorm
>>        - apple,firestorm
>> +      - apple,mistral
>> +      - apple,monsoon
>> +      - apple,hurricane-zephyr
>> +      - apple,twister
>> +      - apple,typhoon
>> +      - apple,cyclone
> 
> Please keep alphabetical order. And no, just because earlier Hector
> added stuff in reversed order, is not a reason to keep doing the same.
Ack. All bindings added in this series except

Documentation/devicetree/bindings/arm/apple.yaml

will be changed to alphabetical order in v2.

> 
> Best regards,
> Krzysztof
> 

Nick Chan
