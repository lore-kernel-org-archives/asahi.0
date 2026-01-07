Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55359308F02
	for <asahi@lists.linux.dev>; Wed,  7 Jan 2026 11:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767785656; cv=none; b=KzPQXaiMIQHoWVO3SNSBydlHZUSnZCqWnX2KdYueAFKAM1c3xOL137V3rns7cFEIBR3dCpnUrAo19d14/r/UjfPjCqO0vkoQWMCvod6TPXtUKQRbaAnazoxLxzburhWPG4P34rjADw9Q5e4aoYhQTieTYYhYXxen+dRkto9l3iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767785656; c=relaxed/simple;
	bh=JAxEZqqz6EJGA/R3k09eGy3oZPfnQZRUgKQUUI8QS7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnKI2TLXIGlJNXUWqNAU67mYskuHimjqnQTYsi0WBEZyQfC3W1zFPCAtyZ5orKi8YuhM8gDOMeWm8T6AWO8h2egf6JtLrg/nD5yyZ8Ib9nUnDI72267NdIiSjHli9IO8LpY9k7zbywsREZjDZRzHNJ0D+01LkrkmYfwEQTlN8H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jyx8w+q8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jyx8w+q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767785654; x=1799321654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JAxEZqqz6EJGA/R3k09eGy3oZPfnQZRUgKQUUI8QS7k=;
  b=Jyx8w+q8Urpd6gBhvnx94DWEczY2Tj00pesi+8SQiHDXlS1nu865bpmo
   uzbmRnDWUffpzlD1crS4kTLRpHJb+iuXpvEn8m991kbXtlxOEmKi+GWj1
   kYsIWKyArvPKZ3Fb742SwFGLgQxH0eU1+m3cfvax5pQezOR3XZq2PYk51
   PMBsEC+npYcUCF+cpU85/JZhTsVd7DR1kVugEfvxIpVdx9kA9kiDRZHiN
   fp4j+IlAG0xQuNx1B5bnLdk08WLB6nodwqNNKC0RBDIX+oo6Nx73AMeE0
   i/Cg9XV5AmhFo6yMnqxhpO/eOLxBtTO8Fxpg9qbLbfC1+KxTaSMTwcm0v
   A==;
X-CSE-ConnectionGUID: JeaP+J6/RV21hMUGTyi60g==
X-CSE-MsgGUID: cnS0IicYTS+I0ZMrB0eYEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="80514560"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="80514560"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:33:56 -0800
X-CSE-ConnectionGUID: u7gH7FV9STSGYWZVkZ/92g==
X-CSE-MsgGUID: HRFF9JwqQ2GzFHAsdz7WaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="203354662"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 03:33:55 -0800
Date: Wed, 7 Jan 2026 12:33:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Janne Grunau <j@jannau.net>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH i-g-t 1/3] drm-uapi/asahi: Initial import of asahi_drm.h
Message-ID: <20260107113335.pwzhci7gdwd2lmtj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Janne Grunau <j@jannau.net>,
	Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
 <20260105-asahi-tests-wave1-v1-1-a6c72617e680@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260105-asahi-tests-wave1-v1-1-a6c72617e680@jannau.net>

Hi Janne,
On 2026-01-05 at 22:03:45 +0100, Janne Grunau wrote:
> Import asahi_drm.h from commit 8f0b4cce4481 ("Linux 6.19-rc1").
> "asahi_drm.h" was added for Linux 6.16 and has not been modified so far.
> The kernel driver will be sent upstream in the next few days. The
> userspace drivers (OpenGL, OpenCl and Vulkan) are available in
> mesa 25.2 and later.
> 

+cc Alyssa and Neal

> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  include/drm-uapi/asahi_drm.h | 1194 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 1194 insertions(+)
> 
> diff --git a/include/drm-uapi/asahi_drm.h b/include/drm-uapi/asahi_drm.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..de67f1c603afd42753982c7ed593619f394df527
> --- /dev/null
> +++ b/include/drm-uapi/asahi_drm.h
> @@ -0,0 +1,1194 @@
> +/* SPDX-License-Identifier: MIT */

Note style comment in C headers. The same should be used in IGT
headers.

> +/*
> + * Copyright (C) The Asahi Linux Contributors

Strange, no year here? As it comes from kernel let it be as is.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> + * Copyright (C) 2018-2023 Collabora Ltd.
> + * Copyright (C) 2014-2018 Broadcom
> + */
> +#ifndef _ASAHI_DRM_H_
> +#define _ASAHI_DRM_H_
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * DOC: Introduction to the Asahi UAPI
> + *
> + * This documentation describes the Asahi IOCTLs.
> + *
> + * Just a few generic rules about the data passed to the Asahi IOCTLs (cribbed
> + * from Panthor):
> + *
[cut]
