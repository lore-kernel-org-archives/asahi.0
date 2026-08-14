Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5072D453A22
	for <asahi@lists.linux.dev>; Fri, 14 Aug 2026 10:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703600; cv=none; b=FQsyiWfFHtDJH3DxpEe79HKlH0nYV3DEViKV78BEfm/cd5+eBfnd8rXo2FxAQbzrIAVPsZilIzgk0Kwa5jCrmCEypRRS1Z2h+zh180vn+4GlyhCyYCxpWsf3C+stj05FmE0i+N1UuG2nHPSZ5nvSGICNqQ8XaMBlml6ZqivxDxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703600; c=relaxed/simple;
	bh=Ox7+xXMzjOqT41gzxIAltGSc26sAMIXoBRt6kUQhSgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQM2VmZ2SJVXVYE+Ir1asuayRnKT+pwaYOMcbyhtqEvhSvxVRXqjKP273qxuv79K6s0YuHQDtrYg5xfhbnwmZvyYZxQiKAYibOrZFLn3vhw9eXWUM3KrfsEi99SIZzrdsy+2BEx4WSZGbYX9HDQMIIREjsSUs/ztTWm682F0j9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdWdifz8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdWdifz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786703592; x=1818239592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ox7+xXMzjOqT41gzxIAltGSc26sAMIXoBRt6kUQhSgA=;
  b=WdWdifz8uuBD/bvEZyxpO/GTPNqICTNwWBP1ue9BUMV0y8o6BGMDv8ZO
   6ALCe5CEvVNcG353C8vzUSVoDa0WGEg3o+gm6UwKzfn4EOqnVLALu9eVo
   ZwMaUphn6db+QL6fwa+50rmZb8pOVgT5gNBz4BkvMqsB778OoHvmDSwVW
   OfGp4G4co5kKg7t4J44e+gnva+48yP0KWeJUbFPQI/R4t/lI/toStWs5Q
   6zToxvGB02fTPq/h77heMCODqdscRAO9SgTnJ7HQz6jshkw8VLuvMJiUa
   sRQU1r/bzFuic9SN31/yq5OFcQ6u6kPP21Dx/Itoa0xOUngmqlnfu3ibh
   Q==;
X-CSE-ConnectionGUID: xYnywZT4QIeDD8+hJL/Nhw==
X-CSE-MsgGUID: xUCfJSTnSjytUcFKoo0SfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="112826726"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="112826726"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 03:33:09 -0700
X-CSE-ConnectionGUID: HVbzPJIkSNOqBoO9FjH5OA==
X-CSE-MsgGUID: 7ZUl5mC4RcWsFYugkc9jTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="294128638"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 14 Aug 2026 03:33:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 0F13699; Fri, 14 Aug 2026 12:33:06 +0200 (CEST)
Date: Fri, 14 Aug 2026 12:33:06 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tipd: Fix Thunderbolt altmode VDOs for cd321x
Message-ID: <an7u4kHCuYE0bz4x@black.igk.intel.com>
References: <20260813-b4-tipd-vdo-fix-v1-1-70317f2cd554@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-b4-tipd-vdo-fix-v1-1-70317f2cd554@kernel.org>

