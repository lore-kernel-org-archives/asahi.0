Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D49215798
	for <asahi@lists.linux.dev>; Thu, 21 Aug 2025 10:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755772290; cv=none; b=eFA6BsJ3R0zmFAgkYUqkx1QnxQN2LTp21IFwAUvBaJ+fK8vVjceU/MaCuSZhiIrDLT33uOAt90Aof0uitVyPHIVlHhYytficR/snmxbgT5J43JvMaz7ZVsRPhRMf0x5Jn/GsbsFIvXSzsALx535i8jaZZocRqjJwNY32qzHO2lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755772290; c=relaxed/simple;
	bh=L2n256knK+5dIW7WpN0KI9rFJ2kkJpRTU1MxJYBy+A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3GnnvDTtVZMDOM/5pZiSueGUeKIoRBFv6cTz++hOC9r2DfulD0eC12o/RccmZDRX9JJJvK/TZME0PZK2/TSjtqjb0f+7A3gd/T0BH1weVcglzW5ZLFSrqI6VrrnVgoFe5J3Hebtcd/8qwhnapD/b/PZbP9/1zNdInJiZkW6oCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=j686JQrA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ELkRK+/u; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="j686JQrA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ELkRK+/u"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1EFD614000F8;
	Thu, 21 Aug 2025 06:31:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 21 Aug 2025 06:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1755772288; x=1755858688; bh=PXKKI4OnXo
	7t/YcWii3j+mJxOzhErP8TYu8TKKt71MY=; b=j686JQrAisvABfKcShupGMSwRS
	br5RiBNpoR/5x/WdLoCsWaE/jZbUCa0bdiMZoP8mQfbjnZSrZngUR+0xsK/+9R90
	wnNIQ3oqulZFKR90W+jPHHkKqgzBvI/HnfCYpuvSEe2jqKDyV4lpfOEyuNL2/qr3
	C/w+alqMrRgqk7sRvi9VkQCqta3F/Z/ahkvTKfTY45NAFdRGqovXJ46Vbz6VZNRn
	ojUgTKpF8k56vFEsN71kcY02sYT0YEhkuM6BnJeREhrM1EHAUnlVsvhw88vB9H+T
	hUBojEAjlrZNpJNx4a2X3tdTOsQ1P/jXvbw9JhHVnuNBMIVXtkNxrnCMz8DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755772288; x=1755858688; bh=PXKKI4OnXo7t/YcWii3j+mJxOzhErP8TYu8
	TKKt71MY=; b=ELkRK+/u7cZsOZClFlftg0BLd8LFmFzLPKpEarwFmg1S5qlVmXP
	jCnWIQsQ5re3AlrADDTlfDvvLq2lUbhkEUZY8VYwX95WNmJNloY7bJNEcaUTKPwR
	hvJYt2js+Up/64jJdK7jlgapUVrbM547UZbXiXO3hob5/jHiqlYJj304p6fS7tZa
	cmXKKPhmxQqubAcI49zWX9GTg14F3dhRreEivjNtCxAmvSJfnr/10nVk11BflRsJ
	SVZQAPqPqMmxwbYQrhl3/c7PjwtCjB/zivyn3wL460o1TZGfJnq93VlvuaDc9WcL
	XJ3vmupyXBkw7cBrVya/IYk+qkPGIIhmR5Q==
X-ME-Sender: <xms:f_WmaHZb7-9Xi55LSqFbgdhaZxNCe8RPzgyDMEu0jh5xKUPhpzohdQ>
    <xme:f_WmaMUWzlarwwy7d5hhkGAqOeqsIStx-YHGL1kqb1sb6CIrECYpVUREYXPZLa55O
    ZNnnEB35t7ltJFqhwY>
X-ME-Received: <xmr:f_WmaHFPPlcnIyX62t4Lg-Sv5v2kWxUDHwpPgd3_PQZmi_JGfy2q9ZWSwJWE4OPHLwuDslf9D0t_Vplq-ccysQyfBjRBDmJz8-0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedutddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhiohdp
    rhgtphhtthhopehnvggrlhesghhomhhprgdruggvvhdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepkhgvthhtvghnihhssehophgvnhgsshgurdhorhhgpdhrtg
    hpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtoheprghsrghhihes
    lhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:f_WmaOZj_fNrTtNvP0lOwNRNBC3qfZShIW1IjIFRoj0EzONnzKcrKg>
    <xmx:f_WmaOF4ViS7Ns38LIbqcmqU-JXKpiAsrjJ6_rS2y6kMC9jm3NcBDg>
    <xmx:f_WmaM2AxTDvLAgkj7is4jeLWe8gIPYp0c71bcBG4rkGeM5R2l-MhA>
    <xmx:f_WmaKz4kVZWeMZGdnwhZPLVprAZ9p-TB9-8cpNELntu2Z2ChhqsdQ>
    <xmx:gPWmaHJIvsyYvtbRZcgHsJBj1t34ZPnZbGKcUktHp4tQA-6YcPP_M_2M>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Aug 2025 06:31:27 -0400 (EDT)
Date: Thu, 21 Aug 2025 12:31:26 +0200
From: Janne Grunau <j@jannau.net>
To: Rob Herring <robh@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: apple: Add t8112 j415 compatible
Message-ID: <20250821103126.GD1270980@robin.jannau.net>
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
 <20250813-apple-dt-sync-6-17-v1-4-209f15d10aa0@jannau.net>
 <20250820190708.GA538860-robh@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820190708.GA538860-robh@kernel.org>

On Wed, Aug 20, 2025 at 02:07:08PM -0500, Rob Herring wrote:
> On Wed, Aug 13, 2025 at 11:53:36AM +0200, Janne Grunau wrote:
> > This adds the "apple,j415" (MacBook Air (15-inch, M2, 2023) to the
> > apple,t8112 platform.
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >  Documentation/devicetree/bindings/arm/apple.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
> > index da60e9de1cfbd0151e973c3aafba6d0880fc21aa..3b90b5df60507b245de387de104a4e64f234139a 100644
> > --- a/Documentation/devicetree/bindings/arm/apple.yaml
> > +++ b/Documentation/devicetree/bindings/arm/apple.yaml
> > @@ -93,6 +93,7 @@ description: |
> >  
> >    - MacBook Air (M2, 2022)
> >    - MacBook Pro (13-inch, M2, 2022)
> > +  - MacBook Pro (15-inch, M2, 2023)
> 
> s/Pro/Air/?

yes, thanks. changed moved the added entry below "MacBook Air (M2, 2022)"

Janne
