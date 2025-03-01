Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4671E4AB
	for <asahi@lists.linux.dev>; Sat,  1 Mar 2025 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740832338; cv=none; b=btzYVQaD22b2xKkaVTIekdWDjhoQdJDPs6Pp7Y7w60C5o2tAMeW8sFgGmm6dCO7ibkda0bfj4TNeFeePf6QdXNE4SPGavzChAzV+pjdM0o3vCd5II3Yv2XKifPA+9HJ1Jm1xz5Ud3Gy9Hhw4z6q8w//UPOk6eI/wnAu31OsFmsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740832338; c=relaxed/simple;
	bh=ra8gIKFKFiVeUd/HquZVV+FuM2qhRTGX+65IuN5qPDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jp9CcG9ewnRRUGbyWevpLNwU82fUrgaldGjA7LccDbi/IePqLM+ATTCxqG2bBKEhmExNb7DQfrAPn7/R+TKRMaqAn1zcNjq236IVEUFI8ZHoNE4fDUvmzzw6edarzbG2xc5XfJkx9BjqwV3NoEX/MefVqZwmehtIabhnumKS1aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbNFjbKA; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbNFjbKA"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2fe96dd93b4so5952429a91.0
        for <asahi@lists.linux.dev>; Sat, 01 Mar 2025 04:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740832335; x=1741437135; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ra8gIKFKFiVeUd/HquZVV+FuM2qhRTGX+65IuN5qPDE=;
        b=WbNFjbKAUff7qqEd75GOD6COfr1GBnzOq+R9na7+oDPX5zS3KYEAq8+110FwCZKmr6
         g6Vt6Q8EPtGuIidGQmPeF1eDu6jfcEh1euWQj2aLd8yM4y8xgop4t83mAz7RRpnoLC7E
         9KV90rC2/OjAK5g0RX7BTBo2OHPrPqfqkbJoEUwXxYGn7+wjWyljPeDzE4Cx8F+1IXRv
         yqRtQRrC0cemUoOPaak+vbLqgM+f55DwhR+WRXZqZ3kj0fD6AJRKAGXTAJ+SKgxNm0mO
         z1cK/243OBfn2QkG26demxz94/7kW3qzKg8O6dZEpZwJhcQi3qCT5Jk3MyE2jUlviPgk
         lqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740832335; x=1741437135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ra8gIKFKFiVeUd/HquZVV+FuM2qhRTGX+65IuN5qPDE=;
        b=e4USWVER89JytH2O3psx89VKxVhZqk6qg8lhxIZtPSWJ6O3MpIes4RqQayhk/RQ7Wn
         bXdwLlVjKkIpaaHL0dz6UdCIP2QAg5VP3iCyztzOFQ+oECPJczCUYs4892i8Ghx3/drc
         MW2ueoA0j+ODL8E1AvEqzbh6pX/bMFHPIkdn4rT3lpgm2nW7FLUYFs60KcPuuLo/iJi0
         UdPrygIa44Qf6qrh0izojqOtRGJsGH45Aqalb1osd8/lclMuCC9hB6aDcurl6K4E6/JW
         0rMGTsWaKPOyKUSrmbEJgnr3wdMXXsgGPVjvU/a+J4Jmv7zCCkqKPyFJuQkCFUb7g3Oz
         Z4YA==
X-Gm-Message-State: AOJu0YwXc2cklTwlo0eePgbIF0nwL9dn6B2Qb17uqUi1XghKi2egoMu8
	ZhweVroDRJIJdGNmeHcMQEEGsFjep8SESBUSef2g5B/6uIxLUf20
X-Gm-Gg: ASbGncsy3gXRs0aCtLaamVGO4cbjb2WzMxKlTYzPWK7Rbtmb+K9fOKinDRlrQWNew5j
	LTu0ma9dljR9Z3DSx6x7APnONmFKFHcasO2dOCvCI9BI0ZK9SQ0ZoeDfm09FKWvOUrMp9e+TcTl
	kcO1uZFcNE9SwGwqdG+2jz63gqIVIr/S01Y7S+GgA6K7B1Umgh+314KfUkyavWDg6/BPuYX1qL3
	nGn1ySJXi5YAJhF70LhWKaw7crr+iObwh7vvELtqLB4NSpCzxv4iO1dLNqFQ4YJXQGVaKiPZT7N
	DXNfqJMQTrENFA+sI/XqVnosXLQwTaQIf08/pQziB0Nc/j8Ql1NyjZeJdimKe4Vmx7fe
X-Google-Smtp-Source: AGHT+IF1mhUuctMChazLjJnYgbLD4i8xF/OkaFyb4KVb61pxcTtGOZi+8D/BZaLS5+Cyjw+B2Dpcww==
X-Received: by 2002:a17:90b:1e51:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-2feba92bfc9mr11663696a91.14.1740832334925;
        Sat, 01 Mar 2025 04:32:14 -0800 (PST)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825a99a7sm8346849a91.6.2025.03.01.04.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Mar 2025 04:32:14 -0800 (PST)
Message-ID: <83130117-509a-45ff-bf96-26beb77246e1@gmail.com>
Date: Sat, 1 Mar 2025 20:32:10 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] arm64: dts: apple: Add CPU cache information for
 Apple A7-A11, T2 SoCs
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
 <4670e5f8-2a92-46bd-8faa-dd3774517f3e@app.fastmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <4670e5f8-2a92-46bd-8faa-dd3774517f3e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sven Peter 於 2025/3/1 夜晚7:11 寫道:
> Hi,
>
> On Thu, Feb 20, 2025, at 13:21, Nick Chan wrote:
>> Add CPU cache information for Apple A7-A11, T2 SoCs. On Apple
>> A10 (T8010), A10X (T8011), T2 (T8012), only the caches in one of the
>> CPU clusters can be used due to the "Apple Fusion Architecture"
>> big.LITTLE switcher. The values for the P-cluster is used in this
>> case.
> So this means that the cache information will be "wrong" when the CPU
> is in the lower power states and only correct for the higher ones?
> I'm not familiar with how these values are used; are you and do you
> know if this will have any weird or unexpected effects?
> Would it be better to use the cache size for the lower rather than
> the higher states or does this not matter much?
The information in the device tree is only used for reporting cache sizes in /sys/devices/system/cpu.
It represents the physical cache size which may not be the same as the architecturally visible cache
size. Cache operations in the kernel consult ccsidr_el1 and csselr_el1, so it should be fine.
>
>
>
> Best,
>
>
> Sven
Nick Chan

