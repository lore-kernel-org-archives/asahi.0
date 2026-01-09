Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C453C3370FE
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 10:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953837; cv=none; b=uubjV2semADPqJrsSlo5hPGNac2FnTCXjIZPuNAMwhfiwpE60TeLwWjcf3nifCOB1Y8F3tZ6Qz0ZhvtSJQnhJk8ECbwOT13+O3nLTBoJ5LRuF2dRC6/1F80RwvvSWDE0rdSLQP2fLbMnlZimXi3ZWHPUVd1PDS+dblhPeXGOSiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953837; c=relaxed/simple;
	bh=8VF0HDudP651rYa6TTDF894HhyVzCF4w30ggRZxKL4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7i36D2PJXJ1TTamZkCj1vgpDY8aszyAarAeLY8/qxp+TA8I5Yf3HDp2E3AZyOT3zFMqt2k6TMI0c5dnXf53nydocw9GKqqvcWig9G2bStYkh6EoQ8R+D0Wjk+qfjPfnUazFpUiiaOic7gFIDD0+4KK2XFrf5deQMUFDyUsUpvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=HRhlPGy0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=piZYRz86; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="HRhlPGy0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="piZYRz86"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id C16EC1D00105;
	Fri,  9 Jan 2026 05:17:14 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 09 Jan 2026 05:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1767953834; x=1768040234; bh=tAe4Ay9DRB
	wZLM3SXPjxHg6HAHc6QRZx7WafCH1J7NY=; b=HRhlPGy0tIP32hDVHNt5PD/IzT
	FA7b/K39UmI527ClrwZzAbDkeFWkE+cO9mhUywQTkRcbEtrAglKheJXswpISws6q
	uduy+jBNHv4QZ9PPxsuAYXrVFKQzQOhTfYPzfd2Zo0sTXcLj9IpMa+NJsxD5kOP2
	9ccyFmnR9BILRpKwRQAlJBgY7mgETGK7hrY6FYkn80gDfFwofXFrlrX+jrMpOyJv
	iNWm0UhZL2icrA8Ug2Aby2jlzmmyOrM8qoE8O3RbKIs7vS1fMOefuKLFWZd0b6Em
	OKOD7izG80Yux9M19NardylQt0CP0U4mX2M5STKAgx8awVl8CfpeCaR1IUdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767953834; x=1768040234; bh=tAe4Ay9DRBwZLM3SXPjxHg6HAHc6QRZx7Wa
	fCH1J7NY=; b=piZYRz861AOGCMwT5BJw1xNZQPPW9vgllvwSbDmyLz2gzvN2cku
	GxK2/ZJVqC0fOGr+HpJCBFp++9/ZIzEcoQoz8e/8Z0uqwba5S+qWphxM7KOgWPo2
	QrLtQKOnWyI8RfSDxrOdKfpSc41IFyLOz4ssyuII3wB5rl4I8WNsZC6cgTh1IQeB
	DLCcibZpfqJAvIVy8JfUcNuXW1Roe7p2QCuQeXSC1MBg4DuprldauLLNnCXiefLX
	dbapG1RYoLksukXDwsowpD/jeBHai8IfgT+773ZYQZOVeHnCYJrp07WtdtdxALKE
	FBae+M7Orr8QSPRnpxwwpCuKUIW3VYMg5FA==
X-ME-Sender: <xms:qdVgacpkPewnXvGQryYpbD9FD86y8Iaw2d2ELAH_ULowRrdxemzP9g>
    <xme:qdVgafNMtUwr3UmjYHeMy2jP9FaxlViQQWPedV7gGA8OjKhzaKj6Tn1uMDpL-nWat
    SvelsT85EGP5XKuI_XPdWgE5ROckqiIstQ6opwgpNbOrxBUpDdYWw>
X-ME-Received: <xmr:qdVgaVpO_qkDsxiHIWpcV9HWAmfcLwAJARnNlsIRruMijfoCkiYxqeKC1bn_1bVvyaX6LquFRNWU_E748KeIV1U_0k2gS6_KJMA>
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
    hpthhtohepthhhohhmrghssehglhgrnhiimhgrnhhnrdguvg
X-ME-Proxy: <xmx:qdVgaas5GVOOEdrAwRuGhWLsMZGFak5ipeUvL5kzm-L3_bMO1xTURA>
    <xmx:qdVgac0HT9vFLLnIxHWbcc3g5wcw4D6MB6UB5rzml5LVtbaCgZvy9g>
    <xmx:qdVgadH3pjFQtV3shDQbvoFBoqKssxLQVS8pgMRdKHXVphFUZtlF-A>
    <xmx:qdVgafuyKW1aPB5SBlPyhkvFklmC4YI6oT7PMfuG3Ohs5Vxe2tulvg>
    <xmx:qtVgaW-403zcmvJApebVsrUkfWLiiLlm6UWcl62f224lUJA2c5yK-tb2>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 05:17:13 -0500 (EST)
