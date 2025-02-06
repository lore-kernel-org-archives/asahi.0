Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DD522578B
	for <asahi@lists.linux.dev>; Thu,  6 Feb 2025 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828455; cv=none; b=jRRrbTTmFE7v4iHLwS4lY83cf8n5PFq/rqGWJir8HYYtlxUefiiN862YNIEYKSMRCITQkezCESxOWKZruf3w8wmQH56CzFYT39zdmZ6zb4AYcOOW9JdlEuHoh1MqMoQUsVj2LzM4W8Yk2IMc6rE+L7/XSFywIeNqRrgc3ZupqPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828455; c=relaxed/simple;
	bh=Y9WC87bLe5NehjYOXZdbt0lMGSd6u5imi7raAGHmnlI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BYjUcBnZo2E+a/5pE3hCce18TV00J/BDraWdaUaNG3Br7jgM8xu/duiT7bWQV3QvRV6hQ4Up9gg6CB3MPrEl52NfXOs7Cs00SqWWIKPMAWGmzYCMR3M4LGMf2TKQAzlB6DtM+N9BpO4C/eQjE+/po5/zqxU1u8relPK4tYknKUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qDHnr+Pc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qDHnr+Pc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso2878445e9.1
        for <asahi@lists.linux.dev>; Wed, 05 Feb 2025 23:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738828449; x=1739433249; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+U3GhEYNSJGMFlCgGumTWq6/ff6zdU5LVaoQovoEL0=;
        b=qDHnr+Pc1Ht4dwIMoyASIfuUKTZQ9rmV2dSw1bq3CngoBQskREw/C0YHp/A/ZPZikO
         8n4nwZ5LyJlSUSNNvAvNzri0AdOkQDGPiWGptXHujozdqWq00xcthTMSq5V28PemfA12
         vEAET4W09UZc70Y4LhsGstJ4ZVyOWOrZJuJ+HFdUkSnpBN5JOG71xN/Flfx2cEqmhTTZ
         m5rV1Z6/5ekyPYs9vmgXOiqHO8UFu7xP93Bvck3S4SqQ3EZkAX8vXFocwmSWfysnKL0Q
         +S3qs4xa6u0tyEBhtdUKpiw8RfygRZz1KW0UtxMmx7I604n+12RBrTyph3/NGZmlG045
         ViPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738828449; x=1739433249;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q+U3GhEYNSJGMFlCgGumTWq6/ff6zdU5LVaoQovoEL0=;
        b=uSO0KNdkyzXQdWQYf1Mqf0ZX5QCeiCBp9LDF6OBzHHmgORd+9M6eyllcy84Qlg7gyt
         OajkNjpnhtKGpql0XHHxsgJOeLz3ok8LDMgnrLnFpa8zWQoREfzRZFhab7GmOYoACbv3
         l6f5jf+Y519brcTUaMEFX0PK5P2hUb4630+mAksaEzx3IAIdtrrxElRZdMmcvB8FTsOL
         g1VW+4t3uvdxWi9AaahqfebViOiAHjN2uJZNlR0bpoeTJEg73CeDdkXh+OE/xpQq3hkV
         mFqA1ewZbhhBsItTdd0O+8ImXtXwW9nqKNcY5lGOKDeDwyDiXjGTGFh7EJVxnVKVZ6Ja
         ABtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5mC0XyW4HZRLvtw7lK11KB8s2ukDhw2p6JQA42xCp9W+pGp21RKXEvj/0dOCQB4YiIptlXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfDZCIi+J4CWb7ePpTZlkTXADspIG9wbQLWMnWjIy6tP2RzbMw
	0oSGx/kvwjDz7gzLoTBTzwplXmtq3BaQ0+Pd3A4uvbAW5X78tXcdrGrukJCuNkc=
X-Gm-Gg: ASbGncteFAkIyjLDxfPcAXyyYr5ddgBQxlvFe6VcE95RzGXefzNvuh0RJU+KD+zN9QK
	S1pzas8YKmSgqyhvpdsDjfw/dW6bl3j2YKGXTIc5bQkiVGVIx4nJvBJLHv8efdjIo4djxcN9+gK
	0TZZ0+bS+VorNkEGbSbSdcnni5QU02hkNsPBJxLVNMYp0J2Rdk0p4h79E228JhzdlDDjnjhoTSb
	49wMMOYARxb/uX4cNnfBQ3nnP0QELROaEebzMbYrUnXlN+6AAM4BLFYVkVOAorYVQe4p/iRRrcB
	BfA/ggjr/RmwI+QCCowMKRGmXCWL9pVov5dJtlaQwS6S3+YFUYdQ1vIcE0TidTfixzNm
X-Google-Smtp-Source: AGHT+IGrzW1LdzySmLH3XUvU+ruX4SLesnotJf/9MZ7S4Ul1OkUGYV9PvZdjXAlQoh8a/JyV5GRRkQ==
X-Received: by 2002:a05:600c:4703:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-43912d1510emr13458025e9.6.1738828448157;
        Wed, 05 Feb 2025 23:54:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6? ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc050d688sm522181f8f.24.2025.02.05.23.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 23:54:07 -0800 (PST)
Message-ID: <9db01455-f3e9-474b-b87a-30f934ff6a02@linaro.org>
Date: Thu, 6 Feb 2025 08:54:06 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 0/5] Driver for pre-DCP apple display controller.
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alyssa Ross <hi@alyssa.is>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Janne Grunau <j@jannau.net>, Nick Chan <towinchenmi@gmail.com>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
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
In-Reply-To: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2025 23:10, Sasha Finkelstein via B4 Relay wrote:
> Hi.
> 
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

LGTM should patches 1, 2, 3 & 5 go via drm-misc ?

Neil
