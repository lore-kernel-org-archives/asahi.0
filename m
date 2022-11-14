Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5AC2912
	for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 10:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668422150; x=1699958150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KQI39jI+VhVq9DkODJATdCRiiFhF16bievVRLfJnrnw=;
  b=E3Kh+FO4PXk2BSmUV59SRJzrFwwXKB3lpNUaXDYg5CEzHNMPyhlzEjar
   ZMshzZfxNhJx6ggzQUoS209ujfwJeS2hN63R/VKd2mkUO3Zr8EIVWyikD
   IHpMgvlZ57OokRWnHBXwejYVoQS4zoz2WZfm7a2Mo4YaWeEl2ckVBb6dE
   XMN4wJws9uxQ7zqeEn54Zf+n1ANYABCiqjtzyX/zGx3h5+a64DXGJ406O
   hbco6oMzlKqvYKcaCz0nOKQjXtVhUUDNGswraPqx03F8ZXrXBENIvcml2
   CrENjSmn/XYEHcZE3VBOfWr+zaajIvnff9cmSIoQUkVfm7/gkzfeF+Zip
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="398227964"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="398227964"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2022 02:35:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10530"; a="589320025"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; 
   d="scan'208";a="589320025"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 14 Nov 2022 02:35:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ouWoY-00C7k0-1J;
	Mon, 14 Nov 2022 12:35:42 +0200
Date: Mon, 14 Nov 2022 12:35:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v3 1/7] mfd: Add core Apple Mac SMC driver
Message-ID: <Y3IZ/ppKU/bWc5aU@smile.fi.intel.com>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXJ-002mvq-Bg@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1osRXJ-002mvq-Bg@rmk-PC.armlinux.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 08, 2022 at 04:33:17PM +0000, Russell King wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> This driver implements support for the SMC (System Management
> Controller) in Apple Macs. In contrast to the existing applesmc driver,
> it uses pluggable backends that allow it to support different SMC
> implementations, and uses the MFD subsystem to expose the core SMC
> functionality so that specific features (gpio, hwmon, battery, etc.) can
> be implemented by separate drivers in their respective downstream
> subsystems.

...

> +	ret = mfd_add_devices(dev, -1, apple_smc_devs, ARRAY_SIZE(apple_smc_devs), NULL, 0, NULL);

PLATFORM_DEVID_NONE

> +	if (ret)
> +		return ERR_PTR(dev_err_probe(dev, ret, "Subdevice initialization failed"));

...

> +EXPORT_SYMBOL(apple_smc_probe);

Namespace?

-- 
With Best Regards,
Andy Shevchenko


