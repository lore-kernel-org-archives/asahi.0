Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181012;
	b=UFrizV1+4gRIiAHb4BGYsYfCgzXcWU/gKp37HONBrzr7/fn0VrE81Rwiqfz60YwqWuEO
	 ulHRn4XItIj8fhUvc8m/GdlgNN3vPlTE8Lpb6juVxfXpuXRc++aYuV+sBiF1CAGUUTVu4
	 9iFUgI0bAVRZ/mJndwb+TEwQugc0l3d/6xCtX2tJoCounyurN+oyqy5O3TJgLc2u76yIK
	 y6xs7kgd5JwVXZHmavYq6f1zkyaO22ZADJy90mPelD4QPdXG8N5fmzVHTfYPsJN57tE3X
	 CZQ9vtU5BMRxsd9Tmg40Y2Bywo8KO/2SUd/clQ4+fQi3dZkYhRkrVd1Z3DDED4HPKSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181012;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9Yave6DZDGUUAvsSfmLDal9WFXgDPPi+dD/iYkllA/8=;
	b=1zSyKMeqE6AhNufCqoHqwWNygCgI8qziIfiMA5cdYupoM4ViHiED/q4sLebZXH0Y5Ux1
	 KnrYfZ0TKVvGCfWXbUUZ18MVW3W3bBDY8Qb4vCWO+SGhta3rM9nvH+T4lwEiTzfBYbdMT
	 xY1r8d+/wI3KHMu6uwwDLIVAX/tbmyGDMkoIlJNcUWhWxYQhpWodcVuThWiw7+q9tl1Pk
	 bAgXxBzkbI/Mv7B4MeDvJCrFdijP/93s0V5jUSpGS/oIiK5UTBa/0hYtPbX/aoUJ5iyHG
	 FLP2aWS3Fsvxh/zwIxCqYEfw4cvBu74SaLobwAxV5siemQXYd6JYGWzfSVM8k432cew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nb99TAm+;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D94606A331
	for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 13:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D94606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Nb99TAm+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795181012; x=1826717012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cJJw5vbcJuFQOpdae3ptvun5p75snXhnCZwChzdLyPk=;
  b=Nb99TAm+VhGiURfBHECJLBBBu2HJZqt6RDeXbtNVNvfDMVPwYmANlzw0
   ImJefDIHTbMw9l0dHYp1J/YBMqnZIhpaR/IurvEc05mJdgR7PAa+ZTqqt
   ijTdTynrDXQQZfLEGvJ1XwFowkkaVmRZmabEaNnI/24VQ8oXtLpg8RqMf
   nwsLJcVUV+EQp981K0sXrg/qFdQYniLlBf/6s8gOzy+ESeCT7yJZK+R8D
   bySsdMP32inamWlhV6sR9rpxD67PaQ6l0/8keKi4VzjUj4r353qcKDRj4
   QX7tKpbN+bKQnAB2FLSu1fCayXTVhmbrdpAZmOOJW3i9nzTBpdTHDWLcP
   w==;
X-CSE-ConnectionGUID: 4SUkRav9TkWYdcJ68qMeUA==
X-CSE-MsgGUID: VMH3GxA1TzGK5gvhtOk5dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3945342"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3945342"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 05:23:32 -0800
X-CSE-ConnectionGUID: +D3uAwM0Ql+ilvQ35dXt6w==
X-CSE-MsgGUID: LFt9NXU/RaC7A91NKsxlkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="11035886"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 20 Nov 2026 05:23:29 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 0BF6799; Fri, 20 Nov 2026 14:23:28 +0100 (CET)
Date: Fri, 20 Nov 2026 14:23:28 +0100
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
Subject: Re: [PATCH v2 2/2] usb: roles: wait for callbacks on unregister
Message-ID: <awBJ0NDCvbznrBjk@black.igk.intel.com>
References: <20261117125825.27629-1-tkdkei@outlook.jp>
 <20261117125825.27629-3-tkdkei@outlook.jp>
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
In-Reply-To: <20261117125825.27629-3-tkdkei@outlook.jp>

On Tue, Nov 17, 2026 at 01:00:20PM +0000, Keisuke Tsukuda wrote:
> usb_role_switch_set_role() and usb_role_switch_get_role() check the
> registered flag before taking the switch lock. If a provider is
> unregistered during a role request, unregister can return while its
> callback is still running. The provider may then free memory used by
> the callback, causing a use-after-free. A caller that passed the check
> can also enter a callback after unregister returns.
> 
> Move the registered checks under the switch lock and clear the flag while
> holding the same lock on unregister. This waits for active callbacks and
> rejects callers that acquire the lock after the flag is cleared. The
> preceding Apple DWC3 change avoids a lock inversion in its remove path.
> 
> Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/roles/class.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
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

-- 
heikki
