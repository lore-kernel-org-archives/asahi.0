Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DE417BA8
	for <asahi@lists.linux.dev>; Sat,  2 Mar 2024 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709388007; cv=none; b=ERd1hjUKEEbV5iOCWcUnc463z140Du80nCTn5wBtiTv8eVKfGuzDsfAD/44kUVgWYbvSf+3XBw8j47dsV5gizCYltksMTJKehytJ0062VLsFWzyiS2Vt1VpKiHJYJttymDPw66nLtTqWWWPVCv6l4gr2UNmlJylMapZ1d0X7TGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709388007; c=relaxed/simple;
	bh=48Abl1/BROwtA7P4J6D3v5jY7lFHlw31Paj/gaQgsrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuhvHjjxz0f4wfTZGX+6L2LaPm3+eZ0en9yF2jq8FyieFCG8CfaHKXV9JNZW+Y6tSZLVFHFk1XSn2N1HTTuoMm59D2Z2bPwAEkbvZomvOaiEZootgcmPYYEUa5Su9rsePuqwZ2ylvAN1AI7dBMCHoJdGTdL/KX7XvSxLbeqbj34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 808A767373; Sat,  2 Mar 2024 14:59:54 +0100 (CET)
Date: Sat, 2 Mar 2024 14:59:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>, Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: Re: convert nvme to atomic queue limits updates
Message-ID: <20240302135954.GA1072@lst.de>
References: <20240228181215.873854-1-hch@lst.de> <ZeIAT5uY36cLkVpJ@kbusch-mbp.mynextlight.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZeIAT5uY36cLkVpJ@kbusch-mbp.mynextlight.net>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Mar 01, 2024 at 09:20:31AM -0700, Keith Busch wrote:
> On Wed, Feb 28, 2024 at 10:11:54AM -0800, Christoph Hellwig wrote:
> > Hi all,
> > 
> > this series converts nvme to the new atomic queue limit updates, and
> > as part of that refactors a lot of the setup code.  The first two
> > patches are block layer patches already sent out as part of the md
> > queue limits conversion and will hopefully get merged into Jens' tree
> > soon.
> 
> The whole series looks good. I see Jens has got the first two patches,
> so I'll rebase nvme-6.9 to that and apply the rest of the nvme patches.

I had to fix up the little thing Max noticed an also added another
patch for multuipath.  I'll resend with those updates once you
rebased.
