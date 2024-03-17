Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EC41CAB7
	for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710692572; cv=none; b=KJieasODXcRB5NLhfovRi7oikAvP6axn4Wy4JSO11xJk1E53gnabPHpvoelskV/tHPBgPepPtnUh9OULdl3D3YemIv9/bHx/odR6uYJ3xyUzVQHghBJmFAqfU6FJKYLKa1gnrlooMfmqIfsYV94WNOi7RpNGmKnWQDDZ4qHHK48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710692572; c=relaxed/simple;
	bh=ic0nzIJE6Sd8CELCqotDVfwwtSPKUTPEjH65+Rb6vdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uO+vYV6lPxdUkVy5wnJQZCHgpKpGrsaPrkYx6Etq+sdfmoa1mN5kjvsDfC+u8dkaHpB2Gmz1bU5ez3zihvj5iY2l1hmuYMwo5MK8jzjiogdn2you7sO41viq+GouvLm0Mjpp2/Yud1W0mHOqXpyfSi/W/3Kszrv7KYe8cnUOzCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=P8JSR6uU; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="P8JSR6uU"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 059A687E87;
	Sun, 17 Mar 2024 17:22:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710692562;
	bh=VX8PrgA42H/wZxrC9/cU5lnUXetaOn5vNszku7VLD1s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P8JSR6uU/mGvNsYDGgb5/Osq+hhIwZZueAphCS+MTLGNKKQcEmn4jeOLSVu3Y+PxN
	 E4MPuAoEXuaTAg55cwsOdNwJJFsPVbJ2Fk9g5LNO44nOQttGoduvf3x2/KJeU2siWK
	 mlhk8dnJPcY+p6GjgXuCsLfUL451Ga1tmaN7JKngRhdlqp+0T1I35Dafv4l7OOoO3D
	 Nt0D8uoxahUMxkvf+QjdkCvHgGlOuq18XJYuQdwqLpxMj1P2LscnbDKbV5AYTFilsa
	 GL8qtjuQ9mFchMrcPlTreMpYn169eOMeQYjSzyjfbKqWLjGju0rw0lhcL8E8z713KI
	 JuPZ99U/iKi3w==
Message-ID: <2f9109ef-c638-49fb-8c4c-bb32dfddfbc5@denx.de>
Date: Sun, 17 Mar 2024 17:21:26 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] usb: kbd: Add probe quirk for Apple and Keychron
 keyboards
Content-Language: en-US
To: j@jannau.net, Bin Meng <bmeng.cn@gmail.com>, Tom Rini
 <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20240317-asahi-keyboards-v2-0-d3f4b8384f68@jannau.net>
 <20240317-asahi-keyboards-v2-6-d3f4b8384f68@jannau.net>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240317-asahi-keyboards-v2-6-d3f4b8384f68@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 3/17/24 12:07 PM, Janne Grunau via B4 Relay wrote:
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
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>   common/usb_kbd.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/common/usb_kbd.c b/common/usb_kbd.c
> index 8cc3345075..43c7668671 100644
> --- a/common/usb_kbd.c
> +++ b/common/usb_kbd.c
> @@ -31,6 +31,10 @@
>   #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021	0x029a
>   #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021		0x029f
>   
> +#define USB_VENDOR_ID_KEYCHRON	0x3434
> +
> +#define USB_HID_QUIRK_POLL_NO_REPORT_IDLE	(1 << 0)

Use BIT(0) instead of (1 << 0)

With that fixed:

Reviewed-by: Marek Vasut <marex@denx.de>
