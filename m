Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914392;
	b=SlQ/f0dEubSXxHbLdX5XpphxtpwSRNVXJ2RR1W7rpseeEp2t2Bk0SNpp/L2MCHKWBJOc
	 QKJds5iPp64G4UQGVA3bvop+4vZK+oTV20x9w+4/ShHZsF2hc+5QOdnhD87vaE7jH3RnZ
	 1b/vdBO/rtpZPpP9d4Z70YWxtC+b5SCMMxr7xZKlgMTFA5l5USXZ+odQifVa7T2qtI2IS
	 UaXcYKEc5b60JB239ghD9AYTvxND1CQ/muQMcz9OoXr3FI/pLNO7lvDYmot0sWhUvk1UU
	 EZ5ttDALljHPY6wXEP+Qq/X+RV0NAiKGB3dFqYlxdsXCsig+kGWe2Ki1KVObocCaU2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914392;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=J3D5X9whr4CuICRWtOTLXhbuJoZ16bdz2KO7jQpTW6I=;
	b=jopycFLXaWqq2CfLU2gMh2EQjkz9LUlTcI6q8HAwnB1DuQAdfHWH2/rFzUHiG+yO98a0
	 Kon3WWYw5Ha2saBjuo3SSa2iV9gP7roTAuDeYJylgD4X9O21svzir+3peCTQGA1p0t5bt
	 kPIITMOPbi6wFQ8eQ1Is/Cm+HHB4zCH2vI8jPZ72X8sCP/ZxyDBii1eJo6G7PwkCnkFpC
	 hUl8xApp66De9dQHXVv0ctRbPMBzIjIp2ITz6vPfglx6CoCq8SsvRnrshbPx1TgP3U6mp
	 1kz9ukjRi3tpYSTa9XYanbm6foKzDw94zNP3RiIanYki4Aevv0kDQMQ8zpvCLK3K2fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KVETaqVL;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B9F606A884
	for <asahi@lists.linux.dev>; Tue, 17 Nov 2026 11:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B9F606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KVETaqVL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794914390; x=1826450390;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kDTwPyTQqXQY+QlQDSQh1XOk2yJFdM0AYsZ+EJDMvEo=;
  b=KVETaqVL5k0uwE8vpkd2hDkJI7mWUI611d3C3DP74i2ZBOWyAD3RGP7q
   rmCxLIkZO++D5q3DKfl9x8l8tpqFEYMjqJlRpRAnA8qTkhjdsPgRilyiq
   wIEYXtNBjp/aw1Nkr3wiAWOcOE/ZQjxhQECz2g7ULRRQawFfkEp5G7lAv
   /BkZucUOlxSD75j2geQ3V15XGo+5aDPHHfwD3n2TnwDlT+TlLNOHoce8a
   ZZeZz5IllcBLzXGoBDW3kg0ubR7a72EatIDIz0oIUYXN1EL2R8VEmeHlC
   Tfb63WT/EgKxIz6rhAwubDF3PUtnKiRZoZMbbDYY4wlX30GF1tYFlNPjv
   w==;
X-CSE-ConnectionGUID: J8w9ojElSqu4zwNNqRbqiA==
X-CSE-MsgGUID: 3k6D+dzgQqKafz+aiNETLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3718480"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3718480"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 03:19:48 -0800
X-CSE-ConnectionGUID: /773YfFXSBe/CQyzRBqquw==
X-CSE-MsgGUID: nQMrnzpiRBmYETnaUUYjtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10171978"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2026 03:19:45 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 785AC99; Tue, 17 Nov 2026 12:19:44 +0100 (CET)
Date: Tue, 17 Nov 2026 12:19:44 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Keisuke Tsukuda <tkdkei@outlook.jp>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: roles: wait for role callbacks on unregister
Message-ID: <avw4UE8H7t0Ybq6_@black.igk.intel.com>
References: <20261112024101.83321-1-tkdkei@outlook.jp>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112024101.83321-1-tkdkei@outlook.jp>

Hi,

