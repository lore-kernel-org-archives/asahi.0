Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC68489FCE
	for <asahi@lists.linux.dev>; Thu, 10 Sep 2026 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789044284; cv=none; b=VAmEcRfSqs71Db2/R2Z9xsnHzyquLI6miv6ksJ9LdC8q9ekFEiosgoq6p6fz2LOTt4W5o6fK4nVFxiobcnNbHg8gtN+Tx/XeyH2ijPgurlbtk0oHJA3WghzCMF9fLG+PmdEV/FkQrevRIxguDvLWHqCvweO2UKZOFcmiSI+8F4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789044284; c=relaxed/simple;
	bh=B83JOxLfGvc5ZfCVljGYWlrnSXInMv0HqlDG1Z1IrN8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AOg7gbYmJ6287UWj86E3fzzllryi8nM9UChEiPr8YCCnbohzO/UbLK9ohfijuuC7Ji7dQp7oVp8EOhgSoo/MPHG8DQB7vJpFU7TwP2AotBtVzVLLBqBnyS++rdXpbEqO4vsv6FMs5Dy0Pci14WZnhRIjDdUeA4wtrMXw9ZDXEMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HQB1/9sM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HQB1/9sM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so69162725e9.2
        for <asahi@lists.linux.dev>; Thu, 10 Sep 2026 05:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789044280; x=1789649080; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlLd0MTwxSZ1tg0QA5irkz4aMwQ9l7oCIbDKUgF0cJc=;
        b=HQB1/9sMzzQxiIAqP9T4jQYxuqaIPgEifcbXJ9Q5Y7XBJTOq6p/Peg7v7cQB5v4nsN
         iL8RMh1CJ1gfvhJq2z0z+r0RGZPpUZZpnMdYAdk7T6V8b7tsN92kOenH/tm2FizlSxYe
         ypk7chxgtTLiwA60PYHoU3cblGbUI2f3q1FLY93ugKTooEFuFRG20fWUvq7v2IqAXwRB
         Rf/Lf3NvolzNk+yvnYBVgt1CaaTHf8H/fFTdfqWll2UxSDe7+WLmZh1M1Ih1dvCIFm2m
         jhLW6HBBTS0MuLNjNfbM/p0krkBDx+t7M0VuMZrGF40SeydjUuczQGbsLO1vCtNRCEAL
         cP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789044280; x=1789649080;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlLd0MTwxSZ1tg0QA5irkz4aMwQ9l7oCIbDKUgF0cJc=;
        b=E6qArxySWkvqD2AFy9R7dbRDUb6ck5LRQhdQZ214vN1w8gfAl6C6Lz2mUrOfcb83vU
         teAUFIDzNTwAaIMU7pPqy3/hWx8nYANNTl4cgdSl6hHioVwQVFR9GD2Ghn3XIC+VRmOU
         fI0ZjlhssAoKsLPe5xgk4sdS5f+H0ndSTCdUfiZqlTTBjGkocDKVf4YNb9qMreip89W8
         APOobH17NBRREIMwrbMotgvW4nIQ+UUH0H5L0NrW4ncdZ9lkDKl2UVSeCAKKzfjhdV1k
         ol/KAI5w7fz2lxtTsuLcX54xth3jyExL8nMkX/N70yW4AhhW3/jhnyfWcVL7qIaBL/mV
         d9Ig==
X-Gm-Message-State: AFuF++lK3UP3VjqI1UIFkObs+7OeBXKJ2g67ZWB45TEDeZfyREc02Qdz
	ublka9FpjQryLgZBzn9T+DduQXJcRC4tODa3taBTxL3XHwQL12RYl5eypViic/zzfo7CeSaOBp1
	/PGmt
X-Gm-Gg: AYBFou3wNZiIxWZm5jnwmMwzxgSOFH5qSnivMObEuq8wDhn+R+CZ3cyYnxD24/eykzg
	MwEwgX86ssC6KpcQxv+mzD/Dk3uThckppna5eUqQB7eSzGKKLX/j+/pKtQrR3S74v8KkJBEug9J
	sbZo2hMbcThEQ0s0IkWh7u6oPZUg2h8WL7AW8UFrncpfM16E7Dkb/k5xDsO+nXbk9E6f/YPdVbR
	s7K0iyDGHNpiwk1prVfavHD5Zmtu5hjft+jeK7cha653FuXWOVDCz9SlZQbnFXhal02r/gv7+CU
	7nMKvqZ24jay+1AKTdaBBK7oDNN+UG2VFyq7e1ghGYNBqcUXKWE8P3V1gNLsWtxKpVH9FRjDOp0
	ji7RtUnIRAAzRGmGGko5lRcn+p59la0TsqE8GqlkkYSTpHW1NUzi/RVs+Bagol7+OXHECj/vc2h
	Hz83DHzy7xvwMJ5BjK0X7jCiJ5iKGnmu9ysIMqa8MPfL3YyRXrk+PojjKzGReoQoYdo+4Zda2Kv
	Tb/lwlwDe0GAjy9H8sa5/SKg8R3W+bNOIZz5b2uvTsKDer0HAnaeYoYmxRewLnF
X-Received: by 2002:a05:600c:4fc3:b0:49d:16f1:94a5 with SMTP id 5b1f17b1804b1-49d16f19576mr196399525e9.25.1789044280431;
        Thu, 10 Sep 2026 05:44:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:edd1:1b07:ea07:35f2? ([2a01:e0a:106d:1080:edd1:1b07:ea07:35f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm81314925e9.7.2026.09.10.05.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 05:44:40 -0700 (PDT)
Message-ID: <6a3f39b8-d063-44d9-97f2-9b74fb06870e@linaro.org>
Date: Thu, 10 Sep 2026 14:44:38 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] Apple NVMe fixes for macOS 15+ firmware / M4 support
To: Janne Grunau <j@jannau.net>, u-boot@lists.u-boot-project.org
Cc: asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Sven Peter <sven@kernel.org>, Bin Meng <bmeng.cn@gmail.com>,
 Tom Rini <trini@konsulko.com>, Francois Berder <fberder@outlook.fr>
References: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
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
In-Reply-To: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mark,

On 9/4/26 21:22, Janne Grunau wrote:
> Hej,
> 
> this series adapts Sven's Linux nvme-apple series of the same name to
> u-boot. It fixes bugs which are worked around on M1/M2/M3 based devices
> with NVMe firmware from macOS 14.x or earlier. Starting with the NVMe
> controller firmware from macOS 15.x (required for M4 support) the
> workaround is no longer available.
> 
> The quirk to require page-aligned buffers for the admin queue is not
> necessary for u-boot. As far as I can see the buffers are always
> page-aligned. Add noisy WARN_ON_ONCEs to ensure it's noticed if this
> changes or I was mistaken to begin with.

Do you want to pick those changes or should I route them via the NVMe custodian ?

Thanks,
Neil

> 
> Janne
> 
> Link: https://lore.kernel.org/asahi/20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org/
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (4):
>        nvme: apple: Don't set a DMA direction for commands without a data transfer
>        nvme: apple: Never set the opcode in the NVMMU TCB
>        nvme: apple: Add WARN_ON_ONCE for non page-aligned admin queue buffers
>        nvme: apple: Drop the PRP null check chicken bit
> 
>   drivers/nvme/nvme_apple.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> ---
> base-commit: 964ad5b5c91b7be56e443e899d7f873e6aa8c9fc
> change-id: 20260904-apple-nvme-fwabi-cf74f7cefac4
> 
> Best regards,

