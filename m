Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90D53382D9
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953968; cv=none; b=gn5TfXVUFzQhXuCLCD8KN6mQoYeO0xNH3TggQ24+UnyOgueq6pJ7eKEi6zU4T5SxsbyT1a70TxsYhOtVCcmkNboOoO7OW6hF34NTEJMkGv/tBYqKcQe5tnGGVJpHi7ci1xHzRgArq2uNpPg5fE/97t8xFlb00cc0awXUJwp8SNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953968; c=relaxed/simple;
	bh=jqfln0d4rvTdec0rrYySWDYaR6N9gMugRu60zWJo32Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mf/cqZJlvVc0tn2u2YEVA9CNCRf2NmsfFM4AoUcvRQ16eHWUnqdZyeXk0VzTv6vuw0hRjWpiVHcsdjHP/G+/zCfXDze51QnZGow+XvTwfQH9cpNnmT65pbX+JCu/J+VuHC/T6suiKPy/DghfpTux4YsN+6iIJyZXa4R11og/cGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=cK/JBHt+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uY6nHXoQ; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="cK/JBHt+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uY6nHXoQ"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F22617A012C;
	Fri,  9 Jan 2026 05:19:16 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 09 Jan 2026 05:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1767953956; x=1768040356; bh=nPWdvhWqUP
	8z4tQ2SIcyZFEb5oJzFhbi88/4PvVGk9U=; b=cK/JBHt+1mwfnuAPXuR8+vt4uJ
	bWFdyGs278GocEhnBzm6hHuOhkPgdBxTWrq+pFfC0Wi79ALBNaM55BuxUXCGv+rW
	6Bugu3MKJ66KAyNm3AW9gK6QFZnNO0/0QP4U85ajpnk6JGJxoImuhwL7/r9mW3G0
	/mT+uYDP8IUFSosvQRu0HM2DBr36yVdVyUKFkjmpdSEmhgSbjdMMWhRk5T+bBQDq
	iPFEhnVXveL/jRxH5m3MfmlUTC68RRVU5AMMSoFtbZDmLePO0y+CKp3OYHcdWO7e
	s9yed9kto0x/3IeFKrGh+WQTOStaqkNWkBtYLVzT82k+n2bYqu4iY30qYauw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767953956; x=1768040356; bh=nPWdvhWqUP8z4tQ2SIcyZFEb5oJzFhbi88/
	4PvVGk9U=; b=uY6nHXoQWY7hWun4DoF2HY01QiXsKb4YTboCe+6akDQSQLng7hH
	MJAGNCNPRbi29XgPJk1IUY6Qn34b5On1lFXQyehgU8JaE0s0swDEoSExs94ul3CX
	Uh78zHqmcrwnVWJhgIDd3RjCDmiwMqdS5qNMI2C6CSTDT6ck2yRafeNVm9fhmTep
	2VAsIlKV1vgtllw2/dumINEz+e9u494DO/LYt9k+Mkp3HeBgDYnQNCTVpp5IQvV1
	bjS2pL8xCaE9xEha0BPYcQu+T/C2CSbiNXj3Y+79eOnIIeepUoTUt3eyi2vunecd
	CGqmexAyaYP6pYvFiiuhK+/jnZiSgJwvNyw==
X-ME-Sender: <xms:JNZgaR3n2FWAIFtiFRXS0SXQZ7SpDyM4IncmvjvauyZwhNwsS1CT7A>
    <xme:JNZgaUpchhk9FqRsUwUE3Xsgy2Sy3fNx0xvpr6MJlQresB9cCS9mGF2ETctO8xid9
    ryAK41UeKZInVGEcKKr_ENH_TjhmyMQfkLOGfq1xzs89ojiTD-36Xc>
X-ME-Received: <xmr:JNZgaWUA_kgrxxzg1pd6_vzR143MTs4YCaEtvy5WA_Y6GlPRg0IPdz4-JjilKqnidCbDO8KDvfWJRyuuTtdGLC1FkNhR3T4Z7IU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprg
    druggvvhdprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprg
    hsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhphhihsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepjhgtrghllhhighgvrhhoshelleesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:JNZgaVrqEWwiF5SEbzGOUHnDFslecCbM6XkSjv__N5LhbXpBwbNoAw>
    <xmx:JNZgaVB8Q4-AEkMmWLlp7puSRS9Mv6k8GfxqDWdVH3sUk2CE1Qrz8Q>
    <xmx:JNZgaZhFLnSivm_8rg8JcfISGUoY4heyANyNuUGwkyLPKPKkJwAnPQ>
    <xmx:JNZgabaaGpZW4H_bVifG5BJlhNL85ht9R_ySRUP91xVgxL67ASbdCg>
    <xmx:JNZgae6uc6VjHMIEr9eEyHxKUGdcxK1cgwwwMkDpNIuv40pA6qgA7nGu>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 05:19:16 -0500 (EST)
Date: Fri, 9 Jan 2026 11:19:15 +0100
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	James Calligeros <jcalligeros99@gmail.com>
Subject: Re: [PATCH next] phy: apple: atc: Reset USB2 PHY during probe as well
Message-ID: <20260109101915.GD4068972@robin.jannau.net>
References: <20260108-atcphy-coldboot-fix-v1-1-01c41c6e84f2@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108-atcphy-coldboot-fix-v1-1-01c41c6e84f2@kernel.org>

On Thu, Jan 08, 2026 at 08:12:06PM +0100, Sven Peter wrote:
> Now that the upstream Type-C PHY code is getting broader test coverage we
> got reports of USB devices plugged in during boot or those plugged in for
> the first time after boot occasionally not working correctly.
> This is partially caused by the USB2 parts of the PHY being left in an
> unknown state by the previous boot stages. We reset all other parts during
> probe but forgot about the USB2 PHY so let's fix that and actually reset
> and power off the USB2 PHY as well.
> 
> Reported-by: James Calligeros <jcalligeros99@gmail.com>
> Reported-by: Janne Grunau <j@jannau.net>
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/phy/apple/atc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index c8a58ee64b7aad3205df51cf16ae778471ad2c5d..ab0b40b72533f1b3878b646b59820c730239e85c 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -2227,6 +2227,7 @@ static int atcphy_probe_finalize(struct apple_atcphy *atcphy)
>  	_atcphy_dwc3_reset_assert(atcphy);
>  
>  	/* Reset atcphy to clear any state potentially left by the bootloader */
> +	atcphy_usb2_power_off(atcphy);
>  	atcphy_power_off(atcphy);
>  	atcphy_setup_pipehandler(atcphy);

Reviewed-by: Janne Grunau <j@jannau.net>
Tested-by: Janne Grunau <j@jannau.net>

thanks,

Janne
