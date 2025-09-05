Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29179341AAD
	for <asahi@lists.linux.dev>; Fri,  5 Sep 2025 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757070203; cv=none; b=YZlBb54B7JstthCOwdJ2BGgFmUbMk5163wWEBp6sccYwUsGut5KU0Crv+YCzfjFc6TPQNFCzTF01UomPqHycJk8OCJ9As7e03f5arFMwWeiDgm5zDOptK/4iKBhZUV/c5/TZVkYBkJhyU+SfmjzqvwjQGVHWDaF4bUtykcq1KiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757070203; c=relaxed/simple;
	bh=KN4dsiaZ268F8wno1pY0dZJf8plsMc1elk4smFEFKIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgieJjc0p0uMQbxmL9eGxbteNXfAaJjDnd4eYgfmoI6/uDj6X2JXYxsZKaeH8ABjANxU0Pd8QpSU6sES3MXgHBDirFdtIOhEnXbsrND1K8ZLc+Gd4/BQsNiMQJCBmDNk+EnyLyoJOSERSe/HYw25/qEmnt5OCBOZ9tEYMz4hKsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVvq4Cf/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVvq4Cf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757070202; x=1788606202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KN4dsiaZ268F8wno1pY0dZJf8plsMc1elk4smFEFKIw=;
  b=NVvq4Cf/wLcHx5L3RGfDGUcNiiVibONg5QGpVx5rIIZqKpHdQauMVoyF
   p3KfJA7EksHe/6Q4QGw0WuDKo5QH6fi+kybYR/YAhd/JP8Ka/SwSBkDwA
   gmGJr0mSXytj5ERRLQVKQ+rtiULeQQIvXVZ+T5dhU4ssYo885dVbSJadK
   MkyfMGuL5U0+QNULvIYACwwq9znhpmXZouI/r4mzfixJDjbJhZ/4vxhjf
   gHt3WtZZg2ZKilGkmFGOZGbdIQZwRwo5BhabQFpx6Bn0MWa3XtXj+FqaG
   ibk0agI2+5peWKWz7bnk1772WYk5cOoUzH1Gyr9d2A1Nj/4ipv+JQAOpJ
   w==;
X-CSE-ConnectionGUID: kheWr0CkRhyj9YGH8NMnzQ==
X-CSE-MsgGUID: PpZH2V+XTN+j3GlJZo2bAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="62050716"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="62050716"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 04:03:21 -0700
X-CSE-ConnectionGUID: 53kU7cAnTr6NKDSKeZLK+w==
X-CSE-MsgGUID: P5pb7rInQZK8UjIlkKEOQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; 
   d="scan'208";a="176470702"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa005.fm.intel.com with SMTP; 05 Sep 2025 04:03:16 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 05 Sep 2025 14:03:15 +0300
Date: Fri, 5 Sep 2025 14:03:15 +0300
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
	linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 09/22] usb: typec: tipd: Move initial irq mask to
 tipd_data
Message-ID: <aLrDc-IMZkqzvnv2@kuha.fi.intel.com>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
 <20250821-atcphy-6-17-v1-9-172beda182b8@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-atcphy-6-17-v1-9-172beda182b8@kernel.org>

On Thu, Aug 21, 2025 at 03:39:01PM +0000, Sven Peter wrote:
> Since the irq mask was originally added more tipd variants have been
> introduced and there's now struct tipd_data. Move the initial mask in
> there.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 23 +++++++++++------------
>  1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 1c80296c3b273e24ceacb3feff432c4f6e6835cc..6d8bcbc9cad8a1394e066504d4c5ca570edd4e4f 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -112,6 +112,7 @@ struct tps6598x;
>  
>  struct tipd_data {
>  	irq_handler_t irq_handler;
> +	u64 irq_mask1;
>  	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
>  	void (*trace_power_status)(u16 status);
>  	void (*trace_status)(u32 status);
> @@ -1298,7 +1299,6 @@ static int tps6598x_probe(struct i2c_client *client)
>  	u32 status;
>  	u32 vid;
>  	int ret;
> -	u64 mask1;
>  
>  	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
>  	if (!tps)
> @@ -1337,16 +1337,6 @@ static int tps6598x_probe(struct i2c_client *client)
>  		if (ret)
>  			return ret;
>  
> -		/* CD321X chips have all interrupts masked initially */
> -		mask1 = APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
> -			APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
> -			APPLE_CD_REG_INT_PLUG_EVENT;
> -
> -	} else {
> -		/* Enable power status, data status and plug event interrupts */
> -		mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
> -			TPS_REG_INT_DATA_STATUS_UPDATE |
> -			TPS_REG_INT_PLUG_EVENT;
>  	}
>  
>  	tps->data = i2c_get_match_data(client);
> @@ -1364,7 +1354,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  			return ret;
>  	}
>  
> -	ret = tps6598x_write64(tps, TPS_REG_INT_MASK1, mask1);
> +	ret = tps6598x_write64(tps, TPS_REG_INT_MASK1, tps->data->irq_mask1);
>  	if (ret)
>  		goto err_reset_controller;
>  
> @@ -1527,6 +1517,9 @@ static const struct dev_pm_ops tps6598x_pm_ops = {
>  
>  static const struct tipd_data cd321x_data = {
>  	.irq_handler = cd321x_interrupt,
> +	.irq_mask1 = APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
> +		     APPLE_CD_REG_INT_PLUG_EVENT,
>  	.register_port = tps6598x_register_port,
>  	.trace_power_status = trace_tps6598x_power_status,
>  	.trace_status = trace_tps6598x_status,
> @@ -1536,6 +1529,9 @@ static const struct tipd_data cd321x_data = {
>  
>  static const struct tipd_data tps6598x_data = {
>  	.irq_handler = tps6598x_interrupt,
> +	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
> +		     TPS_REG_INT_DATA_STATUS_UPDATE |
> +		     TPS_REG_INT_PLUG_EVENT,
>  	.register_port = tps6598x_register_port,
>  	.trace_power_status = trace_tps6598x_power_status,
>  	.trace_status = trace_tps6598x_status,
> @@ -1546,6 +1542,9 @@ static const struct tipd_data tps6598x_data = {
>  
>  static const struct tipd_data tps25750_data = {
>  	.irq_handler = tps25750_interrupt,
> +	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
> +		     TPS_REG_INT_DATA_STATUS_UPDATE |
> +		     TPS_REG_INT_PLUG_EVENT,
>  	.register_port = tps25750_register_port,
>  	.trace_power_status = trace_tps25750_power_status,
>  	.trace_status = trace_tps25750_status,
> 
> -- 
> 2.34.1
> 

-- 
heikki
