Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C637520FAB7
	for <asahi@lists.linux.dev>; Fri, 21 Feb 2025 15:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151808; cv=none; b=TmxxLFKM4FRvcY4DWnRwEvAO41DjIWQXSWWnjYc6qFxF1ucd0ojOOzyFkMipWsZXc5b9OjW1iwaiONvpzuwpXTn9Nis5dYcfJpvQkmjuBpF2SXzjGcx2ofh70l+9Xn/I3jPIh29zCgJukH2o1yB2dhKvRFLT6tWc0+iD99IZKx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151808; c=relaxed/simple;
	bh=a10TKzqmJet8/9ZU7PDZxSgGj+2k0QTwtubJJ85A/CY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIdnVndXGbdUkxdb7wppbHLex8j2bLH49sDSyg8XC9I1qNNRDGB10MX7DLNYo3j4u8rKmAutXGypHS7GpaseRWW0QIXqGLsg6KyYfIFW7te6DG8oFg2r2az02yxciOMl8zO3zDPH32VRfemOVycunbextc5nkliq5+SNrwlaMC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNk1ZOQn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNk1ZOQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740151807; x=1771687807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a10TKzqmJet8/9ZU7PDZxSgGj+2k0QTwtubJJ85A/CY=;
  b=YNk1ZOQn05zUZokwA8n10c1U0CXiJ5Q0Qp6yb1iTsr2gA3OYJPB4xZkp
   GSSyBPDLjOOcMShSD5sbaM5x6tXiolK12t5h8B71YVVVNHOsuS8VWd1WB
   bbojVJDlhbHA2y0li0BjISB50PghmKsKgtfLOCVK3b7Gy8dmLcpzQi22e
   mwU47FiRTHhe9fUIQ7HR+uTCqZo2qeCb2j6XQa8+dq4m129RftnCIX5gN
   PdQWdDl9pkXKh0j+axEKiRoc+eJxufqlhPmJ/wE4UI7apAJ0/bIVIpjBr
   17uCFEv70GLWLmiNo3fUZsh1ai8vQ84dunKKlYBzfPyY/Z3NchX28Sfme
   g==;
X-CSE-ConnectionGUID: +m8YQnBoR3K3JLPoiKfGLg==
X-CSE-MsgGUID: zbZ5llyUSPS5Ih/TLFSkqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="66338324"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="66338324"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 07:30:06 -0800
X-CSE-ConnectionGUID: XlkuLuvzTu+o3LyVDuRCSg==
X-CSE-MsgGUID: 9RnfdGy6ToKU8ejkF6/uoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="120018199"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 07:29:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tlUyQ-0000000Dg5t-29xn;
	Fri, 21 Feb 2025 17:29:54 +0200
Date: Fri, 21 Feb 2025 17:29:54 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
	Orlando Chamberlain <orlandoch.dev@gmail.com>,
	Atharva Tiwari <evepolonium@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Hector Martin <marcan@marcan.st>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z7ib8uH91rKdoyjP@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 21, 2025 at 11:37:13AM +0000, Aditya Garg wrote:
> From: Hector Martin <marcan@marcan.st>

First of all, I do not see the cover letter. Is it only an issue on my side?

> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FOURCCs with various endian semantics:
> 
> %p4ch   Host-endian
> %p4cl	Little-endian
> %p4cb	Big-endian
> %p4cr	Reverse-endian
> 
> The endianness determines how bytes are interpreted as a u32, and the
> FOURCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> allow printing LSByte-first FOURCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).

Second, don't issue versions too fast, give at least a few days for the
reviewers to have a chance on looking into it.

Due to above this inherits the same issues as v2, please refer to my comments
there.

-- 
With Best Regards,
Andy Shevchenko


