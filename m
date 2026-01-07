Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F5309F08
	for <asahi@lists.linux.dev>; Wed,  7 Jan 2026 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784867; cv=none; b=EHCRjPogwlcHQQbpanvfJ3tV478u5Od3dBgsF47LXieT26jZB6USxP5RSaBtaMu0glzT66MIge51zc8QwDUeJxHI/PWKlPBAmm1eVbWCxRTqwov3itsFcsv/G4V4CuVJgvdnclyTA/X3z+VtP9zrgQtm2Zz/ZQyNcfCRBtlrvu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784867; c=relaxed/simple;
	bh=VvYWkOrWnglFbh6Y86tk6yHYuqq5I+X58k7XOO0paUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNKzg079q7ZEDJsP4sjoZPawg8P6FWr9CMfn8DyqTSjG4kGohc1EKF/fXGfpVBhjfajjGWvYxrc6uLWJ63tvZurAU1Y5q4j2tmIDuxToqtQ8RgNeWFctmBJRXZ3yLVQuZlHopkTKoR5S6Nc7fGMFWSxQURdibWFnRU06sYpnk3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=gNTxIn6o; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pqKWX8P+; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="gNTxIn6o";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pqKWX8P+"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A455414000B1;
	Wed,  7 Jan 2026 06:21:01 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 07 Jan 2026 06:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767784861;
	 x=1767871261; bh=FJ5/twNgy2ZWEt+iRSu8Mm9csHD3onk56fEFg77xoOQ=; b=
	gNTxIn6o0vLiIqn7NKJdAfMfnSnurSps+MYY3FDMH8Xm0Vj0vWn+w6dC1LTaF8wf
	sre4G98Oto0k7VLDON/dBxVK25KMW8QOOfRyTovYXXX7ywNVnO1TRdDRdyy5Xkqz
	RXwfkDJB468Hw5tET9mpSlJfk8fI2oMfGkNhv47FPQD4QFxXVHNDpD8gEjSvGoQQ
	heoHqRHJloXZxwp7MBHZj04NKnT2MeoT1Dszi/4pjzcLzdlfaqWBJS11AZaP94Vt
	LDUc9zDoq20/QE3PCgNlNS99sGlhLIDCF3FMn4yAdGSx5j9+lAM4T/PVS+0XVujF
	nZLsmeZFrCSzmt0SAPf1Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767784861; x=
	1767871261; bh=FJ5/twNgy2ZWEt+iRSu8Mm9csHD3onk56fEFg77xoOQ=; b=p
	qKWX8P+xyXT1dcbRLA6w5Y+GuQOe08ljJLP8QmhsrleVBlWRGMjUfFCr9rVPfDq1
	o8Rdk6nTXv7mnj4HGX4YCLjGEe/mYbIr0wC2+L0RjndBBRppeWwb7/RtCFm5a54D
	H3MX0YAfyy7OjIlv6UaIDTF+3nmfr7NoEJNYLEXzw4Hi6ZTEbcl/Kuxy+/4PLNRa
	FiVvYq/urT5ZKqavbtqjh89pk2wVWMscSPH5p13h2dZ5hC+hnfLntQkm/q1smGm4
	zgKT/c39u8rsJEuvZurdgfad9S/092hv6dGL+kJH1sivx4JtdRRURDvFS2TKPIWU
	DQrmGiEuaYCq88nb7VgFg==
X-ME-Sender: <xms:nUFeaYNoWs3Ty9YmjiRWIRXm-l4YvFzs7HaZ5EwUn0yfpZtAKB__7w>
    <xme:nUFeafbnya0RQhUwlPCOAE07T3sIVDg-Ffs0LfcAEhh181dHadH3JmMTyogrpz0HE
    eKZTn_C8_iSY8b8NajEGATJE2ALOCCJTph5ZGVwDxwl2gldt_9kjkA>
