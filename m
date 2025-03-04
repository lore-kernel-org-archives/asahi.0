Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D830B3FFD
	for <asahi@lists.linux.dev>; Tue,  4 Mar 2025 00:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741046476; cv=none; b=une8jbzpwybXZoxMGQ/OHqubl5sw646PfGbwok6soGpQt6BebIerFuxQQnY9gscRRa3IP8p/aAujdFQ7ylc/ay31VBJ80QY2bTl3c42hihO1SpBbob52v2N+peKCCgeySlZYCCewZujG0+oV0JzDtXPhCvGqGVFIpDFdKIL7iZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741046476; c=relaxed/simple;
	bh=9+pEkwg2vuoEzMhL5Cl/B8uzhCiG5riWIsKZ/O2ZmG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5sgLYbQxJKVJpKCB89PmNJlRw4lvzxeKb5U9mZmN3Z0V9mv7CPDHcuyRobgCJm8xpRwPI1CE7sWcvJJueq4WYDABBMWHsE9/VK32jaazVuqWxpShQ0L3LAUYMg4+8azpI359MPykkksfYn3V2veJBNapzcQqodHpYABZ8uIRFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fqyXUs0J; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqyXUs0J"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-547bcef2f96so5678456e87.1
        for <asahi@lists.linux.dev>; Mon, 03 Mar 2025 16:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741046472; x=1741651272; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nkqxBKG8Qf6FiNEdeYYpYgDqec2n3GJdXjk7zy/AcfA=;
        b=fqyXUs0JlDg/cmsfaRv/VVx+rXfYZ1T0PEKMpSSn6SAgCW+Shac1bL14PFZMtVuuED
         0He3lS/AZ5JiTwAV1EndReGQds2PfbZQaekoyMvAlxY23UM81GHuD1i1WKdW3UBXdywj
         sbeB0pbS4Er8nqBC6aa8A8fF/m06IH15nYUZo1ebsYfhwXtl3it3HZ02UZC/MG/7ItS7
         QU833i3YMLFgoJg+/7NxigUMG5WRKTOb320aW/gXxKpSfbHcIgtPAkfBWGnjR8Zybwen
         1Cwrz4pn5rGg9uLfu7FHX8hAbH8z27zRZ+kKy3ehZyQkUO68DayRcgIDc5ak+7fJpz5A
         N72A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741046472; x=1741651272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkqxBKG8Qf6FiNEdeYYpYgDqec2n3GJdXjk7zy/AcfA=;
        b=ZdRcz4O0q/kfffCKX2EWA6G6oeQunzxW+9dNYhzAwTYQ8DtL7XdtaB9jrZQuajuhvB
         66+u7xRRG3TSHb+AwwQAGqRlyaQS8tw1ZmgJY9EhPd4nT5LsVjYrQkhyBoJkU9yNcoeI
         DkhpS7Hni2LrUv3dCDaZeEDV7vUvMyoJmbzTvLZ1UIYltjsBsrpdaBRNkJ6YGXTEVz/2
         78b5biePCNQ1OlGfol5jY6NhWkS6GDMGmtJUefhaXpvvd6lC9ixUAqY3SHqmvn5oUtBd
         TJGUd/gkHWLrKC5m+wwL1lFFBxCzeVkR7ml2uMZdpjpoTDP/t2kpygJAN2hEe3ip+9a2
         65GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5fei9KVfrar62VEAGtqG9zI8wttzGThCuoR3WR4WobqsFegw6dgsSTJnWKKMevIDWtTjBng==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz40CfkLvkmNx8FRA6LR5iY95sOybi3Qogv7RtyIAPlw0XDvDg
	X4IHHWWTrpnZjvFIncykmkpvWv9081Nw2O3dakvE20q/rgcTWak/o4TE8LcqvwI=
X-Gm-Gg: ASbGnctVC6KxUf3qk5yiUtwtsaq4wqlqQjrl3RVz8mase/xTSfCzfBed1R4KuxCX62W
	o/8fYovBfPA0a5esZsvEJ5cH6ZH6z8h4ydxkmLknaEClG6KKrHBLMaYl+/NEhhJB3z9UYCvf5JJ
	3qy+4HEi3de2E7nqWDjKO5n4MkZOc957BWSTM30izrP1CBuUA15typPDp0kzddSDtcTFIrFCdK4
	lvc5fWS7zKcd6TJHfGANGDhUnwIQAARRNLq93kWB4Z5MAi4E4sdl7fmKDT1dX3i/fivWZtx0l5E
	iIXdn+8xI4d5kygPE+0jj8UqN7dClitkvaCw6/fTqqpmt9F/XRNJztxyKfEgfy6s01zBQkWG01r
	TG1najCeRxLR2sg6r5ztLRHk/
X-Google-Smtp-Source: AGHT+IGAn6gM1TyoFfcxy1mqC0F4XhADSkCvoUeeALC8/A3I1KfzwKl6LMwy2iUWuocM+y/26k7tHw==
X-Received: by 2002:a05:6512:234f:b0:549:6451:7ea0 with SMTP id 2adb3069b0e04-54964517fb8mr2749118e87.19.1741046471766;
        Mon, 03 Mar 2025 16:01:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443cd03dsm1427182e87.244.2025.03.03.16.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 16:01:10 -0800 (PST)
Date: Tue, 4 Mar 2025 02:01:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maxime Ripard <mripard@kernel.org>, fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v7 0/5] Driver for pre-DCP apple display controller.
Message-ID: <dn7zskhxgdgr25nvbnsjyn5brc3yoc446dxz3vqgbiwoccvlcr@5l6f4byj53fo>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
 <c3927b51-55ef-4a38-8931-18ff00caa8d8@linaro.org>
 <Z8XcH7xoDC7TA7ZC@blossom>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8XcH7xoDC7TA7ZC@blossom>

On Mon, Mar 03, 2025 at 11:43:11AM -0500, Alyssa Rosenzweig wrote:
> > > Sasha Finkelstein (5):
> > >        dt-bindings: display: Add Apple pre-DCP display controller
> > >        drm: adp: Add Apple Display Pipe driver
> > >        drm: panel: Add a panel driver for the Summit display
> > >        arm64: dts: apple: Add touchbar screen nodes
> > >        MAINTAINERS: Add entries for touchbar display driver
> > > 
> > >   .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
> > >   .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
> > >   .../bindings/display/panel/apple,summit.yaml       |  58 ++
> > >   MAINTAINERS                                        |  16 +
> > >   arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
> > >   arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
> > >   arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
> > >   arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
> > >   drivers/gpu/drm/Kconfig                            |   2 +
> > >   drivers/gpu/drm/Makefile                           |   1 +
> > >   drivers/gpu/drm/adp/Kconfig                        |  17 +
> > >   drivers/gpu/drm/adp/Makefile                       |   5 +
> > >   drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
> > >   drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++++++++
> > >   drivers/gpu/drm/panel/Kconfig                      |   9 +
> > >   drivers/gpu/drm/panel/Makefile                     |   1 +
> > >   drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
> > >   17 files changed, 1489 insertions(+)
> > > ---
> > > base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
> > > change-id: 20241124-adpdrm-25fce3dd8a71
> > > 
> > > 
> > 
> > All patches are reviewed, can we funnel patches 1, 2 & 5 via drm-misc-next now ?
> 
> I'm planning to do so today, just need to get dim setup first :)

Nice! As a heads up, it would be really-really nice if you can send any
kind of 'applied' message. If you are using 'dim b4-shazam', then
'b4 ty -a' might do that for you. Otherwise just a simple 'hey, applied'
email is useful enough.

-- 
With best wishes
Dmitry
