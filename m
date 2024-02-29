Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032DF12838D
	for <asahi@lists.linux.dev>; Thu, 29 Feb 2024 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709214832; cv=none; b=TyXk7Zkjk0BADvmIluzH0EMO3Ztij5XfNE7PLR1XSVqzOg9H+6i81m4/FKXaOpay+03n72NIfpospppu/QzuknnrNVeGCaRa5bYLbiGKKDCqnDhzT1C4EEPR5dMYdXv3WGTKYimVuCYzEGMD8g8Cas5DnKCPTzLIqdWOK27ciO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709214832; c=relaxed/simple;
	bh=0eALVUKv2QjFHD4hWth75yzK4xXv90RDnXYBmWk09+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfzibM1UXI+diqmjyFYvS4f0BbgMAIxqPlWxTqd3fqYO12spwbok/goLiLnU8RohSVDDQcY9Flb37yjC3famtZIaGy8K2h2OT5oTmM7BcWQ02pvqrv46YjGnXwb/7xW7nxpu99H3v+XJPiH+qijFdAzW45dKrbbeA2HOXiZD4zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id DB60668BEB; Thu, 29 Feb 2024 14:53:45 +0100 (CET)
Date: Thu, 29 Feb 2024 14:53:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 13/21] nvme: split out a nvme_identify_ns_nvm helper
Message-ID: <20240229135345.GA7816@lst.de>
References: <20240228181215.873854-1-hch@lst.de> <20240228181215.873854-14-hch@lst.de> <a142cd4d-bedf-4666-8dc7-fcfbfc4ebb78@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a142cd4d-bedf-4666-8dc7-fcfbfc4ebb78@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Feb 29, 2024 at 03:52:08PM +0200, Max Gurtovoy wrote:
> I actually had a similar logic in one of the patches of the PI series I've 
> sent :)
> BTW, we need only the elbaf field from the nvm response structure so we can 
> ease the code a bit and free the nvm inside the nvme_identify_ns_nvm() 
> instead of in the caller...

Ithought about that, and while it might be a tad cleaner currently,
as soon as the identify_ns_nvm structure grows more fields that we'll
use that'll get uglier.

