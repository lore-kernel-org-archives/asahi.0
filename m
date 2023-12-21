Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9770E1DDE3
	for <asahi@lists.linux.dev>; Thu, 21 Dec 2023 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 74E8868B05; Thu, 21 Dec 2023 13:40:35 +0100 (CET)
Date: Thu, 21 Dec 2023 13:40:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, marcan@marcan.st, sven@svenpeter.dev,
	kbusch@kernel.org, axboe@kernel.dk, james.smart@broadcom.com,
	alyssa@rosenzweig.io, asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org, kch@nvidia.com
Subject: Re: [PATCH] nvme: don't set a virt_boundary unless needed
Message-ID: <20231221124034.GA21682@lst.de>
References: <20231221084853.1175482-1-hch@lst.de> <155ec506-ede8-42c7-95f7-e8be32800a8d@grimberg.me> <20231221121746.GA17956@lst.de> <b4cee1fc-f115-40d6-9a16-3cb00691b98c@grimberg.me>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4cee1fc-f115-40d6-9a16-3cb00691b98c@grimberg.me>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Dec 21, 2023 at 02:32:35PM +0200, Sagi Grimberg wrote:
> Exactly because its odd. Unless there is any benefit of using sgls in
> admin commands lets not flag it per transport.

The other transports always and unconditionally use SGLs anyway.  With
the virt boundary we're just adding extra checks to fail certain
passthrough admin commands (the kernel will never generate those cases).
