Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD122479885
	for <asahi@lists.linux.dev>; Wed, 22 Jul 2026 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784714589; cv=none; b=b6Wizs81z2IqNDOOHCNv3r4tH80PtY0D3VIVeJ4g2wCl2hJ/f4+pZBVAgZo2e5Bxv2jsEBcV7Dk6QDp/lnnJAkngmwGa70sQbaaS0hTg+3fXIkhG8xfYawHFEB92GsOrvlXizWhjslNFJG03i/wgdkJmjBbn2CQVG0wjt4JFd8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784714589; c=relaxed/simple;
	bh=GjXVLoNVZdknAFpuG6ApjBnvBgqHHVMfqE7Gr1NseEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4LGExN2FTQnSTxxoSF3Xn9x9yrxWS51OQQpIjfS1uHMeY+ipkkKgCNITL5rXug//PitpiYZNJPVB+Pvi2Y0/9SM6X3O2IVAB3JYj5tN8sb9BV1ygXss8x5lnN3Agv5TIBsaaLHJo+D740WNqXuSVdsfLu6jA/fSdqkjCJgAh/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=JRhtTuVE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DD/hIJHC; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="JRhtTuVE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DD/hIJHC"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B33BD7A00FD;
	Wed, 22 Jul 2026 06:03:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 22 Jul 2026 06:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784714584; x=1784800984; bh=keKA3TlG+D
	aLEUEaEDJmog5OO6jAFV1sLmP/aGQcwRA=; b=JRhtTuVEliUcZMjRNFdamt8xk0
	cR++RlzQH6z8VjhM6yg1tso36vYeUGFDsDC3JfPjSfoV8iHV9n2cw6aguii0BVfv
	CwNsZMYITuAiG9aKOvoYn1YANhorVhjrRFAizhKZEvtrcpmjfBjpbDReVIidSehr
	ckdSX5PQlqlNoRW73xGJvpVzPZeo4diwRtp9gTKELNEcAStQ586Hi7H6EJYNpphG
	AT1y4Qw+qXx+TBXAJFABeA6kieyHVefsoqvZGUgujeDlCGQi6duUUaMd3sT8k5me
	iRLay5O8ofeR7NmNMk3xE8VFLtJIzqMLQF9P6+hOKcRrJXwVKeVs9zBbVZYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784714584; x=1784800984; bh=keKA3TlG+DaLEUEaEDJmog5OO6jAFV1sLmP
	/aGQcwRA=; b=DD/hIJHCfnM5x57RyHoh5f9AQMTIcB7DPor0TEDiu6j7dm3Ma0l
	KkQO6hYHCe/jT2GjwdL+tSUmmQijdLjwG1hPxyO1sJx52PyvXESqYR1260IOHC7d
	x3U5D07/1cyqSvjLlHaa38F3L6Avex/xLPzsj7+twRMnHHyBcdliMNAMRfQWxsgG
	9Ji61ZzcJAxI/U3fMFWJERWcMfZItASAI2MIjkre4ly4Pia/aesbh34THbjIeM0B
	zaMeX8sLTVXrRNgk0Urk+lxka8FM3JE1xPC0HYF8m0uBcEKXJ4GKPXbhUHjgIwNb
	oXLBoZrMpr8vbdgXUaOlcl7NqaLpxTUkCyQ==
X-ME-Sender: <xms:WJVgarfKM_7a4ihsIll2hRUPbcDHnPJ1_r5M9LsKWswwoVaM5djv8Q>
    <xme:WJVgarQZL6n9kW86Qf3F2Y4Dq8K9oltwH4BnzQQ3kcxpxe7o6TcB127VPMIJATSdX
    KVwEYY6a8BFZiwrzdXQEkkqRleCaP5ilv2N0QvppQr05kqr7dzEp_4U>
