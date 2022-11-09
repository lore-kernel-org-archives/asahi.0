Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F036BEC0E
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 17:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D39C433C1;
	Wed,  9 Nov 2022 17:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668013967;
	bh=MrpO/w+My34bt5uxrUzjtjUh4+tEZjmXSqMBZgNaA5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huLsesn20HvleBPv/W6RmhDBOYU9scfsOY9vnXWilSRET9hZMlcF/3Jch68u+V1O6
	 MEvo5AzS8nZZexaM7WKmYEmmuJ4TD9CVBGaPZ0Z5SIL7bgzfm4s0QvsMmclVwcJG52
	 kwSWuSZVvGd4lJnpPwcl302qBM7n1yD9aJt7w0YXgB0MvN2lu73PgZpwFLY2CR9qA/
	 68gD9pZPZ0OkxMPi2hh1f99hnxeSonHTOSH5/avRk1ss3Hy/EoDRRQflsEzyIrsQ76
	 eMecpDhlbOiIwDb1sALCQuaIeW9IbcSGL6QFv0Mze1AdPJ1hUAAsX95KFKi7LFhqLy
	 vawW7Ey9ITtTw==
Date: Wed, 9 Nov 2022 10:12:44 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: RFC: nvme-pci: split the probe and reset handlers
Message-ID: <Y2vfjFc0UggRqjcp@kbusch-mbp.dhcp.thefacebook.com>
References: <20221108150252.2123727-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108150252.2123727-1-hch@lst.de>

This was easier to review than I initially thought. This series looks
great! I just had the one comment on patch 12, but I think it's probably
fine as-is.

Reviewed-by: Keith Busch <kbusch@kernel.org>
