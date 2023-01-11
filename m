Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3131B452
	for <asahi@lists.linux.dev>; Wed, 11 Jan 2023 05:18:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6AB6568BEB; Wed, 11 Jan 2023 06:18:36 +0100 (CET)
Date: Wed, 11 Jan 2023 06:18:36 +0100
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
Message-ID: <20230111051836.GA16576@lst.de>
References: <20230111043614.27087-1-marcan@marcan.st> <20230111043614.27087-2-marcan@marcan.st> <20230111045402.GB15520@lst.de> <fc2e03ea-5404-e768-0cab-e95adcde6da7@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc2e03ea-5404-e768-0cab-e95adcde6da7@marcan.st>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 11, 2023 at 02:10:42PM +0900, Hector Martin wrote:
> OK, so the first question is who is responsible for resetting the
> controller after a shutdown? The spec requires a reset in order to bring
> it back up from that state. Indeed the PCIe code does an explicit
> disable right now (though, judging by the comment, it probably wasn't
> done with the intent of resetting after a shutdown, it just happens to
> work for that too :))

We need to do the reset before banging the registers to make sure
the controller is in a sane state before starting to set it up.

> Right now, apple_nvme_reset_work() tries to check for the condition of
> an enabled controller (under the assumption that it's coming from a live
> controller, not considering shutdown/sleep) and issue an
> apple_nvme_disable(). However, this doesn't work when resuming because
> at that point the firmware coprocessor is shut down, so the device isn't
> usable (can't even get a disable command to complete properly). Perhaps
> a better conditional here would be to check for
> apple_rtkit_is_running(), since apple_nvme_disable() can't work otherwise.

So on a resume the controller should have previously been shutdown
properly, and this shouldn't be an issue.  Does the apple implementation
leave some weird state after a shut down?  In that case the resume
callback might want to do an explicit controller disable before doing
the reset.

> Alternatively, we could just revert to the prior behavior of always
> issuing a disable after a shutdown. We need to disable at some point to
> come back anyway, so it might as well be done early (before we shut down
> firmware, so it works).

So the disable before shutdown doesn't really make sense from the
NVMe POV - the shutdown is to cleanly bring the device into a state
where it can quickly recover.  While a disable is an abprupt shutdown,
which can have effects on recover time, and might also use way more
P/E cycles than nessecary.  So if you always want to do a disable,
it should be after shutdown, and in doubt in the resume / setup path
instead of the remove / suspend one.
