Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D600314A0A3
	for <asahi@lists.linux.dev>; Sat,  7 Sep 2024 13:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725715358; cv=none; b=I2ThNehf5pcdWDstK67ej5ZFyUJiSsL32TF3tAq7Qo49AcMunZS6Mg/UeWzQ9890grXZHymUWLq6qvALCBBW08PReLGCkJU1cVjwk/JFilGvYuKPk1gCD435fYA2G3NA84XTQELAytUYHw50X0P2demEXfEeIkS+8DKjiTB4/a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725715358; c=relaxed/simple;
	bh=hbSkz6bDI6cLFbwXFJV6dDhT57AZB9GSy+xISrmGrQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvMH7NZwFaSSIiYwjo8wSdIPnj/jg787tsDRKQC8dyO08JYMJrUVKLpAnuUPfrE4rE0JtDwq692hJCQzKCrRcUpuhZPIumgs5XcFGIChLi0JvgMw+R989Pvlu8QMDdspp4lwHphu6fAig5khd7laocukiw8zxieTBfwTwSHedFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g68gN+t0; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g68gN+t0"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2da55ea8163so2209201a91.1
        for <asahi@lists.linux.dev>; Sat, 07 Sep 2024 06:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725715356; x=1726320156; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0r0BvC0JYwjLynqTsK9rmwWO+bU4XTC1+gIg1Xr9eo=;
        b=g68gN+t01Da5UcPVgT/vidyDWz1jKz3qHGvryHqhtexg6Eq3Duk//uHYPbXkbg8ndJ
         VONVPg70FsEIfOfqkNxoXJ8LILosn06roBFliayCga36WKAAYKZw7baWTmGy+U3Tcvsn
         XAEUIUk8R+Eq/JgCqG9ITdg1j+9OVcZnqFgQPNw2y2PYY7zSHf++wBex8PKtjkCRZ1MB
         qw2EOgaPe5pwdxwSoKg0Rdeqio1G4veSLvghJOTQFaSkeB9O1UfRaomZMIWlWlg1CwJS
         DtfHaqIzmrBnV0Wuwxr1WxtEWi+GP6d0Gx6560CFij4rR6MavcP27wkTbFRaCSqCy8Pn
         NDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725715356; x=1726320156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0r0BvC0JYwjLynqTsK9rmwWO+bU4XTC1+gIg1Xr9eo=;
        b=BOOHjXGnzi9MSJmWWe/MrKwHZtWM4JtRCj0AX5zK25wkm8A57SBQmFknUX1zeuoD98
         FsQA4jI0vt3NbZO0JN/4L11iDtjJub3hO/k2Sw9U7kYCGZyQ52tjVR+30XATPGcjyKzD
         srK8rJHlD82GBVkXe/Lj3rQWGTY3HaNQESQFRUX/IyBqLRkFV97oq5l89qgAaJCFIBw4
         sR45lIIAmFoxa4kwAbctNohuAH0P85+XM38zMQrJe/i8jnHdvtuMYYT2Y2Ss3wMpOZRv
         /pndFssTV/txgkp9ik6AzJfpGZCnythQXwS7TiylsVS4faoeRa8O4QW7j+Su3Ylh62k4
         IqgA==
X-Gm-Message-State: AOJu0YxrpB3jX73kbhtc13aNZTiLhaVlnSmM9LK0CGIhPYzMmi0myx/+
	sRXSxr3/o/BTPJ6PjOTGxduSE1VpMD5K5+j8e68FKRyTiXusaQfI
X-Google-Smtp-Source: AGHT+IHdVHLUbDTTXz6BefBZHbxE7BD7z1FDmqLP55VkGFikFJgclg5egAWIQWqUu90Qh+mLNT47dQ==
X-Received: by 2002:a17:90a:c08b:b0:2c9:359c:b0c with SMTP id 98e67ed59e1d1-2dad5181bc6mr5654503a91.28.1725715355933;
        Sat, 07 Sep 2024 06:22:35 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadbfe46d4sm3370238a91.1.2024.09.07.06.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2024 06:22:35 -0700 (PDT)
Message-ID: <378c9865-270f-4a36-8614-ecff6f0236ce@gmail.com>
Date: Sat, 7 Sep 2024 21:22:31 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tty: serial: samsung: Fix A7-A11 serial earlycon
 SError
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: asahi@lists.linux.dev
References: <20240907111431.2970-1-towinchenmi@gmail.com>
 <20240907111431.2970-2-towinchenmi@gmail.com>
 <440be61d-b60e-4179-8481-b9a7a0dabae5@kernel.org>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <440be61d-b60e-4179-8481-b9a7a0dabae5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/9/2024 20:54, Krzysztof Kozlowski wrote:
> On 07/09/2024 13:06, Nick Chan wrote:
>> Apple's earlier SoCs, like A7-A11, requires 32-bit writes for the serial
>> port. Otherwise, a SError happens when writing to UTXH (+0x20). This only
>> manifested in earlycon as reg-io-width in the device tree is consulted
>> for normal serial writes.
>>
>> Change the iotype of the port to UPIO_MEM32, to allow the serial port to
>> function on A7-A11 SoCs. This change does not appear to affect Apple M1 and
>> above.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  drivers/tty/serial/samsung_tty.c | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>> index c4f2ac9518aa..27b8a50bd3e7 100644
>> --- a/drivers/tty/serial/samsung_tty.c
>> +++ b/drivers/tty/serial/samsung_tty.c
>> @@ -2536,7 +2536,7 @@ static const struct s3c24xx_serial_drv_data s5l_serial_drv_data = {
>>  		.name		= "Apple S5L UART",
>>  		.type		= TYPE_APPLE_S5L,
>>  		.port_type	= PORT_8250,
>> -		.iotype		= UPIO_MEM,
>> +		.iotype		= UPIO_MEM32,
>>  		.fifosize	= 16,
>>  		.rx_fifomask	= S3C2410_UFSTAT_RXMASK,
>>  		.rx_fifoshift	= S3C2410_UFSTAT_RXSHIFT,
>> @@ -2825,8 +2825,10 @@ static int __init apple_s5l_early_console_setup(struct earlycon_device *device,
>>  	/* Close enough to S3C2410 for earlycon... */
>>  	device->port.private_data = &s3c2410_early_console_data;
>>  
>> +	/* ... however, we need to change the port iotype */
>> +	device->port.iotype = UPIO_MEM32;
> 
> If there is going to be resend, then this comment is redundant and can
> be dropped - repeats the code and does not provide any explanation why.
> 
> Which would also make the patch smaller and easier to read. See GS101
> earlycon.
I agree that the comment is quite useless as-is. However, I think it is
worthwhile to mention that A7-A11 expect MMIO32 register accesses here,
as someone looking at this code is likely using one of the newer SoCs,
which does not have this restriction.

> 
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Best regards,
> Krzysztof
> 

Nick Chan
