Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D8A12F375
	for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250483; cv=none; b=dEegBgeLUG2YsEXcWWy41az4/Mml2QE839w26fxjEONCQHTFkT10comyZk7eTUyuSjPbnEdKH4AnmKibjh/QsslSkClf7lC5LY69e8UL8Xk8Ziu/IyZDoL0KlDQzOzjV/1kp9l/xiMHExhqxFDzDOlF2PlvACGXB1vpFu9uKjfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250483; c=relaxed/simple;
	bh=MRUmy9fH9REIARa8LTrlm+xyN1Wirz7vvVg+vUDfNhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Q+aNWuDkG1klmMrZodvohaEksk6soW80RoMrZyy8wj5MP/p/MpldgyvDqUhjjjGdi9fGz+wcmQKhRFJIt27QyvwI5GINee2CRgmjTzQBUcPDa56R303GGQrXnCtiskP3yWp788p0H+wrKpo29ukclmD34xeLM8BQRErG/q76zRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q1LbOYeS; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q1LbOYeS"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2db85775c43so1746790a91.0
        for <asahi@lists.linux.dev>; Fri, 13 Sep 2024 11:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726250481; x=1726855281; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2dckvaybq7fry1kkYplM9IN78HtEe+9o+W93LYPvx3M=;
        b=Q1LbOYeSrQsIouq8XyaOWJvD2kpjB+nO5ADP7btyKrM5WPf/q56Ov1cOgRwd6ZytQS
         RFJTZvLHjN16LjT+nb8EIC1fjlLecEbudyoXSiOQd7aE709zn+E9CtjHPUn3qxiY8FyY
         rGYNuHtzMXSMiJEt/CRmGqoPaELeljzZN+1j0zbMiObdPNeJRkqc7yeVmpmestOlTD44
         5sf2Fen2dZMXSCNs8Icx0FpUdBTiBf5/f5Wdt7WhvxyToCCo4ihrFmsER7sMv0/PilPx
         3LQNvd+iOsSDvI7WKDkVVZIWBpyUnk5cyVANOQDbCb/jJMsB/+VrJKEIndXxpZmN2B7u
         HTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726250481; x=1726855281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dckvaybq7fry1kkYplM9IN78HtEe+9o+W93LYPvx3M=;
        b=jhjdon1wL3KsMnrNlMoxcBhGziZVW0h0Xx4ab9aQ2jBS7aVsA2l3sioQBuhFuRIoq0
         wym1yn+MCQ+FNGYYYwmQPaLLtOjqHlgrLCnRDQcMPf5FysYT8r8fFSE9rCJPdZULZxy6
         ZyuD/NJrqXmjgyrRpZbm5SGCUj0Uz4T+n/Oj2k4OEDLf9RQ0+N72WvXROYFVOBpjlyf5
         Ntm/4LpAYlzEtE/eAuCRDOtJ5gJdknAYo+28io+pvPw0tMCXZf0354kiy6yPn7qEW/ax
         yWlibeCdihrvpKe52wfmqOzsU65EewQJ2G7rcILW8nOOFB0tJQoi17VA9O+w8pZ67vPD
         KOcw==
X-Forwarded-Encrypted: i=1; AJvYcCVv5eDIjDNRA02ppu3OP2ggNJlOMwWnGqHWTtWSGk6RTD2H9c68iTzf+vrqkF7J5eaKOr+BhA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9xlGTwQDXd/r1aCedw5CouQGj95mdIF3M6GFr9tK1elYgI3qb
	ini/SZKdSMl5cJl3KEiJPrFl0sJi901C+hhMnCK7LHbPHZ3lb9oO
X-Google-Smtp-Source: AGHT+IEAjLTAGf0Obih6pBdKsCv3yrOccpjThO9JsZS4IT2ANER59+R1FDo2DpiyuRHU5bBfmkSAOg==
X-Received: by 2002:a17:90b:694:b0:2d8:7445:7ab2 with SMTP id 98e67ed59e1d1-2db9fcd533fmr9947002a91.20.1726250477556;
        Fri, 13 Sep 2024 11:01:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9c9175asm2107663a91.15.2024.09.13.11.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Sep 2024 11:01:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1081ea3e-73e7-4e98-9a2e-127238a9ed42@roeck-us.net>
Date: Fri, 13 Sep 2024 11:01:14 -0700
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: apple: Increase reset delay to 150ms
To: Nick Chan <towinchenmi@gmail.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240913174540.45551-1-towinchenmi@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240913174540.45551-1-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/13/24 10:45, Nick Chan wrote:
> The Apple A8X SoC seems to be slowest at resetting, taking up to around
> 125ms to reset. Wait 150ms to be safe here.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/apple_wdt.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index d4f739932f0b..353ecf0b04dc 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -127,11 +127,11 @@ static int apple_wdt_restart(struct watchdog_device *wdd, unsigned long mode,
>   	/*
>   	 * Flush writes and then wait for the SoC to reset. Even though the
>   	 * reset is queued almost immediately experiments have shown that it
> -	 * can take up to ~20-25ms until the SoC is actually reset. Just wait
> -	 * 50ms here to be safe.
> +	 * can take up to ~120-125ms until the SoC is actually reset. Just
> +	 * wait 150ms here to be safe.
>   	 */
>   	(void)readl_relaxed(wdt->regs + APPLE_WDT_WD1_CUR_TIME);
> -	mdelay(50);
> +	mdelay(150);
>   
>   	return 0;
>   }
> 
> base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6

