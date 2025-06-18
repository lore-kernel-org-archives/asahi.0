Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16CF2E9EDA
	for <asahi@lists.linux.dev>; Wed, 18 Jun 2025 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254179; cv=none; b=RjC41zlXd7wWRPWVkvfkCC8Jgc0nVbjj5xWPLrCgxURltLz4f1pojqvzfmh+pU+WMFEQOHwjIKYQ67LRMQf7ZoBFo49TAWUQewgFqvRHHuQZRdie3jBzClYRR4xH/c+Z+BhOi/mWzEWdZqoI084OD/mN58558uKgt4pr9FZXnCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254179; c=relaxed/simple;
	bh=0mUwlorZack9EZTeWHONLuPTPCVraK6g7EJxQmCJnQg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ox+USF1RW2B772v8aJ7aCEH4Y3jMEZYP3jj+V1L/FciNuCz0C07zLAtfwhvblt4bq4sAAtRh9eQXbujFhMM3WPZ6sUDt9JX0rwj9pA+TH91As/GxTDfJkahvDBnKInbPVIBsrjYV22oZvxSKBIH660jxWPjij4Q6VJIEAM6e9EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N2L07ZHS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2L07ZHS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso56586065e9.2
        for <asahi@lists.linux.dev>; Wed, 18 Jun 2025 06:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750254176; x=1750858976; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nCiChb1QXFLYp+J+syrxrTXK706oTK1XE1OYkmW6jPo=;
        b=N2L07ZHSXBLikJ95xYoD6rNO55zVoyoVTYhz2qdoFAeEnzlpFn44dnSSz2sjkiJi26
         JOfSOcJXWBxuKHpFkDRIVEI3pE7ecdCXC6+Ulmuzxhv9FzprI19hmDq6EHFK2extDSYZ
         8A9AHZ14sA5uYcm9X1UYml/+KccPucxv45k8wDAArUHj7KjZH0gNtvBeJp2UQLtRkVVu
         b3jfzDaLJwEsQ+m9gnJhqgzj3fZd/JO6JUEly+3kNse6gXBlKC45P3HhDCHITNUxBec5
         Nlehz21y+qwvmtC8qK8NyUnt8eyXiz/4uo9Hx06Rc57fnlBrBasKe9AbTenjRtFxBhWZ
         kemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254176; x=1750858976;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nCiChb1QXFLYp+J+syrxrTXK706oTK1XE1OYkmW6jPo=;
        b=mP5A75oEOxXDDbJYYId6sHx8Q45OVzVcB5HlwwQ2Qd+lkNhpY8bHnIMFtKMaYrAsE3
         /OYMkIj4FbdUbZBYvQ100fC5BqIwGrQ7sTZs7E7lCJzefTg1ER1TLN5aEV91PE04LRul
         gu1LU5dQEyy/LC3v6HQqQkhIH9ykeWFXHYSvgS0rtcOR2eBEjKHiMZf4hw7ILadgPidR
         jll02tg3q3TNkYG8DmpRPS7xpfnJpFsjEfHOUkQ2G7MxVZYqFxz8v/tHvZc7ZrbZB6na
         dGfa/HShKQ6PhoZP6IMpRJJ0nsXAcbtIWKCu84tpVSq9vkfMkl73FMvUToJe5GCOuse7
         vDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp3ESBlBEJmQUFu5JlnhQ/mH/0aKS/hDdlVLaWxdCEDGAKMX6hQCB6DMFZEn3L9S9CxGactg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxm3/12eAPQvERcoOA2tZxbzJp5nbXvNnCyFKJKRe1tSertl+h
	H1s7tvtsYKoNQTcNbyAH4OUfbd7swBvZhRBP8x6HIVrbHUmDVMB9qxP0gZ4d/vcVA8o=
X-Gm-Gg: ASbGncuIOa/MB94HLi2yfn+Cq6l+gX/l6pRucXqiS5tu6oYSVjXLLFLiMQmedQHe71g
	Ou5gPv4jfuRZKRd89bYPKkuiVxQD0TVf554pTNpZYl04goX7lFVB2+mjrTXxjwXrh975W8vjLOA
	+T9m3Xig9tp2nij4GJbfZsZ4Zp42ra9SE2ANjc9yJ5Q5xslTQW2rcNvDGLkHPQi3uR4lQPKFjOV
	1xudyn0vlOd2tLd8MX6X8aObtiq0KcnsbUfT9w+j2BIfmAXN4IQVkNMVHbXLkxKno5Qr5J8ojN1
	7vwkovXeD7o7qADTNk6KZEQ6x6dbdQZfKweZaeJg29kE16WQwgGZbCWXYx4+pGqbYyAedJFsXBN
	1Q/y7+u3qZmSTw2LwJ/LIDv/uoZxSWSPGDj/l
X-Google-Smtp-Source: AGHT+IFYjXSzI2dMaGAAgqsOrkzwB1KxP63uuJ7AOWNd44e2f4HlRrKeC45xFQOdkM6Iz1JDQ6qBiA==
X-Received: by 2002:a05:600c:4e02:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-4533caaeb57mr147595075e9.21.1750254175671;
        Wed, 18 Jun 2025 06:42:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7a29:d3c:4dad:4edf? ([2a01:e0a:3d9:2080:7a29:d3c:4dad:4edf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b1bc97sm17087804f8f.68.2025.06.18.06.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 06:42:55 -0700 (PDT)
Message-ID: <87908c15-5527-46ca-8fef-481a6f3d67c8@linaro.org>
Date: Wed, 18 Jun 2025 15:42:54 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 03/12] drm/panel: panel-samsung-s6e88a0-ams427ap24:
 Include <linux/of.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, jessica.zhang@oss.qualcomm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io,
 neal@gompa.dev, deller@gmx.de, support.opensource@diasemi.com,
 duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20250618122436.379013-1-tzimmermann@suse.de>
 <20250618122436.379013-4-tzimmermann@suse.de>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250618122436.379013-4-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/06/2025 14:16, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare device_property_read_bool(). Avoids
> dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> index e91f50662997..b6d04f8ad561 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
> @@ -8,6 +8,7 @@
>   #include <linux/delay.h>
>   #include <linux/gpio/consumer.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/regulator/consumer.h>
>   
>   #include <video/mipi_display.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
