Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6971215D2
	for <asahi@lists.linux.dev>; Thu, 29 Feb 2024 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709214009; cv=none; b=BFliDLGxOl99GWYpSHzJTqTC7BUqiANCirqMA45xrNzBhdvLKAZOyQlWSYG5fKlEwCgmAB79gMCYp6w+xqo0cWLiz0NoQOV92cMdUolEqL6T6ysdpm817yDcJmcSXIKPb80dXcozSYT2d9RXGzSXcbA2q382M3TZ9n2tE8Ylsjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709214009; c=relaxed/simple;
	bh=x63PD7nmQw9iND/+ewuxtpfWakuVApkyUczSb3tcE/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O5d3yHikJs09u9buAbrG515+N81oH8HJRhh6MB1dy6YVTQazj2Sq0YTcGnTxlqL83JTL+00LxUSZOwxd6aYoIGLT6V5EXvLfOtmy+9ssL8usSFd9YWi5K/KwQ4CH/n8huSJuFmNcKNzD0iKnzVI3aKo4Aabj+7quTqu1WxYJtIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0CAEE68BEB; Thu, 29 Feb 2024 14:40:04 +0100 (CET)
Date: Thu, 29 Feb 2024 14:40:03 +0100
From: Christoph Hellwig <hch@lst.de>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 12/21] nvme: move common logic into nvme_update_ns_info
Message-ID: <20240229134003.GA7322@lst.de>
References: <20240228181215.873854-1-hch@lst.de> <20240228181215.873854-13-hch@lst.de> <e8a57b1e-7884-497d-b090-4a3967104063@nvidia.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8a57b1e-7884-497d-b090-4a3967104063@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Feb 29, 2024 at 03:30:22PM +0200, Max Gurtovoy wrote:
>> +	/*
>> +	 * If probing fails due an unsupported feature, hide the block device,
>> +	 * but still allow other access.
>> +	 */
>> +	if (ret == -ENODEV) {
>> +		ns->disk->flags |= GENHD_FL_HIDDEN;
>> +		set_bit(NVME_NS_READY, &ns->flags);
>> +		ret = 0;
>> +	}
>> +
>> +	if (!ret && nvme_ns_head_multipath(ns->head)) {
>> +		blk_mq_freeze_queue(ns->head->disk->queue);
>> +		if (!(ns->disk->flags & GENHD_FL_HIDDEN))
>> +			nvme_init_integrity(ns->head->disk, ns->head);
>
> the logic in "nvme_update_ns_info_generic()" today is to hide also 
> ns->head->disk..

Indeed, that got lost.

>
>
>> +		set_capacity_and_notify(ns->head->disk, get_capacity(ns->disk));
>> +		set_disk_ro(ns->head->disk, nvme_ns_is_readonly(ns, info));
>> +		nvme_mpath_revalidate_paths(ns);
>> +		blk_stack_limits(&ns->head->disk->queue->limits,
>> +				 &ns->queue->limits, 0);
>> +		disk_update_readahead(ns->head->disk);
>
> we don't call disk_update_readahead() in "nvme_update_ns_info_generic()" 
> today..

Yes, but it's harmless as it just propagates the limits from the
queue_limits to the bdi.  That beeing said I've failed to send out a
last patch that actually removes it by switching to the queue_limits_set
API for the multipath node as well.
