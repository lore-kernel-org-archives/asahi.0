Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389CF2FB970
	for <asahi@lists.linux.dev>; Mon, 15 Sep 2025 13:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942057; cv=none; b=mB9O2lpHNrW4BDxvlpTKOpRRDHV9A7YnQzbEMsn48O1win1vXkYbzzdJ2hD73ADcpMGcfylLeDej3iWj9976GBUE4r7j3ZaIrarPzY9FRZpTcCVQUvgSZidflpHVOXg1D3JHGSwd3LH3/0ep3Zxk513+ghf6tQ2mKFHXbM3OW+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942057; c=relaxed/simple;
	bh=Dle/WCXE1FdM2SDAFI+ZfumRAap/NFKRsz2OC6kLbMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtZ+fsjt0SHDqi+TgcS8Lls/vz2mHsvUBlXfEEMEvZxrS8mqDvn3CK5yHG3qWP3LFETF68yBr/nD7/Mp9nW2GqW5xKxoGaaa9AXVAfUP3aFDROJQvwl72kbXFWefcEU14jBheW783P3DYWk8lhYxd8y1NTJP5Jj99XK+8YEHWTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEQk+VY2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEQk+VY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757942055; x=1789478055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dle/WCXE1FdM2SDAFI+ZfumRAap/NFKRsz2OC6kLbMo=;
  b=EEQk+VY2zgy3DD2NAPrFkOLEq5b8VpHcN2hMfI39JNt3gE1vZ5LhF6ID
   FBTvTQ9wgDL6bdj+s9caEm1hN0453LnWW0084wQCJpQTaiIgEtim4obsS
   b15ZudlCW/k3vyZvOsErzBh03V3zXHVx7yy4UsD5KXx9HJGVIdbVdJX7v
   XnMtvZuuwvjWOGTz9rI5UHY+TFMDkk9/YEJ2L+LUZy6UzzzAptw3hiCdW
   qpInlk3M28aaR/+UE2jf/Av7jnwoixYUU4/7R9tfvEKFXsaJ47muKK6i2
   lxhwtf7iIPLF6BZdMJUHEdF3HsSUAwXC/BHuhnpjE765rpPPG+AtnoRgX
   w==;
X-CSE-ConnectionGUID: PbcOJ5niRd+/EvQSDUwbNg==
X-CSE-MsgGUID: rxwcnMAHT7qhcR8JAYfV3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59890763"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="59890763"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 06:14:15 -0700
X-CSE-ConnectionGUID: zpz3F27SSnSNkSqFUpMt/A==
X-CSE-MsgGUID: ac8/E/joTTG4Igx2G0j/KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; 
   d="scan'208";a="173942411"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa010.jf.intel.com with SMTP; 15 Sep 2025 06:14:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 15 Sep 2025 16:14:10 +0300
Date: Mon, 15 Sep 2025 16:14:10 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 08/11] usb: typec: tipd: Update partner identity when
 power status was updated
Message-ID: <aMgRIoaIbMDH3aAl@kuha.fi.intel.com>
References: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
 <20250914-apple-usb3-tipd-v1-8-4e99c8649024@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914-apple-usb3-tipd-v1-8-4e99c8649024@kernel.org>

On Sun, Sep 14, 2025 at 12:56:13PM +0000, Sven Peter wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> Whenever the power status is changed make sure to also update the
> partner identity to be able to detect changes once de-bouncing and mode
> changes are added for CD321x.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index c7cf936e5a61a331271c05b68ff1b77b89c0f643..e16c6c07c72a3e285f1fc94db72bed8dc3217a1d 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -635,9 +635,16 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
>  	if (!tps6598x_read_status(tps, &status))
>  		goto err_unlock;
>  
> -	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE)
> +	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE) {
>  		if (!tps6598x_read_power_status(tps))
>  			goto err_unlock;
> +		if (TPS_POWER_STATUS_PWROPMODE(tps->pwr_status) == TYPEC_PWR_MODE_PD) {
> +			if (tps6598x_read_partner_identity(tps)) {
> +				dev_err(tps->dev, "failed to read partner identity\n");
> +				tps->partner_identity = (struct usb_pd_identity) {0};
> +			}
> +		}
> +	}
>  
>  	if (event & APPLE_CD_REG_INT_DATA_STATUS_UPDATE)
>  		if (!tps->data->read_data_status(tps))
> 
> -- 
> 2.34.1
> 

-- 
heikki
