Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B267F2C18C
	for <asahi@lists.linux.dev>; Sat,  2 Nov 2024 02:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730515022; cv=none; b=ULRE2Y2iDftMb222LxlgyjbF5Dk4XscfFVRv7sXPiXKKMvxo/FQnBzMQNGynMVrBuFdKnzRNG/aV5zGVUAzucLopOjYIdMuYis1vd+eWFBq8++suuK93lEPTgO0ct6tUBEeIoJ4tm/SVy71U8BXbrxIt1RyHLViw5vpI77dsdEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730515022; c=relaxed/simple;
	bh=HAm2uFR/BmaPeA/QPdAV5p1sBdlEXjYIAwxP1zNZREE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpQCg85PtcOWGuF5HBB5qi4SEsUZjl/LLYY2A3C64CQN/nccVftzugW1lvHa/JSMkrdBMj4cgu4/mnKpgILke+wt4JTGpdOXHPBWMOrtEAQiwX/aY2agPP2dnj+MBNTMen7NECg4+lx5tqbvFzBruFW5E1x/R9Gsmz5UI1ixVjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CD427K1q; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CD427K1q"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-720d01caa66so1109863b3a.2
        for <asahi@lists.linux.dev>; Fri, 01 Nov 2024 19:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730515020; x=1731119820; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=52ooFznqeRMYHCyQ/j8hVCDyBghXj5ug7pBFSOFL7Wc=;
        b=CD427K1qoUzWGx1oGT0M7qK21h/2D8a5jwGjaU3flDuJglNkEDsdwEj2Wj505w11IP
         xAgvYeb0qNfrlcEFuXqs8JlYjPLKgNcEmonOdWxGTlNOdr/NNDdWkjMftZxGauZY+xfe
         wRJG8X4vG8Z+8QVfMY14qy5bLaJN5IAy9dOn+Y4cHgdHI8Rq4chAX45Ve0TR2013d8pm
         waB/1518BwIGypnjIBat6QWUzRxsVYRT49dRLhjvOCHT4nkQhn0lA/7iNHLTCQ0mxcli
         9mv+7+4aWKXXeGAtav/qlOwUIEfGR3LKq0AcTaif3UADeo1ygHilOOmQ8Z81iS7eHlx9
         J00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730515020; x=1731119820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52ooFznqeRMYHCyQ/j8hVCDyBghXj5ug7pBFSOFL7Wc=;
        b=l+Zc53BqBT76h61UlJFvBxI+dP1uKZAhXdo7SG4iFYilot4U3kTOfPTYl5Wvts+uFX
         oAE0vvmlN8wPN5SRija0QcXnsnN60xRFuz1p7Apn+w1JySWiAUfLIryphfJKUIRoMVLB
         uSHi7+fjV3KT89t533x8UuoiXuHvIHg5vW0voW0a1iwhimXGDTsjC4FmgUmIYbrc8N++
         1OT4Iy5HdQjc9xpbKVpvvr2DgqcQiqLvUVhAGwa/y6jUDQgF8g9gWqnTCgreJZqqmsY4
         lx5kwIaB0VvTOerUuf7fQFwv9hEThP+U3P7hkezXokCViWvIP63HwO3tB+Lp/EWbM77J
         rwqg==
X-Gm-Message-State: AOJu0YzA/3foJG2ol+kPIeYTGwkkwLSxnDqtEEbXWY049DkgO1XwlM+S
	yDyiq31rLM6jQjEdWm5aSgtq18qafcoAnc1v7+HcQ7lU9OfjyI2q
X-Google-Smtp-Source: AGHT+IGQ9zfRcHvemJpUmA2q1CaZU/zY095T+aeF4SHQo9LbXPUf1m6TDA8Q4+PugPH5HaynDPT5mA==
X-Received: by 2002:a05:6a21:710a:b0:1d9:a1c:7086 with SMTP id adf61e73a8af0-1db91ec3ed9mr13201042637.44.1730515019885;
        Fri, 01 Nov 2024 19:36:59 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ba19asm3338528b3a.21.2024.11.01.19.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 19:36:59 -0700 (PDT)
Message-ID: <46b31874-9fe2-4534-9777-816765a265b1@gmail.com>
Date: Sat, 2 Nov 2024 10:36:56 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: spi: apple,spi: Add binding for Apple
 SPI controllers
Content-Language: en-MW
To: j@jannau.net, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241101-asahi-spi-v3-0-3b411c5fb8e5@jannau.net>
 <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241101-asahi-spi-v3-1-3b411c5fb8e5@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/11/2024 03:26, Janne Grunau via B4 Relay wrote:

[...]
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-spi
> +          - apple,t8112-spi
> +          - apple,t6000-spi
> +      - const: apple,spi
Apple A7-A11 SoCs seems to use a Samsung SPI block, so apple,spi is too
generic. Fallback to something like apple,t8103-spi instead.

[...]

Nick Chan
