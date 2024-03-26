Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61796FBFC
	for <asahi@lists.linux.dev>; Tue, 26 Mar 2024 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711442444; cv=none; b=qPPNl9c8yFQU2ZP/3OpYY/mYzOCjrGgwuScMdwryi5dQA0MHi3m2w/Weej/QMXhfGFwzgkiN6LTTVpeAR7eJWU+wWWgKwDgyKWp/30Z0l4WAFBWdzZheLDmErYs+71duMEcWo7QVYG5/qe+zGovkbkKAqpXlIPyrBTA2ECEnxgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711442444; c=relaxed/simple;
	bh=cvfGi4U0x8PjhzRwGrk/7rYOkx6Yr16CPUwCpNBptjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqfYRLb53wvJk/kF3pXv0uezOt7rMX6F++BceO934tBzLJs1fAsUQe7kNDm4bT3wuNSKx3CDQonzuPDfVCSE5FqoTJqGClLDxM0bRUicbxUFbYqE/2wqFzjuCL+KfRFXXhd8VshagPj9CD4xRaxyghUO8tDrarrh9RTL+s0jg0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=KpYOgWj1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BNSSwmSv; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="KpYOgWj1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BNSSwmSv"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 55D4911400C5;
	Tue, 26 Mar 2024 04:40:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 26 Mar 2024 04:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711442441; x=1711528841; bh=uLDslNtMa8
	UbGGtc66/a8tBxA69zC3b2k4JuPcT5aAE=; b=KpYOgWj1gDKaLRyYqsaj9a+1Au
	ptoqwLKLWbO/5F5Uq8jlRpVR8XvGHpSMBYqCneB4kUA0zVnNvRNekfMFAhgXKae3
	KwT2JLi6y5XJiL8dZzWjTWTzsM9RqbNw3PTu+8Qs3EN7SxFEqE6LfDVVZKW499hj
	gEJfflvpqHKNck5xiojFaoyG/U2BLMQPTzrBwQpdDaMchQoEZR3c5bZU85vQjYT8
	4eHSr+tBSlYrNzzJKslaw/REk3N95/c9WVlwvTTfcQ5Mj1MOzPZGVakxcc9Fw3s7
	StVVAkQ0MAY4urFlSJfIEOPt+eMXiBaEpn2iQFez9HB45Vkz9x5uPmEIWL8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711442441; x=1711528841; bh=uLDslNtMa8UbGGtc66/a8tBxA69z
	C3b2k4JuPcT5aAE=; b=BNSSwmSvqX8y0gHbBOoIaRKHkV5f3xGovyNFJLjvjU3H
	Bc1R7qg8kVM4EC6o39gaKAZpL40yqOipf6L0CdjngZ1QP3ptvkK2VOjSaDc4qcpo
	884wTgKlvCAPS0oNx0m6ve+X3KJNrIMyKn7NvDcaN37Jg2QNosn0ciZTf11pYLaH
	Etw5CFsZK1MDReIQyRxLCRV8K8dE8Xcos7/4amHuVWmXxnWqYjbRDY3xjg1elJlz
	q1VPJXP4Ak0E4MKxHkIt3wyiXkdlf8Wts/8iTT2fGWH7NH2T7ZF6ehnedx/kE1Wo
	FqdE6iso4S+WaGda2bgJHWlbOXgtTnqoV/00LZtGmA==
X-ME-Sender: <xms:CYoCZhi0aM5OnPAosksf4SKFS4o5Ts1QPW6XLMC10seW67Ai1CTHvw>
    <xme:CYoCZmBaeBK3hLSmoYff1J8MQFUBfQJ3vOtJs_HbD-DzVr7frl_6bP7NpBchRmofv
    _QUUscKchROqgaCB28>
X-ME-Received: <xmr:CYoCZhETUYY0fRkvuTD0-tTn0baRYXow_doYtwJDq4b6ls4camvw5E4ztcjZpNOASF7HtO9OecjdK7d8SZurwLD9TfzVM9_HXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduvddguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghn
    nhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnh
    epgfdvffevleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhgrnhhnvg
    esjhgrnhhnrghurdhnvght
X-ME-Proxy: <xmx:CYoCZmTQNZ7uhmO0OlZHHLlKbd4prURRM0iZpMLjddU39eVO-1DLfg>
    <xmx:CYoCZuxWl8YoYSDSTjv8N4rRQ0hEnK1Xe8fv_C26t7Vfs7hdo8MUJA>
    <xmx:CYoCZs6m_tDXGUpWD6aDNB3fgFN01DObQf1YQGhttY_1xvA8eG27rg>
    <xmx:CYoCZjyrz6LnvXXcA-gvC4xknllgaSfeuFoOXeD4cKAubEnMWRPDTA>
    <xmx:CYoCZifSr6Es8RS8us67SVK-oAaaklxWYijRtGABc4MW4UnqU0bNJw>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Mar 2024 04:40:40 -0400 (EDT)
Date: Tue, 26 Mar 2024 09:40:39 +0100
From: Janne Grunau <j@jannau.net>
To: Marek Vasut <marex@denx.de>
Cc: Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Joe Hershberger <joe.hershberger@ni.com>, u-boot@lists.denx.de,
	asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v3 4/6] usb: Add environment based device ignorelist
Message-ID: <ZgKKB_j02eAVltTs@robin>
References: <20240322-asahi-keyboards-v3-0-3106dd4c4e19@jannau.net>
 <20240322-asahi-keyboards-v3-4-3106dd4c4e19@jannau.net>
 <fcc7e54e-5e52-4b27-bc0c-801954ccf0ca@denx.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fcc7e54e-5e52-4b27-bc0c-801954ccf0ca@denx.de>

On Fri, Mar 22, 2024 at 12:56:37PM +0100, Marek Vasut wrote:
> On 3/22/24 8:47 AM, Janne Grunau via B4 Relay wrote:
> 
> [...]
> 
> > @@ -1099,6 +1142,20 @@ int usb_select_config(struct usb_device *dev)
> >   	le16_to_cpus(&dev->descriptor.idProduct);
> >   	le16_to_cpus(&dev->descriptor.bcdDevice);
> >   
> > +	/* ignore devices from usb_ignorelist */
> > +	err = usb_device_is_ignored(dev->descriptor.idVendor,
> > +				    dev->descriptor.idProduct);
> > +	if (err == -ENODEV) {
> > +		dev_dbg(dev->dev, "Ignoring USB device 0x%x:0x%x\n",
> > +			dev->descriptor.idVendor, dev->descriptor.idProduct);
> > +		return err;
> > +	} else if (err == -EINVAL) {
> > +		printf("usb_ignorelist parse error in \"%s\"\n",
> > +		       env_get("usb_ignorelist"));
> 
> Please use dev_err() here consistently with dev_dbg() above.

I didn't use dev_err() since the parsing error is not specific to the
device. It doesn't matter much. I'll change it and resend after we've
settled the new discussion about the interface limit.

> With that fixed:
> 
> Reviewed-by: Marek Vasut <marex@denx.de>

thanks,

Janne
