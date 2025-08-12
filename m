Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3697A2E0B58
	for <asahi@lists.linux.dev>; Tue, 12 Aug 2025 08:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986506; cv=none; b=HskejtJb4PC26sCbDxnbi1b6R4aqMjj/rB1D3SvfAT0Na6/p3eTqFT+mgvwKTBvJXu+AenDl5Zy3FGnYsnwf5Po4U38c3mkR906hm7P/vFsWkOLQWef90IFoigWKLnL+hvBo3NUh9jz+YTrPSnQ8qZvEsolM/4jOME4V51AMOM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986506; c=relaxed/simple;
	bh=PD5TYtOpndJ0SVLaWPblaJGuvinPUhzRxy+WmVYTuqE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uvTTCUrBIblcVze5Lnt/pZLIoLRQvpDPJs9O+D4meDQshD3mJ0h7p65dMn8kCV675eI7bG1gEe5hCijbefjC2woxiVenO3dC8UHsMs1l1CLvR9mXvB1rG2zb9QszdgJtofKzrVV3GD/mgh49OZ0JZJ4gpzctzohAvDtB1HvJzZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e9LBuCwu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e9LBuCwu"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-459e210bd2dso18104095e9.1
        for <asahi@lists.linux.dev>; Tue, 12 Aug 2025 01:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754986502; x=1755591302; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pN57oXTQNN+kWgs2rlbAODPtdDkSVmlBgQUqiBVeU2s=;
        b=e9LBuCwuXLXRjpCMkl7IgUYEyOrwvMyCaAD7BKVlBQZMpGGvCjXEE/p4VjPpnoZxeP
         0j/NSzpsooyRqiKUP7rG1GkngJ2JB9FvVzO5YG0gkvlT+C4SRhteNdaa/YqOwiB6RUU5
         LYareYJT04vcLXQGNvhnoDPK0Jv11zN8uLKQOYRh3bBDs9JWS7VnM8VW9mK5sZ3KuyJt
         3uPATHtZ7WLgDoMmuMUDoWbKYl1WOgjXRHHjPH0lUwF8wX1vbwfX3Nrv106VPLCjWOHr
         2SdUa6gJuy0LzPyHG+Hx/aE4xavSj5J3I7QmlDEVW68anzwYYvN3wQuKnZpsBPgzQtCd
         39SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754986502; x=1755591302;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pN57oXTQNN+kWgs2rlbAODPtdDkSVmlBgQUqiBVeU2s=;
        b=vYu8mcYJwNAhiFDqJAvkhFk36RZaPuX4oMrsSTGWLrnjTh1l37eTmBTjkPq9CJR16G
         Dds7GW8Tv2kSLJ4VQ4T3oqG5oDZNTHF3RgqUwKA29Byk44fl+kAejPpLv3rXjoHjOXiX
         Cpgl93mUsroZpp7C+Vg7KtOGDRXXCtihZtsiLy7AgsthP4IGBgSnTCrj2ilMXXMX0xIX
         g7lDAoWle1/vZEeF78mDp1ZiyYozZXltCzsXxq64ph6TRPRuNEKUSJk2fjwsMWUEoR+5
         AEi0CkwKLXKqL4Apa2pNAA259+jdaqORmixWv/c3gMcjVbdJhvJG+vrSVEwl5xSXfSwc
         VHmg==
X-Forwarded-Encrypted: i=1; AJvYcCWemxOYLeeS2xKtTc/aveP08LLxsfsOj23djH/3Zyk7K73pNdrT6hyVMl67cjzBF9hl4lTNyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVqmd/2+VLaszgjn+2B12okzoNjFieFHJBjm9JeRbWXjuCEy5J
	mktI2k9OTw3/2u1EuGgo+bO7my3b0FzPrCEKCMIAR+Om0vQZI9RnkGWHQBoK8x6iVls=
X-Gm-Gg: ASbGnct5vjWYe0e4AA4jOoPQcLGauSM51p+zKif84N5N6K/ZsBC7LsuyW7I00ao2bno
	DmQeZ0wqYOQMGcezZLO1NQFtyBJ2sD6lamNI+W5use/hk+7xdTKuLXRPqK6FXroqj6U5ydVHfz9
	h8zK9j70Ni9J4e+Kqox/WAZwWbLyl0yrdxIf4QJnT+u9TJkqwuovnWmV4uRkccsKuzVe0bUF+aH
	dJpBcwcZm31e2bIx8QOr1u78JhlazVWlm9c9Sr5jj86yBu8l+8lndpkEaxc0rjTJj8rl6jThrXV
	PqRSCOXDkA4KBPR9r17a2CTCW2fVa/pDBF5W6ppvbQPXLJdqh5gVtmHQYLVFZTx+7mNtY6PiuWl
	GZ61avuxm4VlrwqfL4rVUqRatcCNMdnzjVxOAYc0ksW6DDcsTmJXbY0oll08POQpqT4whv7W5Nr
	s=
X-Google-Smtp-Source: AGHT+IGgL3yyDAPzmefnqKSQ970dNNvT0Hxvtv7jPpY0F6pR5ILZMIzabFQsn92mA6VAuKY5oUkySA==
X-Received: by 2002:a05:6000:310f:b0:3b7:775d:e923 with SMTP id ffacd0b85a97d-3b91113c85emr1895776f8f.4.1754986502258;
        Tue, 12 Aug 2025 01:15:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:9086:bd36:16a7:1f8b? ([2a01:e0a:3d9:2080:9086:bd36:16a7:1f8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e585586esm303982875e9.13.2025.08.12.01.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 01:15:01 -0700 (PDT)
Message-ID: <787d1e5d-dd4a-4bb4-b224-588ad132a9f1@linaro.org>
Date: Tue, 12 Aug 2025 10:15:01 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: panel-summit: Include <linux/property.h> and
 <linux/mod_devicetable.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, fnkl.kernel@gmail.com,
 j@jannau.net, jessica.zhang@oss.qualcomm.com, robh@kernel.org
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev
References: <20250812081118.221103-1-tzimmermann@suse.de>
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
In-Reply-To: <20250812081118.221103-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2025 10:10, Thomas Zimmermann wrote:
> Include <linux/property.h> to declare device_property_read_u32() and
> <linux/mod_devicetable.h> to declare struct of_device_id. Avoids the
> dependency on the backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
> Based on an earlier patch reviewed at [1].
> 
> [1] https://patchwork.freedesktop.org/patch/664115/?series=150454&rev=3
> ---
>   drivers/gpu/drm/panel/panel-summit.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel/panel-summit.c
> index 4854437e2899..6d40b9ddfe02 100644
> --- a/drivers/gpu/drm/panel/panel-summit.c
> +++ b/drivers/gpu/drm/panel/panel-summit.c
> @@ -1,6 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   
>   #include <linux/backlight.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/property.h>
>   #include <drm/drm_device.h>
>   #include <drm/drm_mipi_dsi.h>
>   #include <drm/drm_mode.h>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