Date: Fri, 9 Jan 2026 11:17:12 +0100
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Glanzmann <thomas@glanzmann.de>
Subject: Re: [PATCH next] phy: apple: atc: Actually check return value of
 devm_apple_tunable_parse
Message-ID: <20260109101712.GC4068972@robin.jannau.net>
References: <20260104-atcphy-tunable-fix-v1-1-40bf00feaac0@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260104-atcphy-tunable-fix-v1-1-40bf00feaac0@kernel.org>

On Sun, Jan 04, 2026 at 10:18:31PM +0100, Sven Peter wrote:
> Let's actually check the return value of devm_apple_tunable_parse
> instead of trying to check IS_ERR on a pointer to the return value which
> is always going to be valid. This prevent a oops when the tunables are
> invalid or when they don't exist:
> 
> [   42.819119] ------------[ cut here ]------------
> [   42.819121] WARNING: CPU: 6 PID: 88 at drivers/phy/apple/atc.c:2145 atcphy_mux_set+0xf60/0x1128 [phy_apple_atc]
> [   42.819302] CPU: 6 UID: 0 PID: 88 Comm: kworker/6:1 Tainted: G S                  6.18+unreleased-asahi #1 PREEMPTLAZY  Debian 6.18.2-0-1~exp1
> [   42.819311] Tainted: [S]=CPU_OUT_OF_SPEC
> [   42.819314] Hardware name: Apple Mac mini (M1, 2020) (DT)
> [   42.819316] Workqueue: events cd321x_update_work [tps6598x]
> [   42.819332] pstate: 81400009 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [   42.819338] pc : atcphy_mux_set+0xf60/0x1128 [phy_apple_atc]
> [   42.819344] lr : atcphy_mux_set+0x30/0x1128 [phy_apple_atc]
> [   42.819348] sp : ffffc000813c7c00
> [   42.819350] x29: ffffc000813c7c00 x28: ffff800016babeb8 x27: ffff800016babc80
> [   42.819357] x26: 0000000000000001 x25: 0000000000000001 x24: 0000000000000000
> [   42.819364] x23: ffff800016babec0 x22: 00000000ffffffa1 x21: 0000000000000003
> [   42.819371] x20: ffff80000c1b3680 x19: ffff80000dcdd080 x18: 0000000000000000
> [   42.819376] x17: 0000000000000000 x16: ffffd42e6ede6e08 x15: 0000000000000000
> [   42.819382] x14: ffffd42e707b6980 x13: 0000000000025c68 x12: 726f703d54524f50
> [   42.819388] x11: 0000000000000040 x10: 0000000000000000 x9 : ffffd42e555ed9c0
> [   42.819394] x8 : 0000000000000006 x7 : ffff80000a000dd8 x6 : 0000000000000002
> [   42.819399] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000001
> [   42.819404] x2 : 0000000000000005 x1 : 000000000000ff01 x0 : 0000000000000001
> [   42.819410] Call trace:
> [   42.819412]  atcphy_mux_set+0xf60/0x1128 [phy_apple_atc] (P)
> [   42.819419]  typec_mux_set+0x74/0xd8 [typec]
> [   42.819444]  cd321x_update_work+0x440/0x8a8 [tps6598x]
> [   42.819453]  process_one_work+0x170/0x3e0
> [   42.819466]  worker_thread+0x25c/0x390
> [   42.819473]  kthread+0x148/0x240
> [   42.819479]  ret_from_fork+0x10/0x20
> [   42.819488] ---[ end trace 0000000000000000 ]---
> 
> Reported-by: Thomas Glanzmann <thomas@glanzmann.de>
> Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/phy/apple/atc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index c8a58ee64b7aad3205df51cf16ae778471ad2c5d..716c1e70de38ca604803739fedaa543d91f7501b 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -2178,10 +2178,10 @@ static int atcphy_load_tunables(struct apple_atcphy *atcphy)
>  	for (int i = 0; i < ARRAY_SIZE(tunables); i++) {
>  		*tunables[i].tunable = devm_apple_tunable_parse(
>  			atcphy->dev, atcphy->np, tunables[i].dt_name, tunables[i].res);
> -		if (IS_ERR(tunables[i].tunable)) {
> +		if (IS_ERR(*tunables[i].tunable)) {
>  			dev_err(atcphy->dev, "Failed to read tunable %s: %ld\n",
> -				tunables[i].dt_name, PTR_ERR(tunables[i].tunable));
> -			return PTR_ERR(tunables[i].tunable);
> +				tunables[i].dt_name, PTR_ERR(*tunables[i].tunable));
> +			return PTR_ERR(*tunables[i].tunable);
>  		}
>  	}

Reviewed-by: Janne Grunau <j@jannau.net>

Janne
