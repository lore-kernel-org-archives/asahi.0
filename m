Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519993;
	b=p7Mv3kEewB5jOYojXYZZJk/hvc788smCKWGVOZ/uizWXlaIeJx5/2cYzlr3rnN2AjC9N
	 6/FwDY1NpKf/PQPspo2D04DbpVMY21JvqTgnJm8BXysDC7JXM8OhCaAraqDrfXQOTYUXq
	 J5dqWnpRsTaIk1WJTrRzP4c0ZJYYqZRmLRrw5wlBklGF4MUV0/9Khyjavc0AAZkvMqheL
	 jAdjZ/TD//uXzPFW2Aiqomh4FcPfR+B+KsbQ335Z5W9Xb0G5DypZ6jM1Beo1/01oFhjZD
	 hJTgtCF+UR8i/MKb+/JhsWwkVG9MpebaO4SbX5bjuHrBZdpwa8bnZKcssdMxFo9kT+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519993;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=EiMYBgdIo+7Jld6p7aiOMau8jqoH62LYKTF989Hvq/Y=;
	b=aNabYr8wXXKMpKxFfaKZ02dudC1VK8GGwkA1M8gIJw+9sUxvgRiRXk+ggupviZ0l8rPx
	 6Q6zfHfV22ZcBmKDQEvfx4usf/GKa0IZ2z2POQtCg03/bWQH4fLXDJCeicuWryITl6uQa
	 fPKSZM+6003XLWjFD7IAkpF4tqX5PBxeyssdLRAFMYBCjQ3Ns/4GMRrcJjDlzNcSlO+IR
	 WKaCd3s7Qo5cOApnDyOx+OUt3S9WuBtE+8DXONkPA7XjKpd6qERtJKUwS1iT2/Ey2IhVs
	 O76orgEBqbxdSYSwyKq+CIBPUrMwk+LHHTzBR1CLlxqhU5EUed0e3v6X2IfPtBOiecg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNmLzglP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34894606A31E;
	Tue, 24 Nov 2026 11:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CNmLzglP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A95D1F000C0;
	Tue, 24 Nov 2026 11:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795519992;
	bh=EiMYBgdIo+7Jld6p7aiOMau8jqoH62LYKTF989Hvq/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CNmLzglPE9LHYi1mJezvBeOc7Q8Xzm8eeZEZtUF00B9ZlXidaJlB+eldfiCZjTWhy
	 UlK4P+spLc2W6rLxidAmHc2jkMLbG3nWm6mO83c3ZRjQHVDo0vNBPr40J57PNEIcLQ
	 UeM5qcsVS3pqtb8JwUnGXHkYy5JGnNwzWOPa5NEm3VTfj4UAIvWhMd9tlmyuGJikG6
	 EvtzrPQ3SezcjIS0kdPDQvBzd/pHj2VlCNAa/tNK0prYLjrujf49LTsROOXsqEaoFT
	 EhHjyxwELlrJm2846MUz2CaWFNfI3IyT3KalviSodugBq7RlAliQVKw2L5Yg+UH3YV
	 KogiwPJe7hbEA==
Message-ID: <52773445-ffe8-4a42-82ca-e74f18c944b3@kernel.org>
Date: Tue, 24 Nov 2026 12:33:07 +0100
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
Subject: Re: [PATCH v2 3/5] phy: apple: atc: Add initial M3 series support
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
 <20261122-t8122-phy-v2-3-8d5c8fdf31ba@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261122-t8122-phy-v2-3-8d5c8fdf31ba@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22.11.26 13:27, Sasha Finkelstein wrote:
> Adds initial support for the new t8122 phy. USB/TB only for now, DP
> will fail to negotiate
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

[...]

> +
> +static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atcphy, enum atcphy_mode mode)
> +{

This function ...

> +	if (atcphy_modes[mode].pipehandler_state != ATCPHY_PIPEHANDLER_STATE_USB3)
> +		return;
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_SMALL_OV);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_BIG_OV);
> +	udelay(10);
> +	core_clear32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP);
> +	udelay(10);
> +	core_set32(atcphy, ACIOPHY_CFG0, ACIOPHY_CFG0_COMMON_CLAMP_OV);
> +	udelay(10);
> +	core_set32(atcphy, AUS_COMMON_SHIM_BLK_BIAS_REG, AUS_COMMON_SHIM_BLK_BIAS_REG_BGBIAS_OV);
> +	udelay(10);
> +}
> +
> +static void atcphy_configure_post_tunable_t8122(struct apple_atcphy *atcphy, enum atcphy_mode mode)
> +{

... is defined again here and there's also a _t8103 variant so something 
is off here. I think you want the second one only which doesn't have 
atcphy_power_on_common_t8122 inline maybe?

> +	if (atcphy_modes[mode].pipehandler_state == ATCPHY_PIPEHANDLER_STATE_USB3 ||
> +	    (atcphy->hw->dp && atcphy_modes[mode].enable_dp_aux))
> +		atcphy_power_on_common_t8122(atcphy);
> +}
> +


Sven

