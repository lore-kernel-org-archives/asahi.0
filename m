Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA2C28466D
	for <asahi@lists.linux.dev>; Fri, 16 Jan 2026 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579875; cv=none; b=e13QcXAAnvS6+ICfu4XHwTIWDeost9ZvOlT0mlEwCyRF6pRZUKU1mi8rNlFxIh5afaD0Y0/4epfN9Hk+/0hiycPsR9L7LuSIzYNoF3M0sd73mefD+U381njbGbm5TK5jkBPiEARKYERRcFbZoHZUR8Lo05PUC2O3CYLrJdFB2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579875; c=relaxed/simple;
	bh=eZckpxsINQ/VShZgVbCwVh/Vd/hAIPnZAsx7VSkI49w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cS+Vwl4ipqcmdYtkKFrBUZUrxrEGK7o6Rn6cB91RaOelr1Egaj+ISoB9k7gE1iOe5qXM9zS07ruQf1YYMxMPA1+NHO7HIaIoF2f9IdKJyfqTBXhQckJClxyTxAQcEPRNgaHCs/KPp903xtt7eqS025Ko6nGiQxNnjE4eYnCXKQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EUqdZAMc; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Zt3AjOkb; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EUqdZAMc";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Zt3AjOkb"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dt4bB1XsZz9tmc;
	Fri, 16 Jan 2026 17:11:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768579862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZckpxsINQ/VShZgVbCwVh/Vd/hAIPnZAsx7VSkI49w=;
	b=EUqdZAMckjhqnrj/v8D2NSuPtA573EKtft3bd3lrTKBgvdB7OATNleUHHh3jolzkIXeHBv
	rPkWVOEO/dbg0oYbmNgmHIhsW9QjGlKWGgbG4xCM8gawFB5GIszPzkE2RfnoLfgTDT7gIa
	tMKZQ2s38d/GdlWix6UQF4kVUPbxrtyUXTqX/ykfGdZ/TvOB9hK41piRNpvwpjVvlEt2JH
	9paU3wbfFIP5kuTqbit8vpI2MkiHxCUTEepRd62YjyaXGuh+EbJm0lZu+2B+CMGxdwRjD2
	t0Zoee7vpCxT1Kbtw6nPCzf1tt1G/wF83M7uehbz1LhtQpgFLK6M0inkJ9uFSA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Zt3AjOkb;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <1f8bbfea-fff9-4e72-b3e2-2e966e7cfcdb@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768579860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZckpxsINQ/VShZgVbCwVh/Vd/hAIPnZAsx7VSkI49w=;
	b=Zt3AjOkbEsKyHF2t0uCkZBHWEyTwzrQbH1GiihQDe9KTsgGy7FImpzp9W7JA71PpMg3ZQB
	GpOsRJtLMdCO75N8vIt/Yvk0uMDCDTmAT+JjilMIAmi/gGBDARKvJql8Qq1VhBqTovBThB
	0a6rvLSug9PSmzcdQRl/8rv6S6uw1EAeFFc5HwT0H2uk1z2P/DHKnP5KNkF4VRHp9CsNvE
	2nqULre63cxXlPTxamzHW0IZnuCJTrJuKCRpJ1lybJlW0nzGLl0s6iluaol8U1dOvj3NLc
	iZwmgfO/NnqnFmbGpHHKkrYsZDMftYcr5jCPXwPDlclYJCXGfC34wh9FMN9XSg==
Date: Fri, 16 Jan 2026 15:04:23 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2] usb: xhci-dwc3: Add "apple,t8103-dwc3" compatible
To: Janne Grunau <j@jannau.net>, u-boot@lists.denx.de
Cc: Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, asahi@lists.linux.dev,
 Neal Gompa <neal@gompa.dev>, Mark Kettenis <kettenis@openbsd.org>,
 Marek Vasut <marek.vasut@mailbox.org>
References: <20260116-usb-dwc3-apple-compat-linux-v2-1-36ac33108d43@jannau.net>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260116-usb-dwc3-apple-compat-linux-v2-1-36ac33108d43@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 03d98aa8d7658bd29c0
X-MBO-RS-META: xqsjynoy4kyy73isbhd3mszj631ozeud
X-Rspamd-Queue-Id: 4dt4bB1XsZz9tmc

On 1/16/26 2:35 PM, Janne Grunau wrote:
> The Linux support for dwc3 on Apple silicon SoCs switched to using a
> apple specific glue driver [1] that uses it own compatible string. The
> glue driver handles platform specific requirements on the interaction
> between dwc3 and the USB2/USB3 PHY and reset-controller for USB role
> switches and plug events.
> To keep USB working as before when the nodes still carried "snps,dwc3"
> as compatible add "apple,t8103-dwc3" to the of match table. Eventually
> it is probably advisable to add a dwc3-apple glue driver and write code
> for the currently empty Apple Type-C PHY driver in phy-apple-atc.c.
Applied to usb/master, thanks.
