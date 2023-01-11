Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A057180
	for <asahi@lists.linux.dev>; Wed, 11 Jan 2023 06:41:25 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id CB7D868BEB; Wed, 11 Jan 2023 07:41:20 +0100 (CET)
Date: Wed, 11 Jan 2023 07:41:20 +0100
From: Christoph Hellwig <hch@lst.de>
To: Hector Martin <marcan@marcan.st>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
	Eric Curtin <ecurtin@redhat.com>, Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] nvme-apple: Do not try to shut down the controller
 twice
Message-ID: <20230111064120.GA18581@lst.de>
References: <20230111043614.27087-1-marcan@marcan.st> <20230111043614.27087-2-marcan@marcan.st> <20230111045402.GB15520@lst.de> <fc2e03ea-5404-e768-0cab-e95adcde6da7@marcan.st> <20230111051836.GA16576@lst.de> <0e7f9ef4-6660-5842-821b-7492f7ecbc61@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e7f9ef4-6660-5842-821b-7492f7ecbc61@marcan.st>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 11, 2023 at 02:44:42PM +0900, Hector Martin wrote:
> The higher-level resume path can't do a disable since the firmware isn't
> up at that point, and the subsequent reset (which is shared with other
> conditions that cause a reset) is what brings the firmware back up. So
> the disable has to either happen in the suspend path, or in the shared
> reset path after we know the firmware is running.

Ok, that's the weird part where nvme-apply really isn't nvme at all.
Because for actual NVMe devices the register access must work all the
time.

> That's only if you issue a disable *in lieu* of a shutdown (and in fact
> if you do that on Apple controllers under some conditions, they crash).
> Issuing a disable *after* a shutdown is required by the NVMe spec if you
> want to use the controller again (and should basically do nothing at
> that point, since the controller is already cleanly shut down, but it is
> required to set EN to 0 such that the subsequent 0->1 transition
> actually kickstarts the controller again). If you don't do that, the
> controller never leaves the shutdown state (how would it know?).

Yes.  Although I would not call this a disable after shutdown, but a
disable (or rather reset) before using it again.

> To be clear, the sequence I was attempting to describe (which is what we
> were doing before the patch that regressed this) was:
> 
> (on sleep)
> - NVMe shutdown
> - NVMe disable
> - Firmware shutdown
> 
> After the firmware shutdown, we can't do anything with NVMe again until
> we start firmware back up, which requires going through the reset flow.
> 
> Right now we're doing:
> 
> (on sleep)
> - NVMe shutdown
> - Firmware shutdown
> (wakeup)
> - Oops, NVMe is enabled, let's disable it! (times out due to FW being
> down but failure isn't propagated)
> - Firmware startup
> - NVMe enable (thinks it succeeds but actually the controller is still
> in the shutdown state since it was never disabled and this persists
> across the firmware cycle!)
> - I/O (never completes)

Yes, so I guess due to the weird firmware issues doing the disable
after shutdown instead of before setting up might be the right
thing for nvme-apple, unlike real NVMe.  So I guess we need to do
that in the driver, and add a big fat comment explaining why.
