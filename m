Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C0F23A9B0
	for <asahi@lists.linux.dev>; Wed,  7 Jan 2026 02:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767752503; cv=none; b=FfCSHtKEMwKblqqbUSPTC775/kixo59wD6bZ/oFson/j/M7e7ZrLqWseU9egnLjLJOAsQZxuGwrXjRLWeBean/YyQvAAsT2PfmCd9rwMprSuULka/a9dlSa+rTn6/SWwu14HGwnjsjfEfJ3o8KmtLOdfEdqx+p+RjPv8EgkP7G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767752503; c=relaxed/simple;
	bh=jYeOKQRmRiVRJkPOkPOqxip14ZMpwxojAZHQwS5O2Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRAFn9h/FXL4xQ0L6B7IWK5lmzkKA6sFRlsSRX/oJhMrmQUOxOrh+LliOT3nAqhKZoUvioI18r8X76Th4XXEvwVwocUFKzf6Ba5LurmciGc6MByKSRpuuBrekecNBS7Ivf5q9eJ35KGpgTa1Ccdd7Oy9AYSwgWNf+fhxF5kanR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=ehZIrb8A; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="ehZIrb8A"
Date: Tue, 6 Jan 2026 21:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1767752489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqTAq6UdlzaogcPYJn6AWvI2VKiD2JxVWHRitVZZiLs=;
	b=ehZIrb8AqR+gLw2vbmSD/SF5fLe5dLO39wGkedefjDQzmNLtK33Tx0aC3PkOHVpVdeFawe
	j04w2PA0tAV0eBybR5IA8JjCx1p3lTuoSJjBYBKA437j2CHgkKFwiawquJpDrJ1zMHQkHd
	PaP0XMIq2pOD4dEUU6sAlp2zTqmR40UJRWFIuc86VDryLIcc66d/dG/OXPrjGmH+/srjaK
	UCfEUZPUKb6xuE+5ndlg6ZXiXtIZGOtPpPVBbnHo/S/+/awiobFg+X6ulL5Rs6ix4E6+PZ
	/AKqNcTxdnEwKTbc6rHe02c+mYqma2We3fT9jhr4qtqGIXBxvgEs+oRuDHPa/g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Anne Rosenzweig <alyssa@rosenzweig.io>
To: Janne Grunau <j@jannau.net>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev
Subject: Re: [PATCH i-g-t 0/3] Add infrastruture and initial tests for ashi
 DRM render driver
Message-ID: <aV3DENy3WoW7NRZO@fedora>
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
X-Migadu-Flow: FLOW_OUT

Series is - Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Thanks Janne!

Le Mon, Jan 05, 2026 at 10:03:44PM +0100, Janne Grunau a écrit :
> I will start with upstreaming the asahi DRM render driver. The UAPI was
> merged in v6.16-rc1 and the downstream Asahi Linux kernel tree has a
> driver implementing this fully.
> The asahi (OpenGL 4.6 conformant) and honeycomb (Vulkan 1.4 conformant)
> user space drivers using this UAPI are available in mesa since 25.2.
> 
> This initial submission contains test infrastructure and tests for the
> ioctl DRM_IOCTL_ASAHI_GET_PARAMS and DRM_IOCTL_ASAHI_GET_TIME.
> These two tests are the only ones the initial version of the initial
> upstream submission of the driver will pass.
> 
> I have additional tests which the downstream driver passes as well. I
> was planning to submit them together with upstream driver patches which
> implement the necessary functionality for the tests.
> 
> If preferred I could submit all tests and gate them based on the driver
> version to avoid expected igt-gpu-tools test failures against
> incomplete (as in not implementing the full UAPI) upstream driver
> versions.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (3):
>       drm-uapi/asahi: Initial import of asahi_drm.h
>       asahi: Add test infrastruture for asahi DRM render driver
>       tests/asahi: Add test for DRM_IOCTL_ASAHI_GET_TIME
> 
>  include/drm-uapi/asahi_drm.h   | 1194 ++++++++++++++++++++++++++++++++++++++++
>  lib/drmtest.c                  |    1 +
>  lib/drmtest.h                  |    1 +
>  lib/igt_asahi.c                |   58 ++
>  lib/igt_asahi.h                |   15 +
>  lib/meson.build                |    1 +
>  meson.build                    |    8 +
>  tests/asahi/asahi_get_params.c |   55 ++
>  tests/asahi/asahi_get_time.c   |   63 +++
>  tests/asahi/meson.build        |   14 +
>  tests/meson.build              |    2 +
>  11 files changed, 1412 insertions(+)
> ---
> base-commit: cef45b995557367ba082bc460fbab2190af943fd
> change-id: 20260105-asahi-tests-wave1-7a850d0e0af0
> 
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
> 
