Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6468821A42C
	for <asahi@lists.linux.dev>; Thu,  9 Jan 2025 15:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437983; cv=none; b=CLYCyLvwiu8CXPYh2nSQho5fkKuhrvNymMUw4+EnnLh7gkrwvQEw46eoUePp5nx4BMR3u+X0UQkvRQ1Zx0tJLrUEBDsvIso/x81UHeJzPGsbJNDwUg4kb8LtyhrUsUULSkHUhWnVBe++AsL8zcuWfEAb8uzKPYdlGURqkUtGIpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437983; c=relaxed/simple;
	bh=8o974i+x1r6BuA58so3JnbqP3rd68UaZm2Od16lBMGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8K5QjKnBY5fHLq2UIesI8RAcduQRSWhqEDO7v11LBPDB8iqZA3ZXfIE8IivbelOvl+25uy3/YMv67ht4A6SZOAQ42eAX1HkkYGoIdPR9kRah/prX+X4aBzedGGGgvuKwUKtOVWRKQ2BdlFoTfpN0GIexQ+94r5aqBfh0vsuj/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K15MSMZb; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K15MSMZb"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21661be2c2dso16784105ad.1
        for <asahi@lists.linux.dev>; Thu, 09 Jan 2025 07:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736437982; x=1737042782; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLjaNLw0xnbIzxsGtzqJhd8aEd4Ru1RCayYPC8m3MbY=;
        b=K15MSMZbKQ4vV63NBxR/MZm0VhPn+oEWlmPav2IqtovKmFeNqSeQPpCgDnSQnWHkUQ
         citcGmWTdzrtB4O50gh/oTJNqG45MsxlpvWiGaxZTkNoYr7LrNhFVWjm2n1Q3v9FQdHf
         GVkIS3M+XOAdxjpBwg0Xt7Cx+ePXQDq+S/6ssxYHVBfSHXrtFJMF+D3dStyDR68u//N5
         iJve7Bj4vf2ufLoc2nvCmLNwx7G5Bz/ODvOOXFwby/cwb5tMKchaMgBNAEmIRjpdW8G8
         3N0J51W27rzm+7otpIZvSaGlcrJ1OjQFBWOVrmNko9XQnib/UtsU+AJRKJ+BrkHSrm+J
         ytZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437982; x=1737042782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yLjaNLw0xnbIzxsGtzqJhd8aEd4Ru1RCayYPC8m3MbY=;
        b=sN9Lyjee6SjbcFilxySg4scNZuhKWAfiouCEeDrRmXoc6Dl6grBla779u7dvW+dKTX
         FxAmsEET0qTQHRvIKxkZqUdpjM8MyOYYw+feML3gXjFS7o1Pg8CEdzsSen1SYIEHPRpY
         UTLrkIKHY6vEMmmYRaPbwE52UjiGr4yVn9zOtpBSllya4cmdLI+lez5Gi6YmG7UCCioA
         Lsr2+w7haaPbIxHZzJJ16Z2wGtBp+30y9mEyE6el8QTLJjDpEtCMhQ+tBGxKvX8cuMCg
         7rC3FzRtoZjY624v8e/7Yax5aXCDPfP18/PWoLG3J2xqcLgbUCcFtpO+HuwKxhO3UbOX
         zpCw==
X-Forwarded-Encrypted: i=1; AJvYcCVuBzdfKBXlQ9W0llAH3ZhYulbeOy9VtAZgFHQWeJKSrrA7TJlsD0WJP9IlSBnapXPnyZM4EQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuYfAsi2kXB2sm9JWCSkEDKjuGZsiQQx27TdytMSKFDJgMm0Rh
	Uuu+FKVY58XRIW9+ARhdLJFd2B0DJcz6/OAZrpMbkoZ6N16LfoNd
X-Gm-Gg: ASbGncvAWp/GBVUUz6SpvCLVKFS4crXv6MQ7ZDGt2UAGkfiZJsy8jqH8O5Scliwp2yJ
	BWl6QEdr3ivGUAVeRA6jx7ApFL47zrnSX0YvY1lj4EvXGocXATtdcPDEapggdN0ZvELTI2B8dYQ
	wLTzRY+vPIBUKHZcn7PfZZji0fjphit/fYiS0U62JESByOVUizu/w2hSKbUt+6GOr1QqGB/8A31
	5Mh+8cLgEFUXsdYXEO1R0SJkHpOqLfzRdQYSeIn8rKdEioz1iSIic/HE5DB2RcE1KqVqn/nR2Y=
X-Google-Smtp-Source: AGHT+IHDn1Y3xt05c3sartTSXwHA9erKjixGfU399kRuKIVN2pSlgvUAIoFBG/VDgJvH9iN34Uy6+g==
X-Received: by 2002:a17:903:1248:b0:216:2dc5:2330 with SMTP id d9443c01a7336-21a83fd2400mr106271905ad.36.1736437981642;
        Thu, 09 Jan 2025 07:53:01 -0800 (PST)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a91768ca2sm14337555ad.45.2025.01.09.07.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 07:53:01 -0800 (PST)
Message-ID: <ad3cbf5a-6322-4256-9284-f739d4c3aa45@gmail.com>
Date: Thu, 9 Jan 2025 23:52:56 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-3-towinchenmi@gmail.com> <Z35Y9rzS6tLVgsRo@aspen.lan>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <Z35Y9rzS6tLVgsRo@aspen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Daniel Thompson 於 2025/1/8 下晝6:52 寫道:
> On Wed, Dec 11, 2024 at 07:34:38PM +0800, Nick Chan wrote:
>> Add driver for backlight controllers attached via Apple DWI 2-wire
>> interface, which is found on some Apple iPhones, iPads and iPod touches
>> with a LCD display.
>>
>> Although there is an existing apple_bl driver, it is for backlight
>> controllers on Intel Macs attached via PCI, which is completely different
>> from the Samsung-derived DWI block.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  drivers/video/backlight/Kconfig  |  12 +++
>>  drivers/video/backlight/Makefile |   1 +
>>  drivers/video/backlight/dwi_bl.c | 122 +++++++++++++++++++++++++++++++
> I'd rather this was called apple_dwi_bl.c to match that config options,
> etc.
Still trying to determine the type of the backlight control, I think it is linear however and I will send a new
version when I am more certain.


>
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..59e5cad0fbd8
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,122 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
>> + *
>> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
>> + */
>> +
>> +#include <linux/backlight.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/device.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define DWI_BL_CTL			0x0
>> +#define DWI_BL_CTL_SEND1		BIT(0)
>> +#define DWI_BL_CTL_SEND2		BIT(4)
>> +#define DWI_BL_CTL_SEND3		BIT(5)
>> +#define DWI_BL_CTL_LE_DATA		BIT(6)
>> +/* Only used on Apple A9 and later */
>> +#define DWI_BL_CTL_SEND4		BIT(12)
>> +
>> +#define DWI_BL_CMD			0x4
>> +#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
>> +#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
>> +#define DWI_BL_CMD_DATA			GENMASK(10, 0)
>> +
>> +#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
>> +					 DWI_BL_CTL_SEND2 | \
>> +					 DWI_BL_CTL_SEND3 | \
>> +					 DWI_BL_CTL_LE_DATA | \
>> +					 DWI_BL_CTL_SEND4)
>> +
>> +#define DWI_BL_MAX_BRIGHTNESS		2047
>> +
>> +struct apple_dwi_bl {
>> +	void __iomem *base;
>> +};
>> +
>> +static int dwi_bl_update_status(struct backlight_device *bl)
>> +{
>> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
>> +
>> +	int brightness = backlight_get_brightness(bl);
>> +
>> +	u32 cmd = 0;
>> +
>> +	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
>> +	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
>> +
>> +	writel(cmd, dwi_bl->base + DWI_BL_CMD);
>> +	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
>> +
>> +	return 0;
>> +}
>> +
>> +static int dwi_bl_get_brightness(struct backlight_device *bl)
>> +{
>> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
>> +
>> +	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
>> +
>> +	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
>> +}
>> +
>> +static const struct backlight_ops dwi_bl_ops = {
>> +	.options = BL_CORE_SUSPENDRESUME,
>> +	.get_brightness = dwi_bl_get_brightness,
>> +	.update_status	= dwi_bl_update_status
>> +};
>> +
>> +static int dwi_bl_probe(struct platform_device *dev)
>> +{
>> +	struct apple_dwi_bl *dwi_bl;
>> +	struct backlight_device *bl;
>> +	struct backlight_properties props;
>> +	struct resource *res;
>> +
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(*dwi_bl), GFP_KERNEL);
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
>> +
>> +	dwi_bl->base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
>> +	if (IS_ERR(dwi_bl->base))
>> +		return PTR_ERR(dwi_bl->base);
>> +
>> +	memset(&props, 0, sizeof(struct backlight_properties));
>> +	props.type = BACKLIGHT_RAW;
>> +	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;
> There should be something to indicate whether the backlight controls are
> linear or logarithmic here.
>
>
>> +static struct platform_driver dwi_bl_driver = {
>> +	.driver		= {
>> +		.name	= "dwi-bl",
> Again, I'd rather see apple here too (although, to be clear, I'm
> perfectly happy with all the static functions and variables being
> prefixed only with dwi_bl).
Alright, I will rename the file and and the name of the driver to have apple, the functions
and variables will still not have apple though to not make the lines too long.


>
>
> Daniel.
