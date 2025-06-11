Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD5122331E
	for <asahi@lists.linux.dev>; Wed, 11 Jun 2025 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749663743; cv=none; b=pmc16EnTl9ANsg+PpWsCeNg705iHVtkUSU8itCDGTERL/l0ccqu6x+7LugHixr6WA57HHIZsCJrCdmh5SYWyXl/9dkjGCNlNDo/gUDfB+D1JLDy0cutNQx5SOP61YNRFZ0z4ByJp9L58SshowrG+SHaF1MR6/kBObGAmJ4UBjr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749663743; c=relaxed/simple;
	bh=FxXiS1up3idFBS9Z/v/uQ3mptQWTxytddhPy/wuI1VY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DI3B6+y08Y9ECfNCiR0nrkMUOi80kGimZaCrud9MGGiUrq/UF69MgKfQInoAjagethLyfeQ/vUs1cEgQOsTfPRgBLfxef/uaUi+XQN5kbLl8XJa42jWxaXuemRZ+pXQ21apcyXQLRSDYiojIbVKZs70IPwYQsW5y2bNDB2RijQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=noL8oAUj; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="noL8oAUj"
Date: Wed, 11 Jun 2025 13:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1749663729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M04fDeushxPchuK1dMMDoSQsrz1Jp40lXk778tz1orA=;
	b=noL8oAUjbyjFLUAACI63HDtbuYvsW3Nr+LqdOtwNEvtyvrvrW5+RvXYbqipu8IIpJhx7uO
	sSTpWK48Zo1bECGqPvChCAIqgocuS4tqtB+pSIqfVaaGjOiGLx1E8AzaIU3x0OF45q4by0
	50p0tSUjMuuQiaLq7J+CVUIJstD3XArQq1qRr0uUfTj+5RHe7/0eozMi1eCoZ3/qGpD/BN
	UtENLrRZlPb6L4eOyJ4fqYB0P83I2DTivjnCKfKoetiqDOJVMFowapU+AyZisJyIQyOJTj
	zQFw/UUJH7+a93Ue6x66bPwqcOFK3myFirkUEecWToEM6S7Uw5TY4vixH/1sCQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Bindings and DTS for Apple SoC GPUs
Message-ID: <aEm_7NECSykMX5cs@blossom>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
X-Migadu-Flow: FLOW_OUT

> 
> This patch series adds the DT bindings and tree entries for the GPU
> present in Apple M-series SoCs. The driver itself is in Rust and
> upstream is currently missing several prerequisite bindings, so will
> be sent later.

It would be good to include links to the kernel + m1n1 branches that
support this binding, since it's not what downstream ships.