On Thu, Aug 13, 2026 at 08:16:15PM +0200, Sven Peter wrote:
> The Intel VID status register is actually 9 bytes long and doesn't
> contain the raw VDOs but only the upper 16bits for device mode and enter
> mode. Shift those two fields into place and reconstruct the cable
> discover mode VDO from the data status register instead since it's not
> directly accessible. With this fixed now the correct VDOs are forwarded
> to the PHY and the to-be-submitted Thunderbolt/USB4 native host interface
> so that the right mode can be negotiated and the link actually comes up.
> 
> Link: https://www.ti.com/lit/ug/slvubh2b/slvubh2b.pdf
> Fixes: 0b31c978935f ("usb: typec: tipd: Read USB4, Thunderbolt and DisplayPort status for cd321x")
> Fixes: 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for CD321x")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sven Peter <sven@kernel.org>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c     | 17 +++++++++++++----
>  drivers/usb/typec/tipd/tps6598x.h |  4 ++--
>  2 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index d5ee0af9058b..159d1a2f9a1f 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -114,7 +114,6 @@ struct tps6598x_intel_vid_status_reg {
>  	__le32 attention_vdo;
>  	__le16 enter_vdo;
>  	__le16 device_mode;
> -	__le16 cable_mode;
>  } __packed;
>  
>  /* Standard Task return codes */
> @@ -700,9 +699,19 @@ static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status
>  		   cd321x->state.mode == TYPEC_TBT_MODE)
>  			return;
>  
> -		tbt_data.cable_mode = le16_to_cpu(st->intel_vid_status.cable_mode);
> -		tbt_data.device_mode = le16_to_cpu(st->intel_vid_status.device_mode);
> -		tbt_data.enter_vdo = le16_to_cpu(st->intel_vid_status.enter_vdo);
> +		tbt_data.cable_mode = TBT_MODE |
> +			TBT_SET_CABLE_SPEED(TPS_DATA_STATUS_TBT_CABLE_SPEED(st->data_status)) |
> +			TBT_SET_CABLE_ROUNDED(TPS_DATA_STATUS_TBT_CABLE_GEN(st->data_status));
> +		if (st->data_status & TPS_DATA_STATUS_OPTICAL_CABLE)
> +			tbt_data.cable_mode |= TBT_CABLE_OPTICAL;
> +		if (st->data_status & TPS_DATA_STATUS_ACTIVE_LINK_TRAIN)
> +			tbt_data.cable_mode |= TBT_CABLE_LINK_TRAINING;
> +		if (st->data_status & TPS_DATA_STATUS_ACTIVE_CABLE)
> +			tbt_data.cable_mode |= TBT_CABLE_ACTIVE_PASSIVE;
> +		tbt_data.device_mode = TBT_MODE |
> +			(u32)le16_to_cpu(st->intel_vid_status.device_mode) << 16;
> +		tbt_data.enter_vdo =
> +			(u32)le16_to_cpu(st->intel_vid_status.enter_vdo) << 16;
>  		cd321x->state.alt = cd321x->port_altmode_tbt;
>  		cd321x->state.mode = TYPEC_TBT_MODE;
>  		cd321x->state.data = &tbt_data;
> diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
> index 03edbb77bbd6..d172c84ada74 100644
> --- a/drivers/usb/typec/tipd/tps6598x.h
> +++ b/drivers/usb/typec/tipd/tps6598x.h
> @@ -206,10 +206,10 @@
>  #define TPS_DATA_STATUS_DP_PIN_ASSIGNMENT(x) \
>  	TPS_FIELD_GET(TPS_DATA_STATUS_DP_PIN_ASSIGNMENT_MASK, (x))
>  #define TPS_DATA_STATUS_TBT_CABLE_SPEED_MASK   GENMASK(27, 25)
> -#define TPS_DATA_STATUS_TBT_CABLE_SPEED \
> +#define TPS_DATA_STATUS_TBT_CABLE_SPEED(x) \
>  	TPS_FIELD_GET(TPS_DATA_STATUS_TBT_CABLE_SPEED_MASK, (x))
>  #define TPS_DATA_STATUS_TBT_CABLE_GEN_MASK     GENMASK(29, 28)
> -#define TPS_DATA_STATUS_TBT_CABLE_GEN \
> +#define TPS_DATA_STATUS_TBT_CABLE_GEN(x) \
>  	TPS_FIELD_GET(TPS_DATA_STATUS_TBT_CABLE_GEN_MASK, (x))
>  
>  /* Map data status to DP spec assignments */
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260813-b4-tipd-vdo-fix-44e65b48aea3
> 
> Best regards,
> --  
> Sven Peter <sven@kernel.org>
> 

-- 
heikki
