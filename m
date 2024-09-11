Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BB113AA36
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 18:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726079069; cv=none; b=Ew1oZZaDGjwzb8q9b83b/8Z3zvZVpAIS58QyKDXh0G5laAlagTVmidYp0YnnEj9kDTaheJbknGn2ijvdNHsHwDJ/ITW0FlJ5iZU0k+VtyO9i4dVqA5RyJlPhYOtW9piHlm2OeQKoF1unuZPHuvb7LMAZHRqcJX/nhDJsRELC4js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726079069; c=relaxed/simple;
	bh=cvqiyYpTKj6QlDq2ScTGcOqG00swdPqmgk62cIeBpTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFpxuE0x6CceI+ptOboQm9BVbmcPl6JkUUKcBHT3155MbtjL7cQXEgalYkS+d2y1kcyotOPlzOMWUPXCE2agUJnHouqPcwpZA8ylSMOLsJQXVZY//qFaqZFJU8l6kTucN0m00xtUEyDw0ES1n0AWW2g9EQiurs194EN1cj2UaY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMMRjokb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMMRjokb"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20688fbaeafso2353275ad.0
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 11:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726079068; x=1726683868; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfIVDRWLb0U29G6Ld/L8UCYuhUrTw/kzrAPqO0NhGVg=;
        b=MMMRjokbjEIUlgiBN/dbDf7gmzAjDPCyKYkz1UK95rNq26cUObOosOxA4hY9Dn8HoH
         qmD97d4EUJ8/caBHOB/xGA4tkh+wBKGJGfv4+K0qZrCVMiBIM+leBIp91TGXjpcVo4Wm
         D0sO3AsAXwyraCwwFK9IkhLDz33oKY7CgBpNhruZ+QOUr6nUaKAHcqyK3esDcNeLdykf
         coUe2o99HXY44AycUuTL5tRPV/WKiS+yd/vOYD9Q6f2H9UIDIaCoEdCEphhdW9RLqe3O
         YE0w4PQm0+KBsJWIoC7UzmElTvk6bYsr3FdZyjcmynS7Y1Ms0PZjhpbFrtzkM/0GpQBa
         5n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726079068; x=1726683868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfIVDRWLb0U29G6Ld/L8UCYuhUrTw/kzrAPqO0NhGVg=;
        b=SJq9i8qkXa8Fg50Xz4qqokz2uU/dENb6Au9S5huxmuvm/NzdCe+RXBVBYkuyvd/tYI
         47f8mutwS3h/i1gEMl/c4sr8wNaIe6IgJLUwXFSFRyTu9njJvgn21psdXRI/kMVW7XfV
         SYF67Gykm4kpABbG8Qtm/5y63yUc2b5xyCABU7FjkX2g3OQNwyy8VO6jZ2HUOixs9xQf
         FtCyZYDvZ8/Tk7MRdso3PJo+8t+gb8MUZRvsSjtQjmJOp0pCbb2cot2X9asTfor/jQTU
         qVipDZl4aVFjjB+6Wvpm3hPJeT18+Hs0JEIZ+2yezQdqW6u+TJu1JKqaWkCQtnZUcdbR
         oamQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnjC4df8fMWUKoEVF59a56lZoaWk23qqUZMR2yDGDVxWIXUwGb/gsaS0fyahn0qb5Q9O8NTA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzktf4BlNsnSx3IccX4/VxLIH0KXR8JEzoD8o1E4qjYdS1ikQo9
	AKJMHlTmyX0tNYhgpnaO+g1BWOJqies20RmfIQyiBEDBVddga9YP
X-Google-Smtp-Source: AGHT+IHHxXX5UoA4CTDu4tCRimM4Z3eVy1fID6lUB3MJ7mTupdKsilagtwt1uZjUhm4aOyBQP08guA==
X-Received: by 2002:a17:903:41cb:b0:205:6a9b:7e3e with SMTP id d9443c01a7336-2076e45ad89mr3273875ad.56.1726079067573;
        Wed, 11 Sep 2024 11:24:27 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe9e12sm2443985ad.200.2024.09.11.11.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 11:24:27 -0700 (PDT)
Message-ID: <fae6aad7-de6a-49ba-acf4-e1aa93baad2e@gmail.com>
Date: Thu, 12 Sep 2024 02:24:22 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/22] dt-bindings: arm: apple: Add A7 devices
Content-Language: en-MW
To: Conor Dooley <conor@kernel.org>
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
 Konrad Dybcio <konradybcio@kernel.org>,
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
References: <20240911084353.28888-2-towinchenmi@gmail.com>
 <20240911084353.28888-7-towinchenmi@gmail.com>
 <20240911-similarly-paragraph-0ca7a1d566c3@spud>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20240911-similarly-paragraph-0ca7a1d566c3@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/2024 02:13, Conor Dooley wrote:
> On Wed, Sep 11, 2024 at 04:40:55PM +0800, Nick Chan wrote:
>> This adds the following apple,s5l8960x platforms:
>>
>> - iPhone 5s
>> - iPad Air (1)
>> - iPad Mini 2
>> - iPad Mini 3
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  .../devicetree/bindings/arm/apple.yaml        | 26 ++++++++++++++++++-
>>  1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
>> index 883fd67e3752..3c81008f0e96 100644
>> --- a/Documentation/devicetree/bindings/arm/apple.yaml
>> +++ b/Documentation/devicetree/bindings/arm/apple.yaml
>> @@ -12,7 +12,14 @@ maintainers:
>>  description: |
>>    ARM platforms using SoCs designed by Apple Inc., branded "Apple Silicon".
>>  
>> -  This currently includes devices based on the "M1" SoC:
>> +  This currently includes devices based on the "A7" SoC:
>> +
>> +  - iPhone 5s
>> +  - iPad Air (1)
>> +  - iPad Mini 2
>> +  - iPad Mini 3
>> +
>> +  Devices based on the "M1" SoC:
>>  
>>    - Mac mini (M1, 2020)
>>    - MacBook Pro (13-inch, M1, 2020)
>> @@ -65,6 +72,23 @@ properties:
>>      const: "/"
>>    compatible:
>>      oneOf:
>> +      - description: Apple A7 SoC based platforms
>> +        items:
>> +          - enum:
>> +              - apple,j71  # iPad Air (Wi-Fi)
>> +              - apple,j72  # iPad Air (Cellular)
>> +              - apple,j73  # iPad Air (Cellular, China)
>> +              - apple,j85  # iPad mini 2 (Wi-Fi)
>> +              - apple,j85m # iPad mini 3 (Wi-Fi)
>> +              - apple,j86  # iPad mini 2 (Cellular)
>> +              - apple,j86m # iPad mini 3 (Cellular)
>> +              - apple,j87  # Apple iPad Mini 2 (Cellular, China)
>> +              - apple,j87m # Apple iPad Mini 3 (Cellular, China)
>> +              - apple,n51  # iPhone 5s (GSM)
>> +              - apple,n53  # iPhone 5s (LTE)
>> +          - const: apple,s5l8960x
> 
> Is the "x" here a wildcard?
No. This is part of the SoC ID. This is the legacy naming from when Apple
used Samsung SoCs for iPhones and iPods, and every SoC would have an ID
beginning with "s5l", and ending with a "x". Apple A7 is last SoC to use
this legacy naming scheme.

> 
>> +          - const: apple,arm-platform
>> +
>>        - description: Apple M1 SoC based platforms
>>          items:
>>            - enum:
>> -- 
>> 2.46.0
>>

Nick Chan

