Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A834A14F103
	for <asahi@lists.linux.dev>; Fri, 12 Apr 2024 18:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712946383; cv=none; b=K4DBfrSsmOxE5cM7iGLuH05D+aytiSsOHoX/roW+kjdqzi+QG4y/EPgtM+1fPj049vRwf/GbxrLhB7gv3BDhePU9WPJsHcThapnNlab3ZIefIj7ar/dkL7YojerwqxsoUVW02QirpA00E+hmyOqWTf6WvO+F4FT8qJvHInJk738=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712946383; c=relaxed/simple;
	bh=iurD5SoAV8gZYWKnfOSpJSsh4Msc0LYO42qZ8qIZS4w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TqAbES/Vbdsmcc/WRy16y0mRCVaoRq5Od/7fHYqPYhOuiPYgf+nmpuq1t42krIfX1xGaX41F8jIwyr1KrSx32E/xDNjWFD8rXp0lXtRpj5DLz5sgjN/z5Atg0TjNiTpIGg86wPVG5KVEmpsefc0mA0u2t+PJZ4i+Co/7nt135A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=JFO46zX9; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="JFO46zX9"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 40B5187DFF;
	Fri, 12 Apr 2024 20:26:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1712946379;
	bh=OORJlIY4ad/CcaDiqCOIPnoBKUr+zx8Ml2cQeW1Uxcw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=JFO46zX9RHJLrDW3XOk87OcEwZJb7saeyF/dim2g+PwLzr9346lelUcdu8kSitVYB
	 2awjO2FU6KXsptKqPZ052kgu4h4IAnqCg4DsXPvh01i62wdPQkr+Yur/GAX9Z+5hVZ
	 q7dWj6JLwZAx8lp6G7/UjrIEwTwMAMIsxp+IDm+x7CSmP1iPyKLHqJJEhFwz6T3Rvd
	 ee1PSZiQNqY/A0/mn1VIDrRGIBNgqNhH6URdMneeLi2/QuDTZcleYGR3wep4eMdjpp
	 spw+ff9mUbqmPBsePsgR0CE+8+fs7cyd/w7DKCpP0Y3nC33IjCbYhcAwgBNvyK79nc
	 CyFopyz3xKqeg==
Message-ID: <d65ea7c0-cb89-4cb9-8378-11839a6ee63e@denx.de>
Date: Fri, 12 Apr 2024 20:26:18 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] USB keyboard improvements for asahi / desktop
 systems
From: Marek Vasut <marex@denx.de>
To: Janne Grunau <j@jannau.net>
Cc: Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, Joe Hershberger <joe.hershberger@ni.com>,
 u-boot@lists.denx.de, asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>
References: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
 <356b892a-a681-4ae0-a6c8-ed1b4b5a8717@denx.de> <ZhBLfQfxB_UEwvyY@robin>
 <5467f380-de35-4776-8c32-90b8e08aeda7@denx.de> <ZhGq0U_pkrYMe4S1@robin>
 <5ed4e6d2-edc7-461d-8183-e91d7b994aa5@denx.de> <ZhOg81sBEDLgCSIa@robin>
 <83e48e51-f88d-49d4-bcf9-340e229fdf76@denx.de>
Content-Language: en-US
In-Reply-To: <83e48e51-f88d-49d4-bcf9-340e229fdf76@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 4/12/24 2:53 PM, Marek Vasut wrote:

Hi,

>> Seems to work here with a broken imx8 config from the CI. Is it ok to
>> rely on dead code elimination? Apparently it is, build with KCFLAGS=-O0
>> has already several other missing symbols.
>>
>> See attached fixup
> 
> Thanks, squashed, let's see how CI likes this.

I think we are getting closer, but still ...

Pipeline #20308 has failed!

Project: USB U-Boot Custodian Tree ( 
https://source.denx.de/u-boot/custodians/u-boot-usb )
Branch: master ( 
https://source.denx.de/u-boot/custodians/u-boot-usb/-/commits/master )

Commit: 63f6a449 ( 
https://source.denx.de/u-boot/custodians/u-boot-usb/-/commit/63f6a449bffe46beca89580d3efa48e5d041025c 
)
Commit Message: usb: kbd: Add probe quirk for Apple and Keychro...
Commit Author: Janne Grunau
Committed by: Marek Vasut ( https://source.denx.de/marex )


Pipeline #20308 ( 
https://source.denx.de/u-boot/custodians/u-boot-usb/-/pipelines/20308 ) 
triggered by Marek Vasut ( https://source.denx.de/marex )
had 1 failed job.

Job #815411 ( 
https://source.denx.de/u-boot/custodians/u-boot-usb/-/jobs/815411/raw )

Stage: world build
Name: build all 64bit ARM platforms
