Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699906;
	b=Lz9Xmkzw76km9MPmLcR8nzTd86NRvg1HUORTV2x9KyumnFz/mzaDlnqpZNPRxHET9vFU
	 WLzUFqkItGjWlgklRBGlV53HXTqQA3PJS6db4OkhBtzAJW51OjQvughLyBNWPl4DYXGds
	 N3KY+tTOO/fUtD6huif9O5XLG7DnD5tLO1wO9iXBw5J9nHnCrlAdvm62dIQr3AH3sdXTI
	 QJd+UaG5VdqlN6bEkOP08JL7hXtiGDlpZuHd/cstRn5LnAM4WxbbxfskBH5TrM7SVzopd
	 H/L4UKcZpoMryl9yYt+sOl5FmKl21CX/bHkCQX1lF1aPankJ7Trc6ittEEt1AiOiVSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=o1l0ybp/wLFt/F4zJKLBbBtJhS+ZACVIUqUnoSjbmw8=;
	b=Zskhn7eF9V6/GI37O7IfN/zb4DHAuXw7AaMoWPeFUTJ6EhGGEhsoIZh06eWnxvgdfEIy
	 DTDQ4yTJzHiIwQKnaYIF/uMPL/kZPQbFoMNIizjHGFNUyNQJtx/W+47/GUnfrKgsLX33a
	 LjxIBw+2AAy9SFNAaAlzUHGD9Pq3uTC4XD7OMwkCDeXEN7aY9uJHlLnOTddLUjRO5hFFe
	 t3N8f8XP0kdtE6CXcU9U061aJawZZpwkQH7Cr+YAZrg5ofdaLJok4edh4wiMgUAxzaERf
	 SyDLAHa4N996au5YjtCXUqgm1MQgcyDTiIopCDsldnQ0efm1WQyGi5ahV98KCYweAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=If19epZm;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAC9606D81F
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 09:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AAC9606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=If19epZm
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3481340f8f.2
        for <asahi@lists.linux.dev>; Tue, 03 Nov 2026 01:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793699903; x=1794304703; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1l0ybp/wLFt/F4zJKLBbBtJhS+ZACVIUqUnoSjbmw8=;
        b=If19epZm1metcqZVGSPqzE+1UtMbwi6aN5QByoQ4sEiKKHylV3ATSjZrjAOUAANOl/
         SN2A4s08i1My3C0aYPjp9hqJVK0VCdViwjtK2P7hVJGZYNmUZCL81FlgWlPardlL9Q+K
         gIflKgnEiAOAwb72JUEyJJUvOkbxAFd6LK6CAm2Jny2HTxouKXjrY0vC+R1c31VUSglQ
         g3KuPqhTfUS2gXZdbPSWAZoIAbA+AEe3y60CCX8f0gt7Hg9KNuCANvgRqY0wRuW/7MjI
         Cuxvrlrnf1SwdHZwY4HESbynF/C+i/7YxfJuJSmhvk0fg42pXPKKPJWMXABfTscwDqJF
         PZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699903; x=1794304703;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1l0ybp/wLFt/F4zJKLBbBtJhS+ZACVIUqUnoSjbmw8=;
        b=CxieUTpxsv2exrXO03oiJL7mjHbDuB3hV8JiGDvpuQRsMBDXYS6Gg9jNoZR+OEGGfJ
         zKXbT79YoCs6b0WBUybiGyzZzY/VerpKE6r94dh3aOeOND8VIY1qUQtuFvJCiG9K0pb6
         nWZoS17zIF7qYbFga10QFUNr2uMfubrV7sP2ribwgmYbpeuM2/oASxgA8jhhAbcOtlq9
         J9xwOhRMWFllvrd7YSBKuQJcELxVQjAWkKGqTER2FkEoNzlUN4aXmMF0RrTgWgeEr6Ps
         IXxStrGzCRxZ+eM3tDHH6oUCEMpOV+UGIjvPvN+sd0IS0IipCJiut3TPaxRWoJW+xpht
         M+8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzRVVg+/3u2GwDTkJYaZj8XfX5Gto+tR1mZPGsQdxYq2ahNKPudMQ0zNA1TDPnHFQ+SzY6gQg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9y+zLaxoiGxV6U7w0Vsb78NnRsSamyWTVp/T5w/825Tz+m9Kwa
	bwQlFrWaxis/vNl7Irna12/8XXgvwVMTGshCmRdnU7yG/s+1PNAOMD2AouWK2pHzbfg=
