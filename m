Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DA142AA9;
	Sun, 19 Jul 2026 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470317; cv=none; b=G5VQubsD04Fbux5dMQHvVtxIEzBMDibe0OTAojMuHvoE5MQCyW51yFr/J7XeD529edKafB8kz/BGLi5NIvdE6TnEuh3VNaPDTw0bIGaW1wMPG7y3kSbeS9rv0R9RJg6MtrZaHuJCnBjcJjUwKGfcUIscMUL51Z/4AtlsSmrEtOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470317; c=relaxed/simple;
	bh=1n4f4ph2m2vryUVwWtQZ+/DH85ZIYg/9jCxo/DMQkO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g0bSScSH67wLNXsJRbYXj5JJktzHUnDekU8O29MLuRcxJCyfcxLwUMcC7m7Em+GfWof0XK3hFLTaUklWC86dp01/NMBVYtMRZ/JaXyZzelJMFSO1Vs9qdJoURJOHVzqFKtpOMvnOD/OCg5ckPm9S2GDQ7Il/Td5oyrkW8uHMXJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9QwXI7S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9QwXI7S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83311F000E9;
	Sun, 19 Jul 2026 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784470315;
	bh=9rqBzsr+hZ6+IGvDv8xid+NE2IZ7dsQ2695/49Tv2/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=X9QwXI7SKPPM8MKn1FY16apc0Z2fcabt/B6JxNOn5JJ/Ifh6XWwdcOyyNoI87tj+H
	 XgCb92agRsDwzXAzYaDOtEdGnv8cOyeQOaNeRX4auFGNKFbTclMiZHKZDbvLsME7vt
	 N+Vm/7dr+zwt012VORSUFvSAieO4QYroSLWWsMiEypQ5VUEeW4C14KgDr89PphjikF
	 T8pnMzhUnX7Oro4LsLuXH+8Rsr0XfsvMkcvS4Rn4Z+SRnPrOCIdtJMQj4rDQ5krGMJ
	 Qq1KIs0LwuvUxp4fpFRMr4M1IKVIvkru0BtocBptFW0dd7BMiIM8rDqwYJS/3G1clH
	 aw54crTFdSa/w==
Message-ID: <d9f1c018-793e-4021-9aec-d7139a6468f1@kernel.org>
Date: Sun, 19 Jul 2026 16:11:52 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] arm64: dts: apple: Add SMC hwmon nodes
To: James Calligeros <jcalligeros99@gmail.com>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/14/26 08:28, James Calligeros wrote:
> Hi folks,
>
> Following on from the series which added SMC hwmon driver[1], this
> series spins out and adds the Devicetree nodes required for the hwmon
> driver to operate. These were missed back in December.
>
> The System Management Controller on Apple Silicon devices exposes
> the temperature, voltage, power and fan speed data from numerous
> (potentially hundreds) of sensors scattered about the SoC and
> device at large. Unfortunately there is very little rhyme or reason
> to how Apple expose these using the SMC firmware's FourCC key-value
> system. Some sensors are reliably common across all devices and
> all SoCs, like PSTR which measures the total platform power consumption.
> Others are specific to a class of device, like the fan control
> keys, which are only present on devices with fans. Some are specific
> to a single SoC, and others still are specific to a single device.
> To complicate matters further, some SoCs are not even consistent
> across devices; the application core temperature sensors for a
> given SoC are read from different keys depending on the device
> that SoC is in...
>

Applied to sven/linux (apple-soc/dt-7.3), thanks!

[01/12] arm64: dts: apple: t8112: Add SMC hwmon node
        https://github.com/AsahiLinux/linux/commit/89efdbd8ea62
[02/12] arm64: dts: apple: t8103: Add SMC hwmon node
        https://github.com/AsahiLinux/linux/commit/4dea4ee249ec
[03/12] arm64: dts: apple: t600x: Add SMC hwmon node
        https://github.com/AsahiLinux/linux/commit/d02aeb6980b6
[04/12] arm64: dts: apple: t602x: Add SMC hwmon node
        https://github.com/AsahiLinux/linux/commit/f424abc3075b
[05/12] arm64: dts: apple: Add common SMC hwmon infrastructure
        https://github.com/AsahiLinux/linux/commit/56c65dc95f3d
[06/12] arm64: dts: apple: t8103: Add common SMC hwmon sensors
        https://github.com/AsahiLinux/linux/commit/d77603e44f55
[07/12] arm64: dts: apple: t8112: Add common SMC hwmon sensors
        https://github.com/AsahiLinux/linux/commit/ae42d7fe0793
[08/12] arm64: dts: apple: t600x: Add common SMC hwmon sensors
        https://github.com/AsahiLinux/linux/commit/fe521d15d9c5
[09/12] arm64: dts: apple: t602x: Add common SMC hwmon sensors
        https://github.com/AsahiLinux/linux/commit/fd42ff865357
[10/12] arm64: dts: apple: t8103: jxxx: Add device-specific SMC hwmon 
sensors
        https://github.com/AsahiLinux/linux/commit/b6935375d536
[11/12] arm64: dts: apple: t8112: jxxx: Add device-specific SMC hwmon 
sensors
        https://github.com/AsahiLinux/linux/commit/da160f258c36
[12/12] arm64: dts: apple: t60xx: jxxx: Add device-specific SMC hwmon 
sensors
        https://github.com/AsahiLinux/linux/commit/e88070b74578

Best regards,
-- 
Sven Peter <sven@kernel.org>