X-ME-Received: <xmr:WJVgakYF8JeuYb1tmk4RYfcHBP85iyxF5VZTaaPIzhkP2ubvtvfl9Yi8vQ0U-01oqYrK4uOI-bGMKXoDmXp8yNBlJErrKP7E5Us>
X-ME-Proxy-Cause: dmFkZTFMHwcTuNUz+Dcyz4D6Eq3Ysli2skDtxz3i8YUC46qtzqdEaZEA3XhE58UAQKCIxg
    8WwMgfQJVjUb9e6CGiVSPzkF/1zRCVGoCwyv6/SYTO5SGpHIM2laUyY9O5u+1/YhFgSsEe
    ImAxI33mVE1jDPhNk6jQV1GB1SsqUtD77jLpI+2pX/PT4TiE0UeBzTXZgi5bQ5/BZQHjMo
    WZs3sxHWiO/P3X0RA6BKW1YLqXwYJr6xq2Q/oftQ7WhWQcYiD1sBjWOOXvRSuJEbBpa42w
    OyIK0OJADwqzymSV3W5ANqZecViPgytan5OrBwnlHtbA1dB4wX5rqw/IMRnVB4f9GGbyTD
    B/UGbJJmkilsTCD6V4AeeGXe3zZfZ4oWQpTSfgld0wWNbp6V+8oSgZhldSRf9uzjPa8lXt
    0dpwvazIlr75A3gICNKnqycyWmfIuT4wZMh46PVqNCSdX2TN2dr+kxcigbj5Rf0vSfqZa9
    Q0s8s/L8d8USfmHVvRe7ub35Q46SLmLI8YUH7cuZj7zuJZDccO8LhQZ5kjbXEzjrdOuS4v
    ykPBtQAAFxiawcm2VkhsX9tn0aCfvYyGPwxVlrthqiUlURscdxsh2oI6ONBGTjGKIww0I7
    liEjVoIWNpBCeGO2leyqZVPXoLtcNwb5DwOfb0kbcyVQnmnegVkts/LOaecA
X-ME-Proxy: <xmx:WJVgaucd4HRIqrelKWrPiXhGS08dKjpWgOWfgHfD6fxUVf-dS_kVuQ>
    <xmx:WJVgalIDy5RErK_SUH0yMiUnQEvAKy_tG9PkUo0SrW-byHHkma61tg>
    <xmx:WJVgarIz7V-Gc9Txf8u1HJCq-Mr7dlCTqfVK9yiiRCipCwMA6IGnnw>
    <xmx:WJVgakV9xyDMfkdYLF8oOb36mNwdnsUqgl4XrchHoZpBKNygkownAQ>
    <xmx:WJVgagW-NqsXY_3voi300yzs0QImcoDauZMleI0Tegsy-xa6WfSE_lho>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 06:03:03 -0400 (EDT)
Date: Wed, 22 Jul 2026 12:03:02 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mfd: macsmc: Fix key count endianness annotation
Message-ID: <20260722100302.GA4159739@robin.jannau.net>
References: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>

On Sun, Jul 19, 2026 at 03:00:32PM +0200, Sven Peter wrote:
> SMC firmware returns the value of the #KEY key in big-endian unlike most
> other keys. Reading it through apple_smc_read_u32() into a plain u32
> and then converting with be32_to_cpu() makes sparse complain:
> 
>   drivers/mfd/macsmc.c:462:26: sparse: cast to restricted __be32
> 
> Read the raw value into a __be32 using apple_smc_read() instead.
> 
> Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management Controller")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607181046.OANjIoqR-lkp@intel.com/
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/mfd/macsmc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
> index 358feec2d088..514cba7dc897 100644
> --- a/drivers/mfd/macsmc.c
> +++ b/drivers/mfd/macsmc.c
> @@ -410,7 +410,7 @@ static int apple_smc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct apple_smc *smc;
> -	u32 count;
> +	__be32 count;
>  	int ret;
>  
>  	smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
> @@ -461,8 +461,10 @@ static int apple_smc_probe(struct platform_device *pdev)
>  	dev_set_drvdata(&pdev->dev, smc);
>  	BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
>  
> -	ret = apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
> -	if (ret)
> +	ret = apple_smc_read(smc, SMC_KEY(#KEY), &count, sizeof(count));
> +	if (ret >= 0 && ret != sizeof(count))
> +		ret = -EINVAL;
> +	if (ret < 0)
>  		return dev_err_probe(smc->dev, ret, "Failed to get key count");
>  	smc->key_count = be32_to_cpu(count);
>  
> 

Reviewed-by: Janne Grunau <j@jannau.net>
