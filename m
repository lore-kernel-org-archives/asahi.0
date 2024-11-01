Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED05E19F131
	for <asahi@lists.linux.dev>; Fri,  1 Nov 2024 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473774; cv=none; b=Y3jhKpjVxfWV3JSLTaZ5SENRkfGRK+hV/ivSTm++QTTt3XynXcVIDgWx02cz9AomNHzNdXSllt2zA3tJofMEYrnaHYZ9i9IP/Fh3++bhBsUuA5zzKInUeTpfHDfSKm2ukuWuJQhKMSniezo38JrzChfpOi+JOOMzdoQHrt8/t+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473774; c=relaxed/simple;
	bh=8O6+8zSdIrOsYZwhpn/UdsD7JMLogYbKMaHww4edegI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwQGARShHqWVXpDUVHGbmXIsdtquMBKiniUKSabFBHr+YqN2/Yc5Mm33etiMJ1nSgChn9tQ96svzcZm7CDC8cRU4ACyarBVFriwM008q7Dao4NOdy8ufeN7USZR8bsgRcrKA25XPaVvwwVieDsebhFRbmdbIs9tVAuMXAd/628w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgrIj4JV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgrIj4JV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71e5130832aso1662644b3a.0
        for <asahi@lists.linux.dev>; Fri, 01 Nov 2024 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730473772; x=1731078572; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjnycSKe7PLm9xEIfiXtceGbvBfhF7/8n6iYzZypH+Y=;
        b=AgrIj4JVz8NJe/aUBMhf3kKoAsmWsV8R9Y6zypzdP5MLcvkncKm7wpq1+P/zHboEsD
         LvEcFu+dPd0Pf9UDp/uaoys6QUQGoF0fLQ728cclQxcgbhTT+dX9sKc9GqniubBgoQaj
         IXPlSph4QMTMf0hNTUFvlBbJXC0gPsNz69kHt/vd7zSNu1HAI0GrCn2RPnidZqk27SlC
         UvpuEDF+kIs4+ZpRAZgy9wrjP0NUZjD5Jpd57qR3mzIFqOkuAlIkpobRzGs1OGDvSO+E
         Cnurtl7IMNA9Zs9xMFsmj1+AL0/OAeTGChU8fNdXlyr/R7/uQ+tvwoqIgBlVbN/j1H2t
         9ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730473772; x=1731078572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjnycSKe7PLm9xEIfiXtceGbvBfhF7/8n6iYzZypH+Y=;
        b=Hvgfi1TNmjFNQQ78NkmwRn7omsgBXx0NsGj0VMU3pJcD+U1zon4JDYWFNIq43Zce0o
         h9mIXUC/hYixtKuyqfxeI9LKyYZ9W276YmrKJmbxD00FERSviwAihG7ytlS6H8vbC/FB
         TBTkcfeEEaRd8+ttlR9H/8uguuq81WhpjwYrZmCpwH1WfsJxxZsKk2TANzpFu+bn0rsz
         cIrKy3jAdgKxhMja404jA4T1Mf+0cx5hjvVNxC8MYmpq0fHPWu8coCvhsTmBuZi9Umoi
         CNvlNOo1VcNgPBwiZL/VlR/CKKlZd7aMOQEOniVeedkVHqOI1Btv/LnPUAPXGDQ2U3sm
         Xtyw==
X-Forwarded-Encrypted: i=1; AJvYcCVpnf4pEEyigJj26IPrIVGJnaG9Jgb/wsBJZfsD3hs4hJ/nP8JFWq8HZFLl9WB+txtZ95F7FA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyjTBoKv+IslsPY+Aki/rOufRtPbWP8bca4tBSkURWwzxkAuswt
	NO7wv5N+0x9v0+toNoot9BdVe58X6NhrZutn1MyJAvvEYCe0Wkb8
X-Google-Smtp-Source: AGHT+IGj1ICWG+enL/mz+nRHk/RtiB2DmVTTu6rkphqnle4KBHonuvB3QqFfG5gzDuZ4/b49o0GKyg==
X-Received: by 2002:a05:6a00:3c91:b0:720:75c2:7a92 with SMTP id d2e1a72fcca58-720c98d32b7mr5329009b3a.15.1730473772025;
        Fri, 01 Nov 2024 08:09:32 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c38c7sm2745972b3a.125.2024.11.01.08.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 08:09:31 -0700 (PDT)
Message-ID: <b0e81bfe-f7d3-475c-95af-7824d60deed9@gmail.com>
Date: Fri, 1 Nov 2024 23:09:27 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH asahi-soc/dt 04/10] arm64: dts: apple: t7000: Add PMGR
 node
To: Rob Herring <robh@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241029010526.42052-1-towinchenmi@gmail.com>
 <20241029010526.42052-5-towinchenmi@gmail.com>
 <CAL_JsqLv2DJOsL=3bxf229ZdArL1TqArw+9cLtmjYMkm5yfZ7Q@mail.gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <CAL_JsqLv2DJOsL=3bxf229ZdArL1TqArw+9cLtmjYMkm5yfZ7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/11/2024 21:04, Rob Herring wrote:
> On Mon, Oct 28, 2024 at 8:06 PM Nick Chan <towinchenmi@gmail.com> wrote:
>>
>> This adds the PMGR node and all known power state subnodes. Since there
>> are a large number of them, let's put them in a separate file to include.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>>  arch/arm64/boot/dts/apple/t7000-handheld.dtsi |   4 +
>>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
>>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>>  arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
>>  arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
>>  7 files changed, 672 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/apple/t7000-6.dtsi b/arch/arm64/boot/dts/apple/t7000-6.dtsi
>> index f60ea4a4a387..77d74d6af1c4 100644
>> --- a/arch/arm64/boot/dts/apple/t7000-6.dtsi
>> +++ b/arch/arm64/boot/dts/apple/t7000-6.dtsi
>> @@ -48,3 +48,7 @@ switch-mute {
>>                 };
>>         };
>>  };
>> +
>> +&framebuffer0 {
>> +       power-domains = <&ps_disp0 &ps_mipi_dsi>;
>> +};
>> diff --git a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
>> index 8984c9ec6cc8..566346be5b53 100644
>> --- a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
>> +++ b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
>> @@ -10,6 +10,10 @@
>>   */
>>
>>  / {
>> +       aliases {
>> +               framebuffer0 = &framebuffer0;
> 
> Looks like an unrelated change. Also, not a standard alias name. So please drop.
Alright, (for other SoCs as well) the next version will not have any
"framebuffer0"
aliases additions.

> 
> Rob

Nick Chan
