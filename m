Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12E032C31B
	for <asahi@lists.linux.dev>; Wed, 28 Jan 2026 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588976; cv=none; b=sCpHw7bySsrCUJ1vfg1sRStr3B8QI1qee3/duh4InpjjZ/+GZn9MFNhBTat76/UV22H3PcKEhmhMq4xrubagEf7szRN1PrMAZdVqbsSnI3d6VNv/0zRQs4okGIk59nX0VF9a1RiXhhZQaqdT43/3wqjClEA+GBYCLHkkCHdgeNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588976; c=relaxed/simple;
	bh=n0kXo1k4vo0QxMi+tXd2olPq/uITmfbOZwA8SJxX0P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjmV4YFpBYW6xBnetoZC2rFZomQBxhFBZ714zGujzYgxsqwSwlRWiD+vA57HSruLFPS5NssAr8Cc8HCGs+iIP48GfYW+MoAE5xje6NaKjYzYTlrxzN10wNKWTFodpR3omfRaVXT5QVids0i3oTu4avam+y3pwURYKLx1yYX4DLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=qKk3ceXt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y3CvMSA+; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="qKk3ceXt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y3CvMSA+"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 99A501D00141;
	Wed, 28 Jan 2026 03:29:33 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 28 Jan 2026 03:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1769588973; x=1769675373; bh=lzNRjNZ++s
	EseGt/Ra7+QgYJtUADHHDL2C2yG0SvrDA=; b=qKk3ceXtv2q0vSNFXERPGLWY24
	vqOeN+Ef3o27W9d/3O//372A2ML0ePYvNo4qtEsbHt9TZ+51n0QRNHN0ISM796/v
	Ewj8B8/zki8QvCHTL1OhXgaI3K8QowNBiOFGcvvyjslySqiKZyfiIaElizV0wQ04
	G+qGM+BJPHjzYqqNPhSBU3bIXhAHPhVxFAEKXbD+s56luEikb1lpIyEVK2pKJsmG
	oR72Y126dAXRFCevgKa8DXjdUd4EqpkIbaCw/BI8kGd16Hp7ZkPcAfUf+s72564K
	gsiHee5yfh9b8XhF1dzCV/r+yAJ1WOE/Jz0eOMQYlBv7PxZoqyH1DjkkBScw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1769588973; x=1769675373; bh=lzNRjNZ++sEseGt/Ra7+QgYJtUADHHDL2C2
	yG0SvrDA=; b=Y3CvMSA+oXcT2o8XYPc1lDo4S+gPxHcjeRI7pF22GNJWYWxfnWP
	1vCooNPsM8Qs9xG0Ekc3pz4v6N34yjq4BEcfZzqn5WQvnlzCe7ckxUuMvM8zo6Uy
	6XFipqQCFYikF2QnJh2rGlRUr1T8bBbV004uNQAHcGe+VV7pklOIjC5Su68emC+V
	Biz02ZBwPA3Qhhz936Mpo8mJO1ORZ/BJ/4hwx9yiN8v+jQjky1UY0Z4QWTD/Rqe5
	MTEBF5qPixI/vosHKFsLGPxXM8dOIFPS1P44JGdGpdDmhLRMA2bvhn1xR/bbuxIu
	4SW8WgxU8QSZH4UNoJy3KT7v8T54/BUkBLQ==
X-ME-Sender: <xms:7ch5aRa7h8dCaQzqAGFVZ_v1ylNY3ld51l7XSXjwqdLAINtj1oEqsA>
    <xme:7ch5aQl9mjWSAio5ASn_H1qljXV2oTcs_4UKhhtbjhQE3if1EOJFRghyncCt4hdZ7
    UtsdZmnG6wwDpRV1mf8uyMWuJGCRkEYdyjxwiz6rNixbCBtwaF9jw>
X-ME-Received: <xmr:7ch5afgU5DrZpU7KKJvGHJE1tM6LLgS90ZooMJsjExpIA8k5bYs2FLATZAE7DExZUUXdYFzWGy-ikyY-7PeQYT-5PKiLT2uk0_4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedvkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehtghhlgieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthho
    pehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    eplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:7ch5aaRDDMUZbL5aKNd0NsSm6EV_jfw9QE6-LOQymmkb-Zwsrzgt2g>
    <xmx:7ch5aYZofHUfeH7tcCUHonMwk7BTrhwuBMDXTu1uKRh9C3jN3IMB0w>
    <xmx:7ch5afS3TVLs-lDu_I4QuSGRtBIPmXEif-J_NTaecTyny1kmPRS51A>
    <xmx:7ch5af-lF9t_XKCj32sWHJMAwhYeLEpPCXYxHpK7dDGlsH2IbxRKfQ>
    <xmx:7ch5aVGeJiN1Vi2OFOdWOHF3qO5qx_faxELUvo02cZdoX0Il6jdU8z8Q>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 03:29:32 -0500 (EST)
Date: Wed, 28 Jan 2026 09:29:31 +0100
From: Janne Grunau <j@jannau.net>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] irqchip/apple-aic: Add support for "apple,t8122-aic3"
Message-ID: <20260128082931.GC1667597@robin.jannau.net>
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
 <20260125-irq-apple-aic3-v1-2-a2afe66a6ab9@jannau.net>
 <87fr7scqxl.ffs@tglx>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fr7scqxl.ffs@tglx>

On Mon, Jan 26, 2026 at 04:52:06PM +0100, Thomas Gleixner wrote:
> On Sun, Jan 25 2026 at 12:08, Janne Grunau wrote:
> > +/*
> > + * AIC v3 registers (MMIO)
> > + */
> > + 
> 
> Pointless newline and please make this a /* Oneline comment */

copy-n-pasted from AICv2 (and AICv1) above, changed locally for v2

> > +#define AIC3_IRQ_CFG		0x10000
> > +
> >  	}
> > +	case 3:
> >  	case 2: {
> 
> 1 3 2 is a weird count order...

version 3 was using a fall-through in the intial version so the order
made sense then. Change locally to 'case 2 ... 3:'

Janne
