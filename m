Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C022E27587E
	for <asahi@lists.linux.dev>; Fri, 29 Aug 2025 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756460252; cv=none; b=sLdQ6E8sxsaCpHvVSzMJ7iDy1LANUegmU37h11CO82j6BU3Q1aAUvpesIb351++xflDwYYpOuamHi/Cjy2eQxlPG08mxMhrhYEs99NrlyxHAqyOBb1qKUROUTGCM27/Gd2XDMtvBR47EvTXeOfN6BHe5vKA2uYk46HQxF4xQq4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756460252; c=relaxed/simple;
	bh=Ap6TpSpSWfu+GxU/IBIYtbECJ/gJQjgTTVqFq2X5zn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QDh/zpXIiBmuFy/+iO30zI5Qg1aLKbsE4Fj/ZH+puZUNMMguIcGo6TuwbMIFQGChulklHlioeNp+1Yd8Qm+PpBb2Igb3tO1bdfk1Uq6pCFWNOAhTFtOXDzSSZzwe7I1fkaA+yfLgeRK//EFI828Rt9JcWC0HQXLmonLaYjBiun4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwUEE9KO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwUEE9KO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756460250; x=1787996250;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ap6TpSpSWfu+GxU/IBIYtbECJ/gJQjgTTVqFq2X5zn4=;
  b=lwUEE9KO9i2eTD9WdwPBSucbkT+6rHxmNwM71Jo9LaU4XAZF3Slon6c6
   0Q6NgqBHxnLP3Q1jVLLGfYDaW9nmXJBTOUa5GVUfCQeLc4B2Oilk2uebQ
   Btwc+otAJvk7140Y6M/XfGJUEwDjmkPkhUU0dLMtmb8uhzRg0+RlylAcz
   odzDXYOp6rdd8PRRt+1DPAfo56vf5JThJtv6I6MUzge2rjsdFYBsSUVvq
   SbE6y1IJbWtooEHm6slTUHQFcWj2UX0vBI40ySUjrYB8kfHvECn2iD62+
   SCmAuCSGPw/U8PipLBOC1QwzHQMVd7o6MTXPtR3weJmtDBVhJ3xwXsqVX
   w==;
X-CSE-ConnectionGUID: S6PnDaRcQw+YXHZG3H7bTA==
X-CSE-MsgGUID: N7DMyUF0TUSigpzZ5zRw5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62389360"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="62389360"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:37:30 -0700
X-CSE-ConnectionGUID: J7/Vuy9PRtaesA1hnRSVOQ==
X-CSE-MsgGUID: BWMYcSp6RXqR0c2ViZZwaQ==
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa003.fm.intel.com with SMTP; 29 Aug 2025 02:37:24 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 29 Aug 2025 12:37:23 +0300
Date: Fri, 29 Aug 2025 12:37:23 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, stable@kernel.org
Subject: Re: [PATCH RFC 08/22] usb: typec: tipd: Clear interrupts first
Message-ID: <aLF00zGWg2MPUlyJ@kuha.fi.intel.com>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-8-172beda182b8@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-atcphy-6-17-v1-8-172beda182b8@kernel.org>

On Thu, Aug 21, 2025 at 03:39:00PM +0000, Sven Peter wrote:
> Right now the interrupt handler first reads all updated status registers
> and only then clears the interrupts. It's possible that a duplicate
> interrupt for a changed register or plug state comes in after the
> interrupts have been processed but before they have been cleared:
> 
> * plug is inserted, TPS_REG_INT_PLUG_EVENT is set
> * TPS_REG_INT_EVENT1 is read
> * tps6598x_handle_plug_event() has run and registered the plug
> * plug is removed again, TPS_REG_INT_PLUG_EVENT is set (again)
> * TPS_REG_INT_CLEAR1 is written, TPS_REG_INT_PLUG_EVENT is cleared
> 
> We then have no plug connected and no pending interrupt but the tipd
> core still thinks there is a plug. It's possible to trigger this with
> e.g. a slightly broken Type-C to USB A converter.
> 
> Fix this by first clearing the interrupts and only then reading the
> updated registers.
> 
> Fixes: 45188f27b3d0 ("usb: typec: tipd: Add support for Apple CD321X")
> Fixes: 0a4c005bd171 ("usb: typec: driver for TI TPS6598x USB Power Delivery controllers")
> Cc: stable@kernel.org
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index dcf141ada07812295a6f07e41d77f95f98116010..1c80296c3b273e24ceacb3feff432c4f6e6835cc 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -545,24 +545,23 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
>  	if (!event)
>  		goto err_unlock;
>  
> +	tps6598x_write64(tps, TPS_REG_INT_CLEAR1, event);
> +
>  	if (!tps6598x_read_status(tps, &status))
> -		goto err_clear_ints;
> +		goto err_unlock;
>  
>  	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE)
>  		if (!tps6598x_read_power_status(tps))
> -			goto err_clear_ints;
> +			goto err_unlock;
>  
>  	if (event & APPLE_CD_REG_INT_DATA_STATUS_UPDATE)
>  		if (!tps6598x_read_data_status(tps))
> -			goto err_clear_ints;
> +			goto err_unlock;
>  
>  	/* Handle plug insert or removal */
>  	if (event & APPLE_CD_REG_INT_PLUG_EVENT)
>  		tps6598x_handle_plug_event(tps, status);
>  
> -err_clear_ints:
> -	tps6598x_write64(tps, TPS_REG_INT_CLEAR1, event);
> -
>  err_unlock:
>  	mutex_unlock(&tps->lock);
>  
> @@ -668,25 +667,24 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
>  	if (!(event1[0] | event1[1] | event2[0] | event2[1]))
>  		goto err_unlock;
>  
> +	tps6598x_block_write(tps, TPS_REG_INT_CLEAR1, event1, intev_len);
> +	tps6598x_block_write(tps, TPS_REG_INT_CLEAR2, event2, intev_len);
> +
>  	if (!tps6598x_read_status(tps, &status))
> -		goto err_clear_ints;
> +		goto err_unlock;
>  
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
>  		if (!tps6598x_read_power_status(tps))
> -			goto err_clear_ints;
> +			goto err_unlock;
>  
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_DATA_STATUS_UPDATE)
>  		if (!tps6598x_read_data_status(tps))
> -			goto err_clear_ints;
> +			goto err_unlock;
>  
>  	/* Handle plug insert or removal */
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT)
>  		tps6598x_handle_plug_event(tps, status);
>  
> -err_clear_ints:
> -	tps6598x_block_write(tps, TPS_REG_INT_CLEAR1, event1, intev_len);
> -	tps6598x_block_write(tps, TPS_REG_INT_CLEAR2, event2, intev_len);
> -
>  err_unlock:
>  	mutex_unlock(&tps->lock);
>  
> 
> -- 
> 2.34.1
> 

-- 
heikki
