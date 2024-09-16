Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB4D146588
	for <asahi@lists.linux.dev>; Mon, 16 Sep 2024 14:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726498345; cv=none; b=SHPtQYdA0B3DWVeEBRV7m3rggHZJwKgHocPf3rG7u6ybclNAHlCyVfI2L5HJE9O6KuhZauNXpqDa+fpurWhVIfD1VqbuQDg+m4Tm1TYijbRqa4F63hCg879Zh+plniF6WM8Rg5lc8TAeQJvjT6iSC34CHXUxWrKF1bjxROQYEqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726498345; c=relaxed/simple;
	bh=RhkHx3KEvVHKaUXYhsthTx+OT78125g8JMWGtokDp6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yl1vNUcsQ0wVz5UQVNbs5cCdQfWgfSQSXij7BtXc53AU+zoScwZOZJall90/sMYjXW3XLqMbamnSdu+VjD8aYxlW97TDZX46SBCGRil2TJuXP/YnyTZiYKC3Nd3rbLWgBwX5N3skIHYty82tFX5PyYzXv1OVED11sOkglJ23ODg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xt0dbaF0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xt0dbaF0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2057835395aso52659345ad.3
        for <asahi@lists.linux.dev>; Mon, 16 Sep 2024 07:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726498343; x=1727103143; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7O8aY6B3ufOpgcpOy0X8Q8VSRJdIp5sZRAiS7dUBXy4=;
        b=Xt0dbaF0Vyh7Ql8MWxkS5sdvrTxIJXlbFn4spHyL+wS9vgwtc1zi3B9BEXENRhRZon
         j07jMpyx2Oe0/DaVWxTnI1nwGQCT7W8bJ/eCj0qz5jYJgLkdYKYjeIh+VNDE7Mhn6Tj+
         8tXdY9YF9dOlNZpjzh8oJUplKl4XFs2eL7pcE+jjOmqJbvJFMaZNDdtMSpx3OuONb4HQ
         DxBsFCltxL4YM/9z2i2cCiuo1WtLD1RgqpB2yo89ypgGYSPmEUsOflsxQicwBdnqde6b
         mwAjgdQpBGDP450B0t3pKz4DhmheAMEolwh/o3RmZPH10Tmhz0a6wllp6Er+AKMjuoqE
         tsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726498343; x=1727103143;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7O8aY6B3ufOpgcpOy0X8Q8VSRJdIp5sZRAiS7dUBXy4=;
        b=srCEnwpoBoObvfA52Z11hbDkurA2AJfpjNum9Vb6eHmc0gmHDpJT7K5upFzhVj+6rH
         xzC+96U+b1gEtpHkSTzkBHveN2z7DsPYm44ZaoZ4+1CY9oURqQy8bX/YhD9uoTtJ/LxQ
         RVG5O92g0qjftyJ8U/xrrrhLtyIdvlqrIu6QML7Zc2RnqIs7vNT7xi3oYmJF9SEh1yG3
         p1QKpN7RU1KYwJyYv3dSRZ/xSCWRPZ/SsF7HTBDRIjeZ+SyXvywQ7zHg1FiFCLLzD1QY
         OneGKFfS3eTY7R5tbgSX1OHYpvuxi6kNw6GbQcmn9l9uTjHUy6nmb619KJBUfTgxbUlG
         7oOg==
X-Forwarded-Encrypted: i=1; AJvYcCVRWIdMSzc7zWxWD1xHdTzmMDkd9oaMug0s8lzRr+3ntTlMBmHzaB7MAJpHJp+/M/O4H1JL3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzUtPPEPsc+Vz+k9UgWQ5G3g3tMtVi6yBB7n3S+G5UqwPTa4Bx
	b2bw9o5XChedGnr4eR2tsXVAFosA7miuVpeEhokfILFyMXprbg5M
X-Google-Smtp-Source: AGHT+IHtQAbZITE1JFKfdxFWo2AvjAaAUQc9iG32G/Pn0bWjgrwustAbaqgNo9r+B5kDEpyamDKB/g==
X-Received: by 2002:a17:903:32c7:b0:207:2697:da17 with SMTP id d9443c01a7336-2076e355eb2mr225599265ad.23.1726498342899;
        Mon, 16 Sep 2024 07:52:22 -0700 (PDT)
Received: from [172.20.10.2] ([182.153.8.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794601022sm37092445ad.74.2024.09.16.07.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 07:52:22 -0700 (PDT)
Message-ID: <a7f2c1fd-bd50-4d04-a2da-67bda6f7d55c@gmail.com>
Date: Mon, 16 Sep 2024 22:52:15 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/20] arm64: dts: apple: Add A10X devices
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
 <20240915080733.3565-19-towinchenmi@gmail.com>
 <ntl53bla2qwueycbffta5ytmmm7hxrthbfz2677mltldgu6roi@3f3pz6644vb5>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <ntl53bla2qwueycbffta5ytmmm7hxrthbfz2677mltldgu6roi@3f3pz6644vb5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/9/2024 22:39, Krzysztof Kozlowski wrote:
> On Sun, Sep 15, 2024 at 03:59:03PM +0800, Nick Chan wrote:
>> From: Konrad Dybcio <konradybcio@kernel.org>
>>
>> Add DTS files for the A10X SoC and the following devices based on it:
>>
>> - Apple TV 4K
>> - iPad Pro (2nd Generation) (10.5 Inch)
>> - iPad Pro (2nd Generation) (12.9 Inch)
>>
>> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
>> [Nick: SMP, m1n1 and Apple TV 4K support, uart interrupt and pinctrl fixes]
>> Co-developed-by: Nick Chan <towinchenmi@gmail.com>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  .../devicetree/bindings/arm/apple.yaml        |   8 +-
> 
> You need to split bindings.
Good catch. The bindings part needs to be squashed into the commit
adding the
bindings. This is a miscommited style fix up to not mention "Apple" when
we are
already in Apple ARM Machine bindings, unless it is part of the offical name
(like Apple TV).

> 
> Best regards,
> Krzysztof
> 

Nick Chan

