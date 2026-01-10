Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF32226B973
	for <asahi@lists.linux.dev>; Sat, 10 Jan 2026 19:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073207; cv=none; b=Kv867XQMCIBjWORSXFJsxAhePWSOy1TjmUEizU2dt0em0q4RRZbFUi6ge+EJe/mljohU8BUT6SilafRzFoeyB4Sgi0O4kyngD192FyoitFDcnXmBoZwILYSalxzIHYcb05s8h+iHli2fmB1l/xm5WeBrkAiG1wE9BJnGgxl2+tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073207; c=relaxed/simple;
	bh=rnvxtnRu1rSQSP6ypBUEsV37vDvQUoTWQLJx+OnihIk=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References; b=PZtcmL3kU5E+ttlso8P+cJ9wCMxSOLbWGJbcpwMRPLAVO3eNieBSuE0la3xIIESwSHFEQYmdhscpdOxYbv+cIxAW0vxoL/UK36WIC4ltMCsPZoSr9cBXIy2cxdEc99MFPbgYiChnKXf2ZAp7bra62swEDsuOv8+TzAtBSZlhVro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=Cu403eMb; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="Cu403eMb"
X-KPN-MessageId: 46e2daaa-ee5a-11f0-8fef-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 46e2daaa-ee5a-11f0-8fef-005056999439;
	Sat, 10 Jan 2026 20:26:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=subject:to:from:message-id:date;
	bh=1kRHIH05u+KrIwE9Qo8lvdbKCNByfY32s/uMnAuuqv8=;
	b=Cu403eMbDM3vWI/QGN0TOYO+MfheIIeGCxRBdFyGf+Fw34Lci5iW8sxPCtqMU5vHW3wxPC2f+Hsuj
	 UrAOs/aaffDiYrXLSgVx01HABCNr5pB5vlSvTHyHFbzQlVHQq4ThBpHjaiTKJFzYSIH6DpAuboSRF0
	 pwCuDuQvzh+idV20JW/EwBJepnnCItUM7BB+XGwg6iQbCVpR9t/hAhkc8ObhTv+VNJxcZ3MSopQcul
	 ySXJrY4Y44wjbbZ2VOAFowcPQ4bQorMJ7I7ZBD0F/DYTls6yoOaMAix/Ho5eOEmYIZN+bYh3jevcVv
	 yOnL2rP3SOSnaMY40nIqpvJ1eZrqlcA==
X-KPN-MID: 33|+uXw80JppQnUVPXaDGNuWw3DZmbQImWj5rdnLXMFm4KNGQTeJd28uA22CyL9Xw8
 Ab5Qx6TxfYsG6w3/uEbb7XQ==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|ABcsc6EyIPmuN5VvOx3IXRlOfqA+oGFBLv4xNvXZUHwTSryLb3MlnAThl5Uq2CW
 DYsdFcw6SPCzVAVj6vYeGMQ==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 47212731-ee5a-11f0-86cc-005056998788;
	Sat, 10 Jan 2026 20:26:36 +0100 (CET)
Date: Sat, 10 Jan 2026 20:26:35 +0100
Message-Id: <87wm1p8e1g.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Janne Grunau <j@jannau.net>
Cc: sven@kernel.org, neal@gompa.dev, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	j@jannau.net
In-Reply-To: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
	(message from Janne Grunau on Fri, 09 Jan 2026 16:25:42 +0100)
Subject: Re: [PATCH 0/4] arm64: dts: apple: Add chassis-type properties
References: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>

> From: Janne Grunau <j@jannau.net>
> Date: Fri, 09 Jan 2026 16:25:42 +0100
> 
> Add chassis-type properties for all Apple silicon Macs. "chassis-type"
> is used by u-boot to fill the SMBIOS "System Enclosure or Chassis Type"
> field. User space software uses this field to to determine if a device
> is an laptop. The exact use case eludes me unfortunately.
> 
> The Mac Pro uses "server" as chassis-type which is not entirely
> accurate. The tower and rack mount Mac Pro versions share the same .dts
> file and are identical except for the enclosure. I haven't found an
> obvious property in Apple's device tree to distinguish between those so
> both use "server" instead of the more accurate "tower" and "rack mount
> chassis". The latter chassis-types are not in dt-schema anyway.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

For the series:

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>

> ---
> Janne Grunau (4):
>       arm64: dts: apple: Add chassis-type property for all Macbooks
>       arm64: dts: apple: Add chassis-type property for Apple desktop devices
>       arm64: dts: apple: Add chassis-type property for Mac Pro
>       arm64: dts: apple: Add chassis-type property for Apple iMacs
> 
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 2 ++
>  arch/arm64/boot/dts/apple/t6022-j180d.dts      | 2 ++
>  arch/arm64/boot/dts/apple/t8103-j274.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j313.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j456.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j457.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j413.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j415.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j473.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts       | 1 +
>  12 files changed, 15 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260109-apple-dt-chassis-type-f31523a1f681
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
> 
> 
