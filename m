Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0303E17DFFC
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 18:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726080017; cv=none; b=XCHdZXueWKklfxIl8zjAFMqwh/24qLG7b7RWfj3WI4LJA00eNrwyRXR+RpS64MBiVrvONwi5lKQ1hQEEjfptpb6L6foJEJzEISfCjoLGln5JE/cg9CPX4kWFdVKXc17BZDtYugssuxpQ4gsutYZaKx011l+m0QEn81q533sCq34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726080017; c=relaxed/simple;
	bh=7LZvl8bR4J5JCUKcVqkF7fXZODe/gIENMVevu9s2WTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGNGNr23lMluykWlotnEvrIH0y20lBhloBYT4OuNgStHQON2moV6rAq84oPw0B5NBbh6xd3br7qmXY+lT8oXokKCn4sToSjizhIA77XWaQFVt2X6zx8h4bcYcAnhZpB1nMZwtA4mYkMeQJpZOZ5qLrSiudD/H3n3eLKL30LYHoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiDbWJcQ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiDbWJcQ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7d5119d6fedso909993a12.0
        for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726080015; x=1726684815; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1+7p3Z5qCC26Ye8mLVaKGA4gMsf3x0zTnnTmPLOwPnE=;
        b=fiDbWJcQ3dBnM09ywSKjIB55CgAFKSEH2/qU7OBNpFI8Zy0od8zz+zUdDKSQjOMDb4
         MFi6N+jp1JNqH03EoHoqwd3Bdhy0jyRGT3v0gqwgzME6UkLGIzgTvoyk6gkYZNmB+Q0I
         Qq38hytSUFH38XUnmNRI4BIOlmy+KGB8T3L2N86uexQq0RLUKOVMvUj1YUMppZW5JGhR
         BMd9SFCChWilWQztSh6jXzgmpQN5jPmtP0eM4aVEf1cYIxdtCm8JFWOG4wXiWNqMvNF4
         LvFY2EOXQE/tHbpL6vZ73AThPxBza95cvSn/zgwxIARDKm+ACYkm7LNTv9mxSyI4nPPR
         Cnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726080015; x=1726684815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+7p3Z5qCC26Ye8mLVaKGA4gMsf3x0zTnnTmPLOwPnE=;
        b=SYgk0ExMk9u1ywQ9WPdqVkniOA+UN0rBkhD+YtK0k/izB4aofQT7waxSXTgikYAZfl
         22ZusBQFiC/cuB83VYTCTEGHhUDyRIyb15yriTB+RCEWinpDUd7RhmUw5oCV2nsaNKKH
         AokDztOz3jBH7jxlYFMNrDOBVQzH8LqB30IMqCqcDFb1j483vKFe57wJBcKn9wjFRYRR
         PjwKzeYWhkVOHKuzf9LWPR+ILV0u5pBLX+R1K9r9wgHdxCFtTtxFpuPgqeio2mSRxJeB
         le0nGHZH2mHkwJ1/bAl2bVsIa+M7IQ1x7x7Ac4XA7rcanG/QlbyzQxCGKItOik4ejuyE
         +WRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi70DEaPbYllOU6ZcULw29INRtkkBvyP/5ype3UNEhQ3jovRQsfxFBvAOjIDZS7tQQPFmqcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YycSMLisrs1SyFZswZcnYy6SRvn1sNC35L+z7jIBIXDoAyhtYrj
	7E49VHoxnF/UV8vdAtGQ4yeXbn9BWxrziVoCIhu3XcIsrbw4fxI4
X-Google-Smtp-Source: AGHT+IGWNpBp0JEJJKNe7VJxVt4ola9QUy4T9WHvT1vG5vjPcbQJy+069xnc1aIkGvbTJudOOVEgTw==
X-Received: by 2002:a17:902:e80f:b0:205:5f95:c283 with SMTP id d9443c01a7336-2074c5d28d9mr77798925ad.4.1726080014877;
        Wed, 11 Sep 2024 11:40:14 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076b039539sm2541905ad.309.2024.09.11.11.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 11:40:14 -0700 (PDT)
Message-ID: <a3849bc0-000a-4290-b2c3-71a50a750495@gmail.com>
Date: Thu, 12 Sep 2024 02:40:09 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] dt-bindings: arm: cpus: Add Apple A7-A11 CPU cores
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
 <20240911084353.28888-3-towinchenmi@gmail.com>
 <20240911-unsuited-pranker-60a7d0b6caf9@spud>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20240911-unsuited-pranker-60a7d0b6caf9@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/9/2024 02:16, Conor Dooley wrote:
> On Wed, Sep 11, 2024 at 04:40:51PM +0800, Nick Chan wrote:
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
> Same on this one, can you add these in alphanumerical order, even if the
> existing 3 devices are not in it? You could take the opportunity to
> reshuffle icestorm and firestorm while you're at it.
(Same goes for the watchdog, pinctrl and cluster-cpufreq bindings)
I am not actually sure what is the right thing to do here. It seems that
these bindings are
originally sorted using SoC types (desktop or mobile) and generations.
But then again I have
looked at some other in-tree bindings from asahi, and it seems to be a
mix of alphabetical
and logical sorting in the way mentioned above.

Maybe we can get some clarification from an Asahi Maintainer?

For the soc-level machine compatibles though, I believe that should be
retaining the logical
order instead of trying to use alphabetical order.

> 
> Cheers,
> Conor.
> 
>>        - arm,arm710t
>>        - arm,arm720t
>>        - arm,arm740t
>> -- 
>> 2.46.0
>>

Nick Chan

