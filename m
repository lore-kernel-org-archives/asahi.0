Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6E21D540
	for <asahi@lists.linux.dev>; Wed,  5 Mar 2025 13:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182532; cv=none; b=KVYnEJETrLK3GuWUWWWjb2HC1DLDYV8Pfh8VOh9fyGBK6lymbBeSKjT0hqkxD9xcj1FcfQqiSx/Kjn6GPk6RNzXmLnTkCypEo7YV+7tVN3PYxdco1OjKUCSvoeWlUIUS4JrRls9kCfhKqr6VzvK86+sczyoz8/jQfXhHO8X3CS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182532; c=relaxed/simple;
	bh=uR5T1D3QxAJlJ1Grdi1qVI/wsoVx9nCe/kXwEE6UJyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P98VbTFclyqbfOfuy3Q7wBQURpLaCrgkB0+5j9nF+noh4JUhMg1xy45v4XNxqdRi82iYqJQQFMSaMStfOI44FSXIjIUPYWncvIpfSSZ6sevG4rU2QZwOfoi2LAIVY4fGiQVKf27/Ka8tjU69LQy0ScwN3P7ShO8tMoxUFXqLAeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=MQmaoyaK; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="MQmaoyaK"
Date: Wed, 5 Mar 2025 08:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741182528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wb6rcGnysdOjkFCR0OaNCjFIgpAYP0AzENVy2fFqyCo=;
	b=MQmaoyaKEFYFydhvZcXatALOg9G6+iaxRo27Zubxen26s7vvqy9imItga79vuEh+y5w00V
	tWEGEMppaREoQugpDnYbR5rrnCLUkDGmLLXekj3bTCnlWwTKfATTL2VFzCOFk1cLKVJjl3
	p2kUCg7Ss/0BrMFApcKJ8HkyKZP2dO+qOJRJEzR8ulRPNUYrkZLwVTtdiLl0Noe+JTodZZ
	HGfHLMvlMb8Rt7OjveDAPN+L1D2ryDxl6T2V446BWwiJG5HV0n3U6QjnH0+BW1VCDk4hzb
	oVWXF1wOH8083b0o/tpp1i4RASMkr5/vjDO8iMglqx5P3dgHv/QerJ8pJkwLfA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
	Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
Message-ID: <Z8hWN4DpNyTHQf7I@blossom>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
 <Z8XcH7xoDC7TA7ZC@blossom>
 <dn7zskhxgdgr25nvbnsjyn5brc3yoc446dxz3vqgbiwoccvlcr@5l6f4byj53fo>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dn7zskhxgdgr25nvbnsjyn5brc3yoc446dxz3vqgbiwoccvlcr@5l6f4byj53fo>
X-Migadu-Flow: FLOW_OUT

> > > All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?
> > 
> > I'm planning to do so today, just need to get dim setup first :)
> 
> Nice! As a heads up, it would be really-really nice if you can send any
> kind of 'applied' message. If you are using 'dim b4-shazam', then
> 'b4 ty -a' might do that for you. Otherwise just a simple 'hey, applied'
> email is useful enough.

Oh cool, it didn't occur to me that `b4 ty` would compose with `dim
b4-shazam`. Sent a very belated message and will try to make a habit of
it going forward.

Thanks for the tip!

Cheers,
Alyssa
