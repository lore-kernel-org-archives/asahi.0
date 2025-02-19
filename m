Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDF32586CF
	for <asahi@lists.linux.dev>; Wed, 19 Feb 2025 22:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740003877; cv=none; b=d6RG+BbuqjVvWj4SP/Er3A9paJhL46Z6jwxw0W2C4z9x39wxUgX9T585+D2+9AAj/V5nOGqR6+e1w7Uo76kMYg1h8li+LUr1DJDvynVlv+VGUcq3f/CdAwJ47BjuxGeVxc2b7zpMr/l8YXcSKgr9nN/Y8WiHwJAzx4b/ckj98h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740003877; c=relaxed/simple;
	bh=zNyDVRCbinwVPrGr0c4c+/SrOTp2rVaKvOFQaTQyro8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnJ2yVWWmrVIDtBAX7qo1GipG9/qtc0PbLE7xd4PlEc070GqdVoMtqCzvnkHuLSzaMWROOqzWPvASkEqceqNXNVPW0OyflS7n7QSI16qRA4x+ZXYu4SuycHm/rkci3nlQaH588ZNVM0sQ9n6u9mBb6iQOPYtZcxtz4QGkq6TX/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=TK2X9elk; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="TK2X9elk"
Date: Wed, 19 Feb 2025 17:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740003863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xMfsg5DjP984vJzEzWbqHu3ycxE0CABCHHT+osJG0mk=;
	b=TK2X9elkDpBOX2YBfg+uMrNqyNts+X52y/QzniWg6JrzyvxeB3lIghOKBC1qm3NO/V+Djq
	/R1QXFACzF0ZBIX/Z4Weo5OMEkM7eBO8Vq9LfhNR9imUxpyLtHbyGDKX3ZLOWg+3pvnIhq
	X0KdTnNfV8ROGPRIH/XbxQ4eiqXaYJAmlZdd4bAI0tfouQ1maFmmYYXVaNuTwtSkjbK6cr
	bQacqsXOXV3U1t6Wq2LoJeZ82OQfWJOXACcuQceK5fJDju9+scnC6AQQeqLsrhrocZTnLv
	oGoSTVen0Z+4DW+W3phMKxsbT9WBqwVrvCbq2QRHnr92mUF0CSjRTSUkPITBLA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Janne Grunau <j@jannau.net>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH] drm: add modifiers for Apple twiddled layouts
Message-ID: <Z7ZaC9d_AyIe07n5@blossom>
References: <20250218-apple-twiddled-modifiers-v1-1-8551bab4321f@rosenzweig.io>
 <20250219214224.GB57799@robin.jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219214224.GB57799@robin.jannau.net>
X-Migadu-Flow: FLOW_OUT

> > +/*
> > + * Apple twiddled and compressed layout.
> > + *
> > + * This is the main lossless image compression layout supported by Apple GPUs.
> > + *
> > + * The image is divided into tiles that are internally twiddled.  In addition to
> 
> Does the compressed format uses the same the sime tile sizes (in pixel
> dimensions) and layout as DRM_FORMAT_MOD_APPLE_TWIDDLED? I'd assume so
> but I think it's worth stating explictly.

It does. I'll reword to make that more clear.
