Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9D95822B
	for <asahi@lists.linux.dev>; Thu, 21 Dec 2023 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUs1NUUK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EF2C433C8;
	Thu, 21 Dec 2023 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703178223;
	bh=Cjmw151Q8qHltXLXAPXD7l7NdX11QIL0kl2lAT+81DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUs1NUUKJn0oKififiJCXU1rcZouv/jYsUVf7jQmqsjnMyHOIoHoOIeNOrCHndB7t
	 faW9/Sh65gCzmN7YvM3enGW7L6a6q+wD8Tvez+U9KzeNtcZe1K/Odb94DCMnARWbmc
	 MssdnmpCXqfRUcwS+FfGPy9PehPHC53tFRVbI+0CnoanggKiy6wfMNJoIzkSu53uYG
	 Iw1KfyAzWLjiGl/2q+ZhXMfxJ535zqukHiqCnRqxe2/s+OTwCmpL1/QIBsbIRdLM2+
	 a/lScnBRvYLkgFePM43gDt6y/+F0A1jjajmvKAzEDbvQD6Q4hyE9+hotIZf7HUMKHD
	 1ewSEPUR/pcZQ==
Date: Thu, 21 Dec 2023 10:03:40 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, marcan@marcan.st, sven@svenpeter.dev,
	axboe@kernel.dk, james.smart@broadcom.com, alyssa@rosenzweig.io,
	asahi@lists.linux.dev, linux-nvme@lists.infradead.org,
	kch@nvidia.com
Subject: Re: [PATCH] nvme: don't set a virt_boundary unless needed
Message-ID: <ZYRv7Fo6oCHgETyk@kbusch-mbp>
References: <20231221084853.1175482-1-hch@lst.de>
 <155ec506-ede8-42c7-95f7-e8be32800a8d@grimberg.me>
 <20231221121746.GA17956@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221121746.GA17956@lst.de>

On Thu, Dec 21, 2023 at 01:17:46PM +0100, Christoph Hellwig wrote:
> On Thu, Dec 21, 2023 at 11:30:38AM +0200, Sagi Grimberg wrote:
> >
> >> NVMe PRPs are a pain and force the expensive virt_boundary checking on
> >> block layer, prevent secure passthrough and require scatter/gather I/O
> >> to be split into multiple commands which is problematic for the upcoming
> >> atomic write support.
> >
> > But is the threshold still correct? meaning for I/Os small enough the
> > device will have lower performance? I'm not advocating that we keep it,
> > but we should at least mention the tradeoff in the change log.
> 
> Chaitanya benchmarked it on the first generation of devices that
> supported SGLs.  On the only SGL-enabled device I have there is no
> performance penality for using SGLs on small transfer, but I'd love
> to see numbers from other setups.

It's the larger transfers where it gets worse. To exaggerate the
difference, consider send a 2MB write with virtually aligned but
discontiguous user buffer: 512 folios.

PRP fits in 1 prp_page_pool block.

SGL needs 3 prp_page_pool blocks, tripling the command's memory usage.
