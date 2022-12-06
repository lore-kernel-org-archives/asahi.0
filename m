Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BB36AB3
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 13:33:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A576E68B05; Tue,  6 Dec 2022 14:33:12 +0100 (CET)
Date: Tue, 6 Dec 2022 14:33:12 +0100
From: Christoph Hellwig <hch@lst.de>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: Christoph Hellwig <hch@lst.de>, Pankaj Raghav <pankydev8@gmail.com>,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 2/9] nvme: use nvme_wait_ready in nvme_shutdown_ctrl
Message-ID: <20221206133312.GA25727@lst.de>
References: <20221129132208.4337-1-hch@lst.de> <20221129132208.4337-3-hch@lst.de> <20221129155718.poqztp4zudt47zmq@quentin> <CGME20221130135758eucas1p2aaf96c2c7bee29c0f44e5714b0b159bc@eucas1p2.samsung.com> <20221130135749.GA4786@lst.de> <fc5d0a74-e4e9-38c7-3a93-ff1eb71e0054@samsung.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc5d0a74-e4e9-38c7-3a93-ff1eb71e0054@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

> One minor nit: I also notice that nvme_wait_ready busy loop sleeps for
> 1~2ms, while the existing shutdown code busy loop sleeps for 100ms. Though,
> I don't think it is an issue.

Thanks, I've added a note about that, and a reference to the commit
that changed from the msleep(100) to the usleep_range for the
enable/disable path.
