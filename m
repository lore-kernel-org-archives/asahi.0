Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFC5409624
	for <asahi@lists.linux.dev>; Mon, 27 Jul 2026 13:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158619; cv=none; b=gOwfQcSkheWi4I7i+Lczg+U+GcVTHgZYfenIfd5SWAYrB8x7LuZ/ltWRs+lQirwRADr36x8I6X4yf8dYD8QphzEbLiHW1+jlDQyZRnx7ZGImpQfynLCeQg4qSImPdpojW9jtnorkmga9vlGVAjN3XJw+xB6pWaJrXkWvBVpenHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158619; c=relaxed/simple;
	bh=9pcL3Ujn9dRR9maqYrHBCcnkr1bH2U7cX7wpTCk3sCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZyt2qjO51J6p0TGtQS7MSc0ty1H1+TLC+StQG2HqtPMIzXY+r1aVh0GIIC6zDzc51HqBINmZrmnHOKhIncqTLx+gFLQjqAxP7exYjkOKxBvjSubA7Xc/KYXUK/7SB5ZvG7tVUjkkilWMgu18QSK5l+LZHqSHBnobnBas7dbSxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ewUBYCF/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ewUBYCF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785158614; x=1816694614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9pcL3Ujn9dRR9maqYrHBCcnkr1bH2U7cX7wpTCk3sCU=;
  b=ewUBYCF/57ACbfeClfPziUhGwekytk6tiDi3/gwBNJna70RlA8f4HSy7
   pqQzjefJeyJmZVt3A6N+SQVHRHqpvYzTbU8x6TUSVVH4niFDj7eIOZiLu
   52vQupoIUS9hKkHo5EPNiX3rtz2Io7w8vOncxR+SD6GBv/sfHId8RfpkT
   ePpKbAxR+s4w7XrTgnwNFKLHTgqRhabXHJ9nw1CybiZHE8E4kUds1Gvk8
   wNEVniSYKCHnGlln/QFknV1xuWj0+SekTG9qBYtBUX2bsP2FU9EKLDTZk
   XOaOdo6z3w4aC4Vg+F2WzBrorfLnpSeeV/DAE/FzkA+LS5B2x13579pq4
   g==;
X-CSE-ConnectionGUID: w9iJZ/WWT8GxbaPNk4t98g==
X-CSE-MsgGUID: O+MWW3QKRbi6q9t6bjBYPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108520757"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="108520757"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 06:23:27 -0700
X-CSE-ConnectionGUID: rFuhpQTTT7SO9zph0JLhXw==
X-CSE-MsgGUID: MlxXu+csT3egRYyxci+Lkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="297641534"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 27 Jul 2026 06:23:25 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 888BF99; Mon, 27 Jul 2026 15:23:23 +0200 (CEST)
Date: Mon, 27 Jul 2026 15:23:23 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alyssa Milburn <amilburn@zall.org>
Subject: Re: [PATCH 2/3] usb: typec: tipd: Factor out i2c specifics
Message-ID: <amdby6x3xQ0Z3-1G@black.igk.intel.com>
References: <20260725-tipd-ace3-v1-0-73202d36138a@chaosmail.tech>
 <20260725-tipd-ace3-v1-2-73202d36138a@chaosmail.tech>
 <amdVkYEiv_tOZuwG@black.igk.intel.com>
 <2D85C0F7-4223-4DA3-89E8-EEC96DB4FBC6@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2D85C0F7-4223-4DA3-89E8-EEC96DB4FBC6@chaosmail.tech>

On Mon, Jul 27, 2026 at 03:05:35PM +0200, Sasha Finkelstein wrote:
> On Jul 27, 2026, at 14:56, Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> > 
> > Hi,
> > 
> > On Sat, Jul 25, 2026 at 06:20:57PM +0200, Sasha Finkelstein wrote:
> >> From: Alyssa Milburn <amilburn@zall.org>
> >> 
> >> Make the core driver more bus-agnostic to prepare for SPMI variants of
> >> the tipd chip
> >> 
> >> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> >> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> >> ---
> >> drivers/usb/typec/tipd/Makefile           |   2 +-
> >> drivers/usb/typec/tipd/{core.c => core.h} | 109 ++++++++++++++++++++++++++++---------------------------------------------------------------------------------
> > 
> > That has to be a mistake, right? You don't move code into a header
> > like that.
> 
> Yes, it was a bad idea, already fixed in a v2 that will be sent in the
> near future.
> 
> >> +static struct tps6598x *tps6598x_from_device(struct device *dev)
> >> +{
> >> + struct i2c_client *client = i2c_verify_client(dev);
> >> + struct tps6598x *tps = i2c_get_clientdata(client);
> >> + return tps;
> >> +}
> > 
> > You should not need anything like that.
> 
> This should make more sense together with the following patch, as it
> can get the tps6598x from either the i2c or spmi backend.

You would only need this in the PM callbacks, and those you need to
keep in the glue drivers for i2c and spmi. The core.c can export
common functions for suspend and resume like I told you.

> >> --- /dev/null
> >> +++ b/drivers/usb/typec/tipd/i2c.c
> >> @@ -0,0 +1,86 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * Driver for TI TPS6598x USB Power Delivery controller family
> >> + *
> >> + * Copyright (C) 2017, Intel Corporation
> >> + * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >> + */
> > 
> > This driver is not coming from me.
> 
> I kept the attribution as both core and i2c are your driver, but split
> into two. Should I have done something else?

This will not be the same module as the core. You will have separate
modules for the core and for both glue driver.

Note. You can also refactor the core a little so that by default it
works with i2c, but it also exports the init/probe function so that it
can be used as a library with spmi. In that way you don't need to add
the i2c.c at all. But the you will depend on i2c also when you use the
spmi.

Thanks,

-- 
heikki