X-Gm-Gg: AYBFou23pWj36pVcBB4VuwE4uJQm/ETxpz7FzNbMnhgspO7Y8rSO5YIcCvYMRr4cKDz
	ohQ+Mdh8pZX/l991tduP9B/ee54LTc60Vng0Yh48XlnuGdCAgkfQTHsJydXZTyzYdLtMcNdeAmn
	R6KKpE0j+36kOOTfutJPtO8k6fMGIHXjgN3iZNcIcylQRQiMdpFBRN08QDuMFDsRB/4/dNAduxB
	d99YJQsqqN//TAGzzb6zBZjo6fKqQ4lMh3Oun5LvsN9NiFdiBqt8zRGc4YtaXUESXJ8C80FNs1R
	ESwj1QVdHR7CxYAtzZF+LhxEOut0c2/XeWqZLEh6NphwMSFJUipG5UmDRXuSHR8G3156Cz1BMpG
	QstvVkG8QEaXqPOfpIDka1tYIIC+EGyQUPcW42m4A3YKkCQtjIvGvJZFmdMWBd6wDS4Jju/Erjx
	Iw17XTJHSELWAul3SUDMJNjtziwHUKf7RzQWE7Bbygy0VeMKYkX7/Cy6UJi310qNuzJClDX8xxF
	8Eufzis5uXA32bO5YMjaKQzUUWXUwoJ/nbB9WF9SuXPFvkNSa9/08DjrV2c/O8BdGCYhSMNRL2C
	i6UaBPynL56smH/qQKQQkAaMtiZWCfvSAaWGAhEuQDig7IYZ4NbYHq7eLCS6GS4mWk4oY2KJDUQ
	0auT3WF0=
X-Received: by 2002:a05:6000:2b0e:b0:48d:eae3:b9df with SMTP id ffacd0b85a97d-48e6e50c88bmr21777860f8f.35.1793699903396;
        Tue, 03 Nov 2026 01:58:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:95a2:4869:9f46:45f0? ([2a01:e0a:106d:1080:95a2:4869:9f46:45f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm22710550f8f.15.2026.11.03.01.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 01:58:22 -0800 (PST)
Message-ID: <cf6437a4-b7ee-4b4b-acd2-bac3ea3f14fa@linaro.org>
Date: Tue, 3 Nov 2026 10:58:22 +0100
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] Input: goodix-berlin - set default resolution before
 parsing properties
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Hans de Goede <hansg@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Val Packett <val@packett.cool>, Hendrik Noack <hendrik-noack@gmx.de>,
 Ferass El Hafidi <funderscore@postmarketos.org>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-input@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
 <20261103044708.2461481-4-dmitry.torokhov@gmail.com>
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
In-Reply-To: <20261103044708.2461481-4-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 05:47, Dmitry Torokhov wrote:
> goodix_berlin_input_dev_config() currently configures the default
> 10 units/mm resolution on ABS_MT_POSITION_X and ABS_MT_POSITION_Y after
> calling touchscreen_parse_properties(). This unconditionally overwrites
> any axis resolution calculated by touchscreen_parse_properties() from
> touchscreen-x-mm and touchscreen-y-mm device properties.
> 
> Set the default resolution before calling touchscreen_parse_properties()
> so the default resolution remains in place when physical dimensions are
> not specified, while allowing touchscreen-x-mm and touchscreen-y-mm to
> override it when present.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>   drivers/input/touchscreen/goodix_berlin_core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> index b0938a4f3fec..5cf453427eeb 100644
> --- a/drivers/input/touchscreen/goodix_berlin_core.c
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -626,8 +626,6 @@ static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
>   			     0, SZ_64K - 1, 0, 0);
>   	input_set_abs_params(cd->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
>   
> -	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
> -
>   	/*
>   	 * The resolution of these touchscreens is about 10 units/mm, the actual
>   	 * resolution does not matter much since we set INPUT_PROP_DIRECT.
> @@ -636,6 +634,8 @@ static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
>   	input_abs_set_res(cd->input_dev, ABS_MT_POSITION_X, 10);
>   	input_abs_set_res(cd->input_dev, ABS_MT_POSITION_Y, 10);
>   
> +	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
> +
>   	error = input_mt_init_slots(cd->input_dev, GOODIX_BERLIN_MAX_TOUCH,
>   				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
>   	if (error)

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
