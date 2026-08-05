Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C40446C845
	for <asahi@lists.linux.dev>; Wed,  5 Aug 2026 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933664; cv=none; b=CCNKilH/jK8wRS1HAhXi+FXhv7gpKs3OvCtemgG9dueDWs2sCpKgqAXQov9CuqgeaEZqvFJO/WEB1k+rfA+af58bVKGU/gGqVuFdL5imt2BvJp2JkVZBZFDV6ekuhZ9bCSggWF2FVzX+FgVuZo00j/HYWf1BOA23JPuUthLfcIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933664; c=relaxed/simple;
	bh=aGqrGLoXLWCR77fzM54CRWcSbftuIKEd6Z/+uJWgrMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9BbVUEJufEpf4Eywat9Cr9xqyuseorsVjEMComZwmgOd4FKKTi/CfNIdYCflZJrzTSvyrsyr2BlkzJNsEs/UBOpShYi7+xKz5w+UvWICqYNO/SQ5L3FlQbckgVQcDtQEybLA+hOYFfVyLSFC1rukXQKtS4AJJUGLxzF1ysmXVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CApoL4VN; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CApoL4VN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785933663; x=1817469663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aGqrGLoXLWCR77fzM54CRWcSbftuIKEd6Z/+uJWgrMo=;
  b=CApoL4VNyJWPgqipLUc8jdCoFpo5wAa3nDaL2Bum6vAEkLzVW/Q6lh1c
   KKyqC1Dui3qtHLIv6xZaf7g5bSuP9Gs43zt6ZTyzzVl+wi8+N+u/QeCQi
   Zo5mD0vLkrNKwNQMtCm1sZj76c6myXPBwrfzPnet/Tzbj2EQOFMeD7htA
   BY9L9tkB2pygNXbZSQCrEeg182zgX3Dg0/LnjazzsEZ+w6GhsFe0gkoPh
   lyk5Fdjn7Vdc4Cz0+hAqJrqNSZ7Nd3m1nt+jbhop6/jsqqvo1RfYyadjH
   HV6urznYmgVxFxghVSYOdOj7LMz06ssm5c8TYfmGT59QpTNl68aC7yhMN
   Q==;
X-CSE-ConnectionGUID: f6yEUVQaQd2eb8P8Qy1Tnw==
X-CSE-MsgGUID: ed/8cuioTvSIV51wN3FClQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="109293673"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="109293673"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:41:02 -0700
X-CSE-ConnectionGUID: wzosoJldQVSzkWsOxz6I0Q==
X-CSE-MsgGUID: 8VuOfVSbSQKWowPXIlo1nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="257499770"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 05 Aug 2026 05:40:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 2A42E99; Wed, 05 Aug 2026 14:40:58 +0200 (CEST)
Date: Wed, 5 Aug 2026 14:40:58 +0200
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
Subject: Re: [PATCH v2 2/3] usb: typec: tipd: Factor out i2c specifics
Message-ID: <anMvWrR5E54fPXVV@black.igk.intel.com>
References: <20260727-tipd-ace3-v2-0-1345957bd635@chaosmail.tech>
 <20260727-tipd-ace3-v2-2-1345957bd635@chaosmail.tech>
 <anMi2q5FmsvE4z8W@black.igk.intel.com>
 <7D31226B-98F2-4DF2-BA47-31CF9B269A7F@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7D31226B-98F2-4DF2-BA47-31CF9B269A7F@chaosmail.tech>

On Wed, Aug 05, 2026 at 01:57:18PM +0200, Sasha Finkelstein wrote:
> On Aug 5, 2026, at 13:47, Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> >> 
> >> -static const struct regmap_config tps6598x_regmap_config = {
> >> +const struct regmap_config tps6598x_regmap_config = {
> >> .reg_bits = 8,
> >> .val_bits = 8,
> >> .max_register = 0x7F,
> >> };
> >> +EXPORT_SYMBOL_GPL(tps6598x_regmap_config);
> > 
> > Don't export that. Just move it to i2c.c
> 
> I use this one in spmi.c too, the regmap configuration is the same,
> just the backend is different

Ah, sorry I missed that.

Thanks,

-- 
heikki
