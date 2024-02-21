Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793C7288AE
	for <asahi@lists.linux.dev>; Wed, 21 Feb 2024 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708531111; cv=none; b=W7ORpIKbpNFnfjoDSI/B4Dsqqk/ysYvUBqdRrpdm2Url/sSgn9F/DrUQqRVtfFCHudQe9ZzM+nTz9nQzQIw4u/iicWXBUcCCCcBCJa6gYteQPqswPXsqqk/GxP2/qvEtDuRGgL1QTsuHjsepXyCJVziEmwNcTOgqSwOQWpjHvSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708531111; c=relaxed/simple;
	bh=B2gmZdM50EphTS5TkrxMHCwi7WschAkHE0smDyk+e6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LskPurv+WwyBzDKUf/rn2z8ujY0pQwITk/WxCibvE2K0oGJv0ja1OTfpbdgGOZbzDGjwXvRMdFXceCnkxpV9VsOSp1EjBDwd54CBgT3uJ9A/rgBQvmmp5/Lje3TybUC38psNhamK9QgthD3mS/+4Zb6KDkF9ou/0UQYcDy0riMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Y5m7SwqO; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Y5m7SwqO"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 441C687E25;
	Wed, 21 Feb 2024 16:58:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1708531107;
	bh=nEaZiWrG18X6j43qoNpjy45qjkJI8xvN9p+TB4DjtW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y5m7SwqOCPEF5Vs61sHbvOATwEl5xSZH9TQmx16ywE7vaSDPhsySpmlTIqUMYyqkQ
	 K5FyCoyF5u3cAJzxBYKuxVxCNtp2Amnx4CohRpSSBC6biG1YVScgrv3zHPgRCRNdQW
	 PXE3d213f5RghACaQv8DyzqGaJ7sIZJ1KwPuOHxu/Nc5Yy312zdkda9CtVLw49M0qO
	 iTNUWM6lIpPYF3S8WBLX0llxeCja8MuCXq8q8+KqnFqfFMwzEx63oRry5/8Igpku3v
	 imjMSZypX2tnyQJN7S6M9M0IvNZzZ/rzOL61uPaXL8KHseZIRsmsZuQ/NqsasR4VlX
	 Y1heVawHF1tGw==
Message-ID: <161786f2-cec2-44f3-b8d6-14e78c243e85@denx.de>
Date: Wed, 21 Feb 2024 13:40:27 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] usb: xhci: Abort transfers with unallocated rings
Content-Language: en-US
To: j@jannau.net, Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
 <20240221-asahi-keyboards-v1-3-814b2e741790@jannau.net>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240221-asahi-keyboards-v1-3-814b2e741790@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 2/21/24 08:25, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Discovered while trying to use the second interface in the USB keyboard
> driver necessary on Apple USB keyboards.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>   drivers/usb/host/xhci-ring.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index b60661fe05..4446f5f098 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -685,6 +685,9 @@ int xhci_bulk_tx(struct usb_device *udev, unsigned long pipe,
>   		reset_ep(udev, ep_index);
>   
>   	ring = virt_dev->eps[ep_index].ring;
> +	if (!ring)
> +		return -1;

Would it make sense to return e.g. -EINVAL or some other errno ?
