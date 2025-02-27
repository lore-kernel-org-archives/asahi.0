Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629D41EB44
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740660341; cv=none; b=F8RsXNa6Dnssl9e7IsbVHMvmkUxMjB61gK0ZwPNJFL0N2qJFETTK09iP9j4iyrSXCVKC7afQilNd31U9AwDTflMTJzMMM5CU6R1rjqblx1mqGa4PZ7o48PxSGuDYQCPG0H2K6+Wvnop1FJGKlkbh1nrPBgzqQ6OrG5c1ZLnxdVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740660341; c=relaxed/simple;
	bh=fWnzntoPDeya2tebONYCDCnkBxEo93LOZEjPITsWVOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i6uyJt8VvQH+aMulqt2IPodW+4tt2uyfva8cG5/nKvbViIWl+Or7T1DjwHoWIUDTsnMx7lS+cuNyA4tBBYAWOwtpOOFZwQt5apzc/O9cK3+Vl4+BcrDLkLYSwSFT0IE1um5Blfg58JVt760eAXZWNOYHCtoim+rW/MTRiRKLpoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7V3ajQn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7V3ajQn"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22359001f1aso9893315ad.3
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740660338; x=1741265138; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=YtmwYaqxFssIW0Pa2qC6sbwgJvuzp7NSxjltk2LJnU8=;
        b=J7V3ajQn+D9uQBPKebJkhgdvZ6pMkvSOgqgBJSvr++uNUyT31/mber+3iHjJlJlEuj
         DcMaudL1UhZXsyizIIFcS7Ci4afqfeY+Db3qnbCs1kOyvwW3vTkIdsNdbadLR0d8OJ9y
         6L64ueyRPd3rLNBB/bj4LiQWGLz5bl5SHsb5kJDr17YgQ0cU5aXh85mdQOCOw/lpjLu1
         QDyqHxPT0uQZYFpRpAUMZv4M1qgWPLNqQhE9cBTBuO4KYr+z2UZCYwaaHxFy4IghOzFU
         lJJR/m2Uflz3spnjXrsEIXVymVgtWBj7hHqsPyIN5BqQSNeK7g9SofxVD4EnUGbucHfL
         yvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740660338; x=1741265138;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtmwYaqxFssIW0Pa2qC6sbwgJvuzp7NSxjltk2LJnU8=;
        b=rIi0lCfsjSGdgvzlDhMoaY3fhtO6Ln1ziGxQfYeHaIIkDdXQegtgaK2K9GJk874K0W
         qIVv+ASVZXx+naOEe1J7vXxzuTAl+ehcryuhKx7hAWbxw3qs3LLS/Yn0f/5jukzgfbB+
         Qm84HvRTHTawVk1SU9SRNSKR9BkydwZ2u4vRG6L7wbQUkHV7SmEl3Tvzt33batQmhOyA
         m4fiHSZeBK3T36AGqDsaMc7eYtv3XkZRuho83iNO+FyJU+ebLiZUtOmgs2PFMGKOij6u
         Ns5qURMhL26a89odK2DQXlGs5d69/5G4jrW1xP4OfwD3OXWpKp/4xEoohEd+sXXIchhd
         4qmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEDPEcxpDxAC8A4S9kmyzwPtsHwNlqBnS4blB8O77HYYLf8qbUIfur48N4sqkCpqk1OQ1HMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYrp/TarXDsUbf8JLwHajX1RR44d3KV62sOBaRyOS3JUyH7TgK
	93sqhisagsgF5FR0yoAJxVFKCDQHwa/hVaYp8njz6xgxDtrMsu3L
X-Gm-Gg: ASbGncsPGoKS7RiNVc1qP0Kkywu6FwyImKyanXMplDaboIP6cPsBCsYx+reNgZnrgSC
	TbFgZaDdM1ks8ZhqQ1xsmtZa87fuTTT+B1TLpBmiMnFEWaeLzAHKMQBQhrZG5mCcnmn65CRi87H
	RFOmIb/ytm7lxEX7A4lOkhF903crxG/ezCi5+Wjl1NqmEPUtpK9oh+5gG+gMj38GFrMFJfiWKOu
	gs9Yk+FJQ5QZnHoyvYyMn8q5QsOlK/abKPlOKY6dz6hTFDrhaxxONakjsA6HMvbmOqlP0rw6I6v
	WhMiWwWv9VWetFQySteWiIsukMEb+JQ9V/hs9kVGdeUV3YNAW/LxR0Ic2bYSgH5AIudlt6kgBLU
	=
X-Google-Smtp-Source: AGHT+IEu1z9o+etyWQ3GYKQxj9svNIE80SY1i5LrNL1f5QPKZ8haclw49WFVfET5tXTwPShEIFk0HQ==
X-Received: by 2002:a05:6a00:1a86:b0:730:74f8:25b9 with SMTP id d2e1a72fcca58-73426d81592mr36627859b3a.17.1740660337486;
        Thu, 27 Feb 2025 04:45:37 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003ec4fsm1474157b3a.130.2025.02.27.04.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 04:45:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b1be4c35-b452-479c-9dcb-700ae276e8b7@roeck-us.net>
Date: Thu, 27 Feb 2025 04:45:35 -0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/20] ASoC: tas2770: expose die temp to hwmon
To: James Calligeros <jcalligeros99@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>,
 Jean Delvare <jdelvare@suse.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org
