Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475272C9C
	for <asahi@lists.linux.dev>; Thu, 19 Jan 2023 07:48:44 +0000 (UTC)
Received: by soltyk.jannau.net (Postfix, from userid 1000)
	id 2656026F67C; Thu, 19 Jan 2023 08:48:36 +0100 (CET)
Date: Thu, 19 Jan 2023 08:48:36 +0100
From: Janne Grunau <j@jannau.net>
To: Christoph Hellwig <hch@lst.de>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Eric Curtin <ecurtin@redhat.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] nvme-apple: Reset controller during shutdown
Message-ID: <20230119074836.GC3576@jannau.net>
References: <20230114-apple-nvme-suspend-fixes-v6.2-v2-0-9157bf633dba@jannau.net>
 <20230114-apple-nvme-suspend-fixes-v6.2-v2-1-9157bf633dba@jannau.net>
 <20230118052450.GA24742@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118052450.GA24742@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hej,

On 2023-01-18 06:24:50 +0100, Christoph Hellwig wrote:
> On Tue, Jan 17, 2023 at 07:25:00PM +0100, Janne Grunau wrote:
> > +		/*
> > +		 * Always reset the NVMe controller on shutdown. The reset is
> > +		 * required to shutdown the co-processor cleanly.
> > +		 */
> 
> Hmm.  This comment doesn't seem to match the discussion we had last
> week.  Which would be:
> 
> 		/*
> 		 * NVMe requires a reset before setting up a controller to
> 		 * ensure it is in a clean state.  For NVMe PCIe this is
> 		 * done in the setup path to be able to deal with controllers
> 		 * in any kind of state.  For for Apple devices, the firmware
> 		 * will not be available at that time and the reset will
> 		 * time out.  Thus reset after shutting the NVMe controller
> 		 * down and before shutting the firmware down.
> 		 */

yes, it differs from the discussion last week. I tried to issue the 
reset later in the setup path after the firmware was brought back up.  
That fixes the hang but the device is still not useable. So it appears 
we need to reset the controller before the firmware is shutdown.

Janne
