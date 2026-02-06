Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25C2E974D
	for <asahi@lists.linux.dev>; Fri,  6 Feb 2026 21:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770414467; cv=none; b=WqVnRQ3dlXBHiR4ZfiFJU+tcf+Osw/++8BJnZc8paRCjv/4ERaCuhyrpTzpHpSTmVWGNLMm+nRSaFCMnxszZv9ZnwTswLso+Mj3rarYNicWWacVc1aaC0heKBur4z1cFlxTcgscengmRUvpkiedh56cmT5iVzi+2NPN3uwhujis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770414467; c=relaxed/simple;
	bh=aNSI0eNlR5izs6k1x/BeG+ecSGVPU5Dq5LmLtEJKqmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObCerLhCH/9ChVUbH06Ov+fJi7qfRlQ/EnqwmlqaSZGl9s5DrB1dVkqD5iRDXl7Pc/o/BO5b/Rn23Omb0rYja+Nvvd/nRTjPDX8k+n8fTCkmvSRZy/Bd5eVKHjra0lbAukRM9B0RCZy8+1N3JE1C4q341RArwSnOZ1znO4+p0TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=kBQMKStb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uKzF/cEA; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="kBQMKStb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uKzF/cEA"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 5832D1D000BD;
	Fri,  6 Feb 2026 16:47:46 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Fri, 06 Feb 2026 16:47:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1770414466; x=1770500866; bh=YCCtMzm6Kq
	TbqKB92m3wtbBJnFEnWOwykIvs2rrsvJU=; b=kBQMKStbaWizfGcsqaYCUVeRXl
	18X6KsqsYCwdpcMGjEciTdsbb+yLhV9StQFwvmZosvG/P6OG+IMl7r2mTqHSls5o
	SKzgMtNB+AhrHKJsdJGclfX9LceKyB6GkPZl/GFjBv++gaIS+1U/UMGs5DRjFCeg
	o258xWxh4WFB79d5LuPbUc+8s8UlQuC4uonTBO5wUwbSxCWampFCCqHeGJJmqgwd
	uqqRl2hV1IPLXy9YZwB3duueonLr6fi74MZCjyUYZFNp25OV6qKb2uQtGWeyTBdf
	z+6SyQ8q3IolX9WuIDMQFE3tAznkr5BrPSQVxb18rpwsyCb3+r9+2jOLCFJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770414466; x=1770500866; bh=YCCtMzm6KqTbqKB92m3wtbBJnFEnWOwykIv
	s2rrsvJU=; b=uKzF/cEA0hrhle1IQzAyKhFNvHnu3cNQNBLimuBgyrLki+C6Mha
	0oL+fhAiF/06EF9H9N11ubEOzgNzS7ib4evZ6tNAT/M479ICnqaELWYSe4joj7EC
	pyZmp1Sb21xIN2htTSW4bkUIKuZRQiyMTZKZ+votcc4bSRdCUR5Q67chqKTeb9rv
	b9eBimOJnsIyReMk7HMBPmHXmW1BiVIjHBeTwt+0EcehmnqCfmjwExFIzq89Pl9c
	m3EWZ210r3ltFrcvBC8znQ+PE8wSZanCCc6tA08GM7zLN9lhBYUR7HAs63lgHL+K
	/VxQW7VI22zIsUebStq25Hjy4rAiOtbqhvQ==
X-ME-Sender: <xms:gWGGaQY1U7LGf3qZzWqxMB6I7BXEs9a3VsDCRMr2Y2BE0JYevFhpcA>
    <xme:gWGGad_XTPfw63MoMJcVpAJL2Pnj_oj21Eij9Zp-JIa6tLBg1tpDEPEB2AQ_AI9LB
    0iYE48Ss-6qV7L3x4XUM-OTFPQs8dKnyWbkYaeCFPRX4US6jEyn19o>
X-ME-Received: <xmr:gWGGaekYXEBVsWx-Dg2pvdP2AuIdk9T_aHu5WUgwaDeKg1Ilz1RskqIMm_0tLG_efOmg4r69kaH5BLO6ZhuXEZJEkpM-Q-BDraw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeelvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgud
    euffelfeekgeeukedtheekjeettdfftddujefhvdehtefgiefgledtueefjeenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghnrdgtrghrphgvnhhtvghrse
    hlihhnrghrohdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepnhgvihhlrdgrrh
    hmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
    hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    phhhhieslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:gWGGaaym8DcKTckLZWNLKcqul9MNG13j_q24zyRHxU3TTjtqp__j-g>
    <xmx:gWGGaQ6vRVdNfE-kTbeISIjryQxEsIOI5qjA6TyPj5wHkEnyAbLTaw>
    <xmx:gWGGaSXTe1oECI_g0b5H7x1K6oq-fFOzFaMc2B288fYl-a0BryAKQQ>
    <xmx:gWGGaQIhj0tJru23BiEDnr314BKc2GesQL-k-3GjpLtCfTeehkgKbg>
    <xmx:gmGGaVtWZYGpsm4aOjQ0c6w3flL9z-JlnOnH66XQ6Huu0lgX8oK8Tlno>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 16:47:45 -0500 (EST)
Date: Fri, 6 Feb 2026 22:47:43 +0100
From: Janne Grunau <j@jannau.net>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Neil Armstrong <neil.armstrong@linaro.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [bug report] phy: apple: Add Apple Type-C PHY
Message-ID: <20260206214743.GA194367@robin.jannau.net>
References: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
 <aYXvX1bYOXtYCgfC@stanley.mountain>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aYXvX1bYOXtYCgfC@stanley.mountain>

On Fri, Feb 06, 2026 at 04:40:47PM +0300, Dan Carpenter wrote:
> [ Smatch checking is paused while we raise funding.  #SadFace
>   https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

This is unfortunate, there have been useful bug reports.

> Commit 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY") from Dec 14,
> 2025 (linux-next), leads to the following Smatch static checker
> warning:
> 
> 	drivers/phy/apple/atc.c:2209 atcphy_map_resources()
> 	warn: 'resources[i]->addr' isn't an ERR_PTR
> 
> drivers/phy/apple/atc.c
>     2191 static int atcphy_map_resources(struct platform_device *pdev, struct apple_atcphy *atcphy)
>     2192 {
>     2193         struct {
>     2194                 const char *name;
>     2195                 void __iomem **addr;
>     2196                 struct resource **res;
>     2197         } resources[] = {
>     2198                 { "core", &atcphy->regs.core, &atcphy->res.core },
>     2199                 { "lpdptx", &atcphy->regs.lpdptx, NULL },
>     2200                 { "axi2af", &atcphy->regs.axi2af, &atcphy->res.axi2af },
>     2201                 { "usb2phy", &atcphy->regs.usb2phy, NULL },
>     2202                 { "pipehandler", &atcphy->regs.pipehandler, NULL },
>     2203         };
>     2204         struct resource *res;
>     2205 
>     2206         for (int i = 0; i < ARRAY_SIZE(resources); i++) {
>     2207                 res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resources[i].name);
>     2208                 *resources[i].addr = devm_ioremap_resource(&pdev->dev, res);
> --> 2209                 if (IS_ERR(resources[i].addr))
> 
> This is checking the wrong variable.  The * is missing.
> if (IS_ERR(*resources[i].addr)) {

This issue was identified by testing and is fixed in next by commit
7d55b44e2be1 ("phy: apple: atc: Actually check return value of
devm_apple_tunable_parse").

https://lore.kernel.org/all/20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org/

Thanks for the report

Janne
