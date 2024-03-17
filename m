Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B31CAB5
	for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710692571; cv=none; b=Cnw7iNfc2tULbx5PnSggD7q1onpxkdaShUvCsyrNua3llhy0EkENoW21eOPKkFsVzM0spFajuJ2ZC9MQjIr+Y7cJ9EVri9IF9CGVl5TLhGCoY2+8fg6bAAHLR9vskVP34od3y1mcKtbYiOf9EMdfuPK/cLrdPvmsQv1gnaVHeHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710692571; c=relaxed/simple;
	bh=s+9d34+UHkl4Z7dN15T8t272BRAvb8DZhvkdQSY8HzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PedzH1XLIhbkSqJ8s2aIuAjOGGzyIQzDwqQ2Yvxue5UwlR1SmIcDjWCk34VffL2GWRoDCPZngccOn1UNSVeI6pGaLDPwSTi+yfXk9Jwuf7Wz01Xs19aXRuikAzo3laGBgvwaaLwEQ/XL1838wE0Pw8VycQnc2T2CcKkHHHKZB6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=J1ZC7nsB; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="J1ZC7nsB"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5799087DE6;
	Sun, 17 Mar 2024 17:22:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710692561;
	bh=1fSLjhc8bmLKsjNvJGGDfkeFoFV+p3ubLHlhU8Rr70E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J1ZC7nsBjaLmORJHMFlR3wpWmAao8/Qr44dLOxDtRL42rOowCXQHdg4I60Kn1l4A8
	 x7/j149QEGFfDGBxOziq2tVuIMV3yk0yMS3uBMJPZ4s4wWoXWJBOTWPfZr9DcUUmIt
	 MjwzJGcXk7YApk3oSOkIc8oSPaPxG3DSdRtaEn2cywiuKDvvRGx4PxH0GJ94HsNRl1
	 qrumq9ul37Ewyz2UuSy+A37wkrwFqgao3kDgrsAaz0hc9HZR4x7DfEMPGcnDjMjvyW
	 QFy7yobx6eelFldnc2YJonCmpWjIpXru8Rk8+e5WeYiXw85tW5LelYURryQiUhdat6
	 v+ZFXhoDL2Wgw==
Message-ID: <bdc435d7-9271-495d-ab16-c7e60c52c93b@denx.de>
Date: Sun, 17 Mar 2024 17:20:33 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] usb: kbd: support Apple Magic Keyboards (2021)
Content-Language: en-US
To: j@jannau.net, Bin Meng <bmeng.cn@gmail.com>, Tom Rini
 <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20240317-asahi-keyboards-v2-0-d3f4b8384f68@jannau.net>
 <20240317-asahi-keyboards-v2-5-d3f4b8384f68@jannau.net>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240317-asahi-keyboards-v2-5-d3f4b8384f68@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 3/17/24 12:07 PM, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Apple USB keyboards (Magic Keyboard from 2021 (product id 0x029c)) carry
> the HID keyboard boot protocol on the second interface descriptor.
> Probe via vendor and product IDs since the class/subclass/protocol match
> uses the first interface descriptor.
> Probe the two first interface descriptors for the HID keyboard boot
> protocol.
> 
> USB configuration descriptor for reference:

Reviewed-by: Marek Vasut <marex@denx.de>

Thank you for the detailed commit message, that is real helpful !
