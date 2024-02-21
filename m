Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FA380C1A
	for <asahi@lists.linux.dev>; Wed, 21 Feb 2024 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708531112; cv=none; b=LB5DyWARUyflCdvkFXgLmA4cGoj6MBnvQZKzODKp3m/KhlDzanG9bIz+uFuaGrbrTiiNvS8JeJ2kC0scsVr5nnpU+t6n259iNxiXkSexTLFxI9b2yahnhlvtdebV8dQxa278R4Rf3AhQehlXNsE7J5YB2mtAKyAohZvuY8wZ8Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708531112; c=relaxed/simple;
	bh=d1/oLGSnyTOzDs8ghjydIY844GPa/uA7jhwyetmeFxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8nIGUZXU3PJIteBNZte4sBDeAH2scU8E6DigpnKJ/jvWR3ZW7kPmjA2YNoQaDzJMhEiJb/1TY0Odlg4WQcjWbtSMLTCvtjTwTkCOgS8RqGFBNxRTmPT/tELSg7DpDjwk0N7gW7tjm5NXnWs/ZW6VeIGyGniK26BEbNdJVuXELw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=osfoOtDA; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="osfoOtDA"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 76D408802E;
	Wed, 21 Feb 2024 16:58:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1708531108;
	bh=j4s/eCJe9+xUOvNoe28h+lHhDKA32lj8dxUTf0J9TyE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=osfoOtDAnEFu8uJrM9V0sdaITY8ymLAE/lOdC3kOtq2/lftboQ0uvYR+EDnojZkOP
	 G0peEZceM8Cvg7PX3Mi0PnTo2JxJ6g9bc7zfKN7CdGW8YVg/VzwIN4mCPGIVbDfZ03
	 UqU3r5bpmI7UntNNPkrYx86m6esW80DViKOXcJOwXI2OdmlE5SRCHUf9v/39WhGH+B
	 6MWgZSLv5YoHlPnomWDwiIwur93x3mkI1GXzUeOrMg2DZwNOrmYS07GSZeWsbY6Cwo
	 WuFZ+VwhBW1DhBnbQmEpzBNaSUXcmGSx9BbBkhKnIS2Gi6H2/QipEmRm1Auy1Gx5WF
	 O9ULyN66MHw2w==
Message-ID: <1f064fc8-6f73-4b55-a1df-b77236c52c82@denx.de>
Date: Wed, 21 Feb 2024 13:44:10 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] usb: kbd: Add probe quirk for Apple and Keychron
 keyboards
Content-Language: en-US
To: j@jannau.net, Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
 <20240221-asahi-keyboards-v1-6-814b2e741790@jannau.net>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240221-asahi-keyboards-v1-6-814b2e741790@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 2/21/24 08:25, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Those keyboards do not return the current device state. Polling will
> timeout unless there are key presses. This is not a problem during
> operation but the inital device state query during probing will fail.
> Skip this step in usb_kbd_probe_dev() to make these devices useable.
> Not all Apple keyboards behave like this. A keyboard with USB
> vendor/product ID 05ac:0221 is reported to work with the current code.
> Unfortunately some Keychron keyboards "re-use" Apple's vendor ID and
> show the same behavior (Keychron C2, 05ac:024f for example).

Uh, fun.

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !
