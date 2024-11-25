Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF9F17D378
	for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732540573; cv=none; b=tfQplaA5bjsq0z0vYT72Lemeda1S87z9NqEARayBAhLlkWLKlF1JCxtOrLjgIpaqtf7KgAXkTVzS2/XxRP6IzlRmIOafTk5Hn/HCNX06dzTle0NH7MCpbOfBXHAODppGE4vyjNz3e0GnPKHibKM0Et2oBo8S6cSd8ejHsi2Gomo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732540573; c=relaxed/simple;
	bh=gsKd3hb9ZCLyyPW+gu43DBldlrCV1evqec/JECaRSZ4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Rm3el5w2f1LaQJ21CyjPjyNKWyIP6J5a7Ey8rO5pktPSv9tDEn58/mCeYD5Y+JfCAqnkxYfGfOtzq9YtyIcJqLoeev7Q1bKofEJOvZuOxZ9NEQeMEyc+QH1FIvuGaHRQQ2G6dp6kRwJ1ErJnAWHORco1aQQbrRx56rTFUetPvxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WAQ6VOlZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WAQ6VOlZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38242abf421so2966481f8f.2
        for <asahi@lists.linux.dev>; Mon, 25 Nov 2024 05:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732540570; x=1733145370; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rNSe8A4X72eX+krq9irFan2BInCT8GLtodoqFddP0BY=;
        b=WAQ6VOlZZNBMBN0AUE6k1dJQiD6xc5FWoXhx0AmqDkxfDI5BLbgjLjbJhAWboWKwkG
         DZTY53ndhzCCI5R4gNdeR5DWw4fycZ40UBVA2MnJM0C0xkDd9Sbq6fjM8oJ3VjjL0vlo
         IhFBr9us4l0n69cZwGvqUiyFh62LbF6JxlV9ac54RpuIRsm98E800msmabwpZaK3w0Vk
         iLcSDCVOe0FUTwUL+vq1r3Dt095ea4770V7OyvtxyAbjnPfbrxyVva6Ce05XGzIRAucd
         Ljuvf9XGfskjnMjt24ZPTZAgKsDeCiYv5Nkraw2Ek+30QQb1Lh3ZrZToeTS161BiWMfK
         uF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732540570; x=1733145370;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rNSe8A4X72eX+krq9irFan2BInCT8GLtodoqFddP0BY=;
        b=EYrVJhqIKTFUIsu9+T6WjuKCvJ5QNmhUgpaq+dNcY5Y+0NfkaHHQWmgDJg4XjNP+FC
         m13Uihl3nZ+FAVlrla+80qlbHDYdOqNJwuXWYdQTtwwg31QJZPOsIZVIvbeLVcd+H/Jv
         DUkZYG8qLXd3e2DegrO7fq6nx+ITA3qcrpdtyaneYL8rSFpvGdies95BFw3qtb3UF5pb
         +TLydQnzN65E6y580jfa/BoBzBe2G9u/+GH2KuDc6bLTnAioUxOojouZDhvfY7LqRgxU
         eP4VTJNNNJgjCwZeealHNABweZiQAojhOE/WKnMf/z22ZN9oEgZQx7N1S7n2erPcDJep
         Rcsw==
X-Forwarded-Encrypted: i=1; AJvYcCXXkuxUV0fjzq2/stNIclEUmmBVTPL3L50rmkC+dJdQj6B8lNXo2wJLmbTAgzDr8lwN2PH7Yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YymNwYLueMP8rpUmD6gts2jsXwaD/mDm5E/AFETV48pzwz+M9nC
	7816rtPRn4McmQpQjXaN7eBsUdgq6uoYw9lZV/fd9RPvlDGQLRv6JtyWaDdbjew=
X-Gm-Gg: ASbGnctmmy/sTDI7lSNFaFTRM3h1SCwH0BJ+v0Uw6evnb8Y4obH55eGnl5Z1dN/khQt
	PDpwWLtw5nyAjjmLUo5jQiH3A6Pv3vo9obww63AHtboyOcGSJhvPyrd8/p+OafcVqmvi/KOyfh0
	tnAVdHj4awmQpVg8bxLASfgaq79qUDEXZebvUTAfG74YYTJC/T2RugKwoiNoDER/tVwCvrrAu6i
	qHXSKVMqFJY4lBPXhkpGIm1qeRummUalXtphwqDcQA/33gl9G86Xl4cDURsKVYcy54mjtU3vYRw
	hmcpIReVHJmsZDGQrgHYBu6jSWI=
X-Google-Smtp-Source: AGHT+IEW90vTWXzKP0+A5/PY4aSbYc0IFzHeJgOYo0pEkGOlAkr3IdZEHYei+L9Azyi/uj4duLGLyA==
X-Received: by 2002:a05:6000:2102:b0:382:3419:46e6 with SMTP id ffacd0b85a97d-38260be1efcmr8739174f8f.52.1732540569999;
        Mon, 25 Nov 2024 05:16:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b? ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad60c3sm10632716f8f.2.2024.11.25.05.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 05:16:09 -0800 (PST)
Message-ID: <81e46854-13e1-426f-8e0c-549a36ab5b3d@linaro.org>
Date: Mon, 25 Nov 2024 14:16:08 +0100
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
 <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
 <CAMT+MTS3Nmy=RzsE4wUf=jHBsu8ghyyqpXWPyB8qoR+W3EUscw@mail.gmail.com>
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
In-Reply-To: <CAMT+MTS3Nmy=RzsE4wUf=jHBsu8ghyyqpXWPyB8qoR+W3EUscw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/11/2024 14:14, Sasha Finkelstein wrote:
> On Mon, 25 Nov 2024 at 13:57, <neil.armstrong@linaro.org> wrote:
>>
>> On 25/11/2024 12:24, Sasha Finkelstein wrote:
>>> On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>
>>>> So this controller only supports a single mode ???????
>>>>
>>> Most likely. On all devices it is connected to a single built-in display.
>>>
>>> Ack on all other changes, will be fixed for v2.
>>
>> OK, so instead make the panel driver return this single mode
>> and from the display driver just filter out anything that's
>> not ADP_SCREEN_VSIZE & ADP_SCREEN_HSIZE.
> 
> Not sure i follow, you want the mode hardcoded in the panel driver
> and the controller driver to fetch and return that?

Yes, like a classic panel driver.

Neil
