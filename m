Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B1C3D333D
	for <asahi@lists.linux.dev>; Tue, 23 Jun 2026 11:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782213164; cv=none; b=YR26d6ECw0jjdOiiPbRT+aV4tZhfByT1BzZxRQbuhYVSnOpngeaqLnAyw1JaebX0ZuzbhPqeJyVNPINzCPiVBoug0w7Ki2EzBPIwAn3QsfpomZcCJrQFnvACVE/nMRKxgcM0BqPbshJZbEXeu9kH+PhOjxTjqlSDmIlin7m2Z/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782213164; c=relaxed/simple;
	bh=7RK047XqAhIykEGJb5lPK4UKvV4oKO7yT7rTqZ97/QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o1TPbue1Im2xUPDeFan2KV/gqrxnvfDuyt4SaiabTnhk3putHNa4aPBFiJl3Y/WMlNIvO+whXuorKNcdPST0ERfFNS08/872pZWy99l6/fIe0pKNnaM6xm37PLMZI4PVVMo5pj7UuBsH0JZzE2nZDjELV20VXH8h6wNQmrrHAD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsNosQgF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsNosQgF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782213163; x=1813749163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7RK047XqAhIykEGJb5lPK4UKvV4oKO7yT7rTqZ97/QU=;
  b=UsNosQgFfiRPX256nN7n3CR5pRfq+PCgNsKzjnPlpcubgKcdqEOxAahP
   xumZyx76w+FWrH6YQ7eSo9wIX83RB6FpfZqtGH5L36NfFXCAE+D0zgMHn
   Prxm3f/tpPF6uIbU4k3w4SUQOyipueIZpfMkEQbs5GmLew9A7bMD+C4/D
   bjWDyl4b4e481vxaDUuTQOY0YIIKIoXRCe4qAVoilILywta4KTdPvpwde
   SoDQTOB9BUOafob3qsYg/mMLrz+158dMyYBaY+nMlqlBOtlDghdeTPKW/
   QofXPSctzJ+Ntu8jgS/kh20thV8J3c2inGWcurN1jVVIAEJ29f4MDZJDL
   A==;
X-CSE-ConnectionGUID: x06+QauCT4OnJ5w4AhzTug==
X-CSE-MsgGUID: YbCDtExwRNqOF6yLYvfRWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="108496510"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="108496510"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 04:12:40 -0700
X-CSE-ConnectionGUID: bFFQtLhdRxG+nVi0ISy+pg==
X-CSE-MsgGUID: idiXUos7TYO3l3znmh23qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="249351231"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 04:12:39 -0700
Date: Tue, 23 Jun 2026 13:12:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alyssa Anne Rosenzweig <alyssa@rosenzweig.io>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev
Subject: Re: [PATCH i-g-t 0/3] Add infrastruture and initial tests for ashi
 DRM render driver
Message-ID: <20260623111220.crlywrqwpe4zck26@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Alyssa Anne Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
 <aV3DENy3WoW7NRZO@fedora>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aV3DENy3WoW7NRZO@fedora>

Hi Alyssa,
On 2026-01-06 at 21:21:24 -0500, Alyssa Anne Rosenzweig wrote:
> Series is - Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> 
> Thanks Janne!
> 
> Le Mon, Jan 05, 2026 at 10:03:44PM +0100, Janne Grunau a écrit :
> > I will start with upstreaming the asahi DRM render driver. The UAPI was
> > merged in v6.16-rc1 and the downstream Asahi Linux kernel tree has a
> > driver implementing this fully.
> > The asahi (OpenGL 4.6 conformant) and honeycomb (Vulkan 1.4 conformant)
> > user space drivers using this UAPI are available in mesa since 25.2.
> > 
> > This initial submission contains test infrastructure and tests for the
> > ioctl DRM_IOCTL_ASAHI_GET_PARAMS and DRM_IOCTL_ASAHI_GET_TIME.
> > These two tests are the only ones the initial version of the initial
> > upstream submission of the driver will pass.
> > 
> > I have additional tests which the downstream driver passes as well. I
> > was planning to submit them together with upstream driver patches which
> > implement the necessary functionality for the tests.
> > 
> > If preferred I could submit all tests and gate them based on the driver
> > version to avoid expected igt-gpu-tools test failures against
> > incomplete (as in not implementing the full UAPI) upstream driver
> > versions.
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>

Thank you all for contribution, I merged it with a little edit
for drm uapi description. Please look into my replies and try to
improve your next contributions.

Regards,
Kamil

> > ---
> > Janne Grunau (3):
> >       drm-uapi/asahi: Initial import of asahi_drm.h
> >       asahi: Add test infrastruture for asahi DRM render driver
> >       tests/asahi: Add test for DRM_IOCTL_ASAHI_GET_TIME
> > 
> >  include/drm-uapi/asahi_drm.h   | 1194 ++++++++++++++++++++++++++++++++++++++++
> >  lib/drmtest.c                  |    1 +
> >  lib/drmtest.h                  |    1 +
> >  lib/igt_asahi.c                |   58 ++
> >  lib/igt_asahi.h                |   15 +
> >  lib/meson.build                |    1 +
> >  meson.build                    |    8 +
> >  tests/asahi/asahi_get_params.c |   55 ++
> >  tests/asahi/asahi_get_time.c   |   63 +++
> >  tests/asahi/meson.build        |   14 +
> >  tests/meson.build              |    2 +
> >  11 files changed, 1412 insertions(+)
> > ---
> > base-commit: cef45b995557367ba082bc460fbab2190af943fd
> > change-id: 20260105-asahi-tests-wave1-7a850d0e0af0
> > 
> > Best regards,
> > -- 
> > Janne Grunau <j@jannau.net>
> > 
