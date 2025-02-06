Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0DA225A44
	for <asahi@lists.linux.dev>; Thu,  6 Feb 2025 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850808; cv=none; b=E6/uWOd93ccmpyqCOtYcKbGpRiXmLc0t31hdz/b5dsmwzxIRys2xDBZJgrp/zElO9SN6jaOMrVfleglW4IAb8dd8wB2NmYpy6+8ad124wy2+wstBZEIdfdeWF16hCx9EgpMxNGeJpzeGw0yT1KlxT90XGVTfdzxfUGrv8hLQC6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850808; c=relaxed/simple;
	bh=yiQpEUUwSTm4e6W3Qc3jdzTRP9AgBOi8N0L7b2wts3A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bUZu6NMy+Ijk/DDWXDgY5Szf6hjwqv85OPtyDRpaeBiJzpZUZFRC9wbfiv+MDf35fViorSuR5rNGAyEF5s3qEhNNCcvMdk5X3Qa//wx/vO4Z4TM0dWiuovPx3qmog0GwWRFAxk+/jgYShecvh70jftoKDtmkaPVzIAdqMgR+x/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F8mMDL7E; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F8mMDL7E"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43634b570c1so6687985e9.0
        for <asahi@lists.linux.dev>; Thu, 06 Feb 2025 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738850804; x=1739455604; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QrTw0kr9iB/h7ScWcHM4VQywDsutpu1is2zOnROeCPc=;
        b=F8mMDL7EB/YZ1TarrhdJSmjRJ3TrPwyLrjRuzcbUqUutyavpk6L5MzPj3XqgHDYTEQ
         eKdvX30KxNyHULafQOPDORFvLXrXRL2RrY9VET+nWgkR51SZLzRTgA01Pc9Wg7bxqa3L
         v6wfq1RN0FjHiTw9wKx4O98Z+CHe6VzG9Zjph3OYJFt7VyUull4u/5fKwkUnJ080Vscn
         71lZF5pn62v2XVBRDABaXN/ZZxV0bB4SfS3ZZguzTyyf8eOvs7H2qem6r5Jd6lLzUHrp
         FU6MYpdkI264XVNEPDmXl50OESyA8a362XPPx7mrIdOwdYq7TJ5TL/4pBQ4ommB6ppkz
         bz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738850804; x=1739455604;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QrTw0kr9iB/h7ScWcHM4VQywDsutpu1is2zOnROeCPc=;
        b=X5Pe4zlOpBsyB65nq45r8VvScd8BnSmVOqH4C78htrcSpDdeC7nMtBsHu/YKWk1Og0
         bF1HyMERv3ro7t3qjALmc47yJ9UehMsrf+Lfy4G/Q/XhH9hvmrAgGFqb3uQZvSQZi2OB
         XREV0Il+TrzO+aL73SbBrxRMuEXWr8TSD52SE55jVy2rOQDd9sJNnthPobA913FpWlAk
         x8WGSXuG5gW7/Sjtolp4zf/bydjDfhQ9WtmwDshQ4WE0T8AfOjuGPOYqXCoMppzSNMZ4
         uxfgTb6xc9zngfwSLAcVebF1ZU87HBNmC4sJsV4NC3h4buKyrr3awbyDx6rkF4GNDGFh
         2ebw==
X-Forwarded-Encrypted: i=1; AJvYcCWv2Gc0xqjDzHEK7T41la5zQBHeae8JnysEz9wJMsOD9bqeLWbqsCO3O6kKuyBat2WR8bh2ag==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXryFPFX9xKrW9ZM884Uu0J3lpG8BlfoPs+Seg4C2cLcbr3yMB
	fgVpK5uTkesJRng0ZHaEl5/r7rKC9ewazjGyFI4iMO4szrKTfMDezYja5VHtd2c=
X-Gm-Gg: ASbGncu5N3CuX3yOvd6W1WXlCFQRZHxsl6BKqAtcbbcpNePpDmnGLKfQaf4azL4/hJ4
	e7oLEKpxf5XIydZVeanlBdxyH5mmdH8RJLg7nQyFl0bosRAElvH+CGClnUlc9Re30Y6W2ZpDzFd
	9VWkzf3V0p/bPRgq6VL9N/lLcXDdwGVVPVgUpakIH0/JbjqMrfh/tzBpZd8Xzq/VtbHv2lwYsLo
	pT//1RHCR9QlXNOkvXbGUdBGGUnKbyQCo9v357AyBSJKJm+qXB44SjMdYyEWgzSim0EooHfvn6W
	kQtl7tV7fxwEFtZcNBm+yZa/32fdQxq5qVnpBSgiRX6ARXdgegF9NYOrWzscCKVLPYbx
X-Google-Smtp-Source: AGHT+IHs1VOvbH74HBC3VcwOcN7MOCMT0bodbdljyOmjoFYNhPQCucKzp9v30TbevBnlEmQ683kP3g==
X-Received: by 2002:a05:600c:5254:b0:438:a913:a99 with SMTP id 5b1f17b1804b1-4390d5b2fa8mr64022775e9.31.1738850803080;
        Thu, 06 Feb 2025 06:06:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6? ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf6e4a4bsm1444844f8f.92.2025.02.06.06.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:06:42 -0800 (PST)
Message-ID: <cd9b99b0-0a63-4c6c-8064-e48f98fa7c02@linaro.org>
Date: Thu, 6 Feb 2025 15:06:41 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v6 5/5] MAINTAINERS: Add entries for touchbar display
 driver
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>
References: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
 <20250206-adpdrm-v6-5-c8ab9348b853@gmail.com>
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
In-Reply-To: <20250206-adpdrm-v6-5-c8ab9348b853@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2025 15:01, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add the MAINTAINERS entries for the driver
> 
> Acked-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>   MAINTAINERS | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a87ddad78e26f28ffd0f3433560d6db1518f9f95..895d682bcf4e351971b04c6515ebf685fd39b662 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7746,6 +7746,22 @@ F:	drivers/gpu/host1x/
>   F:	include/linux/host1x.h
>   F:	include/uapi/drm/tegra_drm.h
>   
> +DRM DRIVERS FOR PRE-DCP APPLE DISPLAY OUTPUT
> +M:	Sasha Finkelstein <fnkl.kernel@gmail.com>
> +R:	Janne Grunau <j@jannau.net>
> +L:	dri-devel@lists.freedesktop.org
> +L:	asahi@lists.linux.dev
> +S:	Maintained
> +W:	https://asahilinux.org
> +B:	https://github.com/AsahiLinux/linux/issues
> +C:	irc://irc.oftc.net/asahi-dev
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
> +F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
> +F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
> +F:	drivers/gpu/drm/adp/
> +F:	drivers/gpu/drm/panel/panel-summit.c
> +
>   DRM DRIVERS FOR RENESAS R-CAR
>   M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>   M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
