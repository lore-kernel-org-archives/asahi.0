Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D5810EA
	for <asahi@lists.linux.dev>; Mon, 17 Oct 2022 07:20:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0B42768C7B; Mon, 17 Oct 2022 09:20:50 +0200 (CEST)
Date: Mon, 17 Oct 2022 09:20:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvme-apple: fix DMA-API warning
Message-ID: <20221017072049.GD30661@lst.de>
References: <E1oiaBa-00Dz7S-SK@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1oiaBa-00Dz7S-SK@rmk-PC.armlinux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks, applied with a rewritten commit message and a Fixes tag.
