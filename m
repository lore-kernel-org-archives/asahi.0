Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A565FBBA
	for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 21:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726347780; cv=none; b=NRT/Xj1ukoZ49c9bAodWA+OVB8eMbCzH5TJIT8hMrloDE9dqafLW9D9J5kvynd5iAucZ6zaENr3heqzdgPDmCUlnRAljSl7Fdg7+94gu0dDxoG7PPla9MC5WA79WuYzJSZaHYYRY6ykEUui6m4FWfk+0hUZeEeAzC26/pWvtRzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726347780; c=relaxed/simple;
	bh=PKJfaPrc12Vv2JmLQQ4lqIi+mPQ9DeJWE/KuFMq55Nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXk32xo9m7TLRedR7X3xD9JfAu7Wv7217Mhv9a6+xfbtNDiW2SMlreJrQcoixqZuTHysbutt3b970QH/syF4wZE2ndJ44tqZJA6TJAICPr2n42Gd3LrMoGkKaruOWDUzBtcPaxbF3Xrs9kIyqvAoF2+1WFp0Q86Crh7FnSdbkVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSq0yXV6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSq0yXV6"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d64b27c45so318645966b.3
        for <asahi@lists.linux.dev>; Sat, 14 Sep 2024 14:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726347777; x=1726952577; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSzJyxcwmwp8kDJtBoNBEY6FGBO0XHBvilUnLNtTZQg=;
        b=XSq0yXV6ovf8bQctwV4Hi8ubjGlzlOltH0YLocTQi6wuVRsOxYk+8d0RpN5mMV9L8/
         tjYC+yor9kC7mvcC8OTEg7rUButcqtEcoQJYrplIXxc4/i2xW3KIcJaJ0JcaDDSqekCi
         BWOFhrvtPLd0Dmqtl3R6trzkcQSycoUiN0u+miX8Z00oGqQpgee0Iaaff1vdF/bF5eiG
         4qGdJgkDX3Ftv9RzYsHrkdkK6YH7FLNdquYk6YvMN4yDB0E/73meAyCypZzHNqGYES53
         oE27nBAcDexr6mKviRqYcdWshDm7SbZN0jg2mo3feQ3XnM2D3t+igDtUAmgsCsjghGVp
         jE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726347777; x=1726952577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LSzJyxcwmwp8kDJtBoNBEY6FGBO0XHBvilUnLNtTZQg=;
        b=vdKCKzKSq3jklq3jwPCr1ovIg8U/HhD6ciYnQ75ZGjKtb8uvYC33Js1LiXz8kJRvoz
         DpyIpI3+WZ+7+Dcy2wTYZyZBy+nlkINcSLy7CYIIg1a51k49Mh6B98ec9aQ2aCT2YERq
         fsBe0ti4arAKzx9EndjaBz8c9G9p2/4Ey8YSLLTq49zcCEiLMdW8d54eWxESXH34H1HR
         z9sgYZkffLnFNM5fjfoV1AjuM5Zq6l9PAEjY6Nos2xBGikOpb2K9XovlPKacjp4ajkyE
         SaKwNTOufr+PzQbUxwmLh17OOjFvcwK2trJKS3P84KvAHvKuDO0Xuhej0p7GkKNH5jZA
         TNig==
X-Forwarded-Encrypted: i=1; AJvYcCWwUEVd9xCllHGQDImrdmMN2juYp1E8stx4MqkoXG+plN2QH/Zu+xrMSN1M61Z3rpifMtUBew==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvkPEyrcVUnCHTpowFumEqW7DjFd0rNjnt2UzGAyiO93FNTmtb
	vmPFPgJIQGBiZSafNcx4LDWO2yCmWo6IGPe8rKWSQdDLdr9TT3Xy
X-Google-Smtp-Source: AGHT+IFyqjUnDNIwR3RJ+0vniYD91L8RSfXWK5QETpQHvM/YgLCbkWBuyyn1X2TT8x0asoAwDTnuWw==
X-Received: by 2002:a17:907:6d1e:b0:a8d:571a:e863 with SMTP id a640c23a62f3a-a9047ca46f2mr644871466b.25.1726347776948;
        Sat, 14 Sep 2024 14:02:56 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9060f39a8fsm121066666b.0.2024.09.14.14.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Sep 2024 14:02:56 -0700 (PDT)
Message-ID: <34c748fe-89d2-d3a5-599d-52972c10f688@gmail.com>
Date: Sun, 15 Sep 2024 00:02:53 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 15/22] arm64: dts: apple: Add A8X devices
Content-Language: en-US
To: Nick Chan <towinchenmi@gmail.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
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
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20240914052413.68177-19-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/14/24 08:17, Nick Chan wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
>
> Add DTS files for the A8X SoC and the only device based on it, the iPad
> Air 2.
>
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> [Ivalyo: system memory bits]
s/Ivalyo/Ivaylo/g
> Co-developed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

You've confused me with Markuss Broks <markuss.broks@gmail.com>.

He was the one who brought up A8X. I brought up A8 (in particular

iPhone 6).


Regards, Ivo.

> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> [Nick: SMP, m1n1 and gpio-keys support, pinctrl fixes]
> Co-developed-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/Makefile        |   2 +
>  arch/arm64/boot/dts/apple/t7001-air2.dtsi |  46 +++++++
>  arch/arm64/boot/dts/apple/t7001-j81.dts   |  14 ++
>  arch/arm64/boot/dts/apple/t7001-j82.dts   |  14 ++
>  arch/arm64/boot/dts/apple/t7001.dtsi      | 154 ++++++++++++++++++++++
>  5 files changed, 230 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-air2.dtsi
[snip]
> +			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +};
