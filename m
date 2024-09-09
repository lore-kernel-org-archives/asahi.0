Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F611B14F3
	for <asahi@lists.linux.dev>; Mon,  9 Sep 2024 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725875506; cv=none; b=MX8+YU2O0LtVAhIRD8XyIaZYVWlkqOB8J6AJNQVLgxKpJXxGmtLzwvPoj3O63fqhiRVov+CjIQVRYCCUmEdaRqxrgsDfsCxGcmUnR+qJjOOQwMHHz+6B9MF/Jzcz/brPHQpHXx9LNlAqn9Ud6HZAhHtakeO52Qf5n1sXndZxsUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725875506; c=relaxed/simple;
	bh=v//5t/0bjkhgBJiDQenroWTa5RUPXSaUSGG4FMHwedA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aQBtIQl1fCqIrQc+m8kuPHwmagoEnNg6nbeEdTvj2tSzpfTR6ffvgc9boCiVZJne9p7fdFfatRtfexh8GLwcVnKvAwuaNiEb7QevdGy1qhvfrEqKHK9BKD8ccrkN9A2nTslnUasWSJB9sItpJfuGmh4nMOrJJ0vuLDn6PO95LyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nM31trYc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nM31trYc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2068acc8b98so37300275ad.3
        for <asahi@lists.linux.dev>; Mon, 09 Sep 2024 02:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725875504; x=1726480304; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BxThiR5nzFK+xrLdN3ioSN/1qBMtAgwpQa7ur9iw0b4=;
        b=nM31trYcEEfeDZSIsz22FGdy3K0vfxjLVHIRMQLKoMWQfPmb4SMz7Xqft8c5uX2yrL
         9nzs/0hCMXNWT9LH8c6ZcRaDmTL/9rVyr66lBbpRmQF7xmlvRdzToa1EVbC6PT5OW4om
         l3l3zVEX5gWvhuD+E+hK6jxz6iptmGD6I4TfFiFVk8utq0BgdnxwoBnglguLcGuakD+P
         WZRK5vAtmmtZ0TazLDDDe7WOmBfBnAZH3xG4KE8yvsVIrh2MtUiH2MEP4pHWcD/swd02
         fxZYRaNrGXDooy8hZBHxuxReACuEdhbCkIhv3gqdeAw/NbpnXtxLOflOtO0ckqoEVCvC
         YrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725875504; x=1726480304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BxThiR5nzFK+xrLdN3ioSN/1qBMtAgwpQa7ur9iw0b4=;
        b=LPRtaxn53FkL2YuWl6lSTDH1t/Qnk8Jqa8nwPwG6AGMaktVdgvBrLz86Y7nfp+9KeH
         Z6GoerGDdaW4G8la75BHFMe6/ldWTQk+2RUb3UiRIVqNbuQ0Kx0lFwQt9t/ksK73jqwe
         6CIhldxWJ1OyA8pTf+fCnKtVInPCNb77yqJflJVcm5T4NfVtOt8Er0vSN9xw5R/Q5eOA
         CfWykx4wM8qynywixtFhoSVWGm1gdGT6hinEi46ybrkgkqFti+yFlPMaw+jn251sJzEx
         LDBDA5/bkStALE8+K/Ncv/NQFNhel57RX/A522vyPucubeVCCbpNk372NwY+f5lJyYjo
         wnAg==
X-Gm-Message-State: AOJu0YzLrBHN8oE0qdAcY1ayUvMenRqsDqyQYfVOPdboMgBuXiC5Mg//
	OcQ87GsKTUATBwOgKroWdKkdVFs8oaN1rD0kL01BEuEofyEQl5rD
X-Google-Smtp-Source: AGHT+IFLzyaF+XKIAZGKqTPsXXToAQg6EiMRfk82/uweXHNRCdQrhJ4wH8AMQsWVKzmrGz2I3FhO3A==
X-Received: by 2002:a17:903:2350:b0:205:6552:1099 with SMTP id d9443c01a7336-2070c077273mr100891695ad.8.1725875503992;
        Mon, 09 Sep 2024 02:51:43 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e15cfdsm30915395ad.6.2024.09.09.02.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 02:51:43 -0700 (PDT)
