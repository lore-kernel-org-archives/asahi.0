Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25C428E0F
	for <asahi@lists.linux.dev>; Tue,  1 Apr 2025 21:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743541952; cv=none; b=Fs3otltZiYFOTZmarkc7RXjk0nfpaIxiTRecpULXkwRJ2TWqaFQsASQJE5j/vZrXNCWXsW8pSqtGJUW7rv9ig0Fo0sBIReYn3NDL/DzFPcqk7q3SkDUZaUsTy2MsYu36hvAyxion+CqdMabelo54aInL/T9b9KhfEa3jIpcx+9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743541952; c=relaxed/simple;
	bh=K6e3AccmE8erWl97dNEAbuU3Gn0/ty0wlEdj+V+RQMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkhYL4om4u/VxkMSdL7an4obKK5q9RQt3yy28mdmrffseERW+EdqbkvFkJNdo2k6e3rD7DmjMsbtXj5eqfA0n1ORYijsEwNWllsm3ZLN6RWW+7WA9FvDRga5K1pwj6Lzx3IVkNaJnXobx9fh7vIyjv6jlZLj45o83Abb3t72hpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EDA212FC
	for <asahi@lists.linux.dev>; Tue,  1 Apr 2025 14:12:33 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ACEC23F694
	for <asahi@lists.linux.dev>; Tue,  1 Apr 2025 14:12:29 -0700 (PDT)
Date: Tue, 1 Apr 2025 22:12:17 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: shao.mingyin@zte.com.cn
Cc: j@jannau.net, chunkuang.hu@kernel.org, fnkl.kernel@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn,
	tang.dongxing@zte.com.cn
Subject: Re: [PATCH 3/4] drm: malidp: =?utf-8?Q?Rep?=
 =?utf-8?Q?lace_custom_compare=5Fdev_with=C2=A0component=5Fcompare=5Fof?=
Message-ID: <Z-xWsbM2fh8TPmhO@e110455-lin.cambridge.arm.com>
References: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
 <20250331173124559aCNI8BfX0ay0U5wryryME@zte.com.cn>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250331173124559aCNI8BfX0ay0U5wryryME@zte.com.cn>

On Mon, Mar 31, 2025 at 05:31:24PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Tang Dongxing <tang.dongxing@zte.com.cn>
> 
> Remove the custom device comparison function compare_dev and replace it
> with the existing kernel helper component_compare_of
> 
> Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/malidp_drv.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index e083021e9e99..e2e6fd1f64b0 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -910,13 +910,6 @@ static const struct component_master_ops malidp_master_ops = {
>  	.unbind = malidp_unbind,
>  };
> 
> -static int malidp_compare_dev(struct device *dev, void *data)
> -{
> -	struct device_node *np = data;
> -
> -	return dev->of_node == np;
> -}
> -
>  static int malidp_platform_probe(struct platform_device *pdev)
>  {
>  	struct device_node *port;
> @@ -930,7 +923,7 @@ static int malidp_platform_probe(struct platform_device *pdev)
>  	if (!port)
>  		return -ENODEV;
> 
> -	drm_of_component_match_add(&pdev->dev, &match, malidp_compare_dev,
> +	drm_of_component_match_add(&pdev->dev, &match, component_compare_of,
>  				   port);
>  	of_node_put(port);
>  	return component_master_add_with_match(&pdev->dev, &malidp_master_ops,
> -- 
> 2.25.1

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
