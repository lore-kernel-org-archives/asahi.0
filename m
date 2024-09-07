Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F5B3C482
	for <asahi@lists.linux.dev>; Sat,  7 Sep 2024 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725716203; cv=none; b=u5ZwscuUyL4OZC2gkvMu16A3YpmR3QVNo/0Cj+09aSQXfCs/NLum3uqJxSv1qg92kh9vhfzT851lMWUP8hfHpMMS+cRGlWXNbXDQuRE0pDbY7v/49nqX4h31S9T4MazpxZQ9B9jVyBMZ5hO4FwETnMvHqEQzJUVTLz8NNrDLIpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725716203; c=relaxed/simple;
	bh=QDAeMKDXx+8hSe+M0x6iS7yh4oBXpRy19ch8PrVqUUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8yp9m1U76z+wIZ2VXu9dxPuEl/clE/4H1EubFC1udqBRbxL7nLrApAFBBGKu4t9VTOgW7WMGWyDxwHDaaoaulV+Pd7k3r7PIN+rciSkuYK2BImFjwuhF1rqaNa1BowHBE0xVAgeNv78UWFQfECtaVEgduMTuQXtzAJH0KtVHkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i7i7MoGy; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i7i7MoGy"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2d1daa2577bso2196973a91.2
        for <asahi@lists.linux.dev>; Sat, 07 Sep 2024 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725716202; x=1726321002; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YUTavBQ5qrHlQPm4dvfhw3yJpsNd8pyOFUFPgqrOJVE=;
        b=i7i7MoGyY2HoY5BwKoawjLSjMnqC1mh2rcowajbxQ/3vtf3HSh3esUmAWXwZ7DU14n
         BE8WCn6b8oucz65M7wAPUJOMbyWwQkL+N50k0FqGDz1xJGXlYGejB5+JbyMQiZvvXtMG
         XroQiSqeQT53mbgX0QczeU9mpL58NCLIMPijCP2TSCxo8DXFbnznyjUI1MuD++8+wxoA
         JT3FPf9x2Nm2vfzyLYaAYKtCL+8TvLNjPn2rqPaYyoEDqyQgt/KSn8Pj9ZPljDIpK99A
         bHMpuqrewgg3KlRjli54cXb+HFRQ8fS4QWIOyIVzQoGqde0ugU5fUQ7qSTRpxTPYz/zi
         9QlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725716202; x=1726321002;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUTavBQ5qrHlQPm4dvfhw3yJpsNd8pyOFUFPgqrOJVE=;
        b=thHdJPtrJvPT4UkKd3GfEktWti6uoGfR9DioddCXrxcbbO493kbvyI7R72xVqMhrOq
         9nf9lmX6Ru2FI+fuGgVwKKaz3Uge953ZI1oor86fI+arpyMIS8HtsA3K39SDdkqmM8Zf
         izyfEuFNk0psgBd4f97t5goDQ7bU06+kQPuN5Vyglad2W09bF88njMiKJJkB9377O4+1
         4NdLLgTBusau7/V6DvsxjlSI3TfQCgw1FDQ+gSAfPSsmu8cw+CQZdEgVmQj8ILzfozF4
         uNEuZxJ/tIAbC1TdMMfr+y/cWjw/Ja4As+Q3XO+ZWFtPXsE9H1KOh+HYMgkMsYKH0IbQ
         adCA==
X-Gm-Message-State: AOJu0YyLys39/X3BqpTi9myqPwz97MqLbU8l6Nruus4cI4uIFe2we4JX
	9PniWh21OskzCz64fRU5/NeMDl0e+eJ74p+DYYD8EYlxd2ZbWS9k
X-Google-Smtp-Source: AGHT+IHDd6iQwUYAcG/97d9xepIXpXTiP9NBsHNofcF74jxr+3FjbR3kilNRA1s6jBVgx9qHN1vkwg==
X-Received: by 2002:a17:90b:4b4a:b0:2d8:d098:4f31 with SMTP id 98e67ed59e1d1-2dafcf1c7f5mr2670367a91.17.1725716201718;
        Sat, 07 Sep 2024 06:36:41 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db04136b71sm1251865a91.12.2024.09.07.06.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2024 06:36:41 -0700 (PDT)
Message-ID: <d5d06aaa-ab93-47c3-b7c5-ad8dd3ca66f2@gmail.com>
Date: Sat, 7 Sep 2024 21:36:38 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tty: serial: samsung: Fix serial rx on Apple A7-A9
 SoCs
Content-Language: en-MW
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: asahi@lists.linux.dev
References: <20240907111431.2970-1-towinchenmi@gmail.com>
 <20240907111431.2970-3-towinchenmi@gmail.com>
 <3596ef82-b2a4-40a0-8a66-575e26c386d9@kernel.org>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <3596ef82-b2a4-40a0-8a66-575e26c386d9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/9/2024 20:55, Krzysztof Kozlowski wrote:
> On 07/09/2024 13:06, Nick Chan wrote:
>>  
>> diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
>> index 1672cf0810ef..849d502d348d 100644
>> --- a/include/linux/serial_s3c.h
>> +++ b/include/linux/serial_s3c.h
>> @@ -246,24 +246,28 @@
>>  				 S5PV210_UFCON_TXTRIG4 |	\
>>  				 S5PV210_UFCON_RXTRIG4)
>>  
>> -#define APPLE_S5L_UCON_RXTO_ENA		9
>> -#define APPLE_S5L_UCON_RXTHRESH_ENA	12
>> -#define APPLE_S5L_UCON_TXTHRESH_ENA	13
>> -#define APPLE_S5L_UCON_RXTO_ENA_MSK	(1 << APPLE_S5L_UCON_RXTO_ENA)
>> -#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK	(1 << APPLE_S5L_UCON_RXTHRESH_ENA)
>> -#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK	(1 << APPLE_S5L_UCON_TXTHRESH_ENA)
>> +#define APPLE_S5L_UCON_RXTO_ENA			9
>> +#define APPLE_S5L_UCON_RXTO_LEGACY_ENA		11
>> +#define APPLE_S5L_UCON_RXTHRESH_ENA		12
>> +#define APPLE_S5L_UCON_TXTHRESH_ENA		13
>> +#define APPLE_S5L_UCON_RXTO_ENA_MSK		(1 << APPLE_S5L_UCON_RXTO_ENA)
>> +#define APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK	(1 << APPLE_S5L_UCON_RXTO_LEGACY_ENA)
>> +#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK		(1 << APPLE_S5L_UCON_RXTHRESH_ENA)
>> +#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK		(1 << APPLE_S5L_UCON_TXTHRESH_ENA)
> 
> Use BIT() for new entries. You can also convert the earlier defines to
> BIT() in separate patches.
Acked. Version 2 will change APPLE_S5L_* entries to use BIT(), and then
add the new
entries with BIT().

> 
>>  
> 
> Best regards,
> Krzysztof
> 

Nick Chan
