Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A11FA8
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 06:42:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C897A68BFE; Mon, 13 Feb 2023 07:42:50 +0100 (CET)
Date: Mon, 13 Feb 2023 07:42:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>
Subject: Re: max_hw_sectors error caused by recent NVMe driver commit
Message-ID: <20230213064250.GA14558@lst.de>
References: <BYAPR21MB1688B4BBFCCCD01C016A62D4D7DF9@BYAPR21MB1688.namprd21.prod.outlook.com> <20230213055945.GA13648@lst.de> <BYAPR21MB1688F70E49AAD658D86C439DD7DD9@BYAPR21MB1688.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR21MB1688F70E49AAD658D86C439DD7DD9@BYAPR21MB1688.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Feb 13, 2023 at 06:41:12AM +0000, Michael Kelley (LINUX) wrote:
> Any reason to use dev->dev instead of &pdev->dev?  They should be
> the same, but with everything else in this function using &pdev->dev,
> the lack of consistency suggests there might be a reason.

No good reason - the code started with copy and paste from the previous
location and I can fix this up.
