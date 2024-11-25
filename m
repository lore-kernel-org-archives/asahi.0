Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9751B0F06
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547000; cv=none; b=PzWV5ghe/Wv2VX9Cv60ClVpUbAsQsXML+7VPt1+hw6n9PsMobdNnD+VTk3gO1B/4mu0mOT5Q+bWIH/2BmTvFN3y/CUU6YoLlZeT0Ves7H8y8OLo7RCDJQ9lYR2l7ZRJKkGCWaARdf+Wh6TxC9psZeExy3d6vDLJETti+2c1jxDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547000; c=relaxed/simple;
	bh=nzjB10c5MFrIbMQ5fSsvjDa9SRCVALQn1pK8pn1stnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zzbyp5qfzfCCbJ7NRgo58rmJMVs3LMCxGhXwtRPBB3A/A4biEK6U3XcZ4dya8ekQVn+xn233silh6bH0C7pLwuTiNFu0B7iBIDrDLRgjabgkMEtzDsAzh3R58DNI6ZYQqJbbTyQQX0Vw9mlJg8oL70vCNJnubg+m5eJuglIcmK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hevQ1vVm; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hevQ1vVm"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7250906bc63so918971b3a.1
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 07:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732546998; x=1733151798; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yfg/DccKnxi61QfwM43XV0/+/kR1JqIwdzMjek81aDI=;
        b=hevQ1vVmxuHu/9zsyEATokvblsKNF5OyAuLzGpwk4DzCi3pM9P7O+XT6bNeV/kTlrB
         EFj21GB0J8/9QnDuV2tm8f8hMy1py3MJDIyTj8U4Bt9LZN0ytc3Fu7oFB7JfZYwpUriB
         eQRoC0yJkwMtZDqj5ZpWQ8gxhR+Q0LyiKOzl3wl0YbbU+UlHGv+rv9MyxfpoAGVIDEel
         eMhkeC4KB5BgcmorVIVFXayhO7SR4n9wIZHFaOq1gm29KZx0JxDdmk9nOePvgWEjTVVL
         yxXkvck5Wc0hjyexZJ8qodAyL36S5tfi4bKdrF5wRSSZlRMl0wUYIx5RokwTn+1Z6Fey
         kLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732546998; x=1733151798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yfg/DccKnxi61QfwM43XV0/+/kR1JqIwdzMjek81aDI=;
        b=k8DLA42t4FFW6M+2f5W4Le2jfIS/kCNUjOfRB10ghSoieAvE30ohFN5IFTrFGe07gr
         jStDC86/ZxaKugL6qONqOfOWhqpyjRQ3vs7/RbTHusKdrgg+597kX5cyqOEsRpila6PI
         CtEg8/xQ7TqQtVL1FRqTjmf3LoSgCip+/FD/N/DT1p09M/4PGy/SbRSnLap/PVtQE+9C
         eQe6cqAdLuUCyUqzurXd/FqUs7y81Fo3ykAr4lp7sGt3xK0K1x/s8DcSjaoVq44F7iRY
         4SRU6RpZIyB7FNBMmltMtJM3l7BzbkMX4ddofVSWm3uPB7aH96LEpZ7InOaPfnk+D2ug
         3RAw==
X-Forwarded-Encrypted: i=1; AJvYcCWETuebseUbfbNQVfZ+xIim7cR9GXTaw+K/kEC4vO1txlo0bq5c6KDPYMOlWTwFJ0B+xb48Cw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDgGPo8OCPqutl69EPLdj2tyTXmPxHH0x1K/TGpTz7KRHqD505
	tow3tz0cHIXEuBYARcFYCdEoCG+VArDh6a4wlVo/3yrG2fFpPUNM
X-Gm-Gg: ASbGncubZdxCt+sQoQ+8WS7WBW5eK2vFcw3zvcimQtPUqiw5vgVWxkmAiUbNgK8nWeA
	9EU1sKNlBqUjTYe7KUwkxSU6L0/eEL8wDLCnuZgZ44nuJUXziJKu80lgiX01dAdK366gWIa73Y5
	EZBXgHDew5YULqtPl2jbnZO6QgLTCmrNdaif4VvJu58PKInqg0QBIncetB+ybCe2BeOVgBvf4Pd
	UuatPTc0Nclo3aSleKhjpE4YjVesVodz0zYJ5Sw8X98bQujbvX19D4NjR1okSPNnvNN
X-Google-Smtp-Source: AGHT+IHjE12H/V8uAi6iwwQjPB/2bgurIjFDNLyLcSpLqK6GVZz5bJq2Vpx8P1om4SM6YiL6JRFESg==
X-Received: by 2002:a05:6a00:b45:b0:724:db17:f975 with SMTP id d2e1a72fcca58-724de984d1bmr23000668b3a.12.1732546997897;
        Mon, 25 Nov 2024 07:03:17 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454aacsm6498521b3a.11.2024.11.25.07.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 07:03:17 -0800 (PST)
Message-ID: <3a6fb7fd-eb3d-428b-a37c-f04d81e7fbd0@gmail.com>
Date: Mon, 25 Nov 2024 23:03:11 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] gpu: drm: adp: Add a backlight driver for the Summit
 LCD
To: Krzysztof Kozlowski <krzk@kernel.org>, fnkl.kernel@gmail.com,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-3-3191d8e6e49a@gmail.com>
 <f2181c71-db23-4d94-9afb-cb8f2fc46bea@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <f2181c71-db23-4d94-9afb-cb8f2fc46bea@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 2024/11/25 晚上10:49 寫道:
> On 24/11/2024 23:29, Sasha Finkelstein via B4 Relay wrote:
>> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>>
>> This is the display panel used for the touchbar on laptops that have it.
> 
> 
> ...
> 
> 
>> +static int summit_probe(struct mipi_dsi_device *dsi)
>> +{
>> +	struct backlight_properties props = { 0 };
>> +	struct device *dev = &dsi->dev;
>> +	struct summit_data *panel;
>> +
>> +	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
>> +	if (!panel)
>> +		return -ENOMEM;
>> +
>> +	mipi_dsi_set_drvdata(dsi, panel);
>> +	panel->dsi = dsi;
>> +
>> +	int ret = device_property_read_u32(dev, "max-brightness", &props.max_brightness);
> That's an undocumented property, which suggests you did not test your DTS.

Actually, testing the DTS would not have caught this issue. For more
context,
all summit panels found in touch bar have a max brightness of 255, but the
summit panel in Apple A11 devices like the iPhone X is latter found to have
a max brightness of 2047.

However, A11 cannot be properly supported right now due to not having a
driver
for the DART IOMMU.

In the meantime, max-brightness could documented and be made required,
and the
default 255 brightness could be removed.

> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).
> 
> Best regards,
> Krzysztof

Nick Chan