On Thu, Nov 12, 2026 at 02:41:24AM +0000, Keisuke Tsukuda wrote:
> usb_role_switch_set_role() and usb_role_switch_get_role() check the
> registered flag before taking the switch lock. If a provider is
> unregistered during a role request, unregister can return while its
> callback is still running. The provider may then free memory used by
> the callback, causing a use-after-free. A caller that passed the check
> can also enter a callback after unregister returns.
> 
> Move the registered checks under the switch lock and clear the flag while
> holding the same lock on unregister. This waits for active callbacks and
> rejects callers that acquire the lock after the flag is cleared.
> 
> The Apple DWC3 remove path currently holds its private mutex around
> unregister. Its role callbacks take that mutex under the switch lock, so
> waiting on the switch lock in unregister would reverse the lock order.
> Unregister before taking the Apple mutex.
> 
> Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>
> ---
> Tested on ARM64 QEMU with Linux 7.3.4 and mainline 7.4-rc2
> (067c5c24cef2), with KASAN and lockdep enabled. Synthetic providers
> trigger KASAN use-after-free reports in both set and get callbacks before
> this change. With the change, unregister waits for the callbacks and
> neither test reports KASAN.
> 
> A lockdep test modeling the Apple callback/remove lock order warns for the
> original order and not for the new one. Apple DWC3 hardware was not tested.
> 
>  drivers/usb/roles/class.c     |   18 ++++++++++++++----
>  drivers/usb/dwc3/dwc3-apple.c |    4 ++--
>  2 files changed, 16 insertions(+), 6 deletions(-)

If you get this reply for the second time, then I'm sorry for the
noise. There's something wrong with our SMTP. I don't see all my
replies on the usb ml.

Please split this, one patch for the class and another for dwc3.

Also, don't forget to CC stable. This is a fix:
https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch

Thanks,

> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -79,10 +79,11 @@
>  	if (IS_ERR_OR_NULL(sw))
>  		return 0;
>  
> -	if (!sw->registered)
> -		return -EOPNOTSUPP;
> -
>  	mutex_lock(&sw->lock);
> +	if (!sw->registered) {
> +		ret = -EOPNOTSUPP;
> +		goto unlock;
> +	}
>  
>  	ret = sw->set(sw, role);
>  	if (!ret) {
> @@ -90,6 +91,7 @@
>  		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
>  	}
>  
> +unlock:
>  	mutex_unlock(&sw->lock);
>  
>  	return ret;
> @@ -107,16 +109,21 @@
>  {
>  	enum usb_role role;
>  
> -	if (IS_ERR_OR_NULL(sw) || !sw->registered)
> +	if (IS_ERR_OR_NULL(sw))
>  		return USB_ROLE_NONE;
>  
>  	mutex_lock(&sw->lock);
> +	if (!sw->registered) {
> +		role = USB_ROLE_NONE;
> +		goto unlock;
> +	}
>  
>  	if (sw->get)
>  		role = sw->get(sw);
>  	else
>  		role = sw->role;
>  
> +unlock:
>  	mutex_unlock(&sw->lock);
>  
>  	return role;
> @@ -423,7 +430,10 @@
>  {
>  	if (IS_ERR_OR_NULL(sw))
>  		return;
> +	/* Wait for in-flight set/get callbacks before unregistering. */
> +	mutex_lock(&sw->lock);
>  	sw->registered = false;
> +	mutex_unlock(&sw->lock);
>  	if (dev_fwnode(&sw->dev))
>  		component_del(&sw->dev, &connector_ops);
>  	device_unregister(&sw->dev);
> diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.c
> --- a/drivers/usb/dwc3/dwc3-apple.c
> +++ b/drivers/usb/dwc3/dwc3-apple.c
> @@ -487,9 +487,9 @@
>  	struct dwc3 *dwc = platform_get_drvdata(pdev);
>  	struct dwc3_apple *appledwc = to_dwc3_apple(dwc);
>  
> +	usb_role_switch_unregister(appledwc->role_sw);
> +
>  	guard(mutex)(&appledwc->lock);
> -
> -	usb_role_switch_unregister(appledwc->role_sw);
>  
>  	/*
>  	 * If we're still in DWC3_APPLE_PROBE_PENDING we never got any cable connected event and

-- 
heikki
