Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9924A80C1A
	for <asahi@lists.linux.dev>; Wed, 21 Feb 2024 15:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708531110; cv=none; b=ExOMV17ivNta6rsAwPtrSbmDuS6UfDtDJYQpdGyNqu2xcMN6rPtI2Qe7v+uyZwuge/4BWCFXzNXkC4ynJjoKwiiY2xoFxC3Co/g/rjnRi2V7sbtQDn/VAyYX8BaGsFYf0gLOvMy2aeiJY5cfg5IW4uevzLAhRsK+Xmozmvb5pzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708531110; c=relaxed/simple;
	bh=583zvZ5K092bfB0orJ2PgcyU7umvNc1oUGLBcoRXXX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCBYv/luc0RKqnvSly6/0kKAik9LFI7nU0zEbieX2O8qI0ZQ82+VDoPLI5S7q0nq+P3yVh90XbhNuiFGrLZVsYrGvtEpEom8WmzXWnHdWvlzBZMs7JsGB7e1UvsSpTiPyrqthFhtrkxO4LY491IBfiBPfPKxSOFjpDMKmplD+H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=yhsGUOxy; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="yhsGUOxy"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9C97787C86;
	Wed, 21 Feb 2024 16:58:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1708531107;
	bh=WIzfjaBAEjkLhIsoNUXTLDkm0woLaw8EudwwKdTR584=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yhsGUOxyJd4B/I4t+5ZGfaL6x+mpvyRJPg6b0dIl9tD7ospqfz/h8JuV68fYZwyXD
	 Nra5KtpzJRN4ePupz/Uim7lWcDZFEgrjvf9h0zHZc+LbQ57nVG1M5ptP0WJAZkmumC
	 3AAd24qskI8Kb2m1afQVOBDmY6nnmJ59e/moFl4JNKmvbYrmG0PvCYub7w6gIefzZ2
	 2nCGn2PC8pDHqdIiIriK3b94fW8ho91ovx9RvlovoudaT4w05ISWksJJm+0LbM8zpv
	 V8ku7Gj7ETAyweMcv4PEM/IJRe02ownRnm1XyCAFhAwk1OsO4bwE9Y7Pv7GTEZ5sK1
	 E0f/pHzdLorMA==
Message-ID: <9cb3370e-770a-40e6-b890-ae9b5a15bd44@denx.de>
Date: Wed, 21 Feb 2024 13:39:39 +0100
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
To: j@jannau.net, Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
 <20240221-asahi-keyboards-v1-2-814b2e741790@jannau.net>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240221-asahi-keyboards-v1-2-814b2e741790@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 2/21/24 08:25, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Apple USB keyboards carry the HID keyboard boot protocol on the second
> interface. Using the second interface in the USB keyboard driver does
> not work since the xhci has not allocated a transfer ring.

So, what does this patch do ? That is not clear from the commit message.

btw. missing SoB line.
