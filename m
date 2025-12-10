Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611F721FF25;
	Wed, 10 Dec 2025 23:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765408423; cv=none; b=NfaSDTavYYMk77NZ7nqHktQRRqMXmFJKeh+yQX3BseP1L3zpU0waZyfhQOf8R5bH9XyFE/kyHagWHshORWlQFfpVF4kYhvN6xsulSB5TDAzQ4olBBTf0QdgAwyJsT4V7eGsXbF1TGXdyvE/yxqUtlCU0nyca5E5KWm6FDosSITY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765408423; c=relaxed/simple;
	bh=QnPYZrkV3yZ528W1Z9O88kzu7CRtIhOHvaCXFSZ1oR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7IygG2+xvwcbyLRfSlsJMMX8CSBvuNeHuiMmY6ryvdDGAKOodtIn0q2cbJE++LSX8J1AQBXnj4i7etZo/mPzizFSe7awutpHMYKSETiEbucDdyWRaey7Mog89cj+PWEBrFT3t0IE6R9ef9J/i6OvGtJV2RUEbHU+kxjEGp8cVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ys4BBwb+; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ys4BBwb+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ryCmw5OFAfwdlBXpN97EtAa/i/KlkWssROLzNY/1M9M=; b=ys4BBwb+K4lyykebFw6g4WTmA3
	RjoadgHP4vjYquihJfI9FdWaqiu6mEt2dvza55P2A2O4UH21Z4EC3NagEn8P/j6fUpDdY8XMlWREt
	mNfAwb10Rq+gnhYTo0aVdUjtQsSneAYgh3WJMLT3cSo7RtLAzJ3X8CAJMTl40O7gd4tXVnM3iD33p
	9mzWuD80/0F4yvmPdQByXBiWqembe49iEa38CSzhZE/QaZ/erDFhFS8OidgJK7nF1Tfu23zD7Rffu
	efoLcvAU+GPJK01O3oB5ykH/twGcgyTlbNvZ57HLeK2L3IewRZDZ0Yu4IwSrJ3zrzI8aqS4lG4YdD
	1Hawr3CQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTTNG-0000000Fy67-1FO8;
	Wed, 10 Dec 2025 23:13:34 +0000
Message-ID: <99020ea7-0033-42e4-a8dc-5d6674365eb2@infradead.org>
Date: Wed, 10 Dec 2025 15:13:30 -0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Remove remaining DRM_KMS_DMA_HELPER users
To: Paul Kocialkowski <paulk@sys-base.io>, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251210222337.3751485-1-paulk@sys-base.io>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251210222337.3751485-1-paulk@sys-base.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/10/25 2:23 PM, Paul Kocialkowski wrote:
> The DRM_KMS_CMA_HELPER config option was removed in commit 09717af7d13d
> ("drm: Remove CONFIG_DRM_KMS_CMA_HELPER option") but two drivers were
> later merged with the option still selected.
> 
> The dangling option was later renamed to DRM_KMS_DMA_HELPER with commit
> 6bcfe8eaeef0 ("drm/fb: rename FB CMA helpers to FB DMA helpers").
> 
> Remove the entries in the two drivers, which already select
> DRM_GEM_DMA_HELPER (that was previously selected via DRM_KMS_CMA_HELPER).
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/gpu/drm/adp/Kconfig     | 1 -
>  drivers/gpu/drm/logicvc/Kconfig | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/adp/Kconfig b/drivers/gpu/drm/adp/Kconfig
> index 9fcc27eb200d..acfa21ee06d2 100644
> --- a/drivers/gpu/drm/adp/Kconfig
> +++ b/drivers/gpu/drm/adp/Kconfig
> @@ -6,7 +6,6 @@ config DRM_ADP
>  	select DRM_KMS_HELPER
>  	select DRM_BRIDGE_CONNECTOR
>  	select DRM_DISPLAY_HELPER
> -	select DRM_KMS_DMA_HELPER
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_PANEL_BRIDGE
>  	select VIDEOMODE_HELPERS
> diff --git a/drivers/gpu/drm/logicvc/Kconfig b/drivers/gpu/drm/logicvc/Kconfig
> index 579a358ed5cf..11aae1626199 100644
> --- a/drivers/gpu/drm/logicvc/Kconfig
> +++ b/drivers/gpu/drm/logicvc/Kconfig
> @@ -4,7 +4,6 @@ config DRM_LOGICVC
>  	depends on OF || COMPILE_TEST
>  	select DRM_CLIENT_SELECTION
>  	select DRM_KMS_HELPER
> -	select DRM_KMS_DMA_HELPER
>  	select DRM_GEM_DMA_HELPER
>  	select REGMAP
>  	select REGMAP_MMIO

-- 
~Randy
