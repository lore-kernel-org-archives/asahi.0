Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2BA28ED
	for <asahi@lists.linux.dev>; Tue, 15 Nov 2022 09:57:36 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id ED3C367373; Tue, 15 Nov 2022 10:57:26 +0100 (CET)
Date: Tue, 15 Nov 2022 10:57:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>, asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: Re: nvme-pci: split the probe and reset handlers v2
Message-ID: <20221115095726.GA26021@lst.de>
References: <20221113161138.883195-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113161138.883195-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

I've pulled this into nvme-6.2 now.
