Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE9C194A73
	for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 04:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749530726; cv=none; b=Ah1BRrWg+o13v+D/fL1fouo6AHFVHz7S3iMiSEgeGCPm5ZzAjV6Xq917iaMjdKgl3iT+bIN3RXrUkPERz5Av4xk5BRFTBKVRCfbsioiFXhpL9BI83/rCQpM6gmd7GUkayQNMiplT1H0I93Ua5F+6BxXYZjoXg5SiYRJIrjlo3gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749530726; c=relaxed/simple;
	bh=yltZ1Vl2x0dJiqzIghjPsKkjp790cirFxMQUzcnSh5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tSNsvoQfCayczDrYyGZlk9who7JlwBi6BNnpqUckbU+ZXey+33+6DBXXM2JK82+lHeB/AkvNijf98m1BJdRUOvcU97+Ga4SUXHWpa3ISnNzVgcMoha5MxbZWap2Lzz5Ycd0KgFBap8PVTQbKUbKxegWCy3eY2ZdfwfVhFCsa/ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJnriRMP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJnriRMP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22c33677183so40646555ad.2
        for <asahi@lists.linux.dev>; Mon, 09 Jun 2025 21:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749530724; x=1750135524; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/Et+5TuD3+3/eVjp6CpBE4hmFK8ASCNFdhg+aniT+Y=;
        b=fJnriRMPkmEdD/BaurfSq1xDhVy/0TeOFhqf/nxJ9/DAWn8J1AcLZp3PRzQcLJ0wK9
         ljkQzTU2oiLGevy7JfXLpA0qZzaoGZVs84BS901Nm4OwoKB4qE9OOu6JeKKdtAYXLZ5S
         ezQY6TtOAENOigQCZ1UKQ6b3aicgCBE+nnmhkX4TzM+hHE9O8FOu4r0bQlXZc30IxNeg
         5q0RhHGHP8cmCKpZt+E32ml3wVKmOPhCTgtwnTbIEyU9V9z/3EPPkv8wszWr8Tn39R6S
         U98Zt95fu1MH5PNTfRJ7UiHeowdHanrmYv8+hkE+sUe5IL0INa8xUR/+kQUjW+yDFHwF
         KZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749530724; x=1750135524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r/Et+5TuD3+3/eVjp6CpBE4hmFK8ASCNFdhg+aniT+Y=;
        b=uaK5AimdVJjXCUsE9t28WnqirjO8k1Twm7+Jwjparqq4H+pSaCDCSydsnmq2xk54vM
         DkjTtRsqLhbShO90F2mcTlz2TlqBoek36pfaFq49LOvkLwssOJyMAzUDPFcx7bed96dI
         Pf7n8ujFz5dCCcCNbE0vP47zalVSIXrRO7IPQgn70e/6Zls9Bmvy+vp77RkkGjVCAq2K
         BLMFKee4I7jjAahGsF3G46lPDbXtny0lSVR18zMR94sa9IXAAB84Ypkz2DikDc7165S/
         TOqB37FJczJgbGCXUk3JTne7DvRCrBCvYxOi52lQWV2+lZHWxomd1l3Kc2kwDgAV9LdA
         lksQ==
X-Forwarded-Encrypted: i=1; AJvYcCVySbDtgG5UKwtPWOCl39HvqQN0s9SK4OEuQicagLZF1MCHm7wL0HGmHJamU6UoAHAS1fX9NA==@lists.linux.dev
X-Gm-Message-State: AOJu0YykM3NHwyvbjDWP2bhlrlJ1EPHQgAdYHBOQcbftWIRBwt2yNpNB
	t4QuMXUxBEdbBNOm7k0imFoxE+5gDkshImmgzIV9ZjpXCzAhJRIliUzN
X-Gm-Gg: ASbGncveDdNWZdWzrpZHC+AA9nXfI41RWh1wNk/wGYRAP47UlJY+0YPRLq14PcozPD6
	i8vwgwz8IuBUYRdSsCOVJG5gTgPup4x6gY/m0WuWTUgTkIYHO0AVNRTeYLyxXzoPyRhwhVEDTPe
	WMGwnikeyRLVjUHEKP5As3jUTPtjRPCWFWaJU6O9vgNutUxQj04bI7GZTrZFr4NR8PZyBLt0UCR
	K+uEngU7Nv/44w/eAXgmT8PPm9dXjzUYxikM1V/FcuRqjxaaREoczIo8XdnPY9QYKuDZxpIHP1M
	RkSSznh3BK1Xy1xuxs9D9rovmHCwui8e3LIbYgjs2cdU+c3GDJrAyW1aKJnFwg6XdoKdGTExvKh
	IlcNicXKSrg==
X-Google-Smtp-Source: AGHT+IHeRu19sm8U6zfByMrOVx2wCrnbnafwzEKk+Sxwil3JgYJqscTx70zWuYMZYSWgk7wrVdu93w==
X-Received: by 2002:a17:903:22d0:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-23601d247demr212907365ad.21.1749530723858;
        Mon, 09 Jun 2025 21:45:23 -0700 (PDT)
Received: from [192.168.0.119] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034109c4sm62853365ad.210.2025.06.09.21.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 21:45:23 -0700 (PDT)
Message-ID: <81f03b76-abd5-4803-b8cd-679013aed359@gmail.com>
Date: Tue, 10 Jun 2025 12:45:19 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] I2C dt nodes and bindings for Apple A7-A11 SoCs
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-i2c@vger.kernel.org, asahi@lists.linux.dev,
 Sven Peter <sven@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
 Andi Shyti <andi.shyti@kernel.org>, Janne Grunau <j@jannau.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20250609-i2c-no-t2-v1-0-789c4693106f@gmail.com>
 <174950228622.2915605.1412644681389156564.robh@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <174950228622.2915605.1412644681389156564.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Rob Herring (Arm) 於 2025/6/10 凌晨4:53 寫道:
> On Mon, 09 Jun 2025 22:56:17 +0800, Nick Chan wrote:
>> Hi,
>>
>> This series adds the device tree nodes and bindings for I2C on Apple A7-A11
>> SoCs, since the existing driver appears to be compatible. The drivers for the
>> attached Dialog DA2xxx PMIC will be in a future patch series.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>> Nick Chan (8):
>>       arm64: dts: apple: s5l8960x: Add I2C nodes
>>       arm64: dts: apple: t7000: Add I2C nodes
>>       arm64: dts: apple: t7001: Add I2C nodes
>>       arm64: dts: apple: s800-0-3: Add I2C nodes
>>       arm64: dts: apple: s8001: Add I2C nodes
>>       arm64: dts: apple: t8010: Add I2C nodes
>>       arm64: dts: apple: t8011: Add I2C nodes
>>       arm64: dts: apple: t8015: Add I2C nodes
>>
>>  arch/arm64/boot/dts/apple/s5l8960x.dtsi | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/s800-0-3.dtsi | 57 +++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/s8001.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t7000.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t7001.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t8010.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t8011.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t8015.dtsi    | 76 +++++++++++++++++++++++++++++++++
>>  8 files changed, 589 insertions(+)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250527-i2c-no-t2-2f3589996d14
>>
>> Best regards,
>> --
>> Nick Chan <towinchenmi@gmail.com>
>>
>>
>>
>
> My bot found new DTB warnings on the .dts files added or changed in this
> series.

forgot to include patch with the actual bindings v2 should fix the issue

[...]

>
Nick Chan
