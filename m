Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1543622B8A6
	for <asahi@lists.linux.dev>; Sun, 15 Feb 2026 07:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771142326; cv=none; b=nZaeTby1Ovth6Hgej+mk24IyqVRzzxe+Eqfb645y+XHA554/amssfazQwgt+rsvBH+vEr2+vILNqdbxzttNWH3WZuwEWxspVvfKoMk+uYyH5NGntv1JMne18UJxq3QCw0SHhIgS2VQt09l0FlnPpyc6FPqYUoMoqLN2UvUnG0FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771142326; c=relaxed/simple;
	bh=yG7CBw5/zIdmRW0ZOzt3Jsh8Q4kq2NV9qIscPOOtK88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+KeXVY3besKlAS7RZYuuB0O9zFl41k7CL0JmaZ2mMNpD/Hc0ubBDxcuXsp9Y9pdzmVfqY56Vhb9tVwpN8NOyFp9tzOHtwUl1qb7l7dEvsMzKOPBSKJWVyuQ1wU1quwcgQcpcxdhFBn57aDNQc5v/QQglfHusvz2QRiZ7lPq8zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=EMqEilal; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rvZ9yE8K; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="EMqEilal";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rvZ9yE8K"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BEF027A0316;
	Sun, 15 Feb 2026 02:58:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 15 Feb 2026 02:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771142322; x=1771228722; bh=OioEWjo2aq
	kQeqhQlThNrl/fRVnuDG2LNFbb2f1Uc1U=; b=EMqEilalv4wZ5Ik3pUeJS6cd2z
	QqW47Vmxxj6afOTfHpFDHt8tnTHR+13r/EqEoUYY0sosRIYkO3HCXAmwKZGI6yH1
	APGDY+0HztiLzitTBVdVH/NyRuCK1qNtiHJws8sZWbTCbjHQkeHbf8rHWVNQfoHs
	jjtd+ba0SrdMR5acvjRWUyM3jVdL8uoC9bQI1MB4FpsZJLy378Qiq5rNL3qhof6K
	OHy6NS8JQ7sg8Xq0izR+IwMGX9pU0fNtaEwDNhBqeyLUIf+UQ+sc8EFXIRbPsmBZ
	udXLulTpEXZSPD/M1bqTA8KrorSmrdiMlN4JV5fDTkTtJ9Zg8hLQfaVQcNDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771142322; x=1771228722; bh=OioEWjo2aqkQeqhQlThNrl/fRVnuDG2LNFb
	b2f1Uc1U=; b=rvZ9yE8KNNR73WV9xK0AT/as8yIs6/qjoDJ/6/mk5yPDeCL2d0g
	H/70YE5Tt6tHQ8bClsn6CQKj9TeN8PbctHa4/y/M+KEnd2OjaZ4wFOBQO4Vtz/Ia
	RdK6xLFkNU2HTxYKRpeirpIvieWLrYPQzfVnKPvfJke1pPLvObiXmW66ZHxaPW1N
	FrcgyKaHGVBeFSLSoEwXvqHtZk2zBpNy5tfwYntogtuSQ3cZdz4KTLZHye8pHzMI
	52g7XSEWgYDv3y7L1zE5cwnNFw5xuByQ0fBB+s8AD+Zyil/ddPzJ7Y5XG4gVew0p
	hxQbKuLAzsc4RUu/bbskLkGR2H4KH3A13pA==
X-ME-Sender: <xms:sXyRacn3LCYcmnmwxgNWIbCMti7OV1qrDsX8S4YLvKFpNtAYu5kQUQ>
    <xme:sXyRaR2OEjzempsKbnSpzIZ7c0iOxvpMV0lXNc0VSpwbguFLfSyHTnpX9cv-zDXvn
    -5zMYEhOB-JkXhDCcIe3Qby4UpFjZpQLVHiqmkbcX-Z83QEdbDo6mI>