References: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
 <20250227-apple-codec-changes-v3-12-cbb130030acf@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250227-apple-codec-changes-v3-12-cbb130030acf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/27/25 04:07, James Calligeros wrote:
> TAS2770 includes an ADC which reports the chip's die temperature.
> As per the datasheet, the temperature in degrees Celsius is derived
> ny taking the raw value stored in the ADC's registers, dividing by 16,
> then subtracting 93.
> 
> Create and register a hwmon device to expose the chip's die temperature
> to the hwmon interface.
> 
> The ADC is shut down during software shutdown mode, and its registers
> are initialised to 0 on reset. This means that the die temperature will
> read -93 *C until the chip has been fully powered up at least once (e.g.
> the PCM its attached to is opened). Once the chip is put into software
> shutdown again, the ADC will also shut down. The last value sampled
> before this happens will persist in the ADC's registers.
> 
> Co-developed-by: Martin Povišer <povik+lin@cutebit.org>
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   sound/soc/codecs/tas2770.c | 102 +++++++++++++++++++++++++
>   1 file changed, 102 insertions(+)
> 
> diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
> index 7f219df8be7046912bf3ef452f75c17b5118bcf6..9cdd3470e9a04d5a5f801c3690d40f8fd131cd94 100644
> --- a/sound/soc/codecs/tas2770.c
> +++ b/sound/soc/codecs/tas2770.c
> @@ -12,6 +12,7 @@
>   #include <linux/err.h>
>   #include <linux/init.h>
>   #include <linux/delay.h>
> +#include <linux/hwmon.h>
>   #include <linux/pm.h>
>   #include <linux/i2c.h>
>   #include <linux/gpio/consumer.h>
> @@ -491,6 +492,94 @@ static struct snd_soc_dai_driver tas2770_dai_driver[] = {
>   	},
>   };
>   
> +static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
> +{
> +	int ret, reading;
> +
> +	/*
> +	 * component could be uninitialised if the codec is not
> +	 * attached to a machine driver
> +	 */
> +	if (!tas2770->component)
> +		return -EINVAL;
> +

If this is temporary, it should return -ENODATA or better only instantiate after
a component is attached. If it is permanent, the device should not instantiate
in the first place.

> +	ret = snd_soc_component_read(tas2770->component, TAS2770_TEMP_MSB);
> +	if (ret < 0)
> +		return ret;
> +	reading = ret << 4;
> +
> +	ret = snd_soc_component_read(tas2770->component, TAS2770_TEMP_LSB);
> +	if (ret < 0)
> +		return ret;
> +	reading |= ret >> 4;
> +
> +	/*
> +	 * As per datasheet: divide register by 16 and subtract 93 to get
> +	 * degrees Celsius. hwmon requires millidegrees. Let's avoid rounding
> +	 * errors by subtracting 93 * 16 then multiplying by 1000 / 16.
> +	 *
> +	 * NOTE: The ADC registers are initialised to 0 on reset. This means
> +	 * that the temperature will read -93 *C until the chip is brought out
> +	 * of software shutdown (e.g. the PCM it's attached to is opened). The
> +	 * ADC is also shut down in software shutdown/low-power mode, so the
> +	 * value read back from its registers will be the last value sampled
> +	 * before entering software shutdown.
> +	 */
> +	*result = (reading - (93 * 16)) * (1000 / 16);
> +	return 0;
> +}
> +
> +static umode_t tas2770_hwmon_is_visible(const void *data,
> +					enum hwmon_sensor_types type, u32 attr,
> +					int channel)
> +{
> +	if (type != hwmon_temp)
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		return 0444;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tas2770_hwmon_read(struct device *dev,
> +			      enum hwmon_sensor_types type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct tas2770_priv *tas2770 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		ret = tas2770_read_die_temp(tas2770, val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct hwmon_channel_info *const tas2770_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_ops tas2770_hwmon_ops = {
> +	.is_visible	= tas2770_hwmon_is_visible,
> +	.read		= tas2770_hwmon_read,
> +};
> +
> +static const struct hwmon_chip_info tas2770_hwmon_chip_info = {
> +	.ops	= &tas2770_hwmon_ops,
> +	.info	= tas2770_hwmon_info,
> +};
> +
>   static const struct regmap_config tas2770_i2c_regmap;
>   
>   static int tas2770_codec_probe(struct snd_soc_component *component)
> @@ -707,6 +796,19 @@ static int tas2770_i2c_probe(struct i2c_client *client)
>   		}
>   	}
>   
> +	if (IS_REACHABLE(CONFIG_HWMON)) {
> +		struct device *hwmon;
> +
> +		hwmon = devm_hwmon_device_register_with_info(&client->dev, "tas2770",
> +							tas2770,
> +							&tas2770_hwmon_chip_info,
> +							NULL);
> +		if (IS_ERR(hwmon)) {
> +			return dev_err_probe(&client->dev, PTR_ERR(hwmon),
> +					     "Failed to register temp sensor\n");
> +		}
> +	}
> +
>   	result = tas2770_register_codec(tas2770);
>   	if (result)
>   		dev_err(tas2770->dev, "Register codec failed.\n");
> 

