Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1564CEBEE
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 15:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E61C433D6;
	Wed,  9 Nov 2022 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668009385;
	bh=RwsqoTrGIY7Tbo1kKMzZTENYWfctEw96MWDcSqkrqp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tt9qOPnv0yhHWgfeZjeB6kHUPCbU1LzCrlKCugfOk7kHj/y4kndDjaWPe+Fci/Rug
	 L8lShhHKYVUHkCYRRnfrCNu4pZgsvQ46EMrEAvXpxskUda02gSvQ9RlkuHLPUFlTHV
	 n4eGiMDRwRtKaAAbZFNqXNPVfsmmYvp71Fxh/EbdjREic7FgW7hmvqT06IRSB9rqnx
	 XDn2dGzstGdRA+idym+5Ec4rFswQTzgqHzhjnT8bhVJMf5X2mRjVT0oKbLqyL+myI1
	 pMWAMwSaHiC8lL+Vk6zy810gEl7zFAZ6Kq3gg4udvl1wmrax00fVeKnszB7Wn+rPB5
	 DbRaC8RDYu0Dg==
Date: Wed, 9 Nov 2022 08:56:22 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 11/12] nvme-pci: split the initial probe from the rest
 path
Message-ID: <Y2vNpi050Yoe4EZ1@kbusch-mbp.dhcp.thefacebook.com>
References: <20221108150252.2123727-1-hch@lst.de>
 <20221108150252.2123727-12-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108150252.2123727-12-hch@lst.de>

On Tue, Nov 08, 2022 at 04:02:51PM +0100, Christoph Hellwig wrote:
> To make sure the system isn't single threaded on enabling nvme
> controllers, set the PROBE_PREFER_ASYNCHRONOUS flag in the device_driver
> structure so that the driver core probes in parallel.

Please ignore my previous message; I replied before getting to this
part. :)
