Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5B718785A
	for <asahi@lists.linux.dev>; Tue, 10 Sep 2024 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725978410; cv=none; b=DzIPcx3ElQBk3vB3+3N+Xhvol3azJuQK2DOT7dawK8uz44kIGiatpfqhqwPh3+pdqfKL5ESIG7KasDR8KYyEWBNICKETsyMUX/AUVRs8xCmJGJRNj/imyBowzMr4sTB+TmEGPWU3yX6JQYqtZvEPC5w2xBktK3tAaB1G+WIgdZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725978410; c=relaxed/simple;
	bh=hc7NyxgpJ6DbiRHsgdcnzwepguGDZlHND0w3d7+mHNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4ZX7TSi5ACi17gNvb9lH52AjUasVKx3dmnPCYPk2HlJyNS+I/5O/Qf8YSj7pVBwIcTcZrKIddxkQrP9leC6ODD2b+y9DZdTYeoW1KROsDQF4I5Kx9E281tLp8F75r5FhPtDaIQosq92kNfzvUM4bbG7rRw28t7/Nu2mU9XuXks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVJVp3iV; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVJVp3iV"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7178df70f28so661219b3a.2
        for <asahi@lists.linux.dev>; Tue, 10 Sep 2024 07:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725978408; x=1726583208; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+t6DdrK5yndZ10uTnmpmlxoTF20sSnH2lNklBwPw3IE=;
        b=XVJVp3iVU0pJNJmg+Kl80XCyjYIohu/xV0kzsyxeu97Af0aeVwVFk2VsKWO7ySQY8R
         ymuoegnbIRSrYZt/WFJAJ9KdXXQRdgOAVIUyed86MdZXWe/psEUWE8o6eZQhfNOp+zgG
         B8NiWhNhosW44ybg/T348X6bnf77o99VAIj7QK1wQVAfiOk9XL75Fewm91PzZdCnsfXK
         t2rV8jsxn3Wqw4WqQXzlMhvYB/TqdnUWj1sBTmJt7ieZFKCtNLrJdRVzL1zjwECrR/G+
         YC+zxXR+gbDUeeKPl8dXcs+tvRNX/yEmQbwVzZVAWiiFFCGSE2LFyyPL2a1l3kmWDKcV
         sq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725978408; x=1726583208;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+t6DdrK5yndZ10uTnmpmlxoTF20sSnH2lNklBwPw3IE=;
        b=vdvkjGzbkdJ+D7uRRLfa0B+iqrMQRzr8TZL5Tq0Az/IKlFIgpq72B2zaYxh0cjVMsR
         KQ1sO0w/Hxf9zeUPbmrKim/TfSVVwePquqDLIh/+bfJEv1v0AjkO/q3ySFqpytEUdVua
         BBbUtFzGFQ4ouen34e1GbRy7a/O77eFzvjtXw26YBW4E7zlBuWEwu2FvveBYEODENnCJ
         CD1604z4xVArkUNWshzU/+330LUCTPWP6Ed8V7F7kAS8lYa+Aaytxpw8/hX0BH4/NWF5
         mL1wFy/CTWG7W8i/wHK2GucBDNhMUg5kXuCYsa+XiOuxPJdZk1utneUocRdc0pByFmze
         WxGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDzK/ZuZgMk3Ky/bOXOb5Q2s/ElYgreZelhBEyGNHpk45ERX46T9x/+YopYHIbg8vqJbijZg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfg1cTSpxzqh5003Ey05vDQhLwFdcd3xuWKmsE218gn4EXTV0e
	uMWPyBYQ1rBcFptSBrWzl2dVrESNEP+URFM/HE9EnJnfetkmNVPt
