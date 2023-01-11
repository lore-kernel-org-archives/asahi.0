Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7669817D0
	for <asahi@lists.linux.dev>; Wed, 11 Jan 2023 04:54:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2A92C68BEB; Wed, 11 Jan 2023 05:54:03 +0100 (CET)
Date: Wed, 11 Jan 2023 05:54:02 +0100
From: Christoph Hellwig <hch@lst.de>
To: Hector Martin <marcan@marcan.st>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Eric Curtin <ecurtin@redhat.com>, Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] nvme-apple: Do not try to shut down the controller
 twice
Message-ID: <20230111045402.GB15520@lst.de>
References: <20230111043614.27087-1-marcan@marcan.st> <20230111043614.27087-2-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111043614.27087-2-marcan@marcan.st>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 11, 2023 at 01:36:13PM +0900, Hector Martin wrote:
> The blamed commit stopped explicitly disabling the controller when we do
> a controlled shutdown, but apple_nvme_reset_work was only checking for
> the disable bit before deciding to issue another disable. Check for the
> shutdown state too, to avoid breakage.
> 
> This issue does not affect nvme-pci, since it only issues controller
> shutdowns when the system is actually shutting down anyway.

There's a few other places where nvme-pci does a shutdown like
probe/reset failure and most notably and mostly notably various
power management scenarios.

What path is causing a problem here for nvme-apple?  I fear we're
missing some highler level check here and getting further out of
sync.
