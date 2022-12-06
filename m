Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569852F2E
	for <asahi@lists.linux.dev>; Tue,  6 Dec 2022 11:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E86C433D6;
	Tue,  6 Dec 2022 11:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670326016;
	bh=+Qn4ZIw3vmeAXl5DRZnA9pqzXg+0dYTozJ3Y4O2Sheo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OoQlMj57KH9TeowcnB5VDD7D+zA8CQ2aSbvZ92TFtbxNWgGMh3YUGv4Ats1cCgoEm
	 Sqq3ED/pBOBel0kwLtcYHaOM6zVozeAFksidU1Nx2VctVCqydF3sKcA6pxtbCLWDWe
	 FI7hQlGGFdZxhFlgibqq6nl6ykqD/spTodAvtNOwEGTcNs8Xze0QLf2/k5IrU/xWKF
	 9bEk39k+bTrkR3+QYREQBtFNzVL7ifwiHrJZaEXxzKye75cTbgq1iWT2P1vZUsHXU+
	 5mHW8HaZOzPKrGUE7XnXJf5JWq/rQGuPd2uxBhTfjG5jgZfauZMP/aE2m024yua7go
	 lGs9tr7qVFeeA==
Date: Tue, 6 Dec 2022 11:26:51 +0000
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev, linux-nvme@lists.infradead.org
Subject: Re: remove path cleanups
Message-ID: <Y48m+40hPSL+9OmA@kbusch-mbp>
References: <20221129132208.4337-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129132208.4337-1-hch@lst.de>

On Tue, Nov 29, 2022 at 02:21:59PM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> this series cleans up the remove path in the PCIe driver and a bit in the
> common code after fixing a harmless bug in the Apple driver.

Series looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>
