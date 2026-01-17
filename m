Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0D213AF2
	for <asahi@lists.linux.dev>; Sat, 17 Jan 2026 17:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768671506; cv=none; b=VIjjovdHz4wBY7SNmDMoWrmtdlPSOFBSWfd+WhtdAByIhcsACfUO5sKU4infRE55pfQ7GajBmrePi5yxgZBfvAe3/JdtBojTrrpdSf3m2yHdaQi4BRzKRm0P9Warr1XppQpcmwTd5bWrU3QTsj1nZRXrppCmnPOaH7or5G7BP5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768671506; c=relaxed/simple;
	bh=3xZQmk6vTpYWyUEWHBne1GxFnqXaAJF9LMfoUQTVeh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7zj8cscjGnrpVEa7ehtOpz5U+l3gyHaq/pZikZapnzi5NsEYvZ+X+OhLEjjvRXlp+M5zuKjtAxj35qVfc+nbfP7w6waMrRW6U1nTPgN6EDh+YC0zEUGAbiDDXMjX6s14a/TV9zX0eEQiSycZ6gsTE3zn0H/FnioUNm8HWZDRfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=lLGEGnZp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AIXJMmW7; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="lLGEGnZp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AIXJMmW7"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 22401EC0575;
	Sat, 17 Jan 2026 12:38:23 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 17 Jan 2026 12:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768671503; x=1768757903; bh=s7tn7xMQ/3
	Gyf8htyyRCNZJNLea2G+jrvfBLiBrEmgg=; b=lLGEGnZpdxhVTjBVsk/xAiFCUp
	CzonC3v+wGWJB9pxIqXRHVAWP4uysF4aTpmbC832b1SJuDJUHIuAiJ8G8SaN8Po/
	f58xGYICU15tGh2XgjE1zraJyWq4Ja0tpPZE4AEcvLgRdX+HqG4Lzil/BjgdcM1X
	TdnxjIhRvmClCHVeM3yQgVbWTW3aBmKh9ksQXqYP2ym9C7kVVoBUzBIajw70QYwm
	FgrGMrqpqF2O9fJ6OB1gHw88xXFaf0L1DrD1qjRqv2MHKgaALwQwqKKGsDHsc9n0
	R/WY3Rrky3wjgwydNOJEQqORJoDye0GyakOgB3li+FCTO+phYAOfq+d2Thaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768671503; x=1768757903; bh=s7tn7xMQ/3Gyf8htyyRCNZJNLea2G+jrvfB
	LiBrEmgg=; b=AIXJMmW7oxZgWae79N51IazVJxO/IZuzTS4pL7sVO/CfBwVMDlS
	c9f3CfBq8S0rrzfXkCLARKbxZt9WGnh+ZQ4jxGtFSm4PHDWUrBAPNNn090wReVBb
	epRqE7evGul17PM7pF73Mu638arILI8aD4l1NTsQabgpR/B843LngY8nndf1QwOk
	/QITKWSrh+CeCebPNli0Z1KSTVYinnlqgmK/qZ1PpJ972T7P5zX9W+PK/hwLi247
	2mysi2q3CiyQxBY0Rk3Ha1SclvUoXWiIPd4CNcpfZS5leq/ffW+pNuPYyDNJ2eod
	LKkyPz+6QAAU1uSXeRLmmrxrPkUFbNqVaaQ==
X-ME-Sender: <xms:DslraX0IGyYJ6zDxGAuFHiMTNTHpRyS1djI0E1q5GE8yXusD-BBnOQ>
    <xme:DslrafBEW8AIZmCdsY_UFWlykkTly0Z5xZExnTZt0Q4UA0Zo2zq_axryRxN5pV9De
    MKOxW0oupI__W6Vcsdx47R0A10dxUfKjjDsXKjiAaP16srO5Go-YQ>
X-ME-Received: <xmr:DslraTdCReo5rKuu4Y29Lc-z46wU_UkYBzku7KzmY1x8OZaIfs3Kd1IfEeFTX1mUdhP8upc2V8SxDnIwtGHVXLldF3dPcg_-EmM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufedvgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprg
    druggvvhdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhr
    tghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Dslrac7cH60NYRMrE-XmCDdJisvyGU2sHhxddBzGPvpy22dL_XOgSA>
    <xmx:DslraWVyndFqfvfxl6HPKVdoqjfkrMLXtXbTYkoU5qQkoAIhZ5oYmA>
    <xmx:Dslrab7i2aP6tPR5kV1Ex9kezlwLcccwgze3H8udstRW6HQyVruwuw>
    <xmx:DslraRoOGrczNsg3kwdN-yz0XddJVa_wQ0bsuTyH2dPVNv-z9o0uXg>
    <xmx:D8lracA8tXkJXch_D8PlwaQLKv3W7USIHEMcbaXXSwA0o8ewBQMsa5na>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 17 Jan 2026 12:38:22 -0500 (EST)
Date: Sat, 17 Jan 2026 18:38:19 +0100
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: apple: rtkit: Add function to poweroff
Message-ID: <20260117173819.GA55832@robin.jannau.net>
References: <20260117-apple-rtkit-poweroff-v1-1-6fbe8145e965@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117-apple-rtkit-poweroff-v1-1-6fbe8145e965@kernel.org>

On Sat, Jan 17, 2026 at 06:24:44PM +0100, Sven Peter wrote:
> Add a function to put a co-processor into the lowest possible power
> state from which recovery usually isn't possible without a full SoC
> reset. This is required for the USB4/Thunderbolt co-processors which
> can be restarted since the entire USB4 root complex can be completely
> reset independently of the rest of the SoC.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/soc/apple/rtkit.c       | 17 +++++++++++++++++
>  include/linux/soc/apple/rtkit.h |  7 +++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index b8d4da147d23f7e99e76eea314e4d976cddbd1c6..381faaf74d5982163d2c44d1e2c6e0ddad07bd73 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -851,6 +851,23 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
>  
> +int apple_rtkit_poweroff(struct apple_rtkit *rtk)
> +{
> +	int ret;
> +
> +	ret = apple_rtkit_set_ap_power_state(rtk,
> +					     APPLE_RTKIT_PWR_STATE_OFF);
> +	if (ret)
> +		return ret;
> +
> +	ret = apple_rtkit_set_iop_power_state(rtk, APPLE_RTKIT_PWR_STATE_OFF);

inconsistent line wrapping. It's wrapped for AP power state which is 1
character shorter. I would wrap neither it only moves the statement 4
places to the left.

> +	if (ret)
> +		return ret;
> +
> +	return apple_rtkit_reinit(rtk);
> +}
> +EXPORT_SYMBOL_GPL(apple_rtkit_poweroff);
> +
>  int apple_rtkit_idle(struct apple_rtkit *rtk)
>  {
>  	int ret;
> diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
> index 736f530180179bd144cf85eb0f0bd93844d7188a..bda3c528b51553c13f7fe5685ab60f7fc675361b 100644
> --- a/include/linux/soc/apple/rtkit.h
> +++ b/include/linux/soc/apple/rtkit.h
> @@ -125,6 +125,13 @@ int apple_rtkit_wake(struct apple_rtkit *rtk);
>   */
>  int apple_rtkit_shutdown(struct apple_rtkit *rtk);
>  
> +/*
> + * Put the co-processor into the lowest power state. Note that it usually
> + * is not possible to recover from this state without a full SoC reset.
> + */
> +
> +int apple_rtkit_poweroff(struct apple_rtkit *rtk);
> +
>  /*
>   * Put the co-processor into idle mode
>   */
> 

Feel free to fix without sending a v2

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
