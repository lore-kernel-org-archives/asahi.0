Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86551BC31
	for <asahi@lists.linux.dev>; Sun, 25 Feb 2024 23:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708902713; cv=none; b=GgieRpNCKjX0Y0u2g4a8KrFhhgSZkisYmKPxi35flP1NzjGcdgS/jrnBwofV+UA/dAVEZX0pu9XrxKpCi7EWm+cry0RcyRs8eiNjEeFQLnFnnYbJi1btVNrzfSj2IHn8S20F46gQmqRoPbZGQT3IIiA242Rus1lJPymf/OTyLVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708902713; c=relaxed/simple;
	bh=zV7WUI6z4YYbxMsvkdGCPrRUTKHlR4DpzwqU5VWZ2iQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXuv04V+dEU7E9drkrsIXfgWy6WuFSiLqWTtEhuCLxuQcAjnS8t23Q4OvEKq2AU/Husr3o/f5npPxXrzEyBNN0uYVpqju3OZSO0xd/iHh0s1q7ufUEgehNIyQzi2LXVgtiXGHuQYEHTSOY2QshhEtpwoCFkErZmrD0EXf+pw9s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=bNYmCor9; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="bNYmCor9"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8203887C86;
	Mon, 26 Feb 2024 00:11:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1708902709;
	bh=PK5Pkqd4f4XpXNbwkuVkXQ9WX4qQ80CsOub/oisM5/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bNYmCor9gDKPC+Cxsw8SZ/dFpXysxrC0mNte4GqkH1qEO/r/YsH9eFnjlr133nzDF
	 H86oPFEwAkUl9mvyRel+PjXcjR+r6WBNTe4QI3BPmCBIWdP7xcey1SisT8V4oVzArD
	 EHwXbipgcGZgv+10izv4u0ymp8R5OgAMF6zKvFP85D9SLEK6HDWLWucRo6ExU3UVI2
	 7jZxDBsxCeOHb6jTv0MEovZal4TRkfXlNwmgqNtaWD6XxHnSmyMgCsiHpiKD3JLHCT
	 mk6Eba2CEuuztqIXXabBLXrtTaDYhWrIBgNF3dPmiiRR0937jM3FWB5hVjieVwqeLB
	 DUJ73FPXEXiCA==
Message-ID: <52b99ba9-3772-4074-8b64-e01dde80f6a4@denx.de>
Date: Sun, 25 Feb 2024 22:47:41 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] usb: xhci: Set up endpoints for the first 2
 interfaces
To: Janne Grunau <j@jannau.net>, Bin Meng <bmeng.cn@gmail.com>,
 Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
 <20240221-asahi-keyboards-v1-2-814b2e741790@jannau.net>
 <9cb3370e-770a-40e6-b890-ae9b5a15bd44@denx.de>
 <b0c41f38-abf0-4713-a80a-c78f074b7b4d@app.fastmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <b0c41f38-abf0-4713-a80a-c78f074b7b4d@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 2/25/24 4:28 PM, Janne Grunau wrote:
> 
> 
> On Wed, Feb 21, 2024, at 13:39, Marek Vasut wrote:
>> On 2/21/24 08:25, Janne Grunau via B4 Relay wrote:
>>> From: Janne Grunau <j@jannau.net>
>>>
>>> Apple USB keyboards carry the HID keyboard boot protocol on the second
>>> interface. Using the second interface in the USB keyboard driver does
>>> not work since the xhci has not allocated a transfer ring.
>>
>> So, what does this patch do ? That is not clear from the commit message.
> 
> rewritten for v2:
> | usb: xhci: Set up endpoints for the first 2 interfaces
> |
> | The xhci driver currently only does the necessary initialization for
> | endpoints found in the first interface descriptor. Apple USB keyboards
> | (released 2021) use the second interface descriptor for the HID keyboard
> | boot protocol. To allow USB drivers to use endpoints from other
> | interface descriptors the xhci driver needs to ensure these endpoints
> | are initialized as well.
> | Use USB_MAX_ACTIVE_INTERFACES to control how many interface descriptors
> | are initialized and useable. Currently defined to 2 as that is enough to
> | make the Apple keyboard usable.

Would it make sense to make this a tunable Kconfig option ?
