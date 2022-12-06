Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038096AB3
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 13:38:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6781A68B05; Tue,  6 Dec 2022 14:38:33 +0100 (CET)
Date: Tue, 6 Dec 2022 14:38:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 8/9] nvme-pci: return early on ctrl state mismatch in
 nvme_reset_work
Message-ID: <20221206133833.GB25727@lst.de>
References: <20221129132208.4337-1-hch@lst.de> <20221129132208.4337-9-hch@lst.de> <Y48m2+Mn1W6E4Xs9@kbusch-mbp>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y48m2+Mn1W6E4Xs9@kbusch-mbp>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Dec 06, 2022 at 11:26:19AM +0000, Keith Busch wrote:
> Yeah, the only way something like that should happen is if a reset and
> remove happen near the same time. We don't want the reset work to
> disable the controller because the remove is already doing that.

Thanks, I've stole some of this for a better commit log.
