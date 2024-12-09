Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CE22165F1
	for <asahi@lists.linux.dev>; Mon,  9 Dec 2024 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738884; cv=none; b=q+bTGGTQCxZvkvT9BEB/FdgN4d+jX8MAo8gt4dV/9d6mDMFLfOuYMoDgK+RCXCYCnDFTaGU0FQq3D1MWokFdMc9KeltkEpSE/FOELCGvCcKXbqL7N1ShAk+XzGuIj68UFE8JajlJvm2iB35UYmWd9esaiHflM9Mb5URJAIs70oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738884; c=relaxed/simple;
	bh=fU0JFCK9xqBNnAEfWCALQQcXBFQd2+mLyQO4TWjbXnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=queDsV3uY6w/leUhvx+1RmPF1Oklq19rGV4hN9aRjFu+D30gRDTF+XHKUSSYYdz6YiFL22z+tYgansFSjfjH4/QF77icDsy4+ZB46bkiZqtv9fzIkyna2O/uNTDTp+6/KTK34TqqAHMzVHPx95qwo2yHciECh8ayHGZs8QqIUmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhxpVY3J; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhxpVY3J"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7265c18d79bso281722b3a.3
        for <asahi@lists.linux.dev>; Mon, 09 Dec 2024 02:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733738881; x=1734343681; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fZp+CFP7K7kOAlodAUCSCzM6XqjZQS3FtVdgKB9HjIU=;
        b=VhxpVY3JMLz5BNutodeauS2bfRqZi7wmApEmr97MrKJpIyBHot1dttBsQb8ySaIuxf
         UnKha1pKFXh1zGn7XDUoDfavzyW0wvUGrwBm0Ikz832wIiDbCA7osVNowG1ZKCGaHOWf
         ninnNKjK1eA1RTfloE3IdvhvS/KH1dkWRyXeUfeU4WVP08kwvdd0ENRO9gYiBazS5Idr
         x+KZhSONBU753fL0au+TLrh137JdY6Hvfo08mGiyqhTdXWPP3lt800jzaMRCIYV6gnJH
         OSt+fBMZTtMfNMSXXs7ULPYG/6sCOUSM5IPbL24KQ5JuyNtron2pUOo1dTL4srTZcKr4
         /5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733738881; x=1734343681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZp+CFP7K7kOAlodAUCSCzM6XqjZQS3FtVdgKB9HjIU=;
        b=IVu0JLP++OE+Pd9NEW2UEXNVKMypEVtp2CFwrVu3MjyjRIpGzGE+MagSUvp/R+d3Kg
         LagqNhpAPv2Mcw8PGh8VEJ+jHy7cR8sHpNfDLkEhZyqNBT9YS/0BhCJbpYjrFmFeqLLJ
         iUw4GNKNIAnic8XRNOVAhPd+1wMjMsy5tv9VxDPgPR75hAas322UJpbu5P0zKgOGEif0
         H7g8AbxG8luojwJwlz39t2yWq28fpuony1hijhrOjQ38dqus1RNx3sz0xfo5z6ZuzjYY
         rark76YsQZ3Gc7D1fsrMqvAxcC7Mh5S3W+Eo6vZ1Df/4lzV9lfKXwwDymAT+bp157Acm
         VJMg==
X-Forwarded-Encrypted: i=1; AJvYcCVnw62J7gsN2h4KabaHMB4Yeq5P4e4N1SsfKLy57K5s5wsXx53WYn9PLDVl9Zbm6k4Ht80iDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwE0hJoTzs5OmCVd63FON/EWjezlErOjfE5CRYVBOa6pG4Qocj8
	E4c8UxIUme3J4xdsYwhbDMZjH7aLD1whDRHZev32nmMIIRq+pUPa
X-Gm-Gg: ASbGncu2RqWkGDvMH0/gIgkyJ4HLC9oM93d+oslBvaJiRL3smsO7So++350i455MwK3
	QvDdF6FYCvPv8mVi3UKTjsjC0xhmYrwAwQb12WbdffkxogrozylOgLwDNl4kiINoAx3gOFA3vyX
	sOm59A3yuXkDolO/4nO8JB8ShxV2GVw3gW+wNqveu3f103UgWQvRu9+wUyQQf8cafXavRod39hp
	lKET6ysHnJ/rhALcac1vFDX46Mkv1hYBnybiZK2znKEAuPAczVOs5fiLAYiKVewjHqd
