Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C254E190473;
	Sun, 19 Jul 2026 15:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784474141; cv=none; b=AvR/CIZpkQdcdy3YUZvCaFPWO70f0fpDKibX9qY5bObaE2F9dAXuxa721kQ8m64mhR7Uimb6Q0t6SQBf0esNYBim5pRq/GXW4fm80aJNJVgzHvrgu3BO2ewJ9xBzK74t3hDaXq4OoqMGu2i2pdd5xRnQb0AmyUBMUDyPwpe24uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784474141; c=relaxed/simple;
	bh=bVZ4/s0Nh81My4JUxeASevmOVTGckab9IiybVX5zzQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GmyvRtuBgekojmW5NyvuJp3d6A6Li872y2ZUdqvfwRkvkRrrAthsqzax6pHosljvblZhJoh+5QiLuVQDFZ0SgrwFqIurRE2v/gVWefowX4pk6Fw+I5sAVQHHIn6QyEVyDoAR5OsZ9pz/0ddsEclbM/eiCLYq+O6fcrzsB5Hp8bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIGaMVLv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIGaMVLv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057E11F00A3A;
	Sun, 19 Jul 2026 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784474140;
	bh=yDueUga7eitULmOqjURUrXn6eWwtTWCd29ZxroDeUYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UIGaMVLv4fT+r+fZqDn9S5CwkChH36z8I0AU76zXXC5tsQftTEuFedlryvMWKZC07
	 oE/sUPgiZH+bpql9Nzk/T30vF8gd8fRPpWTCvvI8kDxFAWFC2tGdGMJFy0hueSbGgN
	 kfKKDbSwdhoEQxJM5KPgQIJf4xrAWGz2Poo6sxJII81L5cuNxRJgrlXV6KP1HnYhxJ
	 q5+dwoccWObS3HptVHLd6shrHN+FHk11wMgxZGoplhOZZF0bgOsuS2pyU5VW08jo3x
	 mvqRGz+piqyjSKkJjqNAAlZkdnEVS6eyRlOmkXiszs+8OVAMJNxlaCJV3ROTV5EnEZ
	 E0ObQ2szoKlKg==
Message-ID: <07d37cf5-d49d-4507-82c8-7c6d8c9e01af@kernel.org>
Date: Sun, 19 Jul 2026 17:15:37 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: macsmc: Fix key count endianness annotation
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: asahi@lists.linux.dev, Janne Grunau <j@jannau.net>,
 Lee Jones <lee@kernel.org>, Neal Gompa <neal@gompa.dev>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
 <DK2N0ITFL309.1Y5VHF18YIQ7M@ubuntu.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <DK2N0ITFL309.1Y5VHF18YIQ7M@ubuntu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 7/19/26 17:02, Joshua Peisach wrote:
> On Sun Jul 19, 2026 at 9:00 AM EDT, Sven Peter wrote:
>> SMC firmware returns the value of the #KEY key in big-endian unlike most
>> other keys. Reading it through apple_smc_read_u32() into a plain u32
>> and then converting with be32_to_cpu() makes sparse complain:
>>
>>   drivers/mfd/macsmc.c:462:26: sparse: cast to restricted __be32
>>
>> Read the raw value into a __be32 using apple_smc_read() instead.
>>
>> Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management 
>> Controller")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: 
>> https://lore.kernel.org/oe-kbuild-all/202607181046.OANjIoqR-lkp@intel.com/
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>  drivers/mfd/macsmc.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
>> index 358feec2d088..514cba7dc897 100644
>> --- a/drivers/mfd/macsmc.c
>> +++ b/drivers/mfd/macsmc.c
>> @@ -410,7 +410,7 @@ static int apple_smc_probe(struct platform_device 
>> *pdev)
>>  {
>>      struct device *dev = &pdev->dev;
>>      struct apple_smc *smc;
>> -    u32 count;
>> +    __be32 count;
>>      int ret;
>>
>>      smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
>> @@ -461,8 +461,10 @@ static int apple_smc_probe(struct 
>> platform_device *pdev)
>>      dev_set_drvdata(&pdev->dev, smc);
>>      BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
>>
>> -    ret = apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
>> -    if (ret)
>> +    ret = apple_smc_read(smc, SMC_KEY(#KEY), &count, sizeof(count));
>> +    if (ret >= 0 && ret != sizeof(count))
>> +        ret = -EINVAL;
>> +    if (ret < 0)
>>          return dev_err_probe(smc->dev, ret, "Failed to get key count");
>>      smc->key_count = be32_to_cpu(count);
>
> This makes sense, it just feels weird reading because u32 is.. not a
> be32 (that gets passed into be32_to_cpu).

count is __be32 now (the SMC firmware returns that value as big-endian 
because Apple likes to think different) and we read that using 
apple_smc_read now which just reads raw bytes. be32_to_cpu then converts 
that to a u32, i.e. the type of smc->key_count. There's no functional 
change here. What's weird about that?


Sven



