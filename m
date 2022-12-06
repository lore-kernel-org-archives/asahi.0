Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DC02F2E
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 11:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DE5C433D6;
	Tue,  6 Dec 2022 11:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670325984;
	bh=ThiRG9D7/T+sPwclXbmTjLWDDIYuJgAHG88s/1SByyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mrm54OHZAfiXT4gYA7JgTiLkEN21qlRXe8jOQujTtjyLkpEMEBnxDu3Vs4ISAzKQr
	 NS9LwoRgi16H8MJGLoswvcBN/izRtSdXnr7VWYMllPns4sunWNVeWUWzp/tbLfEpWT
	 EB2XdAxQ76RWCYcAihQzv/z5/JRXH0nMqqmIFl7laMYlF3pnLMhJMCl9IyjLBPdMpM
	 YxvgGT1zpouptRwq1+l9mljKnst+zF4wixh/waNVVdsfOqhYTtBgN39MyFjL7NLLU6
	 3bM53zVBHWsPe4oYG6QET6HINSHh0oQBfi+F1dgHHeknhLXEbjT3crjZLaC8r2+MBg
	 BCzjWqiwtFwaQ==
Date: Tue, 6 Dec 2022 11:26:19 +0000
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 8/9] nvme-pci: return early on ctrl state mismatch in
 nvme_reset_work
Message-ID: <Y48m2+Mn1W6E4Xs9@kbusch-mbp>
References: <20221129132208.4337-1-hch@lst.de>
 <20221129132208.4337-9-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129132208.4337-9-hch@lst.de>

On Tue, Nov 29, 2022 at 02:22:07PM +0100, Christoph Hellwig wrote:
> When nvme_reset_work is called not in the resetting state something went
> horribly wrong and we should not try to touch the controller registers,
> so just leave the controller alone.

Yeah, the only way something like that should happen is if a reset and
remove happen near the same time. We don't want the reset work to
disable the controller because the remove is already doing that.

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>
