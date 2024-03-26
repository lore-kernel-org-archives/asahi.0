Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263FD13C694
	for <asahi@lists.linux.dev>; Tue, 26 Mar 2024 14:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711464741; cv=none; b=dAmybpG+a25qS7AMKRx/XIUpQTXAkfodcrx0BiqpCRtNae1CC3Ixq5i3HJeawk86plvVuvTlaygWVWlksaysQBCw/0tF9B8vzpYwazTHE9LlEoFQsyEANFn67dlmJhpU80YxOV/MdWGS53f/6HlvUh5RYCHZkq55AOEHvwOWuSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711464741; c=relaxed/simple;
	bh=4xBuzRawAXjZQowcoXZ0AoJMCh51CJBz82l1Wux7PZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fvq6HjW6gXtGAIqrsZO/AQ0isi+Vy/5ITBb/tReTBTZSqnkZu9lNQIa2hpzs+PjwMaZisjReQqptwAwjCO+V4yTm8tkekA0OWTYMFNRf+7kGbhT8qx13A7iTH6er2VJNbDrXzv5KB8m1wUbiZVs69N+aiFSsFA8R927SQXFGFKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id A873368D42; Tue, 26 Mar 2024 15:52:15 +0100 (CET)
Date: Tue, 26 Mar 2024 15:52:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Kanchan Joshi <joshi.k@samsung.com>
Cc: Christoph Hellwig <hch@lst.de>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 14/16] nvme: use the atomic queue limits update API
Message-ID: <20240326145215.GA22423@lst.de>
References: <20240304140500.78583-1-hch@lst.de> <CGME20240304140712epcas5p43f81cdf9f37d5206cd0ac7201ff16eb7@epcas5p4.samsung.com> <20240304140500.78583-15-hch@lst.de> <0fd68aba-b116-3a0c-c864-909bf2d7e80c@samsung.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fd68aba-b116-3a0c-c864-909bf2d7e80c@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Mar 26, 2024 at 03:54:49PM +0530, Kanchan Joshi wrote:
> > +	ret = queue_limits_commit_update(ns->disk->queue, &lim);
> > +	if (ret) {
> > +		blk_mq_unfreeze_queue(ns->disk->queue);
> > +		goto out;
> > +	}
> 
> Not sure if this has been discussed already.
> But do we need something that does not update the limit but still 
> releases the mutex (q->limits_lock)?
> If nvme_update_zone_info() returns error, the mutex will not be released.

It just came up in the scsi series..

Maybe we'll want a cancel_update version after all.  I thought I'd get
away without it.
