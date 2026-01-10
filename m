Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF9A1DE2C9
	for <asahi@lists.linux.dev>; Sat, 10 Jan 2026 03:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768015542; cv=none; b=cnMEhtrHCq8pvC4Wl0PduNGvo1LJb39qCwJC3eeYay9twSGPCnicYPyHRF5E4Q3smOmOYTzBY/bz9IfpaSLP0I4PgT3YKIX6mGg9FiWJc5XiSBIZ1GQhUraK7YkrA9qscr0mYTclnLENNAfmsDmhjthanjW1PoefjcfDWOj8SR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768015542; c=relaxed/simple;
	bh=Hprd7dqrUFFTSjGW0BdussBG/keW8gExHfrWCA1IxLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k63UQe4Wn9WpfUH+k3Cb+l12GLIsC14eGR38c/pTpk71VHGABr4I4Nu6aJwwE3Ack5O+j5+DLImhVgCLy/uLGuMcvRT36w7JT5CHgr98lCw/p+H2LGqVcZ73fI4j0UdEwwWMtrjAO4jOND/OFccsRFKXOVzlVtYqMJ7EVqy9mvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ybm3Gicq; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ybm3Gicq"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dp3tc319Nz9tKY;
	Sat, 10 Jan 2026 04:25:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768015528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g5O/MYxRlpIUbzmq4/wFA8doL3V40//2Cl8RI+G3ul4=;
	b=ybm3GicqH3ng/hN3qh3W5hYdgFp9fHS4qGFmncYYoK3p4OA6KkfCayHfA6zC6/nnYGwYfH
	0ThXRztr99PhVc8hkHxhcIJi95HSpyize2iUulkAr8z5SM2YTEnS/DYszF7prsEH+OfjI+
	Vf3T3B00vENDwlQnBuk4JPjV/B5hIC7AD0zsLmhayotKTAu5U0nwOY1toRpFHuRUKfJ9gB
	94VcgVv5SbUtvKZFbK9UAiUR2l7HxlWGOdSH7Lw0KYJUlIgJemzyg05xwWLxXjBhgI0n3Q
	qDubIa4mDCaRkwdeb99ef3xk+02KZ9yq5TAVIy93HDdZKrJVa5mBWyz5fcy3eQ==
Message-ID: <8063e878-2fc9-4d97-b4e5-fb70fe3b8cc1@mailbox.org>
Date: Sat, 10 Jan 2026 03:06:53 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] usb: xhci-dwc3: Add "apple,t8103-dwc3" compatible
To: Janne Grunau <j@jannau.net>, u-boot@lists.denx.de
Cc: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>,
 Tom Rini <trini@konsulko.com>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 asahi@lists.linux.dev
References: <20260109-usb-dwc3-apple-compat-linux-v1-1-b6e255b5e5af@jannau.net>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260109-usb-dwc3-apple-compat-linux-v1-1-b6e255b5e5af@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e0bd039d18c55cfe032
X-MBO-RS-META: uo6nwymi1tikrncdfimeg4opthewanw5

On 1/9/26 8:41 PM, Janne Grunau wrote:
> The Linux support for dwc3 on Apple silicon SoCs switched to using a
> apple specific glue driver [1] that uses it own compatible string. The
> glue driver handles platform specific requirements on the interaction
> between dwc3 and the USB2/USB3 PHY and reset-controller for USB role
> switches and plug events.
> To keep USB working as before when the nodes still carried "snps,dwc3"
> as compatible add "apple,t8103-dwc3" to the of match table. Eventually
> it is probably advisable to add a dwc3-apple glue driver and write code
> for the currently empty Apple Type-C PHY driver in phy-apple-atc.c.
> 
> Link: https://lore.kernel.org/asahi/20251015-b4-aplpe-dwc3-v2-0-cbd65a2d511a@kernel.org/ [1]
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>   drivers/usb/host/xhci-dwc3.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/host/xhci-dwc3.c b/drivers/usb/host/xhci-dwc3.c
> index e3e0ceff43e6abdb8643f265819eff28c2c802f4..ba42c3247654b7d9272c42ea9c4cf0bd9082915e 100644
> --- a/drivers/usb/host/xhci-dwc3.c
> +++ b/drivers/usb/host/xhci-dwc3.c
> @@ -238,6 +238,7 @@ static int xhci_dwc3_remove(struct udevice *dev)
>   
>   static const struct udevice_id xhci_dwc3_ids[] = {
>   	{ .compatible = "snps,dwc3" },
> +	{ .compatible = "apple,t8103-dwc3" },


Please keep the list sorted.

With that fixed:

Reviewed-by: Marek Vasut <marek.vasut@mailbox.org>

Thank you !
