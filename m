Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBB452E076
	for <asahi@lists.linux.dev>; Tue,  8 Sep 2026 12:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869288; cv=none; b=cLGLxYEF19HXThd96keaw3AnGuRRSHb8DnaHB7nw0ax12hdCCXm8lsqHnmCG7J14kyv19kItLlqncKNsV9wCGqytS+K3AVMFcEgO0n0+pF97KmU3yXF8qcSGCzrsA+NZRbXNwqZJPJrO7pBsNpw0JC35lYvagMbmFT59QDP0uBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869288; c=relaxed/simple;
	bh=nY/f36e4XCBpBx5q/CWt81lKze9qX8oQl+TRB/FvkTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cz/5snvrKLkgqOdxamrVWXzOIYC4kkBQm/riadTNgar97YwIqtkc0zVVHnHXOGcvkh8Wphxq6F6yW+rnt0VJ0u1mxiHNm8o03R66/fDH/VpI9COz9vvuj9huyJScFlN25iTGqh0ftxBP0WUAG+0CxuKYa9XF+84XcN1Zb/5fju8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kO+eFi4u; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kO+eFi4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788869281; x=1820405281;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nY/f36e4XCBpBx5q/CWt81lKze9qX8oQl+TRB/FvkTs=;
  b=kO+eFi4uHBd73OdCswL2g84Dw9u07dlM3aXOfNfsVEY9XY1w+RmKo5QQ
   JL6vOr21S3gEjgDsY/9YmnRGkqqo5rpNMYFkmUE7tsPeSIh+rbPsll2Ze
   1bB+muPw/8sz6rXurrPjt32PfECogPP3SbwAx9aBbqJ/8GYdJgSGnoBDR
   Sd3HdjQoBjas+POZpeqG63elLR+5klMB1DB1RonirltKkwkwA7NGf4mND
   DZTgYWROznVVKb2V1MVVc3fDIosO1wMp1umzwA2hAtYaEKda/AqnkLXpl
   svDfZrxaDnHIk6agSNlZsGaXAa4SerXjISDXeTrDXQ2AVh7TX/yzlIn8A
   g==;
X-CSE-ConnectionGUID: IzSqYkPMRJ2pl/aLYTRYLA==
X-CSE-MsgGUID: O6s4MvnbRvqXG0sv9/z3Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="114808212"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="114808212"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 05:07:54 -0700
X-CSE-ConnectionGUID: aBvCWuEhSdG7xqg4PMl2eg==
X-CSE-MsgGUID: VDjQnp8RRumfORIpT2bbvw==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 08 Sep 2026 05:07:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id BC6F499; Tue, 08 Sep 2026 14:07:49 +0200 (CEST)
Date: Tue, 8 Sep 2026 14:07:49 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sven Peter <sven@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 02/22] usb: typec: Represent USB4 on the Type-C bus
Message-ID: <ap_6lY1fBb5L6VaO@black.igk.intel.com>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-2-1f80085f93fb@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-2-1f80085f93fb@kernel.org>

On Sun, Sep 06, 2026 at 08:36:25PM +0200, Sven Peter wrote:
> USB4 technically isn't alternate mode and entered using the EUDO and has
> no SVID or Discover Modes Response. We can still represent it like an
> altmode on the Type-C bus though by adding a mode kind. Exclude the USB4
> modes from any SVID-specific operations and driver binding, but allow
> consumers to observe their state through notifications.
> 
> Like for other altmodes, expose the USB4 mode to sysfs: Add a mode_kind
> to be able to differentiate and then expose the EUDO, make the USB4
> active state read-only since we only represent firmware-negotiated USB4
> modes and omit anything that only applies to SVID-specific altmodes.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Hope it's fine to add you as the contact for the sysfs documentation,
> happy to add myself otherwise though.
> ---
>  Documentation/ABI/testing/sysfs-bus-typec | 36 ++++++++++++++
>  drivers/usb/typec/bus.c                   | 67 ++++++++++++++++++++-----
>  drivers/usb/typec/class.c                 | 83 +++++++++++++++++++++++++++----
>  drivers/usb/typec/mode_selection.c        |  6 ++-
>  include/linux/usb/typec.h                 | 20 +++++++-
>  include/linux/usb/typec_altmode.h         | 10 +++-
>  6 files changed, 193 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-typec b/Documentation/ABI/testing/sysfs-bus-typec
> index 205d9c91e2e1..524bbcbadf64 100644
> --- a/Documentation/ABI/testing/sysfs-bus-typec
> +++ b/Documentation/ABI/testing/sysfs-bus-typec
> @@ -12,6 +12,35 @@ Description:
>  
>  		Valid values are boolean.
>  
> +		For USB4 mode devices this attribute is read-only. On a port it
> +		indicates whether USB4 support is enabled; on a partner it reports
> +		whether USB4 is active. USB4 entry and exit are controlled by the
> +		port controller. Partner state changes notify this attribute and
> +		generate KOBJ_CHANGE uevents.
> +
> +What:		/sys/bus/typec/devices/.../mode_kind
> +Date:		September 2026
> +Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> +Description:
> +		Read-only protocol kind represented by this mode device:
> +		"altmode" for an SVID-specific alternate mode, or "usb4" for
> +		USB4 negotiated using Enter_USB.
> +
> +		USB4 devices do not expose svid, mode, vdo, or priority
> +		attributes, or the legacy modeN attribute group. USB4 partner
> +		uevents contain MODE_KIND=usb4 instead of SVID, MODE, and
> +		MODALIAS variables.
> +
> +What:		/sys/bus/typec/devices/.../eudo
> +Date:		September 2026
> +Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> +Description:
> +		Read-only Enter_USB Data Object (EUDO), formatted as
> +		0x followed by eight hexadecimal digits. Present only on USB4
> +		partner mode devices, not on ports or SVID-specific alternate
> +		modes. USB4 cable information is encoded in the EUDO; there are
> +		no USB4 cable plug mode devices.
> +
>  What:		/sys/bus/typec/devices/.../description
>  Date:		July 2018
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> @@ -36,6 +65,8 @@ Description:
>  		the mode index is not assigned, identifying the alternate mode
>  		must be done with either mode VDO or the description.
>  
> +		This attribute is not present on USB4 mode devices.
> +
>  What:		/sys/bus/typec/devices/.../svid
>  Date:		July 2018
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
> @@ -43,9 +74,14 @@ Description:
>  		The Standard or Vendor ID (SVID) assigned by USB-IF for this
>  		alternate mode.
>  
> +		This attribute is not present on USB4 mode devices.
> +
>  What:		/sys/bus/typec/devices/.../vdo
>  Date:		July 2018
>  Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
>  Description:
>  		Shows the VDO in hexadecimal returned by Discover Modes command
>  		for this mode.
> +
> +		This attribute is not present on USB4 mode devices. USB4 partner
> +		mode devices expose the EUDO in the eudo attribute.

USB4 needs to have its own device type. The USB4 mode should not
expose things like svid and the vdo at all. And the USB4 mode
registration should be done with a dedicated API IMO.

Thanks,

-- 
heikki
