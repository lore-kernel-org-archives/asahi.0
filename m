Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD1E13AA50
	for <asahi@lists.linux.dev>; Tue, 27 Feb 2024 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709039566; cv=none; b=ZU8lhB6SC2EWnhjNtFfiDLd+t+CDPFOOXh963R+gs+ikRBnCCHCptZykR0MKsSpVHw4tV3L1B0WcZTt2MCNqF1x7OhcIsiRcUcXQHfZrrY2ND6oKYv5Y7QQs7meW6EQm0GUwqf3uLuGcTddB0KqOZctFnv5kOxm52dFseamf4vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709039566; c=relaxed/simple;
	bh=SxG+gqbSxwneqJrccfX5FRI524NzOe2/SRsvI6vbX78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgXWx8BmB4ZWXjTW6LMMjT/1zSHT+ijz4tgFnFyGkvq7OXGV++ID12/ZcESQ++E+O3U0X0UViFL47eJvJuCo92uqaMaLDJ+NBb6QjyNUe/XNb9vP8AIs8pIilpM4NGScNVZGbwfxNholfF1xkzPHQ4v52cTRzNhA+ivbDuDvP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Yy9xz6Ud; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Yy9xz6Ud"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A46DF87F7B;
	Tue, 27 Feb 2024 14:12:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1709039563;
	bh=fXEv76m2IYxeaKNB49FiT81DQdpYMh0GurOb78tk6Oc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yy9xz6UdYcLXz4DTM7gh/fWU1Cr3MmJWS7qRG4GA+OV23BSU154ApvjBsLRpaMdhx
	 A+EX8afGX/d/3PL1lUtbksCDesWS8JS2EWdBNxHRSI+KLnVy9d2YOijDNj11rYBm6n
	 zadcnqRslbH13Td6RqVy8eranLESeMwbNn+2uOAQe6hihOv5d2NP4DS3slvN8k44EG
	 UGeWVMIyQ06OW6puqABUVQ2f6UiTHhnyjXa3Yvx303DT4+0EqIpQMqEBbxjxSVH2xC
	 CwfiHDjwzkLFG0/Bz7alIx2XqV5pFehYxPY0JOtk3650m/2GORPX4Kn8385bNjewdA
	 7dmwUprMlIyhA==
Message-ID: <71ab8e0f-eda5-42e1-b0f9-1bd958b68397@denx.de>
Date: Tue, 27 Feb 2024 13:02:31 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] usb: xhci: Set up endpoints for the first 2
 interfaces
Content-Language: en-US
To: Janne Grunau <j@jannau.net>, Bin Meng <bmeng.cn@gmail.com>,
 Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
 <20240221-asahi-keyboards-v1-2-814b2e741790@jannau.net>
 <9cb3370e-770a-40e6-b890-ae9b5a15bd44@denx.de>
 <b0c41f38-abf0-4713-a80a-c78f074b7b4d@app.fastmail.com>
 <52b99ba9-3772-4074-8b64-e01dde80f6a4@denx.de>
 <0ec5ded2-f3f7-4e79-afbd-f6f560ab0627@app.fastmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <0ec5ded2-f3f7-4e79-afbd-f6f560ab0627@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 2/27/24 8:38 AM, Janne Grunau wrote:
> Hej,
> 
> On Sun, Feb 25, 2024, at 22:47, Marek Vasut wrote:
>> On 2/25/24 4:28 PM, Janne Grunau wrote:
>>>
>>>
>>> On Wed, Feb 21, 2024, at 13:39, Marek Vasut wrote:
>>>> On 2/21/24 08:25, Janne Grunau via B4 Relay wrote:
>>>>> From: Janne Grunau <j@jannau.net>
>>>>>
>>>>> Apple USB keyboards carry the HID keyboard boot protocol on the second
>>>>> interface. Using the second interface in the USB keyboard driver does
>>>>> not work since the xhci has not allocated a transfer ring.
>>>>
>>>> So, what does this patch do ? That is not clear from the commit message.
>>>
>>> rewritten for v2:
>>> | usb: xhci: Set up endpoints for the first 2 interfaces
>>> |
>>> | The xhci driver currently only does the necessary initialization for
>>> | endpoints found in the first interface descriptor. Apple USB keyboards
>>> | (released 2021) use the second interface descriptor for the HID keyboard
>>> | boot protocol. To allow USB drivers to use endpoints from other
>>> | interface descriptors the xhci driver needs to ensure these endpoints
>>> | are initialized as well.
>>> | Use USB_MAX_ACTIVE_INTERFACES to control how many interface descriptors
>>> | are initialized and useable. Currently defined to 2 as that is enough to
>>> | make the Apple keyboard usable.
>>
>> Would it make sense to make this a tunable Kconfig option ?
> 
> I thought about that but I don't think it's worth it. We would have to default it to 2 (at least when the USB keyboard driver is enabled) since we can't predict which devices will be connected.
> Why would anyone chose a different value than the fixed value? I can't think of convincing reasons.

All right

Reviewed-by: Marek Vasut <marex@denx.de>
