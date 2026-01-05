Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54516254AFF
	for <asahi@lists.linux.dev>; Mon,  5 Jan 2026 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626903; cv=none; b=L7QQYn3N3TU+12CKIbVMY/g4Tn9T4yCdQuQjivNgm8TH+EH3q0FVlEeNlPwYoEAOEGbIJHrBI2okW0V0fRbOarKR1kHq+VViwYoEYYbCsrMW70g1eLgqQerPmCIU68bsLAtY8XruAKT665CDd2sWEe7m1BegpUk5DZkrEtcZ0qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626903; c=relaxed/simple;
	bh=elxpgA/6+H5G8eJucP1DeZ9FjE+Wn3AhrEJK8CWxi/Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=n7pIUsWgq8EYjMstC+GfVYnh6Sf7zLCVIwcCQXuYhTjaTAXKvUknTVyAvaI9XK7Svuk0pmu1YMFq0N1kwe5qaxK4dYE6r4LG4y8pegadrFdlXQKO2ClQ6Kzwwe6oVqjuk1ObhES4BASGmdjwiq7QkwsZr8bNnRVo36bPMG6RoOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MuJt3ES6; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MuJt3ES6"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so488445e9.0
        for <asahi@lists.linux.dev>; Mon, 05 Jan 2026 07:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767626900; x=1768231700; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JiUuiG11sjb3RVF8qKsN43KHgfxfg8lfjAm8EVRs7z8=;
        b=MuJt3ES6xYQhAu+waFjjqd0rPmvyZHz+gqqbOIprYJyDTST5pCWPQkwFrHVQUH1gx5
         kbaK2daBqV9FMGS+2o71UJUPSPQ5p6PPC1qY5kgsLe5aOfrT8+m+puVIKXMVwS9RO5qr
         yuLRDbubT+Usa2rf26RBNu8fVMQL6u4d45F3yFCXOY/eAEC0UM+h+Pua6Z5lmy+JRC2l
         ajI6M5HbIbjKm6jWsHoe7Q/t8vxYK6V06VqRq8nF6H5YNLwRnz3l9eG2lHRCMT42soqe
         nvUOlZInUlypO/zsduf0YfdXggoXNx3ioZdnLtrsDfyTJHgSbOro7L9FbdoFkrsHmy9o
         GMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626900; x=1768231700;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JiUuiG11sjb3RVF8qKsN43KHgfxfg8lfjAm8EVRs7z8=;
        b=dgMQM6uHcLxftqtZX6xA1MuFcocPeHZ85nCCoXcY2CKwNO78+wz98Tug0kNp/mgEKT
         mByKXJ+y0NV8AwOMgRtNPhNsyqFXexoRkAGIk95ArloSyCPUomRj7vkZCpx+5GPyCpzk
         S4RKnlUr82rUdVGE98MDs/4ozCscq8sM26DxrNbTGj819C2JvHs0H6rDlFWQJWw1yolT
         IlPZFimsI5ws5GUff6UIHgD4nmuFX+c9UvhYlj6xrqjuxj/ZvoJv3LOMkgiop0xFmrt5
         G1ma/VL54+R6LrcUzC9PTFIluoTd6MEmcVwhCmhuGJ5YK+fSyf0MYLF8Lcbhv/u8rWPA
         Seyw==
X-Gm-Message-State: AOJu0YzQCTUT0FiPRKpGgLlWzE0+iqyO8NS5TIqRdVGasxMaIYl5mWc5
	ag31BBntfnOJOqvSHRYmikcQCDyKzo9WXgewHTOczNXFcRU+KG8qN3tQ8LKZ32WUcUo=
X-Gm-Gg: AY/fxX60O5C/3OHh1hcwLkEI1HuhXCUWl7Pi1K7KRMVBhzt6vhEWND+Whv5nKT6Qxcp
	uS/qeuOWB+AA1PUGKIOgztP+rEmZIXXQ6OO1Iae6hfiJJnmHyoWnJtEw/qjP7bwe1hTSaAmeigd
	/sUkpzu8UWnR2Sw71QKiOsU51N/jey17OfJbOSQwgr3wx9EsE+PdOTqTqFZG1cTEwhVxeI5cjpI
	9I6WV1TS6eVTh9YU5A2+7wRWREujGA+8JZMlpP1AFcgczOvJ/0OxRYRrkNN/JufK+I51hw/zk/E
	e426Qp25zElpnuALIfn0Cu/UkPnTb7jJQH/1vpJQy+vmOQPoVVMUrI70B6Rgdo6nMx1WcomDpBs
	UBojdAxS2DB7k1ZVGilmogV49bdCwuaLJYjK3MFTqtp4JNEjxh2WsfyQV+SGahAM5R2lP8WARTF
	gcDtg4H32lniGUk0+okm/aWhwfCdQpboLXToIFJASGCzNZsJG5k2luy7+QWKU/UEc=
