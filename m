Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CEB3FADE5
	for <asahi@lists.linux.dev>; Mon, 11 May 2026 14:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508267; cv=none; b=RUD4xPGrHLYJ3VHANeM3gus3ABopSBQOfjLsZyhZRmpbkwtbrmRbIuMR4emGnm6lG/mS+x+FBOf3rZEWxiyH+bL7RVlPXRYuML0Z0XUipIo/GvNo6uVnl/G3P+b8NFDGTkhU9M1Nd7ZLxJAUZrPSnQyXHJFKOl21KertKpaag28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508267; c=relaxed/simple;
	bh=AX1Zk6/eGznmnS4ph6+vfj8Fy71FvHX/m4IeROCTXqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h23ciwWqQ0SZqPT8Gff9BHRJDLJSNgMKv5bRMFlUTW4ThC2g+t47ube0LlTBBijlCfIdUngZ1teuIBwNzhV5bZMwuajnl8jNebH7HEB9F/g7JxjMJrzpkVs/89FOR7uss9ImaJZsWZbf8/p+WCXIFYmQbM4xGg0iRuiU6vddzR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcbVt/9c; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcbVt/9c"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1329507c387so7380316c88.1
        for <asahi@lists.linux.dev>; Mon, 11 May 2026 07:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778508264; x=1779113064; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iH3rO19odGUqCMhpZ/xU1p2BIeedWHGic3C9w+3oAVE=;
        b=IcbVt/9cHGFTCg305j17WjVbPvtE1ApubUWKmXwKHg2UVDSXQs50h0w3nop5quyHDI
         DrI6SKpPnKDIk42wT5hqqFDPvjNEun1b9s6mN+Ro515458ix7BNHzmKfwsQHL6EiU6fC
         Zfke47WPd8ZhZB8gn/qU1GANL7WvAk+QKCxLbqtWIN/ANtRm6cqTf6cjYBCkX8PWCzAV
         hs9r/xWsujSgOs6slVyeM/U5tE//ztk0s/C+tX7RhIPyLuEuSa1aM3vjGTaN0UcdZ7G6
         mHsdOS7skeothnN0bPHS36CwBos3DnLpZmE/Kimh0q/CjBOsLZSSqIL9hhLXuWAUTrk2
         9IYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778508264; x=1779113064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iH3rO19odGUqCMhpZ/xU1p2BIeedWHGic3C9w+3oAVE=;
        b=XORJ76x8m3ifAHJesDPHVSYz8YtrKISJGTw0fEbQF6ZSoHxJcA8QOKDAyjAVomptL3
         3vJS3GP4j7Hr62cAIF4g/sQrcwqe4Ym/K9nKLy4inDrFndCisgoasObmwJSQ8R4un2iX
         MTERRqLxCVwz+E5TrW5KOXSvp7z3WczXVk9K/2QFwuF9mdc+A1G1YoQgmxHvJCFgNZ75
         MkwhfeTBWyVqA23gVsTTiihF5ls49q8yeliwSjojyuV+vofkjFY/ajbqQFS5+epztxpz
         kJ3WfCsYRlYu5yDfIwFOx2q4uGSG7aN/MdwG7vuAY/EW6L+KXGcpdssuKfISYe6vETwd
         UhyA==
X-Forwarded-Encrypted: i=1; AFNElJ/czfKxriho8X8FX+sB9U9xt8uZSr1g6ZvSS2w7bzF1w/9OaPRzKsX6TJogA+XETp+axm6POg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxS0KHkTwUNUfDqZkVxNAETjZYJ9bHhy1/Sigmq9Mr08xggKek1
	Atmm3xwkSUeJW0U0etBzhDotHoxp05ilcs+WEakdLOh6mPgaXic4nEbe
X-Gm-Gg: Acq92OFvd2Z9JgLec82odS9rCfb04bE1UINGXy/7Nwc80cMXT+68ZR8I9ViQJWUbkKK
	CJDRU0r4jikscsWwWHLjHMyOU8iRaY33SzKrqSYlWsqzvoWI4MX8OMliage6PsQjIaARCnWeyKy
	kNnCF1Je9IO+fpoXf8z6oyaqXoVtNbx50Z3JORKIFA/2haJtH20BPJle6BU+Rdt5keywN8DOm3Q
	mUW8Xzw3fcLrHn29XZC4tmZIg5ZDm1ZSHwWxgnK7FC4OAEmLiN7F+RIZMim+KkP2AeLFW/fvV9n
	BtmDka6ra/ShNaLBQcwxZKupO5X+8JchiUEDFlF/t1VgxAGaRjVYGKDId+RqOcR/0Ev4+TRxSii
	QqPixFKCD5Yi408br2VdOXjRTIxk2GqIBhL6drL+6m6OrmfBsF2++1GTSdrWmvy4eMfy/J46oDj
	2XusmdSLBlqBcGPezW924efLEKCRLONLQQ5jFi
X-Received: by 2002:a05:7022:ea22:b0:12d:de3f:d844 with SMTP id a92af1059eb24-1319ce5634cmr12752150c88.39.1778508262863;
        Mon, 11 May 2026 07:04:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865955fsm18373850c88.11.2026.05.11.07.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:04:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 May 2026 07:04:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] watchdog: apple: Add "apple,t8103-wdt" compatible
Message-ID: <87766879-ca5e-44cc-a341-87b2afa70910@roeck-us.net>
References: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-watchdog-apple-t8103-base-compat-v1-1-1702a02e0c45@jannau.net>

On Wed, Dec 31, 2025 at 01:07:21PM +0100, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,wdt" anymore [1]. Use
> "apple,t8103-wdt" as base compatible as it is the SoC the driver and
> bindings were written for.
> 
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
> 
> Fixes: 4ed224aeaf66 ("watchdog: Add Apple SoC watchdog driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>

Applied to my hwmon-next branch.

Thanks,
Guenter

> ---
> This is split off from the v1 series adding Apple M2 Pro/Max/Ultra
> device trees in [2].
> 
> 2: https://lore.kernel.org/r/20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net
> ---
>  drivers/watchdog/apple_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251231-watchdog-apple-t8103-base-compat-8a623e9831b6
> 
> Best regards,
> 
> diff --git a/drivers/watchdog/apple_wdt.c b/drivers/watchdog/apple_wdt.c
> index 66a158f67a712bbed394d660071e02140e66c2e5..6b9b0f9b05cedfd7fc5d0d79ba19ab356dc2a080 100644
> --- a/drivers/watchdog/apple_wdt.c
> +++ b/drivers/watchdog/apple_wdt.c
> @@ -218,6 +218,7 @@ static int apple_wdt_suspend(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(apple_wdt_pm_ops, apple_wdt_suspend, apple_wdt_resume);
>  
>  static const struct of_device_id apple_wdt_of_match[] = {
> +	{ .compatible = "apple,t8103-wdt" },
>  	{ .compatible = "apple,wdt" },
>  	{},
>  };
