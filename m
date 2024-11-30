Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B62715C120
	for <asahi@lists.linux.dev>; Sat, 30 Nov 2024 11:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732966615; cv=none; b=SiNMhwVgOxXbKGZn/4hw4+zOV7n6RQWiAzlE2Nf2y3ypemdGfJZQtnyukSsI5phAWAUUflRknoQVPfG6q9LiDurgxTSO8ZW3il4ynZg8EXkYbEp2Z11rxd+HXd++1JZ1kbqy7AYlUFSSS8QazeOA3b2WUqbBdHJckIGKGcJT7Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732966615; c=relaxed/simple;
	bh=cs9uDUZB2++se5eVEafXkaa+FpWCY9F8GcDMnkcUmpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3CIILtdA8s4U+LfFGk5FLsYkRomMloIkMsh68NJKGt4nykBeq0xOddZYA2rKyNfpPKOrnEM7Zoy/Cxctx1ap8a8QtJJo5jPBlglV9cSHrKdLyn6v83ifszM4TGOV0ki9eA1JMYbxYU3H+imJnX3RbYv8eZdEukBpk0JaPrWmfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iZ96JWHn; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iZ96JWHn"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53ddb99e9dcso2661322e87.3
        for <asahi@lists.linux.dev>; Sat, 30 Nov 2024 03:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732966611; x=1733571411; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/Pf8loTaik8LYCta5Jf2Zin0SqS3BgDup0y9NRq4n4=;
        b=iZ96JWHn89mEDRRyMcRnbqEJdMJGODPNtdDorEADMOdnRPSBrSG/HKcEeMLCSySWtQ
         llwxujAdg262Z814HyvGDd2Z9232+19w0culGF+ej7InzxEZDRBRM0fD9kY6s+bWdBJO
         i9oM04vMEml8LO6jwp321omwFt6uBhSEX1AhrRbD6dqqx/pmrpjL/XZsgzkw9FSDni92
         Xqolo26zJQF/iW9FqXxwErr+D2nq51jixPM7VK/DiVVCcncNGhgVBCAjUAOc81iTPRla
         4mRMTgC2FPc2Qs++Ks266XQQLY7GJvaZcjIH+MK9zlS9/KblJxLlZM2jzwJArHAD65/C
         7W6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732966611; x=1733571411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/Pf8loTaik8LYCta5Jf2Zin0SqS3BgDup0y9NRq4n4=;
        b=tEk/Jbz6wKSn+0RpRkWRBMoaCkNmcjpzvSSvlmr444e3GKWQ7tUN1lNsX7qaOHQO1v
         CLIWmNTWk8DoDQ1lRCOQope4WILaOwdrQgYoWjpK6grbi2wE1Z9CnZ6IoTiw8yKgTq4U
         hSbGOYY4RJu4yAJJY8CPutOH29b1TcbgE03btlMOsRZR906PO22+h5Ey8mAVyFonD9bb
         esnANKjjT1oM2JZXrE7WAyojOsI3FZwP32XKpymU+9NbPRvdbek6UtLXdEli797m5pzO
         MqL6frZuRz1/WPq3i1PEZE+W6KsHRyfCZi4wIWKzqq7Nx0VX5rFgCOlZlY3cPQVh2wZq
         e6/w==
X-Forwarded-Encrypted: i=1; AJvYcCXGAgQpxMGqxveJYxB9kgLvmFGpIqbqQ5uUJKwcAHOiLo2ZUpFhEx9Gk/aH4+ecnidnp/Cn/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUGN5ndR6//9ekA+MvqUCeW5P/qzwzzcSmRJxMv+ZO9AzTA2rt
	oecx6fi//b4VeZ7NAFxg1qj0jkJ0xS95TFI6w4TKmGQUvxIYABY6eYEpN6KLStM=
X-Gm-Gg: ASbGnctBnsACoS8G2Ge3u//GkckJuYA9PWqslIJkeStFn7U75WW7wDX0qb/gJ8giRL3
	aMxeu2G/VT5Lh78i7xMDiciptAT0CMDVv7Mhiy+192ulKgs2IOrDrfsjXSRfzgdM8gEgcKJ4eMK
	Vki7XxE9z6vQlIqG2fouCxMcbD6Oc7iPIWlzedYmFQvWarZlEvXGrsdzZOk8TtUHF+4okYvkWIh
	Mfomz1xlQN/P6uMtDmbukrHQHvtOHLuujUDNyuTLsnEqXXOmUVm3gNCN9et26++xPCFDSukLhHj
	bjbVuqmbbU5H8AHASwgynKS+Kr7P1w==
X-Google-Smtp-Source: AGHT+IGIIEiDb6qXnTmJUVDYgM6wgGw7GPagKQ9KPPyyX5Q/cb5H82b2qn+Ew6KeyuYbpTeKoPB4zw==
X-Received: by 2002:a05:6512:3f1f:b0:53d:d3ff:77f6 with SMTP id 2adb3069b0e04-53df010900cmr9945955e87.46.1732966611547;
        Sat, 30 Nov 2024 03:36:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649f71asm754516e87.244.2024.11.30.03.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 03:36:50 -0800 (PST)
Date: Sat, 30 Nov 2024 13:36:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v2 3/5] drm: panel: Add a panel driver for the Summit
 display
Message-ID: <qowuzrx7s76r3soelwcvlbnksvstlpdind5xxejuqeeohjzsbh@evmuvvzxp3qh>
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com>
 <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
 <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
 <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com>

On Sat, Nov 30, 2024 at 12:15:25PM +0100, Sasha Finkelstein wrote:
> On Sat, 30 Nov 2024 at 10:29, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > > +
> > > +static int summit_resume(struct device *dev)
> > > +{
> > > +     return summit_set_brightness(dev);
> >
> > Doesn't the generic code already handle that for you?
> 
> Apparently not, I have commented out the pm ops, entered sleep
> and the display stayed on.

Please add BL_CORE_SUSPENDRESUME option to the backlight device.
But interestingly enough, none of the panels set that flag.

-- 
With best wishes
Dmitry
