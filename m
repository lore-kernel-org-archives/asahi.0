Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBAA168C4
	for <asahi@lists.linux.dev>; Fri, 22 Mar 2024 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711095433; cv=none; b=BXvMu+r0cN0zBcfUyvEF9z/1ube6W/4mW56qknCr4HHK4M97F6MgIpCR09cVURROqrOao0gMWRZ4yUPYngMaiol6TvQyrcVZlWvh8viqcJj42RiJiY3mXDIeLUu7Z2C3GXrb65TWOz+JNdCWQHe0Et4zxJphWZwzzjEiq5y575I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711095433; c=relaxed/simple;
	bh=W5UqkQ1m5t8Vr3A1NFNSZPekwZXFlqfGBt4YGkIembU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I769TaYlJKA2MTkJ7NmdD20CtXX4/U77OH+EZK73PCZ6ghuNzo7B4o4irvAQ6DYydotkjzm4pJbsfV5y5vy06nv3EKBauwNBU39BiHgyAeXd9z7M8/yDiLdMf1hkRShqZs8QHka6eJ+dRVRikvM4gmwtC2SZ3GtIhM77iD6gee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jrq/5ccA; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jrq/5ccA"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CBD053FB7B
	for <asahi@lists.linux.dev>; Fri, 22 Mar 2024 08:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1711095426;
	bh=waoreCry+a1Vb7hradii+A7Cq8C1LwGB6/0iMWUCzak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=jrq/5ccA2PPjaqayBBt9tGWJ6+QxWNacSuNFJWEguiVh69OArU6q1YfhECJ/Hstzi
	 0R2l0qip/JTBf88Q+B+ZM+uGAm07FD9WeN+RgmLenLF/qioj1i+6Wdvau5WK1Bc59f
	 9Pl108730zDk8XqpIMmOHhf+In4TvrqNj8GeaPlY4sGM8F5WSveRQzHCFv/KhIzIUh
	 SJc24JT8b+ZmBLOtE6W6dkuQ7szx5HxDZjR/bI+kdF4qRuRmiZmzYY5JFyeeNq55cH
	 Aa034jUsDmWsUGrzE+qWiQTjgCZ+CZHGqeTi2wSjoM55tSX9eCidna8pK3ZhS5FyXf
	 0fEEh5s6U2RHw==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40e4478a3afso9486105e9.1
        for <asahi@lists.linux.dev>; Fri, 22 Mar 2024 01:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711095424; x=1711700224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waoreCry+a1Vb7hradii+A7Cq8C1LwGB6/0iMWUCzak=;
        b=GoS5n93ZFYx56K73+fCoI8pdTv2qvoQEw4y1CoXSdJMGnw8EpJ4LDZhtKo7FQ5BC+p
         nsMMdnbAnAAOxuJu+bcQFr/oUyd8Q2TZei7cG5KAcdbqWMngvhVjBAp49dLI2Lb/d5vM
         VZOLFJjv5znTeF/IrloHCJxNDzJqahgLkZ3K35Mt7SQnbGzT4DslN3v+Owt1R9S0uOBI
         Myvg7Rw3zDWyZdUHqdU3OevdaNT7FPbbv1O6ifN4eProxmk13dt3Lltn0JK9LaPlbHv+
         ssaMx4fNKkCVuP/TZ/2vWKNhEQzkkgch6RqdIaG3CPBaNw9q4aZQQnHSqizdLObkzlpI
         3xyA==
X-Forwarded-Encrypted: i=1; AJvYcCWziTYjG9hQFmyChS72CNo0jTiPzzswdKIHEIKuyQeysPR0l4ZncPSDY73A9pewS9YfA7PTBMXHoq0ZqoKbPRA0GG/lJEQ=
X-Gm-Message-State: AOJu0YzXU4ZAeheRbSbyeRR+GKlehQwkcBIsGQxBrag9XqBsj6dBtMSt
	jIDJWEVTwhKzAzHiFXgeE5+Hj4RfuP0kYq3HK/iTdXF7qqhm/sPvn2eph42Tfy4SagUUeqE6q5l
	onWSNJtteKd/VsFIoqjulKTare3p1CUmUEGqzQbbiRuXltBN8IRJo4qICeI31Ruye20Vb
X-Received: by 2002:a05:600c:354a:b0:414:37f:18dc with SMTP id i10-20020a05600c354a00b00414037f18dcmr1041977wmq.1.1711095423801;
        Fri, 22 Mar 2024 01:17:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj5hISS3UXi1u508xBRgQtssS9QgIDWAJCncZvR5xeiHkOsMVlQzyKga4tdgzD+fhhAyAylA==
X-Received: by 2002:a05:600c:354a:b0:414:37f:18dc with SMTP id i10-20020a05600c354a00b00414037f18dcmr1041946wmq.1.1711095423390;
        Fri, 22 Mar 2024 01:17:03 -0700 (PDT)
Received: from [192.168.123.161] (ip-062-143-245-032.um16.pools.vodafone-ip.de. [62.143.245.32])
        by smtp.gmail.com with ESMTPSA id k37-20020a05600c1ca500b004140a3d34fasm2281801wms.41.2024.03.22.01.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 01:17:03 -0700 (PDT)
Message-ID: <082bfd68-1dd4-4bc5-acb3-1000de1a19b8@canonical.com>
Date: Fri, 22 Mar 2024 09:17:08 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] usb: xhci: Set up endpoints for the first 2
 interfaces
