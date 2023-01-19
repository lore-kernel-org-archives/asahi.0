Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BC02C9C
	for <asahi@lists.linux.dev>; Thu, 19 Jan 2023 08:08:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A4F0967373; Thu, 19 Jan 2023 09:08:39 +0100 (CET)
Date: Thu, 19 Jan 2023 09:08:39 +0100
From: Christoph Hellwig <hch@lst.de>
To: Hector Martin marcan <marcan@marcan.st>
Cc: Christoph Hellwig <hch@lst.de>, Janne Grunau <j@jannau.net>,
	Sven Peter <sven@svenpeter.dev>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Eric Curtin <ecurtin@redhat.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] nvme-apple: Reset controller during shutdown
Message-ID: <20230119080839.GA24679@lst.de>
References: <20230114-apple-nvme-suspend-fixes-v6.2-v2-0-9157bf633dba@jannau.net> <20230114-apple-nvme-suspend-fixes-v6.2-v2-1-9157bf633dba@jannau.net> <20230118052450.GA24742@lst.de> <20230119061452.GA17695@lst.de> <60A924B7-9F29-4AF1-9DF8-EA90DBA48B3E@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60A924B7-9F29-4AF1-9DF8-EA90DBA48B3E@marcan.st>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks, this looks good.  Updated commit here:

http://git.infradead.org/nvme.git/commitdiff/c06ba7b892a50b48522ad441a40053f483dfee9e
