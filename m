Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F19288AE
	for <asahi@lists.linux.dev>; Wed, 21 Feb 2024 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708531113; cv=none; b=FWdfE2Xm6sbvPbcKyTftG5N61pCsFMrkgOUzFDdMBlO+J+YySBP9mV7AWBAq9bDugJEN5T1Op0Ib98qVcpN96FW05APUVRat+8EgdGKM0mV/COvfDBO2dY37o1j1zxiLq1gtUlXUjktDRn5HW4Q/DtsGkcddJusXKhkhXPn2V20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708531113; c=relaxed/simple;
	bh=fkJ1rRFo/YOwYCBp6nPPLiH2foLwknpd0AdGsRPU0GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OoGZ/TbBeHPEcmkCVEanubNSRCDBq+rK7whonJ7X7MYptLlwY2Hkv2XcxOs+jXG1rTdsJ7rAHbBZIrbRhUflvhV9gIf0ZDorcfvPO1kOi0V6jKmw9e6pe0mQsKQ6spx0CReUutKVR8dNyMs/R5wYeL9p6aPwcIGOojJ0+aKYVyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Z34EDWu0; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Z34EDWu0"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D21F988022;
	Wed, 21 Feb 2024 16:58:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1708531108;
	bh=kqBX0JzVkB7wJ5qR0R42KTFV9YGAgPUEFw9oFwILHiE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z34EDWu0OM+rg4YPB9SuwrgWtuw/HWMgaMXq9RkJvNDD7vEsX7VK424J37n6gMejy
	 eVkP1qgOE5367mtVtvzhy8yGDfUnJKSFXuMxZOImsK9Bxah36D9oa2Pl+hHMlWw3uV
	 gng7rgfW/ZgCuwu8rgHfB7eg1X7NlrHdVsgaSZCn6RSAMnTXUFvYeCFp0VChjpTEzU
	 kW1+Pfir1gHWgE+gyj8blqsh2udUYPYTduAe/mh2hIn9dY8PIdJ+ODiyI/gYvahdUQ
	 orkld9CVJOvtJ45ITxvUgKj2y0YYALDIIAPW9suIdbpSqvTmwGAW/aov2ZAxGnZG9g
	 yNOhS1RPmWCpw==
Message-ID: <2acb9976-a40e-4977-b7ca-2462e84251ed@denx.de>
Date: Wed, 21 Feb 2024 13:41:32 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] usb: kbd: Ignore Yubikeys
Content-Language: en-US
To: j@jannau.net, Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev,
 Hector Martin <marcan@marcan.st>
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
 <20240221-asahi-keyboards-v1-4-814b2e741790@jannau.net>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240221-asahi-keyboards-v1-4-814b2e741790@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 2/21/24 08:25, Janne Grunau via B4 Relay wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> We currently only support one USB keyboard device, but some devices
> emulate keyboards for other purposes. Most commonly, people run into
> this with Yubikeys, so let's ignore those.
> 
> Even if we end up supporting multiple keyboards in the future, it's
> safer to ignore known non-keyboard devices.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>   common/usb_kbd.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/common/usb_kbd.c b/common/usb_kbd.c
> index 4cbc9acb73..774d3555d9 100644
> --- a/common/usb_kbd.c
> +++ b/common/usb_kbd.c
> @@ -120,6 +120,15 @@ struct usb_kbd_pdata {
>   
>   extern int __maybe_unused net_busy_flag;
>   
> +/*
> + * Since we only support one usbkbd device in the iomux,
> + * ignore common keyboard-emulating devices that aren't
> + * real keyboards.
> + */
> +const uint16_t vid_blocklist[] = {
> +	0x1050, /* Yubico */
> +};
> +
>   /* The period of time between two calls of usb_kbd_testc(). */
>   static unsigned long kbd_testc_tms;
>   
> @@ -465,6 +474,7 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
>   	struct usb_endpoint_descriptor *ep;
>   	struct usb_kbd_pdata *data;
>   	int epNum;
> +	int i;
>   
>   	if (dev->descriptor.bNumConfigurations != 1)
>   		return 0;
> @@ -480,6 +490,15 @@ static int usb_kbd_probe_dev(struct usb_device *dev, unsigned int ifnum)
>   	if (iface->desc.bInterfaceProtocol != USB_PROT_HID_KEYBOARD)
>   		return 0;
>   
> +	for (i = 0; i < ARRAY_SIZE(vid_blocklist); i++) {
> +		if (dev->descriptor.idVendor == vid_blocklist[i]) {
> +			printf("Ignoring keyboard device 0x%x:0x%x\n",
> +			       dev->descriptor.idVendor,
> +			       dev->descriptor.idProduct);
> +			return 0;
> +		}
> +	}

I vaguely recall a discussion about previous version of this, I think 
the suggestion was to make the list of ignored devices configurable via 
environment variable, so users can add to that list from U-Boot shell. 
Would it be possible to make it work this way ?
