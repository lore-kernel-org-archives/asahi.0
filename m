Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F1A142624
	for <asahi@lists.linux.dev>; Thu,  6 Feb 2025 03:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811501; cv=none; b=S+AReJ08k30Tck4rO2wUpYMFdq+dgvzqjnECMKZGGxw3pOw1QBODicoyMAvOBbo2tyfeWmhI8doRn/SR7c7gcPi5bzpN1IYJr9h5pdv5ivst0jIXkO4JYnMjUhNJXAmIo8RDKCkFZqE+QxUJ0obqyoTeaZZ23l71HBBhMfxU1TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811501; c=relaxed/simple;
	bh=EZRWe/yifMQuPKPKULExrvJUU2qjfPAZUZptOCGg194=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f++PgZIpYYXO/nm7Cve3imsnZsfjd4J4nRoVtd3/VVT9+RU5TkN/0qipgo3DnS/3vb1ie/i7FPjmmr98zNqbhcqkXJnkXFdbHbLKpXI2o0Vd0lxM05RdA4D5bQJUmfGzBW0n29aGkCVuGGMjxY+TXFetc/icRPKpS/AZ5PbiNy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R52Li8Pt; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R52Li8Pt"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54021daa6cbso478335e87.0
        for <asahi@lists.linux.dev>; Wed, 05 Feb 2025 19:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738811498; x=1739416298; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=riZEsBjGD+WMkPhrq6w9Y2zbnt1QJbZcmX3HYuho+5I=;
        b=R52Li8PtPm0wJt/jQsAV72mL+WlfFvBBrgVMkRI9NdqMtR7L2Btm5UBOp8S9dJG62T
         CSRIyyA+Roh38k6kafQMSOMBM3vM2IUNQtvlqCJgPC/bOCPIuzL5uGMmNRZMuIH/owQT
         2og6kQ/zce0vV1iXoqWW6wAcCoJMCXvOf9dqTcF4YPhVmuLzYUNVjU0jDcbZNXcs9wIQ
         XY4F8wPemlK7W8vYKAG22c+Ls6TRhLtRAnP4P9H9ys477WNXtCJgDO/C4gaXmVMToi9+
         BAboXE5Z72x9aS4iCfSiXPGGnYeOYXgahIs2GWkzPj76XOoBrIna2fVmsNTbNaEs4TXP
         lRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811498; x=1739416298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riZEsBjGD+WMkPhrq6w9Y2zbnt1QJbZcmX3HYuho+5I=;
        b=tWGPOq/LWRq+KMuTiUvfU2CnGPdMcpNJVvwoxcMkwiOsjlstDYL03NzmFjJfGQ6HyG
         PxzBdCt2nr6xkUng2+8T6FK193GbmTJUwpwQCF+BEohTcnHBYC/ae9ULo7JqW5bfHvdL
         bM2cIwjlDU2GM1HJ5LSNQ0+/jhNZfR6Le3tW3R94kiXYrW/IcMMUBMTIuTlCeECI/Kwq
         4ncIYEmvjOwZgqDoyXMLG/VRle9cvLs1RE6gTz//CgRo4mK/icNBhn+Kpj1Zu+tYXBOp
         d5osHQLMFobceP3Znk6kJJ5Uza0X7KvczsU3jIoxJkALm74zrrWkcj9zwnk5WEkLQQ7Z
         i4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjMW0YOW5IiVPfPCOh+EUrdT8loSvXF498mPqi8xjQ7YS3zsCAqEb+L3qzwNBv7SZ05Ml/9g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz6PeaBUbZ104ZyxhAURlsmW0387quKQaioUppoEnMgAf1nSEx
	QaC668EjfLbC03aoELKP1vq2ZjoweRZSA3aDTcdKiMU8ujXiXPPn7Mo8w88gdSM=
X-Gm-Gg: ASbGnctfuYP93J3AUBqsbkQmwAsLUCe54D6JFSu+oquHUmFSL5cL2yOrM44KA1xvohT
	+mtEdooMcvN9ypfGgrCA7pjvX5QD8bggerL7bZhy0bp9DJ0hpH+IwYAM0XRSFzThMEvGHArOoO0
	9IodnizdLzajMgagigIqzXKzAsju+XsxsZ7nMGVRYaZr5yyNhObxwIUD+Ef0VAHESfh8571tTRa
	NcrQRPmzKVMc17m6PNtKhwDCQe77QetLvyasddaTybpcb2m99Mh4dW1VzKHVG0WtR1/yr0b8QJw
	hBaG9+uDIMgaZa7W9WFN66Pi0eszcM1vpjlxtxxkmESyKcroyAjnW2N+nbsQzTOP8Op3teU=
X-Google-Smtp-Source: AGHT+IG7cQyWk5BClZUOKBlAbFSkmSlCgj+5e1lmNN+0LsHPGyFIdpVIo0QGlnaSeGvuHE71RAIFfQ==
X-Received: by 2002:a05:6512:3f07:b0:542:2a29:88ed with SMTP id 2adb3069b0e04-54405a68aecmr1721549e87.44.1738811497642;
        Wed, 05 Feb 2025 19:11:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105f336dsm20237e87.201.2025.02.05.19.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 19:11:36 -0800 (PST)
Date: Thu, 6 Feb 2025 05:11:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v5 3/5] drm: panel: Add a panel driver for the Summit
 display
Message-ID: <jubbid3i7revhr4dg2dp6mbnja3yvrndwncppfx66ftnryx47d@q645nyfiaav4>
References: <20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com>
 <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-adpdrm-v5-3-4e4ec979bbf2@gmail.com>

On Wed, Feb 05, 2025 at 11:10:52PM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> This is the display panel used for the touchbar on laptops that have it.
> 
> Co-developed-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/gpu/drm/panel/Kconfig        |   9 +++
>  drivers/gpu/drm/panel/Makefile       |   1 +
>  drivers/gpu/drm/panel/panel-summit.c | 132 +++++++++++++++++++++++++++++++++++
>  3 files changed, 142 insertions(+)
> 
> +
> +static int summit_get_modes(struct drm_panel *panel,
> +			    struct drm_connector *connector)
> +{
> +	struct drm_display_mode *mode = drm_mode_create(connector->dev);
> +
> +	connector->display_info.non_desktop = true;
> +	drm_object_property_set_value(&connector->base,
> +				      connector->dev->mode_config.non_desktop_property,
> +				      connector->display_info.non_desktop);
> +
> +	mode->vdisplay = 2008;
> +	mode->hdisplay = 60;
> +	mode->hsync_start = mode->hdisplay + 8;
> +	mode->hsync_end = mode->hsync_start + 80;
> +	mode->htotal = mode->hsync_end + 40;
> +	mode->vsync_start = mode->vdisplay + 1;
> +	mode->vsync_end = mode->vsync_start + 15;
> +	mode->vtotal = mode->vsync_end + 6;
> +	mode->clock = (mode->vtotal * mode->htotal * 60) / 1000;
> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	mode->flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC;
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +	return 1;
> +}

I think most of the drivers store mode in a static var and then use
drm_connector_helper_get_modes_fixed(). It's a matter of taste, but I
think the latter one is a nice helper.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +static const struct drm_panel_funcs summit_panel_funcs = {
> +	.get_modes = summit_get_modes,
> +};
> +

-- 
With best wishes
Dmitry
