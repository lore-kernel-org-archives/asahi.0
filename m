Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449F43F9F5
	for <asahi@lists.linux.dev>; Fri, 22 Mar 2024 11:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711108601; cv=none; b=noSPGT+4CLNincgH45niUy5x72ZgHgJ02b5qmFjYrcBasgFcsL4+KfT4u/MJgYGdmGVkseI36Q9cPQfJ9B8FR7pzOqY6Ck5lMoXRL9NLNmAnfo7KJsEuHJW+vURweWq+/hP8mv4cQ15lAc4Ao4r6Awnm/dMVNTSj8sj5CQ9WvZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711108601; c=relaxed/simple;
	bh=ca5VV8/MBpQctp2WF7AT+mnRPlWus/09ylShQTBHwjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LeQRCRW4naTcGDKH1tKl03SMDPzd/S01aEm4dshQ7EHSgkKbkwh+rpCpf2OH9esYbtXUQHX3Pz6Dgbu5T/iomr428RibeD6vi4kS5EBZ9MO1xkIUjY4vGpd+fkjqTwY1w0l++jWv8BGuvmUG+6I0Gk5IXRbh2/MXUSlO61Z7fic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=cFug038s; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="cFug038s"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F0E64881E9;
	Fri, 22 Mar 2024 12:56:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1711108598;
	bh=Zrv9sEJQbbqZE4BV8WdANZAePtMJnKYlQBZZIBqydj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cFug038s+3YqF2dYBxvLo87ZPKuC7FDvGHNBJE3YOUTp9JmhWxRgwEqZ6ko9iO7xU
	 syw9Ith6VuRd7WdiP8k7jojOBKsyterrylqoNLLak44x0dv1EsEcF/A1PrGPlrSnpe
	 aALRuNp9ISRDMjMdB/WDMFX9nJVKA678U5XQQhWrizyaFk5ggWXXg9t9+FLv/Rrw9S
	 sYhsoUQH8FDtPFutpJmSXdwzZMCXjKlShVXCuZaliXe90Yb4DUixUuIqfoDQ8VYplb
	 kO3PeFN7bCJzMsBbJ+laGOIuYG//qvWzI+JZoqsMwP5HX+0desysrdn+I1mYudtJv+
	 M8ABxptA1p8LQ==
Message-ID: <fcc7e54e-5e52-4b27-bc0c-801954ccf0ca@denx.de>
Date: Fri, 22 Mar 2024 12:56:37 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] usb: Add environment based device ignorelist
To: j@jannau.net, Bin Meng <bmeng.cn@gmail.com>, Tom Rini
 <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Joe Hershberger <joe.hershberger@ni.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>
References: <20240322-asahi-keyboards-v3-0-3106dd4c4e19@jannau.net>
 <20240322-asahi-keyboards-v3-4-3106dd4c4e19@jannau.net>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240322-asahi-keyboards-v3-4-3106dd4c4e19@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 3/22/24 8:47 AM, Janne Grunau via B4 Relay wrote:

[...]

> @@ -1099,6 +1142,20 @@ int usb_select_config(struct usb_device *dev)
>   	le16_to_cpus(&dev->descriptor.idProduct);
>   	le16_to_cpus(&dev->descriptor.bcdDevice);
>   
> +	/* ignore devices from usb_ignorelist */
> +	err = usb_device_is_ignored(dev->descriptor.idVendor,
> +				    dev->descriptor.idProduct);
> +	if (err == -ENODEV) {
> +		dev_dbg(dev->dev, "Ignoring USB device 0x%x:0x%x\n",
> +			dev->descriptor.idVendor, dev->descriptor.idProduct);
> +		return err;
> +	} else if (err == -EINVAL) {
> +		printf("usb_ignorelist parse error in \"%s\"\n",
> +		       env_get("usb_ignorelist"));

Please use dev_err() here consistently with dev_dbg() above.

With that fixed:

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !
