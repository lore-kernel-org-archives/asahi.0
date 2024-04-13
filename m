Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91996199B0
	for <asahi@lists.linux.dev>; Sat, 13 Apr 2024 01:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712970179; cv=none; b=WwRJD66goFZtYJPhrfQQegXb8R79KiT1KTOezgGwfnVFbMbwYlfeCOGh1bEt+DdvPRlDtLc6nW7CZ9lTKYXDv8O1fOM98CjuPcDe1JVsSoKbIqow3c+Y748qjninIqPlXINnURy6EUj6VKpe2qvF1RbSDLBTSiA3gfIjzrIh7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712970179; c=relaxed/simple;
	bh=cCENr837Lcwz9eCvLl0HWy0D7glay0O9ePR8hI711VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GplZNvH0usO90x50t4SUN59aDTUUlh95lG6wnFfa8fWCTCL/3TR/rYv2X4fZflz0MG85ycig7Az8xymqi1iRd+8hRohQLhP9XixCIaC29uhi6aKr1WCh91SUR+h37fkAsZ3PCqqCNNeOUo7NttVoSuVQnyWVyzswUiFMXRDlZRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=yX+NOQOq; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="yX+NOQOq"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D732187D74;
	Sat, 13 Apr 2024 03:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1712970174;
	bh=WwY79HNhc2Wwf45aykhDaZ8T1yAP9fP5oOorJvh0mBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yX+NOQOqs2Ipn6RPVss2afcCdj2e4RAut/4PUdNcueFk9AvjnMk8y8EVASsZ6/wqi
	 PWqdtMFSTzNOhcn8reOg08n3T8V0keMYFqQ5TI3RP0n4MvC6F3dC+mnlY02sAjdSS9
	 VUBmwnJjlMTJ173KHV7Tm9raOdiVnwagt4zbEbvJrzisnmbsPhNx0l8NhGJiitgkR2
	 b0yCzlS+o4l5DUzZDd02OyJuLmCRMP2sIdI5+vpOgBff/wSkuKWTnfDIB8yPEul7t4
	 WKFwrBgCEyGXxQujuv89yROua8sgHm5KDM+dO0CEJEcDZwSRbvvTXikfGNPmsrKHJU
	 ysMwD3o9fHnWA==
Message-ID: <59d43905-46d6-40a1-9dc4-cd236a5f6c74@denx.de>
Date: Sat, 13 Apr 2024 02:59:40 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] USB keyboard improvements for asahi / desktop
 systems
To: Tom Rini <trini@konsulko.com>
Cc: Janne Grunau <j@jannau.net>, Bin Meng <bmeng.cn@gmail.com>,
 Simon Glass <sjg@chromium.org>, Joe Hershberger <joe.hershberger@ni.com>,
 u-boot@lists.denx.de, asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>
References: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
 <356b892a-a681-4ae0-a6c8-ed1b4b5a8717@denx.de> <ZhBLfQfxB_UEwvyY@robin>
 <5467f380-de35-4776-8c32-90b8e08aeda7@denx.de> <ZhGq0U_pkrYMe4S1@robin>
 <5ed4e6d2-edc7-461d-8183-e91d7b994aa5@denx.de> <ZhOg81sBEDLgCSIa@robin>
 <83e48e51-f88d-49d4-bcf9-340e229fdf76@denx.de>
 <d65ea7c0-cb89-4cb9-8378-11839a6ee63e@denx.de>
 <20240412183715.GN2493117@bill-the-cat>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240412183715.GN2493117@bill-the-cat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 4/12/24 8:37 PM, Tom Rini wrote:
> On Fri, Apr 12, 2024 at 08:26:18PM +0200, Marek Vasut wrote:
>> On 4/12/24 2:53 PM, Marek Vasut wrote:
>>
>> Hi,
>>
>>>> Seems to work here with a broken imx8 config from the CI. Is it ok to
>>>> rely on dead code elimination? Apparently it is, build with KCFLAGS=-O0
>>>> has already several other missing symbols.
>>>>
>>>> See attached fixup
>>>
>>> Thanks, squashed, let's see how CI likes this.
>>
>> I think we are getting closer, but still ...
>>
>> Pipeline #20308 has failed!
>>
>> Project: USB U-Boot Custodian Tree (
>> https://source.denx.de/u-boot/custodians/u-boot-usb )
>> Branch: master (
>> https://source.denx.de/u-boot/custodians/u-boot-usb/-/commits/master )
>>
>> Commit: 63f6a449 ( https://source.denx.de/u-boot/custodians/u-boot-usb/-/commit/63f6a449bffe46beca89580d3efa48e5d041025c
>> )
>> Commit Message: usb: kbd: Add probe quirk for Apple and Keychro...
>> Commit Author: Janne Grunau
>> Committed by: Marek Vasut ( https://source.denx.de/marex )
>>
>>
>> Pipeline #20308 (
>> https://source.denx.de/u-boot/custodians/u-boot-usb/-/pipelines/20308 )
>> triggered by Marek Vasut ( https://source.denx.de/marex )
>> had 1 failed job.
>>
>> Job #815411 (
>> https://source.denx.de/u-boot/custodians/u-boot-usb/-/jobs/815411/raw )
>>
>> Stage: world build
>> Name: build all 64bit ARM platforms
> 
> That looks like the machine doing the build failed, I've kicked the
> retry button.

And now it passed, PR is coming real soon now, thanks all !
