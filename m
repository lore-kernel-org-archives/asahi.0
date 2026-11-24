Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520815;
	b=sQ6uHieFV3YOW3Mc2GBBFDjEmaSTP9GXkXl5H8jt/BFrSmcDDFhL1vIvs7dU0tCFkVBR
	 vRtHRDqaeywwAfZ9zqdc6gllwPvKaKh9NXqhZCbYoaa6rjhHJ9uWFeUjjxfMTng1liut2
	 YQIJ+FHT4ZhN2GUQXYv3gc5xqjIOOmZPbovT7ISaNgTCeUI7/W9WMwD8q6m9Hwtix9k+K
	 8CStzoQ/9t8RP1l7CA4OD/5gDkNK9pRqz8JYRS5goIlAn4xpzoHzF1hf1pQ6MzO3PosVn
	 ts6rZJ/C9cS3m3AZ63gvcTeam9s9NuDAI/BAlZLguHJvlKkxJvdQ88RjLwy0mDcF75g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520815;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=slDeNcL8nKCZniQIETBrb4VJOKJ5hyGXbFudBtIpRpk=;
	b=nxQ6mUw+Lv2LuoWEDBQCLlSnlVgYCBYhq5b5aHA8qPtU/gAQ7P4C+5G7HPaAJH5WEt+W
	 OindPq/Or7w1FjWu9kFNEBqMg5nIYT1l7HTwKaYNRpBYvqPhyi9Aei1Iz7+f+u9dhd929
	 Xv3e4FpTznyUM3ey/7f8WLU0o0VGtbIbxz9JXJQPrMzRumqT3dplZXniOTHNxyVDR80Zi
	 OwMbaAHzuCDoEGZ9UpnCGpqXn0fnjurcIb/u1HomYT0wBnxjavr+2bk4IpMiGE/rthrPc
	 eEXkO+5RoTxqR5El2n5OAN4hSGW2eyTe5RZPumNiZEpJQBLW9QRtocppLbfPL/KAiFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Drf2d3kH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA18606A321;
	Tue, 24 Nov 2026 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Drf2d3kH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E141F000C6;
	Tue, 24 Nov 2026 11:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795520815;
	bh=slDeNcL8nKCZniQIETBrb4VJOKJ5hyGXbFudBtIpRpk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Drf2d3kH2oL7HKNlZ6XeGyqR3uji1dygb7rgeAVaeV2Kc+i6XafzH6vV8fsdclelw
	 LiMld5nRkW1TqIRKkfvI5/g2+RaSxBNKBvHje6k8xiH/rWcnwxhngQWPei+/qMD4GN
	 QhAF7bRqfmZCQecPqvIUKlyXl4DB6H8CkpzhjqUvea+hxQRz4ML+O1k980nvasSI3q
	 Vk6CR3gB0qfiMNogf92PEqEmbIOjZIBNRdTVEQgYiqFdxprHVkbp6mPVUE28honZuF
	 jgYyqcYoXrIWqZewFvBMUJRNh5kpkVNvzM6ynyQiAzdYsgLBxlTw0QRPxANmFcw73c
	 pcUdskm0hmDww==
Message-ID: <977c6810-8c9b-42d5-8f98-d2b15dbabad7@kernel.org>
Date: Tue, 24 Nov 2026 12:46:50 +0100
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
Subject: Re: [PATCH v2 4/5] phy: apple: atc: Add T8122 DisplayPort support
To: Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ramzi Abdiche <abdicheramzi@gmail.com>
References: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
 <20261122-t8122-phy-v2-4-8d5c8fdf31ba@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261122-t8122-phy-v2-4-8d5c8fdf31ba@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22.11.26 13:28, Sasha Finkelstein wrote:
> From: Ramzi Abdiche <abdicheramzi@gmail.com>
> 
> Add DisplayPort AUX and lane setup for T8122-family PHYs.
> Select clock and lane settings by link rate and stop active
> lanes before orientation changes.
> 
> Signed-off-by: Ramzi Abdiche <abdicheramzi@gmail.com>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

[...]

>   
> +struct atcphy_dp_ops {
> +	void (*enable_aux)(struct apple_atcphy *atcphy);
> +	void (*disable_aux)(struct apple_atcphy *atcphy);
> +	int (*set_rate)(struct apple_atcphy *atcphy, enum atcphy_dp_link_rate lr);
> +	int (*stop)(struct apple_atcphy *atcphy);
> +};

Couldn't we just make this part of atcphy_hw as well? That one already 
contains a bunch of variant-specific function pointers now and I don't 
see a reason why these here have to be separate.

> +
>   struct atcphy_hw {
>   	void (*configure_post_tunable)(struct apple_atcphy *atcphy, enum atcphy_mode mode);
>   	void (*configure_pipehandler_usb3_host)(struct apple_atcphy *atcphy);
> @@ -600,6 +733,7 @@ struct atcphy_hw {

[...]

>   static int atcphy_dp_configure_lane(struct apple_atcphy *atcphy, enum atcphy_lane lane,
>   				    const struct atcphy_dp_link_rate_configuration *cfg)
>   {
> @@ -1452,20 +2013,11 @@ static int atcphy_dp_configure_lane(struct apple_atcphy *atcphy, enum atcphy_lan
>   
>   	lockdep_assert_held(&atcphy->lock);
>   
> -	switch (lane) {
> -	case APPLE_ATCPHY_LANE_0:
> -		tx_shm = atcphy->regs.core + LN0_AUSPMA_TX_SHM;
> -		rx_shm = atcphy->regs.core + LN0_AUSPMA_RX_SHM;
> -		rx_top = atcphy->regs.core + LN0_AUSPMA_RX_TOP;
> -		break;
> -	case APPLE_ATCPHY_LANE_1:
> -		tx_shm = atcphy->regs.core + LN1_AUSPMA_TX_SHM;
> -		rx_shm = atcphy->regs.core + LN1_AUSPMA_RX_SHM;
> -		rx_top = atcphy->regs.core + LN1_AUSPMA_RX_TOP;
> -		break;
> -	default:
> +	if ((unsigned int)lane > APPLE_ATCPHY_LANE_1)
>   		return -EINVAL;
> -	}

This is a bit weird, that thing is an enum so why not just keep the 
switch? This is also the only place that checks if lane is valid before 
calling atcphy_lane_reg(). I don't think it's even possible to have an 
invalid value here so I'd maybe drop this check completely since it 
always passes or change atcphy_lane_reg() to be something like

	int atcphy_lane_reg(void __iomem **reg, ....)

and return an error and put the register into *reg.



Sven

