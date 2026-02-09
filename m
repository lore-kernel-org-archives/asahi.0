Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A228150F
	for <asahi@lists.linux.dev>; Mon,  9 Feb 2026 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649049; cv=none; b=Wfd3xSMjryO2/Wk3J9Tdz+wsYVd21vmKzu5H5hDGJgjyAQIFqXCy4ljyalFKgxlySQnHzI/2mXmZX+MZPXnN5bGFaggHSkE+6I1rFIpF7Yn1tc9PV0EPEeMTmNz4WanPihsHuxj6Gn4Vl1lkU/w0pyac3GFtVggjP6cManThzvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649049; c=relaxed/simple;
	bh=0IR9s1nc46G6Cv3dolxXSeAxA2CyVyw34Xn9cs7mm78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAdyHKaMF8H41J1bnPG6z45dJFiY1u5J7h5TYYSoDUPT39ni3dfiq5y52HGTbfw8GViJBpbsDurkdoFD/yCmd5uxa6dUo2DxylWgZNni8ou8X3nPY4+u3NJn7lE64Oj3NRj12OZoytHz/oTkpSbjE/k3+3kuY/9jU3n0woajhkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 498C368CFE; Mon,  9 Feb 2026 15:57:22 +0100 (CET)
Date: Mon, 9 Feb 2026 15:57:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yu Kuai <yukuai@fnnas.com>
Cc: axboe@kernel.dk, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
	sven@kernel.org, j@jannau.net, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, tj@kernel.org, nilay@linux.ibm.com,
	ming.lei@redhat.com, neal@gompa.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] nvme-rdma: move blk_mq_update_nr_hw_queues after
 nvme_unfreeze
Message-ID: <20260209145721.GA18315@lst.de>
References: <20260209082953.3053721-1-yukuai@fnnas.com> <20260209082953.3053721-2-yukuai@fnnas.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209082953.3053721-2-yukuai@fnnas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Feb 09, 2026 at 04:29:50PM +0800, Yu Kuai wrote:
> blk_mq_update_nr_hw_queues() freezes and unfreezes queues internally.
> When the queue is already frozen before this call, the freeze depth
> becomes 2. The internal unfreeze only decrements it to 1, leaving the
> queue still frozen when debugfs_create_files() is called.
> 
> This triggers WARN_ON_ONCE(q->mq_freeze_depth != 0) in
> debugfs_create_files() and risks deadlock.
> 
> Fix this by moving nvme_unfreeze() before blk_mq_update_nr_hw_queues()
> so the queue is unfrozen before the call, allowing the internal
> freeze/unfreeze to work correctly.

After this nothing is really protected by the frozen queue except
for unquiescing the I/O queues.  So we can probably eventually
drop it, but it might make sense to avoid that for now.

Reviewed-by: Christoph Hellwig <hch@lst.de>

