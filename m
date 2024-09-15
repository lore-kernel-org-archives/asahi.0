Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEB38BF0
	for <asahi@lists.linux.dev>; Sun, 15 Sep 2024 02:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726366898; cv=none; b=GOS4sBXj8w/NaWUSA0BIbSqs4w3Oj7XE3GFCne2sWC0RJzl/jQT/bJevQGGu2dEnzYiM2gMDArJDq7wINZm3Fc4Y9S6SmKZG6UVaQv7eT7u6vS2N6QO3AKtOR5VVzzgYeZcs+rYx9GT9awbyOdNx3ZKpyATBGrKtBdCGQXZKymM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726366898; c=relaxed/simple;
	bh=/TFCcMuH3eFlHq9L3PNd9dVZtxS+2tNTLiYU/MynuPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EfJKSWQFd68jefvKPpMV+OCrzcR/D34BCuX1N6QYMoEpPHn6b8NT+eOTDXeE8kxqD5XHnfr+lw5g451xwOTTSO3Xw6CYBuYgp8uxxFSQrp19VAyjk81vDk3gKPBtN71NNE935PFaL1oncIJ9CaACGwVr+cNvRF2+EjNuEWks3RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpSfO0WU; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpSfO0WU"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2db928dbd53so2834487a91.2
        for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 19:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726366896; x=1726971696; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wlgq2n3Pu88VWjuj9DZNU9s2yQJKQNU/Scco8Aq+2xU=;
        b=cpSfO0WUTJNRoDXiS8x167aQ6+qeCrkgOtW1B5vUpwUl8sqPMkR7MDA7FMRWcoLshI
         v+wZB6COKnEFSKQToGJPN5OlPiBePxcTZ9AF4Aj7jfcTYttL+qg0njEFXMZU/MDOhx4C
         AyQamnilH8JdSGMjok9eIu1KRH9W0Uq/RKvYiy/lkrE6dP1voDCiqzjO6Ob+Rx2Y4J1m
         DhzShkeXj1kEKAMmhfZB4cVJGFlTuBAl5TO8b3eJOiRBUB1b7yoh+w2RSz4xIp0QsnZ9
         7WU0wdD2tbD+fFN+O5ya9qjg2PVAEuTPr6KARoA8MsP8zlSjOVqHLBckTi1PfzzOYi6V
         uZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726366896; x=1726971696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wlgq2n3Pu88VWjuj9DZNU9s2yQJKQNU/Scco8Aq+2xU=;
        b=UrwmAqbtjCMZ7/8yttGux5Osx+Wscop6pkV4D8e30y14bTV8PsKcvL8A/jhFX2FIMA
         ezC9fXrlN+EbrFI6m+nGI7H8A8Wu2oD0bbhDBrOqiBjLbSg8Cyi9KPdSkjVtZmF5oxGu
         yTWQz0kXiWDRag5wegAHzQ++QBoBnNG0Zjk7MQ0xDFDlDWkKNo7+t192K1laoiADSmFM
         hMYFCemSflHnVThmBuxSjGXxM7j/tcTuMqJJhNap64wxhNe26LxSU4N1TIjUyqf5UpQb
         BRfmHlJZnXUAhe5E1rlQ2LCbNlwq5d1iswB3CRoO+zVc3mCI0P8Lpv1YHDYNbfZcct7o
         NZow==
X-Forwarded-Encrypted: i=1; AJvYcCUehbqkQrd15qhZYwg6O1AttD3aVIIRRZ3l5i9LngMrE5qtp7cU+HzMZiBw3g9p7ex3nkIrjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSOXnh7TBO/gx13pqVwcg1ouKSrerDWSeM+08abYCtUb4WThqI
	XapYXbqFpGJMcu7t5YMcF5p5UBhyytd8WlSiqU5xKE3FbWB4ygrl
X-Google-Smtp-Source: AGHT+IGaD7u+NPj+qsxGjhpuYjsmHLBN+A4TI1iEQ+R9rpf75fx7e5oYIgQONG2M0UTX610QvqKYAA==
X-Received: by 2002:a17:90b:4b8b:b0:2c2:df58:bb8c with SMTP id 98e67ed59e1d1-2db9ffef53bmr14156849a91.18.1726366895835;
        Sat, 14 Sep 2024 19:21:35 -0700 (PDT)
Received: from [172.20.10.2] ([182.153.180.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9d5c9c6sm4419363a91.46.2024.09.14.19.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2024 19:21:35 -0700 (PDT)
Message-ID: <8a813234-71d3-49e7-9a2e-c950fe35be20@gmail.com>
Date: Sun, 15 Sep 2024 10:21:28 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/22] arm64: dts: apple: Add A8X devices
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
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
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>
References: <20240914052413.68177-1-towinchenmi@gmail.com>
 <20240914052413.68177-19-towinchenmi@gmail.com>
 <34c748fe-89d2-d3a5-599d-52972c10f688@gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <34c748fe-89d2-d3a5-599d-52972c10f688@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 15/9/2024 05:02, Ivaylo Ivanov wrote:
> 
> On 9/14/24 08:17, Nick Chan wrote:
>> From: Konrad Dybcio <konradybcio@kernel.org>
>>
>> Add DTS files for the A8X SoC and the only device based on it, the iPad
>> Air 2.
>>
>> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
>> [Ivalyo: system memory bits]
> s/Ivalyo/Ivaylo/g
oh...

>> Co-developed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
For A7-A8X, the tags are from Konrad's linux fork from two years ago,
though your tags in particular may no longer apply since as you can
see, all memory related things are now /* To be filled by loader */.

> 
> You've confused me with Markuss Broks <markuss.broks@gmail.com>.
> 
> He was the one who brought up A8X. I brought up A8 (in particular
> 
> iPhone 6).
> 
> 
> Regards, Ivo.
> 
>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>> [Nick: SMP, m1n1 and gpio-keys support, pinctrl fixes]
>> Co-developed-by: Nick Chan <towinchenmi@gmail.com>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  arch/arm64/boot/dts/apple/Makefile        |   2 +
>>  arch/arm64/boot/dts/apple/t7001-air2.dtsi |  46 +++++++
>>  arch/arm64/boot/dts/apple/t7001-j81.dts   |  14 ++
>>  arch/arm64/boot/dts/apple/t7001-j82.dts   |  14 ++
>>  arch/arm64/boot/dts/apple/t7001.dtsi      | 154 ++++++++++++++++++++++
>>  5 files changed, 230 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/apple/t7001-air2.dtsi
> [snip]
>> +			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +};

Nick Chan

