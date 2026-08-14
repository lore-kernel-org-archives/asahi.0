Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC86397699
	for <asahi@lists.linux.dev>; Fri, 14 Aug 2026 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701211; cv=none; b=VnYBXiNlNRy0Nxtn4psvBkRWNiPchjrtS/E9QWiOoAkaDgXMAViDECYjCtsQlYSKQDjEh/2x0dcRuQUHM5rpkKA9BiCQvFeXGKU2ngEeVi96fvdjH0LDrXL5Umjy9gUzR66eNL2wQXnwjle1M1TuJoeWWQLQI5812EazRRK5y00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701211; c=relaxed/simple;
	bh=P50msqmGToj6m1U1nM26bFNOxv+piPx+jmPvAkrk/tI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnxT8+DhabR3ppAAMFHO+QdtkhAo6qi+9x/M93IyBij/I5JUSfbw2EDqMfedMH/DOIxdXMuuEINWyKVChVvnjKeat96lu8JveRPHuCBTpxAi2CYa8/ZAisdXuqbKl4aWX55HdkYkZZB579Rp2cf3ZvOu/jSpofQnCyazI1ZA2f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wy/Mmpf0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wy/Mmpf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786701207; x=1818237207;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P50msqmGToj6m1U1nM26bFNOxv+piPx+jmPvAkrk/tI=;
  b=Wy/Mmpf0USgko95hz2dIH7/KG6nIbqwV8wEORzLU4V8Na2ABR3M39x8a
   u+waidOtqLjjf6CVRkkmFar18xIjEO6S/gw49NYpvKQP2o+Tmg5dWWKSt
   GRuLXsECgVsUReTcX0j6hLRMfix6POcKAp1ZayCSx9i4I73Ty/XoLCS4e
   oXqB8jkh/8xDzXaMZAYtj/hM7GD5FoTSkVG4hFYqvSK58iWojd+Fc++NV
   DzbQyDc4ZYRemK5LAQ1ZFHpuafnxSmsceHgd+DU9zheFiiC1sXFU3wY4U
   PdL6XxqtVUJfVY1DAg9Bgj+Eudzpu8B+tsWVAtUG5MC/R6oMF27t9VcOc
   Q==;
X-CSE-ConnectionGUID: DNPrdL+zQkmS/Hrr8EQgLw==
X-CSE-MsgGUID: od1EoIZyTDyhSQvyjypDVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="74815267"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="74815267"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 02:53:23 -0700
X-CSE-ConnectionGUID: IjoJ53CGQ8yQ6Fbsa+l3Xw==
X-CSE-MsgGUID: V9pMgBuvTrCq8+lA32BrUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="268037172"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 14 Aug 2026 02:53:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 10EEA99; Fri, 14 Aug 2026 11:53:19 +0200 (CEST)
Date: Fri, 14 Aug 2026 11:53:19 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alyssa Milburn <amilburn@zall.org>
Subject: Re: [PATCH v4 2/3] usb: typec: tipd: Factor out i2c specifics
Message-ID: <an7lj2g1bAkOZw-o@black.igk.intel.com>
References: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
 <20260806-tipd-ace3-v4-2-79855b150914@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-tipd-ace3-v4-2-79855b150914@chaosmail.tech>

Hi,

On Thu, Aug 06, 2026 at 11:37:21AM +0200, Sasha Finkelstein wrote:
> From: Alyssa Milburn <amilburn@zall.org>
> 
> Make the core driver more bus-agnostic to prepare for SPMI variants of
> the tipd chip
> 
> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/usb/typec/tipd/Kconfig    |   8 ++++--
>  drivers/usb/typec/tipd/Makefile   |  11 ++++---
>  drivers/usb/typec/tipd/core.c     | 225 +++++++++++++++++++++++------------------------------------------------------------------------------------------------------------------------
>  drivers/usb/typec/tipd/i2c.c      | 106 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/usb/typec/tipd/tps6598x.h | 121 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 276 insertions(+), 195 deletions(-)

I kept you wating so long that this does not apply on top of Greg's
usb-next any more. I'm sorry about that. But since you need to resend
in any case, one more nitpick/question. With that, for both patches:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> +int tipd_init(struct tps6598x *tps);

How about:

        int tipd_init(struct tps6598x *tps, enum tipd_hw_variant variant);

Thanks,

-- 
heikki
