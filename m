Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1C71F63D3
	for <asahi@lists.linux.dev>; Fri, 17 Jan 2025 03:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737085445; cv=none; b=NZKSXh4kU2YrJm4Hq6rDB28whEudlFAQihp5c/IMJMg9Oy6YbwYvVZmzwYhyxufbTfW9fAWc4yBP4OG1a1zRh5N4MeoGB+zpF8QErP2aIoPZs3Nx5TJSJGsIDgp3JrAGlz/1z/DsxO54mjFNC4EaqMh4UzWvLr4cd6UMK5n0Gws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737085445; c=relaxed/simple;
	bh=0dhKv0gLi70+Mn3lfhGBPsydEadYqDGEWN7e/WJvs18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEbbkOsECYixbhs1YPfEQsB4dp0LvBu2In5dLPUOSZpbgDhSZC+Czf3S+YzYQSBg+3K7JReTvaJMwZoNQZfVK1g0cwggHSNJab+1NqC8GxxIj0k3JSxrSk4UvCPpTLAMSX1hDYZtS1ZAQhYBYZzUl7XMWgeEEvBMBgnUc0H896M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RcjppI0N; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RcjppI0N"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-540215984f0so1821081e87.1
        for <asahi@lists.linux.dev>; Thu, 16 Jan 2025 19:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737085441; x=1737690241; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4+rc7zr12NkY8+R4W4XzHgtWfwIjKXfUvC4zjsYnME=;
        b=RcjppI0Nb7BlcvMKCsSUgePX3uqsM2pMnmjsPvSwAMo2Vn2N8R3Z5bRL5ZkzBUTGmV
         8K9j69jb139S85pQU82yBu6Vqf3t0ajJlJ7IJBByHI4S965DtfSTegDOHyN89PHAd5YB
         ORbKLMRYBWeN5RVl/Q3UvLeDzD3gjUI3f4Qmhv56fZ+yBBYwpqNsUDhHcMrs8p8JNA1b
         52VxZOcD5gJpT2NKRrdhx8YF+AKY15xJXA/NCV8PjRAdFXfVviCArt9iXNlxZIEeT96N
         NZUvswALEUHkBqOqxV2H3EKk1rG+geOLFKk9J/h1YwSZFqLIEiBf/3L0pdTmwAPGVWsd
         m/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737085441; x=1737690241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4+rc7zr12NkY8+R4W4XzHgtWfwIjKXfUvC4zjsYnME=;
        b=hS+Jh+sCjgrDyD2E9L6BV5ZwwG3YoV7X2bVGIRUZmT8+HQuzEOV24zhW2luWxARbNK
         3OpOe/zSmXZw50ueWfRHIXYWOLXyvwc1HOZYXzQyZ6pw4Awwh51N0gQ+HGACSwINMg9C
         1C86XNVkIFnFj1oGXrxBXAPaR8pQdOTyDqHOAAIpy964qo85EqA43/0hqugsPJAY1gPi
         FWpdC+ZdDJMNlZVRJTZJePX19BgLM5TQKGlAalmP7CADUAqbVdvtDnJbVSvZYWyVUIDC
         RzPj7K1Iw+TKhXty6EWA3HNUcleY9xtLGibPNAk719/4kjF528EK/BZX3gxViBfXTq4N
         0EAg==
X-Forwarded-Encrypted: i=1; AJvYcCXuOw4JsXVMRBCrlO57H/86Vff5yuHcMngoOi91OveH9WCpfnEDymrxmkQMlfbqDmzfzSKEeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6kalGGGnYCrhjFmkTxS9QlaTmrVDRV7U1GpYLc6dSpGnM1MUs
	1H22Vcfi5N54GWlCfKir5AGD2YNsJbvcESf+bNrqpJjQDQjKOOHKNSXg5OQscuo=
X-Gm-Gg: ASbGncssZnJUydRNIbGUzWvSPGNAmARRVQGi2ZLeCvgn+VK1QR9AbihisJrmSK1bU0M
	HR36F5b2ZW+nE3KwcKDFZArkk8EE6XBGts+xEjvTi5Skqj7qMLvt6BhnlDcr5nTBtnWEp4/zZLO
	TuY+oVDOH/rRw9MyVNl4u5Jk6VvWyS4LKwm3s6U+ajZEdODJjS0k4UlBZ0oOPms+0L5DfaJ7tQ7
	8eA2yP2oZODXzjVyM8Th6OEq0X7ZRfp00DTB/fYfz82md3Mh50LRSHseqSjHE+sTBHuOqA66wq6
	18IEFwMfFBOI/lAogub54iKCmVKSoZnunhj0
X-Google-Smtp-Source: AGHT+IGz5ay7LtZ6+rSD2XP9rxWv/jABbs6ebwXD/MzQJbyjd0oZnFaAjrC0FEJz70e5w3SHfSay0A==
X-Received: by 2002:a19:5518:0:b0:53f:231e:6fa2 with SMTP id 2adb3069b0e04-5439c253a05mr197064e87.26.1737085441361;
        Thu, 16 Jan 2025 19:44:01 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78d57sm190046e87.232.2025.01.16.19.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 19:43:59 -0800 (PST)
Date: Fri, 17 Jan 2025 05:43:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-vivacious-congenial-nightingale-cb2f6d@houat>

On Thu, Jan 16, 2025 at 05:01:03PM +0100, Maxime Ripard wrote:
> Hi Dmitry,
> 
> On Wed, Jan 15, 2025 at 12:21:39PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Jan 14, 2025 at 10:38:53PM +0100, Sasha Finkelstein via B4 Relay wrote:
> > > +static int adp_dsi_host_attach(struct mipi_dsi_host *host,
> > > +			       struct mipi_dsi_device *dev)
> > > +{
> > > +	struct adp_mipi_drv_private *adp = mipi_to_adp(host);
> > > +	struct drm_bridge *next;
> > > +
> > > +	next = devm_drm_of_get_bridge(adp->dsi.dev, adp->dsi.dev->of_node, 1, 0);
> > 
> > select DRM_PANEL_BRIDGE for this API to be available.
> > Also there is an issue of lifetimes. The bridge will be destroyed only
> > when MIPI driver is unbound, however the panel can be attached and
> > detached several times.
> 
> Can you expand on that one a bit more? AFAIK, it's always been unsafe
> and we don't have a good mitigation at the moment, so it's unclear to me
> what change you want here.

I was thinking about using drmm_ here, as the DRM device is also created
and destroyed each time. But I might be mistaken here.

-- 
With best wishes
Dmitry
