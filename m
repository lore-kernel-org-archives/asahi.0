Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427117D0
	for <asahi@lists.linux.dev>; Wed, 11 Jan 2023 04:50:42 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 53F5368BEB; Wed, 11 Jan 2023 05:50:32 +0100 (CET)
Date: Wed, 11 Jan 2023 05:50:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Hector Martin <marcan@marcan.st>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Eric Curtin <ecurtin@redhat.com>, Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] nvme: Handle shut down controllers during
 initialization
Message-ID: <20230111045032.GA15520@lst.de>
References: <20230111043614.27087-1-marcan@marcan.st> <20230111043614.27087-3-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111043614.27087-3-marcan@marcan.st>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jan 11, 2023 at 01:36:14PM +0900, Hector Martin wrote:
> According to the spec, controllers need an explicit reset to become
> active again after a controller shutdown. Check for this state in
> nvme_enable_ctrl and issue an explicit disable if required, which will
> trigger the required reset.

I don't think this belongs into nvme_enable_ctrl.  It seems like
nvme-apple is missing the equivalent to the nvme_disable_ctrl call
in nvme_pci_configure_admin_queue, though.
