Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832B6256A
	for <asahi@lists.linux.dev>; Sun,  8 Jan 2023 18:25:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id D275568AA6; Sun,  8 Jan 2023 19:15:32 +0100 (CET)
Date: Sun, 8 Jan 2023 19:15:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Uday Shankar <ushankar@purestorage.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-apple: Add NVME_QUIRK_IDENTIFY_CNS quirk to fix
 regression
Message-ID: <20230108181532.GB25141@lst.de>
References: <20230104092148.15578-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104092148.15578-1-marcan@marcan.st>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

I've applied both patches to nvme-6.2.
