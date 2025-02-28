Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ED51C5496
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 12:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745072; cv=none; b=h6VovFzo9hops9M9G60fWM2o/KFjBjUEQAkWUdDFgN6z6gp9i4ooIyiPy8VnP+BWrkEgpOi74k3EUPui3fqz1IKhbkneZGA1v1wNBPfgUv07FNec2iNlWsU2uMZ/VrYXxJysa/IsYWBHMjQ1zWn1sLSRAxcHAEw578Y1nfC7PLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745072; c=relaxed/simple;
	bh=McOhXXtXiU6Y8XCphU6pTt/xQ98y9eK7a4ortFGfREA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiGuI6GXR6PBiTMYGWWRB4JKYXJ3/98CRrVr6hjbEGbjXz/e61ayiFHV25QBEsAt0wdMxxjVOEDfH11srpgscv0np7mql/wIgyP9M9LOLWbPbfCgqE0LlMMgRErQzyUFUQgQ86nhYmfiYtjX8jKN6TDAuREImxBzDIEBe+YzQAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=erwM+nvm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="erwM+nvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740745071; x=1772281071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=McOhXXtXiU6Y8XCphU6pTt/xQ98y9eK7a4ortFGfREA=;
  b=erwM+nvmyZS10tD4iHbT6+pI+nNRhCQ4m5/yOKYYx8qxpS8XjzJRwv2v
   W9TjfDo0j4ruC7V3zU/X6HGyC/7Vf6/pyZFtHYvMjLUrVPPb3ZkZpJtQG
   LylqHSleAEuipvaZZqua8OoY3VgPBZQFQQ327FRllCcjIep1wb4a0l3hW
   Geq4+Uk9rFULDr/EyUw4gq/mhhOuwcFp0GAG3eOkCiUnuUDzF1CJBK7je
   AvUYaA9AhUK9lLGJUGyBjeGsUC74V34w1DIQ2h593K58o4G/N4zXCw/5V
   p/BkCf2OghsjX6Q0KeLNnDhPkd5cOXYsqB1kOLqEV1rGU+COWDrHFA0NS
   g==;
X-CSE-ConnectionGUID: 2hAhvUeqTqyJRhUL462l6g==
X-CSE-MsgGUID: tPYWP5f5QkKkvjowlYRarg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="53082090"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="53082090"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:17:50 -0800
X-CSE-ConnectionGUID: MGhYO7K4Ts+NHlu1sEwY1w==
X-CSE-MsgGUID: ez7bblg8RhmETJjclUqFWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="122270788"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:17:47 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnzJG-0000000FwQD-1y0R;
	Fri, 28 Feb 2025 14:17:42 +0200
Date: Fri, 28 Feb 2025 14:17:42 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"sven@svenpeter.dev" <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>,
	"alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH v4] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z8GpZo3M_QSJo2ka@smile.fi.intel.com>
References: <PN3PR01MB9597916417D398179C55BD98B8CD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597D1584C472757EB9F9C26B8CD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597D1584C472757EB9F9C26B8CD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 27, 2025 at 06:58:24PM +0000, Aditya Garg wrote:
> > On 27 Feb 2025, at 10:40 PM, Aditya Garg <gargaditya08@live.com> wrote:
> >>> On 27 Feb 2025, at 8:13 PM, andriy.shevchenko@linux.intel.com wrote:
> >>> On Thu, Feb 27, 2025 at 06:30:48AM +0000, Aditya Garg wrote:

...

> >>> +    switch (fmt[2]) {
> >>> +    case 'h':
> >>> +        val = orig;
> >>> +        break;
> >>> +    case 'r':
> >>> +        orig = swab32(orig);
> >>> +        val = orig;
> >>> +        break;
> >>> +    case 'l':
> >>> +        orig = (__force u32)cpu_to_le32(orig);
> >>> +        val = orig;
> >>> +        break;
> >>> +    case 'b':
> >>> +        orig = (__force u32)cpu_to_be32(orig);
> >>> +        val = orig;
> >>> +        break;
> >>> +    case 'c':
> >>> +        /* Pixel formats are printed LSB-first */
> >>> +        val = swab32(orig & ~BIT(31));
> >>> +        pixel_fmt = true;
> >>> +        break;
> >>> +    default:
> >>> +        return error_string(buf, end, "(%p4?)", spec);
> >>> +    }
> >> 
> >> Actually you can replace all these orig copies by introducing a new boolean, pixel_be.
> >> 
> >> Will become
> >> 
> >>   switch (fmt[2]) {
> >>   case 'h':
> >>       val = orig;
> >>       break;
> >>   case 'r': // or 'n' ?
> >>       val = swab32(orig);
> >>       break;
> >>   case 'l':
> >>       val = (__force u32)cpu_to_le32(orig);
> >>       break;
> >>   case 'b':
> >>       val = (__force u32)cpu_to_be32(orig);
> >>       break;
> >>   case 'c':
> >>       pixel_fmt = true;
> >>       pixel_be = orig & BIT(31);
> >>       /* Pixel formats are printed LSB-first */
> >>       val = swab32(orig & ~BIT(31));
> >>       break;
> >>   default:
> >>       return error_string(buf, end, "(%p4?)", spec);
> >>   }
> >> 
> >> And with this the existence of 'val' now becomes doubtful, we may reuse 'orig',
> >> just name it 'val' everywhere, no?
> > 
> > In case c, val != orig, in rest it is. We can just use pixel_fmt to check this condition, but places where we use orig, and not val will need an if statement or something similar. Tbh, it's an unecessary complication. You might want to see this part of the code:
> 
> More easier IMO can be:
> 
> val = pixel_fmt ? swab32(orig & ~BIT(31)) : orig;
> 
> At the end of the table

Also will work for me. Just think about it, i.e. how to make code shorter and
still readable.

-- 
With Best Regards,
Andy Shevchenko


