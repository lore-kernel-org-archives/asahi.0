Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF2728E8
	for <asahi@lists.linux.dev>; Wed, 19 Oct 2022 11:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666178441; x=1697714441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CaxojcYcAZw4upBW1HT4c5H++7CWh87JUubekKn7h3k=;
  b=ZAjYkG/T+jzuAU4epTsEqXaNHwNp51UloMvwDqofrY1+XMNiU5oIWx77
   4VEUtIbK5mxiP1HJwwnI36wTcgBAtutrFKuHDWY3CyKdQZGJylnImHPCq
   MX0tvweKZdbRxctE0Nat8fCLVrOuWNpfDtFpexx2dh0hCGKEYrPej/EZe
   wEJpJ+4ZT1u/H3cFz1elx+fO0fVKa/Nl+I4c4xuQ7KT4fNnJX1k3NVA+a
   YdSosbtqH8ps6tTGyXtgtLjJVY+j1r11nQjO+XUKeSU6ZJve42lrK/DBj
   WhiHqwBdMvShOlhOS7tSfdxoI8jfrbHmquPlZ8o7iUi8S3DkCXgTL0Tm5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="306370006"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="306370006"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 04:20:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="874385927"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; 
   d="scan'208";a="874385927"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2022 04:20:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ol77a-009pMs-09;
	Wed, 19 Oct 2022 14:20:26 +0300
Date: Wed, 19 Oct 2022 14:20:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org,
	Hector Martin <marcan@marcan.st>, Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH 4/7] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Y0/deTV0iH8xqmaZ@smile.fi.intel.com>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUS-005CmS-IA@rmk-PC.armlinux.org.uk>
 <Y0/Kt9CW5vYcxHhK@alley>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0/Kt9CW5vYcxHhK@alley>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Oct 19, 2022 at 12:00:23PM +0200, Petr Mladek wrote:
> On Tue 2022-09-06 14:19:44, Russell King wrote:
> > From: Hector Martin <marcan@marcan.st>

...

> >  	for (i = 0; i < sizeof(u32); i++) {
> > -		unsigned char c = val >> (i * 8);
> > +		unsigned char c = val >> ((3 - i) * 8);
> 
> This hardcodes '3' but the for-cycle uses i < sizeof(u32).
> We should be consistent.
> 
> A solution would be:
> 
> 	int i;
> 
> 	for (i = sizeof(u32); --i >= 0;) {
> 		unsigned char c = val >> (i * 8);


With while-loop it might be more readable:

	unsigned int i = sizeof(u32);

	while (i--) {
		...
	}

> >  		/* Print non-control ASCII characters as-is, dot otherwise */
> >  		*p++ = isascii(c) && isprint(c) ? c : '.';
> >  	}

-- 
With Best Regards,
Andy Shevchenko


