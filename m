Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54496199947
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732539477; cv=none; b=NCxXkr0dTvIIsMpr9JtXZWvPf4CZJcTtzfpiDvTvE4a8jdBprbvflV80bpSWSa/6W7df+ViPJBcNFXWePQlrV7nKaYQ6ac6ytovAVMNO6L5VlFyw4ov+r10WDgqPFL5DPFqqfMnJ3LWTRcZ3iqTQ+jL4jVa5ccuj6+OQbKhrkQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732539477; c=relaxed/simple;
	bh=NmAtDEeeHIbvNgfXMeLVH7ObwbLrSZk2z7XkoWcaSms=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tkpoTGoURQ2L/N9DW0z8KO+5+i9aVT5oTsp1EfyVssZPS0bmS4ATVzS3+6CwF6xPqWzotKgKMlf3vxuFrQ47rIScUYyI4fzqBFlxWNUiCldckgJlrthA9KtcRomfhQDMO7l4umq8/0rm2q5AV3CoFMfpyDLOmkrsZxr+NqKoUy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N3lUK+qU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N3lUK+qU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a1833367so2925085e9.1
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 04:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732539474; x=1733144274; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK/o3FUGaKRZErsXHi8EyRs052osGciSWNJJ6Un26Ds=;
        b=N3lUK+qUM3FxdKEG+bWCFRJyAG0e4PNpfa1zgQitismFJBQYhexce82GOZw7dHwxUI
         GBm0ngb1ZLzUdK7ErTWACIqq3zfguJOfiBiwuGFTnqmktDrMucnmqrNGSy/PTMmnGZEA
         ls4y1SK/cP6fiHgLF/CBoM2FEaWkb/ocRc/bm0f41F11dMpVbs3Qs1vaqEB3p14e/6jD
         GZ/osxR88Hqy3o424Hij1agICUX6Sms0lVhu1iTBu9kZ9AP4dhGaUaB9Yx52eidCCync
         3SJbbnZua8AxN1cHyE9m2Lh5HC0exFppsFDeaHTbUPGfolY606qXVdFNfwmAfe+cxE3n
         RXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732539474; x=1733144274;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LK/o3FUGaKRZErsXHi8EyRs052osGciSWNJJ6Un26Ds=;
        b=eD5gxUK9Aq+jt1025MbAgg9rqv9yufvPE7v4uMhOnIaeikpECQpqJjlI44KUJFxfZY
         qJzpdpT4E4dgvrzti6mWaexhZw9/wiWbiR6rqZKkNO+B37dvayMY48M3HKq6M3tZMVSQ
         xDADPp/+Wnby1gHxMvx3lCqcsAJtGS/HMBbG/8qGEheCjisxkVr52qfdlP6Zy8v0Lkux
         j9O7y8zPbWMxxGbj1ZW29+VBT2YNaLf79pochLFo4XsE3ugTZNK3IB+Uwgujoyu+zT82
         yML8+kww4eCxiMmx1q8MfSGXGdkZE0Vf+L4a3Riz6K0gMGKKYe+wQgI840S8gBXlzy9R
         SZqg==
X-Forwarded-Encrypted: i=1; AJvYcCVwAy6GASehL+71TEVpm8+2n2JomWXFwA/PDPfPGd8k+b/LqUdR1VhhwNR85dHWvR50pChtOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWH17yDEfeDQGweYCnojN/1LgT4pVmsvel5IUSWqn1BuabKACi
	Rtb8k5jD+2dPlYLu0Kz9hzgAYDx9x8AjvWwos7Pc5Ow2eMhKfVcU8WO9TzlU78k=
X-Gm-Gg: ASbGncuZ3qsBeTLk6Gau2iqI4V41qaqTLoD5XOC+Zm5N8Me4PCwZr1btxcCnqnw0yog
	2+Sm5IRpym9nrMuRBGWrHhPpt6Kc+CIdTUlug9aUd8FahoekpgC9UUXgNm0MWSGMQvELhojQfJF
	ORqiJdz2+QDHizf7RY3jqdTrw2f+z7pc2QTlC7/7QcAhLoXoGd+OyNceitxXX92eEq3BcUiDdVY
	M7vtAmpnZQHqfXmSSdeq2ryYl/NU0Zl344nIBeelBc6u6pdEbnycVRC+QWVtX0Rrn3pcuVoAL0K
	leU1Ox8qn8OfE/3tCor5Jaiyyao=
X-Google-Smtp-Source: AGHT+IHp9ZbYEEuOqvzmzN9bYFgBoyUQCliRxucIR2i6oG6nzBgRHtwS7cuLaCKRHjn/8s+t8OKggQ==
X-Received: by 2002:a05:600c:1e1e:b0:42c:b603:422 with SMTP id 5b1f17b1804b1-433cdb0b504mr101998665e9.8.1732539473751;
        Mon, 25 Nov 2024 04:57:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b? ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349dc19fd3sm52076065e9.39.2024.11.25.04.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 04:57:53 -0800 (PST)
Message-ID: <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
Date: Mon, 25 Nov 2024 13:57:52 +0100
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
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org>
 <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
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
In-Reply-To: <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2024 12:24, Sasha Finkelstein wrote:
> On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> So this controller only supports a single mode ???????
>>
> Most likely. On all devices it is connected to a single built-in display.
> 
> Ack on all other changes, will be fixed for v2.

OK, so instead make the panel driver return this single mode
and from the display driver just filter out anything that's
not ADP_SCREEN_VSIZE & ADP_SCREEN_HSIZE.

Neil