X-ME-Received: <xmr:sXyRaVf5EPyc-MZKCZs16uQQK2bWJVeB3hWL6_hPi1lMcPKAj-NyFhl2Z_6jV3aOg2eCEbsqvNbuj7-L2orf9Khu3_5zXI4WBkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudefgeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgud
    euffelfeekgeeukedtheekjeettdfftddujefhvdehtefgiefgledtueefjeenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedu
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhlthgvrghnvhesghhmrghilh
    drtghomhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    nhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepvhhkohhulheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhr
    ghdprhgtphhtthhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtph
    htthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhi
    nhhugidqphhhhieslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:sXyRabZk5KO2QRA0csLl0xckYfThK33BbMSQYvvabvfK8S0uaYaiLg>
    <xmx:sXyRaaEn_S8Y4OFGDD59RLKwdYSOFutDgONmqCZ0YBp_Ei9n0KN4nw>
    <xmx:sXyRaZkLSWkbBy1UVNssHbfIvKmUJSvWNN2zBT8rpTaZCCM5cDKqLA>
    <xmx:sXyRadep38oAf9ngxwGcpamu40qccfYUlEu5QGw9IKVVCpMK8Ki3qw>
    <xmx:snyRaYrBeEW-UOX5HvRU58xHzhFw8sTxp4uX6Ht7ERF7C73iknDkwWyh>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Feb 2026 02:58:40 -0500 (EST)
Date: Sun, 15 Feb 2026 08:58:39 +0100
From: Janne Grunau <j@jannau.net>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH phy-next] phy: apple: apple: Check the actual ioremap
 return value
Message-ID: <20260215075839.GA1924982@robin.jannau.net>
References: <20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net>
 <20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net>
 <20260210204822.jr22el4rlyosin2q@skbuf>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260210204822.jr22el4rlyosin2q@skbuf>

Hej Vladimir,

On Tue, Feb 10, 2026 at 10:48:22PM +0200, Vladimir Oltean wrote:
> Hello Janne,
> 
> On Sat, Feb 07, 2026 at 05:40:34PM +0100, Janne Grunau wrote:
> > The address where the devm_ioremap_resource() return value is stored is
> > always a valid pointer. Check the actual return value instead as that
> > that might be an error value.
> > 
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/asahi/aYXvX1bYOXtYCgfC@stanley.mountain/
> > Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >  drivers/phy/apple/atc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> > index dc867f368b68748ea953e594ad998d7f965d8d1d..c144e273a555a741b49adfccbe046df83d193e03 100644
> > --- a/drivers/phy/apple/atc.c
> > +++ b/drivers/phy/apple/atc.c
> > @@ -2206,7 +2206,7 @@ static int atcphy_map_resources(struct platform_device *pdev, struct apple_atcph
> >  	for (int i = 0; i < ARRAY_SIZE(resources); i++) {
> >  		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resources[i].name);
> >  		*resources[i].addr = devm_ioremap_resource(&pdev->dev, res);
> > -		if (IS_ERR(resources[i].addr))
> > +		if (IS_ERR(*resources[i].addr))
> >  			return dev_err_probe(atcphy->dev, PTR_ERR(resources[i].addr),
> >  					     "Unable to map %s regs", resources[i].name);
> 
> This does not seem correct - every call site that tests a pointer for
> IS_ERR() also decodes the error using PTR_ERR(). Whereas you are here
> creating the pattern "if (IS_ERR(*a)) return PTR_ERR(a)".

missed this.

> Proven practice seems to tell us that insisting to save the
> devm_ioremap_resource() return code directly in *resources[i].addr
> is too complex here.
> 
> Would you consider creating a temporary "void __iomem *addr" local
> variable, and set "*resources[i].addr = addr" only once it's validated?
> This would make the code obviously correct upon review.

I agree. A local variable makes this easier to read. Thanks for spotting
this and the suggestion. I'll change that for v2.

Janne
