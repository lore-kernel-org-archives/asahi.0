Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5888F18DF73
	for <asahi@lists.linux.dev>; Sat, 18 Jan 2025 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737211731; cv=none; b=HwmZAo8rI8ZeWQZMULgv/zkurP1dxaq3dxqW8FBKdu+wgfmSGJTkHboNu836yQ/LoP++iVTrp3r1f4P7TabRlcEFi78pO9H626DtVDxkoLqIYiiQwwQR3OsmpCDpm6l8s1P/SNLT5ZBGMffOYZiJU3Ou1klw4/P6pbNh8GsLK3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737211731; c=relaxed/simple;
	bh=WXStXyFZaWcEiVZmhppARBN00/359dcGtrrkG7tTYHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSv60HySj1JFeLUMTzLtYUWRAdD9UNu1TDYM9MVTZQclQdQRuNVNi8fa8X8+LeI6Kh7T653wU4XbdeHzng/f9vzVbdJPHuPoEPrTZD8tb1MOOGyaI1H5ClHsDlZjC0Zu0LIw2bEQB1J3mtdsuonBe/OMoT1yAJ03IXhM/65CHSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9ZoJqH4; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9ZoJqH4"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163b0c09afso59341705ad.0
        for <asahi@lists.linux.dev>; Sat, 18 Jan 2025 06:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737211729; x=1737816529; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ5Pm7uJSWgiHbsmoxlvZ3LbzzSHeTzbUZ13dlbartc=;
        b=A9ZoJqH4tnfrjsm9eFtBiK9N4YTqDdP/MaUWlhpsTOyAQJRqgNMqotaOj3N5wgZMmK
         D/86PRj4d5PpL1lr0Qt2oTM6ZLaUon8xR2MSalVo9cKnt4zSV4mV4AjSC7kZDmPXF1Jc
         V0Z93jsz2URgdGCXn8QYf6JNKXsAtVURAbUXMxBjj3jGaFzpfRlHwpYizVqwmrl5ChJB
         YsiSvOVz/5/zMFL3pW6YiX0N/kAkigi/64F/XP0BwU6BG0ku06Oh7CcNQAhtD30YBx9W
         J6jXweeGJgsFmKSE29+KBP21RgTM2tOf3NJNqIykbii5dG4/s7uTOv9569XawSLt5L4s
         ZIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737211729; x=1737816529;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ5Pm7uJSWgiHbsmoxlvZ3LbzzSHeTzbUZ13dlbartc=;
        b=nC86MbwPLr01ipEwjACJ+Ic+Wyvnt4rbGS7dZdf9lDAJWSEzX/kIvMTdt07QpcRrLe
         uq9i6fMKuRVcYyIedIIGqApIl5z5Nz/tznzYa4ac4kQ4IaRni1gxDFK1Mb1rBc21AjZf
         0yLme60EkXUDZbqHOzSgFKFCFaLdIrqRdO1IvVwpSvzKrk1mTvyXJhKdFozMNfoqSKSo
         2+4xnXu1CJ18GT6cb/JlWBGXSwfDtzFQlTWTZ7tVTpXjRiCCLwJ/Dg+q+ySZBDk5J/gs
         xaCb0a8HrdXfhtkJH8EAd/2BDB24/dQ5BUIrYI5doBFO6lgPOs3O+AYvqSLhEkqOn1JR
         cpgw==
X-Forwarded-Encrypted: i=1; AJvYcCWdpqbotMS2M+cV/k4mGsdgVMZ21NAAHaRoWL4Te93XVjNVffhmRS6VUCa30VREECNk9VRB+A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxeku7nzEk1DKl3Ja8AP3cNmkXC4XMInx7tvbNpT3zQ64ot1p5C
	jBa27XAZNbtdCdiOXcUue2QevRhdxWUtjvZP6DZ1H6/t07PPetJu
X-Gm-Gg: ASbGncuwzaejdfOKz8h7if78GRWUcQL4fDkZHd2I/f8+JKbyfkgx9CVfKR6zxgFg5Hw
	ZXJd2bO8wO3Jxh/Ecktg3tHQCx+vMhbBjLN+t3ptxWWcPTK9FPoJw2Naz4TIcQL7KJRk66s1mrg
	H2mzeLz/DAqhwcBfsdT3Nf93C8QZ2EcEPzf933xDbRzQTDROD+v/1eZyyAmpCXTrwoXJU9q9MLv
	yQklT9f6cdz7W8jldmf567Uie6e2uexlMBF7hCYYZj8Ccpw30iLgqSpWUb14/4RTyYFe1mR7c2n
	AdEeL2QM8eMcuuZ7Tw==
X-Google-Smtp-Source: AGHT+IFnrsNOUiSzk4s4t7y52klnwjzMxfS985Z5YG9DDee9EIIJ78Nl4bVqPlnBpD32vnlbMarWvw==
X-Received: by 2002:a05:6a00:4fcb:b0:727:99a8:cd31 with SMTP id d2e1a72fcca58-72daf97b5d3mr10770196b3a.14.1737211729445;
        Sat, 18 Jan 2025 06:48:49 -0800 (PST)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72daba48bc5sm3922488b3a.133.2025.01.18.06.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jan 2025 06:48:48 -0800 (PST)
Message-ID: <89307020-cc96-41e5-b0c9-998958b9844c@gmail.com>
Date: Sat, 18 Jan 2025 22:48:44 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/apple-aic: Only handle PMC interrupt as FIQ when
 configured to fire FIQ
To: Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250117170227.45243-1-towinchenmi@gmail.com>
 <aef452c6-1e12-4510-8fb9-1dc597cf69bf@app.fastmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <aef452c6-1e12-4510-8fb9-1dc597cf69bf@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sven Peter 於 2025/1/18 夜晚8:24 寫道:
> Hi,
>
>
> On Fri, Jan 17, 2025, at 18:02, Nick Chan wrote:
>> The CPU PMU in Apple SoCs can be configured to fire its interrupt in one
>> of several ways, and since Apple A11 one of the method is FIQ. Only handle
>> the PMC interrupt as a FIQ when the CPU PMU has been configured to fire
>> FIQs.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: c7708816c944 ("irqchip/apple-aic: Wire PMU interrupts")
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  drivers/irqchip/irq-apple-aic.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-apple-aic.c 
>> b/drivers/irqchip/irq-apple-aic.c
>> index da5250f0155c..c3d435103d6d 100644
>> --- a/drivers/irqchip/irq-apple-aic.c
>> +++ b/drivers/irqchip/irq-apple-aic.c
>> @@ -577,7 +577,8 @@ static void __exception_irq_entry 
>> aic_handle_fiq(struct pt_regs *regs)
>>  						  AIC_FIQ_HWIRQ(AIC_TMR_EL02_VIRT));
>>  	}
>>
>> -	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & PMCR0_IACT) {
>> +	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) &
>> +	    (FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT)) {
> That's a somewhat unusual way to use FIELD_PREP and I'm not sure the
> expression even does what you want. It's true when only PMCR0_IACT is set and
> your commit description mentions that you only when to handle these when
> FIQ have been configured. Am I missing something here?
On a closer look the condition will evaluate to true when imode is between 7 and 4 inclusive and
PMCR0_IACT  is set. The intended behavior is to have it evaluate to true when imode is 4 and
PMCR0_IACT is set. Will send a v2.
>
>
> Best,
>
>
> Sven


Nick Chan

