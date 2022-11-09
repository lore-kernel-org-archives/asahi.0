Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A0220FD
	for <asahi@lists.linux.dev>; Wed,  9 Nov 2022 06:27:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6BC9C68AFE; Wed,  9 Nov 2022 07:26:57 +0100 (CET)
Date: Wed, 9 Nov 2022 07:26:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH 01/12] nvme-pci: don't call nvme_init_ctrl_finish from
 nvme_passthru_end
Message-ID: <20221109062657.GD10528@lst.de>
References: <20221108150252.2123727-1-hch@lst.de> <20221108150252.2123727-2-hch@lst.de> <6f12b92c-a117-9c27-cd67-8c9fd9571a06@grimberg.me>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f12b92c-a117-9c27-cd67-8c9fd9571a06@grimberg.me>
User-Agent: Mutt/1.5.17 (2007-11-01)

[note to self: the subject should say nvme instead of nvme-pci]

On Wed, Nov 09, 2022 at 04:55:47AM +0200, Sagi Grimberg wrote:
>> nvme_passthrough_end can race with a reset, so we should not call
>> nvme_init_ctrl_finish from here.  Instead just log that the controller
>> capabilities might have changed.
>
> Can you explain here what is the problem caused by calling this from
> here?

I'll add it to the next version:

 - stores to the cels xarray can race
 - the new opal initialization can race

and in general it just updates random controller fields without
a reset, which I'm worried about hitting completely untested code.