X-Google-Smtp-Source: AGHT+IEf3wHNP6yf1vdBPZkHwAbshOdAEbtculahpnCqwG6Zq2HSxCVLlv0APhg8CaZYX2Sbty2Kew==
X-Received: by 2002:a05:6a20:e609:b0:1cc:bb1f:1d4 with SMTP id adf61e73a8af0-1cf5dc246c8mr1477157637.0.1725978407681;
        Tue, 10 Sep 2024 07:26:47 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e3271csm49416375ad.78.2024.09.10.07.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 07:26:47 -0700 (PDT)
Message-ID: <a7f7ccb0-1dd2-4df5-a2ad-1fe4c98d67e0@gmail.com>
Date: Tue, 10 Sep 2024 22:26:44 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] tty: serial: samsung: Use BIT() macro for
 APPLE_S5L_*
Content-Language: en-MW
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, asahi@lists.linux.dev
References: <20240909084222.3209-1-towinchenmi@gmail.com>
 <20240909084222.3209-2-towinchenmi@gmail.com>
 <lbyvuozxjywyt46w2imk2jvwfas3p43wooj2ioyhufwkyg72da@d6stk7xk4rx4>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <lbyvuozxjywyt46w2imk2jvwfas3p43wooj2ioyhufwkyg72da@d6stk7xk4rx4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/9/2024 20:48, Andi Shyti wrote:
> Hi Nick,
> 
> On Mon, Sep 09, 2024 at 04:37:25PM GMT, Nick Chan wrote:
>> New entries using BIT() will be added soon, so change the existing ones
>> for consistency.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> 
> I think this is:
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
We will see... Got a bit paranoid after bad things happened with v2 and v3.

> 
>> ---
>>  include/linux/serial_s3c.h | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
>> index 1672cf0810ef..1e8686695487 100644
>> --- a/include/linux/serial_s3c.h
>> +++ b/include/linux/serial_s3c.h
>> @@ -249,9 +249,9 @@
>>  #define APPLE_S5L_UCON_RXTO_ENA		9
>>  #define APPLE_S5L_UCON_RXTHRESH_ENA	12
>>  #define APPLE_S5L_UCON_TXTHRESH_ENA	13
>> -#define APPLE_S5L_UCON_RXTO_ENA_MSK	(1 << APPLE_S5L_UCON_RXTO_ENA)
>> -#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK	(1 << APPLE_S5L_UCON_RXTHRESH_ENA)
>> -#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK	(1 << APPLE_S5L_UCON_TXTHRESH_ENA)
>> +#define APPLE_S5L_UCON_RXTO_ENA_MSK	BIT(APPLE_S5L_UCON_RXTO_ENA)
>> +#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_RXTHRESH_ENA)
>> +#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_TXTHRESH_ENA)
>>  
>>  #define APPLE_S5L_UCON_DEFAULT		(S3C2410_UCON_TXIRQMODE | \
>>  					 S3C2410_UCON_RXIRQMODE | \
>> @@ -260,9 +260,9 @@
>>  					 APPLE_S5L_UCON_RXTHRESH_ENA_MSK | \
>>  					 APPLE_S5L_UCON_TXTHRESH_ENA_MSK)
>>  
>> -#define APPLE_S5L_UTRSTAT_RXTHRESH	(1<<4)
>> -#define APPLE_S5L_UTRSTAT_TXTHRESH	(1<<5)
>> -#define APPLE_S5L_UTRSTAT_RXTO		(1<<9)
>> +#define APPLE_S5L_UTRSTAT_RXTHRESH	BIT(4)
>> +#define APPLE_S5L_UTRSTAT_TXTHRESH	BIT(5)
>> +#define APPLE_S5L_UTRSTAT_RXTO		BIT(9)
>>  #define APPLE_S5L_UTRSTAT_ALL_FLAGS	(0x3f0)
> 
> You could make this GENMASK(0x3f, 4)
Good idea, given the above context I think I may add

Suggested-by: Andi Shyti <andi.shyti@kernel.org>

too. And actually it should be GENMASK(9, 3)

> 
> Andi

Nick Chan