X-Google-Smtp-Source: AGHT+IFE8e5sC3B0bF5zrvpWL/oFWYMQNfCjja3Nw/1swqUnOWasg9DxOhRiNiaKDKikllRi6k1+zQ==
X-Received: by 2002:a05:600c:a0d:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-47d34de634cmr534951085e9.12.1767626899465;
        Mon, 05 Jan 2026 07:28:19 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d4c1:5589:eadb:1033? ([2a01:e0a:3d9:2080:d4c1:5589:eadb:1033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452c69sm198773955e9.9.2026.01.05.07.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 07:28:19 -0800 (PST)
Message-ID: <b671ca2c-1fb1-4c4f-b0af-45dd33402b0c@linaro.org>
Date: Mon, 5 Jan 2026 16:28:18 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH next v2] phy: apple: atc: Actually check return value of
 devm_apple_tunable_parse
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Glanzmann <thomas@glanzmann.de>
References: <20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org>
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
In-Reply-To: <20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/4/26 22:56, Sven Peter wrote:
> Let's actually check the return value of devm_apple_tunable_parse
> instead of trying to check IS_ERR on a pointer to the return value which
> is always going to be valid. This prevent a oops when the tunables are
> invalid or when they don't exist:
> 
> [   57.664567] Unable to handle kernel paging request at virtual address fffffffffffffffe
> [   57.664584] Mem abort info:
> [   57.664589]   ESR = 0x0000000096000007
> [   57.664595]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   57.664602]   SET = 0, FnV = 0
> [   57.664607]   EA = 0, S1PTW = 0
> [   57.664611]   FSC = 0x07: level 3 translation fault
> [   57.664617] Data abort info:
> [   57.664621]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
> [   57.664626]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   57.664631]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   57.664640] swapper pgtable: 16k pages, 47-bit VAs, pgdp=0000000b4391c000
> [   57.664647] [fffffffffffffffe] pgd=0000000000000000, p4d=0000000000000000, pud=0000000b44188403, pmd=0000000b4418c403, pte=0000000000000000
> [   57.664670] Internal error: Oops: 0000000096000007 [#1]  SMP
> [   57.665047] CPU: 1 UID: 0 PID: 23 Comm: kworker/1:0 Tainted: G S                  6.18.2+ #2 PREEMPTLAZY
> [   57.665061] Tainted: [S]=CPU_OUT_OF_SPEC
> [   57.665066] Hardware name: Apple Mac mini (M1, 2020) (DT)
> [   57.665072] Workqueue: events cd321x_update_work [tps6598x]
> [   57.665100] pstate: 61400009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [   57.665111] pc : apple_tunable_apply+0x8/0x80 [apple_tunable]
> [   57.665121] lr : atcphy_mux_set+0x3e0/0x1138 [phy_apple_atc]
> [   57.665133] sp : ffffc000802a7c00
> [   57.665138] x29: ffffc000802a7c00 x28: 0000000000000003 x27: ffff800016c84080
> [   57.665151] x26: 0000000000000002 x25: ffff800016c84090 x24: ffff800016c8408f
> [   57.665163] x23: 0000000000020004 x22: 0000000000000001 x21: 0000000000000006
> [   57.665175] x20: ffff80000d6da9b0 x19: ffff80000d6da880 x18: 0000000000000002
> [   57.665188] x17: 0000000000000000 x16: ffffe22de59e0e38 x15: 0000000000000002
> [   57.665199] x14: ffffe22de76ecff8 x13: 0000000000000001 x12: ffff9dd5f90bc000
> [   57.665211] x11: 00000000000000c0 x10: 048abc15ceba0919 x9 : ffffe22dbc5fde10
> [   57.665223] x8 : ffff80000175e0d8 x7 : 0000000000000004 x6 : 0000000000000000
> [   57.665234] x5 : 0000000000000001 x4 : 0000000d6d132db7 x3 : 00000000000155db
> [   57.665246] x2 : 0000000000000000 x1 : fffffffffffffffe x0 : ffffc00082b80000
> [   57.665258] Call trace:
> [   57.665265]  apple_tunable_apply+0x8/0x80 [apple_tunable] (P)
> [   57.665276]  typec_mux_set+0x74/0xe0 [typec]
> [   57.665315]  cd321x_update_work+0x440/0x8c0 [tps6598x]
> [   57.665332]  process_one_work+0x178/0x3d0
> [   57.665346]  worker_thread+0x260/0x390
> [   57.665354]  kthread+0x150/0x250
> [   57.665369]  ret_from_fork+0x10/0x20
> [   57.665386] Code: e69a0ae8 ffffe22d aa1e03e9 d503201f (f9400022)
> [   57.665394] ---[ end trace 0000000000000000 ]---
> 
> Reported-by: Thomas Glanzmann <thomas@glanzmann.de>
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Changes in v2:
> - Copy/paste error: Copied a WARN instead of the kernel oops this patch fixes
> - Link to v1: https://patch.msgid.link/20260104-atcphy-tunable-fix-v1-1-40bf00feaac0@kernel.org
> ---
>   drivers/phy/apple/atc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index c8a58ee64b7aad3205df51cf16ae778471ad2c5d..716c1e70de38ca604803739fedaa543d91f7501b 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -2178,10 +2178,10 @@ static int atcphy_load_tunables(struct apple_atcphy *atcphy)
>   	for (int i = 0; i < ARRAY_SIZE(tunables); i++) {
>   		*tunables[i].tunable = devm_apple_tunable_parse(
>   			atcphy->dev, atcphy->np, tunables[i].dt_name, tunables[i].res);
> -		if (IS_ERR(tunables[i].tunable)) {
> +		if (IS_ERR(*tunables[i].tunable)) {
>   			dev_err(atcphy->dev, "Failed to read tunable %s: %ld\n",
> -				tunables[i].dt_name, PTR_ERR(tunables[i].tunable));
> -			return PTR_ERR(tunables[i].tunable);
> +				tunables[i].dt_name, PTR_ERR(*tunables[i].tunable));
> +			return PTR_ERR(*tunables[i].tunable);
>   		}
>   	}
>   
> 
> ---
> base-commit: add66a6673bc4aacd0ef0f3c4a51271501770b17
> change-id: 20260104-atcphy-tunable-fix-517826d6fefd
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