X-ME-Received: <xmr:nUFeaf_DLVl0Qkb1GI8F6XDE3ZI_PvSxRRGhlDcVSF-89PBZRJZVNL-LkBxHmZcjUiMz5luDNsqN5Sl8cUC2YMkuN1i5nZ1qjgo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddvleegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepue
    fgfefhvdeuvdffteegueevlefhtdffgeefhefgffehtdegffefveetieeutdetnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphhiohhtrhesmhgrshhlohifsh
    hkihdrgiihiidprhgtphhtthhopehtohifihhntghhvghnmhhisehgmhgrihhlrdgtohhm
    pdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtoh
    eptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhl
    lheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpth
    htoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggu
    rdhorhhg
X-ME-Proxy: <xmx:nUFeaYR0c1_pM5k3VMYDRi_2hxs1iwf1T1wj6kvQemIeL9TZ8BpLrw>
    <xmx:nUFeaRdtLbSPJFSf68wGjcFa0j0me1WX-fGtaEjF6Da8ebfwP_W4Ug>
    <xmx:nUFeaSQeAzuP6lKSlHCvjwvQEQwLgCDA_uoirMNtuVtnj4rXui4WZA>
    <xmx:nUFeaVIFtkpavl357KPL5-JKi8Kh6lgTJkEZiBQuRFJGa9ObhUbFcw>
    <xmx:nUFeaTBm2xl0W7VsPiP4MJnWJi8UJM0w3oVn6QFXWgfD3gF_07-Sj2J3>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 06:21:00 -0500 (EST)
Date: Wed, 7 Jan 2026 12:20:59 +0100
From: Janne Grunau <j@jannau.net>
To: Piotr =?utf-8?Q?Mas=C5=82owski?= <piotr@maslowski.xyz>
Cc: Nick Chan <towinchenmi@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Sven Peter <sven@kernel.org>,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Apple Silicon drivers
Message-ID: <20260107112059.GB4068972@robin.jannau.net>
References: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
 <20251231-arch-arm64-apple-defconfig-v1-2-4ff19805ba39@jannau.net>
 <DFCLU67GQO86.1NY037FRPJ4E2@maslowski.xyz>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DFCLU67GQO86.1NY037FRPJ4E2@maslowski.xyz>

On Wed, Dec 31, 2025 at 07:14:13PM +0100, Piotr Masłowski wrote:
> Hello, I'm not a kernel developer so this might be entirely irrelevant,
> but while browsing the list I noticed something you might've missed:
> 
> On Wed Dec 31, 2025 at 16:42 CET, Janne Grunau wrote:
> > From: Sven Peter <sven@kernel.org>
> >
> > Enable drivers for hardware present on Apple Silicon machines. None of
> > these drivers are critical so build them as modules.
> [...]
> > Link: https://lore.kernel.org/asahi/20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org/
> > Signed-off-by: Sven Peter <sven@kernel.org>
> > Signed-off-by: Janne Grunau <j@jannau.net>
> >
> > ---
> > Changes compared to the original submission:
> > - Remove AIC and APPLE_PMGR_PWRSTATE as those are selected by ARCH_APPLE
> > - Add new macsmc drivers (mfd, reset, hwmon, rtc and gpio)
> > - Add BACKLIGHT_APPLE_DWI, DRM_PANEL_SUMMIT and NVMEM_APPLE_SPMI
> >   (suggested by Nick Chan)
> 
> What about DRM_ADP which Nick also mentioned?
> 
> > - Add PWM_APPLE and APPLE_M1_CPU_PMU
> [...]
> 
> I tried to check whether it had possibly been taken care of elsewhere,
> but I didn't find anything related on the mailing list(s) nor in the repo.

Good catch, I missed it in Nick's list. Comma or new line separated
entries would have been easier to read. I also missed the network and
bluetooth devices:

- BRCMFMAC_PCIE
- BT_HCIBCM4377
- TIGON3
- AQTION

Missing as well although only in linux-next is PHY_APPLE_ATC

What is the merge policy for defconfig changes? If this can be merged
for v6.19 I won't bother with a v2 and add them later in a subsequent
change.

If it will be picked up only for the next cycle (v7.0?) I'll send a v2
with the missing configs. Any advise how to deal with PHY_APPLE_ATC? It
depends on commit 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
currently only in
https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/log/?h=next

Janne
