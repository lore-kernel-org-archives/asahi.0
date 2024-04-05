Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B175E16EC1B
	for <asahi@lists.linux.dev>; Fri,  5 Apr 2024 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712329982; cv=none; b=j/S2GSP7W89KvpWIsgKigwAvFr8LbdkLB448YAmCBNMjwmOsPLSD5sL3b3JBaXNtLFL7JKDzTON2EMG4Rz52Bxs2BuND69Ha3DqPmJaFcR8BSbryZukxgu2YAce5VxUFob0pfabYI9iJkZw6dWY4gt+r48Ff2PTFEI2llb31wYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712329982; c=relaxed/simple;
	bh=5v6Pm8dIutVD5U6XWvaxwpk59IsGYcI+LlFlF+xmwA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rwk/6ggBn9f9oUKOje7xdsWUUMx7B5t867iM8q11q4JubxQTefrQe60P3h11zE/bPw7T/HsY34nd6T0nTGsPv0A4tqyixgXcqYNC3oaQpmxGd2V8ZGzEuD5WSW1n5g8PLhK2GjcLI6qswQtaHPyjfuVlRfFLyP/ClBtI3LctV/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=l/0cFlPu; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="l/0cFlPu"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 49AEA883EA;
	Fri,  5 Apr 2024 17:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1712329972;
	bh=ulEARfXWYhejj07AfEZcHQvS0PukF2coDZMTnB0OWP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l/0cFlPugXTVEAXudyX+diN/cCU+Satbm07JJy5P/RLkOLGz59JDwDqzfzV1iPaWq
	 5XZ60YvOnxf8Vti5Rt3aGPBRkHqUw9rsAR2RLriJqtS0dcp3lLXMu+OdNtnc6wJ6dm
	 RawRndvfYewbFwBRHN34sQmE2kAUhaoj39hUbxoCmHP8HA8sFmp5/JincOPAkMVfdh
	 EFrd3ERYhLl57gD7GIHkmRoZwciO7+li2bpB1qaOrCtJ3EWZZudQygKkebci0UFgFF
	 vBiBsWex2jaIvluZGGN2HY1WMEQ1X9505UM2o59S+eIWVF8QrDr1e9fMHySdTJH0mU
	 m3K8EliPzfFoQ==
Message-ID: <356b892a-a681-4ae0-a6c8-ed1b4b5a8717@denx.de>
Date: Fri, 5 Apr 2024 16:52:32 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] USB keyboard improvements for asahi / desktop
 systems
To: j@jannau.net, Bin Meng <bmeng.cn@gmail.com>, Tom Rini
 <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>
References: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 4/4/24 8:25 AM, Janne Grunau via B4 Relay wrote:
> Apple USB Keyboards from 2021 need quirks to be useable. The boot HID
> keyboard protocol is unfortunately not described in the first interface
> descriptor but the second. This needs several changes. The USB keyboard
> driver has to look at all (2) interface descriptors during probing.
> Since I didn't want to rebuild the USB driver probe code the Apple
> keyboards are bound to the keyboard driver via USB vendor and product
> IDs.
> To make the keyboards useable on Apple silicon devices the xhci driver
> needs to initializes rings for the endpoints of the first two interface
> descriptors. If this is causes concerns regarding regressions or memory
> use the USB_MAX_ACTIVE_INTERFACES define could be turned into a CONFIG
> option.
> Even after this changes the keyboards still do not probe successfully
> since they apparently do not behave HID standard compliant. They only
> generate reports on key events. This leads the final check whether the
> keyboard is operational to fail unless the user presses keys during the
> probe. Skip this check for known keyboards.
> Keychron seems to emulate Apple keyboards (some models even "re-use"
> Apple's USB vendor ID) so apply this quirk as well.
> 
> Some devices like Yubikeys emulate a keyboard. since u-boot only binds a
> single keyboard block this kind of devices from the USB keyboard driver.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>

I picked the series, but CI indicates build errors, can you have a look ?

https://source.denx.de/u-boot/custodians/u-boot-usb/-/pipelines/20215

Thanks !
