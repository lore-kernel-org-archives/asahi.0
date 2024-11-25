Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E81E502
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732549060; cv=none; b=iPLTkbh23yBacnM+MdMFX2LSF2FsGyYoaodSPwzKzkS2Ii+1qq6ncRdYoUeUTd0sFnwUGre/g1cbTOHv3wF47whcjb78aJ1hQqhscvTkU9Hp2I8UJkbS2189WWpnYAxKOiWtI3CIIFVOMHbaDNBF3mBhavas1gUYxj3AE0TurYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732549060; c=relaxed/simple;
	bh=G9neb+XkH6gOH+GosPEzMre6WvIqpGwyQ7NQSc5QvYU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VPJ5KzZwA4q9H8Le71twDS2r4HTtldmMasixLuCdHVLdZfCoAoN/SF/qdLGGnhxpExmCyW9KFc1yrbdulz+WjGG7567sXcQ6uwo9LtMfIpaOwiPEvYoPW2Vl1fT3vktnjpbLNxTVdq/UYkNj8WO4OVdhc9mIPOn9ULLBG3wa67Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EHbarfrj; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EHbarfrj"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53dd9e853ccso2573505e87.1
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732549056; x=1733153856; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Hg71u/nSxxdt/8mQpbUuh2Vaj/SF/MUnmwqWlHQVd0=;
        b=EHbarfrjtirKz2m5RD6usd7dtRcAP9xNJA6pIGaiKKy8R3jsnKyOnSGA7KZiBNW8Dk
         zcok2P7rIs59znIhQFBBCdcJJAhCP51c8zAj4ij8bx3PooVq/s5PYu3yzpyDYKbzjgWx
         Cpp7zYfHSV5KSRlB2Salte/0tQSFHxAlP8FlMW7SnnwSLsxV8AWSeLCYHRahLjLB80js
         3iWg1buaM/82uPAjPM0UukkVW1NaEajNHpw5fJpoJLSAc6STxho7CbwYzgbazpnwyN4m
         xz2d6t2e0FiomSv7KoS0TTCzOQxTdJifM373pH+1vC1tP9OtauiNKPHTP+V8h7EzyR84
         aNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732549056; x=1733153856;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3Hg71u/nSxxdt/8mQpbUuh2Vaj/SF/MUnmwqWlHQVd0=;
        b=jmfULS1m2KAKjoh1e1lCsg2A71l67NswIgkDRouSPQ7+rtcNNbqcXyIjltD2dPS+dz
         8uZACSZRYaJxL8P5wMA4oqrEdxSwbOOQz2JoarFxOwkgWqYwjy6X1H6UJKjqm30Hkp9Z
         SFj36oigcqFq9j3VlTHO/hznWsTZvfiYUnxjFP0e4WZRs+6GGH7iw6FURizJcZ8T/9Kw
         iav4F9QFOohl3ZVYjFU6v8UANCItcGS/7viiU1fHWQPYeJkDwU6ILvEtc+V9Sa3jdnzr
         Nd7LceOJrtGBq//T0tistJpKA9fRZ/+q2JJevQHFOoziy85+Xlr8LmKH+PeIFgkFNut4
         k7rg==
X-Forwarded-Encrypted: i=1; AJvYcCW402Oi1PHUTbxrwPkXBuAbDYal3ldpEMqum9LIiCGmFPYYppIBMTaLCf8oozBn9cCs3FPKhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwP1Dkx/9zD0bljHHwDk6IndemcVwozauxhbPYlzXk0lQ6A21k
	TgUjIbu2xU/pTezLyPGs93/bO/9pLJPAko3bKaWb9kcDAZ+FuSQ0X4Uvmt2k1nU=
X-Gm-Gg: ASbGncsa5V7VzSbqywCZsK8nQjkTjy4GxeJy7mOcoUoU1NpE+VhRw2KC+KhhC0nR4Vg
	fC36CcTAPRLIGwrXpRO1mEu80W6KUXVXrjlzldKAGiIGM18Ya6UA4X1aFYUGsPnnu18OFo9ANp+
	jOynSPG0lmCLrL/wHcgKQl6iYPYCr3wP6XLOVXNcDqqiyiQIWYpN2uuUv1Km6f2HnVFHiYr0NnL
	0oomzMTX8Qz/lE/fvRZ+frLMTsJ+LEBh5Z8iEyIVXRHrCR3XoX3+0lZn1WdQdmsPxdx44OYoxc6
	4mOu9Z3g45ydKPMUfFVWh0qSDTc=
X-Google-Smtp-Source: AGHT+IHmC/h4cTUnON85E6sO/QnQqtWoSOkY3lw5hIYTrZwaGeM/PrXuqTSpTpCW43QaBSIa3xvw0g==
X-Received: by 2002:a05:6512:1247:b0:53d:a9a4:7567 with SMTP id 2adb3069b0e04-53dd39b4f71mr6398723e87.48.1732549056577;
        Mon, 25 Nov 2024 07:37:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b? ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349ca82957sm66277205e9.33.2024.11.25.07.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 07:37:36 -0800 (PST)
Message-ID: <48f3bb08-a591-401c-bc0c-6af0506a1b1f@linaro.org>
Date: Mon, 25 Nov 2024 16:37:35 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: Hector Martin <marcan@marcan.st>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
 <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st>
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
In-Reply-To: <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hector,

On 25/11/2024 15:24, Hector Martin wrote:
> 
> 
> On 2024/11/25 20:24, Sasha Finkelstein wrote:
>> On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>
>>> So this controller only supports a single mode ???????
>>>
>> Most likely. On all devices it is connected to a single built-in display.
> 
> More specifically, the controller obviously supports multiple modes but
> it is pre-initialized by the bootloader for the single hardwired
> display's only mode. So as far as the driver is concerned, there is a
> single possible mode, and there's no point in trying to be more generic
> if there is no hardware that would use that.

I totally got the point, I just asked to slightly change the design to fit
the overall DRM/DSI/Panel architecture.

> 
> In general, it is not possible/practical to be generic for reverse
> engineered hardware with no specs documenting how to drive it
> generically. You just can't know how to implement the options that are
> never used in practice. I spent a lot of time on exceptions to this rule
> for the GPIO and SPI controllers, and that's not going to happen for
> more complex hardware like MIPI DSI.

I'm fine with the overall actual design since it's a special usecase
for a special display present on only a few SKUs.

Nevertheless, as Maxime expressed, you should still try to fit nicely
on the abstractions, or change the abstractions.

Neil

> 
> - Hector
> 