Message-ID: <1a318d4f-8883-490f-a537-d641cf845a7c@gmail.com>
Date: Mon, 9 Sep 2024 17:51:40 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] tty: serial: samsung: Fix serial rx on Apple A7-A9
To: Kwanghoon Son <k.son@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: asahi@lists.linux.dev
References: <20240909084222.3209-1-towinchenmi@gmail.com>
 <20240909084222.3209-4-towinchenmi@gmail.com>
 <CGME20240909094327epcas1p4bd962fc01182a76c07888e9222572917@epcas1p4.samsung.com>
 <c73a59634ed8eeb099f4d5cb746f3b3e770391f5.camel@samsung.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <c73a59634ed8eeb099f4d5cb746f3b3e770391f5.camel@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/9/2024 17:43, Kwanghoon Son wrote:
> On Mon, 2024-09-09 at 16:37 +0800, Nick Chan wrote:
>> Apple's older A7-A9 SoCs seems to use bit 3 in UTRSTAT as RXTO, which is
>> enabled by bit 11 in UCON.
>>
>> Access these bits in addition to the original RXTO and RXTO enable bits,
>> to allow serial rx to function on A7-A9 SoCs. This change does not
>> appear to affect the A10 SoC and up.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>>
> 
> [snip]
> 
>> diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
>> index 1e8686695487..964a4fbf2626 100644
>> --- a/include/linux/serial_s3c.h
>> +++ b/include/linux/serial_s3c.h
>> @@ -246,24 +246,28 @@
>>  				 S5PV210_UFCON_TXTRIG4 |	\
>>  				 S5PV210_UFCON_RXTRIG4)
>>  
>> -#define APPLE_S5L_UCON_RXTO_ENA		9
>> -#define APPLE_S5L_UCON_RXTHRESH_ENA	12
>> -#define APPLE_S5L_UCON_TXTHRESH_ENA	13
>> -#define APPLE_S5L_UCON_RXTO_ENA_MSK	BIT(APPLE_S5L_UCON_RXTO_ENA)
>> -#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_RXTHRESH_ENA)
>> -#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_TXTHRESH_ENA)
>> +#define APPLE_S5L_UCON_RXTO_ENA			9
>> +#define APPLE_S5L_UCON_RXTO_LEGACY_ENA		11
>> +#define APPLE_S5L_UCON_RXTHRESH_ENA		12
>> +#define APPLE_S5L_UCON_TXTHRESH_ENA		13
>> +#define APPLE_S5L_UCON_RXTO_ENA_MSK		BIT(APPLE_S5L_UCON_RXTO_ENA)
>> +#define APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK	BIT(APPLE_S5L_UCON_RXTO_LEGACY_ENA)
>> +#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK		BIT(APPLE_S5L_UCON_RXTHRESH_ENA)
>> +#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK		BIT(APPLE_S5L_UCON_TXTHRESH_ENA)
> 
> Small thing, but other diff is not needed except
> APPLE_S5L_UCON_RXTO_LEGACY_ENA.
> 
> Kwang.
The other diffs are there to keep everything aligned, it looks like a
jumbled mess here in the email, but in an editor like nano it is all
aligned, before or after this series.

> 
>>  
>>  #define APPLE_S5L_UCON_DEFAULT		(S3C2410_UCON_TXIRQMODE | \
>>  					 S3C2410_UCON_RXIRQMODE | \
>>  					 S3C2410_UCON_RXFIFO_TOI)
>>  #define APPLE_S5L_UCON_MASK		(APPLE_S5L_UCON_RXTO_ENA_MSK | \
>> +					 APPLE_S5L_UCON_RXTO_LEGACY_ENA_MSK | \
>>  					 APPLE_S5L_UCON_RXTHRESH_ENA_MSK | \
>>  					 APPLE_S5L_UCON_TXTHRESH_ENA_MSK)
>>  
>> +#define APPLE_S5L_UTRSTAT_RXTO_LEGACY	BIT(3)
>>  #define APPLE_S5L_UTRSTAT_RXTHRESH	BIT(4)
>>  #define APPLE_S5L_UTRSTAT_TXTHRESH	BIT(5)
>>  #define APPLE_S5L_UTRSTAT_RXTO		BIT(9)
>> -#define APPLE_S5L_UTRSTAT_ALL_FLAGS	(0x3f0)
>> +#define APPLE_S5L_UTRSTAT_ALL_FLAGS	(0x3f8)
>>  
>>  #ifndef __ASSEMBLY__
>>  
> 

Nick Chan
