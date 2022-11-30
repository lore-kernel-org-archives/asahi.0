Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA763C0
	for <asahi@lists.linux.dev>; Wed, 30 Nov 2022 16:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FEF2C433C1;
	Wed, 30 Nov 2022 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669824921;
	bh=8j57xCWkiHz9AC1wLCSjaYDNWLqAXRsF/C2d9lSaemc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZEWr5/yo4jN6wHYjmF16By7dZPewlB0j7Z+jwmUHQV3RKHjE6fGC7wr2lupDJYbZ
	 J3KeEWRlUObAEK8/Y1UZ3dBGrT1zXX1JU7+rV28LjKMZscRUN+dCs199OXxCHnKNie
	 kNeCZdADWNTtPFBIKz3EVk6RWhvvI1TMPnXgetleWUcG17sMuX3cDzqhUzEK8lNNwF
	 KEIEw0m7nFTaGv7Q5cERgP7ZLsFYeU3Ru21w6goe13YJ2AqUtrGGfkKrYY0qoGLBWH
	 cEiuIy+ZhfaiD61svIkXAyO3LCSWDmdK/44cG8o9BOPq2LPhCjKtbyrtNycoLIc6zT
	 f4plVvAETx/sw==
Date: Wed, 30 Nov 2022 09:15:18 -0700
From: Keith Busch <kbusch@kernel.org>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: Christoph Hellwig <hch@lst.de>, Pankaj Raghav <pankydev8@gmail.com>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 2/9] nvme: use nvme_wait_ready in nvme_shutdown_ctrl
Message-ID: <Y4eBlonMD0198GXr@kbusch-mbp.dhcp.thefacebook.com>
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-3-hch@lst.de>
 <20221129155718.poqztp4zudt47zmq@quentin>
 <CGME20221130135758eucas1p2aaf96c2c7bee29c0f44e5714b0b159bc@eucas1p2.samsung.com>
 <20221130135749.GA4786@lst.de>
 <fc5d0a74-e4e9-38c7-3a93-ff1eb71e0054@samsung.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc5d0a74-e4e9-38c7-3a93-ff1eb71e0054@samsung.com>

On Wed, Nov 30, 2022 at 03:27:29PM +0100, Pankaj Raghav wrote:
> On 2022-11-30 14:57, Christoph Hellwig wrote:
> > From 2f862232c4428d57dcfdc3b332866a9b2743711d Mon Sep 17 00:00:00 2001
> > From: Christoph Hellwig <hch@lst.de>
> > Date: Wed, 16 Nov 2022 08:54:26 +0100
> > Subject: nvme: use nvme_wait_ready in nvme_shutdown_ctrl
> > 
> > Refactor the code to wait for CSTS state changes so that it can be reused
> > by nvme_shutdown_ctrl.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> One minor nit: I also notice that nvme_wait_ready busy loop sleeps for
> 1~2ms, while the existing shutdown code busy loop sleeps for 100ms. Though,
> I don't think it is an issue.
> 
> Apart from that, the new version looks good to me. Feel free to add to it:

That is indeed a difference, but it's probably a good one. It should
tighten up the time to shutdown more closely to the hardware's
completion, and there's probably some environment where the 10's of
millisecs saved might be meaningful.
