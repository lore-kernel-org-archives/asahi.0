Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856A1E89A
	for <asahi@lists.linux.dev>; Tue, 27 Feb 2024 07:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709019554; cv=none; b=ovlHFxYZ58lwS2oGGD/ZusSvHbX9zrOoBHgCc77tGiiuxqHgOjBQaBC8+jRTLYwMQQ/E8YhfNHwVUXJNKvT2eSOr/5RdbBFv9ScQNH1b6nKOIMhrTWFHJof++s0tl9zB+Mk+2Fp4bok0O97Q1DIQ+gEka5wnFOQC66JjM0+gL70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709019554; c=relaxed/simple;
	bh=GkGnKGr5Tt+8MnDPbhd3IsVrZMqISPGDBhfTeVoh7UI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=LCKl/KMjqFfHoDjjvtxfYg/N9yZVcYnxShD688LzikDohpshDtqvZY/55NDqSSJxfbKTfqXUeqD9JSb0wTCzAe0OOjkVNYsJkpwxU/05GWSJJ7leA/tcOo5SDxrGow50rWsfbWwyha4rB5+MrNMNjh5wJ6ccF+Ka33v6M8tRBF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=YmMBDOGk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hqKtNHfd; arc=none smtp.client-ip=64.147.123.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="YmMBDOGk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hqKtNHfd"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 19D943200922;
	Tue, 27 Feb 2024 02:39:10 -0500 (EST)
Received: from imap53 ([10.202.2.103])
  by compute1.internal (MEProxy); Tue, 27 Feb 2024 02:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1709019549; x=1709105949; bh=RuoG/JYKND
	qtKunDub7zravKEipCfUorhigmBmAIFqw=; b=YmMBDOGkZMY9unLOHJz14Ajfat
	N4wuGzELEE80WIkgQhKgOgEEEYs90VlbfN4TDjgrtAtREWaiEuxESeDckLZwJiXz
	Cj3dCDCMVKyKACZorK8AsGhrT5Zsdspx6fQL4x49YCkpgvb84wz91y5judHY1Ay5
	tQYNDoHeKAbb+z2G35udqiKVjiJbdPukGgo2gpEwhJOFqey4E1JMHlvSxnSu3sRm
	TVrvPJdtsMDsxzKzhztmE2/KxJOcKC/rUa/ksMhBVlHz62rkCiKBaiIcmjKKditX
	JVs8cuK4ae3Wjbfm8K72dyQJ8iRy2bSiRp2oSpaYPL7HrlU9MEyW5Ic5Nrzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709019549; x=1709105949; bh=RuoG/JYKNDqtKunDub7zravKEipC
	fUorhigmBmAIFqw=; b=hqKtNHfdo2pNbHKWwy8msbnV403VA5gZMUAV/QRaOCYW
	jREngwMo3sZmE5oOOArz5fDlRuVvysKwlHO/P6+7/6fDrV/0QUh4NBX83pbYgh9y
	K9UC202vT/QuB3a5B5A2OL/ubMRL8Y2IbpklSf9Y0eGdXoB5ZTWcujrcL1STbnGf
	Uc+uwiXwB3QR97/AX4I63skVyEungOSuUGhXtvrPrSj5a/NCHOaJZoVr50IZYqA1
	7/r69yhTy8PIEmUxLeyMmpYAGUgHlcvwt/dI8tSXtIZXa8tEaHEQFNv5CVtESLbQ
	ra5tMmD8iR7rAHk7ERAKNooSz25LLNa6lxSY1p62Og==
X-ME-Sender: <xms:nZHdZV9JWPvz1ziaAo8lXm-sPoWaP1qkwRTKQhd7cTHq7VpW3hX2Aw>
    <xme:nZHdZZuzDKTCsDh8vd0WaPFIJyGjEGcKHCfKp2Lm09fn21F2V7H9uUNeX_duk_k_v
    o8w1pHAgOmOJeiZgSc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeefgddutdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedflfgr
    nhhnvgcuifhruhhnrghufdcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvg
    hrnhepvedvhfdtvddvtdfggffgueetudfhieegveefffeukeehteffkeejheejfefhiedt
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjh
    grnhhnrghurdhnvght
X-ME-Proxy: <xmx:nZHdZTATCjfIYRLyInkkehZOEHudM5uQOh0-CHX169ucdxPMJ6c1sA>
    <xmx:nZHdZZe3qhFzC1mXqyBVLvBxbr4AGdsvkLDKdw0xr_7hREabcNdmZQ>
    <xmx:nZHdZaOZGVRvj4Xwf7YGXrAP3xMr-h_Bn91G2rjv22AWKECDIx9-6Q>
    <xmx:nZHdZTYYE-xyGGDBifyYT88V40hhbW8UUovxU1sdVU0A7l77kk40uQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5D2B93640071; Tue, 27 Feb 2024 02:39:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <0ec5ded2-f3f7-4e79-afbd-f6f560ab0627@app.fastmail.com>
In-Reply-To: <52b99ba9-3772-4074-8b64-e01dde80f6a4@denx.de>
References: <20240221-asahi-keyboards-v1-0-814b2e741790@jannau.net>
 <20240221-asahi-keyboards-v1-2-814b2e741790@jannau.net>
 <9cb3370e-770a-40e6-b890-ae9b5a15bd44@denx.de>
 <b0c41f38-abf0-4713-a80a-c78f074b7b4d@app.fastmail.com>
 <52b99ba9-3772-4074-8b64-e01dde80f6a4@denx.de>
Date: Tue, 27 Feb 2024 08:38:48 +0100
From: "Janne Grunau" <j@jannau.net>
To: "Marek Vasut" <marex@denx.de>, "Bin Meng" <bmeng.cn@gmail.com>,
 "Tom Rini" <trini@konsulko.com>
Cc: u-boot@lists.denx.de, asahi@lists.linux.dev
Subject: Re: [PATCH 2/6] usb: xhci: Set up endpoints for the first 2 interfaces
Content-Type: text/plain

Hej,

On Sun, Feb 25, 2024, at 22:47, Marek Vasut wrote:
> On 2/25/24 4:28 PM, Janne Grunau wrote:
>> 
>> 
>> On Wed, Feb 21, 2024, at 13:39, Marek Vasut wrote:
>>> On 2/21/24 08:25, Janne Grunau via B4 Relay wrote:
>>>> From: Janne Grunau <j@jannau.net>
>>>>
>>>> Apple USB keyboards carry the HID keyboard boot protocol on the second
>>>> interface. Using the second interface in the USB keyboard driver does
>>>> not work since the xhci has not allocated a transfer ring.
>>>
>>> So, what does this patch do ? That is not clear from the commit message.
>> 
>> rewritten for v2:
>> | usb: xhci: Set up endpoints for the first 2 interfaces
>> |
>> | The xhci driver currently only does the necessary initialization for
>> | endpoints found in the first interface descriptor. Apple USB keyboards
>> | (released 2021) use the second interface descriptor for the HID keyboard
>> | boot protocol. To allow USB drivers to use endpoints from other
>> | interface descriptors the xhci driver needs to ensure these endpoints
>> | are initialized as well.
>> | Use USB_MAX_ACTIVE_INTERFACES to control how many interface descriptors
>> | are initialized and useable. Currently defined to 2 as that is enough to
>> | make the Apple keyboard usable.
>
> Would it make sense to make this a tunable Kconfig option ?

I thought about that but I don't think it's worth it. We would have to default it to 2 (at least when the USB keyboard driver is enabled) since we can't predict which devices will be connected.
Why would anyone chose a different value than the fixed value? I can't think of convincing reasons.

Janne
