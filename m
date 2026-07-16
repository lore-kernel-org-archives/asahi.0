Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5E0443AA4;
	Thu, 16 Jul 2026 18:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225407; cv=none; b=HTfP8s3pgE7de2uiCTaoyKlGcFVjasRz8Srs/3yF5zGSrb5/39Ek0W0P1FZPoAu/i+8/TtJ9hOJ1Ll1OEr+C3yX80aJSCGref3TrFI1xdEDfy8eWkRXMs6dVuhJydclMWyujNtq2HcEccGN5+eEakwEsiVEkAp6C6ZC54Jj3WTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225407; c=relaxed/simple;
	bh=Okw3RFWG7FVuL2+E+b2U06t94SSVvQwqXkAr8OEAKqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouLS21MpcGN44hjVcq55Xl1NUnDMNDRhN9uevpH4qgLFpEF2JEUp+JW5yr/wRG347MiFXogkOwk/UXfPmlsIoD9tmJrEgn51d7e9jLqkPc1gwIXcgqHXF1HYVUV+B0kB/gvEB3rHnLdm+Ood3dlyJ36xtPk+TXAOo9nQqWdYxOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejUrgd+4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejUrgd+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784225401; x=1815761401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Okw3RFWG7FVuL2+E+b2U06t94SSVvQwqXkAr8OEAKqU=;
  b=ejUrgd+477mMU+qv/hlnCvyuTAPvy15d8hzcEOlKdCV4gukE2FvpU0RQ
   4/42EnPNbE4HSAsU1ioJCysPZVeVMyXq7H30SpU5EpOMkt6qPXNJ/rTVZ
   EuwqTwUVP+Ll/6pdQqWnTVf/lDELLWHLSEN9MbA98UJ+jygrLsuKrYsYl
   ETtRs1NG9Jt7Z7LnNeO9jclpCaNaLiQIJ51GCD7pHhg+GNipqZbd9QjOh
   bWthXz/TmUfjiG6HIKnkQ1RcZZbRcA27sH1dOg6K9zUQ3y5itDDWH2j5G
   HtFyhZX12pq/Sw7YjEBzPoNbYpBmpBqv0DPShx49t0MjVCbHdajZ2n5Na
   g==;
X-CSE-ConnectionGUID: mOVDlwEpRRyQeXSfD2U+ig==
X-CSE-MsgGUID: uvr2IJwyT+uu/T8NykXG5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="72428731"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="72428731"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:09:57 -0700
X-CSE-ConnectionGUID: QdmQqkseSuO0mjX2xbzbJA==
X-CSE-MsgGUID: f2U++eSsRAqSyMQQF+RlRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="286635995"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:09:48 -0700
Date: Thu, 16 Jul 2026 21:09:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/4] nvmem: fix a const-unsoundness in reg_write
Message-ID: <alkeaYNKHZO5Tb3p@ashevche-desk.local>
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260716142415.28718-1-linkmauve@linkmauve.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 16, 2026 at 04:24:07PM +0200, Link Mauve wrote:
> This callback used to take a mutable void * for no reason, which causes
> the compiler to be unaware that the val buffer should never be modified
> by the callback.
> 
> This was found while drafting the nvmem-provider Rust abstraction.
> 
> Thanks to the guidance of Andy Shevchenko, this now introduces a new
> callback and deprecates the existing one, with the goal of renaming the
> new one into the old one once no user remains in the kernel.

...

> - Actually test with COMPILE_TEST, which I forgot to enable before…

Hint, you may use folder as a target in `make`. To avoid this just run

	make ... allyesconfig drivers/nvmem/

(In the similar way for any other folder and its subfolders.)

-- 
With Best Regards,
Andy Shevchenko