To: j@jannau.net
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>,
 Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Joe Hershberger <joe.hershberger@ni.com>
References: <20240322-asahi-keyboards-v3-0-3106dd4c4e19@jannau.net>
 <20240322-asahi-keyboards-v3-2-3106dd4c4e19@jannau.net>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20240322-asahi-keyboards-v3-2-3106dd4c4e19@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/24 08:47, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> The xhci driver currently only does the necessary initialization for
> endpoints found in the first interface descriptor. Apple USB keyboards
> (released 2021) use the second interface descriptor for the HID keyboard
> boot protocol. To allow USB drivers to use endpoints from other
> interface descriptors the xhci driver needs to ensure these endpoints
> are initialized as well.
> Use USB_MAX_ACTIVE_INTERFACES to control how many interface descriptors
> are considered during endpoint initialisation.
> For now define it to 2 as that is sufficient for supporting the Apple
> keyboards.
> 
> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>   drivers/usb/host/xhci.c | 31 +++++++++++++++++++------------
>   include/usb.h           |  6 ++++++
>   2 files changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 534c4b973f..741e186ee0 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -606,24 +606,28 @@ static int xhci_set_configuration(struct usb_device *udev)
>   	int slot_id = udev->slot_id;
>   	struct xhci_virt_device *virt_dev = ctrl->devs[slot_id];
>   	struct usb_interface *ifdesc;
> +	unsigned int ifnum;
> +	unsigned int max_ifnum = min((unsigned int)USB_MAX_ACTIVE_INTERFACES,

no_of_if being of type u8 limits the number of interfaces to 255. 
Introducing USB_MAX_ACTIVE_INTERFACES limit us to the first two 
interfaces. Is this really needed? Handling all interface would avoid 
the introduction of artificial limitations which may hit us on the next 
device.

Best regards

Heinrich

> +				     (unsigned int)udev->config.no_of_if);
>   
>   	out_ctx = virt_dev->out_ctx;
>   	in_ctx = virt_dev->in_ctx;
>   
> -	num_of_ep = udev->config.if_desc[0].no_of_ep;
> -	ifdesc = &udev->config.if_desc[0];
> -
>   	ctrl_ctx = xhci_get_input_control_ctx(in_ctx);
>   	/* Initialize the input context control */
>   	ctrl_ctx->add_flags = cpu_to_le32(SLOT_FLAG);
>   	ctrl_ctx->drop_flags = 0;
>   
> -	/* EP_FLAG gives values 1 & 4 for EP1OUT and EP2IN */
> -	for (cur_ep = 0; cur_ep < num_of_ep; cur_ep++) {
> -		ep_flag = xhci_get_ep_index(&ifdesc->ep_desc[cur_ep]);
> -		ctrl_ctx->add_flags |= cpu_to_le32(1 << (ep_flag + 1));
> -		if (max_ep_flag < ep_flag)
> -			max_ep_flag = ep_flag;
> +	for (ifnum = 0; ifnum < max_ifnum; ifnum++) {
> +		ifdesc = &udev->config.if_desc[ifnum];
> +		num_of_ep = ifdesc->no_of_ep;
> +		/* EP_FLAG gives values 1 & 4 for EP1OUT and EP2IN */
> +		for (cur_ep = 0; cur_ep < num_of_ep; cur_ep++) {
> +			ep_flag = xhci_get_ep_index(&ifdesc->ep_desc[cur_ep]);
> +			ctrl_ctx->add_flags |= cpu_to_le32(1 << (ep_flag + 1));
> +			if (max_ep_flag < ep_flag)
> +				max_ep_flag = ep_flag;
> +		}
>   	}
>   
>   	xhci_inval_cache((uintptr_t)out_ctx->bytes, out_ctx->size);
> @@ -637,9 +641,12 @@ static int xhci_set_configuration(struct usb_device *udev)
>   	xhci_endpoint_copy(ctrl, in_ctx, out_ctx, 0);
>   
>   	/* filling up ep contexts */
> -	err = xhci_init_ep_contexts_if(udev, ctrl, virt_dev, ifdesc);
> -	if (err < 0)
> -		return err;
> +	for (ifnum = 0; ifnum < max_ifnum; ifnum++) {
> +		ifdesc = &udev->config.if_desc[ifnum];
> +		err = xhci_init_ep_contexts_if(udev, ctrl, virt_dev, ifdesc);
> +		if (err < 0)
> +			return err;
> +	}
>   
>   	return xhci_configure_endpoints(udev, false);
>   }
> diff --git a/include/usb.h b/include/usb.h
> index 09e3f0cb30..3aafdc8bfd 100644
> --- a/include/usb.h
> +++ b/include/usb.h
> @@ -49,6 +49,12 @@ extern bool usb_started; /* flag for the started/stopped USB status */
>    */
>   #define USB_TIMEOUT_MS(pipe) (usb_pipebulk(pipe) ? 5000 : 1000)
>   
> +/*
> + * The xhcd hcd driver prepares only a limited number interfaces / endpoints.
> + * Define this limit so that drivers do not exceed it.
> + */
> +#define USB_MAX_ACTIVE_INTERFACES	2
> +
>   /* device request (setup) */
>   struct devrequest {
>   	__u8	requesttype;
> 