X-Google-Smtp-Source: AGHT+IE2AAunC8wmSSoVHJwvOzFoZYPvX4c5A5ejLO9bR6TnjihE9dezvHIlPn7G9UQ6/5A3kkQW9g==
X-Received: by 2002:a05:6a00:a8c:b0:725:24c2:b794 with SMTP id d2e1a72fcca58-725b8188090mr18378334b3a.23.1733738881124;
        Mon, 09 Dec 2024 02:08:01 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725d9b98eb2sm3567122b3a.148.2024.12.09.02.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 02:08:00 -0800 (PST)
Message-ID: <551941de-b9a4-4353-8bb2-0bfc3304ef87@gmail.com>
Date: Mon, 9 Dec 2024 18:07:55 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
To: Krzysztof Kozlowski <krzk@kernel.org>, y@krzk-bin
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-3-towinchenmi@gmail.com>
 <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 2024/12/9 下午5:22 寫道:
> On Sat, Dec 07, 2024 at 09:03:15PM +0800, Nick Chan wrote:
>> Add driver for backlight controllers attached via Apple DWI 2-wire
>> interface, which is found on some Apple iPhones, iPads and iPod touches
>> with a LCD display.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  drivers/video/backlight/Kconfig  |  12 +++
>>  drivers/video/backlight/Makefile |   1 +
>>  drivers/video/backlight/dwi_bl.c | 124 +++++++++++++++++++++++++++++++
>>  3 files changed, 137 insertions(+)
>>  create mode 100644 drivers/video/backlight/dwi_bl.c
>>
>> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
>> index 3614a5d29c71..e64cc3d51ac5 100644
>> --- a/drivers/video/backlight/Kconfig
>> +++ b/drivers/video/backlight/Kconfig
>> @@ -166,6 +166,18 @@ config BACKLIGHT_EP93XX
>>  	  To compile this driver as a module, choose M here: the module will
>>  	  be called ep93xx_bl.
>>  
>> +config BACKLIGHT_APPLE_DWI
>> +	tristate "Apple DWI 2-Wire Interface Backlight Driver"
>> +	depends on ARCH_APPLE || COMPILE_TEST
>> +	default y
>> +	help
>> +          Say Y to enable the backlight driver for backlight controllers
>> +          attached via the Apple DWI 2-wire interface which is found in some
>> +          Apple iPhones, iPads and iPod touches.
> 
> Mixed/messed indentation. Some spaces?
Ack. Will be fixed for v4.

> 
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called dwi_bl.
>> +
>>  config BACKLIGHT_IPAQ_MICRO
>>  	tristate "iPAQ microcontroller backlight driver"
>>  	depends on MFD_IPAQ_MICRO
>> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
>> index 8fc98f760a8a..0a569d7f0210 100644
>> --- a/drivers/video/backlight/Makefile
>> +++ b/drivers/video/backlight/Makefile
>> @@ -28,6 +28,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
>>  obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
>>  obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
>>  obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
>> +obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o
> 
> Please do not introduce other sorting way - it is sorted by config name.
> Which will also point you to apple_bl.o and need of explaining the
> differences, e.g. why this cannot be one driver.

apple_bl is a driver backlight controllers on a PCI bus on Intel Macs,
which is
completely different from the Samsung-derived DWI block this driver
deals with.
This will be explained in the commit message for v4.

> 
> 
>>  obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
>>  obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
>>  obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
>> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
>> new file mode 100644
>> index 000000000000..d4bfd74b3129
>> --- /dev/null
>> +++ b/drivers/video/backlight/dwi_bl.c
>> @@ -0,0 +1,124 @@
>> +// SPDX-License-Identifier: GPL-2.0 OR MIT
>> +/*
>> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
>> + *
>> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/io.h>
>> +#include <linux/backlight.h>
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
>> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);
> 
> sizeof(*)
> 
>> +	if (!dwi_bl)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
>> +	if (!res)
>> +		return -ENXIO;
>> +
>> +	dwi_bl->base = devm_ioremap_resource(&dev->dev, res);
> 
> Use helper for these two, devm_platform_get_and_ioremap_resource() or
> similar.
Ack. Will be fixed for v4.

> 
> Best regards,
> Krzysztof
> 

Nick Chan
