Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7139B253323
	for <asahi@lists.linux.dev>; Mon,  3 Mar 2025 16:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741020521; cv=none; b=tK8SXu35Xu5OmRATVKrhfQXnvxkmnPOvVx8QV/RRpS7Q/8lmaZxMfxZpiboYGbA8BTKyUx+XCb2Fluvfvr4h/YBrSR8e5Yq0wWN7i+J8JEwjhLI0QT23Ak06sSbYK1P0k/0l1wmrtmR8hSz6sv2Y3J4zqTZJm52CJxCT/oHe5Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741020521; c=relaxed/simple;
	bh=aJqMJAxbF5oakbn+RwBrstMcyYPv8ZkAf+3b41SHUfs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qKwU/bRfWfmD3bWpAt4c0RZWknQlXMeRJOqQvrrQNxythkH58/RZK0k1NHI8cnmdaT8CblOStn+a/IgiOyhhBWRdBHIZUflarcMI0BP7cULf/JWLtjqoPHJJqNRpt6PD+PVnPsKUglRn+Jm71iVRfeqrFCoJboI4qezK/uX/pO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aemuGZiF; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aemuGZiF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43995b907cfso29933745e9.3
        for <asahi@lists.linux.dev>; Mon, 03 Mar 2025 08:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741020517; x=1741625317; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6twUH0//ksDRm2f064XsJv+UZF+J+plN/dZHzNZ8hs=;
        b=aemuGZiFvJwma0SlMxfFWXhXaBU7/CjgFqzvA2yT1bzN99SprL1+ZYhdDgxWCh7Jr0
         aTEkHQfZFmV3uXRCGZYXy+ZzLYQqP9a6iBEUXja76hKUcBPWRcX2ePY+xf7zExuescpx
         bpUgBzICQqWYeM+GB1+lOGMyhdXyy1BsEwhfjyAgi5dcyMLNmhmEZvzaRWkPPej6xoSu
         N8AjjPLPAI4ywMZL4KKn16poXfRtUPYozVvcJQmdi0gM19GX9Sf6niKJV3gSbhVe+gHc
         gvWnGF8jLPdCIKd3DKb4TlSrbNRLY/HuQd+YfpSOHtOr6dOqVESvILbng33v2iZoEop3
         AhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741020517; x=1741625317;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f6twUH0//ksDRm2f064XsJv+UZF+J+plN/dZHzNZ8hs=;
        b=v/rz8gOLkf50VGHmjp8X41hmL5vsn831Uj9lqDSSRZB6snBHlX2BSQg4Bf57vpl5g/
         9ZPdKxtbTrmEYIp634Z4I6YFYM91BSu4ug0uBMF3g7aHiOfvZh1n2zIM9ruAUrcuW/gV
         YqGMiH39MGPBfEB7FXh9uNPV4b6uHtt5VQaEMVy2oRlXcWnKg3hCta7+7XSgOS/Y0Fdz
         O8Ss4lav1JzeZR43BOXvCZUTxRFVhwbZYz73pvrCOzaLW71W8dE5xXm/nAZwj2/luaKq
         LbztmRIdWsITyPkt/BGAJAz8PWH+yvJBM1/LyDt9bMJrK+kVyv6rDGV9RgpHShfPI4Ia
         j5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWkYTRo2rUqtfyZa6GoyAROSBQfMCR3gGmLCgbUEJIbsQugZdYclx4MXgfvJOm5UBXBw3pcSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFHRo+DQCO4CnJ98/XMC7I1IS1mxsrEf23zUWXc3iX8aMsjPzu
	co0Dr0UC1CBTKW14N93IkRRnt3Jweo+E2EJz4of2SbNh4gaJy6284wfjcqZqh6A=
X-Gm-Gg: ASbGncsSIz0P/I1hO0QrDYfgrLUo5KsKxRyb6EtL8rlUM6O8OiMS4f9zJyUVOEHjRSj
	J2gjP5a0NmEoKGZ8qxuMpQzT+y94Cf3AnzUR1oVjD4y+b3kdj5br4AkWNwNFOhc5tRSodopHUdB
	2z1D28wrP2UmO59q4A0BqQcCE1P5nYXDENNMW/HaVN61y2EA5tFiF9mtYfjxtqJOOtADedLzAUB
	3ofFZqZAAiESxEf1xum6EDjUpF3wwl0/5y07LsrLiBAwdGfOllcflxxSWVgT+kVOfna5nAINPmH
	7EeMA3XgTrn8FfrWz/0YvR3sfQMtTPunUQl+2bWUATqBNKdYrM380JIyGm3C9q07uTrxEkKOQmg
	+a/a7ia/CQbVRTrYYElT6nQ==
X-Google-Smtp-Source: AGHT+IHuX0Dyyj2drftfOnysc3kce8KOWtX0dSt1AKvY/DMf+bm0V8XjPV4RbCnMrW3lKy8qr5E0yQ==
X-Received: by 2002:a05:600c:1387:b0:439:a138:20 with SMTP id 5b1f17b1804b1-43ba675d737mr105069055e9.20.1741020516721;
        Mon, 03 Mar 2025 08:48:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1c49:dea2:d749:5015? ([2a01:e0a:982:cbb0:1c49:dea2:d749:5015])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bbf2edf84sm52318185e9.40.2025.03.03.08.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:48:36 -0800 (PST)
Message-ID: <7a84f5fa-7128-4b51-8b05-e557e21663d8@linaro.org>
Date: Mon, 3 Mar 2025 17:48:35 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nick Chan <towinchenmi@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org> <Z8XcH7xoDC7TA7ZC@blossom>
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
In-Reply-To: <Z8XcH7xoDC7TA7ZC@blossom>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2025 17:43, Alyssa Rosenzweig wrote:
>>> Sasha Finkelstein (5):
>>>         dt-bindings: display: Add Apple pre-DCP display controller
>>>         drm: adp: Add Apple Display Pipe driver
>>>         drm: panel: Add a panel driver for the Summit display
>>>         arm64: dts: apple: Add touchbar screen nodes
>>>         MAINTAINERS: Add entries for touchbar display driver
>>>
>>>    .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
>>>    .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
>>>    .../bindings/display/panel/apple,summit.yaml       |  58 ++
>>>    MAINTAINERS                                        |  16 +
>>>    arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
>>>    arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
>>>    arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
>>>    arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
>>>    drivers/gpu/drm/Kconfig                            |   2 +
>>>    drivers/gpu/drm/Makefile                           |   1 +
>>>    drivers/gpu/drm/adp/Kconfig                        |  17 +
>>>    drivers/gpu/drm/adp/Makefile                       |   5 +
>>>    drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
>>>    drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++++++++
>>>    drivers/gpu/drm/panel/Kconfig                      |   9 +
>>>    drivers/gpu/drm/panel/Makefile                     |   1 +
>>>    drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
>>>    17 files changed, 1489 insertions(+)
>>> ---
>>> base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
>>> change-id: 20241124-adpdrm-25fce3dd8a71
>>>
>>>
>>
>> All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?
> 
> I'm planning to do so today, just need to get dim setup first :)

Nice, go ahead then !

Neil
