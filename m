Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBF1190472
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 09:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526669; cv=none; b=eYvL7enTqpb4RmsPcSvGLnYZyNjN8RULowaEuvCfSnZm6VY8TGkBi3ifhTckLaCejOH7jziiOmjrLO/8pBu1yWo2W+wz5ZY07DdoqMsBLbKqQCnUNza9bLA1RxQx9MltZOtQ5E5kI9HC8KRIms4T9r04PBsC0kmXZwPiFKFxRc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526669; c=relaxed/simple;
	bh=dFAwG0pk25WHHBGzk3B7O450dnKjPQyykPlvZ7p/+cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u46HOUPtTcmz5NO9hW21A6aqYhC7/2fj3pQjlTyP66d/KhkWkv4sNuN//oDvNOAJFprf4zBZp8rqHoHJclqAjNXxs4YiER/lEn4mjAL/WqgcYt4TYJITsWVdrObx3LpPorOZNWH66h0PiVAgsgAU/5mIUsF6Q7B0wvoi8Jvhzzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjjC9tt8; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjjC9tt8"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-724e5fb3f9dso2137360b3a.3
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 01:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732526668; x=1733131468; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GH47thgLGLAwhEyFYzkW0bapLRnqQvS6F+hSbhzlTX4=;
        b=gjjC9tt8+7lN0YxlmIdk++9GPXcgS5XljQw2u31aPVl/L6pLHT1c+Zept9Iz4/O+/v
         VODZ3dEKNKvVKwv8buvFFyimfwbtbKUIw7+PwbpARfnF++Gw0FsBgoJETAtvK9DUhQBU
         ps2khC2JB1m+IgihC4JzcZqbHUVElAY81/1b3gSPFwlrOaLRot+bsMUv5/YTmnK0kqQh
         gywUuKx2YooY9b+ANgm/UpXQu2frxgqHb2f50Bf2r6w4OivkiwynRVsCSDLTc5mOQoQX
         Plmonbcq8umx1YV3R+zEoRy5UgK2hWHVrvhM57hfX+gb0Oi8cqt9o4gT5AzRlJxM1arK
         mggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732526668; x=1733131468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GH47thgLGLAwhEyFYzkW0bapLRnqQvS6F+hSbhzlTX4=;
        b=l5ihD0TphCWmaNPvVy15e9uO4ZawZPugyEDteB3UYNRhRKleNOzHBAHvLBq+rMHWJt
         XszFOx3vvPEFzT4+8CUZ6brDFvr3zt+xAdcxfHV8d6OjVFsJmZEmeMqbpyLNR9G/KzJ1
         ZztwPlKhsanY+/+9/wGONqcWfg1B9QRdqTWkwNMfAdDj+NosbHjtnATmLIB3Yl3Bx+Fx
         TPzTzh2/N0dpqro6etwOSb6e9JZSDxMbXMMpi9g3BzdW0h4832Kf0LFo53Hm7p7Ghswa
         HgNtR5JnGu0g3PZEu8cBU/Nhsotzk86rfXBKTVNn+AvMKQVg3hVkFstiu4QPRnFT6Htz
         M3HA==
X-Forwarded-Encrypted: i=1; AJvYcCVZLzAwCg+E5GXLUIIYFXjPYf005ZK5qWmRHowZO7UHspXqAGBQ9mIaytqfPxOWwubao6Zudg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaGLKP9qp8AR1FcrFpC66YbDJ5M6ATLdUYlGre3BDaPl1heZ77
	ivyDsBemPt3JoDHcNpBHO2u4AW2DGHjIg6VLL5369+A1HuiGDZD9
X-Gm-Gg: ASbGnctrfrSXKVexCHRxybUJom1x7ib2xOWbniQxhiWJRqlq0CKv2bvBeFNcPOzVz9z
	J5E3Wn5WezxPmvClJEVLiKcY7hSZIpgKITj3AomrdviJedg5YHy5PChG9fkS4r2nUtty8pRqXVC
	qwLvkgadALzZrOAkuYkNwvu0Cg56NamRzqP/H+MNECgQVu+zdPn2sgW+n+yK9MeCR3wZh9ZMLP5
	vgoCcOXFdk0lS3G7/o1krB2B3u4VKzEN5JffjLMI5PobiItRPdbD07diwklfkXjLOMO
X-Google-Smtp-Source: AGHT+IGH/2hu7Jr9H6sYJsbkLS36GY64EFbufco7FimN9lRF0ny00OASpXVX5qeXHk77eHloKg29MQ==
X-Received: by 2002:a05:6a00:a8f:b0:71e:410:4764 with SMTP id d2e1a72fcca58-724df5d453fmr19361348b3a.8.1732526667715;
        Mon, 25 Nov 2024 01:24:27 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de5762b4sm5950940b3a.179.2024.11.25.01.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 01:24:27 -0800 (PST)
Message-ID: <54759f1f-2575-4e84-b351-119cefed2b17@gmail.com>
Date: Mon, 25 Nov 2024 17:24:22 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] MAINTAINERS: Add entries for touchbar display driver
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
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
 <20241124-adpdrm-v1-5-3191d8e6e49a@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-5-3191d8e6e49a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Sasha Finkelstein via B4 Relay 於 2024/11/25 早上6:29 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add the MAINTAINERS entries for the driver
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e7f0170977013889ca7c39b17727ba36d32e92dc..1964bb705cae0b0f12e2174fc96c5cd123d31520 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2164,6 +2164,7 @@ F:	Documentation/devicetree/bindings/arm/apple.yaml
>  F:	Documentation/devicetree/bindings/arm/apple/*
>  F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> +F:	Documentation/devicetree/bindings/display/apple,display-pipe.yaml

Missing F:
Documentation/devicetree/bindings/display/panel/apple,summit.yaml
>  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
>  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
> @@ -2183,6 +2184,7 @@ F:	drivers/bluetooth/hci_bcm4377.c
>  F:	drivers/clk/clk-apple-nco.c
>  F:	drivers/cpufreq/apple-soc-cpufreq.c
>  F:	drivers/dma/apple-admac.c
> +F:	drivers/gpu/drm/adp/
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c
> 

Nick Chan
