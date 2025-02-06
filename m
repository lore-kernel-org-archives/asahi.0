Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4A070838
	for <asahi@lists.linux.dev>; Thu,  6 Feb 2025 03:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738812414; cv=none; b=FD/hWKpv+dVufV8kVY95yH32CIDt1WVL5gAivwXjVDHj5PjVRZEzqWbHYg6b/v/WVg2JI1a/4q3LORNEFGpJPu/pn1IHIX45SO9vmzgI5O57J6dKseGkhkXrY/8qu2LsdrZOceIwNB4fuRruGVSJhLechbgUJy5CBfMmhKHmzt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738812414; c=relaxed/simple;
	bh=jpu9uDNeDBdC6VtS2p5oWuNJTeUlGlui3vXVeWRSCEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEBUT1lLOTqGWsk4e8l4YSyicC5Uhy6Ve5uFX0KFNXN5FH+qCI5IqeXXj0y+5SmiTm9BCqP/b2iWdos1PeigwJYHDcJArsiZV9kuDOkc6q1IYDjZqiQKPe7JoXQAu2gzXG435uXs6F93pJOYbElaexnvl5kcKknZmpDq+BnJuVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwTJF4KB; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwTJF4KB"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a04so4764071fa.2
        for <asahi@lists.linux.dev>; Wed, 05 Feb 2025 19:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738812410; x=1739417210; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DdG5Jn1MW15Wn8u30uTGjRTJ9vbOt12LrxRPZobjB0=;
        b=LwTJF4KBD/9yUjUkQwgnw6xp5C+TmxPblGLauSSBM8vBqNk6jWJymxQF7MjAN04K0H
         1rM0yv2pyDyN/a5/6H3uUOyoSht9GeKe4tslQe1ijsIg2Hc9yvQnzjhTuLXwabQraY7j
         2d5GSCNE0JgqTCcP7lnSxx2hEpOjv9GYBIBxjgK6/jpRA+W9pu+cBnsn/UFIVcfHG0xI
         66BMWB6Iy/YQrnVm4XW+5gfOqNBG+m+Y//ittCZo9gNyxspDnG2tUB9fZUMs/xeWHtQN
         h3smKGHmq7t3to6xPKGhfNdiqyOYyvOYbpfhkcdEFLeNM9ZZehBZ7zQTqgxnuGr8nhvi
         xJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738812410; x=1739417210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DdG5Jn1MW15Wn8u30uTGjRTJ9vbOt12LrxRPZobjB0=;
        b=pVFk9XP6OEx88SDuA9yDqRsXtU+9OUOgaM6bEeUYZdYF5NmC9/xteu7akzsV553rIH
         r7FrHipzDSIoObNUsW6rE2kcjlD0/TvR3OtTWec8uQnIEkIyUCffETGGhxxupNJ2T+87
         9ff1SSSPibm059z7DvdU744qRZnTFu6jyHIIerPLgVuAYJ95Ww2w7MLUWzstqUMuZfKs
         etF9mLceHB+LQX0wrsM7aoshDNyseRR9tjLuP39fQuPo7apAMNpXSN2Rc7Ja3GYdmzuY
         C1o5ipBru6fCnG9J32GdkqZdldIZQjPofQnG0tryuFcbcylyqeiJ4Bry7mYOOumDXJ42
         3NGg==
X-Forwarded-Encrypted: i=1; AJvYcCXrVg5kQoeLpo7656/y690HB+OJLepz9Xb+7KFwkH4wKaJk43w4PM/CDA5E1hB1/txKFoZrrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdhI4uoidHbWd+CyC9WamZypyi+5CTURj0X0tgDHf4vwE+Nr2N
	QyrwlJ/NwiY4u3n4A5Ky54/IrGzdB78/nwKRpcM4dc7hMok5u34RmgLN67qQL2E=
X-Gm-Gg: ASbGncvHk8b2WAOsUfQfZkqSWRNUl80ceJwrWL8ZtZJ/H2+vSyKLZHV+J0SoKZ7rYMh
	qgz8hIijiLWKdMLfvDAH9mBqOyPIXXo2rFkoRmTbf2l4IRGcgJOTx0aEQ1IMHSciER6nJQKnDFU
	4ribmi2cYVZTEXdPA0s6JUczM8ifnmNlk9/dYH3QQAZ4wgspCrp9L9q42Le8r4hX3mN22udNB9s
	E/bmgCGn3tgDnW/weS9xgk9VlvpCefNb5pyXuzxxB0cnCvtU+uSV/hFy5/vfdWpa5pUZv9K2Hla
	czdm4Ru1TTYTkkRVOW+PAQ/+Gx3IZEGWXkOWuPx8wcaW8l3CqR6nWWFXExMm2RirDRiGU8k=
X-Google-Smtp-Source: AGHT+IHW1jb3KW8x6tt/qBgkvjmxR3wnyBKxeKsQxRREB62A0u+WNaONlVtge6tXCMFRwKna1G8X8A==
X-Received: by 2002:a2e:a54f:0:b0:300:33b1:f0e1 with SMTP id 38308e7fff4ca-307cf23dbd9mr17475791fa.0.1738812410424;
        Wed, 05 Feb 2025 19:26:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1c797csm236761fa.63.2025.02.05.19.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:26:49 -0800 (PST)
Date: Thu, 6 Feb 2025 05:26:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v5 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <lnsv5o2uln3bvwryxybx7xb4w3j4e3rr2h5inj7t6cat5zord5@lgohn6yrygrt>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-2-4e4ec979bbf2@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-adpdrm-v5-2-4e4ec979bbf2@gmail.com>

On Wed, Feb 05, 2025 at 11:10:51PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> This display controller is present on M-series chips and is used
> to drive the touchbar display.
> 
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig        |   2 +
>  drivers/gpu/drm/Makefile       |   1 +
>  drivers/gpu/drm/adp/Kconfig    |  17 ++
>  drivers/gpu/drm/adp/Makefile   |   5 +
>  drivers/gpu/drm/adp/adp-mipi.c | 276 ++++++++++++++++++
>  drivers/gpu/drm/adp/adp_drv.c  | 617 +++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 918 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
