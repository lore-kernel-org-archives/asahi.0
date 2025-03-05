Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30FF24FBFB
	for <asahi@lists.linux.dev>; Wed,  5 Mar 2025 14:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741185971; cv=none; b=soLoWngy5Iu9svV2zyiVnKUDoW2b63bmqRyKCGMhB864rkc+AiYU1AXbIQS5dncvcTf3wzRrArh7+PtbRg0X1CepsF1vDK80zYAnGOxxu1O64AbpcRlzb71V5XM66TdR4MmL1nBnUvRVPbCRSgVC8Wn+kuiY2lDNOqp4tsLalHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741185971; c=relaxed/simple;
	bh=v/k438lPzhv8xNApX4OEFpLPomb3zEfgllOfcgFW0+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=js9FDLASxsogvyH2J0NntXLuj3h5pmn8kJ33YrP4ulANQDyWbE594k11aPAlFqStR3EOPPvbLZsc9mcf25R4y84uMRYYricsRpKaVd0BSAa6QLKxCdXhnsGtq0tSEfErr9CK/tyQ3owWs5Br6t29gq4wxPoXi0sTsjIRJU8mUdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=jQZX5anT; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="jQZX5anT"
Date: Wed, 5 Mar 2025 09:45:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741185960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z329ElrlSp3rQHppigkdIVXSICv/TbxnBscusxoOv24=;
	b=jQZX5anT/ko5/mYm0pMPS1Y+rc5VQkGiE84sLqQvSND1ZGpDwx5bqNeIwukC8GWvTOiwpL
	1REMtXHJxYGZWst1d7jx5kxyyELwriPt9Vsy/N59jY4egAZZXQyOm7HMUHjx9fjnYzTUY6
	/wqyO6vOQtqtXYrfMxR6REWSlMGrLI+VwryHoZn4KSRDANskvTQQXxgFSeoXowrP2KjO0E
	NlcSMhJUchdJ1pr0xQDcmf32ygWMeax6BDUdGb+NK1gjW5JN6e8hQfyaXTBzHLlDyHWWLP
	ZRXJED/XUXq/nuEZJ3SCjd4kkhyqCGbtj/78++gDX5xRVOPB1LdJ1tt3c/amVg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v8 0/5] Driver for pre-DCP apple display controller.
Message-ID: <Z8hjnRyCn82OrDcO@blossom>
References: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
 <174118223158.156873.6982508045942987984.b4-ty@rosenzweig.io>
 <Z8hZKW_F-HtzYm-w@blossom>
 <18f9658f-f2ca-4fd9-809c-ec4d198072be@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18f9658f-f2ca-4fd9-809c-ec4d198072be@linaro.org>
X-Migadu-Flow: FLOW_OUT

> Yeah it's because you applied the whole patchset, and discarded/skipped
> patch 3 & 4 afterwards, so b4 gets confused.
> 
> Next time specify which patch you want to apply with -P 1,2,5
> and b4 with know which patch you applied and generate a good ty patch.

Ah nice, didn't know about -P, thanks!
