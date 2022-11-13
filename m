Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA91F1850
	for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 16:19:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1529068CFE; Sun, 13 Nov 2022 17:19:22 +0100 (CET)
Date: Sun, 13 Nov 2022 17:19:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Chao Leng <lengchao@huawei.com>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 11/12] nvme-pci: split the initial probe from the rest
 path
Message-ID: <20221113161921.GB17733@lst.de>
References: <20221108150252.2123727-1-hch@lst.de> <20221108150252.2123727-12-hch@lst.de> <37a66baf-7654-3064-6692-0aea6340cf32@huawei.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37a66baf-7654-3064-6692-0aea6340cf32@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Nov 10, 2022 at 11:17:22AM +0800, Chao Leng wrote:
> nvme_free_tagset is not necessary when IO queues lost.
> nvme_free_tagset can be called in nvme_pci_free_ctrl.

Yes, it could, but that isn't really required here.

> If we call nvme_free_tagset here, nvme_dev_disable will still cause a NULL pointer references
> in blk_mq_quiesce_tagset.

True.  I have another series as a follow up to sort out some more
of the tagset mess.
