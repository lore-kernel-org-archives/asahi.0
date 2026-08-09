Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA628641E;
	Sun,  9 Aug 2026 15:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786288808; cv=none; b=Gamc5J0Pm5IEFqKnZSkKIZkHa1oHXj5GUgimhcj9ZUBuiZSNI5uvCtepHu13RTNI7SBHT/hjkXIO3Lx5bbo0P0Ehh3tVp5xbYOHzTYnqabSAaUEwKjPZhHlhIDnNCGeTI6pn86NL65zKsqR9I4ay2hLZ39VmBpm5NAAlp5cNO0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786288808; c=relaxed/simple;
	bh=1Y4+yN+7jjQeWokiWwENeIWiEk8ip3UAnTDcNk45//8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHvEBbOAg/2j3to2aqCSFMjRZceMfyJRAAQ5we3u5+Puv0E2NemL2vh1jK22soy4H2UFy/WFO3LtSA+mwBqUBW8bXLLy1LCH2wFTAkd1oTKFT65cWTjziZ5HK98oVr1fFudehAWsZwakCvUnL523+dnqDsiyp0KvlnzkKlAjg2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5+PUNx1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5+PUNx1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF1E1F000E9;
	Sun,  9 Aug 2026 15:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786288806;
	bh=ARwVcPLvnx7EkBM0oPgr55fHOYd6QKrvM3EwPl17m8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T5+PUNx1uB/QZ7ynQ1OX2My7q3Mg/COzWAg/qjZitiPRL4X48qX5QoB+r3v9On6KQ
	 ryv5GhMQf0PwrX6i0Zv38z9DHFbHo3i4AjCn52JYnzfdLnMIKfrMZfsQmK42Veefuj
	 bDiRNrUWylkAS11Af6u1eYsRLSEVfvP9kcMiS0C+Ho1nHP/gY+CaHBYMoJUPm72jxA
	 N3ox/ksDvb8C4g+2Zeq8tHya2rOw0vQvzdhGPM/ybnV7nNRulePqLfw2+2EA6hjvzI
	 yvCf685ZDeIftkztcUUZmg+Zt1iYMRsQ+pRM8DFm8XH4ibLSGa0akYRTaWvyuBygpu
	 o9rOC9C5W+niA==
Message-ID: <7a170485-b349-4502-adb1-3ce6217bc435@kernel.org>
Date: Sun, 9 Aug 2026 17:20:01 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] reset: Add Apple SoC CIO reset driver
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: asahi@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-2-4f33777d9b4b@kernel.org>
 <DKKHHITWR3F4.390HXQFLQR8X5@ubuntu.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <DKKHHITWR3F4.390HXQFLQR8X5@ubuntu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09.08.26 16:30, Joshua Peisach wrote:
> On Sun Aug 9, 2026 at 8:16 AM EDT, Sven Peter wrote:
>> Add a driver for the reset of the CIO (USB4/Thunderbolt) blocks on
>> Apple Silicon SoCs which has to be deasserted before their
>> co-processor can be booted. On t8103 each port comes with a dedicated
>> register page while t600x uses a single register with one request bit
>> per port shared by all ports of a die inside the PMGR MMIO region.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>  MAINTAINERS                     |   1 +
>>  drivers/reset/Kconfig           |  10 +++
>>  drivers/reset/Makefile          |   1 +
>>  drivers/reset/reset-apple-cio.c | 182 +++++++++++++++++++++++++++++++ 
>> +++++++++
>>  4 files changed, 194 insertions(+)
> 
>> +
>> +static int apple_cio_reset_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct apple_cio_reset *priv;
>> +    int ret;
>> +
>> +    priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +    if (!priv)
>> +        return -ENOMEM;
>> +
>> +    priv->variant = of_device_get_match_data(dev);
> 
> Might be a dumb question, but does priv->variant also need to be
> checked? Because later priv->variant->pmgr_child is and I *think*
> it could return NULL.
> 
> (Or is this not necessary since in theory the device should only run
> this if detected... so this should never be an issue?)

You might be able to get this driver to probe without a device tree node 
by manually forcing it with sysfs but well... play stupid games, win 
stupid prizes.
Adding the check is just two lines and doesn't hurt though.



Best,


Sven


